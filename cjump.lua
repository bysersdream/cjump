local gui = Instance.new("ScreenGui")
gui.Name = "FreeGamepass"
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.3, 0, 0.3, 0)
frame.Position = UDim2.new(0.35, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Parent = gui
frame.Active = true
frame.Draggable = true

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 0.2, 0)
textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Text = "Free Gamepass Script"
textLabel.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.8, 0, 0.2, 0)
button.Position = UDim2.new(0.1, 0, 0.3, 0)
button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
button.TextColor3 = Color3.new(1, 1, 1)
button.Text = "Equip Free Weapon"
button.Parent = frame

button.MouseButton1Click:Connect(function()
    local weaponId = 850456363
    local weapon = game:GetService("InsertService"):LoadAsset(weaponId)
    weapon.Parent = game.Players.LocalPlayer.Character

    -- Additional code to handle equipping the weapon (e.g., animations, etc.)
    -- This part depends on how the original game handles weapon equipping.

    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
      humanoid:EquipTool(weapon)
    end
end)

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.2, 0, 0.2, 0)
closeButton.Position = UDim2.new(0.8, 0, 0, 0)
closeButton.BackgroundColor3 = Color3.new(0.8, 0, 0)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Text = "X"
closeButton.Parent = frame

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
