--[[ Cathub Script by Alchemist185 - Final Fixed Version ]]

if not game:IsLoaded() then game.Loaded:Wait() end

-- Load Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "Cathub | Dead Rails",
	LoadingTitle = "Cathub",
	LoadingSubtitle = "by Alchemist185",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "CathubData",
		FileName = "Cathub"
	},
	Discord = {
		Enabled = true,
		Invite = "wbnMSHh3",
		RememberJoins = false
	},
	KeySystem = false,
	Logo = 89913064787721 -- Your decal ID as asset image
})

Rayfield:Notify({
	Title = "Cathub Loaded",
	Content = "Welcome to Dead Rails",
	Duration = 4,
	Image = "rbxassetid://89913064787721"
})

Rayfield:Prompt({
	Title = "Join our Discord?",
	Content = "Would you like to join Cathub Discord?",
	Buttons = {
		Accept = function()
			setclipboard("https://discord.gg/wbnMSHh3")
			Rayfield:Notify({
				Title = "Copied",
				Content = "Discord invite copied to clipboard",
				Duration = 3
			})
		end,
		Decline = function()
			Rayfield:Notify({
				Title = "Okay!",
				Content = "You can join later anytime.",
				Duration = 2
			})
		end,
	}
})

-- Settings Tab
local Settings = Window:CreateTab("Settings", 4483362458)
Settings:CreateColorPicker({
	Name = "UI Accent Color",
	Callback = function(color)
		Rayfield:SetTheme({Accent = color})
	end
})
Settings:CreateToggle({
	Name = "Draggable UI",
	CurrentValue = true,
	Callback = function(v)
		game:GetService("StarterGui"):SetCore("DevConsoleVisible", not v)
	end
})

-- Main Tab
local Main = Window:CreateTab("Main", 4483362458)

Main:CreateButton({
	Name = "Teleport to End (80km)",
	Callback = function()
		local player = game.Players.LocalPlayer
		local char = player.Character or player.CharacterAdded:Wait()
		char:MoveTo(Vector3.new(80000, 25, 0))
	end
})

Main:CreateButton({
	Name = "Teleport to Tesla Lab",
	Callback = function()
		game.Players.LocalPlayer.Character:MoveTo(Vector3.new(4250, 15, -240))
	end
})

Main:CreateButton({
	Name = "Fly Toggle",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/5HF3xZ1b"))()
	end
})

-- Visual Tab
local Visual = Window:CreateTab("Visual", 4483362458)

Visual:CreateToggle({
	Name = "Night Vision",
	CurrentValue = false,
	Callback = function(v)
		game.Lighting.Brightness = v and 5 or 1
	end
})

Visual:CreateSlider({
	Name = "Camera Zoom",
	Range = {10, 120},
	Increment = 5,
	CurrentValue = 70,
	Callback = function(v)
		game.Players.LocalPlayer.CameraMaxZoomDistance = v
	end
})

-- Humanoid Tab
local Humanoid = Window:CreateTab("Humanoid", 4483362458)

Humanoid:CreateSlider({
	Name = "Walk Speed",
	Range = {16, 200},
	Increment = 1,
	CurrentValue = 16,
	Callback = function(v)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
	end
})

Humanoid:CreateSlider({
	Name = "Jump Power",
	Range = {50, 250},
	Increment = 5,
	CurrentValue = 50,
	Callback = function(v)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
	end
})

-- Logger (Optional)
pcall(function()
	local http = game:GetService("HttpService")
	local user = game.Players.LocalPlayer.Name
	local data = {
		content = "**Cathub Loaded**\nUser: "..user.."\nGame: "..game.PlaceId,
		username = "Cathub Logger"
	}
	local json = http:JSONEncode(data)
	http:PostAsync("https://discord.com/api/webhooks/1370174119055982703/8xo4DxBhnrFBa202tGm0x9vKrsoyEB36ujPmG_La1kACcd-u647tXmoXb6CTkE4DKCa1", json)
end)
