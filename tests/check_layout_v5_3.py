#!/usr/bin/env python3
"""Static structural checks only; this is not a Roblox runtime test."""
from pathlib import Path
s = (Path(__file__).resolve().parents[1] / "source.luau").read_text(encoding="utf-8")
checks = [
    "Akiwave.Version = '5.3.0'",
    "WindowName.Parent=LeftMenuFrame",
    "WindowContent.Parent=LeftMenuFrame",
    "BasedLabel.TextWrapped = true",
    "BasedLabel.TextTruncate = Enum.TextTruncate.None",
    "local function UpdateRowGeometry()",
    "controlsWidth<=1",
    "GetPropertyChangedSignal('Text')",
    "SectionFrame.Size=UDim2.new(1,-5",
    "function NeverLose:CreateThemeManager()",
    "function NeverLose:Unload()",
]
for item in checks:
    assert item in s, f"Missing structural invariant: {item}"
assert s.rstrip().endswith("return NeverLose;"), "Must remain a reusable library"
print("PASS: v5.3 layout invariants (runtime test still required)")
