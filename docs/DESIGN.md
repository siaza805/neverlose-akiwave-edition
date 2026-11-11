# Akiwave v5 — design system

The original Neverlose layout is preserved: script-defined left navigation, top bar, two-column sections and controls.

## Research → implementation
- **Fluent:** transparency is an optional setting. Akiwave defaults to an almost opaque frame (3.5%) with a 0–35% adjustment instead of forcing the game to bleed through controls
- **Linoria:** independent scrolling for groupboxes and tabs. Akiwave keeps its existing scroll-based section API and reserves nonoverlapping space for anime artwork
- **WindUI:** legible hierarchy and adaptive UI. Akiwave uses a theme badge, accent line, semantic palette and hides the art card on short windows

## Portrait and wallpaper
- Sidebar portrait dock: 147 px tall, 12 px side insets, above the account footer
- Dedicated sidebar art does not cover script-defined toggle/slider/dropdown controls
- Background and Right artwork modes add a small right-pane watermark, with strength capped at 14% of the requested image opacity
- On windows below 415 px tall, the portrait is hidden and navigation takes the available space
- Artwork is loaded from HTTPS to executor disk, then mapped via getcustomasset or equivalent; Roblox asset fallbacks remain available

## Runtime
- Preserve all existing public Neverlose window, tab, section and control APIs
- Keep Settings → Unload GUI confirmation (two clicks / five seconds)
- Restore theme pane opacity after opening tweens so readability survives repeated show/hide
- Theme Studio: Presets, Appearance, Artwork and Settings

Design concept: https://www.figma.com/design/6ohKDtklDuNLTJfj4VRBJh

**Preview**: static checks performed; manual Roblox/runtime visual QA still pending.
