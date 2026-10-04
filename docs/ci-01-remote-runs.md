# CI-01 exact remote run evidence

Baseline: `776d26111eacea2708152a084d4124e3bc8f82da`. These are new isolated probe runs; historical runs are recorded separately. Results are from exact run metadata, job conclusions, classifier logs, and PR snapshots. Full raw logs remain outside the repository. An injected invalid HEAD_SHA is distinct from the actual checkout SHA.

## docs / push / [37134319713](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134319713)

- Branch: `codex-petal/ci-acceptance-probe-docs`; attempt: 1; PR: 10.
- Run head SHA: `12eb5201ce82a94cb343d50c898ebbd59b41a884`; actual checkout SHA: `12eb5201ce82a94cb343d50c898ebbd59b41a884`.
- Event base/before: `0000000000000000000000000000000000000000`; created: `true`; classifier head input: `12eb5201ce82a94cb343d50c898ebbd59b41a884`.
- Comparison: `merge-base(origin/main, checkout)=776d26111eacea2708152a084d4124e3bc8f82da -> 12eb5201ce82a94cb343d50c898ebbd59b41a884`; docs_only: `true`; run conclusion: **success**.
- Changed paths against baseline: `docs/ci-01-acceptance-probe.md`.
- Artifact inventory: .

| Job | Conclusion | Job link |
| --- | --- | --- |
| Classify changes | success | [111235611013](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134319713/job/111235611013) |
| Build | skipped | [111235650287](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134319713/job/111235650287) |
| Deterministic generation | skipped | [111235650887](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134319713/job/111235650887) |
| Unit and runtime smoke | skipped | [111235650606](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134319713/job/111235650606) |
| P1-P2.4 regression | skipped | [111235650834](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134319713/job/111235650834) |
| Compatibility gate | skipped | [111235651072](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134319713/job/111235651072) |
| Coverage gate | skipped | [111235650501](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134319713/job/111235650501) |
| Release and security preflight | skipped | [111235650568](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134319713/job/111235650568) |
| Package candidate and smoke | skipped | [111235651120](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134319713/job/111235651120) |
| CI status | success | [111235650626](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134319713/job/111235650626) |

## docs / pull_request / [37134396096](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134396096)

- Branch: `codex-petal/ci-acceptance-probe-docs`; attempt: 1; PR: 10.
- Run head SHA: `12eb5201ce82a94cb343d50c898ebbd59b41a884`; actual checkout SHA: `021d25d9e908ed39b70c087dbcf2ac4fa315e506`.
- Event base/before: `776d26111eacea2708152a084d4124e3bc8f82da`; created: `false`; classifier head input: `021d25d9e908ed39b70c087dbcf2ac4fa315e506`.
- Comparison: `776d26111eacea2708152a084d4124e3bc8f82da -> 021d25d9e908ed39b70c087dbcf2ac4fa315e506`; docs_only: `true`; run conclusion: **success**.
- Changed paths against baseline: `docs/ci-01-acceptance-probe.md`.
- Artifact inventory: .

| Job | Conclusion | Job link |
| --- | --- | --- |
| Classify changes | success | [111235833449](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134396096/job/111235833449) |
| Build | skipped | [111235871915](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134396096/job/111235871915) |
| Deterministic generation | skipped | [111235872138](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134396096/job/111235872138) |
| Unit and runtime smoke | skipped | [111235872215](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134396096/job/111235872215) |
| P1-P2.4 regression | skipped | [111235872548](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134396096/job/111235872548) |
| Compatibility gate | skipped | [111235873030](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134396096/job/111235873030) |
| Coverage gate | skipped | [111235872157](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134396096/job/111235872157) |
| Release and security preflight | skipped | [111235872739](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134396096/job/111235872739) |
| Package candidate and smoke | skipped | [111235873005](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134396096/job/111235873005) |
| CI status | success | [111235872259](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134396096/job/111235872259) |

## root / push / [37134458983](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134458983)

- Branch: `codex-petal/ci-acceptance-probe-root`; attempt: 1; PR: 11.
- Run head SHA: `96694725a7509ba3434e3cb48d8cdfc53272a64d`; actual checkout SHA: `96694725a7509ba3434e3cb48d8cdfc53272a64d`.
- Event base/before: `0000000000000000000000000000000000000000`; created: `true`; classifier head input: `96694725a7509ba3434e3cb48d8cdfc53272a64d`.
- Comparison: `merge-base(origin/main, checkout)=776d26111eacea2708152a084d4124e3bc8f82da -> 96694725a7509ba3434e3cb48d8cdfc53272a64d`; docs_only: `true`; run conclusion: **success**.
- Changed paths against baseline: `CI-01-acceptance-probe.md`.
- Artifact inventory: .

| Job | Conclusion | Job link |
| --- | --- | --- |
| Classify changes | success | [111236029587](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134458983/job/111236029587) |
| Build | skipped | [111236051325](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134458983/job/111236051325) |
| Deterministic generation | skipped | [111236051104](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134458983/job/111236051104) |
| Unit and runtime smoke | skipped | [111236051683](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134458983/job/111236051683) |
| P1-P2.4 regression | skipped | [111236051239](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134458983/job/111236051239) |
| Compatibility gate | skipped | [111236051462](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134458983/job/111236051462) |
| Coverage gate | skipped | [111236051351](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134458983/job/111236051351) |
| Release and security preflight | skipped | [111236051674](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134458983/job/111236051674) |
| Package candidate and smoke | skipped | [111236051621](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134458983/job/111236051621) |
| CI status | success | [111236051148](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134458983/job/111236051148) |

## root / pull_request / [37134523958](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134523958)

- Branch: `codex-petal/ci-acceptance-probe-root`; attempt: 1; PR: 11.
- Run head SHA: `96694725a7509ba3434e3cb48d8cdfc53272a64d`; actual checkout SHA: `56dbe16263669ec286c45c3730ee9e360b977696`.
- Event base/before: `776d26111eacea2708152a084d4124e3bc8f82da`; created: `false`; classifier head input: `56dbe16263669ec286c45c3730ee9e360b977696`.
- Comparison: `776d26111eacea2708152a084d4124e3bc8f82da -> 56dbe16263669ec286c45c3730ee9e360b977696`; docs_only: `true`; run conclusion: **success**.
- Changed paths against baseline: `CI-01-acceptance-probe.md`.
- Artifact inventory: .

| Job | Conclusion | Job link |
| --- | --- | --- |
| Classify changes | success | [111236224049](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134523958/job/111236224049) |
| Build | skipped | [111236252748](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134523958/job/111236252748) |
| Deterministic generation | skipped | [111236252885](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134523958/job/111236252885) |
| Unit and runtime smoke | skipped | [111236252959](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134523958/job/111236252959) |
| P1-P2.4 regression | skipped | [111236252678](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134523958/job/111236252678) |
| Compatibility gate | skipped | [111236253537](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134523958/job/111236253537) |
| Coverage gate | skipped | [111236252964](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134523958/job/111236252964) |
| Release and security preflight | skipped | [111236252903](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134523958/job/111236252903) |
| Package candidate and smoke | skipped | [111236253780](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134523958/job/111236253780) |
| CI status | success | [111236253064](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134523958/job/111236253064) |

## classifier-failure / push / [37134600097](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134600097)

- Branch: `codex-petal/ci-acceptance-probe-classifier-failure`; attempt: 1; PR: 12.
- Run head SHA: `033b223fe7e0e54bcacc96d0b2c92e85be740c62`; actual checkout SHA: `033b223fe7e0e54bcacc96d0b2c92e85be740c62`.
- Event base/before: `0000000000000000000000000000000000000000`; created: `true`; classifier head input: `0`.
- Comparison: `unresolved; invalid classifier head input`; docs_only: `not emitted (classification failed)`; run conclusion: **failure**.
- Changed paths against baseline: `.github/workflows/p34-ci.yml``, ``docs/ci-01-acceptance-probe.md`.
- Artifact inventory: .

| Job | Conclusion | Job link |
| --- | --- | --- |
| Classify changes | failure | [111236446553](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134600097/job/111236446553) |
| Build | skipped | [111236480449](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134600097/job/111236480449) |
| Deterministic generation | skipped | [111236480691](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134600097/job/111236480691) |
| Unit and runtime smoke | skipped | [111236480607](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134600097/job/111236480607) |
| P1-P2.4 regression | skipped | [111236480692](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134600097/job/111236480692) |
| Compatibility gate | skipped | [111236481033](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134600097/job/111236481033) |
| Coverage gate | skipped | [111236480444](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134600097/job/111236480444) |
| Release and security preflight | skipped | [111236480431](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134600097/job/111236480431) |
| Package candidate and smoke | skipped | [111236481067](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134600097/job/111236481067) |
| CI status | failure | [111236480372](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134600097/job/111236480372) |

## classifier-failure / pull_request / [37134685573](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134685573)

- Branch: `codex-petal/ci-acceptance-probe-classifier-failure`; attempt: 1; PR: 12.
- Run head SHA: `033b223fe7e0e54bcacc96d0b2c92e85be740c62`; actual checkout SHA: `0ddc75120c761ce888a991b5d4cc36061d3c562b`.
- Event base/before: `776d26111eacea2708152a084d4124e3bc8f82da`; created: `false`; classifier head input: `0`.
- Comparison: `unresolved; invalid classifier head input`; docs_only: `not emitted (classification failed)`; run conclusion: **failure**.
- Changed paths against baseline: `.github/workflows/p34-ci.yml``, ``docs/ci-01-acceptance-probe.md`.
- Artifact inventory: .

| Job | Conclusion | Job link |
| --- | --- | --- |
| Classify changes | failure | [111236700696](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134685573/job/111236700696) |
| Build | skipped | [111236721721](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134685573/job/111236721721) |
| Deterministic generation | skipped | [111236721540](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134685573/job/111236721540) |
| Unit and runtime smoke | skipped | [111236721692](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134685573/job/111236721692) |
| P1-P2.4 regression | skipped | [111236721867](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134685573/job/111236721867) |
| Compatibility gate | skipped | [111236722160](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134685573/job/111236722160) |
| Coverage gate | skipped | [111236721800](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134685573/job/111236721800) |
| Release and security preflight | skipped | [111236721830](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134685573/job/111236721830) |
| Package candidate and smoke | skipped | [111236722561](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134685573/job/111236722561) |
| CI status | failure | [111236722032](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134685573/job/111236722032) |

## unexpected-skip / push / [37134748920](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134748920)

- Branch: `codex-petal/ci-acceptance-probe-unexpected-skip`; attempt: 1; PR: 13.
- Run head SHA: `6d9858f8f20082af384064ff42c571206e730fc6`; actual checkout SHA: `6d9858f8f20082af384064ff42c571206e730fc6`.
- Event base/before: `0000000000000000000000000000000000000000`; created: `true`; classifier head input: `6d9858f8f20082af384064ff42c571206e730fc6`.
- Comparison: `merge-base(origin/main, checkout)=776d26111eacea2708152a084d4124e3bc8f82da -> 6d9858f8f20082af384064ff42c571206e730fc6`; docs_only: `false`; run conclusion: **failure**.
- Changed paths against baseline: `.github/workflows/p34-ci.yml``, ``docs/ci-01-acceptance-probe.md`.
- Artifact inventory: .

| Job | Conclusion | Job link |
| --- | --- | --- |
| Classify changes | success | [111236892347](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134748920/job/111236892347) |
| Build | skipped | [111236920012](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134748920/job/111236920012) |
| Deterministic generation | skipped | [111236920449](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134748920/job/111236920449) |
| Unit and runtime smoke | skipped | [111236920622](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134748920/job/111236920622) |
| P1-P2.4 regression | skipped | [111236920634](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134748920/job/111236920634) |
| Compatibility gate | skipped | [111236920564](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134748920/job/111236920564) |
| Coverage gate | skipped | [111236920693](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134748920/job/111236920693) |
| Release and security preflight | skipped | [111236920228](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134748920/job/111236920228) |
| Package candidate and smoke | skipped | [111236921219](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134748920/job/111236921219) |
| CI status | failure | [111236920490](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134748920/job/111236920490) |

## unexpected-skip / pull_request / [37134800998](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134800998)

- Branch: `codex-petal/ci-acceptance-probe-unexpected-skip`; attempt: 1; PR: 13.
- Run head SHA: `6d9858f8f20082af384064ff42c571206e730fc6`; actual checkout SHA: `71cbc1d7d031cd6f738781498503bc713693b050`.
- Event base/before: `776d26111eacea2708152a084d4124e3bc8f82da`; created: `false`; classifier head input: `71cbc1d7d031cd6f738781498503bc713693b050`.
- Comparison: `776d26111eacea2708152a084d4124e3bc8f82da -> 71cbc1d7d031cd6f738781498503bc713693b050`; docs_only: `false`; run conclusion: **failure**.
- Changed paths against baseline: `.github/workflows/p34-ci.yml``, ``docs/ci-01-acceptance-probe.md`.
- Artifact inventory: .

| Job | Conclusion | Job link |
| --- | --- | --- |
| Classify changes | success | [111237045569](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134800998/job/111237045569) |
| Build | skipped | [111237080691](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134800998/job/111237080691) |
| Deterministic generation | skipped | [111237080619](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134800998/job/111237080619) |
| Unit and runtime smoke | skipped | [111237080653](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134800998/job/111237080653) |
| P1-P2.4 regression | skipped | [111237080836](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134800998/job/111237080836) |
| Compatibility gate | skipped | [111237081158](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134800998/job/111237081158) |
| Coverage gate | skipped | [111237080439](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134800998/job/111237080439) |
| Release and security preflight | skipped | [111237080422](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134800998/job/111237080422) |
| Package candidate and smoke | skipped | [111237081070](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134800998/job/111237081070) |
| CI status | failure | [111237080585](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134800998/job/111237080585) |

## mixed / push / [37134890985](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134890985)

- Branch: `codex-petal/ci-acceptance-probe-mixed`; attempt: 1; PR: 14.
- Run head SHA: `b8f22d1ff90b8b11ca02f4193104d16b6611eb7e`; actual checkout SHA: `b8f22d1ff90b8b11ca02f4193104d16b6611eb7e`.
- Event base/before: `0000000000000000000000000000000000000000`; created: `true`; classifier head input: `b8f22d1ff90b8b11ca02f4193104d16b6611eb7e`.
- Comparison: `merge-base(origin/main, checkout)=776d26111eacea2708152a084d4124e3bc8f82da -> b8f22d1ff90b8b11ca02f4193104d16b6611eb7e`; docs_only: `false`; run conclusion: **success**.
- Changed paths against baseline: `docs/ci-01-acceptance-probe.md``, ``tools/Get-CiChangeClassification.ps1`.
- Artifact inventory: p34-compatibility-reports, cloudflare-powershell-p34-candidate, p34-coverage-reports.

| Job | Conclusion | Job link |
| --- | --- | --- |
| Classify changes | success | [111237310857](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134890985/job/111237310857) |
| Build | success | [111237341130](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134890985/job/111237341130) |
| Deterministic generation | success | [111237579902](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134890985/job/111237579902) |
| Unit and runtime smoke | success | [111237579878](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134890985/job/111237579878) |
| P1-P2.4 regression | success | [111237579844](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134890985/job/111237579844) |
| Compatibility gate | success | [111237915831](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134890985/job/111237915831) |
| Coverage gate | success | [111237579879](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134890985/job/111237579879) |
| Release and security preflight | success | [111237579848](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134890985/job/111237579848) |
| Package candidate and smoke | success | [111238712786](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134890985/job/111238712786) |
| CI status | success | [111238981246](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37134890985/job/111238981246) |

## mixed / pull_request / [37135547259](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37135547259)

- Branch: `codex-petal/ci-acceptance-probe-mixed`; attempt: 1; PR: 14.
- Run head SHA: `b8f22d1ff90b8b11ca02f4193104d16b6611eb7e`; actual checkout SHA: `ac426d62d41b0149898350627e475545f1978559`.
- Event base/before: `776d26111eacea2708152a084d4124e3bc8f82da`; created: `false`; classifier head input: `ac426d62d41b0149898350627e475545f1978559`.
- Comparison: `776d26111eacea2708152a084d4124e3bc8f82da -> ac426d62d41b0149898350627e475545f1978559`; docs_only: `false`; run conclusion: **success**.
- Changed paths against baseline: `docs/ci-01-acceptance-probe.md``, ``tools/Get-CiChangeClassification.ps1`.
- Artifact inventory: cloudflare-powershell-p34-candidate, p34-compatibility-reports, p34-coverage-reports.

| Job | Conclusion | Job link |
| --- | --- | --- |
| Classify changes | success | [111239229563](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37135547259/job/111239229563) |
| Build | success | [111239270133](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37135547259/job/111239270133) |
| Deterministic generation | success | [111239464219](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37135547259/job/111239464219) |
| Unit and runtime smoke | success | [111239464260](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37135547259/job/111239464260) |
| P1-P2.4 regression | success | [111239464268](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37135547259/job/111239464268) |
| Compatibility gate | success | [111239814937](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37135547259/job/111239814937) |
| Coverage gate | success | [111239464271](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37135547259/job/111239464271) |
| Release and security preflight | success | [111239464292](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37135547259/job/111239464292) |
| Package candidate and smoke | success | [111240544786](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37135547259/job/111240544786) |
| CI status | success | [111240843422](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37135547259/job/111240843422) |

## workflow / push / [37136170081](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136170081)

- Branch: `codex-petal/ci-acceptance-probe-workflow`; attempt: 1; PR: 15.
- Run head SHA: `69aa1b083ed1f5115566e14a5bdfd2e768351c0d`; actual checkout SHA: `69aa1b083ed1f5115566e14a5bdfd2e768351c0d`.
- Event base/before: `0000000000000000000000000000000000000000`; created: `true`; classifier head input: `69aa1b083ed1f5115566e14a5bdfd2e768351c0d`.
- Comparison: `merge-base(origin/main, checkout)=776d26111eacea2708152a084d4124e3bc8f82da -> 69aa1b083ed1f5115566e14a5bdfd2e768351c0d`; docs_only: `false`; run conclusion: **success**.
- Changed paths against baseline: `.github/workflows/p34-ci.yml``, ``docs/ci-01-acceptance-probe.md`.
- Artifact inventory: cloudflare-powershell-p34-candidate, p34-coverage-reports, p34-compatibility-reports.

| Job | Conclusion | Job link |
| --- | --- | --- |
| Classify changes | success | [111241029161](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136170081/job/111241029161) |
| Build | success | [111241053486](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136170081/job/111241053486) |
| Deterministic generation | success | [111241259970](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136170081/job/111241259970) |
| Unit and runtime smoke | success | [111241259951](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136170081/job/111241259951) |
| P1-P2.4 regression | success | [111241259985](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136170081/job/111241259985) |
| Compatibility gate | success | [111241736481](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136170081/job/111241736481) |
| Coverage gate | success | [111241259913](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136170081/job/111241259913) |
| Release and security preflight | success | [111241259918](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136170081/job/111241259918) |
| Package candidate and smoke | success | [111242406728](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136170081/job/111242406728) |
| CI status | success | [111242691694](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136170081/job/111242691694) |

## workflow / pull_request / [37136801413](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136801413)

- Branch: `codex-petal/ci-acceptance-probe-workflow`; attempt: 1; PR: 15.
- Run head SHA: `69aa1b083ed1f5115566e14a5bdfd2e768351c0d`; actual checkout SHA: `e76237bac11bdb0a034143734bd36e082861ac08`.
- Event base/before: `776d26111eacea2708152a084d4124e3bc8f82da`; created: `false`; classifier head input: `e76237bac11bdb0a034143734bd36e082861ac08`.
- Comparison: `776d26111eacea2708152a084d4124e3bc8f82da -> e76237bac11bdb0a034143734bd36e082861ac08`; docs_only: `false`; run conclusion: **success**.
- Changed paths against baseline: `.github/workflows/p34-ci.yml``, ``docs/ci-01-acceptance-probe.md`.
- Artifact inventory: cloudflare-powershell-p34-candidate, p34-coverage-reports, p34-compatibility-reports.

| Job | Conclusion | Job link |
| --- | --- | --- |
| Classify changes | success | [111242871276](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136801413/job/111242871276) |
| Build | success | [111242907379](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136801413/job/111242907379) |
| Deterministic generation | success | [111243146353](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136801413/job/111243146353) |
| Unit and runtime smoke | success | [111243146357](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136801413/job/111243146357) |
| P1-P2.4 regression | success | [111243146366](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136801413/job/111243146366) |
| Compatibility gate | success | [111243475855](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136801413/job/111243475855) |
| Coverage gate | success | [111243146341](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136801413/job/111243146341) |
| Release and security preflight | success | [111243146335](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136801413/job/111243146335) |
| Package candidate and smoke | success | [111243840298](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136801413/job/111243840298) |
| CI status | success | [111244208136](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37136801413/job/111244208136) |

## docs / workflow_dispatch / [37137533223](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37137533223)

- Branch: `codex-petal/ci-acceptance-probe-docs`; attempt: 1; PR: 10.
- Run head SHA: `12eb5201ce82a94cb343d50c898ebbd59b41a884`; actual checkout SHA: `12eb5201ce82a94cb343d50c898ebbd59b41a884`.
- Event base/before: ``; created: `false`; classifier head input: `12eb5201ce82a94cb343d50c898ebbd59b41a884`.
- Comparison: `none; manual forcing`; docs_only: `false`; run conclusion: **success**.
- Changed paths against baseline: `docs/ci-01-acceptance-probe.md`.
- Artifact inventory: p34-compatibility-reports, p34-coverage-reports, cloudflare-powershell-p34-candidate.

| Job | Conclusion | Job link |
| --- | --- | --- |
| Classify changes | success | [111245001285](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37137533223/job/111245001285) |
| Build | success | [111245050144](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37137533223/job/111245050144) |
| Deterministic generation | success | [111245282040](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37137533223/job/111245282040) |
| Unit and runtime smoke | success | [111245282058](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37137533223/job/111245282058) |
| P1-P2.4 regression | success | [111245282081](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37137533223/job/111245282081) |
| Compatibility gate | success | [111245667800](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37137533223/job/111245667800) |
| Coverage gate | success | [111245282056](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37137533223/job/111245282056) |
| Release and security preflight | success | [111245282001](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37137533223/job/111245282001) |
| Package candidate and smoke | success | [111246428555](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37137533223/job/111246428555) |
| CI status | success | [111246720599](https://github.com/Spring2022abcjk/Cloudflare-Pwsh/actions/runs/37137533223/job/111246720599) |
