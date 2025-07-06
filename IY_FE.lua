loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

local plugin = [[
return game:HttpGet("https://raw.githubusercontent.com/PetewareScripts/Peteware-Addons/refs/heads/main/main.lua")
]]

local file = "PetewareAddons.iy"
pcall(function() writefile(file, plugin) end)

if not (typeof(addPlugin) == "function" and typeof(LoadPlugin) == "function") then
    repeat task.wait()
    until typeof(addPlugin) == "function" and typeof(LoadPlugin) == "function"
end

addPlugin(file)
