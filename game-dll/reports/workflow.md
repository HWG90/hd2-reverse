# Investigation workflow

1. Preserve immutable captures and hashes in `artifacts/`. Keep raw captures separate from derived slices.
2. Fingerprint and triage in `triage/`; record snapshot build, address space, coverage and limitations.
3. Analyze a focused hypothesis in `analysis/<case>/`, keeping evidence, scripts and interpretation together.
4. Analyze focused functions in Ghidra and retain the output. Record tool version, input hash, mapping and calling-convention limitations.
5. Use live observations only when needed and authorized; the game being absent does not authorize a launch.
6. Publish conclusions and unresolved boundaries in `reports/` and each case README. Refresh SHA256SUMS after changes.

This layout separates captured bytes from interpretation. Existing captures and analysis remain intact; old paths are recorded in `path-migration.json`.

## Current hypotheses

- Confirmed static/live bytes: material callbacks resolve to executable command setters.
- Strong static interpretation: queued records defer material changes. Queue consumer is unknown.
- Open: queue consumer -> render backend -> actual GPU shader/pipeline binding.
- Open: safe engine API signatures and observed visual effects. No live setter invocation has validated them.
- Weapon firing/reload semantics remain static candidates, despite concrete counter stores.

Unknown game.dll pages remain holes. Raw slices use explicit mapped addresses; The generic raw x64 convention is GCC, not proof of the Windows ABI. Treat inferred parameter names/signatures cautiously.
