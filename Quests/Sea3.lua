-- Quests/Sea3.lua | UUltimatLY HUB | PERFECT Third Sea + Tiki Outpost

_G.CurrentQuests = {
    {min=1500, Mon="Pirate Millionaire",    NameQuest="PiratePortQuest",   LevelQuest=1,  CFrameQuest=CFrame.new(-450.10, 107.68, 5950.73),  CFrameMon=CFrame.new(-246.00, 47.31, 5584.10)},
    {min=1525, Mon="Pistol Billionaire",    NameQuest="PiratePortQuest",   LevelQuest=2,  CFrameQuest=CFrame.new(-450.10, 107.68, 5950.73),  CFrameMon=CFrame.new(-320.00, 44.00, 5650.00)},
    {min=1575, Mon="Dragon Crew Warrior",   NameQuest="DragonCrewQuest",   LevelQuest=1,  CFrameQuest=CFrame.new(6750.49, 127.45, -711.03),  CFrameMon=CFrame.new(6709.76, 52.34, -1139.03)},
    {min=1600, Mon="Dragon Crew Archer",    NameQuest="DragonCrewQuest",   LevelQuest=2,  CFrameQuest=CFrame.new(6750.49, 127.45, -711.03),  CFrameMon=CFrame.new(6668.76, 481.38, 329.12)},
    {min=1775, Mon="Fishman Raider",        NameQuest="DeepForestIsland3", LevelQuest=1,  CFrameQuest=CFrame.new(-10581.66, 330.87, -8761.19), CFrameMon=CFrame.new(-10358.00, 330.87, -8750.00)},
    {min=1800, Mon="Fishman Captain",       NameQuest="DeepForestIsland3", LevelQuest=2,  CFrameQuest=CFrame.new(-10581.66, 330.87, -8761.19), CFrameMon=CFrame.new(-10994.70, 352.38, -9002.11)},
    {min=1900, Mon="Jungle Pirate",         NameQuest="DeepForestIsland2", LevelQuest=1,  CFrameQuest=CFrame.new(-12680.38, 389.97, -9902.02), CFrameMon=CFrame.new(-12256.16, 331.74, -10485.84)},
    {min=1925, Mon="Musketeer Pirate",      NameQuest="DeepForestIsland2", LevelQuest=2,  CFrameQuest=CFrame.new(-12680.38, 389.97, -9902.02), CFrameMon=CFrame.new(-13457.90, 391.55, -9859.18)},
    {min=1975, Mon="Reborn Skeleton",       NameQuest="HauntedQuest1",     LevelQuest=1,  CFrameQuest=CFrame.new(-9479.22, 141.22, 5566.09), CFrameMon=CFrame.new(-8763.72, 165.72, 6159.86)},
    {min=2000, Mon="Living Zombie",         NameQuest="HauntedQuest1",     LevelQuest=2,  CFrameQuest=CFrame.new(-9479.22, 141.22, 5566.09), CFrameMon=CFrame.new(-10125.00, 164.00, 5890.00)},
    {min=2025, Mon="Demonic Soul",          NameQuest="HauntedQuest2",     LevelQuest=1,  CFrameQuest=CFrame.new(-9516.99, 172.02, 6078.47), CFrameMon=CFrame.new(-9505.87, 172.10, 6158.99)},
    {min=2050, Mon="Posessed Mummy",        NameQuest="HauntedQuest2",     LevelQuest=2,  CFrameQuest=CFrame.new(-9516.99, 172.02, 6078.47), CFrameMon=CFrame.new(-9582.02, 6.25, 6205.48)},
    {min=2075, Mon="Peanut Scout",          NameQuest="NutsIslandQuest",   LevelQuest=1,  CFrameQuest=CFrame.new(-2104.39, 38.10, -10194.22), CFrameMon=CFrame.new(-2143.24, 47.72, -10029.99)},
    {min=2100, Mon="Peanut President",      NameQuest="NutsIslandQuest",   LevelQuest=2,  CFrameQuest=CFrame.new(-2104.39, 38.10, -10194.22), CFrameMon=CFrame.new(-1859.35, 38.10, -10422.43)},
    {min=2125, Mon="Ice Cream Chef",        NameQuest="IceCreamIslandQuest", LevelQuest=1, CFrameQuest=CFrame.new(-820.65, 65.82, -10965.80), CFrameMon=CFrame.new(-872.25, 65.82, -10919.96)},
    {min=2150, Mon="Ice Cream Commander",  NameQuest="IceCreamIslandQuest", LevelQuest=2, CFrameQuest=CFrame.new(-820.65, 65.82, -10965.80), CFrameMon=CFrame.new(-558.06, 112.05, -11290.77)},
    {min=2200, Mon="Cookie Crafter",        NameQuest="CakeQuest1",        LevelQuest=1,  CFrameQuest=CFrame.new(-2021.32, 37.80, -12028.73), CFrameMon=CFrame.new(-2374.14, 37.80, -12125.31)},
    {min=2225, Mon="Cake Guard",            NameQuest="CakeQuest1",        LevelQuest=2,  CFrameQuest=CFrame.new(-2021.32, 37.80, -12028.73), CFrameMon=CFrame.new(-1598.31, 43.77, -12244.58)},
    {min=2250, Mon="Baking Staff",          NameQuest="CakeQuest2",        LevelQuest=1,  CFrameQuest=CFrame.new(-1927.92, 37.80, -12842.54), CFrameMon=CFrame.new(-1887.81, 77.62, -12998.35)},
    {min=2275, Mon="Head Baker",            NameQuest="CakeQuest2",        LevelQuest=2,  CFrameQuest=CFrame.new(-1927.92, 37.80, -12842.54), CFrameMon=CFrame.new(-2216.19, 82.88, -12869.29)},
    {min=2300, Mon="Cocoa Warrior",         NameQuest="ChocQuest1",        LevelQuest=1,  CFrameQuest=CFrame.new(2332.23, 29.88, -12201.23), CFrameMon=CFrame.new(-21.55, 80.57, -12352.39)},
    {min=2325, Mon="Chocolate Bar Battler",NameQuest="ChocQuest1",       LevelQuest=2,  CFrameQuest=CFrame.new(233.23, 29.88, -12201.23), CFrameMon=CFrame.new(582.59, 77.19, -12463.16)},
    {min=2350, Mon="Sweet Thief",          NameQuest="ChocQuest2",       LevelQuest=1,  CFrameQuest=CFrame.new(150.51, 30.69, -12774.50), CFrameMon=CFrame.new(165.19, 76.06, -12600.84)},
    {min=2375, Mon="Candy Rebel",          NameQuest="ChocQuest2",       LevelQuest=2,  CFrameQuest=CFrame.new(150.51, 30.69, -12774.50), CFrameMon=CFrame.new(134.87, 77.25, -12876.55)},
    {min=2450, Mon="Isle Outlaw",          NameQuest="TikiQuest1",       LevelQuest=1,  CFrameQuest=CFrame.new(-16547.75, 61.14, -173.41), CFrameMon=CFrame.new(-16442.81, 116.14, -264.46)},
    {min=2475, Mon="Island Boy",           NameQuest="TikiQuest1",       LevelQuest=2,  CFrameQuest=CFrame.new(-16547.75, 61.14, -173.41), CFrameMon=CFrame.new(-16901.26, 84.07, -192.89)},
    {min=2525, Mon="Isle Champion",        NameQuest="TikiQuest2",       LevelQuest=2,  CFrameQuest=CFrame.new(-16539.08, 55.69, 1051.57), CFrameMon=CFrame.new(-16641.68, 235.78, 1031.28)},
}

notify("Sea3 Quests Loaded – 26 Perfect Quests + Tiki | UUltimatLY HUB")
