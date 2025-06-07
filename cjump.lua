local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local plrs = game:GetService'Players'
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()

local hasDoubleJumped = false
local hasTripleJumped = false

local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("ChaosScriptGui") then
    CoreGui:FindFirstChild("ChaosScriptGui"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ChaosScriptGui"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

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

local doubleJumpEnabled = false

local function performJump(jumpCount)
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass('Humanoid')

    if not humanoid then return end

    if jumpCount == 2 and not hasDoubleJumped then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        hasDoubleJumped = true
    elseif jumpCount == 3 and not hasTripleJumped then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        wait(0.1)
        humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
        wait(0.1)
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        hasTripleJumped = true
    end
end

local function resetJumpFlags()
    hasDoubleJumped = false
    hasTripleJumped = false
end

humanoid = LocalPlayer.Character:WaitForChild("Humanoid")
humanoid.StateChanged:Connect(function(oldState, newState)
    if newState == Enum.HumanoidStateType.Landed then
        resetJumpFlags()
    end
end)

local function onJumpRequested()
    if not doubleJumpEnabled then return end

    local hasGrenade = false
    local hasC4 = false

    for _, v in next, plr.Backpack:GetChildren() do
        if v.Name == 'Grenade' and v:FindFirstChild'RemoteEvent' then
            hasGrenade = true
        elseif v.Name == 'C4' and v:FindFirstChild'RemoteEvent' then
            hasC4 = true
        end
    end

    if hasGrenade and hasC4 then
        performJump(3)
    elseif hasGrenade or hasC4 then
        performJump(2)
    end
end

UserInputService.JumpRequest:Connect(onJumpRequested)


-- GUI setup
local mainFrame = createRoundedFrame(ScreenGui, UDim2.new(0, 200, 0, 80), UDim2.new(0.05, 0, 0.1, 0))
mainFrame.Name = "DoubleJumpGui"

local toggleButton = createButton(mainFrame, UDim2.new(0.9, 0, 0, 40), UDim2.new(0.05, 0, 0.1, 0), "Enable Double/Triple Jump", Color3.fromRGB(100, 100, 255))

local infoLabel = createLabel(mainFrame, UDim2.new(1,0,0,20), UDim2.new(0,0,0,50), "Requires Grenade or C4", 12)

toggleButton.MouseButton1Click:Connect(function()
    doubleJumpEnabled = not doubleJumpEnabled
    if doubleJumpEnabled then
        toggleButton.Text = "Disable Double/Triple Jump"
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    else
        toggleButton.Text = "Enable Double/Triple Jump"
        toggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
    end
end)
