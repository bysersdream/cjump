local Players = game:GetService("Players")
local player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("ChaosScriptGui") then
    CoreGui:FindFirstChild("ChaosScriptGui"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ChaosScriptGui"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false -- Make the GUI persist after respawn

local function createRoundedFrame(parent, size, position)
    local frame = Instance.new("Frame")
    frame.Size = size
    frame.Position = position
    frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
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
    btn.TextColor3 = Color3.new(0,0,0)
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
    label.TextColor3 = Color3.new(1,1,1)
    label.Font = Enum.Font.GothamBold
    label.TextSize = fontsize or 18
    label.Parent = parent
    return label
end

-- Создаём основное меню
local main = createRoundedFrame(ScreenGui, UDim2.new(0, 340, 0, 120), UDim2.new(0.33, 0, 0.3, 0))

local title = createLabel(main, UDim2.new(1, 0, 0, 40), UDim2.new(0,0,0,0), "Chaos Script", 22)

local doubleJumpBtn = createButton(main, UDim2.new(0, 300, 0, 50), UDim2.new(0.05, 0, 0.3, 0), "Double Jump", Color3.fromRGB(216, 221, 86))

local closeBtn = createButton(main, UDim2.new(0, 40, 0, 40), UDim2.new(0.87, 0, 0, 0), "❌", Color3.fromRGB(216, 221, 86))
closeBtn.TextSize = 24

local openmain = createRoundedFrame(ScreenGui, UDim2.new(0, 100, 0, 35), UDim2.new(0.001, 0, 0.79, 0))
local openBtn = createButton(openmain, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), "Menu", Color3.fromRGB(216, 221, 86))
openBtn.TextSize = 18

-- Initially hide the menu and show open button
main.Visible = false
openmain.Visible = true

-- Double Jump Function
local UserInputService = game:GetService("UserInputService")

local hasDoubleJumped = false

local function performDoubleJump()
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass('Humanoid')
    if humanoid and not hasDoubleJumped then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        wait(0.1)

        for _,v in next,player.Backpack:GetChildren() do
            if v.Name == 'C4' and v:FindFirstChild'RemoteEvent' then
                v.Parent = player.Character
                wait()
                humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                wait(0.1)
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                v.RemoteEvent:FireServer(mouse.Hit.LookVector)
                v.Parent = player.Backpack
            end
        end

        wait(0.1)
        for _,v in next,player.Backpack:GetChildren() do
            if v.Name == 'Grenade' and v:FindFirstChild'RemoteEvent' then
                v.Parent = player.Character
                wait()
                humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                wait(0.1)
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                v:Activate()
                v.Parent = player.Backpack
            end
        end
        hasDoubleJumped = true
    end
end

-- Button click events
doubleJumpBtn.MouseButton1Down:Connect(function()
    performDoubleJump()
end)

closeBtn.MouseButton1Down:Connect(function()
    main.Visible = false
    openmain.Visible = true
end)

openBtn.MouseButton1Down:Connect(function()
    main.Visible = true
    openmain.Visible = false
end
