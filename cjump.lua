if game.CoreGui:FindFirstChild("InfinityUI") then game.CoreGui.InfinityUI:Destroy() end

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- UI Container
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "InfinityUI"
screenGui.Parent = game:GetService("CoreGui")
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
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

-- Перетаскивание (поддержка ПК и телефонов)
local dragging = false
local dragStart, startPos

local function update(input)
	local delta = input.Position - dragStart
	main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		UserInputService.InputChanged:Connect(function(input2)
			if dragging and input == input2 then
				update(input2)
			end
		end)
	end
end)

-- Кнопка "Скрыть/Показать" (для телефона)
local toggleBtn = Instance.new("TextButton", screenGui)
toggleBtn.Size = UDim2.new(0, 100, 0, 30)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.Text = "Toggle UI"
toggleBtn.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.Gotham
toggleBtn.TextSize = 14
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 6)

local uiVisible = true
local function toggleUI()
	uiVisible = not uiVisible
	local goal = { Size = uiVisible and UDim2.new(0, 500, 0, 350) or UDim2.new(0, 0, 0, 0) }
	TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal):Play()
end

toggleBtn.MouseButton1Click:Connect(toggleUI)

-- ПК: RightCtrl скрывает UI
UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.RightControl then
		toggleUI()
	end
end)

-- Вкладки
local tabButtons = Instance.new("Frame", main)
tabButtons.Name = "TabButtons"
tabButtons.Size = UDim2.new(0, 120, 1, 0)
tabButtons.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Instance.new("UICorner", tabButtons).CornerRadius = UDim.new(0, 8)

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

	local content = Instance.new("Frame", main)
	content.Name = name .. "Frame"
	content.Visible = (i == 1)
	content.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	content.Size = UDim2.new(1, -130, 1, -20)
	content.Position = UDim2.new(0, 130, 0, 10)
	content.BorderSizePixel = 0
	Instance.new("UICorner", content).CornerRadius = UDim.new(0, 6)
	tabFrames[name] = content

	btn.MouseButton1Click:Connect(function()
		for tabName, frame in pairs(tabFrames) do
			frame.Visible = (tabName == name)
		end
	end)
end

-- Быстрое создание кнопки
local function createButton(parent, text, posY, callback)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(0, 200, 0, 40)
	btn.Position = UDim2.new(0, 20, 0, posY)
	btn.Text = text
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 16
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
	btn.MouseButton1Click:Connect(callback)
end

-- Функции на вкладках
createButton(tabFrames["Home"], "Добро пожаловать!", 20, function()
	print("Привет! Это вкладка Home.")
end)

createButton(tabFrames["General"], "Включить God Mode", 20, function()
	print("General: God Mode включён")
end)

createButton(tabFrames["Target"], "Запустить Aimbot", 20, function()
	print("Target: Aimbot включён")
end)

createButton(tabFrames["Discord"], "Скопировать Discord", 20, function()
	setclipboard("https://discord.gg/yourserver") -- Работает только на ПК
	print("Ссылка Discord скопирована!")
end)
