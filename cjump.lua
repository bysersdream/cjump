local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local plrs = game:GetService'Players'
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()

local hasDoubleJumped = false
local hasTripleJumped = false

-- GUI setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DoubleTripleJumpGUI"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local DragFrame = Instance.new("Frame")
DragFrame.Name = "DragFrame"
DragFrame.Size = UDim2.new(0, 200, 0, 50)
DragFrame.Position = UDim2.new(0.5, -100, 0.5, -25)
DragFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
DragFrame.BorderSizePixel = 0
DragFrame.Draggable = true
DragFrame.Parent = ScreenGui

local Button = Instance.new("TextButton")
Button.Name = "JumpButton"
Button.Size = UDim2.new(1, 0, 1, 0)
Button.Text = "Double/Triple Jump"
Button.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.SourceSans
Button.TextScaled = true
Button.TextWrapped = false
Button.Parent = DragFrame

local function performJump(jumpCount)
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass('Humanoid')

    if humanoid then
        for i = 1, jumpCount do
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            wait(0.1)
        end
    end
end

local function activateGrenade()
    for _,v in next,plr.Backpack:GetChildren() do
        if v.Name == 'Grenade' and v:FindFirstChild'RemoteEvent' then
            v.Parent = plr.Character
            wait()
            local humanoid = plr.Character:FindFirstChildOfClass('Humanoid')
			if humanoid then
				humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
				wait(0.1)
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				v:Activate()
				v.Parent = plr.Backpack
			end
            break
        end
    end
end

local function activateC4()
    for _,v in next,plr.Backpack:GetChildren() do
        if v.Name == 'C4' and v:FindFirstChild'RemoteEvent' then
            v.Parent = plr.Character
            wait()
			local humanoid = plr.Character:FindFirstChildOfClass('Humanoid')
			if humanoid then
				humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
				wait(0.1)
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            	v.RemoteEvent:FireServer(mouse.Hit.LookVector)
            	v.Parent = plr.Backpack
			end
            break
        end
    end
end


Button.MouseButton1Click:Connect(function()
    local hasGrenade = false
    local hasC4 = false

    for _,v in next,plr.Backpack:GetChildren() do
        if v.Name == 'Grenade' and v:FindFirstChild'RemoteEvent' then
            hasGrenade = true
        end
        if v.Name == 'C4' and v:FindFirstChild'RemoteEvent' then
            hasC4 = true
        end
    end

    if hasGrenade and hasC4 then
        if not hasTripleJumped then
            performJump(3)
            activateC4()
            activateGrenade()
            hasTripleJumped = true
            hasDoubleJumped = false -- Reset double jump flag
        end

    elseif hasGrenade or hasC4 then
        if not hasDoubleJumped then
            performJump(2)
            if hasGrenade then
                activateGrenade()
            else
                activateC4()
            end
            hasDoubleJumped = true
            hasTripleJumped = false -- Reset triple jump flag
        end
    else
        if not hasDoubleJumped then
            performJump(2)
            hasDoubleJumped = true
            hasTripleJumped = false
        end
    end

    -- Reset jump flags after a short delay
    wait(2)
    hasDoubleJumped = false
    hasTripleJumped = false
end)
