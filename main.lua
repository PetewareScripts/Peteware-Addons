local plugin = {
    ["PluginName"] = "Peteware Addons",
    ["PluginDescription"] = "A list of available extra commands for Infinite Yield FE",
    ["Commands"] = {
        ["joinlink"] = {
            ["ListName"] = "joinlink",
            ["Description"] = "Copies a join link for this specific server to clipboard.",
            ["Aliases"] = {},
            ["Function"] = function(args, speaker)
                local setclip = setclipboard or (syn and syn.setclipboard) or (Clipboard and Clipboard.set)
                if not setclip then
                    notify("Peteware Addons", "Clipboard API not supported in this environment.", 3)
                    return
                end
                local link = "https://petewarescripts.github.io/Roblox-Server-Joiner/?placeId=" .. game.PlaceId .. "&jobId=" .. game.JobId
                local success = pcall(function()
                    setclip(link)
                end)
                notify("Peteware Addons", success and "Server Join link copied to clipboard." or "Failed to copy server join link.", 3)
            end
        },
        ["toolbox"] = {
            ["ListName"] = "toolbox / devtoolbox",
            ["Description"] = "Loads the Developer Toolbox.",
            ["Aliases"] = {"devtoolbox"},
            ["Function"] = function(args, speaker)
                local url = "https://raw.githubusercontent.com/PetewareScripts/Developers-Toolbox-Peteware/refs/heads/main/main.lua"
                local req = (http and http.request) or (syn and syn.request) or http_request
                if req then
                    local res = req({Url = url, Method = "GET"})
                    if res and res.StatusCode == 200 then
                        loadstring(res.Body)()
                        notify("Peteware Addons", "Developer Toolbox Loaded", 3)
                    else
                        notify("Peteware Addons", "Failed to fetch Developer Toolbox src. Status: " .. tostring(res and res.StatusCode or "unknown"), 3)
                    end
                else
                    local success, content = pcall(function() return game:HttpGet(url) end)
                    if success then
                        loadstring(content)()
                        notify("Peteware Addons", "Developer Toolbox Loaded", 3)
                    else
                        notify("Peteware Addons", "Failed to load the Developer Toolbox: " .. tostring(content), 3)
                    end
                end
            end
        },
        ["peteware"] = {
            ["ListName"] = "peteware / petewarev1",
            ["Description"] = "Loads Peteware-V1.",
            ["Aliases"] = {"petewarev1"},
            ["Function"] = function(args, speaker)
                local url = "https://raw.githubusercontent.com/PetewareScripts/Peteware-V1/refs/heads/main/Loader"
                local req = (http and http.request) or (syn and syn.request) or http_request
                if req then
                    local res = req({Url = url, Method = "GET"})
                    if res and res.StatusCode == 200 then
                        loadstring(res.Body)()
                        notify("Peteware Addons", "Peteware-V1 Loaded", 3)
                    else
                        notify("Peteware Addons", "Failed to fetch Peteware-V1 src. Status: " .. tostring(res and res.StatusCode or "unknown"), 3)
                    end
                else
                    local success, content = pcall(function() return game:HttpGet(url) end)
                    if success then
                        loadstring(content)()
                        notify("Peteware Addons", "Peteware-V1 Loaded", 3)
                    else
                        notify("Peteware Addons", "Failed to load Peteware-V1: " .. tostring(content), 3)
                    end
                end
            end
        },
        ["hydroxide"] = {
            ["ListName"] = "hydroxide",
            ["Description"] = "Loads Hydroxide.",
            ["Aliases"] = {},
            ["Function"] = function(args, speaker)
                local url = "https://dpaste.org/2PjmR/raw"
                local req = (http and http.request) or (syn and syn.request) or http_request
                if req then
                    local res = req({Url = url, Method = "GET"})
                    if res and res.StatusCode == 200 then
                        loadstring(res.Body)()
                        notify("Peteware Addons", "Hydroxide Loaded", 3)
                    else
                        notify("Peteware Addons", "Failed to fetch Hydroxide src. Status: " .. tostring(res and res.StatusCode or "unknown"), 3)
                    end
                else
                    local success, content = pcall(function() return game:HttpGet(url) end)
                    if success then
                        loadstring(content)()
                        notify("Peteware Addons", "Hydroxide Loaded", 3)
                    else
                        notify("Peteware Addons", "Failed to load Hydroxide: " .. tostring(content), 3)
                    end
                end
            end
        }
    }
}
return plugin
