# Akiwave v5 manual QA

Static signature checks were run against the original Neverlose API. The following runtime checks are still pending:

1. Launch a fresh 808×546 window. The portrait must be fully clipped within the sidebar and must not overlap tabs or controls.
2. Add at least 12 sidebar tabs and check that scrolling reaches every tab.
3. Add toggle, slider, dropdown, button, keybind, and color picker to both columns. Confirm mouse/touch works.
4. Select all seven presets: header accent, semantic colors, portrait caption, and custom art must change together.
5. Test Left / Right / Background positions. Right/Background must remain subtle and never obscure controls.
6. Test transparency at 0%, 10%, and 35% on both bright and dark maps; read all control labels.
7. Hide/show the window repeatedly; verify the old 60% transparent pane issue does not return.
8. Test image URLs on executors with writefile + getcustomasset and fallback on unsupported runtimes.
9. Settings → Unload GUI must request confirmation and remove the GUI without closing Roblox.

Results must be collected from a real Roblox runtime before marking the release stable.
