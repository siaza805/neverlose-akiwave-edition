# Changelog

## v5.3.0 — 2026-11-11 (preview)

- Long hub names render in a dedicated stationary brand/subtitle header
- Dynamic multi-line labels use full available width and adjust row height
- Widgets reserve only their measured horizontal space
- Live status updates reflow deterministically, avoiding Section height Tween stacking
- Theme-aware Section backgrounds, borders and titles
- Fixed selected sidebar item's label bounds
- Preserves original APIs, Settings, Unload and color-only presets
- Still requires validation in actual Roblox clients


## v5.2.0 — 2026-11-11 (preview)

- Replaced Tween-per-input-event dragging with direct pointer delta, preventing cumulative offset and animation races
- Six-pixel drag threshold, viewport clamping, touch/mouse end handling, and cleanup on destruction
- Reserved Settings/Close header areas to avoid dragging from interactive controls
- Refined sidebar/header/section card hierarchy, active-tab rail, spacing, action rows and color-preset swatches
- Kept seven color-only themes, original Neverlose API and confirmed two-click Unload GUI
- Static checks passed; runtime/executor validation pending

## v5.1.0 — 2026-11-11 (preview)

- Removed all anime artwork, wallpapers and remote image loading
- Fixed Settings gear as a real TextButton with Activated
- Rebuilt Settings panel, color-only presets and two-step Unload
