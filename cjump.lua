--// Modern GUI Executor Script with Tabs and Animations
if game.CoreGui:FindFirstChild("InfinityUI") then game.CoreGui.InfinityUI:Destroy() end

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- UI Container
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "InfinityUI"
screenGui.Parent = game.CoreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

-- Main Frame
local main = Instance.new("Frame")
main.Name = "MainFrame"
main.Parent = screenGui
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.Size = UDim2.new(0, 500, 0, 350)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0

local uiCorner = Instance.new("UICorner", main)
uiCorner.CornerRadius = UDim.new(0, 12)

-- Dragging system
local dragging, dragInput, dragStart, startPos

main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

main.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- Tab Buttons Frame
local tabButtons = Instance.new("Frame", main)
tabButtons.Name = "TabButtons"
tabButtons.Size = UDim2.new(0, 120, 1, 0)
tabButtons.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Instance.new("UICorner", tabButtons).CornerRadius = UDim.new(0, 8)

-- Add tab buttons
local tabs = {"Home", "General", "Target", "Discord"}
local tabFrames = {}

for i, name in ipairs(tabs) do
	local btn = Instance.new("TextButton", tabButtons)
	btn.Name = name .. "Tab"
	btn.Text = name
	btn.Size = UDim2.new(1, -10, 0, 40)
	btn.Position = UDim2.new(0, 5, 0, 10 + (i - 1) * 45)
	btn.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 16
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

	-- Frame for tab content
	local content = Instance.new("Frame", main)
	content.Name = name .. "Frame"
	content.Visible = (i == 1)
	content.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	content.Size = UDim2.new(1, -130, 1, -20)
	content.Position = UDim2.new(0, 130, 0, 10)
	content.BorderSizePixel = 0
	Instance.new("UICorner", content).CornerRadius = UDim.new(0, 6)
	tabFrames[name] = content

	-- Switch logic
	btn.MouseButton1Click:Connect(function()
		for tabName, frame in pairs(tabFrames) do
			frame.Visible = (tabName == name)
		end
	end)
end

-- Animation toggle RightCtrl
local open = true
game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.RightControl then
		open = not open
		local goal = {}
		goal.Size = open and UDim2.new(0, 500, 0, 350) or UDim2.new(0, 0, 0, 0)
		TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal):Play()
	end
end)

-- You can now insert your functional buttons into tabFrames["General"], tabFrames["Target"], etc.
-- Example:
local testBtn = Instance.new("TextButton", tabFrames["Home"])
testBtn.Size = UDim2.new(0, 200, 0, 40)
testBtn.Position = UDim2.new(0, 20, 0, 20)
testBtn.Text = "Test Button"
testBtn.Font = Enum.Font.Gotham
testBtn.TextSize = 16
testBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
testBtn.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
Instance.new("UICorner", testBtn).CornerRadius = UDim.new(0, 6)
testBtn.MouseButton1Click:Connect(function()
	print("Test button pressed")
end)
