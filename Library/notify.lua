-- Library/notify.lua | UUltimatLY HUB | PREMIUM NOTIFICATION 2025
-- Smooth + Sound + Colorful + No Lag

local NotifyLibrary = {}

local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local CoreGui = game:GetService("CoreGui")

local NotifySound = Instance.new("Sound")
NotifySound.SoundId = "rbxassetid://5869422451" -- clean premium ping
NotifySound.Volume = 0.7
NotifySound.Parent = CoreGui

function NotifyLibrary:Notify(Title, Text, Duration)
    Duration = Duration or 5

    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TitleLabel = Instance.new("TextLabel")
    local TextLabel = Instance.new("TextLabel")
    local UIGradient = Instance.new("UIGradient")
    local Stroke = Instance.new("UIStroke")

    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(1, -350, 0, 100)
    Frame.Size = UDim2.new(0, 330, 0, 100)
    Frame.AnchorPoint = Vector2.new(0, 0)

    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = Frame

    Stroke.Parent = Frame
    Stroke.Color = Color3.fromRGB(255, 170, 0)
    Stroke.Thickness = 2
    Stroke.Transparency = 0.3

    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 0))
    }
    UIGradient.Rotation = 90
    UIGradient.Parent = Stroke

    TitleLabel.Parent = Frame
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 15, 0, 10)
    TitleLabel.Size = UDim2.new(1, -30, 0, 30)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = Title or "UUltimatLY HUB"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 170, 0)
    TitleLabel.TextSize = 20
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    TextLabel.Parent = Frame
    TextLabel.BackgroundTransparency = 1
    TextLabel.Position = UDim2.new(0, 15, 0, 45)
    TextLabel.Size = UDim2.new(1, -30, 0, 40)
    TextLabel.Font = Enum.Font.Gotham
    TextLabel.Text = Text or "Notification"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 16
    TextLabel.TextWrapped = true
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Animation In
    Frame:TweenPosition(UDim2.new(1, -350, 0, 100), "Out", "Quint", 0.5, true)
    NotifySound:Play()

    -- Auto Remove
    task.delay(Duration, function()
        TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(1, 20, 0, 100)}):Play()
        task.wait(0.5)
        ScreenGui:Destroy()
    end)
end

-- Shortcuts
function notify(Title, Text, Duration)
    NotifyLibrary:Notify(Title, Text, Duration)
end

return NotifyLibrary
