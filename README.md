# Neverlose GUI — Akiwave Edition

**A customizable Roblox Luau UI library** built as a visual refinement of the Neverlose.cc UI Library (4lpaca). Intended as a reusable UI layer for scripts, not a ready-made game feature script.

> **Status:** v3 design update / preview. Static checks completed; not yet verified in every Roblox runtime or executor. Built from a version already displayed successfully by the project user.

## Features

- Neverlose-style left navigation, compact top bar, rounded windows and two-column sections
- Improved typography, larger tab and toggle hit areas, section cards and spacing
- Theme Studio accessed with the **gear icon** at the top-right of the window; **no extra sidebar category**
- 7 presets: Neverlose Default, Marin Monochrome, Gojo Violet, Frieren Forest, Zero Two Crimson, Nezuko Sakura, Cyberpunk Neon
- Runtime theme switching via `UI:SetTheme('Marin Monochrome')`
- Custom colors; optional user-defined Roblox image assets, position, opacity, offsets and scale
- Export/import JSON; optional file-based custom preset saving when the runtime supports the complete file API
- Original API shape (`CreateWindow`, `AddTab`, `AddSection`, `AddLabel`, `AddToggle`, `AddSlider`, `AddDropdown`, etc.) retained

## Installation / การติดตั้ง

**Run `source.luau` first.** It returns the library and also exposes `getgenv().AkiwaveUI` for executors that don't use the chunk's return value. Running the library alone does **not** show a demo window. Use `examples/showcase.luau` for a separate example.

```lua
local UI = (getgenv and getgenv().AkiwaveUI)
assert(UI, 'Please run source.luau first')
UI:SetTheme('Marin Monochrome')
local Window = UI:CreateWindow({
    Name = 'My Hub',
    Content = 'Akiwave Edition',
    Size = UI.Scales.Default,
    Keybind = 'Insert',
    ConfigFolder = 'MyHubConfigs'
})
local Tab = Window:AddTab({Name='Main', Icon='gear', Type='Double'})
local Section = Tab:AddSection({Name='FEATURES', Position='left'})
Section:AddLabel('Enable feature'):AddToggle({
    Default = false,
    Callback = function(enabled) print('Enabled:', enabled) end
})
Window:SetRender(true)
```

Alternatively, load from GitHub directly:

```lua
local UI = loadstring(game:HttpGet('https://raw.githubusercontent.com/siaza805/neverlose-akiwave-edition/main/source.luau'))()
```

This is the raw URL for this public repository.

### Running the full example

1. Execute `source.luau`, then `examples/showcase.luau` in the same session.
2. Or execute `examples/showcase-standalone.luau` once (library + example bundled into one test file).
3. Click the **gear** icon to open Theme Studio. Select a preset card; visual changes apply immediately.
4. Press **Insert** to toggle the main window (the exact behavior can depend on executor input support).

## API reference

| API | Purpose |
|---|---|
| `UI:CreateWindow(config)` | Create a window |
| `Window:AddTab(config)` | Add navigation tab |
| `Window:AddSectionLabel(name)` | Group nav labels |
| `Tab:AddSection({Name, Position})` | Left/right card |
| `Section:AddLabel(text):AddToggle(config)` | Toggle |
| `Section:AddLabel(text):AddSlider(config)` | Slider |
| `Section:AddLabel(text):AddDropdown(config)` | Dropdown |
| `Section:AddLabel(text):AddColorPicker(config)` | Color picker |
| `Section:AddButton(config)` | Button |
| `UI:SetTheme(nameOrTheme)` | Change active theme |
| `UI:GetTheme()` | Retrieve active theme data |
| `UI:CreateThemeManager()` | Theme UI manager (`.SetRender(true)`) |
| `UI.Akiwave.SaveTheme(name)` | Save theme, if persistent File API available |
| `UI.Akiwave.ImportTheme(json)` / `.ExportTheme()` | Share theme JSON |

Refer to the original source and `examples/showcase.luau` for complete control options. Not every executor supports all underlying Roblox/third-party APIs.

## Anime pictures / ภาพอนิเมะ

The preset names and color palettes ship without copyrighted character images. To add art, input an accessible Roblox asset ID in the Theme Studio and enable images. Ensure you have permission to use any artwork. A missing or inaccessible asset won't render.

## Compatibility and limitations

- Requires Roblox Luau and a runtime able to create local UI (`Instance`, `game:GetService`, etc.).
- Runtime-specific file, hidden-GUI, clipboard and asset APIs are best-effort; no guarantee for any particular executor.
- On runtimes without native file APIs, `UI.Runtime.StorageMode` is `session-memory`; **custom theme files do not persist between sessions**.
- Mobile: Theme Studio uses adaptive scaling; the original library may still need device-specific tuning.
- Not tested on all clients, devices or executors. Please report a reproducible issue and error trace.

## Design reference

Figma concept: https://www.figma.com/design/6ohKDtklDuNLTJfj4VRBJh

## Credits and license

Original Neverlose.cc UI Library by **4lpaca**, source fork: https://github.com/j1scxxz-sketch/neverlose-ui-mod. MIT-licensed source; this repository preserves attribution and distributes changes under the MIT license. UI updates and anime preset customization: Akiwave Edition.

> This is an independent community modification and is not affiliated with the Neverlose brand or anime rightsholders.