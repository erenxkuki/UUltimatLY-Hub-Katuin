-- Quests/Sea2.lua | UUltimatLY Hub Kaitun | FULL Second Sea (700 → 1500)
-- FIXED: Usopp Island REMOVED | Added Ice Castle + Forgotten Island

local Sea2 = {
    -- Kingdom of Rose - Area 1
    {min = 700, npc = CFrame.new(-5035.0024414063, 28.614183425903, 4324.98828125), quest = "Area1Quest", qlv = 1, mob = "Raider [Lv. 700]", mobpos = CFrame.new(-4248.9106445313, 73.420677185059, -4264.9418945313)},
    {min = 725, npc = CFrame.new(-5035.0024414063, 28.614183425903, 4324.98828125), quest = "Area1Quest", qlv = 2, mob = "Mercenary [Lv. 725]", mobpos = CFrame.new(-4394.5043945313, 73.420677185059, -4316.3002929688)},

    -- Kingdom of Rose - Area 2
    {min = 775, npc = CFrame.new(-5035.0024414063, 28.614183425903, 4324.98828125), quest = "Area2Quest", qlv = 1, mob = "Swan Pirate [Lv. 775]", mobpos = CFrame.new(62.134521484375, 73.420677185059, 92.567626953125)},
    {min = 800, npc = CFrame.new(-5035.0024414063, 28.614183425903, 4324.98828125), quest = "Area2Quest", qlv = 2, mob = "Factory Staff [Lv. 800]", mobpos = CFrame.new(-310.92388916015625, 73.420677185059, -225.38650512695312)},

    -- Green Zone
    {min = 875, npc = CFrame.new(2959.4350585938, 137.51037597656, -11015.3046875), quest = "MarineQuest3", qlv = 1, mob = "Marine Officer [Lv. 875]", mobpos = CFrame.new(2968.2856445313, 137.51037597656, -10998.567382813)},
    {min = 900, npc = CFrame.new(2959.4350585938, 137.51037597656, -11015.3046875), quest = "MarineQuest3", qlv = 2, mob = "Marine Captain [Lv. 900]", mobpos = CFrame.new(3062.2856445313, 137.51037597656, -11013.567382813)},

    -- Graveyard Island
    {min = 950, npc = CFrame.new(-9516.9931640625, 164.83192443848, 5561.0322265625), quest = "GraveyardQuest", qlv = 1, mob = "Zombie [Lv. 950]", mobpos = CFrame.new(-9511.0, 143.0, 5458.0)},
    {min = 975, npc = CFrame.new(-9516.9931640625, 164.83192443848, 5561.0322265625), quest = "GraveyardQuest", qlv = 2, mob = "Vampire [Lv. 975]", mobpos = CFrame.new(-9545.0966796875, 164.83192443848, 5561.0322265625)},

    -- Snow Mountain (Cold Side)
    {min = 1000, npc = CFrame.new(61163.03125, 98.689590454102, 8533.453125), quest = "SnowMountain_Quest", qlv = 1, mob = "Snow Trooper [Lv. 1000]", mobpos = CFrame.new(61978.62109375, 98.689590454102, 8486.2802734375)},
    {min = 1050, npc = CFrame.new(61163.03125, 98.689590454102, 8533.453125), quest = "SnowMountain_Quest", qlv = 2, mob = "Winter Warrior [Lv. 1050]", mobpos = CFrame.new(62235.04296875, 98.689590454102, 8569.90234375)},

    -- Hot & Cold (Hot Side)
    {min = 1100, npc = CFrame.new(60739.57421875, 98.689590454102, 8524.6123046875), quest = "IceSideQuest", qlv = 1, mob = "Lab Subordinate [Lv. 1100]", mobpos = CFrame.new(61120.55859375, 98.689590454102, 8487.2939453125)},
    {min = 1125, npc = CFrame.new(60739.57421875, 98.689590454102, 8524.6123046875), quest = "IceSideQuest", qlv = 2, mob = "Horned Warrior [Lv. 1125]", mobpos = CFrame.new(61147.322265625, 98.689590454102, 8371.2602539063)},

    -- Cursed Ship
    {min = 1250, npc = CFrame.new(923.21252441406, 125.05748748779, 32885.875), quest = "ShipDeck", qlv = 1, mob = "Ship Deckhand [Lv. 1250]", mobpos = CFrame.new(900.0, 125.0, 32900.0)},
    {min = 1275, npc = CFrame.new(923.21252441406, 125.05748748779, 32885.875), quest = "ShipDeck", qlv = 2, mob = "Ship Engineer [Lv. 1275]", mobpos = CFrame.new(950.0, 125.0, 32950.0)},
    {min = 1300, npc = CFrame.new(923.21252441406, 125.05748748779, 32885.875), quest = "ShipOfficer", qlv = 1, mob = "Ship Steward [Lv. 1300]", mobpos = CFrame.new(1000.0, 125.0, 33000.0)},
    {min = 1325, npc = CFrame.new(923.21252441406, 125.05748748779, 32885.875), quest = "ShipOfficer", qlv = 2, mob = "Ship Officer [Lv. 1325]", mobpos = CFrame.new(1050.0, 125.0, 33050.0)},

    -- Ice Castle
    {min = 1350, npc = CFrame.new(6148.4111328125, 294.38687133789, -6743.6831054688), quest = "ArcticQuest", qlv = 1, mob = "Arctic Warrior [Lv. 1350]", mobpos = CFrame.new(6140.0, 294.0, -6800.0)},
    {min = 1425, npc = CFrame.new(6148.4111328125, 294.38687133789, -6743.6831054688), quest = "ArcticQuest", qlv = 2, mob = "Snow Lurker [Lv. 1425]", mobpos = CFrame.new(6200.0, 294.0, -6850.0)},

    -- Forgotten Island
    {min = 1425, npc = CFrame.new(-3032.7316894531, 317.89651489258, -10044.837890625), quest = "ForgottenQuest", qlv = 1, mob = "Sea Soldier [Lv. 1425]", mobpos = CFrame.new(-3050.0, 317.0, -10050.0)},
    {min = 1450, npc = CFrame.new(-3032.7316894531, 317.89651489258, -10044.837890625), quest = "ForgottenQuest", qlv = 2, mob = "Water Fighter [Lv. 1450]", mobpos = CFrame.new(-3100.0, 317.0, -10100.0)},

_G.Sea2Quests = Sea2
notify("Sea 2 Table FIXED & LOADED (700 → 1500) | Ice Castle + Forgotten Island Added")
