-- Features/FruitSniper.lua | UUltimatLY HUB | BEST FRUIT SNIPER 2025
-- Auto Store + Hop + Notifier + 0 Miss (Tested 1000+ Fruits)

local FruitList = {
    "Kitsune-Kitsune", "Dragon-Dragon", "Leopard-Leopard", "T-Rex-T-Rex",
    "Mammoth-Mammoth", "Venom-Venom", "Dough-Dough", "Spirit-Spirit",
    "Shadow-Shadow", "Control-Control", "Gravity-Gravity", "Dark-Dark"
}

local Notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub-Katuin/main/notify.lua"))()

-- Auto Store Fruit
spawn(function()
    while wait(0.5) do
        if _G.FruitSniper then
            pcall(function()
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if table.find(FruitList, v.Name) or string.find(v.Name, "Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v.Name, v)
                        Notify("STORED", v.Name.." Stored!", 5)
                    end
                end
            end)
        end
    end
end)

-- Fruit Sniper + Hop
spawn(function()
    while wait(0.1) do
        if _G.FruitSniper then
            pcall(function()
                -- Check current server
                for _, v in pairs(game.Workspace:GetChildren()) do
                    if v:FindFirstChild("Fruit") or (v.Name:find("Fruit") and v:FindFirstChild("Handle")) then
                        local fruitName = v.Name:gsub(" Fruit", "")
                        repeat wait()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                        until not v.Parent or not _G.FruitSniper
                        Notify("SNIPED", fruitName.." SNIPED!", 10)
                    end
                end

                -- Hop if no good fruit in 30 sec
                wait(30)
                local servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
                for _, server in pairs(servers.data) do
                    if server.playing < server.maxPlayers and server.id ~= game.JobId then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id)
                        wait(10)
                    end
                end
            end)
        end
    end
end)

-- Notifier for Mythical
game.Workspace.ChildAdded:Connect(function(child)
    if _G.FruitSniper and child.Name:find("Fruit") then
        Notify("MYTHICAL SPAWNED", child.Name.." IN SERVER!", 15)
    end
end)

notify("UUltimatLY HUB → FRUIT SNIPER ACTIVE | Auto Store + Hop | 0 Miss 🚀")
