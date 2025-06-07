local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local plrs = game:GetService'Players'
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()

local hasDoubleJumped = false
local canTripleJump = false -- Флаг для тройного прыжка

-- Создаем GUI
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("ChaosScriptGui") then
    CoreGui:FindFirstChild("ChaosScriptGui"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ChaosScriptGui"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false -- Чтобы GUI не исчезал после респавна

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

-- GUI для ключа
local keys = {
    ["XAO0466"] = true,
    ["6Y1YJ4K"] = true,
    ["0Z2S23Y"] = true,
    ["14Q2B6A"] = true,
    ["2G2RZAO"] = true,
    ["PCMPRK7"] = true,
    ["X23JF02"] = true,
    ["RI3D1FU"] = true,
    ["A9X7ZQP"] = true,
    ["BX4YJMR"] = true,
    ["C8K2VNS"] = true,
    ["D5MPWQX"] = true,
    ["E7JZLRT"] = true,
    ["F2YUKBC"] = true,
    ["G1QXVNH"] = true,
    ["H9RDAPF"] = true,
    ["J6ZKTME"] = true,
    ["K3BVYXS"] = true,
    ["L8PNDQA"] = true,
    ["M4FJREU"] = true,
    ["N0CXSVT"] = true,
    ["P5YHZKB"] = true,
    ["Q2MDLWR"] = true,
    ["R7UKXJF"] = true,
    ["S1ZNGTV"] = true,
    ["T6BYLQP"] = true,
}

local function isKeyValid(inputKey)
    return keys[inputKey] == true
end

local keyFrame = createRoundedFrame(ScreenGui, UDim2.new(0, 400, 0, 230), UDim2.new(0.35, 0, 0.4, 0))
local keyLabel = createLabel(keyFrame, UDim2.new(1,0,0,30), UDim2.new(0,0,0,10), "Enter your passkey", 22)

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0.9, 0, 0, 40)
keyInput.Position = UDim2.new(0.05, 0, 0, 50)
keyInput.PlaceholderText = "Enter key here"
keyInput.Text = ""
keyInput.ClearTextOnFocus = false
keyInput.BackgroundColor3 = Color3.fromRGB(30,30,30)
keyInput.TextColor3 = Color3.new(1,1,1)
keyInput.Font = Enum.Font.GothamBold
keyInput.TextSize = 18
keyInput.Parent = keyFrame
local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0,10)
inputCorner.Parent = keyInput

local submitButton = createButton(keyFrame, UDim2.new(0.9, 0, 0, 40), UDim2.new(0.05, 0, 0, 100), "Confirm", Color3.fromRGB(216, 221, 86))

local infoLabel = createLabel(keyFrame, UDim2.new(1,0,0,20), UDim2.new(0,0,0,135), "", 16)

local discordInfo = createLabel(keyFrame, UDim2.new(1, -20, 0, 40), UDim2.new(0,10,0,150), 
"To get your key, go to Discord: #support", 16)

local copyBtn = createButton(keyFrame, UDim2.new(0, 160, 0, 35), UDim2.new(0.5, -80, 0, 190), "Copy link", Color3.fromRGB(70, 130, 180))
copyBtn.TextColor3 = Color3.new(1,1,1)
copyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/bxubNMDf")
    copyBtn.Text = "Copied!"
    wait(2)
    copyBtn.Text = "Copy link"
end)

-- GUI для меню
local main = createRoundedFrame(ScreenGui, UDim2.new(0, 340, 0, 220), UDim2.new(0.02, 0, 0.6, 0))
main.Visible = false

local title = createLabel(main, UDim2.new(1, 0, 0, 40), UDim2.new(0,0,0,0), "Chaos Script", 22)

local emeraldBtn = createButton(main, UDim2.new(0, 150, 0, 50), UDim2.new(0.05, 0, 0.25, 0), "Emerald Greatsword", Color3.fromRGB(0, 150, 150))
local bloodBtn = createButton(main, UDim2.new(0, 150, 0, 50), UDim2.new(0.55, 0, 0.25, 0), "Blood Dagger", Color3.fromRGB(150, 0, 0))
local frostBtn = createButton(main, UDim2.new(0, 150, 0, 50), UDim2.new(0.05, 0, 0.55, 0), "Frost Spear", Color3.fromRGB(100, 100, 255))

local closeBtn = createButton(main, UDim2.new(0, 40, 0, 40), UDim2.new(0.87, 0, 0, 0), "❌", Color3.fromRGB(216, 221, 86))
closeBtn.TextSize = 24

local openmain = createRoundedFrame(ScreenGui, UDim2.new(0, 100, 0, 35), UDim2.new(0.001, 0, 0.79, 0))
local openBtn = createButton(openmain, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), "Menu", Color3.fromRGB(216, 221, 86))
openBtn.TextSize = 18

openmain.Visible = false

-- Кнопка для Double/Triple Jump
local jumpButton = createButton(main, UDim2.new(0, 200, 0, 50), UDim2.new(0.2, 0, 0.8, 0), "Double/Triple Jump", Color3.fromRGB(100, 200, 100))
jumpButton.MouseButton1Click:Connect(function()
    performJump()
end)

-- Функции для оружия
emeraldBtn.MouseButton1Down:Connect(function()
    local args = { [1] = "Emerald Greatsword" }
    local menuScreen = player.PlayerGui:FindFirstChild("Menu Screen")
    if menuScreen then
        menuScreen.RemoteEvent:FireServer(unpack(args))
        menuScreen:Remove()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Weapon",
            Text = "Emerald Greatsword obtained!",
            Duration = 3
        })
    end
end)

bloodBtn.MouseButton1Down:Connect(function()
    local args = { [1] = "Blood Dagger" }
    local menuScreen = player.PlayerGui:FindFirstChild("Menu Screen")
    if menuScreen then
        menuScreen.RemoteEvent:FireServer(unpack(args))
        menuScreen:Remove()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Weapon",
            Text = "Blood Dagger obtained!",
            Duration = 3
        })
    end
end)

frostBtn.MouseButton1Down:Connect(function()
    local args = { [1] = "Frost Spear" }
    local menuScreen = player.PlayerGui:FindFirstChild("Menu Screen")
    if menuScreen then
        menuScreen.RemoteEvent:FireServer(unpack(args))
        menuScreen:Remove()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Weapon",
            Text = "Frost Spear obtained!",
            Duration = 3
        })
    end
end)

closeBtn.MouseButton1Down:Connect(function()
    main.Visible = false
    openmain.Visible = true
end)

openBtn.MouseButton1Down:Connect(function()
    keyFrame.Visible = false
    main.Visible = true
    openmain.Visible = false
end)

submitButton.MouseButton1Down:Connect(function()
    local input = keyInput.Text:upper():gsub("%s+", "")
    if isKeyValid(input) then
        infoLabel.Text = "Key accepted! Loading menu..."
        wait(0.3)
        keyFrame.Visible = false
        main.Visible = true
        openmain.Visible = true
    else
        infoLabel.Text = "Invalid or inactive key!"
    end
end)

local function performJump()
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass('Humanoid')

    if humanoid and not hasDoubleJumped then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        wait(0.1)

        local hasGrenade = false
        local hasC4 = false

        -- Проверяем наличие гранаты и C4 в инвентаре
        for _, v in next, plr.Backpack:GetChildren() do
            if v.Name == 'Grenade' and v:FindFirstChild'RemoteEvent' then
                hasGrenade = true
            elseif v.Name == 'C4' and v:FindFirstChild'RemoteEvent' then
                hasC4 = true
            end
        end

        if hasGrenade and hasC4 then
            -- Тройной прыжок
            canTripleJump = true
            humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
            wait(0.1)
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

            for _, v in next, plr.Backpack:GetChildren() do
                if v.Name == 'Grenade' and v:FindFirstChild'RemoteEvent' then
                    v.Parent = plr.Character
                    wait()
                    humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                    wait(0.1)
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    v:Activate()
                    v.Parent = plr.Backpack
                    break
                end
            end
             hasDoubleJumped = true
        elseif hasGrenade or hasC4 then
            -- Двойной прыжок (если есть только граната или C4)
              humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
              wait(0.1)
              humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
             hasDoubleJumped = true
               if hasGrenade then
                for _, v in next, plr.Backpack:GetChildren() do
                  if v.Name == 'Grenade' and v:FindFirstChild'RemoteEvent' then
                    v.Parent = plr.Character
                    wait()
                    v:Activate()
                    v.Parent = plr.Backpack
                    break
                  end
                end
              elseif hasC4 then
                for _, v in next, plr.Backpack:GetChildren() do
                  if v.Name == 'C4' and v:FindFirstChild'RemoteEvent' then
                    v.Parent = plr.Character
                    wait()
                    v.RemoteEvent:FireServer(mouse.Hit.LookVector)
                    v.Parent = plr.Backpack
                    break
                  end
                end
              end
        end

        hasDoubleJumped = true
    end
end

-- Сбрасываем флаг doubleJumped при приземлении
humanoid.StateChanged:Connect(function(oldState, newState)
    if newState == Enum.HumanoidStateType.Landed then
        hasDoubleJumped = false
        canTripleJump = false -- Сбрасываем флаг тройного прыжка
    end
end)
