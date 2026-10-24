# REA material setter analysis

REA 6.7.0 / Ghidra 12.1.2 completed a scoped native function analysis at VA `0x140503C00` on the immutable 198-byte live witness. Full Evidence is in `function.evidence.json`; generated pseudocode is in `scalar.pseudocode.c`. Input is `../../artifacts/derived/exe-material-scalar.raw`, SHA256 `81891bd92471d211ef6a41451bf5c79a691093d053b90bc36d20888947446820`. Source: the `0x140503C00` CODE receipt in `../engine-callbacks/engine-setters-live.log`, first `0xC6` bytes.

The decompiler exposes validation and command-record construction, consistent with the assembly. Its raw x64 profile uses the GCC calling convention; this Windows function consequently receives misleading `param_7`/XMM artifacts. Do not treat its signature as a callable API. The indirect allocator/queue consumer is not resolved by this slice. No target was executed.

Reproduce with the installed CLI:

```sh
GHIDRA_INSTALL_DIR=/opt/ghidra rea function ../../artifacts/derived/exe-material-scalar.raw 0x140503c00 --target-format raw-binary --architecture x86_64 --entry-point 0x140503c00 --provider ghidra --format json
```

Run from this directory. The dependency and provider versions are recorded in the Evidence; source bytes must retain the recorded hash.
