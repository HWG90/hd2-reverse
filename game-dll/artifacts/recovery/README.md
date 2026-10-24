# Cumulative game.dll recovery

Captures run every two minutes while exactly one game process is running and LLtM is idle. Capturing uses protected reads inside the game, spread across frames. No memory protections are changed.

Each build/base pair has its own folder:

- game-merged.bin: first successfully read version of each page.
- coverage.json: per-page capture provenance, source hashes and totals.
- missing-pages.txt: pages not captured yet.
- capture archives: gzip originals retained whenever a capture adds pages. Captures adding nothing retain their receipt/log/report but their raw bytes are discarded.

This is a composite captured over time, not a coherent process snapshot. Readable does not prove decrypted. Unknown pages remain zero-filled and explicitly identified. Different module bases/builds are never merged.

Run manually: `python3 /home/goose/Documents/ChatGPT/GooseGadgets/relay-tools/recover_game.py`.
The script takes the existing shared driver lock and defers when another command is running. The app heartbeat schedules subsequent attempts. Closing the game pauses capture work automatically; checks continue for a later session.
