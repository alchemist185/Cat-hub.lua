???
print("[CatHub] Key System Loaded. UI inspired by Rayfield but fully custom.")

--// Services
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

--// UI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "CatHubKeyUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Draggable frame
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 200)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Active = true
MainFrame.Draggable = true

-- Rounded corners
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

-- Title
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "CatHub - Enter Key"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

-- Input Box
local KeyBox = Instance.new("TextBox", MainFrame)
KeyBox.Position = UDim2.new(0.5, -150, 0.5, -10)
KeyBox.Size = UDim2.new(0, 300, 0, 30)
KeyBox.PlaceholderText = "Enter the key"
KeyBox.Text = ""
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 16
KeyBox.TextColor3 = Color3.fromRGB(0, 0, 0)
KeyBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

local UICorner2 = Instance.new("UICorner", KeyBox)
UICorner2.CornerRadius = UDim.new(0, 6)

-- Confirm Button
local Confirm = Instance.new("TextButton", MainFrame)
Confirm.Position = UDim2.new(0.5, -75, 1, -50)
Confirm.Size = UDim2.new(0, 150, 0, 30)
Confirm.Text = "Submit"
Confirm.Font = Enum.Font.GothamBold
Confirm.TextSize = 16
Confirm.TextColor3 = Color3.fromRGB(255, 255, 255)
Confirm.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

local UICorner3 = Instance.new("UICorner", Confirm)
UICorner3.CornerRadius = UDim.new(0, 6)

-- Close Button
local Close = Instance.new("TextButton", MainFrame)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -35, 0, 5)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(255, 100, 100)
Close.BackgroundTransparency = 1

-- Actions
Close.MouseButton1Click:Connect(function()
	MainFrame:Destroy()
end)

local ValidKey = "Meow:3"

Confirm.MouseButton1Click:Connect(function()
	if KeyBox.Text == ValidKey then
		Title.Text = "Loading CatHub..."
		Confirm.Text = "Valid Key!"
		wait(1)
		ScreenGui:Destroy()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/alchemist185/cathub.main/refs/heads/main/%3F%3F"))()
	else
		Title.Text = "Invalid Key"
		wait(1)
		Title.Text = "CatHub - Enter Key"
	end
end)
