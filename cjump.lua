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
        local LocalPlayer = Players.LocalPlayer

        local hasDoubleJumped = false

        local function performDoubleJump()
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass('Humanoid')
            if humanoid and not hasDoubleJumped then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                hasDoubleJumped = true
            end
        end

        local function onJumpRequest()
            if not hasDoubleJumped then
                performDoubleJump()
            end
        end

        LocalPlayer.Character.Humanoid.Jumping:Connect(onJumpRequest)
    end
})

local tripleJumpButton = section:addButton({
    Text = "Triple Jump",
    Callback = function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        local jumpsRemaining = 2

        local function performJump()
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass('Humanoid')
            if humanoid and jumpsRemaining > 0 then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                jumpsRemaining = jumpsRemaining - 1
            end
        end

        local function onJumpRequest()
            if jumpsRemaining > 0 then
                performJump()
            end
        end

        LocalPlayer.Character.Humanoid.Jumping:Connect(onJumpRequest)

        -- Reset jumpsRemaining when player touches the ground
        LocalPlayer.Character.Humanoid.StateChanged:Connect(function(oldState, newState)
            if newState == Enum.HumanoidStateType.Landed then
                jumpsRemaining = 2
            end
        end)
    end
})
