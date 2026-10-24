# Material scalar setter

EXE VA `0x140503C00`, build `0x6AD78C0D`. Ghidra 12.1.2 decompiled the 198-byte live capture.

- Input: `../../artifacts/derived/exe-material-scalar.raw`
- SHA256: `81891bd92471d211ef6a41451bf5c79a691093d053b90bc36d20888947446820`
- Source: first `0xC6` bytes of the `0x140503C00` receipt in `../engine-callbacks/engine-setters-live.log`
- Output: `scalar.pseudocode.c` and `ghidra-observations.json`

The code validates the material object, allocates a command record and queues the scalar update. The generated signature is wrong: the raw x64 import uses a GCC convention against Windows code. `param_7` and XMM variables are decompiler artifacts. Use the assembly for register arguments.

The capture does not contain the queue consumer. No GPU binding or visual effect was validated. The observations JSON is a selected export, not the original analysis envelope.
