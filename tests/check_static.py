#!/usr/bin/env python3
"""Static invariant checks. This is not a Luau compiler or an executor runtime test."""
from pathlib import Path
s=(Path(__file__).resolve().parents[1]/"source.luau").read_text()
for needle in [
    "NeverLose.Drag = LPH_NO_VIRTUALIZE",
    "local threshold=6",
    "UserInputService.InputEnded:Connect",
    "NeverLose.Drag(Header,Root,0,64)",
    "NeverLose.Drag(Frame , WindowFrame , 0,164)",
    "AkiwaveSelectedRail",
    "AkiwaveSectionRail",
    "AkiwaveHeaderUnderline",
    "function NeverLose:CreateWindow(Config)",
    "function NeverLose:CreateThemeManager()",
    "function NeverLose:Unload()",
    "function Akiwave.SetTheme(input)",
    "function handle:AddToggle(Config)",
    "function handle:AddSlider(Config)",
    "function handle:AddDropdown(Config)",
]:
    assert needle in s, f"Missing expected source marker: {needle}"
assert "NeverLose.PlayAnimate(MoveFrame,Tween" not in s, "Old per-move tween is still present"
assert s.rstrip().endswith("return NeverLose;"), "Library footer missing"
print("Source structural invariants PASS (no Roblox runtime verification)")
