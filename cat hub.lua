-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Create the window
local Window = Rayfield:CreateWindow({
	Name = "Cathub | Dead Rails",
	LoadingTitle = "Cathub",
	LoadingSubtitle = "by Alchemist185",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "CathubData",
		FileName = "CathubConfig"
	},
	Discord = {
		Enabled = true,
		Invite = "wbnMSHh3",
		RememberJoins = false
	},
	KeySystem = false,
	Logo = "rbxassetid://89913064787721"
})

-- Create a working tab with buttons
local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateButton({
	Name = "Say Hello",
	Callback = function()
		print("Hello from Cathub!")
	end
})

MainTab:CreateToggle({
	Name = "Test Toggle",
	CurrentValue = false,
	Callback = function(state)
		print("Toggle is now", state)
	end
})

-- Confirmation everything loaded
Rayfield:Notify({
	Title = "Cathub Ready",
	Content = "UI Loaded Successfully.",
	Duration = 4,
	Image = "rbxassetid://89913064787721"
})
