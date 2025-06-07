local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local plrs = game:GetService'Players'
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()

local hasDoubleJumped = false

local function performJump(jumpType)
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass('Humanoid')
    if humanoid and not hasDoubleJumped then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        wait(0.1)

        if jumpType == "Triple" then
            -- C4 jump
            for _,v in next,plr.Backpack:GetChildren() do
                if v.Name == 'C4' and v:FindFirstChild'RemoteEvent' then
                    v.Parent = plr.Character
                    wait()
                    humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                    wait(0.1)
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    v.RemoteEvent:FireServer(mouse.Hit.LookVector)
                    v.Parent = plr.Backpack
                    break -- Prevent multiple C4 jumps
                end
            end
            wait(0.1) --small pause before grenade jump
        end
        -- Grenade jump (common for both double and triple)
        for _,v in next,plr.Backpack:GetChildren() do
            if v.Name == 'Grenade' and v:FindFirstChild'RemoteEvent' then
                v.Parent = plr.Character
                wait()
                humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                wait(0.1)
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                v:Activate()
                v.Parent = plr.Backpack
                break --Prevent multiple grenade jumps
            end
        end
        hasDoubleJumped = true
    end
end

local function onButtonClicked()
    local hasC4 = false
    local hasGrenade = false

    for _, v in next, plr.Backpack:GetChildren() do
        if v.Name == 'C4' and v:FindFirstChild'RemoteEvent' then
            hasC4 = true
        elseif v.Name == 'Grenade' and v:FindFirstChild'RemoteEvent' then
            hasGrenade = true
        end
    end

    if hasC4 and hasGrenade then
        performJump("Triple")
    elseif hasC4 or hasGrenade then
        performJump("Double")
    end
end

-- GUI setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = LocalPlayer.PlayerGui
ScreenGui.Name = "JumpGui"

local Button = Instance.new("TextButton")
Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.8, 0)
Button.Text = "Double/Triple Jump"
Button.BackgroundColor3 = Color3.new(0, 0.5, 1)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.SourceSansBold
Button.MouseButton1Click:Connect(onButtonClicked)

UserInputService.JumpRequest:Connect(function()
	if not hasDoubleJumped then
		onButtonClicked()
	end
end)
