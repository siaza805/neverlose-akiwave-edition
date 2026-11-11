# Neverlose GUI — Akiwave Edition

A reusable **Roblox Luau UI Library** based on the original Neverlose.cc UI Library (4lpaca; MIT). Preserves its window/tab/section/control API while adding anime presets, live color changes and a customizable Theme Studio.

> **v4.0.0 preview.** Source is structurally reviewed, but has not been runtime-verified on every executor. Third-party Roblox artwork might be restricted in individual experiences.

## Features

- Sidebar, header, two-column sections, toggles, sliders, dropdowns and color pickers retain the Neverlose structure.
- Settings gear opens a single Theme Studio with **PRESETS / APPEARANCE / ARTWORK / SETTINGS** views — no extra sidebar category.
- Seven themes: Neverlose Default, Marin Monochrome, Gojo Violet, Frieren Forest, Zero Two Crimson, Nezuko Sakura and Cyberpunk Neon.
- Palette recoloring of existing widgets, coherent surfaces, theme-aware chrome and a configurable glass-style window transparency.
- Six anime presets reference Roblox Creator Store decal IDs, with a thumbnail fallback when images cannot load.
- Editable HEX colors, automatic palette harmonization, image ID, position, opacity, scale and X/Y offsets.
- JSON import/export, custom theme save/delete if native File API is present.
- **Unload GUI** inside Theme Studio → Settings, requiring two clicks within five seconds.
- Desktop and mobile scaling for the Theme Studio. Runtime-specific support is best-effort.

## Quick start

Execute the library, then create your own window. **Running source.luau alone does not create a demo UI.**

```lua
local UI = loadstring(game:HttpGet(
    'https://raw.githubusercontent.com/siaza805/neverlose-akiwave-edition/main/source.luau'
))()

UI:SetTheme('Marin Monochrome')

local Window = UI:CreateWindow({
    Name = 'My Hub', Content = 'Akiwave Edition',
    Size = UI.Scales.Default, Keybind = 'Insert',
    ConfigFolder = 'AkiwaveConfigs'
})
Window:AddSectionLabel('MAIN')
local Tab = Window:AddTab({ Name = 'Main', Icon = 'gear', Type = 'Double' })
local Section = Tab:AddSection({ Name = 'FEATURES', Position = 'left' })
Section:AddLabel('Enabled'):AddToggle({
    Default = false, Callback = function(value) print(value) end
})
Window:SetRender(true)
```

If you load the local `source.luau` file first, it also exposes `getgenv().AkiwaveUI` for scripts in the same session. For a more complete demo see [`examples/showcase.luau`](examples/showcase.luau).

## Theme Studio

Click the gear at the upper-right corner of your window.

1. **Presets:** preview and apply anime themes.
2. **Appearance:** change HEX colors, harmonize the palette and adjust window transparency up to 65%.
3. **Artwork:** supply your own Roblox image or decal asset ID, toggle visibility and adjust placement, opacity and size.
4. **Settings:** save/delete presets, import/export theme JSON, or click **Unload GUI** twice to remove the library UI. Unload does not close Roblox.

### Programmatic controls

```lua
UI:SetTheme('Gojo Violet')
print(UI:GetTheme().Name)
UI:CreateThemeManager().SetRender(true)

UI:SetTheme({
    Name = 'Custom Theme',
    Palette = {Accent = '#B5A0FA', Background = '#101019'},
    Image = {Enabled = true, Asset = 'rbxassetid://14412105393',
        Opacity = 0.55, Position = 'Right', Scale = 100, OffsetX = 0, OffsetY = 0},
    WindowTransparency = 0.22
})
```

## Public API

| Method | Description |
|---|---|
| `UI:CreateWindow(config)` | Create main window |
| `Window:AddTab(config)` | Add tab |
| `Window:AddSectionLabel(text)` | Sidebar heading |
| `Tab:AddSection({Name, Position})` | Left/right card |
| `Section:AddLabel(text):AddToggle(config)` | Toggle |
| `Section:AddLabel(text):AddSlider(config)` | Slider |
| `Section:AddLabel(text):AddDropdown(config)` | Dropdown |
| `Section:AddLabel(text):AddColorPicker(config)` | Color picker |
| `Section:AddButton(config)` | Button |
| `UI:SetTheme(nameOrData)` | Switch theme at runtime |
| `UI:GetTheme()` | Current theme as serializable data |
| `UI.Akiwave.ExportTheme()` / `.ImportTheme(json)` | Share JSON theme |

## Built-in artwork sources

Artwork is linked, not bundled. Images may be blocked by permissions, moderation, or Roblox decal/image ID differences; a thumbnail fallback is attempted, but **visibility is not guaranteed**. Use an asset you have permission to use if a preset image does not show.

| Preset | Decal listing |
|---|---|
| Marin Monochrome | [Marin Kitagawa](https://create.roblox.com/store/asset/14412105393) |
| Gojo Violet | [Gojo Satoru](https://create.roblox.com/store/asset/16928679461) |
| Frieren Forest | [Frieren](https://create.roblox.com/store/asset/15148085308) |
| Zero Two Crimson | [Zero Two](https://create.roblox.com/store/asset/5223216506) |
| Nezuko Sakura | [Nezuko](https://create.roblox.com/store/asset/7068439603) |
| Cyberpunk Neon | [Edgerunners artwork](https://create.roblox.com/store/asset/89736843413939) |

**Marin Monochrome** refers to the UI's monochrome palette; the source decal itself may be colored.

## Compatibility & limitations

- Roblox Luau, local UI APIs and permissions vary between clients and executors. No specific executor is guaranteed.
- No File API? Theme changes work during the session, but custom theme files will not persist.
- Always unload an older copy before running a newer one to avoid duplicate UIs.
- This library contains UI elements, not game-specific features or anti-cheat bypasses.

## License and credits

Original **Neverlose.cc UI Library** by **4lpaca**; [source fork](https://github.com/j1scxxz-sketch/neverlose-ui-mod). Changes are distributed under the MIT license (see [LICENSE](LICENSE)). Independent community modification; not endorsed by Roblox, Neverlose or any anime rightsholder.

Figma design concept: https://www.figma.com/design/6ohKDtklDuNLTJfj4VRBJh
