# v5.2 Roblox QA checklist (manual)

The following tests require a real Roblox client/executor; they are **not claimed as passed** yet.

1. Launch v5.2 standalone demo; existing Akiwave instance should be replaced.
2. Click empty content without moving the pointer 10 times: window remains at identical coordinates.
3. Hold the title bar but move <6px, release: no window movement.
4. Drag the title bar >6px and release: it follows pointer without accumulating offsets or drifting upward.
5. Drag to all four viewport boundaries; the window remains visible.
6. Repeated quick clicks/drags (20 times): no creeping upward.
7. Click Settings gear: Theme Studio opens and remains independently draggable. Close button must work without initiating drag.
8. Switch every color theme; active tab rail, header and section rail update color.
9. Check Toggle, Slider, Dropdown, Colorpicker, keybinds and Save config callbacks still work.
10. Settings → UNLOAD GUI twice to unload. Re-run demo to verify cleanup.
11. Where supported, repeat pointer checks via touch on a mobile executor.
12. No anime portrait/background or external image requests.

Source-level invariant test is available in `tests/check_static.py`.
