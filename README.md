# Alan Wake (2010) - Low-end PC performance setup

A small, reversible performance pack for the original PC version of Alan Wake.

Made with an Intel UHD 620-class laptop in mind. The aim is to reduce the game's rendering load and launch it with documented command-line options, without replacing game files or applying risky Windows tweaks.

## Target laptop

- Dell Latitude 7290
- Intel Core i5-8350U
- 16 GB RAM
- Intel integrated graphics (typically Intel UHD Graphics 620)

The original game lists a dedicated DirectX 10 graphics card in its minimum requirements. Integrated graphics may run it, but performance will depend heavily on cooling, memory configuration, drivers and the scene. No fixed FPS is promised.

## Included

```text
alan-wake-2010-performance-pack/
├── README.md
├── LICENSE
├── .gitignore
├── launchers/
│   ├── Launch-Alan-Wake-720p.bat
│   ├── Launch-Alan-Wake-540p.bat
│   └── Launch-Alan-Wake.ps1
└── settings/
    └── recommended-settings.txt
```

## Install

1. Download and extract this pack.
2. Copy the contents of the `launchers` folder into the folder containing `alanwake.exe`.
3. Keep the `settings` folder somewhere convenient, or copy it beside the game too.
4. Double-click `Launch-Alan-Wake-720p.bat` to try 1280x720.
5. If performance is still too low, try `Launch-Alan-Wake-540p.bat` for 960x540.

The launcher uses the game's documented `-w`, `-h`, `-window`, `-novsync` and `-showfps` command-line options. It does not patch the executable.

## Recommended in-game settings

Start with the lowest available graphics options:

- Resolution: 1280x720 (or use the 960x540 launcher)
- Anti-aliasing: Off
- Shadow quality: Low
- Post-processing / effects: Low
- Texture quality: Low or Medium; test both
- V-Sync: Off for the initial test
- Disable optional visual enhancements if the menu exposes them

Option names can vary slightly between game versions. Use the in-game options wherever possible.

## What the launchers do

- Start the game with a selected resolution.
- Use windowed mode so the game does not force a display mode change.
- Disable V-Sync for testing.
- Ask the game to show its FPS counter.
- Set the game process to Above Normal priority after launch, where Windows permits it.

They do not:
- Change registry settings.
- Disable Windows Defender or security features.
- Change your power plan.
- Modify or overwrite the game's configuration or save files.
- Install third-party DLLs or injectors.

## Configuration and saves

The original game stores its configuration under:

`%USERPROFILE%\Documents\Remedy\AlanWake\`

GOG and Epic versions may use separate folders:

- `%USERPROFILE%\Documents\Remedy\AlanWake_GOG_Version\`
- `%USERPROFILE%\Documents\Remedy\AlanWake_EGS_Version\`

The pack deliberately does not generate or overwrite an undocumented configuration file. Back up your own configuration folder before experimenting with settings.

## Laptop-specific tips

1. Play while plugged into the charger.
2. In Windows Settings, set Power mode to **Best performance** while plugged in.
3. Close browsers, launchers and other GPU-heavy programs before starting the game.
4. Keep the laptop vents clear and avoid playing on a bed or soft surface.
5. Use the latest stable graphics driver supported by Dell/Intel for your system.
6. If 720p still stutters, use the 960x540 launcher before reducing the resolution further.
7. Test the same scene for a few minutes after each change. Change one setting at a time.

## Troubleshooting

**The launcher says it cannot find alanwake.exe**

The launcher files must be in the same folder as `alanwake.exe`. If your executable has a different name or is in another folder, open `Launch-Alan-Wake.ps1` and edit `$GameExe`.

**The game opens but the resolution does not change**

Some versions may ignore command-line resolution switches. Set the resolution in the game's own launcher/options menu instead.

**The game is too small in windowed mode**

Use Windows display scaling or Magpie to scale the game window. Upscaling adds GPU work and may not improve frame rate.

**The game stutters even at 960x540**

The integrated GPU may be the limiting factor. Lower shadows/effects, close background apps and check temperatures. Avoid unofficial "FPS boost" registry packs.

## Credits and references

- [Alan Wake on Steam - system requirements](https://store.steampowered.com/app/108710/Alan_Wake/)
- [PCGamingWiki - Alan Wake](https://www.pcgamingwiki.com/wiki/Alan_Wake)

This is an independent community setup. Alan Wake and its assets belong to their respective rights holders.
