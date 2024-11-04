-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Buttons = Instance.new("Folder")
local OneButton = Instance.new("TextButton")

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
end
coroutine.wrap(QDRRBL_fake_script)()
