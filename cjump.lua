local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Удаление старого GUI, если есть
if CoreGui:FindFirstChild("JumpScriptGui") then
    CoreGui.JumpScriptGui:Destroy()
end

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JumpScriptGui"
ScreenGui.Parent = CoreGui

-- Общие функции создания GUI-элементов
local function createRoundedFrame(parent, size, position)
    local frame = Instance.new("Frame")
    frame.Size = size
    frame.Position = position
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0
    frame.Parent = parent
    frame.ClipsDescendants = true
    frame.Active = true
    frame.Draggable = true

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = frame

    return frame
end

local function createButton(parent, size, position, text, color)
    local btn = Instance.new("TextButton")
    btn.Size = size
    btn.Position = position
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(0, 0, 0)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.AutoButtonColor = false
    btn.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = btn

    return btn
end

local function createLabel(parent, size, position, text, fontsize)
    local label = Instance.new("TextLabel")
    label.Size = size
    label.Position = position
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamBold
    label.TextSize = fontsize or 18
    label.Parent = parent
    return label
end

-- Основной фрейм
local mainFrame = createRoundedFrame(ScreenGui, UDim2.new(0, 300, 0, 120), UDim2.new(0.35, 0, 0.4, 0))
createLabel(mainFrame, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 5), "Jump Control", 22)

-- Кнопка прыжка
local jumpBtn = createButton(mainFrame, UDim2.new(0.8, 0, 0, 40), UDim2.new(0.1, 0, 0, 50), "Double/Triple Jump", Color3.fromRGB(216, 221, 86))

-- Логика прыжка
local hasDoubleJumped = false

local function performDoubleJump()
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if humanoid and not hasDoubleJumped then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        wait(0.1)

        for _, v in ipairs(LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "C4" and v:FindFirstChild("RemoteEvent") then
                v.Parent = character
                wait()
                humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                wait(0.1)
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                v.RemoteEvent:FireServer(Mouse.Hit.LookVector)
                v.Parent = LocalPlayer.Backpack
            end
        end

        wait(0.1)
        for _, v in ipairs(LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "Grenade" and v:FindFirstChild("RemoteEvent") then
                v.Parent = character
                wait()
                humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                wait(0.1)
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                v:Activate()
                v.Parent = LocalPlayer.Backpack
            end
        end

        hasDoubleJumped = true
    end
end

jumpBtn.MouseButton1Click:Connect(function()
    performDoubleJump()
end)
