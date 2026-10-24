# New game.dll capture findings

Compared 21:48 capture with 21:42 capture, then checked the gained pages against the older Linux HD2 research image.

## Coverage

- Same module image size and build: 54,009,856 bytes, timestamp 0x6AD7C05D.
- 728 additional readable 4-KiB pages: 2,981,888 bytes (2.84 MiB), all in .text.
- No previously readable pages became inaccessible.
- 2,693 pages remain inaccessible: 11,030,528 bytes.
- 71 previously readable pages changed; all are in .data. Shared readable .text pages are unchanged.
- 694,184 additional linear-decoded instructions, subject to embedded-data and boundary limitations.

## What is actually new to our prior research

688 gained pages are byte-for-byte identical to the older research dump. Forty pages (160 KiB) differ, with 163,180 changed bytes; none of those differences are explained by the prior image's DIR64 relocations. Their mean byte entropy drops from 7.955 to 5.994 bits/byte, and undecodable bytes fall from 8,914 to 83. This strongly suggests previously encoded/protected content is now visible as ordinary code; this is an inference, not a recovered encryption design.

Newly usable instruction references include:

| Instruction RVA | Referenced existing string | Interpretation |
|---|---|---|
| 0xC3B6F8 | generate_extraction_locations | Mission generation / extraction-location placement, not extraction countdown |
| 0xC3B363 | place_the_objective_missions | Objective-placement generation |
| 0xC50EFB | generate_outpost_locations | Outpost-generation stage |
| 0x130D71C | set_pending_close(%s) | UI presenter close handling |
| 0x139E170 | ui.MenuLoad | Menu routing / registration candidate |
| 0x139E300 | ui.MenuJoin | Menu routing / registration candidate |
| 0x139E490 | ui.MenuBindings | Menu routing / registration candidate |
| 0x1470639 | nui_ship_name | Ship-name UI reference |

These strings were already present in readable data. Their instruction references are newly usable compared with the prior research image. Labels describe observed references, not recovered function names or validated callable APIs.

The exception-directory entry still points outside the image and .pdata is still zero-filled. No function-boundary metadata was recovered. No verified extraction-countdown, Hover Pack spawn, or package-loader implementation was established by this comparison.

## Files

- summary.json: coverage and prior-research comparison.
- new-code-details.json: entropy, exact page RVAs, instruction-to-string references.
- newly-readable.asm: all pages newly readable since 21:42.
- new-to-research.asm: only the 40 pages differing from the older research capture.
- compare.py / inspect_new.py: reproducible analysis.
