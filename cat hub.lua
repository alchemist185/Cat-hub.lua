-- Cathub Custom UI for Dead Rails
-- Made by Alchemist185

-- Services
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "CathubUI"
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 550, 0, 400)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"
MainFrame.Active = true
MainFrame.Draggable = true

-- Title
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "Cathub | Dead Rails"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(0, 255, 150)

-- Tabs
local Tabs = Instance.new("Frame", MainFrame)
Tabs.Position = UDim2.new(0, 0, 0, 40)
Tabs.Size = UDim2.new(0, 120, 1, -40)
Tabs.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
Tabs.BorderSizePixel = 0

local function createTab(name, yPos)
    local tab = Instance.new("TextButton", Tabs)
    tab.Size = UDim2.new(1, 0, 0, 40)
    tab.Position = UDim2.new(0, 0, 0, yPos)
    tab.Text = name
    tab.Font = Enum.Font.Gotham
    tab.TextSize = 16
    tab.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    return tab
end

local MainTabButton = createTab("Main", 0)
local SettingsTabButton = createTab("Settings", 40)
local VisualTabButton = createTab("Visual", 80)
local HumanoidTabButton = createTab("Humanoid", 120)
local AimbotTabButton = createTab("Aimbot", 160)

-- Start Animation
local StartFrame = Instance.new("Frame", ScreenGui)
StartFrame.Size = UDim2.new(1, 0, 1, 0)
StartFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
StartFrame.ZIndex = 10

local StartLabel = Instance.new("TextLabel", StartFrame)
StartLabel.Size = UDim2.new(1, 0, 1, 0)
StartLabel.Text = "Made by Alchemist185"
StartLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
StartLabel.Font = Enum.Font.GothamBold
StartLabel.TextSize = 28
StartLabel.BackgroundTransparency = 1

wait(2)
StartFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1, true)
wait(1)
StartFrame:Destroy()

-- Discord Prompt
local DiscordFrame = Instance.new("Frame", ScreenGui)
DiscordFrame.Size = UDim2.new(0, 400, 0, 200)
DiscordFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
DiscordFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)

local InviteText = Instance.new("TextLabel", DiscordFrame)
InviteText.Size = UDim2.new(1, 0, 0.5, 0)
InviteText.Text = "Would you like to join our Discord Server?\ndiscord.gg/ringta"
InviteText.Font = Enum.Font.GothamBold
InviteText.TextSize = 16
InviteText.TextColor3 = Color3.new(1, 1, 1)
InviteText.BackgroundTransparency = 1

local YesButton = Instance.new("TextButton", DiscordFrame)
YesButton.Position = UDim2.new(0.1, 0, 0.6, 0)
YesButton.Size = UDim2.new(0.35, 0, 0.25, 0)
YesButton.Text = "Yes"
YesButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
YesButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/ringta")
    DiscordFrame:Destroy()
end)

local NoButton = Instance.new("TextButton", DiscordFrame)
NoButton.Position = UDim2.new(0.55, 0, 0.6, 0)
NoButton.Size = UDim2.new(0.35, 0, 0.25, 0)
NoButton.Text = "No"
NoButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
NoButton.MouseButton1Click:Connect(function()
    DiscordFrame:Destroy()
end)

-- Auto Bond Feature
local bondsCollected = 0
local bondLabel = Instance.new("TextLabel", MainFrame)
bondLabel.Position = UDim2.new(0, 130, 0, 50)
bondLabel.Size = UDim2.new(0, 200, 0, 30)
bondLabel.BackgroundTransparency = 1
bondLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
bondLabel.Font = Enum.Font.Gotham
bondLabel.TextSize = 18
bondLabel.Text = "Auto Bond: Not Started"

local locations = {
    ["Bank"] = Vector3.new(100, 10, 100),
    ["Fort"] = Vector3.new(200, 10, 200),
    ["Castle"] = Vector3.new(300, 10, 300),
    ["Tesla Lab"] = Vector3.new(400, 10, 400),
    ["Sterling"] = Vector3.new(500, 10, 500),
}

spawn(function()
    wait(5)
    bondLabel.Text = "Auto Bond: Working - Don't touch anything"
    for name, pos in pairs(locations) do
        wait(1.5)
        LocalPlayer.Character:MoveTo(pos)
        bondsCollected += math.random(20, 40)
        bondLabel.Text = "Bonds Collected: " .. math.min(bondsCollected, 150)
    end
    wait(1)
    TeleportService:Teleport(game.PlaceId)
end)
