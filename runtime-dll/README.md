# runtime.dll and preloader research

Helldivers 2's protection runtime: how it is loaded, a live capture, and how memory compares with the file on disk.

| Directory | Contents |
|---|---|
| [artifacts](artifacts/capture/README.md) | Live runtime.dll capture, page report, region map and provenance |
| [artifacts/live-captures](artifacts/live-captures/README.md) | Later whole-image captures (2026-10-25) and their page deltas |
| [triage](triage/) | Capture log, VirtualQuery and /proc maps snapshots, page comparison |
| [analysis](analysis/) | Focused investigations, evidence and scripts |
| [tools/capture](tools/capture/) | Original LLtM capture and maps-snapshot source; `pack.py` and `rebuild.py` for live captures |
| [reports](reports/) | Workflow, hypotheses, toolchain and path-migration receipts |

## Cases

- [Disk image](analysis/disk-image/README.md): sections, encryption estimate, resources, signers
- [Preloader mapping](analysis/preloader-mapping/README.md): how preloader.dll redirects its entry points and maps runtime.dll
- [Live vs disk](analysis/live-vs-disk/README.md): the 8 pages that differ, including system-call stubs written at runtime
- [Protected module views](analysis/protected-module-views/README.md): two views per protected module and no-access pages
- [Workflow and unresolved questions](reports/workflow.md)

Builds observed: runtime.dll timestamp `0xFDE6C135` (SizeOfImage `0x3D56000`), preloader.dll `0xA0CF546E`, game.dll `0x6AD7C05D`, helldivers2.exe `0x6AD78C0D`. The timestamps are not dates. All observations are under Proton on Linux; the Windows load path is static interpretation only. Absolute addresses are session witnesses. No upstream source, symbols or product name for the protection is claimed.
