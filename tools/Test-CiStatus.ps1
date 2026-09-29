[CmdletBinding()]
param([Parameter(Mandatory)][string]$NeedsJson)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$needs = ConvertFrom-Json -InputObject $NeedsJson -AsHashtable
$heavyJobs = @('build', 'deterministic-generation', 'unit-runtime', 'regression', 'compatibility', 'coverage', 'release-preflight', 'package')
if (-not $needs.ContainsKey('changes') -or $needs.changes.result -cne 'success') {
    throw 'CI status: change classification failed, was cancelled, or was skipped.'
}
$classification = [string]$needs.changes.outputs.docs_only
if ($classification -cnotin @('true', 'false')) { throw 'CI status: change classification output is missing or invalid.' }
$expected = if ($classification -ceq 'true') { 'skipped' } else { 'success' }
foreach ($job in $heavyJobs) {
    if (-not $needs.ContainsKey($job) -or $needs[$job].result -cne $expected) {
        throw "CI status: $job returned '$($needs[$job].result)'; expected '$expected'."
    }
}
if ($classification -ceq 'true') {
    Write-Output 'CI status: documentation-only change; all eight heavy jobs intentionally skipped.'
} else {
    Write-Output 'CI status: all eight heavy jobs succeeded.'
}
