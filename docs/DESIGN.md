# Akiwave Edition — Design system (v4.1)

The original Neverlose layout is preserved: script-defined sidebar tabs, two-column sections, and the built-in header controls. No extra theme-related sidebar categories are added.

## Tokens
- Palette roles: Accent, Background, Surface, Panel, Card, Control, ControlAlt, ControlDark, Border, Text and muted text shades
- Main window rounded shell and subtle accent border
- Glass transparency: configurable WindowTransparency 0–0.65 (default about 0.21)
- Artwork is parented into the actual content layer to avoid occlusion behind the opaque pane
- Live color binding updates existing UI controls when changing presets

## Theme Studio
- One floating panel launched from the original settings gear
- PRESETS: live selected theme hero + two-column anime art swatches
- APPEARANCE: HEX inputs, harmonized surfaces and window transparency
- ARTWORK: input asset ID, live preview, visibility toggle, background/left/right position, alpha/scale/offset controls
- SETTINGS: saved themes, JSON import/export and two-click Unload GUI

Presets use remote HTTPS PNG/JPEG URLs; executors with complete local file APIs and getcustomasset can convert cached images for UI display. Roblox Creator Store asset IDs remain fallbacks. Artwork files are not bundled and third-party image copyrights remain with their owners.

Design concept: https://www.figma.com/design/6ohKDtklDuNLTJfj4VRBJh
