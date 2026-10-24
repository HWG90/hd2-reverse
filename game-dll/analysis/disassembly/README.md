# game.dll readable-code disassembly

Source: `game-live-20261023T2142.bin`, SHA256 `1479b7237486e57d67a828eea9fc48374e817542ec61c177d5e88d426c567b9d`.

- `text.asm`: Intel-syntax x86-64 disassembly, 4,840,242 instructions.
- `text.asm.gz`: compressed copy of the same listing.
- `functions.csv`: 0 candidate function ranges from readable x64 unwind records.
- `summary.json`: section ranges, byte counts, bases and limitations.
- `disassemble_dump.py`: reproducible parser and disassembler.

Decoded 19,116,032 readable executable bytes; skipped 14,012,416 protected bytes. Every skipped page is marked as an UNREADABLE GAP; zero-filled dump holes were never decoded.

Addresses on listing lines are RVAs. Add actual base `0x6ffff0870000` for addresses in the captured process. The listing uses mapped-image layout, not original PE disk offsets.

The exception directory points outside the image; function labels use the `.pdata` section instead. No valid function ranges were recoverable from that section; `functions.csv` contains only its header. No function labels or original symbols were recovered. Linear decoding can interpret embedded data as instructions; `.byte` denotes bytes that did not decode. This is disassembly, not decompiled source.
