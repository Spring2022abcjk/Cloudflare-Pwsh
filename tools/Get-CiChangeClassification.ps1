[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$RepositoryRoot,
    [Parameter(Mandatory)][string]$EventName,
    [string]$BaseSha,
    [string]$HeadSha,
    [string]$DefaultBranchRef,
    [ValidateSet('true', 'false')][string]$PushCreated = 'false',
    [string]$OutputPath
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-GitText {
    param([string[]]$Arguments)
    $result = @(& git -C $RepositoryRoot @Arguments 2>&1)
    if ($LASTEXITCODE -ne 0) { throw "Unable to resolve CI diff: git $($Arguments -join ' ') failed." }
    return ($result -join "`n").Trim()
}
function Get-GitChangedPaths {
    param([string]$Base, [string]$Head)
    $start = [Diagnostics.ProcessStartInfo]::new()
    $start.FileName = 'git'
    $start.UseShellExecute = $false
    $start.RedirectStandardOutput = $true
    $start.RedirectStandardError = $true
    foreach ($argument in @('-C', $RepositoryRoot, 'diff', '--no-ext-diff', '--no-textconv', '--no-renames', '--name-only', '-z', $Base, $Head, '--')) {
        [void]$start.ArgumentList.Add($argument)
    }
    $process = [Diagnostics.Process]::Start($start)
    try {
        $buffer = [IO.MemoryStream]::new()
        $process.StandardOutput.BaseStream.CopyTo($buffer)
        $errorText = $process.StandardError.ReadToEnd()
        $process.WaitForExit()
        if ($process.ExitCode -ne 0) { throw "Unable to resolve CI diff: git diff failed ($errorText)." }
        $bytes = $buffer.ToArray()
        if ($bytes.Length -eq 0 -or $bytes[-1] -ne 0) { throw 'Unable to resolve CI diff: changed paths are empty or malformed.' }
        $decoded = [Text.UTF8Encoding]::new($false, $true).GetString($bytes)
        $paths = @($decoded.TrimEnd([char]0).Split([char]0))
        if ($paths.Count -eq 0 -or @($paths | Where-Object { [string]::IsNullOrWhiteSpace($_) }).Count -ne 0) {
            throw 'Unable to resolve CI diff: changed paths are empty or malformed.'
        }
        return $paths
    } finally {
        $process.Dispose()
    }
}
function Test-ApprovedDocumentationPath {
    param([string]$Path)
    if ($Path.Contains('\') -or $Path.StartsWith('/') -or $Path -match '(^|/)\.\.?(/|$)') { return $false }
    if ($Path.StartsWith('docs/', [StringComparison]::Ordinal)) { return $true }
    if (-not $Path.EndsWith('.md', [StringComparison]::Ordinal)) { return $false }
    $protectedRoots = @('.github', 'tools', 'tests', 'fixtures', 'artifacts', 'src', 'module', 'ref', 'release', 'packaging', 'schema', 'build')
    $first = $Path.Split('/')[0]
    return $Path -cne 'LICENSE.md' -and -not ($protectedRoots -ccontains $first)
}

if ($EventName -ceq 'workflow_dispatch') {
    $docsOnly = $false
} else {
    if ($EventName -cnotin @('push', 'pull_request')) { throw "Unsupported CI event '$EventName'." }
    if ($HeadSha -cnotmatch '^[0-9a-f]{40}$' -or $HeadSha -ceq ('0' * 40)) {
        throw 'Unable to resolve CI diff: missing or invalid commit SHA.'
    }
    [void](Invoke-GitText @('cat-file', '-e', "$HeadSha^{commit}"))
    $diffBase = $BaseSha
    if ($EventName -ceq 'push' -and $BaseSha -ceq ('0' * 40)) {
        if ($PushCreated -ne 'true' -or [string]::IsNullOrWhiteSpace($DefaultBranchRef)) {
            throw 'Unable to resolve CI diff: zero before SHA without a new-branch baseline.'
        }
        $defaultTip = Invoke-GitText @('show-ref', '--verify', '--hash', $DefaultBranchRef)
        if ($defaultTip -cnotmatch '^[0-9a-f]{40}$') { throw 'Unable to resolve CI diff: invalid default-branch commit.' }
        $mergeBases = @((Invoke-GitText @('merge-base', '--all', $defaultTip, $HeadSha)).Split("`n") | Where-Object { $_ })
        if ($mergeBases.Count -ne 1 -or $mergeBases[0] -cnotmatch '^[0-9a-f]{40}$') {
            throw 'Unable to resolve CI diff: no unique default-branch merge base.'
        }
        $diffBase = $mergeBases[0]
    } else {
        if ($EventName -ceq 'push' -and $PushCreated -eq 'true') { throw 'Unable to resolve CI diff: new-branch event has a nonzero before SHA.' }
        if ($BaseSha -cnotmatch '^[0-9a-f]{40}$' -or $BaseSha -ceq ('0' * 40)) {
            throw 'Unable to resolve CI diff: missing or invalid commit SHA.'
        }
        [void](Invoke-GitText @('cat-file', '-e', "$BaseSha^{commit}"))
    }
    if ($EventName -ceq 'pull_request') {
        $parents = (Invoke-GitText @('rev-list', '--parents', '-n', '1', $HeadSha)).Split(' ')
        if ($parents.Count -lt 3 -or $parents[1] -cne $BaseSha) {
            throw 'Unable to resolve CI diff: pull request checkout is not the expected merge commit.'
        }
    } elseif ($BaseSha -cne ('0' * 40)) {
        [void](Invoke-GitText @('merge-base', '--is-ancestor', $BaseSha, $HeadSha))
    }
    $paths = @(Get-GitChangedPaths -Base $diffBase -Head $HeadSha)
    $docsOnly = @($paths | Where-Object { -not (Test-ApprovedDocumentationPath $_) }).Count -eq 0
}

$value = if ($docsOnly) { 'true' } else { 'false' }
if (-not [string]::IsNullOrWhiteSpace($OutputPath)) {
    [IO.File]::AppendAllText($OutputPath, "docs_only=$value`n", [Text.UTF8Encoding]::new($false))
}
Write-Output "docs_only=$value"
