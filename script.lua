-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Username = Instance.new("TextBox")
local ViewButton = Instance.new("TextButton")
local UnviewButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.295989811, 0, 0.317841887, 0)
Main.Size = UDim2.new(0.407383829, 0, 0.363247871, 0)

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0.102941178, 0)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Secerting rework"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

Username.Name = "Username"
Username.Parent = Main
Username.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Username.BorderColor3 = Color3.fromRGB(0, 0, 0)
Username.BorderSizePixel = 0
Username.Position = UDim2.new(0.109375, 0, 0.220588237, 0)
Username.Size = UDim2.new(0.779296875, 0, 0.176470593, 0)
Username.Font = Enum.Font.SourceSansBold
Username.PlaceholderText = "Username"
Username.Text = ""
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.TextScaled = true
Username.TextSize = 14.000
Username.TextWrapped = true

ViewButton.Name = "ViewButton"
ViewButton.Parent = Main
ViewButton.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
ViewButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ViewButton.BorderSizePixel = 0
ViewButton.Position = UDim2.new(0.109375, 0, 0.433823526, 0)
ViewButton.Size = UDim2.new(0.222656235, 0, 0.128676474, 0)
ViewButton.Font = Enum.Font.SourceSansBold
ViewButton.Text = "View"
ViewButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ViewButton.TextScaled = true
ViewButton.TextSize = 14.000
ViewButton.TextWrapped = true

UnviewButton.Name = "UnviewButton"
UnviewButton.Parent = Main
UnviewButton.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
UnviewButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
UnviewButton.BorderSizePixel = 0
UnviewButton.Position = UDim2.new(0.3515625, 0, 0.433823526, 0)
UnviewButton.Size = UDim2.new(0.222656235, 0, 0.128676474, 0)
UnviewButton.Font = Enum.Font.SourceSansBold
UnviewButton.Text = "Unview"
UnviewButton.TextColor3 = Color3.fromRGB(255, 255, 255)
UnviewButton.TextScaled = true
UnviewButton.TextSize = 14.000
UnviewButton.TextWrapped = true

-- Scripts:

local function BMLB_fake_script() -- Main.SmoothDrag 
	local script = Instance.new('LocalScript', Main)

	local Drag = script.Parent
	local gsCoreGui = game:GetService("CoreGui")
	local gsTween = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
		local dragging
		local dragInput
		local dragStart
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			local dragTime = 0.04
			local SmoothDrag = {}
			SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
			dragSmoothFunction:Play()
		end
		Drag.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = Drag.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		Drag.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging and Drag.Size then
				update(input)
			end
		end)
	
end
coroutine.wrap(BMLB_fake_script)()
local function GOZIN_fake_script() -- Main.Buttons 
	local script = Instance.new('LocalScript', Main)

	local MainFrame = script.Parent
	local ViewButton = MainFrame.ViewButton
	local UnviewButton = MainFrame.UnviewButton
	local UserName = MainFrame.Username
	local VistName = ""
	local PlayerLocal = game:GetService("Players").LocalPlayer
	local CurrentCamera = workspace.CurrentCamera
	
	local function resetCameraToLocalPlayer()
		if PlayerLocal.Character and PlayerLocal.Character:FindFirstChild("Humanoid") then
			CurrentCamera.CameraSubject = PlayerLocal.Character.Humanoid
		else
			print("Local player's character or humanoid not found")
		end
		VistName = ""
	end
	
	local function GiveNotification(Text)
		game.StarterGui:SetCore("SendNotification", {
			Title = "Secerting Rework",
			Text = Text,
			Duration = 5,
		})
	end
	
	ViewButton.MouseButton1Click:Connect(function()
		local Player = game.Players:FindFirstChild(UserName.Text)
		if Player and Player.Character then
			local Humanoid = Player.Character:FindFirstChild("Humanoid")
			if Humanoid then
				GiveNotification("Now Vist Player @"..VistName)
				VistName = UserName.Text
				CurrentCamera.CameraSubject = Humanoid
				
				-- Listen for the Humanoid's Died event to reset the camera
				Humanoid.Died:Connect(function()
					GiveNotification("Viewed player died, resetting camera.")
					resetCameraToLocalPlayer()
				end)
			else
				GiveNotification("Humanoid not found for player @"..UserName.Text)
			end
		else
			GiveNotification("Player not found or character not loaded for @"..UserName.Text)
		end
	end)
	
	UnviewButton.MouseButton1Click:Connect(function()
		GiveNotification("UnView Player")
		resetCameraToLocalPlayer()
	end)
end
coroutine.wrap(GOZIN_fake_script)()
