# Neverlose GUI — Akiwave Edition

A reusable **Roblox Luau UI Library** based on the original Neverlose.cc UI Library (4lpaca; MIT). Preserves its window/tab/section/control API while adding anime presets, live color changes and a customizable Theme Studio.

> **v5.0.0 preview.** Source is structurally reviewed, but has not been runtime-verified on every executor. Third-party Roblox artwork might be restricted in individual experiences.


## v5 redesign — actual research applied

This version does **not** rebuild Neverlose as another standalone UI. It refines the existing library while preserving your own tabs and two-column sections.

| Research reference | Pattern adopted in Akiwave |
|---|---|
| [Fluent](https://github.com/dawid-scripts/Fluent) | Optional transparency kept separate from color palettes: nearly-opaque default and a safer 0–35% window transparency range |
| [Linoria](https://github.com/violin-suzutsuki/LinoriaLib) | Scrollable sidebar, groupboxes and sections; a reserved portrait area never blocks navigation entries |
| [WindUI](https://footagesus.github.io/WindUI-Docs/) | Dark readable surfaces, restrained accents, adaptive layout; art card hides on short windows |

**What changed visually:** anime art now appears in a dedicated **sidebar portrait card** with a dark caption gradient, above the account footer. Clicking it opens Theme Studio. The content area uses only a bounded, faint watermark (at most 14% of the configured art opacity). No bright wallpaper covering toggles or dropdowns. The window itself defaults to 3.5% transparency, so text remains legible over bright Roblox maps. An accent line and **current-theme badge** appear in the header.

The main window now defaults to **808 × 546**. The portrait dock is reserved only when an image is enabled and the window height allows it; long sidebar tab lists can still scroll.

> Old saved themes may retain their earlier transparency value. After updating, use **Appearance → Window Transparency** and set it to around **0–10%** if your UI still looks washed out.

## Features

- Sidebar, header, two-column sections, toggles, sliders, dropdowns and color pickers retain the Neverlose structure.
- Settings gear opens a single Theme Studio with **PRESETS / APPEARANCE / ARTWORK / SETTINGS** views — no extra sidebar category.
- Seven themes: Neverlose Default, Marin Monochrome, Gojo Violet, Frieren Forest, Zero Two Crimson, Nezuko Sakura and Cyberpunk Neon.
- Palette recoloring of existing widgets, coherent surfaces, theme-aware chrome and a configurable glass-style window transparency.
- Six anime presets now include direct **HTTPS PNG/JPEG artwork URLs**. The library downloads image bytes, caches files and converts them using `getcustomasset` when supported. Roblox asset IDs remain fallbacks.
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
2. **Appearance:** change HEX colors, harmonize the palette and adjust window transparency up to 35%.
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
    WindowTransparency = 0.035
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

## External image URLs — v5

The library cannot assign `https://...` directly to `ImageLabel.Image`. It calls an executor HTTP function (`request` or `game:HttpGet`), validates PNG/JPEG bytes (up to 6 MB), writes them under `AkiwaveArtworkCache/`, then obtains an asset URI through `getcustomasset` or `getsynasset`. Cached files avoid repeated downloads.

To use your own image:

```lua
UI:SetTheme({
    Name = "My URL Theme",
    Palette = {Accent = "#D1BDFF"},
    Image = {
        Enabled = true,
        Asset = "https://example.org/my-image.png",
        Opacity = 0.55,
        Position = "Right",
        Scale = 100,
        OffsetX = 0, OffsetY = 0
    }
})
```

The HTTPS image feature requires **actual filesystem APIs + `getcustomasset`**. Executors with only HTTP access cannot display arbitrary external files in Roblox `ImageLabel`. Without custom-asset support the library attempts the preset's Roblox Asset ID; such fallbacks may also be blocked by the experience. Check `UI.Akiwave.RemoteArtwork.Supported`. You can run [the artwork diagnostic](examples/artwork-test.luau).

Direct CDN links can be blocked, changed, removed, or restricted by their hosts. The library does not bundle third-party pictures, and the source-code license does not grant rights to those pictures.

## Built-in artwork sources

Artwork is linked, not bundled. Each preset uses an external HTTPS image URL first and a Roblox Creator Store decal ID second. Either source may fail or change; **visibility is not guaranteed**. Use a hosted image you have permission to use for redistribution.

| Preset | Fallback Roblox decal |
|---|---|
| Marin Monochrome | [Marin Kitagawa](https://create.roblox.com/store/asset/14412105393) |
| Gojo Violet | [Gojo Satoru](https://create.roblox.com/store/asset/16928679461) |
| Frieren Forest | [Frieren](https://create.roblox.com/store/asset/15148085308) |
| Zero Two Crimson | [Zero Two](https://create.roblox.com/store/asset/5223216506) |
| Nezuko Sakura | [Nezuko](https://create.roblox.com/store/asset/7068439603) |
| Cyberpunk Neon | [Edgerunners artwork](https://create.roblox.com/store/asset/89736843413939) |

**Marin Monochrome** refers to the UI's monochrome palette; the source decal itself may be colored.

## Remote preset image references

The following third-party HTTPS URLs are *referenced* by the preset configurations (no binary images are stored in this repository). Their availability and licensing are outside this project's control:

| Preset | External host / reference |
|---|---|
| Marin Monochrome | [Anime Icons / Rafled CDN](https://anime-icons.com/picture/26) |
| Gojo Violet | [Wallpics](https://wallpics.app/profile-picture/1433) |
| Frieren Forest | [Anime Icons / Rafled CDN](https://anime-icons.com/picture/26246) |
| Zero Two Crimson | [PFP Town](https://pfptown.com/zero-two-pfp) |
| Nezuko Sakura | [PFP Town](https://pfptown.com/nezuko-pfp) |
| Cyberpunk Neon | [UHD Paper](https://www.uhdpaper.com/2022/05/lucy-cyberpunk-edgerunners-4k-6381i.html) |

These sources may show copyrighted anime characters or unlicensed fan art. **The MIT license applies to code only, not third-party images.** For redistribution, substitute images you own or have permission to use.

## Compatibility & limitations

- Roblox Luau, local UI APIs and permissions vary between clients and executors. No specific executor is guaranteed.
- No File API? Theme changes work during the session, but custom theme files will not persist, and HTTPS images cannot be converted into Roblox custom assets.
- Always unload an older copy before running a newer one to avoid duplicate UIs. `loadstring(game:HttpGet(...))()` fetches the current GitHub source.
- This library contains UI elements, not game-specific features or anti-cheat bypasses.

## License and credits

Original **Neverlose.cc UI Library** by **4lpaca**; [source fork](https://github.com/j1scxxz-sketch/neverlose-ui-mod). Changes are distributed under the MIT license (see [LICENSE](LICENSE)). Independent community modification; not endorsed by Roblox, Neverlose or any anime rightsholder.

Figma design concept: https://www.figma.com/design/6ohKDtklDuNLTJfj4VRBJh
