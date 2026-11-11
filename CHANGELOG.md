# Changelog

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
