local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local window = library.new({
    Title = "Double/Triple Jump",
    Size = UDim2.fromOffset(300, 150),
    Theme = "Dark"
})

local tab = window:addTab({
    Title = "Jumps"
})

local section = tab:addSection({
    Title = "Jump Settings"
})

local doubleJumpButton = section:addButton({
    Text = "Double Jump",
    Callback = function()
        local Players = game:GetService("Players")
        local UserInputService = game:GetService("UserInputService")
        local LocalPlayer = Players.LocalPlayer

        local plrs = game:GetService'Players'
        local plr = plrs.LocalPlayer
        local mouse = plr:GetMouse()

        local hasDoubleJumped = false

        local function performDoubleJump()
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass('Humanoid')
            if humanoid and not hasDoubleJumped then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                wait(0.1)
                for _,v in next,plr.Backpack:GetChildren() do
                    if v.Name == 'Grenade' and v:FindFirstChild'RemoteEvent' then
                        v.Parent = plr.Character
                        wait()
                        humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                        wait(0.1)
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        v:Activate()
                        v.Parent = plr.Backpack
                    end
                end
                hasDoubleJumped = true
            end
        end
        performDoubleJump()
    end
})

local tripleJumpButton = section:addButton({
    Text = "Triple Jump",
    Callback = function()
        local Players = game:GetService("Players")
        local UserInputService = game:GetService("UserInputService")
        local LocalPlayer = Players.LocalPlayer

        local plrs = game:GetService'Players'
        local plr = plrs.LocalPlayer
        local mouse = plr:GetMouse()

        local hasDoubleJumped = false

        local function performDoubleJump()
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass('Humanoid')
            if humanoid and not hasDoubleJumped then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                wait(0.1)

                for _,v in next,plr.Backpack:GetChildren() do
                    if v.Name == 'C4' and v:FindFirstChild'RemoteEvent' then
                        v.Parent = plr.Character
                        wait()
                        humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                        wait(0.1)
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        v.RemoteEvent:FireServer(mouse.Hit.LookVector)
                        v.Parent = plr.Backpack
                    end
                end

                wait(0.1)
                for _,v in next,plr.Backpack:GetChildren() do
                    if v.Name == 'Grenade' and v:FindFirstChild'RemoteEvent' then
                        v.Parent = plr.Character
                        wait()
                        humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                        wait(0.1)
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        v:Activate()
                        v.Parent = plr.Backpack
                    end
                end
                hasDoubleJumped = true
            end
        end
        performDoubleJump()
    end
})
