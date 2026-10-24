# game.dll and engine research

Evidence-driven Helldivers 2 reverse engineering with REA and Ghidra.

| Directory | Contents |
|---|---|
| [artifacts](artifacts/) | Merged capture, page coverage, provenance and bounded derived inputs |
| [triage](triage/) | Historical comparisons, field maps and readback observations |
| [analysis](analysis/) | Focused investigations, disassembly and scripts |
| [tools/capture](tools/capture/) | Original LLtM capture/merge source |
| [reports](reports/) | Workflow, hypotheses, environment and migration receipts |

## Cases

- [REA decompiler validation](analysis/rea-material-setter/README.md)

- [Weapons](analysis/weapons/README.md)
- [Materials and wind](analysis/materials/README.md)
- [Resolved engine callbacks](analysis/engine-callbacks/README.md)
- [Capture comparisons](analysis/capture-comparison/report.md)
- [Historical disassembly](analysis/disassembly/README.md)
- [Workflow and unresolved questions](reports/workflow.md)

The merged image is a time-composite, not an original on-disk DLL. Unknown pages are zero-filled and tracked; captured pointers are not current live pointers. Reports retain their original snapshot scope. No upstream source, original symbols or complete GPU binding implementation is claimed.
