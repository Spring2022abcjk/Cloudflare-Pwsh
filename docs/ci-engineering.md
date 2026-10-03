# CI Engineering Guide

## Scope and sources of truth

This guide describes the CI implementation and how to review its results.
`.github/workflows/p34-ci.yml` is the executable job graph;
[`ci-trigger-policy.md`](./ci-trigger-policy.md) is the acceptance contract for
documentation-only routing. The historical P3.4 package evidence is in
[`P3.4-ci-packaging-summary.md`](./P3.4-ci-packaging-summary.md). A local gate,
a GitHub Actions run, a candidate package, and release approval are distinct
forms of evidence.

The workflow handles `push`, `pull_request`, and `workflow_dispatch`. It uses
PowerShell for run steps, repository `contents: read` permission, pinned
external Actions, and checkout with credential persistence disabled. The
concurrency group is scoped by workflow and ref; a newer run can cancel an
earlier run for that group. Neither ordinary CI nor the separate manual schema
workflow publishes a package or calls a Cloudflare account.

## Change routing

`changes` runs on `ubuntu-24.04`, checks out full history, and invokes
`tools/Get-CiChangeClassification.ps1`. Its only routing output is
`docs_only=true|false`. The classifier reads NUL-delimited Git path output
with rename detection disabled, so a rename out of an approved location
exposes both sides. Empty or unresolved diffs fail rather than producing a
documentation-only result.

| Event | Comparison | Result when comparison is not trustworthy |
| --- | --- | --- |
| Existing branch push | Event `before` to `github.sha`, with ancestry checked. | `changes` fails; `CI status` fails. |
| New branch's first push | When `before` is zero and the push event says `created`, the unique merge base of the checked-out head and `origin/<default branch>` to the head. | Missing default ref, no unique merge base, inconsistent event, or empty diff fails. |
| Pull request | Event base SHA to the checked-out merge commit, whose first parent must be that base. | `changes` fails. The PR comparison is authoritative for its actual target branch. |
| Manual dispatch | No diff is needed. | `docs_only=false`; all eight heavy jobs run. |

Only a change entirely within `docs/**` or Markdown paths outside protected
roots can be documentation-only. `docs/**` includes non-Markdown documentation
files. `.github/`, `tools/`, `tests/`, `fixtures/`, `artifacts/`, `src/`,
`module/`, `ref/`, `release/`, `packaging/`, `schema/`, and `build/` are
protected even if a changed file ends in `.md`; `LICENSE` and `LICENSE.md`
also require full CI. Any mixed change runs the full graph. The new-branch
comparison includes earlier commits since the fork point, even if the latest
commit only edits documentation.

## Job graph and result contract

| Job | Dependencies | Purpose |
| --- | --- | --- |
| `changes` | None | Classify changed paths. |
| `build` | `changes` | Bootstrap pinned schema, locked restore, Release build. |
| `deterministic-generation` | `changes`, `build` | Run isolated deterministic generation gates. |
| `unit-runtime` | `changes`, `build` | Run .NET assertion executable and module host smoke. |
| `regression` | `changes`, `build` | Run P1–P2.4 regression against the previous schema fixture. |
| `compatibility` | `changes`, `regression` | Produce and gate compatibility report. |
| `coverage` | `changes`, `build` | Repeat discovery, check coverage, and gate the canonical report. |
| `release-preflight` | `changes`, `build` | Run static P4.2 security and release metadata checks. |
| `package` | `changes` and the six upstream validation jobs | Download reports, build and verify a candidate, smoke the staged module. |
| `ci-status` (`CI status`) | All nine other jobs | Evaluate the final required-check result with `always()`. |

The eight heavy jobs run only when `changes` succeeds with
`docs_only=false`. `tools/Test-CiStatus.ps1` requires all eight results to be
`skipped` for `docs_only=true`, or all eight to be `success` for
`docs_only=false`. A failed, cancelled, missing, or unexpectedly skipped job
cannot pass the stable check. A failed or missing classification also fails
the check. Workflow cancellation may prevent the status job itself from
finishing; it is not a successful required check.

The Windows jobs share `.github/actions/p34-windows-baseline`: .NET SDK
`10.0.400`, PowerShell 7.6+ (pinned MSI hash if fallback installation is
needed), and `tools/Test-P34Host.ps1`. Each restores the pinned schema through
`tools/Initialize-P34Schema.ps1`; .NET restore uses `--locked-mode`.

`compatibility` uploads `p34-compatibility-reports`; `coverage` uploads
`p34-coverage-reports`. `package` downloads those named artifacts, verifies
their gate receipts and source provenance, runs `tests/P34PackageSmoke.ps1`
against the staged module, then uploads `cloudflare-powershell-p34-candidate`
for inspection. Uploads have 14-day retention and fail if files are missing.
The candidate is not a publish or release action.

`.github/workflows/p34-schema-update.yml` is a separate manual workflow. It
validates the pinned schema update chain and uploads
`p34-schema-update-validation`; it is not routed through `changes` or
`CI status`.

## Verification and operations

Run these local checks from the repository root after a routing or gate edit:

```powershell
pwsh -NoLogo -NoProfile -File ./tests/CiDocsOnlyRouting.Tests.ps1
pwsh -NoLogo -NoProfile -File ./tests/P34CiGates.Tests.ps1
pwsh -NoLogo -NoProfile -File ./tests/P42Security.Tests.ps1
git diff --check
```

The routing test builds temporary Git histories for ordinary pushes, first
branch pushes, PR merge commits, manual dispatch, protected paths, mixed
history, invalid diffs, and status-job outcomes. `P34CiGates.Tests.ps1`
exercises real local package and negative gate cases; its expected rejection
messages are not test failures when the script exits successfully. Confirm
CRLF bytes for edited text files under the repository `.gitattributes` rule.

For a remote failure, first identify the event and exact head SHA. Read
`Classify changes` before interpreting skipped heavy jobs. If classification
passed with `docs_only=false`, inspect the first failed heavy dependency and
the final `CI status`; if `docs_only=true`, all eight skips must be intentional.
Do not use a passing local gate or an older run as proof for a newer head.
Before requiring checks on `main`, prove both documentation-only and full-CI
branch/PR cases, manual dispatch, and fail-closed cases against this workflow
revision. Require the stable `CI status` context, not each conditional heavy
job. Avoid workflow-level path filters, which can leave a required check
pending.

## Accepted evidence at 2026-10-04 (Asia/Taipei)

CI-01 is Complete for main `776d26111eacea2708152a084d4124e3bc8f82da`.
The implementation and first-push merge-base refinement merged through PRs
#8 and #9. Its main mixed push [37048018290](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37048018290)
remains current-main evidence; acceptance additionally used thirteen fresh,
isolated exact-SHA runs rather than older PR successes.

The [acceptance ledger](./ci-01-acceptance.md) maps docs/** and root Markdown
first pushes/PRs, mixed and workflow path pushes/PRs, manual forcing, and
classifier-failure/unexpected-skip rejection to their exact runs. Nine normal
runs succeeded; four isolated fault runs failed as expected. All five full-CI
runs passed eight heavy jobs and preserved the three report/candidate artifacts.
No implementation repair or artifact-flow change was needed.

[Exact remote run evidence](./ci-01-remote-runs.md) and its
[JSON counterpart](./ci-01-remote-evidence.json) distinguish API head SHA,
actual PR merge checkout, classifier input, event range, all ten job results,
and run/job links. The invalid-head fault was delivered as `0` by YAML and
failed before a comparison; its actual checkout is recorded separately.

The [applied protection payload](./ci-01-main-protection.json) requires only
GitHub Actions CI status (app ID 15368), with strict checks and administrator
enforcement. [Readback and protected PR evidence](./ci-01-protection-evidence.json)
confirmed four normal ready PRs CLEAN and two fault ready PRs BLOCKED. Classic
branch protection is active; repository rulesets and effective ruleset rules
remain empty. Empty ruleset APIs do not mean main is unprotected.

All six test PRs were closed unmerged and their remote probe refs deleted.
Local probe commits/worktrees and external logs remain for audit. The acceptance
documentation is committed locally on codex-petal/ci-acceptance and was not
pushed under the probe/configuration authorization. Future executable CI edits
need new exact-SHA evidence. Remote cancellation and merge queues were not
accepted by this matrix; Gallery and real-account release gates are separate.
