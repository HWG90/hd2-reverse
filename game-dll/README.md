# game.dll and engine research

Helldivers 2 code captures, disassembly and findings.

| Directory | Contents |
|---|---|
| [artifacts](artifacts/) | Merged capture, page coverage, provenance and bounded derived inputs |
| [artifacts/live-captures](artifacts/live-captures/README.md) | Whole-image live captures (2026-10-25) and their page deltas |
| [triage](triage/) | Historical comparisons, field maps and readback observations |
| [analysis](analysis/) | Focused investigations, disassembly and scripts |
| [tools/capture](tools/capture/) | Original LLtM capture/merge source; `pack.py` and `rebuild.py` for live captures |
| [reports](reports/) | Workflow, hypotheses, environment and migration receipts |

## Cases

- [Recovery series comparison](analysis/recovery-series-comparison/README.md)

- [Material setter decompilation](analysis/material-setter-decompilation/README.md)

- [Weapons](analysis/weapons/README.md)
- [Materials and wind](analysis/materials/README.md)
- [Resolved engine callbacks](analysis/engine-callbacks/README.md)
- [Capture comparisons](analysis/capture-comparison/report.md)
- [Historical disassembly](analysis/disassembly/README.md)
- [Workflow and unresolved questions](reports/workflow.md)

The merged image is a time-composite, not an original on-disk DLL. Unknown pages are zero-filled and tracked; captured pointers are not current live pointers. Reports retain their original snapshot scope. No upstream source, original symbols or complete GPU binding implementation is claimed.
