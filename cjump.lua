local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

-- Rank system (base ranks - Developer, Admin, Premium, or Regular)
local baseRanks = {
    [7143356409] = "Developer", -- WalkerThroughTime1
    [8684351140] = "Developer", -- h1tlisttt
    -- Add more users here
    -- [userId] = "Developer" or "Admin" or "Premium"
}

-- Track active script users
local activeScriptUsers = {}
activeScriptUsers[player.UserId] = true -- Current player is using script

-- Variable to store update function (will be defined later)
local updatePlayersListFunc = nil

-- Function to get user rank (Developer, Admin, Premium, User, or Regular)
local function getUserRank(userId)
    local baseRank = baseRanks[userId]
    
    -- If player has base rank (Developer, Admin, or Premium)
    if baseRank then
        return baseRank
    end
    
    -- If current player is using script but has no base rank, they are User
    if userId == player.UserId then
        return "User" -- Current player using script is always User (if no base rank)
    end
    
    -- If player is in activeScriptUsers, they are User
    if activeScriptUsers[userId] then
        return "User"
    end
    
    -- Otherwise, they are Regular
    return "Regular"
end

-- Function to check if player is using the script
local function isUsingScript(targetPlayer)
    if targetPlayer == player then return true end
    local rank = getUserRank(targetPlayer.UserId)
    -- Player is using script if they have rank Developer, Admin, Premium, or User
    return rank == "Developer" or rank == "Admin" or rank == "Premium" or rank == "User"
end

-- Function to check kick permissions
local function canKick(kickerRank, targetRank, targetUsingScript)
    -- Can only kick players who are using the script
    if not targetUsingScript then
        return false
    end
    
    if kickerRank == "Developer" then
        return targetRank == "Admin" or targetRank == "Premium" or targetRank == "User"
    elseif kickerRank == "Admin" then
        return targetRank == "Premium" or targetRank == "User"
    elseif kickerRank == "Premium" then
        return targetRank == "User"
    end
    return false
end

-- Remove old GUI if exists
if CoreGui:FindFirstChild("ChaosScriptGui") then
    CoreGui:FindFirstChild("ChaosScriptGui"):Destroy()
end

-- Create main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ChaosScriptGui"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Modern color scheme with Emerald theme
local emeraldColor = Color3.fromRGB(80, 200, 120) -- Emerald green
local primaryColor = Color3.fromRGB(80, 200, 120) -- Emerald green
local accentColor = Color3.fromRGB(255, 100, 100)
local premiumColor = Color3.fromRGB(255, 215, 0) -- Yellow
local adminColor = Color3.fromRGB(255, 50, 50) -- Red
local developerColor = Color3.fromRGB(138, 43, 226) -- Purple/Violet for Developer
local userColor = Color3.fromRGB(100, 255, 100) -- Green
local regularColor = Color3.fromRGB(150, 150, 150) -- Gray
local darkColor = Color3.fromRGB(10, 20, 15) -- Dark emerald tint
local cardColor = Color3.fromRGB(20, 30, 25) -- Dark emerald card
local lightCardColor = Color3.fromRGB(30, 40, 35)

-- Function to create rounded frame
local function createRoundedFrame(parent, size, position)
    local frame = Instance.new("Frame")
    frame.Size = size
    frame.Position = position
    frame.BackgroundColor3 = darkColor
    frame.BackgroundTransparency = 0
    frame.BorderSizePixel = 0
    frame.Parent = parent
    frame.ClipsDescendants = true
    frame.Active = true
    frame.Draggable = true
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = frame
    
    -- Modern shadow effect
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Color = Color3.fromRGB(0, 0, 0)
    uiStroke.Transparency = 0.8
    uiStroke.Thickness = 3
    uiStroke.Parent = frame
    
    return frame
end

-- Function to create button with press effect only
local function createButton(parent, size, position, text, color)
    local btn = Instance.new("TextButton")
    btn.Size = size
    btn.Position = position
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = btn
    
    -- Press effect only (no hover)
    local originalColor = color
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = color:lerp(Color3.new(1, 1, 1), 0.3)}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = originalColor}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = originalColor}):Play()
    end)
    
    return btn
end

-- Function to create text label
local function createLabel(parent, size, position, text, fontsize, textColor)
    local label = Instance.new("TextLabel")
    label.Size = size
    label.Position = position
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = textColor or Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamBold
    label.TextSize = fontsize or 18
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Top
    label.Parent = parent
    return label
end

-- Main menu
local main = createRoundedFrame(ScreenGui, UDim2.new(0, 480, 0, 560), UDim2.new(0.02, 0, 0.5, -280))
main.Visible = false

-- Title bar with gradient effect
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 55)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = cardColor
titleBar.BorderSizePixel = 0
titleBar.Parent = main

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 20)
titleCorner.Parent = titleBar

-- Title text
local titleLabel = createLabel(titleBar, UDim2.new(1, -100, 1, 0), UDim2.new(0, 25, 0, 0), "The Emerald Hub", 26, emeraldColor)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Close button with X icon
local closeBtnContainer = Instance.new("Frame")
closeBtnContainer.Size = UDim2.new(0, 45, 0, 45)
closeBtnContainer.Position = UDim2.new(1, -60, 0, 5)
closeBtnContainer.BackgroundColor3 = accentColor
closeBtnContainer.BorderSizePixel = 0
closeBtnContainer.Parent = main

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 12)
closeCorner.Parent = closeBtnContainer

-- Create X icon using TextLabel
local closeX = Instance.new("TextLabel")
closeX.Size = UDim2.new(1, 0, 1, 0)
closeX.Position = UDim2.new(0, 0, 0, 0)
closeX.BackgroundTransparency = 1
closeX.Text = "✕"
closeX.TextColor3 = Color3.new(1, 1, 1)
closeX.Font = Enum.Font.GothamBold
closeX.TextSize = 24
closeX.Parent = closeBtnContainer

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(1, 0, 1, 0)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = ""
closeBtn.Parent = closeBtnContainer

-- Press effect for close button
closeBtn.MouseButton1Down:Connect(function()
    TweenService:Create(closeBtnContainer, TweenInfo.new(0.1), {BackgroundColor3 = accentColor:lerp(Color3.new(1, 1, 1), 0.3)}):Play()
end)
closeBtn.MouseButton1Up:Connect(function()
    TweenService:Create(closeBtnContainer, TweenInfo.new(0.15), {BackgroundColor3 = accentColor}):Play()
end)

-- Tabs
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, -40, 0, 50)
tabBar.Position = UDim2.new(0, 20, 0, 70)
tabBar.BackgroundColor3 = cardColor
tabBar.BorderSizePixel = 0
tabBar.Parent = main

local tabCorner = Instance.new("UICorner")
tabCorner.CornerRadius = UDim.new(0, 12)
tabCorner.Parent = tabBar

-- Create tabs without hover effects
local function createTabButton(parent, size, position, text, color)
    local btn = Instance.new("TextButton")
    btn.Size = size
    btn.Position = position
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = btn
    
    -- Only press effect, no hover
    local originalColor = color
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = color:lerp(Color3.new(1, 1, 1), 0.2)}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = originalColor}):Play()
    end)
    
    return btn
end

local gamepassTab = createTabButton(tabBar, UDim2.new(0.25, -4, 1, -4), UDim2.new(0, 2, 0, 2), "Gamepasses", primaryColor)
local playersTab = createTabButton(tabBar, UDim2.new(0.25, -4, 1, -4), UDim2.new(0.25, 2, 0, 2), "Players", primaryColor)
local infoTab = createTabButton(tabBar, UDim2.new(0.25, -4, 1, -4), UDim2.new(0.5, 2, 0, 2), "Info", primaryColor)
local developersTab = createTabButton(tabBar, UDim2.new(0.25, -4, 1, -4), UDim2.new(0.75, 2, 0, 2), "Devs", primaryColor)

-- Frames for tabs
local gamepassFrame = Instance.new("ScrollingFrame")
gamepassFrame.Size = UDim2.new(1, -40, 1, -130)
gamepassFrame.Position = UDim2.new(0, 20, 0, 130)
gamepassFrame.BackgroundTransparency = 1
gamepassFrame.BorderSizePixel = 0
gamepassFrame.ScrollBarThickness = 6
gamepassFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
gamepassFrame.Parent = main

local infoFrame = Instance.new("Frame")
infoFrame.Size = UDim2.new(1, -40, 1, -130)
infoFrame.Position = UDim2.new(0, 20, 0, 130)
infoFrame.BackgroundTransparency = 1
infoFrame.Visible = false
infoFrame.Parent = main

local playersFrame = Instance.new("ScrollingFrame")
playersFrame.Size = UDim2.new(1, -40, 1, -130)
playersFrame.Position = UDim2.new(0, 20, 0, 130)
playersFrame.BackgroundTransparency = 1
playersFrame.BorderSizePixel = 0
playersFrame.ScrollBarThickness = 6
playersFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
playersFrame.Visible = false
playersFrame.Parent = main

local developersFrame = Instance.new("ScrollingFrame")
developersFrame.Size = UDim2.new(1, -40, 1, -130)
developersFrame.Position = UDim2.new(0, 20, 0, 130)
developersFrame.BackgroundTransparency = 1
developersFrame.BorderSizePixel = 0
developersFrame.ScrollBarThickness = 6
developersFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
developersFrame.Visible = false
developersFrame.Parent = main

-- Function to load user avatar
local function loadUserAvatar(userId, parentFrame, position, displayName, role)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 0, 110)
    container.Position = position
    container.BackgroundColor3 = cardColor
    container.BorderSizePixel = 0
    container.Parent = parentFrame
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 15)
    containerCorner.Parent = container
    
    -- Avatar
    local avatar = Instance.new("ImageLabel")
    avatar.Size = UDim2.new(0, 85, 0, 85)
    avatar.Position = UDim2.new(0, 12, 0, 12)
    avatar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    avatar.BorderSizePixel = 0
    avatar.Parent = container
    
    local avatarCorner = Instance.new("UICorner")
    avatarCorner.CornerRadius = UDim.new(0, 42)
    avatarCorner.Parent = avatar
    
    -- Load avatar
    pcall(function()
        local thumbnail = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
        avatar.Image = thumbnail
    end)
    
    -- Name and role
    createLabel(container, UDim2.new(1, -120, 0, 30), UDim2.new(0, 110, 0, 20), displayName, 20, Color3.new(1, 1, 1))
    createLabel(container, UDim2.new(1, -120, 0, 25), UDim2.new(0, 110, 0, 55), role, 16, Color3.fromRGB(200, 200, 200))
    
    return container
end

-- Add developers
local developer1 = loadUserAvatar(7143356409, developersFrame, UDim2.new(0, 10, 0, 10), "WalkerThroughTime1", "Main Owner & Developer")
local developer2 = loadUserAvatar(8684351140, developersFrame, UDim2.new(0, 10, 0, 130), "h1tlisttt", "Main Developer")

developersFrame.CanvasSize = UDim2.new(0, 0, 0, 250)

-- Gamepass buttons (modern design)
local gpNames = {"Emerald Greatsword", "Blood Dagger", "Frost Spear"}
local btnHeight = 75
local spacing = 15

for i, gpName in ipairs(gpNames) do
    local btnContainer = Instance.new("Frame")
    btnContainer.Size = UDim2.new(1, -20, 0, btnHeight)
    btnContainer.Position = UDim2.new(0, 10, 0, (btnHeight + spacing) * (i - 1) + 10)
    btnContainer.BackgroundColor3 = cardColor
    btnContainer.BorderSizePixel = 0
    btnContainer.Parent = gamepassFrame
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 15)
    containerCorner.Parent = btnContainer
    
    -- Modern border
    local stroke = Instance.new("UIStroke")
    stroke.Color = primaryColor
    stroke.Transparency = 0.6
    stroke.Thickness = 2
    stroke.Parent = btnContainer
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = gpName
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 20
    btn.AutoButtonColor = false
    btn.Parent = btnContainer
    
    -- Press effect only
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btnContainer, TweenInfo.new(0.1), {BackgroundColor3 = primaryColor:lerp(Color3.new(1, 1, 1), 0.2)}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btnContainer, TweenInfo.new(0.15), {BackgroundColor3 = cardColor}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btnContainer, TweenInfo.new(0.1), {BackgroundColor3 = cardColor}):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        local args = {[1] = gpName}
        local menuScreen = player.PlayerGui:FindFirstChild("Menu Screen")
        if menuScreen then
            menuScreen.RemoteEvent:FireServer(unpack(args))
            menuScreen:Remove()
            game.StarterGui:SetCore("SendNotification", {
                Title = "Weapon",
                Text = gpName .. " obtained!",
                Duration = 3
            })
        end
    end)
end

gamepassFrame.CanvasSize = UDim2.new(0, 0, 0, (btnHeight + spacing) * #gpNames + 10)

-- Function to create player card
local function createPlayerCard(targetPlayer, parentFrame, position)
    local playerRank = getUserRank(targetPlayer.UserId)
    local currentPlayerRank = getUserRank(player.UserId)
    local usingScript = isUsingScript(targetPlayer)
    
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, -20, 0, 95)
    card.Position = position
    card.BackgroundColor3 = cardColor
    card.BorderSizePixel = 0
    card.Parent = parentFrame
    
    local cardCorner = Instance.new("UICorner")
    cardCorner.CornerRadius = UDim.new(0, 15)
    cardCorner.Parent = card
    
    -- Rank border (colored frame based on rank)
    local rankBorderColor = regularColor -- Default gray for Regular
    if playerRank == "Developer" then
        rankBorderColor = developerColor -- Purple/Violet
    elseif playerRank == "Premium" then
        rankBorderColor = premiumColor -- Yellow
    elseif playerRank == "Admin" then
        rankBorderColor = adminColor -- Red
    elseif playerRank == "User" then
        rankBorderColor = userColor -- Green
    end
    
    local rankStroke = Instance.new("UIStroke")
    rankStroke.Color = rankBorderColor
    rankStroke.Transparency = 0.3
    rankStroke.Thickness = 3
    rankStroke.Parent = card
    
    -- Avatar
    local avatar = Instance.new("ImageLabel")
    avatar.Size = UDim2.new(0, 75, 0, 75)
    avatar.Position = UDim2.new(0, 10, 0, 10)
    avatar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    avatar.BorderSizePixel = 0
    avatar.Parent = card
    
    local avatarCorner = Instance.new("UICorner")
    avatarCorner.CornerRadius = UDim.new(0, 37)
    avatarCorner.Parent = avatar
    
    -- Load avatar
    pcall(function()
        local thumbnail = Players:GetUserThumbnailAsync(targetPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
        avatar.Image = thumbnail
    end)
    
    -- Player name
    local playerName = createLabel(card, UDim2.new(1, -200, 0, 25), UDim2.new(0, 95, 0, 10), targetPlayer.Name, 18, Color3.new(1, 1, 1))
    
    -- Rank with color
    local rankColor = regularColor -- Regular (gray)
    if playerRank == "Developer" then
        rankColor = developerColor -- Purple/Violet
    elseif playerRank == "Premium" then
        rankColor = premiumColor -- Yellow
    elseif playerRank == "Admin" then
        rankColor = adminColor -- Red
    elseif playerRank == "User" then
        rankColor = userColor -- Green
    end
    
    local rankLabel = createLabel(card, UDim2.new(1, -200, 0, 20), UDim2.new(0, 95, 0, 35), "Rank: " .. playerRank, 16, rankColor)
    
    -- Script status (only show if using script, or if Regular not using)
    local scriptStatusText = ""
    local scriptStatusColor = Color3.fromRGB(200, 200, 200)
    if usingScript then
        scriptStatusText = "Using Script"
        scriptStatusColor = userColor -- Green
    elseif playerRank == "Regular" then
        scriptStatusText = "Not Using Script"
        scriptStatusColor = Color3.fromRGB(200, 200, 200)
    elseif playerRank == "Premium" or playerRank == "Admin" or playerRank == "Developer" then
        -- Don't show status if Premium/Admin/Developer not using script
        scriptStatusText = ""
    end
    
    if scriptStatusText ~= "" then
        createLabel(card, UDim2.new(1, -200, 0, 18), UDim2.new(0, 95, 0, 55), scriptStatusText, 14, scriptStatusColor)
    end
    
    -- Kick button (only if has permission and target is using script)
    if canKick(currentPlayerRank, playerRank, usingScript) and targetPlayer ~= player then
        local kickBtn = createButton(card, UDim2.new(0, 85, 0, 38), UDim2.new(1, -95, 0, 28.5), "Kick", accentColor)
        kickBtn.TextSize = 16
        kickBtn.MouseButton1Click:Connect(function()
            targetPlayer:Kick("Kicked by " .. player.Name)
        end)
    end
    
    return card
end

-- Function to get rank priority for sorting
local function getRankPriority(rank)
    if rank == "Developer" then
        return 1
    elseif rank == "Admin" then
        return 2
    elseif rank == "Premium" then
        return 3
    elseif rank == "User" then
        return 4
    else
        return 5 -- Regular
    end
end

-- Update players list
local function updatePlayersList()
    -- Clear old cards
    for _, child in ipairs(playersFrame:GetChildren()) do
        if child:IsA("Frame") and child.Name ~= "UIPadding" then
            child:Destroy()
        end
    end
    
    local playerList = Players:GetPlayers()
    local currentPlayerRank = getUserRank(player.UserId)
    local currentPlayerUsingScript = isUsingScript(player)
    
    -- Sort players by rank (Developer, Admin, Premium, User first, then Regular)
    table.sort(playerList, function(a, b)
        local rankA = getUserRank(a.UserId)
        local rankB = getUserRank(b.UserId)
        local priorityA = getRankPriority(rankA)
        local priorityB = getRankPriority(rankB)
        
        if priorityA ~= priorityB then
            return priorityA < priorityB
        end
        
        -- If same rank, sort by name
        return a.Name < b.Name
    end)
    
    local cardHeight = 105
    local spacing = 12
    local yOffset = 10
    
    for i, targetPlayer in ipairs(playerList) do
        local targetRank = getUserRank(targetPlayer.UserId)
        local targetUsingScript = isUsingScript(targetPlayer)
        
        -- Script users (Developer, Admin, Premium, User) see other script users + Regular
        -- Regular users see everyone
        local shouldShow = true
        
        if currentPlayerUsingScript then
            -- Current player uses script - show script users and Regular
            shouldShow = targetUsingScript or targetRank == "Regular"
        end
        -- If current player is Regular, show everyone (shouldShow already true)
        
        if shouldShow then
            local card = createPlayerCard(targetPlayer, playersFrame, UDim2.new(0, 10, 0, yOffset))
            yOffset = yOffset + cardHeight + spacing
        end
    end
    
    playersFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end

-- Update list when players join/leave
Players.PlayerAdded:Connect(function()
    updatePlayersList()
end)

-- Initialize players list
updatePlayersList()

-- Store function reference
updatePlayersListFunc = updatePlayersList

-- Create or get RemoteEvent for script tracking
-- NOTE: For full functionality, you need a server script that listens to this RemoteEvent
-- and broadcasts script status to all clients. Without it, script detection will only work locally.
local scriptTracker
if ReplicatedStorage:FindFirstChild("ChaosScriptTracker") then
    scriptTracker = ReplicatedStorage:FindFirstChild("ChaosScriptTracker")
else
    scriptTracker = Instance.new("RemoteEvent")
    scriptTracker.Name = "ChaosScriptTracker"
    scriptTracker.Parent = ReplicatedStorage
end

-- Notify server that we're using the script
scriptTracker:FireServer("ScriptActive", player.UserId)

-- Periodically send heartbeat to maintain active status
task.spawn(function()
    while true do
        task.wait(5) -- Send every 5 seconds
        if scriptTracker then
            scriptTracker:FireServer("ScriptActive", player.UserId)
        end
    end
end)

-- Listen for other players' script status
scriptTracker.OnClientEvent:Connect(function(action, userId)
    if action == "ScriptActive" then
        activeScriptUsers[userId] = true
        if updatePlayersListFunc then
            updatePlayersListFunc()
        end
    elseif action == "ScriptInactive" then
        activeScriptUsers[userId] = nil
        if updatePlayersListFunc then
            updatePlayersListFunc()
        end
    end
end)

-- Clean up on player leaving
Players.PlayerRemoving:Connect(function(leavingPlayer)
    activeScriptUsers[leavingPlayer.UserId] = nil
    if updatePlayersListFunc then
        updatePlayersListFunc()
    end
end)

-- Info tab
local infoTitleLabel = createLabel(infoFrame, UDim2.new(1, 0, 0, 35), UDim2.new(0, 0, 0, 20), "Links & Information", 24, emeraldColor)
infoTitleLabel.TextXAlignment = Enum.TextXAlignment.Center

local discordButton = createButton(infoFrame, UDim2.new(0.85, 0, 0, 50), UDim2.new(0.075, 0, 0, 80), "Discord Server", primaryColor)
discordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/bxubNMDf")
    discordButton.Text = "Copied!"
    task.wait(2)
    discordButton.Text = "Discord Server"
end)

local scriptbloxButton = createButton(infoFrame, UDim2.new(0.85, 0, 0, 50), UDim2.new(0.075, 0, 0, 150), "ScriptBlox", primaryColor)
scriptbloxButton.MouseButton1Click:Connect(function()
    setclipboard("https://scriptblox.com")
    scriptbloxButton.Text = "Copied!"
    task.wait(2)
    scriptbloxButton.Text = "ScriptBlox"
end)

local welcomeLabel = createLabel(infoFrame, UDim2.new(1, -40, 0, 120), UDim2.new(0, 20, 0, 220), 
    "Welcome to The Emerald Hub!\n\nA powerful script hub providing various gamepasses and utilities for your gaming experience.", 16, Color3.fromRGB(200, 200, 200))
welcomeLabel.TextWrapped = true

-- Tab switching
local function switchTab(tabName)
    gamepassFrame.Visible = (tabName == "gamepasses")
    playersFrame.Visible = (tabName == "players")
    infoFrame.Visible = (tabName == "info")
    developersFrame.Visible = (tabName == "developers")
    
    -- Update tab colors
    local tabs = {gamepassTab, playersTab, infoTab, developersTab}
    for _, tab in ipairs(tabs) do
        tab.BackgroundColor3 = cardColor
    end
    
    if tabName == "gamepasses" then
        gamepassTab.BackgroundColor3 = primaryColor
    elseif tabName == "players" then
        playersTab.BackgroundColor3 = primaryColor
        updatePlayersList() -- Update list when opening tab
    elseif tabName == "info" then
        infoTab.BackgroundColor3 = primaryColor
    elseif tabName == "developers" then
        developersTab.BackgroundColor3 = primaryColor
    end
end

gamepassTab.MouseButton1Click:Connect(function()
    switchTab("gamepasses")
end)

playersTab.MouseButton1Click:Connect(function()
    switchTab("players")
end)

infoTab.MouseButton1Click:Connect(function()
    switchTab("info")
end)

developersTab.MouseButton1Click:Connect(function()
    switchTab("developers")
end)

-- Initialize: show Gamepasses tab
switchTab("gamepasses")

-- Handlers
closeBtn.MouseButton1Click:Connect(function()
    main.Visible = false
end)

-- Open menu on RightShift
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.RightShift then
        main.Visible = not main.Visible
    end
end)
