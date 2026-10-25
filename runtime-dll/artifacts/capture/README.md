# Live runtime.dll capture

One read-only capture of the whole runtime.dll image from inside the game, through LLtM. Each build/base pair has its own folder; this one is timestamp `0xFDE6C135` at base `0x700000000000`.

| File | Contents |
|---|---|
| `runtime-live-20261024T2310.bin.gz` | gzip (`-9 -n`) of the 64,315,392-byte capture in mapped-image layout (RVA = file offset) |
| `pages.txt` | base, size, stamp and unreadable pages (none) |
| `regions.txt` | VirtualQuery regions over the image at capture time |
| `receipt.json` | provenance: process, batches, hashes, timing |

The capture covers every page. 15,702 pages were read, none refused and none zero-filled. Raw sha256 `266b99f2d9d3dd47451d0cda369164807457520f0c8d1bb2327981cb1cf009c6`.

It is not an atomic snapshot. Four LLtM batches each read a quarter of the image over about four frames; the whole read took 1.6 s while the game ran. Pages can therefore come from slightly different moments. Readable does not prove decrypted: runtime.dll's own high-entropy data was read as stored (see [live vs disk](../../analysis/live-vs-disk/README.md)).

Reads were `ReadProcessMemory` on the game's own process, 4 KiB at a time, inside an LLtM `eval`. No memory protections were changed, no game function was called and nothing was written to game memory. runtime.dll has no loader entry, so its base was taken from `/proc/<pid>/maps` and confirmed against the header (MZ/PE, timestamp, SizeOfImage) before reading.

Run manually, with the game running and LLtM loaded: `python3 -I /home/goose/Documents/ChatGPT/GooseGadgets/relay-tools/dump_runtime_live.py`. It takes the shared LLtM driver lock. `--dry-run` prints the generated batches.
