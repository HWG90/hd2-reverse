# game.dll research

Build timestamp `0x6AD7C05D`; mapped image size 54,009,856 bytes; capture base `0x6ffff0870000`.

## Current snapshot

Recovered **10,942 / 13,186** pages; **2,244 pages remain unknown**. The compressed merged image and per-page provenance are in [recovery/6ad7c05d-6ffff0870000](recovery/6ad7c05d-6ffff0870000/). Decompress with `gzip -dk game-merged.bin.gz`.

This combines first-readable pages from different capture times. It is not a coherent process snapshot or a reconstructed on-disk DLL. Unknown pages are zero-filled; readable does not establish decrypted. Captured pointers are not current live pointers.

## Findings

- [Engine callback resolution](engine-callback-trace/README.md): live EXE callback targets and material command setters; GPU binding remains unresolved.

- [Material and shader trace](material-shader-trace/README.md): wind parameter submission, material-value dispatch, replacement candidates and shader type registration.

- [Weapon firing, reload and ammunition trace](weapon-trace/README.md): connected static candidates, exact stores and caller evidence.

- [Initial capture comparison](dump-analysis/report.md): mission/extraction-location generation and UI references. These do not identify an extraction countdown.
- [Earlier cumulative analysis](dump-analysis/merged/report.md): Eagle component management and diagnostics, ragdoll publication, horizontal acceleration. The report describes an earlier snapshot; the adjacent JSON/listing was refreshed later.
- [Latest analysis details](dump-analysis/merged/new-code-details.json): page differences, entropy and instruction-to-string references.
- Weapon-related anchors now include component diagnostics for reload, rounds, linked ammo, heat, charge and weapon data around RVAs `0x574767–0x578075`; `WeaponScreenComponent` at `0x79821E`; customization references at `0x132B527` and `0x1880CD5`. These are leads, not validated firing/reload/recoil implementations or callable APIs.
- [Historical readable-code disassembly](disassembly/README.md): based on the earlier 21:42 capture, not the latest merged image.
- Gameplay maps are research candidates with validation flags; they are not blanket confirmation of working gameplay behavior.

## Reproducibility and scope

Analysis and capture source scripts are included. They currently reference the original Linux workspace, Python dependency directory and LLtM installation; adapt those paths before running elsewhere. Capture uses read operations and does not change memory protections.

Original gaining capture archives remain in the local workspace; this repository contains the cumulative image, coverage metadata, selected disassembly and reports rather than duplicate full captures. Local chat state, preferences, unrelated mod sources and runtime chat logs are excluded. No upstream game source or original symbols are claimed. No project license is assigned to third-party game-derived material.
