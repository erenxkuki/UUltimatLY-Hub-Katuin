-- Quests/Sea1.lua | UUltimatLY HUB | PERFECT First Sea Quests (Update 24 - Nov 2025)

_G.CurrentQuests = {
    {min=0,   Mon="Bandit",                NameQuest="BanditQuest1",      LevelQuest=1,  CFrameQuest=CFrame.new(1059.37, 15.45, 1550.42),   CFrameMon=CFrame.new(1045.96, 27.00, 1560.82)},
    {min=10,  Mon="Monkey",                NameQuest="JungleQuest",       LevelQuest=1,  CFrameQuest=CFrame.new(-1598.09, 35.55, 153.38),   CFrameMon=CFrame.new(-1448.52, 67.85, 11.47)},
    {min=15,  Mon="Gorilla",               NameQuest="JungleQuest",       LevelQuest=2,  CFrameQuest=CFrame.new(-1598.09, 35.55, 153.38),   CFrameMon=CFrame.new(-1129.88, 40.46, -525.42)},
    {min=30,  Mon="Pirate",                NameQuest="BuggyQuest1",       LevelQuest=1,  CFrameQuest=CFrame.new(-1141.07, 4.10, 3831.55),   CFrameMon=CFrame.new(-1103.51, 13.75, 3896.09)},
    {min=40,  Mon="Brute",                 NameQuest="BuggyQuest1",       LevelQuest=2,  CFrameQuest=CFrame.new(-1141.07, 4.10, 3831.55),   CFrameMon=CFrame.new(-1140.08, 14.81, 4322.92)},
    {min=60,  Mon="Desert Bandit",         NameQuest="DesertQuest",       LevelQuest=1,  CFrameQuest=CFrame.new(894.49, 5.14, 4392.43),      CFrameMon=CFrame.new(924.80, 6.45, 4481.59)},
    {min=75,  Mon="Desert Officer",        NameQuest="DesertQuest",       LevelQuest=2,  CFrameQuest=CFrame.new(894.49, 5.14, 4392.43),      CFrameMon=CFrame.new(1608.28, 8.61, 4371.01)},
    {min=90,  Mon="Snow Bandit",           NameQuest="SnowQuest",         LevelQuest=1,  CFrameQuest=CFrame.new(1389.74, 88.15, -1298.91),   CFrameMon=CFrame.new(1354.35, 87.27, -1393.95)},
    {min=100, Mon="Snowman",               NameQuest="SnowQuest",         LevelQuest=2,  CFrameQuest=CFrame.new(1389.74, 88.15, -1298.91),   CFrameMon=CFrame.new(1201.64, 144.58, -1550.07)},
    {min=120, Mon="Chief Petty Officer",   NameQuest="MarineQuest2",      LevelQuest=1,  CFrameQuest=CFrame.new(-5039.59, 27.35, 4324.68),  CFrameMon=CFrame.new(-4881.23, 22.65, 4273.75)},
    {min=150, Mon="Sky Bandit",            NameQuest="SkyQuest",          LevelQuest=1,  CFrameQuest=CFrame.new(-4839.53, 716.37, -2619.44), CFrameMon=CFrame.new(-4953.21, 295.74, -2899.23)},
    {min=175, Mon="Dark Master",           NameQuest="SkyQuest",          LevelQuest=2,  CFrameQuest=CFrame.new(-4839.53, 716.37, -2619.44), CFrameMon=CFrame.new(-5259.84, 391.40, -2229.04)},
    {min=190, Mon="Prisoner",              NameQuest="PrisonerQuest",     LevelQuest=1,  CFrameQuest=CFrame.new(5308.93, 1.66, 475.12),     CFrameMon=CFrame.new(5098.97, -0.32, 474.24)},
    {min=210, Mon="Dangerous Prisoner",    NameQuest="PrisonerQuest",     LevelQuest=2,  CFrameQuest=CFrame.new(5308.93, 1.66, 475.12),     CFrameMon=CFrame.new(5654.56, 15.63, 866.30)},
    {min=250, Mon="Toga Warrior",          NameQuest="ColosseumQuest",    LevelQuest=1,  CFrameQuest=CFrame.new(-1580.05, 6.35, -2986.48),  CFrameMon=CFrame.new(-1820.21, 51.68, -2740.67)},
    {min=275, Mon="Gladiator",             NameQuest="ColosseumQuest",    LevelQuest=2,  CFrameQuest=CFrame.new(-1580.05, 6.35, -2986.48),  CFrameMon=CFrame.new(-1292.84, 56.38, -3339.03)},
    {min=300, Mon="Military Soldier",      NameQuest="MagmaQuest",        LevelQuest=1,  CFrameQuest=CFrame.new(-5313.37, 10.95, 8515.29),  CFrameMon=CFrame.new(-5411.16, 11.08, 8454.29)},
    {min=325, Mon="Military Spy",          NameQuest="MagmaQuest",        LevelQuest=2,  CFrameQuest=CFrame.new(-5313.37, 10.95, 8515.29),  CFrameMon=CFrame.new(-5802.87, 86.26, 8828.86)},
    {min=375, Mon="Fishman Warrior",       NameQuest="FishmanQuest",      LevelQuest=1,  CFrameQuest=CFrame.new(61122.65, 18.50, 1569.40),  CFrameMon=CFrame.new(60878.30, 18.48, 1543.76)},
    {min=400, Mon="Fishman Commando",      NameQuest="FishmanQuest",      LevelQuest=2,  CFrameQuest=CFrame.new(61122.65, 18.50, 1569.40),  CFrameMon=CFrame.new(61922.63, 18.48, 1493.93)},
    {min=450, Mon="God's Guard",           NameQuest="SkyExp1Quest",      LevelQuest=1,  CFrameQuest=CFrame.new(-4721.89, 843.87, -1949.97), CFrameMon=CFrame.new(-4710.04, 845.28, -1927.31)},
    {min=475, Mon="Shanda",                NameQuest="SkyExp1Quest",      LevelQuest=2,  CFrameQuest=CFrame.new(-7859.10, 5544.19, -381.48), CFrameMon=CFrame.new(-7678.49, 5566.40, -497.22)},
    {min=525, Mon="Royal Squad",           NameQuest="SkyExp2Quest",      LevelQuest=1,  CFrameQuest=CFrame.new(-7906.82, 5634.66, -1411.99), CFrameMon=CFrame.new(-7624.25, 5658.13, -1467.35)},
    {min=550, Mon="Royal Soldier",         NameQuest="SkyExp2Quest",      LevelQuest=2,  CFrameQuest=CFrame.new(-7906.82, 5634.66, -1411.99), CFrameMon=CFrame.new(-7836.75, 5645.66, -1790.62)},
    {min=625, Mon="Galley Pirate",         NameQuest="FountainQuest",     LevelQuest=1,  CFrameQuest=CFrame.new(5259.82, 37.35, 4050.03),   CFrameMon=CFrame.new(5551.02, 78.90, 3930.41)},
    {min=650, Mon="Galley Captain",        NameQuest="FountainQuest",     LevelQuest=2,  CFrameQuest=CFrame.new(5259.82, 37.35, 4050.03),   CFrameMon=CFrame.new(5441.95, 42.50, 4950.09)},
}

notify("Sea1 Quests Loaded – 26 Perfect Quests | UUltimatLY HUB")
