-- Features/FarmLoop.lua | UUltimatLY Hub Kaitun | MAIN AUTO FARM LOOP
-- Execute after all Quests loaded – Works Sea1/2/3 automatically

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")

-- TP FUNCTION (Smooth + Fast)
local function tp(pos)
    local tween = TweenService:Create(root, TweenInfo.new(0.7, Enum.EasingStyle.Linear), {CFrame = pos * CFrame.new(0, 15, 0)})
    tween:Play()
    tween.Completed:Wait()
end

-- ATTACK FUNCTION (Auto click + stay on top)
local function attack(mob)
    if mob and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
        root.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
        VirtualUser:CaptureController()
        VirtualUser:ClickButton1(Vector2.new())
        wait(0.12)
    end
end

-- GET CURRENT LEVEL
local function getLevel()
    return player.Data.Level.Value
end

-- FIND BEST QUEST
local function getQuest()
    local lvl = getLevel()
    local allQuests = {}

    -- Merge all seas
    for _, q in pairs(_G.Sea1Quests or {}) do table.insert(allQuests, q) end
    for _, q in pairs(_G.Sea2Quests or {}) do table.insert(allQuests, q) end
    for _, q in pairs(_G.Sea3Quests or {}) do table.insert(allQuests, q) end

    for _, q in pairs(allQuests) do
        if lvl >= q.min then
            return q
        end
    end
    return allQuests[#allQuests] -- fallback max
end

-- MAIN FARM LOOP
spawn(function()
    while wait() do
        local quest = getQuest()
        if not quest then wait(1) continue end

        notify("Farming: "..quest.mob.." | Lv."..getLevel().." → Max")

        -- Accept quest
        tp(quest.npc)
        wait(1.5)
        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", quest.quest, quest.qlv)

        -- Go to mobs
        tp(quest.mobpos)

        -- Kill loop
        repeat
            for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                if mob.Name:find(quest.mob) and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                    attack(mob)
                end
            end
            wait(0.2)
        until #Workspace.Enemies:GetChildren() == 0 or not Workspace.Enemies:FindFirstChild(quest.mob)

        wait(math.random(4, 8)) -- Human delay
    end
end)

notify("AUTO FARM LOOP STARTED | Lv1 → 2800+ Full Auto 🚀")
