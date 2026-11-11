-- Akiwave Edition v3 showcase. Run source.luau first or load it via raw GitHub URL.
local env = (getgenv and getgenv()) or _G
local UI = assert(env.AkiwaveUI, "Please execute source.luau first")
UI:SetTheme("Marin Monochrome")

local Window = UI:CreateWindow({
    Name = "AKIWAVE",
    Content = "NEVERLOSE / UI SHOWCASE",
    Size = UI.Scales.Default,
    ConfigFolder = "AkiwaveExampleConfigs",
    Keybind = "Insert"
})
Window:AddSectionLabel("WORKSPACE")
local Main = Window:AddTab({Name="Dashboard", Icon="house", Type="Double"})
local Visuals = Window:AddTab({Name="Visuals", Icon="eye", Type="Double"})
local Core = Main:AddSection({Name="GENERAL", Position="left"})
Core:AddLabel("Interface enabled"):AddToggle({
    Default=true, Flag="aw_enabled",
    Callback=function(v) print("Enabled:",v) end
})
Core:AddLabel("Overlay intensity"):AddSlider({
    Default=65, Min=0, Max=100, Rounding=0, Size=125,
    Callback=function(v) print("Intensity:",v) end
})
Core:AddLabel("Style profile"):AddDropdown({
    Default="Balanced", Values={"Balanced","Minimal","High contrast"}, Size=130,
    Callback=function(v) print("Profile:",v) end
})
local Display=Main:AddSection({Name="APPEARANCE",Position="right"})
Display:AddLabel("Smooth transitions"):AddToggle({
    Default=true, Callback=function(v) print("Transitions:",v) end
})
Display:AddLabel("Accent preview"):AddColorPicker({
    Default=Color3.fromRGB(235,235,235),
    Callback=function(c) print("Accent:",c) end
})
Display:AddButton({Name="Open Theme Studio",Icon="paintbrush",Callback=function()
    UI:CreateThemeManager().SetRender(true)
end})
Display:AddButton({Name="Gojo Violet",Icon="palette",Callback=function()
    UI:SetTheme("Gojo Violet")
end})
local VisualCard=Visuals:AddSection({Name="VISUAL OPTIONS",Position="left"})
VisualCard:AddLabel("Show markers"):AddToggle({Default=false,Callback=function(v) print(v) end})
VisualCard:AddButton({Name="Marin Monochrome",Callback=function() UI:SetTheme("Marin Monochrome") end})
Window:SetRender(true)
return Window
