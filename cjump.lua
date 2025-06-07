local gui = Instance.new("ScreenGui")
gui.Name = "DoubleJumpGUI"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.Text = "Double Jump"
button.BackgroundColor3 = Color3.new(0, 0.5, 1)
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.SourceSansBold
button.Parent = gui

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function doubleJump()
    if humanoid.FloorMaterial ~= Enum.Material.Air then
        humanoid.Jump = true
        wait(0.1) -- Short delay before throwing the grenade/C4
        
        -- Attempt to find a grenade or C4 in the player's backpack
        local grenade = player.Backpack:FindFirstChild("Grenade")
        local c4 = player.Backpack:FindFirstChild("C4")
        
        local item = grenade or c4 -- Prioritize grenade if both exist. Adjust logic as needed
        
        if item then
            -- Simulate equipping the item if necessary
            if character:FindFirstChild("ToolEquipped") then
                character.ToolEquipped:Destroy()
            end
            
            -- Simulate throwing/detonating the item (replace with actual item usage logic)
            local mouse = player:GetMouse()
            local aimDirection = mouse.Hit.p - character.HumanoidRootPart.Position
            aimDirection = aimDirection.Unit * 50 -- Adjust throw force as needed

            local bomb = item:Clone()
            bomb.Parent = workspace
            bomb.Position = character.HumanoidRootPart.Position

            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = aimDirection
            bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bodyVelocity.Parent = bomb

            game:GetService("Debris"):AddItem(bomb, 3) -- Destroy the bomb after 3 seconds

            item:Destroy()  -- Remove item from inventory


        else
            print("No grenade or C4 found in backpack.")
        end
    else
        print("Cannot double jump in air.")
    end
end

button.MouseButton1Click:Connect(doubleJump)
