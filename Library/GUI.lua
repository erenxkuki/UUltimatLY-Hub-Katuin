-- GUI Module: REDz UI (From Your Source – Clean & Modular)
-- UUltimatLY Hub v2.1 | Loads REDz, Creates Tabs w/ Toggles/Sliders

-- REDz UI Library (Full Paste from UiREDzV2.lua.txt)
local Configs_HUB = {
  Cor_Hub = Color3.fromRGB(15, 15, 15),
  Cor_Options = Color3.fromRGB(15, 15, 15),
  Cor_Stroke = Color3.fromRGB(60, 60, 60),
  Cor_Text = Color3.fromRGB(240, 240, 240),
  Cor_DarkText = Color3.fromRGB(140, 140, 140),
  Corner_Radius = UDim.new(0, 4),
  Text_Font = Enum.Font.FredokaOne
}

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local function Create(instance, parent, props)
  local new = Instance.new(instance)
  if parent then new.Parent = parent end
  if props then
    for prop, value in pairs(props) do
      new[prop] = value
    end
  end
  return new
end

local function SetProps(instance, props)
  if instance and props then
    for prop, value in pairs(props) do
      instance[prop] = value
    end
  end
  return instance
end

local function Corner(parent, props)
  local new = Create("UICorner", parent)
  new.CornerRadius = Configs_HUB.Corner_Radius
  if props then SetProps(new, props) end
  return new
end

local function Stroke(parent, props)
  local new = Create("UIStroke", parent)
  new.Color = Configs_HUB.Cor_Stroke
  new.ApplyStrokeMode = "Border"
  if props then SetProps(new, props) end
  return new
end

local function CreateTween(instance, prop, value, time, tweenWait)
  local tween = TweenService:Create(instance, TweenInfo.new(time, Enum.EasingStyle.Linear), {[prop] = value})
  tween:Play()
  if tweenWait then tween.Completed:Wait() end
end

local function TextSetColor(instance)
  instance.MouseEnter:Connect(function() CreateTween(instance, "TextColor3", Color3.fromRGB(28, 120, 212), 0.4, true) end)
  instance.MouseLeave:Connect(function() CreateTween(instance, "TextColor3", Configs_HUB.Cor_Text, 0.4, false) end)
end

local ScreenGui = Create("ScreenGui", CoreGui, {Name = "REDz HUB GUI"})

-- Cleanup if exists
if CoreGui:FindFirstChild(ScreenGui.Name) then CoreGui:FindFirstChild(ScreenGui.Name):Destroy() end

-- Notif System (From REDz)
local Menu_Notifi = Create("Frame", ScreenGui, {
  Size = UDim2.new(0, 300, 1, 0),
  Position = UDim2.new(1, 0, 0, 0),
  AnchorPoint = Vector2.new(1, 0),
  BackgroundTransparency = 1
})

local Padding = Create("UIPadding", Menu_Notifi, {
  PaddingLeft = UDim.new(0, 25),
  PaddingTop = UDim.new(0, 25),
  PaddingBottom = UDim.new(0, 50)
})

local ListLayout = Create("UIListLayout", Menu_Notifi, {
  Padding = UDim.new(0, 15),
  VerticalAlignment = "Bottom"
})

local function MakeNotifi(Configs)
  local Title = Configs.Title or "UUltimatLY Hub"
  local text = Configs.Text or "Notification"
  local timewait = Configs.Time or 5
  
  local Frame1 = Create("Frame", Menu_Notifi, {
    Size = UDim2.new(2, 0, 0, 0),
    BackgroundTransparency = 1,
    AutomaticSize = "Y",
    Name = "Title"
  })
  
  local Frame2 = Create("Frame", Frame1, {
    Size = UDim2.new(0, Menu_Notifi.Size.X.Offset - 50, 0, 0),
    BackgroundColor3 = Configs_HUB.Cor_Hub,
    Position = UDim2.new(0, Menu_Notifi.Size.X.Offset, 0, 0),
    AutomaticSize = "Y"
  }) Corner(Frame2)
  
  local TextLabel = Create("TextLabel", Frame2, {
    Size = UDim2.new(1, 0, 0, 25),
    Font = Configs_HUB.Text_Font,
    BackgroundTransparency = 1,
    Text = Title,
    TextSize = 20,
    Position = UDim2.new(0, 20, 0, 5),
    TextXAlignment = "Left",
    TextColor3 = Configs_HUB.Cor_Text
  })
  
  local TextButton = Create("TextButton", Frame2, {
    Text = "X",
    Font = Configs_HUB.Text_Font,
    TextSize = 20,
    BackgroundTransparency = 1,
    TextColor3 = Color3.fromRGB(200, 200, 200),
    Position = UDim2.new(1, -5, 0, 5),
    AnchorPoint = Vector2.new(1, 0),
    Size = UDim2.new(0, 25, 0, 25)
  })
  
  local TextLabel2 = Create("TextLabel", Frame2, {
    Size = UDim2.new(1, -30, 0, 0),
    Position = UDim2.new(0, 20, 0, TextButton.Size.Y.Offset + 10),
    TextSize = 15,
    TextColor3 = Configs_HUB.Cor_DarkText,
    TextXAlignment = "Left",
    TextYAlignment = "Top",
    AutomaticSize = "Y",
    Text = text,
    Font = Configs_HUB.Text_Font,
    BackgroundTransparency = 1,
    TextWrapped = true
  })
  
  local FrameSize = Create("Frame", Frame2, {
    Size = UDim2.new(1, 0, 0, 2),
    BackgroundColor3 = Configs_HUB.Cor_Stroke,
    Position = UDim2.new(0, 2, 0, 30),
    BorderSizePixel = 0
  }) Corner(FrameSize)
  
  Create("Frame", Frame2, {
    Size = UDim2.new(0, 0, 0, 5),
    Position = UDim2.new(0, 0, 1, 5),
    BackgroundTransparency = 1
  })
  
  task.spawn(function()
    CreateTween(FrameSize, "Size", UDim2.new(0, 0, 0, 2), timewait, true)
  end)
  
  TextButton.MouseButton1Click:Connect(function()
    CreateTween(Frame2, "Position", UDim2.new(0, -20, 0, 0), 0.1, true)
    CreateTween(Frame2, "Position", UDim2.new(0, Menu_Notifi.Size.X.Offset, 0, 0), 0.5, true)
    Frame1:Destroy()
  end)
  
  task.spawn(function()
    CreateTween(Frame2, "Position", UDim2.new(0, -20, 0, 0), 0.5, true)
    CreateTween(Frame2, "Position", UDim2.new(), 0.1, true)
    task.wait(timewait)
    if Frame2 then
      CreateTween(Frame2, "Position", UDim2.new(0, -20, 0, 0), 0.1, true)
      CreateTween(Frame2, "Position", UDim2.new(0, Menu_Notifi.Size.X.Offset, 0, 0), 0.5, true)
      Frame1:Destroy()
    end
  end)
end

-- Window Creation Function (From REDz)
local function MakeWindow(Configs)
  local title = Configs.Hub.Title or "UUltimatLY Hub v2.1"
  local Anim_Title = Configs.Hub.Animation or "by HARSH & Grok"
  
  -- Main Window Frame
  local MainFrame = Create("Frame", ScreenGui, {
    Size = UDim2.new(0, 580, 0, 400),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    BackgroundColor3 = Configs_HUB.Cor_Hub,
    AnchorPoint = Vector2.new(0.5, 0.5),
    Active = true,
    Draggable = true
  }) Corner(MainFrame)
  
  -- Title Bar
  local TitleBar = Create("Frame", MainFrame, {
    Size = UDim2.new(1, 0, 0, 30),
    BackgroundColor3 = Configs_HUB.Cor_Options,
    BorderSizePixel = 0
  }) Corner(TitleBar)
  
  local TitleLabel = Create("TextLabel", TitleBar, {
    Size = UDim2.new(1, -40, 1, 0),
    Position = UDim2.new(0, 10, 0, 0),
    Text = title,
    Font = Configs_HUB.Text_Font,
    TextSize = 16,
    TextColor3 = Configs_HUB.Cor_Text,
    BackgroundTransparency = 1,
    TextXAlignment = "Left"
  })
  
  local CloseButton = Create("TextButton", TitleBar, {
    Size = UDim2.new(0, 30, 0, 30),
    Position = UDim2.new(1, -10, 0, 0),
    AnchorPoint = Vector2.new(1, 0.5),
    Text = "X",
    Font = Configs_HUB.Text_Font,
    TextSize = 16,
    TextColor3 = Color3.fromRGB(240, 0, 0),
    BackgroundTransparency = 1
  })
  
  CloseButton.MouseButton1Click:Connect(function()
    MainFrame:Destroy()
  end)
  
  -- Sidebar (Tabs)
  local Sidebar = Create("Frame", MainFrame, {
    Size = UDim2.new(0, 150, 1, -30),
    Position = UDim2.new(0, 0, 0, 30),
    BackgroundTransparency = 1
  })
  
  local TabLayout = Create("UIListLayout", Sidebar, {Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder})
  
  -- Content Area
  local Content = Create("Frame", MainFrame, {
    Size = UDim2.new(1, -150, 1, -30),
    Position = UDim2.new(0, 150, 0, 30),
    BackgroundColor3 = Configs_HUB.Cor_Options,
    ClipsDescendants = true
  }) Corner(Content)
  
  local ContentLayout = Create("UIListLayout", Content, {Padding = UDim.new(0, 5)})
  
  local TabContent = {}
  
  -- Add Tab Function
  local function AddTab(name, icon)
    local TabButton = Create("TextButton", Sidebar, {
      Size = UDim2.new(1, -10, 0, 30),
      BackgroundColor3 = Configs_HUB.Cor_Options,
      Text = name,
      Font = Configs_HUB.Text_Font,
      TextSize = 14,
      TextColor3 = Configs_HUB.Cor_DarkText,
      BorderSizePixel = 0
    }) Corner(TabButton)
    
    local TabFrame = Create("ScrollingFrame", Content, {
      Size = UDim2.new(1, -20, 1, 0),
      Position = UDim2.new(0, 10, 0, 0),
      BackgroundTransparency = 1,
      CanvasSize = UDim2.new(0, 0, 0, 0),
      ScrollBarThickness = 6,
      Visible = false
    })
    
    local TabList = Create("UIListLayout", TabFrame, {Padding = UDim.new(0, 5)})
    TabContent[name] = TabFrame
    
    TabButton.MouseButton1Click:Connect(function()
      for n, frame in pairs(TabContent) do
        frame.Visible = (n == name)
        TabButton.BackgroundColor3 = Configs_HUB.Cor_Hub
        TabButton.TextColor3 = Configs_HUB.Cor_Text
      end
    end)
    
    TabButton.LayoutOrder = #TabContent
    return TabFrame
  end
  
  -- Add Toggle Function
  local function AddToggle(parent, configs)
    local name = configs.Name or "Toggle"
    local default = configs.Default or false
    local callback = configs.Callback or function() end
    
    local Frame = Create("Frame", parent, {
      Size = UDim2.new(1, 0, 0, 30),
      BackgroundColor3 = Configs_HUB.Cor_Options,
      LayoutOrder = TabList.AbsoluteContentSize.Y.Offset
    }) Corner(Frame)
    
    local ToggleButton = Create("TextButton", Frame, {
      Size = UDim2.new(1, 0, 1, 0),
      Text = name .. (default and " [ON]" or " [OFF]"),
      Font = Configs_HUB.Text_Font,
      TextSize = 14,
      TextColor3 = Configs_HUB.Cor_Text,
      BackgroundTransparency = 1
    })
    
    local state = default
    ToggleButton.MouseButton1Click:Connect(function()
      state = not state
      ToggleButton.Text = name .. (state and " [ON]" or " [OFF]")
      callback(state)
    end)
    
    TabList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
      parent.CanvasSize = UDim2.new(0, 0, 0, TabList.AbsoluteContentSize.Y.Offset)
    end)
    
    return ToggleButton
  end
  
  -- Add Slider Function (Basic)
  local function AddSlider(parent, configs)
    local name = configs.Name or "Slider"
    local min, max = configs.Range[1], configs.Range[2]
    local default = configs.CurrentValue or min
    local callback = configs.Callback or function() end
    
    local Frame = Create("Frame", parent, {
      Size = UDim2.new(1, 0, 0, 50),
      BackgroundColor3 = Configs_HUB.Cor_Options
    }) Corner(Frame)
    
    local Label = Create("TextLabel", Frame, {
      Size = UDim2.new(1, 0, 0, 20),
      Text = name .. ": " .. default,
      Font = Configs_HUB.Text_Font,
      TextSize = 14,
      TextColor3 = Configs_HUB.Cor_Text,
      BackgroundTransparency = 1
    })
    
    local SliderBar = Create("Frame", Frame, {
      Size = UDim2.new(1, -20, 0, 10),
      Position = UDim2.new(0, 10, 0, 25),
      BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    }) Corner(SliderBar)
    
    local SliderFill = Create("Frame", SliderBar, {
      Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
      BackgroundColor3 = Color3.fromRGB(28, 120, 212)
    }) Corner(SliderFill)
    
    -- Drag logic (simplified)
    local dragging = false
    SliderBar.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
    end)
    UserInputService.InputEnded:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    
    RunService.Heartbeat:Connect(function()
      if dragging then
        local mouse = UserInputService:GetMouseLocation()
        local rel = math.clamp((mouse.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
        local val = min + (max - min) * rel
        SliderFill.Size = UDim2.new(rel, 0, 1, 0)
        Label.Text = name .. ": " .. math.floor(val)
        callback(val)
      end
    end)
  end
  
  -- Add Dropdown Function (Basic)
  local function AddDropdown(parent, configs)
    local name = configs.Name or "Dropdown"
    local options = configs.Options or {}
    local default = configs.CurrentOption or options[1]
    local callback = configs.Callback or function() end
    
    local Frame = Create("Frame", parent, {
      Size = UDim2.new(1, 0, 0, 30),
      BackgroundColor3 = Configs_HUB.Cor_Options
    }) Corner(Frame)
    
    local DropButton = Create("TextButton", Frame, {
      Size = UDim2.new(1, 0, 1, 0),
      Text = name .. ": " .. default,
      Font = Configs_HUB.Text_Font,
      TextSize = 14,
      TextColor3 = Configs_HUB.Cor_Text,
      BackgroundTransparency = 1
    })
    
    local DropFrame = Create("Frame", Frame, {
      Size = UDim2.new(1, 0, 0, 0),
      Position = UDim2.new(0, 0, 1, 0),
      BackgroundColor3 = Configs_HUB.Cor_Hub,
      Visible = false
    }) Corner(DropFrame)
    
    local DropLayout = Create("UIListLayout", DropFrame)
    
    local expanded = false
    DropButton.MouseButton1Click:Connect(function()
      expanded = not expanded
      DropFrame.Visible = expanded
      DropFrame.Size = expanded and UDim2.new(1, 0, 0, #options * 25) or UDim2.new(1, 0, 0, 0)
    end)
    
    for _, opt in ipairs(options) do
      local OptButton = Create("TextButton", DropFrame, {
        Size = UDim2.new(1, 0, 0, 25),
        Text = opt,
        Font = Configs_HUB.Text_Font,
        TextSize = 12,
        TextColor3 = Configs_HUB.Cor_DarkText,
        BackgroundTransparency = 1
      })
      
      OptButton.MouseButton1Click:Connect(function()
        DropButton.Text = name .. ": " .. opt
        callback(opt)
        expanded = false
        DropFrame.Visible = false
      end)
    end
  end
  
  -- Add Button Function
  local function AddButton(parent, configs)
    local name = configs.Name or "Button"
    local callback = configs.Callback or function() end
    
    local Button = Create("TextButton", parent, {
      Size = UDim2.new(1, 0, 0, 30),
      Text = name,
      Font = Configs_HUB.Text_Font,
      TextSize = 14,
      TextColor3 = Configs_HUB.Cor_Text,
      BackgroundColor3 = Color3.fromRGB(28, 120, 212)
    }) Corner(Button)
    
    Button.MouseButton1Click:Connect(callback)
  end
  
  return {
    AddTab = AddTab,
    AddToggle = AddToggle,
    AddSlider = AddSlider,
    AddDropdown = AddDropdown,
    AddButton = AddButton,
    Notify = MakeNotifi
  }
end

-- Hub Window Setup (UUltimatLY v2.1)
local Hub = MakeWindow({Hub = {Title = "UUltimatLY Hub v2.1", Animation = "HARSH & Grok"}})

-- Tabs (Link to _G Vars from Other Modules)
local MainTab = Hub.AddTab("Main")
local PlayerTab = Hub.AddTab("Player")
local TeleTab = Hub.AddTab("Teleports")
local SeaTab = Hub.AddTab("Sea Events")
local RaceTab = Hub.AddTab("Race")
local EspTab = Hub.AddTab("ESP")
local MiscTab = Hub.AddTab("Misc")

-- Main Tab Toggles/Sliders
Hub.AddToggle(MainTab, {Name = "Auto Farm Level", Default = _G.AutoFarmLevel or false, Callback = function(state) _G.AutoFarmLevel = state Hub.Notify({Title = "Main", Text = "Auto Farm " .. (state and "ON" or "OFF")}) end})
Hub.AddToggle(MainTab, {Name = "Auto Collect Fruits/Chests", Default = _G.AutoCollect or false, Callback = function(state) _G.AutoCollect = state end})
Hub.AddDropdown(MainTab, {Name = "Select Boss", Options = _G.BossList or {}, CurrentOption = "Gorilla King", Callback = function(opt) _G.SelectedBoss = opt end})
Hub.AddToggle(MainTab, {Name = "Auto Farm Boss", Default = _G.AutoBoss or false, Callback = function(state) _G.AutoBoss = state end})
Hub.AddDropdown(MainTab, {Name = "Select Material", Options = _G.MaterialList or {}, CurrentOption = "Mystic Droplet", Callback = function(opt) _G.SelectedMaterial = opt end})
Hub.AddToggle(MainTab, {Name = "Auto Farm Material", Default = _G.AutoMaterial or false, Callback = function(state) _G.AutoMaterial = state end})

-- Player Tab
Hub.AddSlider(PlayerTab, {Name = "Walk Speed", Range = {16, 500}, CurrentValue = 50, Callback = function(val) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val end})
Hub.AddToggle(PlayerTab, {Name = "Fly Enabled", Default = _G.FlyEnabled or false, Callback = function(state) _G.FlyEnabled = state end})
Hub.AddToggle(PlayerTab, {Name = "Infinite Jump", Default = _G.InfiniteJump or false, Callback = function(state) _G.InfiniteJump = state end})
Hub.AddToggle(PlayerTab, {Name = "Infinite Energy", Default = true, Callback = function(state) _G.InfiniteEnergy = state end})

-- Tele Tab (Basic Dropdown – Expand w/ teleports.lua)
Hub.AddDropdown(TeleTab, {Name = "Select Island", Options = {"Marine Starter", "Prison", "Sky", "Mirage Island"}, CurrentOption = "Marine Starter", Callback = function(opt) -- Call tpTo(opt) from teleports.lua end})
Hub.AddButton(TeleTab, {Name = "Teleport", Callback = function() Hub.Notify({Title = "Tele", Text = "Teleported to " .. _G.SelectedIsland or "Starter"}) end})

-- Sea Tab
Hub.AddToggle(SeaTab, {Name = "Auto Sea Beast", Default = _G.AutoSeaBeast or false, Callback = function(state) _G.AutoSeaBeast = state end})
Hub.AddToggle(SeaTab, {Name = "Dodge Attacks", Default = true, Callback = function(state) _G.DodgeSB = state end})
Hub.AddButton(SeaTab, {Name = "Hop to Moon Server", Callback = function() -- Call serverHop from misc end Hub.Notify({Title = "Sea", Text = "Hopping to Full Moon!"}) end})

-- Race Tab
Hub.AddToggle(RaceTab, {Name = "Auto Race V3", Default = _G.AutoRaceV3 or false, Callback = function(state) _G.AutoRaceV3 = state end})
Hub.AddButton(RaceTab, {Name = "Buy Race Gear", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGear") end})

-- ESP Tab
Hub.AddToggle(EspTab, {Name = "ESP Fruits", Default = _G.ESPFruit or false, Callback = function(state) _G.ESPFruit = state end})
Hub.AddToggle(EspTab, {Name = "ESP Players", Default = _G.ESPPlayer or false, Callback = function(state) _G.ESPPlayer = state end})

-- Misc Tab
Hub.AddButton(MiscTab, {Name = "Server Hop Low Pop", Callback = function() -- Hop logic end Hub.Notify({Title = "Misc", Text = "Hopped to low pop!"}) end})
Hub.AddButton(MiscTab, {Name = "Rejoin Server", Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end})
Hub.AddToggle(MiscTab, {Name = "Auto Haki", Default = true, Callback = function(state) _G.AutoHaki = state end})

-- Initial Tab Select
for name, frame in pairs(Hub.TabContent or {}) do
  if name == "Main" then frame.Visible = true end
end

-- Notify on Load
Hub.Notify({Title = "UUltimatLY Hub", Text = "REDz GUI Loaded! Grind szn, bro. 🚀", Time = 4})

print("REDz GUI Module Loaded – Tabs ready!")
