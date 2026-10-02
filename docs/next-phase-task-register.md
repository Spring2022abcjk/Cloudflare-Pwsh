# Next-phase task register

This register separates release acceptance, SDK design, CI routing, reference
storage, and retained technical findings. It is a plan, not evidence that a
task is complete or permission to publish, run live account calls, change
branch protection, or expand the formal five-cmdlet surface. Recheck HEAD,
remote CI, and repository settings when starting each task.

## Priority and dependencies

| Priority | Task | Current boundary | Completion evidence |
| --- | --- | --- | --- |
| 1 | REL-01: license and P4.2 metadata closure | License choice is outstanding; Gallery preflight is NotReady. | Final license decision, matching `LICENSE`/manifest metadata, preflight, fresh exact-HEAD local and remote evidence. |
| 1 | REL-02: P4.3 final candidate decision | Waits for REL-01 and reconciliation of bounded P3.5/P4.1 evidence. | Exact candidate identity, package provenance, limits and release notes reviewed; explicit publish or defer decision. |
| 2 | DOC-01: durable roadmap and issue routing | This document and the roadmap record proposals and separate issues. | Links, status wording, and evidence classes remain consistent; no implied release or admission. |
| 2 | CI-01: documentation-only CI routing | Implemented on `main` through PR #8; [CI engineering](./ci-engineering.md) records the workflow and the unverified new-branch refinement. Remote acceptance remains open. | Full-gate and docs-only branch/PR runs for the current revision, manual and failure cases, and required `CI status` check configuration; see the [contract](./ci-trigger-policy.md). |
| 3 | ARCH-01: P6.1 SDK architecture design | P6 remains a proposal. | Reviewed module boundaries, Accounts/Core, Module Planner, type/version rules, migration and provenance plan. |
| 3 | ARCH-02: context, discovery, raw API design | Follows ARCH-01; no new public commands implied. | Explicit scope and credential rules, raw-call safety, discovery accuracy, compatibility review. |
| 4 | ADM-01: bounded common-workflow pilot | Follows architecture decisions and the existing explicit-admission policy. | Per-workflow projection/runtime/help/mock/compatibility/coverage/admission parity and separately scoped live evidence if required. |
| 4 | REF-01: reference checkout cache migration | [Plan](./ref-checkout-cache-maintenance.md) exists; per-worktree `ref/` remains authoritative. | Pinned hashes, isolated checkout paths, regression/provenance gates, no loss of retained evidence. |

REL-01/REL-02 and ARCH-01 may be planned independently. CI-01 remote
acceptance does not wait for a license or P4.3 decision. Keep subsequent CI
workflow changes attributable to an exact head and rerun the remote matrix.
REF-01 is a separate storage migration and is not a CI shortcut.

## Retained findings and engineering debt

| ID | Finding | Treatment |
| --- | --- | --- |
| API-01 | DNS export was observed with `application/octet-stream; charset=UTF-8` while the fixed contract says `text/plain`. The upstream cause is unresolved. | Dedicated contract investigation; do not silently change schema or runtime based on the current evidence alone. |
| LIVE-01 | P3.5c was accepted within a bounded evidence scope; live 429, multipart, binary, and 204/no-content evidence was not obtained. | Keep the [scenario matrix](./P3.5c-transport-evidence-plan.md) and evidence labels. Further live probes need separately defined scope. |
| TOOL-01 | Upstream artifact changes can leave downstream public-artifact, baseline, receipt, or package identities stale. | P5 provenance/dependency automation with exact-source and deterministic regeneration checks. |
| TOOL-02 | Candidate and validation scripts can leave untracked temporary output in worktrees. | P5 isolated output-root and cleanup design; preserve historical evidence and user-owned files. |
| CI-02 | CI annotation/runtime upgrades, duration, and required-check configuration are distinct from CI-01's change classification. | Track after CI-01 baseline is proven; do not treat a successful old run as validation of a new workflow revision. |
| REF-02 | Duplicated ignored SDK/schema checkouts consume space; shared writable input would weaken isolation. | Execute REF-01 only after inventory and lock/hash verification. |
| ADM-02 | Service-level generation introduces command collisions, scope/permission boundaries, shared types, and mutation safety questions. | Resolve in ARCH-01/ADM-01 before adding a wave of public commands. |

The five-command public surface and explicit-only admission policy remain the
current release boundary. D1/D2 are isolated validation slices, not exports.
