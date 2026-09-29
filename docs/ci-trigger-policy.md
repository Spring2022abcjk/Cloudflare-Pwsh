# CI Trigger Policy — Documentation-Only Changes

## Status

**Implemented locally on `codex-petal/ci-docs-only-routing`; remote acceptance
pending.** `.github/workflows/p34-ci.yml` starts on every `push`,
`pull_request`, and manual dispatch. The `changes` job runs the PowerShell
classifier before the eight heavy jobs. The always-created `CI status` job
evaluates the classifier result and every heavy job result.

## Decision

Use a stable, always-created workflow check with conditional heavy jobs rather
than workflow-level `paths-ignore`.

The workflow continues to start for `push`, `pull_request`, and manual
`workflow_dispatch` events. A lightweight first job classifies the changed
paths as either `docs-only` or `requires-ci`. The existing build, regression,
coverage, security-preflight, packaging, and package-smoke jobs run only for
`requires-ci`.

The workflow then always creates a final `CI status` job:

- for `docs-only`, it succeeds after recording that heavy CI was intentionally
  skipped;
- for `requires-ci`, it succeeds only when every existing heavy job succeeds;
- for classification failure, cancellation, or an unexpected skipped heavy
  job, it fails closed.

Branch protection should require only this stable `CI status` check. The
individual heavy jobs remain useful diagnostics, but must not be the sole
required checks because their intentional skip state varies by change class.

## Change classification

The classifier uses an explicit documentation allowlist. A change is
`docs-only` only when every changed path is one of these approved paths:

```text
docs/**
*.md
**/*.md
```

Everything else is `requires-ci`, including source, tests, tools, fixtures,
generated artifacts, project/build metadata, workflow/action files, schema
pins, `LICENSE`, and release metadata. A mixed documentation/code change also
requires the complete CI flow.

Markdown under `.github/`, `tools/`, `tests/`, `fixtures/`, `artifacts/`,
`src/`, `module/`, `ref/`, `release/`, `packaging/`, `schema/`, or `build/`
requires full CI, as does `LICENSE.md`. The classifier compares the
push event's before/after commits, or the pull request base commit against its
checked-out merge commit. It checks ancestry or the expected first parent,
uses a NUL-delimited diff with rename detection disabled, and rejects an
empty or unresolved diff. A new branch push without a usable before commit
therefore fails closed; run a later branch push or pull request for evidence.

The classifier must run in PowerShell and fail closed if the event diff cannot
be resolved. Manual `workflow_dispatch` runs must default to
`requires-ci` so that an operator can always force the complete validation
chain. If merge queues are introduced, `merge_group` must use the same
classification and stable status contract.

## Required workflow shape

The implementation should preserve the existing job graph and add the
classification dependency explicitly:

```yaml
jobs:
  changes:
    name: Classify changes
    # Emits docs_only=true|false and fails closed on an unknown diff.

  build:
    needs: changes
    if: needs.changes.outputs.docs_only != 'true'

  # The other heavy jobs use the same classification guard and retain their
  # current dependencies.

  ci-status:
    name: CI status
    if: ${{ always() }}
    needs:
      - changes
      - build
      - deterministic-generation
      - unit-runtime
      - regression
      - compatibility
      - coverage
      - release-preflight
      - package
```

`ci-status` must explicitly distinguish the intentional `docs-only` case
from a skipped or failed heavy job. It must not treat an unexpected skip as a
pass. The current `.github/workflows/p34-schema-update.yml` remains manual and
is not part of this routing change.

## Evidence and acceptance gates

Before enabling the policy, verify all of the following in a pull request and
on a branch push:

1. A change under `docs/**` creates `CI status`, runs no heavy Windows job, and
   is mergeable when the stable check passes.
2. A root Markdown-only change has the same result.
3. A documentation change plus one source, test, tool, fixture, workflow,
   schema, artifact, build, or license file runs all existing heavy jobs.
4. A workflow or action change always runs the complete CI flow.
5. A manual dispatch always runs the complete CI flow.
6. A classifier error, cancelled dependency, or unexpected skip fails the
   stable check rather than silently passing.
7. Branch protection requires the stable `CI status` check and does not leave
   a path-filtered workflow check permanently pending.

`tests/CiDocsOnlyRouting.Tests.ps1` uses temporary Git commits to exercise
the classification matrix and tests the stable status evaluator for expected
success, intentional skips, classifier failure, failed or cancelled heavy
jobs, and unexpected skips. The local run passed 26 routing assertions,
`tests/P34CiGates.Tests.ps1`, `tests/P42Security.Tests.ps1`, YAML parsing and
job dependency checks, and `git diff --check`. These establish local script
behavior only.

Remote evidence is still needed: a branch push and pull request for each
documentation-only case, a mixed or workflow change, and manual dispatch;
inspect the `Classify changes`, eight heavy jobs, and `CI status` conclusions
on those exact runs. A controlled failure/cancellation or unexpected-skip
probe must also demonstrate that `CI status` rejects the result. Branch
protection on `main` is currently absent; require the stable `CI status`
check after its check context is available, then verify mergeability for a
documentation-only pull request. No Gallery, Cloudflare account, mutation, or
release action is implied by this policy.
