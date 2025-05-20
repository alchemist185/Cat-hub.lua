repeat task.wait() until game:IsLoaded()

local logoId = "rbxassetid://13333189503"
local userKey = "Meow:3"

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local loadedFly = false

local Window = Rayfield:CreateWindow({
   Name = "Cathub",
   LoadingTitle = "Cathub UI",
   LoadingSubtitle = "by Alchemist",
   ConfigurationSaving = {
      Enabled = false,
   },
   Discord = {
      Enabled = false,
   },
   KeySystem = true,
   KeySettings = {
      Title = "Cathub Key",
      Subtitle = "Enter the key",
      Note = "Join Discord to get the key",
      FileName = "CathubKey",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = userKey
   }
})

local SettingsTab = Window:CreateTab("Settings")
SettingsTab:CreateSection("Logo")
SettingsTab:CreateParagraph({Title = "Logo ID", Content = logoId})

local MainTab = Window:CreateTab("Main")
local VisualTab = Window:CreateTab("Visual")
local HumanoidTab = Window:CreateTab("Humanoid")
local AimbotTab = Window:CreateTab("Aimbot")

-- === TELEPORTS ===
local locations = {
   ["Dead Rails"] = Vector3.new(-10122, 80, -14342),
   ["Sterling Castle"] = Vector3.new(-4578, 110, 3240),
   ["Tesla Lab"] = Vector3.new(2345, 70, -9800),
   ["Town of Sterling"] = Vector3.new(-3790, 90, 2300),
   ["Sterling Cave"] = Vector3.new(-4000, 60, 1800),
   ["Sterling Houses"] = Vector3.new(-3900, 85, 2100),
   ["80km Bridge"] = Vector3.new(80000, 80, -4000)
}

for name, pos in pairs(locations) do
   MainTab:CreateButton({
      Name = "Teleport to " .. name,
      Callback = function()
         game.Players.LocalPlayer.Character:PivotTo(CFrame.new(pos))
      end
   })
end

for km = 10, 70, 10 do
   local pos = Vector3.new(km * 1000, 80, -4000)
   MainTab:CreateButton({
      Name = "Teleport to " .. km .. "km",
      Callback = function()
         game.Players.LocalPlayer.Character:PivotTo(CFrame.new(pos))
      end
   })
end

-- === FLY BUTTON ===
MainTab:CreateButton({
   Name = "Fly to Nearest Chair",
   Callback = function()
      local nearest
      for _,v in pairs(workspace:GetDescendants()) do
         if v:IsA("Seat") and not v.Name:lower():find("train") then
            local dist = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if not nearest or dist < nearest.dist then
               nearest = {seat = v, dist = dist}
            end
         end
      end
      if nearest then
         game.Players.LocalPlayer.Character:PivotTo(CFrame.new(nearest.seat.Position + Vector3.new(0, 5, 0)))
         task.wait(0.5)
         if not loadedFly then
            loadedFly = true
            loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Vehicle%20Fly%20Gui'))()
         end
      end
   end
})

-- === AUTO BOND ===
MainTab:CreateButton({
   Name = "Auto Collect Bonds",
   Callback = function()
      local bondZones = {
         Vector3.new(-3790, 90, 2300), -- Town
         Vector3.new(-4000, 60, 1800), -- Cave
         Vector3.new(-3900, 85, 2100), -- Houses
         Vector3.new(2345, 70, -9800), -- Tesla
         Vector3.new(-4578, 110, 3240), -- Castle
      }

      for _,pos in ipairs(bondZones) do
         game.Players.LocalPlayer.Character:PivotTo(CFrame.new(pos))
         task.wait(1.2)
         for _,desc in pairs(workspace:GetDescendants()) do
            if desc:IsA("ProximityPrompt") and desc.ObjectText == "Bond" then
               fireproximityprompt(desc)
            end
         end
         task.wait(0.5)
      end
   end
})

-- === TOGGLE BUTTON UTILITY ===
local function toggleBox(tab, label, callback)
   local state = false
   return tab:CreateButton({
      Name = label,
      Callback = function(btn)
         state = not state
         btn:Set(label .. (state and " ✓" or ""))
         callback(state)
      end
   })
end

-- === AIMBOT TOGGLES ===
toggleBox(AimbotTab, "Silent Aim", function(state)
   getgenv().SilentAim = state
end)
toggleBox(AimbotTab, "Aimbot", function(state)
   getgenv().Aimbot = state
end)

-- === NOCLIP TOGGLE ===
toggleBox(HumanoidTab, "Noclip", function(state)
   if state then
      getgenv().noclip = true
      game:GetService("RunService").Stepped:Connect(function()
         if getgenv().noclip then
            for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
               if v:IsA("BasePart") then
                  v.CanCollide = false
               end
            end
         end
      end)
   else
      getgenv().noclip = false
   end
end)
