-- Run source.luau first; this does not create any demo windows.
local UI = (getgenv and getgenv().AkiwaveUI) or nil
assert(UI and UI.Akiwave, 'Load Neverlose Akiwave source.luau first')
local art = UI.Akiwave.RemoteArtwork
print('HTTPS artwork supported:', art.Supported)
print('File mode:', UI.Runtime and UI.Runtime.StorageMode)
local preset = UI.Akiwave.Presets[2] -- Marin Monochrome
print('URL:', preset.Image.Asset)
UI.Akiwave.ResolveExternalArtwork(preset.Image.Asset, function(uri, err)
    if uri then
        print('SUCCESS: cached image available as Roblox custom asset:', uri)
    else
        warn('Artwork request failed:', err)
        warn('Check getcustomasset + writefile, external host policy, and URL validity')
    end
end)
