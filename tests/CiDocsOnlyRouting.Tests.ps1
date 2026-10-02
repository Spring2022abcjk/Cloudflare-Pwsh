[CmdletBinding()]
param([string]$ProjectRoot = (Split-Path -Parent $PSScriptRoot))

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$classifier = Join-Path $ProjectRoot 'tools/Get-CiChangeClassification.ps1'
$status = Join-Path $ProjectRoot 'tools/Test-CiStatus.ps1'
$temporary = Join-Path ([IO.Path]::GetTempPath()) ('ci-docs-routing-' + [guid]::NewGuid().ToString('N'))
$count = 0

function Invoke-GitChecked {
    param([string[]]$Arguments)
    $output = @(& git -C $temporary @Arguments 2>&1)
    if ($LASTEXITCODE -ne 0) { throw "git $($Arguments -join ' ') failed: $($output -join ' ')" }
    return ($output -join "`n").Trim()
}
function Add-Commit {
    param([hashtable]$Files)
    foreach ($path in $Files.Keys) {
        $full = Join-Path $temporary $path
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $full) | Out-Null
        [IO.File]::WriteAllText($full, [string]$Files[$path], [Text.UTF8Encoding]::new($false))
    }
    Invoke-GitChecked @('add', '-A') | Out-Null
    Invoke-GitChecked @('commit', '-m', 'fixture') | Out-Null
    return Invoke-GitChecked @('rev-parse', 'HEAD')
}
function Assert-Classification {
    param([string]$Label, [string]$EventName, [string]$BaseSha, [string]$HeadSha, [bool]$DocsOnly, [bool]$ShouldFail = $false, [string]$DefaultBranchRef = '', [string]$PushCreated = 'false')
    $outputFile = Join-Path $temporary '.git/classification-output.txt'
    [IO.File]::WriteAllText($outputFile, '', [Text.UTF8Encoding]::new($false))
    $arguments = @('-RepositoryRoot', $temporary, '-EventName', $EventName, '-BaseSha', $BaseSha, '-HeadSha', $HeadSha, '-DefaultBranchRef', $DefaultBranchRef, '-PushCreated', $PushCreated, '-OutputPath', $outputFile)
    $output = @(& pwsh -NoLogo -NoProfile -File $classifier @arguments 2>&1)
    if ($ShouldFail) {
        if ($LASTEXITCODE -eq 0) { throw "$Label unexpectedly succeeded." }
        if ([IO.File]::ReadAllText($outputFile) -cne '') { throw "$Label emitted a success output after failing." }
    } else {
        if ($LASTEXITCODE -ne 0) { throw "$Label failed: $($output -join ' ')" }
        $expected = if ($DocsOnly) { 'docs_only=true' } else { 'docs_only=false' }
        $actual = (Get-Content -Raw $outputFile).Trim()
        if ($actual -cne $expected) { throw "$Label output '$actual' did not equal $expected. Detail: $($output -join ' ')" }
    }
    $script:count++
    Write-Output "PASS $Label"
}
function Assert-Status {
    param([string]$Label, [string]$ChangesResult, [string]$DocsOnly, [string]$HeavyResult, [bool]$ShouldPass)
    $names = @('build', 'deterministic-generation', 'unit-runtime', 'regression', 'compatibility', 'coverage', 'release-preflight', 'package')
    $needs = @{ changes = @{ result = $ChangesResult; outputs = @{ docs_only = $DocsOnly } } }
    foreach ($name in $names) { $needs[$name] = @{ result = $HeavyResult } }
    $json = $needs | ConvertTo-Json -Depth 10 -Compress
    $output = @(& pwsh -NoLogo -NoProfile -File $status -NeedsJson $json 2>&1)
    if (($LASTEXITCODE -eq 0) -ne $ShouldPass) { throw "$Label had unexpected status: $($output -join ' ')" }
    $script:count++
    Write-Output "PASS $Label"
}

try {
    New-Item -ItemType Directory -Force -Path $temporary | Out-Null
    Invoke-GitChecked @('init', '-q') | Out-Null
    Invoke-GitChecked @('config', 'user.name', 'CI Fixture') | Out-Null
    Invoke-GitChecked @('config', 'user.email', 'ci@example.invalid') | Out-Null
    $base = Add-Commit @{ 'README.md' = 'first' }
    $docs = Add-Commit @{ 'docs/nested/policy.txt' = 'docs' }
    Assert-Classification 'docs subtree only' push $base $docs $true
    $rootMarkdown = Add-Commit @{ 'README.md' = 'second' }
    Assert-Classification 'root Markdown only' push $docs $rootMarkdown $true
    $nestedMarkdown = Add-Commit @{ 'guides/deep/usage.md' = 'guide' }
    Assert-Classification 'nested Markdown only' push $rootMarkdown $nestedMarkdown $true
    $mixed = Add-Commit @{ 'docs/nested/policy.txt' = 'changed'; 'src/main.cs' = 'code' }
    Assert-Classification 'mixed documentation and source' push $nestedMarkdown $mixed $false
    $workflow = Add-Commit @{ '.github/workflows/p34-ci.yml' = 'workflow' }
    Assert-Classification 'workflow change' push $mixed $workflow $false
    $actionMarkdown = Add-Commit @{ '.github/actions/example/README.md' = 'action docs' }
    Assert-Classification 'action Markdown change' push $workflow $actionMarkdown $false
    $license = Add-Commit @{ 'LICENSE' = 'license' }
    Assert-Classification 'license change' push $actionMarkdown $license $false
    $licenseMarkdown = Add-Commit @{ 'LICENSE.md' = 'license docs' }
    Assert-Classification 'license Markdown change' push $license $licenseMarkdown $false
    $renameBase = Add-Commit @{ 'docs/move-me.md' = 'move' }
    Invoke-GitChecked @('mv', 'docs/move-me.md', 'src/move-me.md') | Out-Null
    Invoke-GitChecked @('commit', '-m', 'rename') | Out-Null
    $renameHead = Invoke-GitChecked @('rev-parse', 'HEAD')
    Assert-Classification 'rename out of docs' push $renameBase $renameHead $false
    Assert-Classification 'manual dispatch forces CI' workflow_dispatch '' '' $false
    Assert-Classification 'pull request merge diff' pull_request $renameBase $renameHead $false $true
    Assert-Classification 'missing diff commit' push ('f' * 40) $renameHead $false $true
    Assert-Classification 'zero before without branch creation' push ('0' * 40) $renameHead $false $true
    Assert-Classification 'reversed push diff' push $renameHead $renameBase $false $true
    Assert-Classification 'empty diff' push $renameHead $renameHead $false $true
    Invoke-GitChecked @('switch', '-c', 'ci-feature') | Out-Null
    $featureHead = Add-Commit @{ 'docs/feature.md' = 'feature' }
    Invoke-GitChecked @('switch', '-c', 'ci-base', $renameHead) | Out-Null
    $prBase = Add-Commit @{ 'docs/base.md' = 'base' }
    Invoke-GitChecked @('merge', '--no-ff', '-m', 'merge fixture', $featureHead) | Out-Null
    $prMerge = Invoke-GitChecked @('rev-parse', 'HEAD')
    Assert-Classification 'pull request docs merge diff' pull_request $prBase $prMerge $true
    Invoke-GitChecked @('switch', '-c', 'ci-mixed', $prMerge) | Out-Null
    $mixedFeatureHead = Add-Commit @{ 'docs/mixed.md' = 'docs'; 'src/mixed.cs' = 'code' }
    Invoke-GitChecked @('switch', 'ci-base') | Out-Null
    Invoke-GitChecked @('merge', '--no-ff', '-m', 'mixed merge fixture', $mixedFeatureHead) | Out-Null
    $mixedMerge = Invoke-GitChecked @('rev-parse', 'HEAD')
    Assert-Classification 'pull request mixed merge diff' pull_request $prMerge $mixedMerge $false
    $firstPushBase = $mixedMerge
    $firstPushRef = 'refs/remotes/origin/main'
    Invoke-GitChecked @('update-ref', $firstPushRef, $firstPushBase) | Out-Null
    Invoke-GitChecked @('switch', '-c', 'ci-first-doc', $firstPushBase) | Out-Null
    $firstDocs = Add-Commit @{ 'docs/first-push.md' = 'docs' }
    Assert-Classification 'new branch first push docs only' push ('0' * 40) $firstDocs $true $false $firstPushRef true
    Assert-Classification 'new branch boolean casing' push ('0' * 40) $firstDocs $true $false $firstPushRef True
    Assert-Classification 'new branch missing default ref' push ('0' * 40) $firstDocs $false $true 'refs/heads/missing' true
    Assert-Classification 'new branch empty baseline diff' push ('0' * 40) $firstPushBase $false $true $firstPushRef true
    Assert-Classification 'creation signal with nonzero before' push $firstPushBase $firstDocs $false $true $firstPushRef true
    Invoke-GitChecked @('switch', '-c', 'ci-first-root', $firstPushBase) | Out-Null
    $firstRoot = Add-Commit @{ 'README.md' = 'third' }
    Assert-Classification 'new branch first push root Markdown' push ('0' * 40) $firstRoot $true $false $firstPushRef true
    Invoke-GitChecked @('switch', '-c', 'ci-first-mixed', $firstPushBase) | Out-Null
    $firstMixed = Add-Commit @{ 'docs/first-mixed.md' = 'docs'; 'src/first-mixed.cs' = 'code' }
    Assert-Classification 'new branch first push mixed' push ('0' * 40) $firstMixed $false $false $firstPushRef true
    Invoke-GitChecked @('switch', '-c', 'ci-first-workflow', $firstPushBase) | Out-Null
    $firstWorkflow = Add-Commit @{ '.github/workflows/new.yml' = 'workflow' }
    Assert-Classification 'new branch first push workflow' push ('0' * 40) $firstWorkflow $false $false $firstPushRef true
    Invoke-GitChecked @('switch', '-c', 'ci-first-history', $firstPushBase) | Out-Null
    $null = Add-Commit @{ 'src/earlier.cs' = 'code' }
    $firstHistory = Add-Commit @{ 'docs/latest.md' = 'docs' }
    Assert-Classification 'new branch includes earlier code commit' push ('0' * 40) $firstHistory $false $false $firstPushRef true
    Assert-Status 'intentional docs skip' success true skipped $true
    Assert-Status 'complete heavy CI' success false success $true
    Assert-Status 'classifier failure' failure '' skipped $false
    Assert-Status 'classifier cancellation' cancelled '' skipped $false
    Assert-Status 'missing classifier output' success '' skipped $false
    Assert-Status 'unexpected heavy skip' success false skipped $false
    Assert-Status 'heavy job failure' success false failure $false
    Assert-Status 'heavy job cancellation' success false cancelled $false
    Assert-Status 'docs with unexpected running job' success true success $false
    Write-Output "PASS CI routing assertions: $count"
} finally {
    Remove-Item -LiteralPath $temporary -Recurse -Force -ErrorAction SilentlyContinue
}
