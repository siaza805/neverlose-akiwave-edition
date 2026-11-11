# Changelog

## v4.1.0 — 2026-11-11 (preview)

- External HTTPS image URLs for 6 anime presets; Roblox decal fallbacks preserved
- Download images through executor HTTP, validate PNG/JPEG bytes (6MB cap), cache to local filesystem
- Render cached files via getcustomasset / getsynasset for Roblox ImageLabel
- Artwork tab accepts custom HTTPS URLs and shows loader status when downloads fail
- Preserves saved v4 presets and migrates known decal-only defaults
- Added executor capability diagnostics and documentation
- External host policies, asset permissions and per-executor runtime support are not yet certified

## v4.0.0 — 2026-11-11 (preview)

- Redesigned Theme Studio into Presets, Appearance, Artwork and Settings views
- Added Roblox Creator Store artwork IDs and a thumbnail fallback for inaccessible decals
- Fixed artwork layering so the image can appear above the right pane background, beneath controls
- Added a registry rescan to improve palette consistency after switching themes
- Added theme-aware window chrome and a configurable glass-style transparency slider
- Older named presets with empty artwork may be migrated to built-in imagery
- Added two-click Unload GUI, with tracked signal cleanup and shared-library removal
- Updated documentation, examples and asset sources
- Runtime testing with particular executors and image permissions remains pending

## v3.0.0
- Rounded shell, larger controls, sidebar and header, and a preset gallery

## v2.0.0
- File API fallback and reusable module packaging

## v1.0.0
- Initial Akiwave theme engine built on Neverlose source
