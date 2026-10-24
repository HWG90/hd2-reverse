# Recovery series comparison

Compared build `0x6AD7C05D` at bases `0x6FFFF0870000` and `0x6FFFF1300000`. Images remain separate.

| Measurement | Result |
|---|---:|
| Previous readable pages | 10,981 |
| New series readable pages | 9,627 |
| Readable in both | 9,626 |
| Newly readable in the new series | 1 |
| Present only in the previous series | 1,355 |
| Shared pages different before relocation normalization | 1,065 |
| Shared pages different after DIR64 normalization | 111 |

The new page is `.text` RVA `0x168C000`. It was missing from the previous cumulative image, but matches the older research dump byte-for-byte. It adds coverage to this comparison; it does not expose previously unseen implementation code. No printable string references were found in its linear disassembly. Its subsystem remains unidentified.

The relocation directory was readable and parsed completely: 98,687 DIR64 entries, base delta `0xA90000`. After normalization, all shared executable pages match. Remaining differences are 110 `.data` pages and one header/other page. These differences do not establish new code.

`previous_only_pages` describes coverage, not pages deleted by the game. The restarted session has not exposed those pages yet. The snapshots contain data from different times.

## Evidence

- `comparison.json`: input hashes, coverage counts and differing page RVAs.
- `previous.coverage.json`, `current.coverage.json`: snapshot provenance.
- `page-0x168c000.raw`, `page-0x168c000.asm`: newly readable page and linear decode. The page starts inside an existing function.
- `compare.py`: coverage comparison and DIR64 normalization.

Run `python3 compare.py PREVIOUS_SERIES CURRENT_SERIES OUTPUT_DIRECTORY` against mapped images and their coverage files. Both input hashes must match the coverage metadata. Different bases are compared, never merged. The older-research equality check and string-reference inspection are recorded in the result; the comparison script does not recreate those two follow-up checks.

## Follow-up: 34 additional pages

The new series increased from 9,627 to 9,661 readable pages. All 34 added pages match both the previous cumulative series and the older research image byte-for-byte. No relocation normalization was needed for these matches. No previously unseen code was exposed.

`incremental-comparison.json` records every added page RVA, SHA256, capture-source index and comparison result. `incremental.coverage.json` preserves the new snapshot provenance. The initial `current.coverage.json` remains the 9,627-page baseline.

Reproduce with:

```sh
python3 compare_incremental.py PREVIOUS_SERIES CURRENT_SERIES current.coverage.json OLDER_RESEARCH_IMAGE incremental-comparison.json
```

The script verifies both cumulative images against their coverage hashes. It compares only pages added since the baseline and does not modify or merge either series.
