loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

local plugin = [[
return loadstring(game:HttpGet("https://raw.githubusercontent.com/PetewareScripts/Peteware-Addons/refs/heads/main/main.lua"))()
]]

local mainFolder = "Peteware"

if not isfolder(mainFolder) then
    makefolder(mainFolder)
end

local file = mainFolder .. "/PetewareAddons.iy"
pcall(function() writefile(file, plugin) end)

addPlugin(file)
