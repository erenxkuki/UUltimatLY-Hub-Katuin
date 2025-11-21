-- Quests/SeaDetector.lua | UUltimatLY HUB | AUTO DETECT SEA BY PLACEID | Made for KUKI
-- 100% Accurate for Blox Fruits Update 24 (Nov 2025)

local PlaceId = game.PlaceId

if PlaceId == 2753915549 then -- First Sea (Old World)
    getgenv().CurrentSea = 1
    notify("UUltimatLY HUB → Detected Sea 1 (First Sea)")
elseif PlaceId == 4442272183 then -- Second Sea (New World)
    getgenv().CurrentSea = 2
    notify("UUltimatLY HUB → Detected Sea 2 (Second Sea)")
elseif PlaceId == 7449423635 then -- Third Sea
    getgenv().CurrentSea = 3
    notify("UUltimatLY HUB → Detected Sea 3 (Third Sea)")
else
    getgenv().CurrentSea = 1
    notify("UUltimatLY HUB → Unknown PlaceID → Default Sea 1")
end

-- Load correct table from GitHub Quests folder
local repo = "https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub-Katuin/main/Quests"

spawn(function()
    wait(1) -- Wait for notify
    if getgenv().CurrentSea == 1 then
        loadstring(game:HttpGet(repo.."/Sea1.lua"))()
        notify("Sea 1 Table LOADED from Quests | Ready to farm Lv1 → 700")
    elseif getgenv().CurrentSea == 2 then
        loadstring(game:HttpGet(repo.."/Sea2.lua"))()
        notify("Sea 2 Table LOADED from Quests | Ready to farm Lv700 → 1500")
    elseif getgenv().CurrentSea == 3 then
        loadstring(game:HttpGet(repo.."/Sea3.lua"))()
        notify("Sea 3 Table LOADED from Quests | Ready to farm Lv1500 → 2800+")
    end
end)
