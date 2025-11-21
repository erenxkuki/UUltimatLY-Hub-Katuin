-- Features/FarmLoop.lua | UUltimatLY HUB | PREMIUM FARM LOOP WITH TABLE CALL
-- Calls Sea1/Sea2/Sea3 if not loaded – 100% No Stuck

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- ENSURE TABLES ARE LOADED (Explicit Call)
local function LoadTableIfNeeded(sea)
    if not _G.CurrentQuests then
        local repo = "https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub-Katuin/main/Quests"
        loadstring(game:HttpGet(repo.."/Sea"..sea..".lua"))()  -- Calls Sea1.lua, Sea2.lua, Sea3.lua
        notify("Table Called: Sea"..sea.." Loaded Successfully")
    end
end

-- Auto detect & load table (backup to SeaDetector)
spawn(function()
    wait(2)  -- Wait for SeaDetector
    local PlaceId = game.PlaceId
    local sea = 1
    if PlaceId == 2753915549 then sea = 1
    elseif PlaceId == 4442272183 then sea = 2
    elseif PlaceId == 7449423635 then sea = 3
    end
    LoadTableIfNeeded(sea)
end)

-- Variables from premium script
local Mon = ""
local NameQuest = ""
local LevelQuest = 0
local CFrameQuest = nil
local CFrameMon = nil
local PosMon = nil

-- CheckQuest (from premium – picks from _G.CurrentQuests)
function CheckQuest()
    local MyLevel = LocalPlayer.Data.Level.Value
    for _, quest in pairs(_G.CurrentQuests or {}) do
        if MyLevel >= quest.min then
            Mon = quest.Mon
            NameQuest = quest.NameQuest
            LevelQuest = quest.LevelQuest
            CFrameQuest = quest.CFrameQuest
            CFrameMon = quest.CFrameMon
            PosMon = CFrameMon
            break
        end
    end
end

-- Tween (safe + entrance for islands)
function topos(cf)
    local root = LocalPlayer.Character.HumanoidRootPart
    local distance = (cf.Position - root.Position).Magnitude
    if distance > 10000 then
        -- Auto entrance for Sky/Fishman/etc.
        ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", cf.Position)
        wait(3)
    end
    local tween = TweenService:Create(root, TweenInfo.new(distance/300, Enum.EasingStyle.Linear), {CFrame = cf})
    tween:Play()
    tween.Completed:Wait()
end

-- Auto Haki + Equip
function AutoHaki()
    if not LocalPlayer.Character:FindFirstChild("HasBuso") then
        ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
    end
end

function EquipWeapon()
    local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool") or LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if tool then LocalPlayer.Character.Humanoid:EquipTool(tool) end
end

-- Bring Mob (premium anti-lag)
spawn(function()
    while wait(0.5) do
        pcall(function()
            CheckQuest()
            for _, v in pairs(Workspace.Enemies:GetChildren()) do
                if v.Name:find(Mon) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    if (v.HumanoidRootPart.Position - (PosMon or CFrameMon).Position).Magnitude <= 350 then
                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                        v.HumanoidRootPart.CFrame = PosMon or CFrameMon
                        v.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        if v.Humanoid:FindFirstChild("Animator") then v.Humanoid.Animator:Destroy() end
                        sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end
        end)
    end
end)

-- MAIN LOOP (Premium Style)
spawn(function()
    while wait(0.1) do
        if _G.AutoFarm then  -- Toggle in GUI later
            pcall(function()
                CheckQuest()
                local root = LocalPlayer.Character.HumanoidRootPart

                -- Quest TP + Accept
                if CFrameQuest and (root.Position - CFrameQuest.Position).Magnitude > 15 then
                    topos(CFrameQuest * CFrame.new(0, 10, 5))
                end
                if (root.Position - CFrameQuest.Position).Magnitude <= 10 then
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                end

                -- Mob Farm
                local mobFound = false
                for _, v in pairs(Workspace.Enemies:GetChildren()) do
                    if v.Name:find(Mon) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        mobFound = true
                        repeat wait(0.1)
                            AutoHaki()
                            EquipWeapon()
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 5))
                            VirtualUser:CaptureController()
                            VirtualUser:Button1Down(Vector2.new())
                        until not _G.AutoFarm or v.Humanoid.Health <= 0
                    end
                end

                if not mobFound then
                    topos(CFrameMon * CFrame.new(0, 10, 0))
                end

                wait(math.random(2,5))  -- Humanize
            end)
        end
    end
end)

notify("FARM LOOP UPDATED | Tables Called from Sea1/2/3.lua | Premium Speed 🚀")
