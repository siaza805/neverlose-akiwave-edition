# Akiwave Edition v5.1 — Design notes

- Compact, dark Neverlose-inspired window with original sidebar and two-column sections
- Presets affect color roles only; images and external artwork are entirely disabled
- Top-right Settings gear is a direct `TextButton` with `Activated` (mouse + touch), not a TextLabel overlay
- Theme Settings has two pages: preset grid and essential settings
- Settings: custom accent color in hexadecimal, preset window opacity choices, theme save, two-step unload
- Responsive dialog via `UIScale`, preserving original library's public API
- Old image settings are sanitized during import and active-theme restore
- Runtime verification in Roblox is still required
