# Neverlose GUI — Akiwave Edition v5.1

Roblox Luau **UI Library**, built on the original 4lpaca Neverlose.cc library (MIT). Preserves its window, tab, section and control APIs.

> **Preview:** The library passed source-level checks but has not yet been tested in Roblox for this exact release.

## Changes in v5.1

- Removed all anime pictures, wallpapers, portrait widgets and remote image downloads.
- Kept seven **color-only** presets, including Marin Monochrome, Gojo Violet, Frieren Forest, Zero Two Crimson, Nezuko Sakura and Cyberpunk Neon.
- Replaced the nonworking Settings gear overlay with a directly clickable `TextButton.Activated` control (mouse and touch).
- Rebuilt Theme Settings with two pages: **COLOR PRESETS** and **SETTINGS**.
- Settings supports custom accent HEX, transparency buttons, saving a theme and confirmed **Unload GUI**.
- Previously saved anime artwork fields are ignored, so old presets do not bring images back.
- Reloading the library attempts to unload its previous instance, which helps when the previous gear is inaccessible.

## Installation / usage

```lua
local UI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/siaza805/neverlose-akiwave-edition/main/source.luau"
))()
UI:SetTheme("Gojo Violet")

local Window = UI:CreateWindow({
    Name = "AKIWAVE", Content = "Library demo",
    Size = UI.Scales.Default, Keybind = "Insert"
})
local Main = Window:AddTab({Name = "Main", Icon = "gear", Type = "Double"})
local Section = Main:AddSection({Name = "Features", Position = "left"})
Section:AddLabel("Enabled"):AddToggle({
    Default = false, Callback = function(value) print(value) end
})
Window:SetRender(true)
```

Or run [examples/showcase-standalone.luau](examples/showcase-standalone.luau) for a one-file UI showcase.

## How to open Settings

Use the **gear at the top-right of the GUI**, or click the current-theme badge beside it. Select **SETTINGS** in the dialog. Choose an accent, opacity, save a theme, or click **UNLOAD GUI** twice within 5 seconds to close only this library's UI.

`Window.OpenSettings()` is available as another entry point if a particular executor does not dispatch clicks normally.

## Compatibility notes

The Library itself has no anime image download dependencies. Native File API support varies by executor; saving presets persistently requires file functions. The v5.1 interface is statically checked, not yet certified on every Roblox runtime.

## Credits and license

Original Neverlose.cc UI Library by **4lpaca**, derived from [j1scxxz-sketch/neverlose-ui-mod](https://github.com/j1scxxz-sketch/neverlose-ui-mod). Licensed under the MIT license in [LICENSE](LICENSE). Independent community modification.
