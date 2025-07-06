loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

local plugin = [[
return loadstring(game:HttpGet("https://raw.githubusercontent.com/PetewareScripts/Peteware-Addons/refs/heads/main/main.lua"))()
]]

local file = "PetewareAddons.iy"
pcall(function() writefile(file, plugin) end)

addPlugin(file)
