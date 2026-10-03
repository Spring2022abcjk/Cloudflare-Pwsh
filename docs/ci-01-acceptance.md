# CI-01 acceptance ledger — 2026-10-03 to 2026-10-04 (Asia/Taipei)

## Decision and inspected baseline

**Complete for the CI-01 contract at main `776d261`: implementation merged,
13 fresh remote runs verified, and main required-check protection applied and
validated.** This is CI routing acceptance, not release approval.
Read-only inspection at 2026-10-03T15:29Z found local main, fetched origin/main,
and GitHub main at `776d26111eacea2708152a084d4124e3bc8f82da`.
The original worktree was clean; no open PRs existed. PR #8 merged the routing
implementation and PR #9 merged the new-branch baseline refinement.
The acceptance branch is `codex-petal/ci-acceptance`, in the separate
`E:\桌面\edit\cloudflare-pwsh-ci-acceptance` worktree. The user explicitly
authorized both remote probe acceptance and main protection
after reviewing the prepared scope. Both authorized operations are complete.
Acceptance documentation itself remains local; no acceptance-branch push or merge
is included in this authorization.

The current executable blobs are:

| File | Git blob |
| --- | --- |
| `.github/workflows/p34-ci.yml` | `28fae45e6abdd952f24b0c4c14b54cc22d46a27e` |
| `tools/Get-CiChangeClassification.ps1` | `56637e654641b8831e345ee8abeff3e41114483b` |
| `tools/Test-CiStatus.ps1` | `ad49dcb5259924fb41e88fafac4eea600aafafcd` |

## Exact remote evidence

Results below were read from run metadata, the jobs API, and classification logs.
Run API head SHA and PR checkout SHA are different fields; preserve both.
An older successful run is historical evidence only, even if executable blobs match.

| Run | Event / branch | Run head SHA | Actual classifier comparison | Classification / stable status | Acceptance use |
| --- | --- | --- | --- | --- | --- |
| [37048018290](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37048018290), attempt 1 | push / main | `776d26111eacea2708152a084d4124e3bc8f82da` | `f8dec17db6a2f738fe4ab4e2e3dd0e91b3573917` → run head; created=false | success, docs_only=false / success | Current-head mixed docs + tools/tests/workflow push; all eight heavy jobs succeeded. Not a minimal probe or isolated workflow-only case. |
| [37035402785](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37035402785), attempt 1 | first push / codex-petal/ci-new-branch-diff | `828456ab8118a2d6c0dbb6b51674498d87b6f5c2` | before=40 zeroes, created=true; merge base with origin/main → run head (fork baseline `f8dec17db6a2f738fe4ab4e2e3dd0e91b3573917`) | success, docs_only=false / success | Historical mixed first-push evidence; not current main SHA acceptance. |
| [37035512436](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37035512436), attempt 1 | pull_request / PR #9 | `828456ab8118a2d6c0dbb6b51674498d87b6f5c2` | `f8dec17db6a2f738fe4ab4e2e3dd0e91b3573917` → checkout `9e1a2b114dc97e5fe0d526fc3f3ce31b3bb49a11` | success, docs_only=false / success | Historical mixed PR; not current main SHA acceptance. |
| [36559792050](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/36559792050), attempt 1 | push / former CI-01 branch | `7441663892d2ba03f388065e57bcdbb71db8ffc4` | Earlier classifier; first-push zero-before failure documented previously; exact range not re-established here | failure / failure | Historical failure only; cannot satisfy current classifier failure gate. |

| Heavy job ID / check name | 37048018290 | 37035402785 | 37035512436 | 36559792050 |
| --- | --- | --- | --- | --- |
| build / Build | success | success | success | skipped |
| deterministic-generation / Deterministic generation | success | success | success | skipped |
| unit-runtime / Unit and runtime smoke | success | success | success | skipped |
| regression / P1-P2.4 regression | success | success | success | skipped |
| compatibility / Compatibility gate | success | success | success | skipped |
| coverage / Coverage gate | success | success | success | skipped |
| release-preflight / Release and security preflight | success | success | success | skipped |
| package / Package candidate and smoke | success | success | success | skipped |

Older PR #8 run 36559817847 and main run 37028341206 remain historical;
they predate the merged first-push refinement. Paginated workflow inventory found
no further runs since routing was introduced that close the missing matrix.
Raw run/jobs snapshots and local test logs are retained outside the repository at
`E:\桌面\edit\cloudflare-pwsh-ci-acceptance-evidence`.

## Final acceptance matrix

All required scenarios below use fresh probe commits based on current main, not historical successes. Each run is attempt 1. [Exact run evidence](./ci-01-remote-runs.md) records event, API head SHA, actual checkout SHA, comparison, classification output, all eight heavy jobs, CI status, and job links. [Machine-readable run evidence](./ci-01-remote-evidence.json) retains the same fields.

| Scenario | Push evidence | PR evidence | Result |
| --- | --- | --- | --- |
| docs | [37134319713](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134319713) | [PR #10](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/pull/10) / [37134396096](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134396096) | Complete: true, eight intentional skips, stable success. |
| root | [37134458983](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134458983) | [PR #11](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/pull/11) / [37134523958](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134523958) | Complete: true, eight intentional skips, stable success. |
| mixed | [37134890985](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134890985) | [PR #14](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/pull/14) / [37135547259](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37135547259) | Complete: false, eight successes, stable success. |
| workflow | [37136170081](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136170081) | [PR #15](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/pull/15) / [37136801413](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136801413) | Complete: false, eight successes, stable success. |
| classifier-failure | [37134600097](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134600097) | [PR #12](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/pull/12) / [37134685573](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134685573) | Complete: invalid input rejected, eight skips, stable failure. |
| unexpected-skip | [37134748920](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134748920) | [PR #13](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/pull/13) / [37134800998](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134800998) | Complete: false, eight unexpected skips, stable failure. |
| Manual dispatch on docs-only commit | [37137533223](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37137533223) | N/A | Complete: false, eight successes, stable success. |
| Main required checks | Classic protection applied; strict and administrator enforcement enabled. | Required checks and ready PR merge state verified below. | Complete: CI status only; no conditional heavy check required. |

The thirteen runs comprise nine successes and four expected failures. Five full-CI runs each preserved `p34-compatibility-reports`, `p34-coverage-reports`, and `cloudflare-powershell-p34-candidate`; provenance and staged-module smoke passed in the package job. The workflow, classifier behavior, status evaluator, build bodies, and report/candidate artifact semantics needed no repair. Fault injections remained isolated.

## Protected PR verification and cleanup

The applied setting requires the unique context `CI status` from GitHub Actions app ID 15368, with strict up-to-date checks and administrator enforcement; force pushes and main deletion are disabled. Heavy jobs are not required separately. [Protection and PR readback](./ci-01-protection-evidence.json) records the API results before cleanup.

Each test PR was created draft, temporarily marked ready after all runs and configuration readback, inspected, then closed without merging. This excludes draft state as the cause of fault blocking. `mergeable=MERGEABLE` describes conflict status; `mergeStateStatus` and the required check establish the protected gate result. Multiple push/PR/manual instances can share the same required context name; all observed required instances matched the expected outcome.

| PR | Scenario | Ready state | Required CI status | Protected merge state | Cleanup |
| --- | --- | --- | --- | --- | --- |
| [#10](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/pull/10) | docs | draft=false | SUCCESS | CLEAN | Closed, unmerged; remote probe ref deleted. |
| [#11](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/pull/11) | root | draft=false | SUCCESS | CLEAN | Closed, unmerged; remote probe ref deleted. |
| [#12](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/pull/12) | classifier-failure | draft=false | FAILURE | BLOCKED | Closed, unmerged; remote probe ref deleted. |
| [#13](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/pull/13) | unexpected-skip | draft=false | FAILURE | BLOCKED | Closed, unmerged; remote probe ref deleted. |
| [#14](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/pull/14) | mixed | draft=false | SUCCESS | CLEAN | Closed, unmerged; remote probe ref deleted. |
| [#15](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/pull/15) | workflow | draft=false | SUCCESS | CLEAN | Closed, unmerged; remote probe ref deleted. |

## Scope and remaining limits

- No required CI-01 scenario remains missing for baseline `776d26111eacea2708152a084d4124e3bc8f82da`. Revalidate the affected remote matrix after future executable workflow/classifier/status changes; old successes do not establish a new revision.
- Remote cancellation was not injected; its evaluator cases passed locally. Merge queues are not configured or accepted by this matrix. Neither is counted as a completed remote scenario.
- No test PR was merged. Main content stayed unchanged. No Cloudflare account call, secret use by a workflow, Gallery publication, or real-resource mutation was performed. Candidate uploads are inspection artifacts with the existing 14-day retention, not release approval. Raw logs and snapshots remain in the external evidence directory.
- The acceptance documentation and configuration evidence are local commits on `codex-petal/ci-acceptance`; pushing or merging that documentation branch was not part of the two authorized operations. Applied GitHub main protection persists after probe cleanup; removing it requires separate authorization.

## Initial acceptance gaps (before authorized remote execution)

| Scenario on current baseline | Push | PR | Remaining evidence |
| --- | --- | --- | --- |
| First push containing only docs/** | Missing | Missing | Classifier true, eight skips, stable success; protected docs PR mergeability. |
| First push containing only root Markdown | Missing | Missing | Same; root-only changed-path proof. |
| Mixed docs + code/tool | Current main mixed push passed; minimal isolated push pending | Missing | New isolated exact-SHA runs with eight successes. |
| Docs + workflow change | Main mixed range includes workflow; dedicated probe pending | Missing | Dedicated workflow path probe with eight successes. |
| Manual dispatch | Missing | N/A | docs branch dispatch must produce false and eight successes. |
| Classifier failure | Missing | Missing | Controlled isolated failure; stable status failure and blocked protected PR. |
| Unexpected heavy skip | Missing | Missing | Classifier false, build forced skipped; stable failure and blocked protected PR. |
| Main required-check configuration | Not configured | Not verified | CI status only, enforced; successful docs PR must pass this required check. |

Cancellation is locally covered, but there is no current remote cancellation
acceptance evidence. Workflow cancellation can cancel the final job too;
never treat a cancelled required check as passing.

## Executed minimal reversible probes

Every probe branch forked directly from `776d26111eacea2708152a084d4124e3bc8f82da`.
No probe was merged or cherry-picked into main or acceptance.
The probe worktree is `E:\桌面\edit\cloudflare-pwsh-ci-probes`.

| Branch suffix (prefix codex-petal/ci-acceptance-probe-) | Exact head | Change / expected result |
| --- | --- | --- |
| docs | `12eb5201ce82a94cb343d50c898ebbd59b41a884` | Add docs/ci-01-acceptance-probe.md only; true, eight skips, status success. |
| root | `96694725a7509ba3434e3cb48d8cdfc53272a64d` | Add CI-01-acceptance-probe.md only; true, eight skips, status success. |
| mixed | `b8f22d1ff90b8b11ca02f4193104d16b6611eb7e` | Docs + comment in classifier tool; false, eight successes, status success. |
| workflow | `69aa1b083ed1f5115566e14a5bdfd2e768351c0d` | Docs + workflow comment; unchanged job graph; false, eight successes, status success. |
| classifier-failure | `033b223fe7e0e54bcacc96d0b2c92e85be740c62` | Docs + unquoted zero HEAD_SHA (YAML delivered `0`); classifier rejects invalid SHA, eight skips, status failure. |
| unexpected-skip | `6d9858f8f20082af384064ff42c571206e730fc6` | Docs + only build guard changed to false; classifier false, build/downstream skips, status failure. |

The failure probes deliberately alter only the trigger input or one job guard.
The evaluator, eight job bodies, candidate creation, provenance, report downloads,
and artifact semantics are unchanged. Both fault commits stay isolated.
Remote names were verified absent before their first push. Each exact branch
was pushed once without force. All six test PRs were closed without merging and
all six remote probe refs were deleted after evidence capture. Local commits
and the probe worktree remain for audit.

Local routing assertions: 35 passed. P4.2 static checks passed.
P34CiGates initially stopped because the fresh worktree lacked pinned schema.
After normal Initialize-P34Schema, the rerun exited 0 and passed deterministic
package assembly, candidate smoke, and negative policy tests. Expected rejection
exceptions in that successful test log are negative-test evidence, not failures.
The actual docs/root/mixed/workflow probe commits also classified true/true/false/
false locally, and the fault probe zero HEAD_SHA input was rejected. Protection
payload structure, edited-text CRLF, and git diff --check passed.
Local checks cannot fill any remote matrix cell.

## Authorized remote operations

Authorized scope: six exact branch pushes, six draft test PRs targeting main,
one manual dispatch, and cleanup of these six test PRs/remote refs after evidence
is saved. Execution created 13 workflow runs: six push, six PR, one manual; five
normal full-CI runs can each execute eight Windows jobs and upload candidates.
Fault runs must fail. Do not dispatch schema-update or release workflows.
Do not push the acceptance branch or merge any PR under this probe authorization.

Execute sequentially, waiting for each run's final state before creating its PR
or dispatching the same ref, because concurrency can cancel runs. At every step
recheck main, changed paths, exact head, workflow blobs, and absence of secrets.
If main moves, stop and revise the baseline; do not reuse these SHA-bound probes
as acceptance of the new main. Stop on unexpected results; reproduce first,
then make only a narrow fix and rerun local and affected remote scenarios.

For each of the six explicit branch names above, execute from the probe worktree:

```powershell
$branch = 'codex-petal/ci-acceptance-probe-docs' # substitute one ledger row
# First recheck remote name absent and local head equals that row's exact SHA.
git push origin "${branch}:refs/heads/${branch}"
# Save and inspect the push run before opening its PR.
gh pr create --repo Spring2022abcjk/cloudflare-pwsh --base main --head $branch --draft --title "test: CI-01 isolated $branch" --body 'Temporary CI-01 acceptance probe. Never merge. Record exact run, diff range, and all ten job results before cleanup.'
# Save and inspect the corresponding PR run before continuing.
```

Each created PR must be attached to this task. For manual forcing, after the docs
branch's push and PR runs complete:

```powershell
gh workflow run p34-ci.yml --repo Spring2022abcjk/cloudflare-pwsh --ref codex-petal/ci-acceptance-probe-docs
```

Record event, run/attempt/link, API head SHA, PR merge checkout SHA, event before
or base SHA, created flag/default tip/merge base, changed paths, docs_only,
Classify changes, each of eight job conclusions, CI status, and protected PR
required-check results. Pending, cancelled, or absent conclusions are not passes.
Draft PRs need not be made ready merely to inspect required checks; draft state
itself is not proof that branch protection blocks failed checks.

Cleanup only the recorded test PR numbers and six explicit probe refs, after
saving evidence: `gh pr close <number>` then `git push origin --delete <branch>`.
Retain local commits/worktrees for audit. Never delete main or unrelated refs.

## Applied and validated main protection

Before configuration, read-only APIs returned protected=false, protection GET 404 "Branch not protected",
repository rulesets=[], and effective rules/branches/main=[]. Those initial results are historical. The final readback reports main protected
with classic branch protection; repository rulesets and effective ruleset rules
remain empty. Empty ruleset APIs do not negate classic branch protection.
CI status exists on current main and is produced by GitHub Actions app ID 15368.

Applied REST payload: [ci-01-main-protection.json](./ci-01-main-protection.json).
It requires CI status only (bound to GitHub Actions), strict up-to-date checks,
enforces administrators, and disallows force pushes and branch deletion. It adds
no review-count or actor-restriction policy. At the initial snapshot there were
no settings to replace; that state was rechecked before applying the approved
payload. Preserve and review future settings rather than blindly replacing them.

After explicit authorization and successful remote routing/fail-closed evidence:

```powershell
gh api --method PUT repos/Spring2022abcjk/cloudflare-pwsh/branches/main/protection --input docs/ci-01-main-protection.json
# Read back branch protection, rulesets, effective rules, and each probe PR's
# required checks. Confirm docs PRs satisfy CI status despite eight skips,
# while both fault PRs cannot satisfy it. Do not merge a test PR.
```

Changing protection alters main merge/push eligibility, including administrators.
Strict checks require fresh runs when main advances. Do not individually require
Build, Package candidate and smoke, or any other conditional heavy job.
Do not claim Complete until configuration readback and protected PR checks prove
both allowed documentation routing and rejection of faults. Removing this new
protection is a separate write authorization, not automatic probe cleanup.
