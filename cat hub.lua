--[[
  CatHub Script - Custom UI, Auto Bond, Teleports, and More
  Place Locked: 70876832253163
  Key System: "no no no" (Join owner's Discord server for access)
  Features:
    • Custom Rayfield-like UI (not using Rayfield)
    • Tabs: Main, Humanoid, Visual, Aimbot, Settings
    • Loading animation with logo (ID: 13333189503)
    • Key input prompt: "Enter the key"
    • Auto Bond Collector: Teleports to all houses, banks, labs, caves, etc.
    • Teleports: Town of Sterling, Train, Castle, Tesla Lab, Dead Rails, Outposts (10km to 70km), End Bridge (80km)
    • Noclip toggle with ✓ box (auto-enabled at end)
    • Fly: Teleports to nearest non-train chair, executes fly script
    • Aimbot + Silent Aim with smart targeting
    • Full UI customization and secure logic
--]]

local placeId = game.PlaceId
if tostring(placeId) ~= "70876832253163" then
    return
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

--// Logo ID
local logoId = "rbxassetid://13333189503"

-- UI + Key System Initialization
local function createLoading()
    -- Simple loading screen
    local screenGui = Instance.new("ScreenGui", CoreGui)
    screenGui.Name = "CatHubLoading"

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 200, 0, 200)
    frame.Position = UDim2.new(0.5, -100, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0

    local logo = Instance.new("ImageLabel", frame)
    logo.Image = logoId
    logo.Size = UDim2.new(0, 128, 0, 128)
    logo.Position = UDim2.new(0.5, -64, 0.5, -64)
    logo.BackgroundTransparency = 1

    wait(2)
    screenGui:Destroy()
end

createLoading()

-- Key Prompt
local function requestKey()
    local key = "Meow:3"
    local input = ""
    repeat
        input = tostring(game:GetService("StarterGui"):PromptInput("Enter the key"))
        wait()
    until input == key
end

-- Fallback Input Prompt Function
function StarterGui:PromptInput(prompt)
    local value = ""
    local promptGui = Instance.new("ScreenGui", CoreGui)
    promptGui.Name = "KeyPrompt"

    local box = Instance.new("TextBox", promptGui)
    box.PlaceholderText = prompt
    box.Size = UDim2.new(0, 300, 0, 50)
    box.Position = UDim2.new(0.5, -150, 0.5, -25)
    box.TextScaled = true
    box.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.ClearTextOnFocus = false
    box.Text = ""

    box.FocusLost:Connect(function()
        value = box.Text
        promptGui:Destroy()
    end)

    repeat wait() until value ~= ""
    return value
end

requestKey()

-- After key is entered
loadstring(game:HttpGet("https://raw.githubusercontent.com/alchemist185/Cat-hub.lua/main/cathub_main.lua"))()
