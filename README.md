# Neverlose GUI — Akiwave Edition v5.3

**A reusable Roblox Luau UI Library** based on the original Neverlose.cc UI Library by 4lpaca (MIT). Refined dark interface, seven **color-only** themes, one Settings panel, and a fixed draggable window. **No anime artwork is downloaded or displayed.**

> **v5.3 preview:** Static source checks completed. Actual GUI behavior should still be verified in your Roblox client/executor.

## Improvements in v5.3

- **Fixes upward drift:** drag uses direct pointer delta from a fixed starting position instead of spawning a Tween on every mouse movement.
- **Click ≠ drag:** movement begins only after 6px of pointer motion. Release ends the gesture; the window stays inside the viewport.
- **Better layout:** differentiated header surface, sidebar accent rail, active tab indicator, wider navigation, section heading rails, clean 37px control rows, spaced two-column cards.
- **Color-rich presets:** the Theme Studio displays real palette swatches; current theme badge is easier to read.
- **Preserves the Neverlose API:** no new mandatory arguments, existing toggles/sliders/dropdowns/configs and two-click Settings → **Unload GUI** remain.

## v5.3 — Fixes for real hub layouts

- Long titles such as `AKIWAVE / KING LEGACY V6` now display a fixed brand and subtitle above the scrolling sidebar.
- `Section:AddLabel(text)` uses the **full card width** when there is no control. Long labels wrap and the row grows automatically.
- Rows with Toggle, Slider or Dropdown reserve the **actual widget width**, not a fixed 144px.
- `handle:SetText(text)` remeasures live status text; Section heights update without competing tweens.
- Section surfaces, borders and headings use current preset colors. Sidebar tab titles do not overflow.
- The GUI remains a color-only library, with Settings, Unload, and the existing API intact.

**Important:** If the game-specific hub script itself shortens strings with literal `...`, the library cannot recover the missing text. That truncation must be removed from the hub script.

## Quick start

```lua
local UI = loadstring(game:HttpGet(
    'https://raw.githubusercontent.com/siaza805/neverlose-akiwave-edition/main/source.luau'
))()

UI:SetTheme('Gojo Violet')
local Window = UI:CreateWindow({
    Name = 'My Hub',
    Content = 'Akiwave Edition',
    Size = UI.Scales.Default,
    Keybind = 'Insert',
    ConfigFolder = 'AkiwaveConfigs'
})
Window:AddSectionLabel('WORKSPACE')
local Tab = Window:AddTab({Name = 'Main', Icon = 'house', Type = 'Double'})
local Section = Tab:AddSection({Name = 'GENERAL', Position = 'left'})
Section:AddLabel('Enabled'):AddToggle({
    Default = true,
    Callback = function(enabled) print('Enabled:', enabled) end
})
Window:SetRender(true)
```

**The pure library does not create any demo tabs or windows by itself.** To see a complete example, use [examples/showcase.luau](examples/showcase.luau) after loading the library, or run [examples/showcase-standalone.luau](examples/showcase-standalone.luau) as a single script.

## Settings and themes

Click the top-right gear or theme badge → **COLOR PRESETS** / **SETTINGS**. Themes include Neverlose Default, Marin Monochrome, Gojo Violet, Frieren Forest, Zero Two Crimson, Nezuko Sakura and Cyberpunk Neon. These are **color names only**, with no character art.

In Settings you can set a custom HEX Accent, choose window transparency (0–30%), save a theme when File API is supported, and click **UNLOAD GUI twice** to remove the UI.

## Manual drag regression test

1. Click empty content without moving: **no window movement**.
2. Hold mouse on top header, move less than six pixels: **no movement**.
3. Drag the header more than six pixels: **smooth, direct movement with no jitter**.
4. Drag to top, bottom, left and right screen edges: **window stays inside viewport**.
5. Release, then click empty space ten times: **no cumulative upward drifting**.
6. Click the Settings gear and the Theme Studio close button: **no unintended dragging**.
7. Toggle Insert, change themes, and repeat; verify mouse and touch if available.

These require a real Roblox runtime and are **not yet marked as passed** by the project maintainer.

## Public API and compatibility

Retains `UI:CreateWindow`, `Window:AddTab`, `Tab:AddSection`, `Section:AddLabel(...):AddToggle/AddSlider/AddDropdown/AddColorPicker`, `Window:SetRender`, `UI:SetTheme`, `UI:GetTheme`, `UI:CreateThemeManager`, and others. File API support varies by executor: without it, theme persistence is session-only. Always unload an older copy before loading a new version.

## Credits

Original library **4lpaca**, derived from [j1scxxz-sketch/neverlose-ui-mod](https://github.com/j1scxxz-sketch/neverlose-ui-mod). MIT license in [LICENSE](LICENSE). Unofficial community project.
