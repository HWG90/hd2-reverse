# hd2-reverse

Helldivers 2 reverse engineering. Captured code, offsets, call paths and unresolved questions.

Start with [game-dll](game-dll/README.md). The protection runtime and its loader are in [runtime-dll](runtime-dll/README.md). Findings distinguish decoded instructions, static interpretations and live observations.

| Folder | Module |
|---|---|
| [game-dll](game-dll/README.md) | game.dll: captures, disassembly and findings |
| [runtime-dll](runtime-dll/README.md) | runtime.dll protection runtime and its loader |
| [helldivers2-exe](helldivers2-exe/README.md) | helldivers2.exe |
| [preloader-dll](preloader-dll/README.md) | preloader.dll |
| [wwise-plugin-dll](wwise-plugin-dll/README.md) | wwise_pluginw64_release.dll |
| [level-generation-plugin-dll](level-generation-plugin-dll/README.md) | level_generation_pluginw64_release.dll |

Only the game's own modules are published; mod DLLs and third-party SDK DLLs (DLSS, XeSS, FSR, EOS, Steam API, Bink, DirectStorage, PlayFab, PIX, libcurl) are not.
