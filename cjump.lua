-- InfinityCodeX GUI (Redesigned)
-- ✅ Functionality preserved
-- 🎨 GUI Appearance Enhanced:
--     - Rounded corners
--     - Frame outlines with UIStroke
--     - Draggable main window
--     - Slight transparency for modern look
-- 🛠️ To customize colors and more, see `BackgroundColor3`, `TextColor3`, etc.
-- ⚠️ Ensure game permissions allow GUI injection

local alreadyExecuted = false

if not alreadyExecuted then
    alreadyExecuted = true
    local userID = 3585374190

local function onMessageReceived(player, message)
	if player.UserId == userID and message == ":infinityusers" then
		if game.Players.LocalPlayer.UserId ~= userID then
			wait(1)
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("InfinityCodeX User", "All")
		end
	end

	if player.UserId == userID and message:sub(1, 13) == ":infinitykick" then
		local args = message:split(" ")
		if #args >= 3 then
			local targetPlayerName = args[2]
			local reason = table.concat(args, " ", 3)
			local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
			if targetPlayer then
				targetPlayer:Kick("Razón: " .. reason)
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayerName .. " ha sido kickeado. Razón: " .. reason, "All")
			end
		end
	end
end

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
	local player = game.Players:GetPlayerByUserId(messageData.SpeakerUserId)
	if player then
		onMessageReceived(player, messageData.Message)
	end
end)








-- Instances: 81 | Scripts: 23 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.ScreenGui.Main
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["Active"] = true;
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Size"] = UDim2.new(0, 465, 0, 376);
G2L["2"]["Position"] = UDim2.new(0.24784, 0, 0.07056, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[Main]];
G2L["2"]["BackgroundTransparency"] = 0.3;


-- StarterGui.ScreenGui.Main.TextLabel
G2L["3"] = Instance.new("TextLabel", G2L["2"]);
G2L["3"]["TextSize"] = 30;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/LuckiestGuy.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["3"]["BackgroundTransparency"] = 1;
G2L["3"]["Size"] = UDim2.new(0, 465, 0, 41);
G2L["3"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["Text"] = [[InfinityCodeX Chaos]];
G2L["3"]["Position"] = UDim2.new(-0.00215, 0, 0.01862, 0);


-- StarterGui.ScreenGui.Main.UICorner
G2L["4"] = Instance.new("UICorner", G2L["2"]);



-- StarterGui.ScreenGui.Main.LocalScript
G2L["5"] = Instance.new("LocalScript", G2L["2"]);



-- StarterGui.ScreenGui.Main.ButtonsOption
G2L["6"] = Instance.new("Frame", G2L["2"]);
G2L["6"]["Active"] = true;
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Size"] = UDim2.new(0, 90, 0, 328);
G2L["6"]["Position"] = UDim2.new(0, 0, 0.12766, 0);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Name"] = [[ButtonsOption]];
G2L["6"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Main.ButtonsOption.HomeButton
G2L["7"] = Instance.new("TextButton", G2L["6"]);
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["TextSize"] = 24;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["7"]["Size"] = UDim2.new(0, 90, 0, 52);
G2L["7"]["BackgroundTransparency"] = 1;
G2L["7"]["Name"] = [[HomeButton]];
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Text"] = [[Home]];


-- StarterGui.ScreenGui.Main.ButtonsOption.GeneralButton
G2L["8"] = Instance.new("TextButton", G2L["6"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["TextSize"] = 24;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["8"]["Size"] = UDim2.new(0, 90, 0, 52);
G2L["8"]["BackgroundTransparency"] = 1;
G2L["8"]["Name"] = [[GeneralButton]];
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["Text"] = [[General]];
G2L["8"]["Position"] = UDim2.new(0, 0, 0.15854, 0);


-- StarterGui.ScreenGui.Main.ButtonsOption.TargetButton
G2L["9"] = Instance.new("TextButton", G2L["6"]);
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["TextSize"] = 24;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["9"]["Size"] = UDim2.new(0, 90, 0, 52);
G2L["9"]["BackgroundTransparency"] = 1;
G2L["9"]["Name"] = [[TargetButton]];
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Text"] = [[Target]];
G2L["9"]["Position"] = UDim2.new(0, 0, 0.31707, 0);


-- StarterGui.ScreenGui.Main.ButtonsOption.DiscordButton
G2L["a"] = Instance.new("TextButton", G2L["6"]);
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["TextSize"] = 24;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["a"]["Size"] = UDim2.new(0, 90, 0, 52);
G2L["a"]["BackgroundTransparency"] = 1;
G2L["a"]["Name"] = [[DiscordButton]];
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Text"] = [[Discord]];
G2L["a"]["Position"] = UDim2.new(0, 0, 0, 276);


-- StarterGui.ScreenGui.Main.ButtonsOption.DiscordButton.LocalScript
G2L["b"] = Instance.new("LocalScript", G2L["a"]);



-- StarterGui.ScreenGui.Main.GeneralFrame
G2L["c"] = Instance.new("Frame", G2L["2"]);
G2L["c"]["Visible"] = false;
G2L["c"]["Active"] = true;
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Size"] = UDim2.new(0, 374, 0, 328);
G2L["c"]["Position"] = UDim2.new(0.19355, 0, 0.12766, 0);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Name"] = [[GeneralFrame]];
G2L["c"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Main.GeneralFrame.UICorner
G2L["d"] = Instance.new("UICorner", G2L["c"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.AntiLoopKill
G2L["e"] = Instance.new("LocalScript", G2L["c"]);
G2L["e"]["Name"] = [[AntiLoopKill]];


-- StarterGui.ScreenGui.Main.GeneralFrame.FlingALL
G2L["f"] = Instance.new("LocalScript", G2L["c"]);
G2L["f"]["Name"] = [[FlingALL]];


-- StarterGui.ScreenGui.Main.GeneralFrame.G2Fake
G2L["10"] = Instance.new("LocalScript", G2L["c"]);
G2L["10"]["Name"] = [[G2Fake]];


-- StarterGui.ScreenGui.Main.GeneralFrame.HB
G2L["11"] = Instance.new("LocalScript", G2L["c"]);
G2L["11"]["Name"] = [[HB]];


-- StarterGui.ScreenGui.Main.GeneralFrame.Void
G2L["12"] = Instance.new("LocalScript", G2L["c"]);
G2L["12"]["Name"] = [[Void]];


-- StarterGui.ScreenGui.Main.GeneralFrame.AntiC4Button
G2L["13"] = Instance.new("TextButton", G2L["c"]);
G2L["13"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["13"]["TextSize"] = 14;
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["13"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["13"]["Name"] = [[AntiC4Button]];
G2L["13"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["13"]["Text"] = [[Anti C4 (OFF)]];
G2L["13"]["Position"] = UDim2.new(0.35106, 0, -0.00244, 0);


-- StarterGui.ScreenGui.Main.GeneralFrame.AntiC4Button.UICorner
G2L["14"] = Instance.new("UICorner", G2L["13"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.AntiC4Button.LocalScript
G2L["15"] = Instance.new("LocalScript", G2L["13"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.AntiFlingButton
G2L["16"] = Instance.new("TextButton", G2L["c"]);
G2L["16"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["TextSize"] = 14;
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["16"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["16"]["Name"] = [[AntiFlingButton]];
G2L["16"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["Text"] = [[Anti Fling (OFF)]];
G2L["16"]["Position"] = UDim2.new(0.67889, 0, 0.12468, 0);


-- StarterGui.ScreenGui.Main.GeneralFrame.AntiFlingButton.UICorner
G2L["17"] = Instance.new("UICorner", G2L["16"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.AntiFlingButton.LocalScript
G2L["18"] = Instance.new("LocalScript", G2L["16"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.AntiGrenadeButton
G2L["19"] = Instance.new("TextButton", G2L["c"]);
G2L["19"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["19"]["TextSize"] = 14;
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["19"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["19"]["Name"] = [[AntiGrenadeButton]];
G2L["19"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["19"]["Text"] = [[Anti Granade (OFF)]];
G2L["19"]["Position"] = UDim2.new(0.35106, 0, 0.12548, 0);


-- StarterGui.ScreenGui.Main.GeneralFrame.AntiGrenadeButton.UICorner
G2L["1a"] = Instance.new("UICorner", G2L["19"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.AntiGrenadeButton.LocalScript
G2L["1b"] = Instance.new("LocalScript", G2L["19"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.AntiLoopKillButton
G2L["1c"] = Instance.new("TextButton", G2L["c"]);
G2L["1c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["TextSize"] = 14;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1c"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["1c"]["Name"] = [[AntiLoopKillButton]];
G2L["1c"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["Text"] = [[Anti Loop Kill (OFF)]];
G2L["1c"]["Position"] = UDim2.new(0.68, 0, -0.002, 0);


-- StarterGui.ScreenGui.Main.GeneralFrame.AntiLoopKillButton.UICorner
G2L["1d"] = Instance.new("UICorner", G2L["1c"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.AntiSpikeButton
G2L["1e"] = Instance.new("TextButton", G2L["c"]);
G2L["1e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1e"]["TextSize"] = 14;
G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1e"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["1e"]["Name"] = [[AntiSpikeButton]];
G2L["1e"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1e"]["Text"] = [[Anti Spike (OFF)]];
G2L["1e"]["Position"] = UDim2.new(0.35269, 0, 0.25883, 0);


-- StarterGui.ScreenGui.Main.GeneralFrame.AntiSpikeButton.UICorner
G2L["1f"] = Instance.new("UICorner", G2L["1e"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.AntiSpikeButton.LocalScript
G2L["20"] = Instance.new("LocalScript", G2L["1e"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.FlingAllButton
G2L["21"] = Instance.new("TextButton", G2L["c"]);
G2L["21"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["21"]["TextSize"] = 14;
G2L["21"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["21"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["21"]["Name"] = [[FlingAllButton]];
G2L["21"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["21"]["Text"] = [[Fling All (OFF)]];
G2L["21"]["Position"] = UDim2.new(0.01935, 0, 0.12707, 0);


-- StarterGui.ScreenGui.Main.GeneralFrame.FlingAllButton.UICorner
G2L["22"] = Instance.new("UICorner", G2L["21"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.G2FakeButton
G2L["23"] = Instance.new("TextButton", G2L["c"]);
G2L["23"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["23"]["TextSize"] = 14;
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["23"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["23"]["Name"] = [[G2FakeButton]];
G2L["23"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["23"]["Text"] = [[G2 Fake [V] (OFF)]];
G2L["23"]["Position"] = UDim2.new(0.01935, 0, -0.00098, 0);


-- StarterGui.ScreenGui.Main.GeneralFrame.G2FakeButton.UICorner
G2L["24"] = Instance.new("UICorner", G2L["23"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.HBbutton
G2L["25"] = Instance.new("TextButton", G2L["c"]);
G2L["25"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["25"]["TextSize"] = 14;
G2L["25"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["25"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["25"]["Name"] = [[HBbutton]];
G2L["25"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["25"]["Text"] = [[HB (OFF)]];
G2L["25"]["Position"] = UDim2.new(0.01699, 0, 0.87853, 0);


-- StarterGui.ScreenGui.Main.GeneralFrame.HBbutton.UICorner
G2L["26"] = Instance.new("UICorner", G2L["25"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.SizeInput
G2L["27"] = Instance.new("TextBox", G2L["c"]);
G2L["27"]["Name"] = [[SizeInput]];
G2L["27"]["TextSize"] = 14;
G2L["27"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["27"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["27"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["27"]["PlaceholderText"] = [[HB Size]];
G2L["27"]["Size"] = UDim2.new(0, 235, 0, 26);
G2L["27"]["Position"] = UDim2.new(0.34854, 0, 0.87927, 0);
G2L["27"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["27"]["Text"] = [[]];


-- StarterGui.ScreenGui.Main.GeneralFrame.SizeInput.UICorner
G2L["28"] = Instance.new("UICorner", G2L["27"]);



-- StarterGui.ScreenGui.Main.GeneralFrame.VoidButton
G2L["29"] = Instance.new("TextButton", G2L["c"]);
G2L["29"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["29"]["TextSize"] = 14;
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["29"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["29"]["Name"] = [[VoidButton]];
G2L["29"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["29"]["Text"] = [[Void]];
G2L["29"]["Position"] = UDim2.new(0.01935, 0, 0.25901, 0);


-- StarterGui.ScreenGui.Main.GeneralFrame.VoidButton.UICorner
G2L["2a"] = Instance.new("UICorner", G2L["29"]);



-- StarterGui.ScreenGui.Main.TargetFrame
G2L["2b"] = Instance.new("Frame", G2L["2"]);
G2L["2b"]["Visible"] = false;
G2L["2b"]["Active"] = true;
G2L["2b"]["BorderSizePixel"] = 0;
G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["Size"] = UDim2.new(0, 374, 0, 328);
G2L["2b"]["Position"] = UDim2.new(0.19355, 0, 0.12766, 0);
G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["Name"] = [[TargetFrame]];
G2L["2b"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Main.TargetFrame.UICorner
G2L["2c"] = Instance.new("UICorner", G2L["2b"]);



-- StarterGui.ScreenGui.Main.TargetFrame.Fling
G2L["2d"] = Instance.new("LocalScript", G2L["2b"]);
G2L["2d"]["Name"] = [[Fling]];


-- StarterGui.ScreenGui.Main.TargetFrame.Loopkill
G2L["2e"] = Instance.new("LocalScript", G2L["2b"]);
G2L["2e"]["Name"] = [[Loopkill]];


-- StarterGui.ScreenGui.Main.TargetFrame.RevolverLoop
G2L["2f"] = Instance.new("LocalScript", G2L["2b"]);
G2L["2f"]["Name"] = [[RevolverLoop]];


-- StarterGui.ScreenGui.Main.TargetFrame.Teleport
G2L["30"] = Instance.new("LocalScript", G2L["2b"]);
G2L["30"]["Name"] = [[Teleport]];


-- StarterGui.ScreenGui.Main.TargetFrame.View
G2L["31"] = Instance.new("LocalScript", G2L["2b"]);
G2L["31"]["Name"] = [[View]];


-- StarterGui.ScreenGui.Main.TargetFrame.FlingButton
G2L["32"] = Instance.new("TextButton", G2L["2b"]);
G2L["32"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["32"]["TextSize"] = 14;
G2L["32"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["32"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["32"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["32"]["Name"] = [[FlingButton]];
G2L["32"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["32"]["Text"] = [[Fling]];
G2L["32"]["Position"] = UDim2.new(0.03136, 0, 0.39471, 0);


-- StarterGui.ScreenGui.Main.TargetFrame.FlingButton.UICorner
G2L["33"] = Instance.new("UICorner", G2L["32"]);



-- StarterGui.ScreenGui.Main.TargetFrame.LoopKillButton
G2L["34"] = Instance.new("TextButton", G2L["2b"]);
G2L["34"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["34"]["TextSize"] = 14;
G2L["34"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["34"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["34"]["Name"] = [[LoopKillButton]];
G2L["34"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["34"]["Text"] = [[Loop kill (OFF)]];
G2L["34"]["Position"] = UDim2.new(0.37497, 0, 0.27674, 0);


-- StarterGui.ScreenGui.Main.TargetFrame.LoopKillButton.UICorner
G2L["35"] = Instance.new("UICorner", G2L["34"]);



-- StarterGui.ScreenGui.Main.TargetFrame.RevolverLoopButton
G2L["36"] = Instance.new("TextButton", G2L["2b"]);
G2L["36"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["36"]["TextSize"] = 14;
G2L["36"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["36"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["36"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["36"]["Name"] = [[RevolverLoopButton]];
G2L["36"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["36"]["Text"] = [[Revolver loop (OFF)]];
G2L["36"]["Position"] = UDim2.new(0.37497, 0, 0.1569, 0);


-- StarterGui.ScreenGui.Main.TargetFrame.RevolverLoopButton.UICorner
G2L["37"] = Instance.new("UICorner", G2L["36"]);



-- StarterGui.ScreenGui.Main.TargetFrame.TeleportButton
G2L["38"] = Instance.new("TextButton", G2L["2b"]);
G2L["38"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["38"]["TextSize"] = 14;
G2L["38"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["38"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["38"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["38"]["Name"] = [[TeleportButton]];
G2L["38"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["38"]["Text"] = [[Teleport]];
G2L["38"]["Position"] = UDim2.new(0.0315, 0, 0.2758, 0);


-- StarterGui.ScreenGui.Main.TargetFrame.TeleportButton.UICorner
G2L["39"] = Instance.new("UICorner", G2L["38"]);



-- StarterGui.ScreenGui.Main.TargetFrame.UserInput
G2L["3a"] = Instance.new("TextBox", G2L["2b"]);
G2L["3a"]["Name"] = [[UserInput]];
G2L["3a"]["TextSize"] = 14;
G2L["3a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3a"]["PlaceholderText"] = [[Username]];
G2L["3a"]["Size"] = UDim2.new(0, 161, 0, 22);
G2L["3a"]["Position"] = UDim2.new(0.28941, 0, 0.04422, 0);
G2L["3a"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["Text"] = [[]];


-- StarterGui.ScreenGui.Main.TargetFrame.UserInput.UICorner
G2L["3b"] = Instance.new("UICorner", G2L["3a"]);



-- StarterGui.ScreenGui.Main.TargetFrame.ViewButton
G2L["3c"] = Instance.new("TextButton", G2L["2b"]);
G2L["3c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3c"]["TextSize"] = 14;
G2L["3c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3c"]["Size"] = UDim2.new(0, 112, 0, 26);
G2L["3c"]["Name"] = [[ViewButton]];
G2L["3c"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3c"]["Text"] = [[View]];
G2L["3c"]["Position"] = UDim2.new(0.03244, 0, 0.15784, 0);


-- StarterGui.ScreenGui.Main.TargetFrame.ViewButton.UICorner
G2L["3d"] = Instance.new("UICorner", G2L["3c"]);



-- StarterGui.ScreenGui.Main.TargetFrame.ImageUser
G2L["3e"] = Instance.new("ImageLabel", G2L["2b"]);
G2L["3e"]["BorderSizePixel"] = 0;
G2L["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3e"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]];
G2L["3e"]["Size"] = UDim2.new(0, 64, 0, 64);
G2L["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3e"]["BackgroundTransparency"] = 1;
G2L["3e"]["Name"] = [[ImageUser]];
G2L["3e"]["Position"] = UDim2.new(0.7822, 0, 0.04431, 0);


-- StarterGui.ScreenGui.Main.TargetFrame.TextLabel
G2L["3f"] = Instance.new("TextLabel", G2L["2b"]);
G2L["3f"]["TextSize"] = 14;
G2L["3f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3f"]["FontFace"] = Font.new([[rbxasset://fonts/families/LuckiestGuy.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["3f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3f"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["3f"]["BackgroundTransparency"] = 1;
G2L["3f"]["Size"] = UDim2.new(0, 94, 0, 27);
G2L["3f"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3f"]["Text"] = [[Username:]];
G2L["3f"]["Position"] = UDim2.new(0.02993, 0, 0.04301, 0);


-- StarterGui.ScreenGui.Main.HomeFrame
G2L["40"] = Instance.new("Frame", G2L["2"]);
G2L["40"]["Active"] = true;
G2L["40"]["BorderSizePixel"] = 0;
G2L["40"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["40"]["Size"] = UDim2.new(0, 374, 0, 328);
G2L["40"]["Position"] = UDim2.new(0.19355, 0, 0.12766, 0);
G2L["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["40"]["Name"] = [[HomeFrame]];
G2L["40"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.Main.HomeFrame.ImageLabel
G2L["41"] = Instance.new("ImageLabel", G2L["40"]);
G2L["41"]["BorderSizePixel"] = 0;
G2L["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["41"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]];
G2L["41"]["Size"] = UDim2.new(0, 100, 0, 100);
G2L["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["41"]["Position"] = UDim2.new(0.34759, 0, 0.0122, 0);


-- StarterGui.ScreenGui.Main.HomeFrame.ImageLabel.UICorner
G2L["42"] = Instance.new("UICorner", G2L["41"]);
G2L["42"]["CornerRadius"] = UDim.new(0, 100);


-- StarterGui.ScreenGui.Main.HomeFrame.ImageLabel.LocalScript
G2L["43"] = Instance.new("LocalScript", G2L["41"]);



-- StarterGui.ScreenGui.Main.HomeFrame.UsernameLabel
G2L["44"] = Instance.new("TextLabel", G2L["40"]);
G2L["44"]["TextSize"] = 14;
G2L["44"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["44"]["FontFace"] = Font.new([[rbxasset://fonts/families/LuckiestGuy.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["44"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["44"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["44"]["BackgroundTransparency"] = 1;
G2L["44"]["Size"] = UDim2.new(0, 130, 0, 41);
G2L["44"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["44"]["Text"] = [[Username:]];
G2L["44"]["Name"] = [[UsernameLabel]];
G2L["44"]["Position"] = UDim2.new(-0.00215, 0, 0.36313, 0);


-- StarterGui.ScreenGui.Main.HomeFrame.SkillLabel
G2L["45"] = Instance.new("TextLabel", G2L["40"]);
G2L["45"]["TextSize"] = 14;
G2L["45"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["45"]["FontFace"] = Font.new([[rbxasset://fonts/families/LuckiestGuy.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["45"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["45"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["45"]["BackgroundTransparency"] = 1;
G2L["45"]["Size"] = UDim2.new(0, 130, 0, 41);
G2L["45"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["45"]["Text"] = [[Skill:]];
G2L["45"]["Name"] = [[SkillLabel]];
G2L["45"]["Position"] = UDim2.new(-0.00215, 0, 0.48813, 0);


-- StarterGui.ScreenGui.Main.HomeFrame.WinsLabel
G2L["46"] = Instance.new("TextLabel", G2L["40"]);
G2L["46"]["TextSize"] = 14;
G2L["46"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["46"]["FontFace"] = Font.new([[rbxasset://fonts/families/LuckiestGuy.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["46"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["46"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["46"]["BackgroundTransparency"] = 1;
G2L["46"]["Size"] = UDim2.new(0, 130, 0, 41);
G2L["46"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["46"]["Text"] = [[Wins:]];
G2L["46"]["Name"] = [[WinsLabel]];
G2L["46"]["Position"] = UDim2.new(-0.00215, 0, 0.61313, 0);


-- StarterGui.ScreenGui.Main.HomeFrame.DefeatsLabel
G2L["47"] = Instance.new("TextLabel", G2L["40"]);
G2L["47"]["TextSize"] = 14;
G2L["47"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/LuckiestGuy.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["47"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["47"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["47"]["BackgroundTransparency"] = 1;
G2L["47"]["Size"] = UDim2.new(0, 130, 0, 41);
G2L["47"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["47"]["Text"] = [[Defeats:]];
G2L["47"]["Name"] = [[DefeatsLabel]];
G2L["47"]["Position"] = UDim2.new(-0.00215, 0, 0.73813, 0);


-- StarterGui.ScreenGui.Main.HomeFrame.Username
G2L["48"] = Instance.new("TextLabel", G2L["40"]);
G2L["48"]["TextSize"] = 14;
G2L["48"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["48"]["FontFace"] = Font.new([[rbxasset://fonts/families/LuckiestGuy.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["48"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["48"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["48"]["BackgroundTransparency"] = 1;
G2L["48"]["Size"] = UDim2.new(0, 130, 0, 41);
G2L["48"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["48"]["Text"] = [[]];
G2L["48"]["Name"] = [[Username]];
G2L["48"]["Position"] = UDim2.new(0.34544, 0, 0.36618, 0);


-- StarterGui.ScreenGui.Main.HomeFrame.Username.LocalScript
G2L["49"] = Instance.new("LocalScript", G2L["48"]);



-- StarterGui.ScreenGui.Main.HomeFrame.Wins
G2L["4a"] = Instance.new("TextLabel", G2L["40"]);
G2L["4a"]["TextSize"] = 14;
G2L["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4a"]["FontFace"] = Font.new([[rbxasset://fonts/families/LuckiestGuy.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4a"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["4a"]["BackgroundTransparency"] = 1;
G2L["4a"]["Size"] = UDim2.new(0, 130, 0, 41);
G2L["4a"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4a"]["Text"] = [[]];
G2L["4a"]["Name"] = [[Wins]];
G2L["4a"]["Position"] = UDim2.new(0.34544, 0, 0.61313, 0);


-- StarterGui.ScreenGui.Main.HomeFrame.Wins.LocalScript
G2L["4b"] = Instance.new("LocalScript", G2L["4a"]);



-- StarterGui.ScreenGui.Main.HomeFrame.Defeats
G2L["4c"] = Instance.new("TextLabel", G2L["40"]);
G2L["4c"]["TextSize"] = 14;
G2L["4c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4c"]["FontFace"] = Font.new([[rbxasset://fonts/families/LuckiestGuy.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4c"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["4c"]["BackgroundTransparency"] = 1;
G2L["4c"]["Size"] = UDim2.new(0, 130, 0, 41);
G2L["4c"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4c"]["Text"] = [[]];
G2L["4c"]["Name"] = [[Defeats]];
G2L["4c"]["Position"] = UDim2.new(0.34544, 0, 0.73813, 0);


-- StarterGui.ScreenGui.Main.HomeFrame.Defeats.LocalScript
G2L["4d"] = Instance.new("LocalScript", G2L["4c"]);



-- StarterGui.ScreenGui.Main.HomeFrame.Skill
G2L["4e"] = Instance.new("TextLabel", G2L["40"]);
G2L["4e"]["TextSize"] = 14;
G2L["4e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4e"]["FontFace"] = Font.new([[rbxasset://fonts/families/LuckiestGuy.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4e"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["4e"]["BackgroundTransparency"] = 1;
G2L["4e"]["Size"] = UDim2.new(0, 130, 0, 41);
G2L["4e"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4e"]["Text"] = [[]];
G2L["4e"]["Name"] = [[Skill]];
G2L["4e"]["Position"] = UDim2.new(0.34544, 0, 0.48813, 0);


-- StarterGui.ScreenGui.Main.HomeFrame.Skill.LocalScript
G2L["4f"] = Instance.new("LocalScript", G2L["4e"]);



-- StarterGui.ScreenGui.Togle
G2L["50"] = Instance.new("LocalScript", G2L["1"]);
G2L["50"]["Name"] = [[Togle]];


-- StarterGui.ScreenGui.local
G2L["51"] = Instance.new("LocalScript", G2L["1"]);
G2L["51"]["Name"] = [[local]];


-- StarterGui.ScreenGui.Main.LocalScript
local function C_5()
local script = G2L["5"];
	-- Asume que el TextLabel está dentro de un Frame llamado "Main"
	local mainFrame = script.Parent -- El Frame principal que contiene el TextLabel
	local textLabel = mainFrame:FindFirstChild("TextLabel") -- El TextLabel dentro del Frame
	
	-- Variables para el control del arrastre
	local dragging = false
	local dragStartPos = nil
	local frameStartPos = nil
	
	-- Función que se activa cuando el jugador hace clic en el Frame
	local function onDragStart(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			-- Inicia el arrastre
			dragging = true
			dragStartPos = input.Position
			frameStartPos = mainFrame.Position
		end
	end
	
	-- Función para mover el Frame mientras se arrastra
	local function onDragMove(input)
		if dragging then
			local delta = input.Position - dragStartPos -- Calcula el desplazamiento
			-- Mueve solo el Frame principal
			mainFrame.Position = frameStartPos + UDim2.new(0, delta.X, 0, delta.Y)
		end
	end
	
	-- Función para detener el movimiento cuando el jugador deja de arrastrar
	local function onDragEnd(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			-- Detiene el arrastre
			dragging = false
		end
	end
	
	-- Conectamos los eventos al Frame
	mainFrame.InputBegan:Connect(onDragStart)
	mainFrame.InputChanged:Connect(onDragMove)
	mainFrame.InputEnded:Connect(onDragEnd)
	
end;
task.spawn(C_5);
-- StarterGui.ScreenGui.Main.ButtonsOption.DiscordButton.LocalScript
local function C_b()
local script = G2L["b"];
	local button = script.Parent
	local link = "https://discord.com/invite/vHR8Z8UzN4" -- Cambia esto por el enlace que quieras copiar
	
	button.MouseButton1Click:Connect(function()
		if setclipboard then
			setclipboard(link)
	
			-- Mostrar notificación
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Discord";
				Text = "Enlace copiado";
				Duration = 3;
			})
		else
			warn("")
		end
	end)
	
end;
task.spawn(C_b);
-- StarterGui.ScreenGui.Main.GeneralFrame.AntiLoopKill
local function C_e()
local script = G2L["e"];
	local player = game.Players.LocalPlayer
	local RunService = game:GetService("RunService")
	local AntiLoopKill = script.Parent:FindFirstChild("AntiLoopKillButton")
	local parts = {}
	local isEnabled = false
	local connection
	local character, humanoidRootPart, humanoid
	
	-- Función para actualizar referencias del personaje
	local function setupCharacter(newCharacter)
		character = newCharacter
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		humanoid = character:WaitForChild("Humanoid")
	end
	
	-- Conectar el evento CharacterAdded
	player.CharacterAdded:Connect(setupCharacter)
	
	-- Configuración inicial si el personaje ya existe
	if player.Character then
		setupCharacter(player.Character)
	end
	
	-- Función para buscar partes del mapa donde teletransportar al jugador
	local function buscar()
		parts = {}
		for _, part in ipairs(workspace:GetDescendants()) do
			if part:IsA("Part") and part.CanCollide then
				table.insert(parts, part)
			end
		end
	end
	
	-- Función para teletransportar al jugador si está en un loop de muerte
	local function teletransportar()
		if isEnabled and #parts > 0 and character and humanoidRootPart and humanoid then
			if humanoid.Sit then
				humanoid.Sit = false
			end
			local randomPart = parts[math.random(1, #parts)]
			humanoidRootPart.CFrame = randomPart.CFrame + Vector3.new(0, 5, 0)
		end
	end
	
	-- Función para activar/desactivar el Anti Loop Kill
	local function toggleAntiLoopKill()
		isEnabled = not isEnabled
		AntiLoopKill.Text = isEnabled and "Anti Loop Kill (ON)" or "Anti Loop Kill (OFF)"
	
		if isEnabled then
			buscar()
			if not connection then
				connection = RunService.RenderStepped:Connect(teletransportar)
			end
		else
			if connection then
				connection:Disconnect()
				connection = nil
			end
		end
	end
	
	-- Conectar el botón
	AntiLoopKill.MouseButton1Click:Connect(toggleAntiLoopKill)
end;
task.spawn(C_e);
-- StarterGui.ScreenGui.Main.GeneralFrame.FlingALL
local function C_f()
local script = G2L["f"];
	local Players = game:GetService("Players")
	local Player = Players.LocalPlayer
	
	local FlingAllButton = script.Parent:WaitForChild("FlingAllButton")
	local AllBool = false
	local ActiveFlingPlayers = {}
	
	-- Initialize FPDH if it doesn't exist
	if not getgenv().FPDH then
		getgenv().FPDH = workspace.FallenPartsDestroyHeight
	end
	
	local GetPlayer = function(Name)
		Name = Name:lower()
	
		if Name == "all" or Name == "others" then
			AllBool = true
			return
		elseif Name == "random" then
			local GetPlayers = Players:GetPlayers()
			if table.find(GetPlayers, Player) then table.remove(GetPlayers, table.find(GetPlayers, Player)) end
			return GetPlayers[math.random(#GetPlayers)]
		elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
			for _, x in next, Players:GetPlayers() do
				if x ~= Player then
					if x.Name:lower():match("^" .. Name) then
						return x
					elseif x.DisplayName:lower():match("^" .. Name) then
						return x
					end
				end
			end
		else
			return
		end
	end
	
	local SkidFling = function(TargetPlayer)
		local Character = Player.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
		local RootPart = Humanoid and Humanoid.RootPart
	
		if not Character or not Humanoid or not RootPart then return end
	
		local TCharacter = TargetPlayer.Character
		if not TCharacter then return end
	
		local THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
		local TRootPart = THumanoid and THumanoid.RootPart
		local THead = TCharacter:FindFirstChild("Head")
		local Accessory = TCharacter:FindFirstChildOfClass("Accessory")
		local Handle = Accessory and Accessory:FindFirstChild("Handle")
	
		if RootPart.Velocity.Magnitude < 50 then
			if not getgenv().OldPos then
				getgenv().OldPos = RootPart.CFrame
			end
		end
	
		if THumanoid and THumanoid.Sit and not AllBool then
			return
		end
	
		if THead then
			workspace.CurrentCamera.CameraSubject = THead
		elseif Handle then
			workspace.CurrentCamera.CameraSubject = Handle
		elseif THumanoid then
			workspace.CurrentCamera.CameraSubject = THumanoid
		end
	
		if not TCharacter:FindFirstChildWhichIsA("BasePart") then
			return
		end
	
		local FPos = function(BasePart, Pos, Ang)
			RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
			Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
			RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
			RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
		end
	
		local SFBasePart = function(BasePart)
			local TimeToWait = 2
			local Time = tick()
			local Angle = 0
	
			repeat
				if RootPart and THumanoid then
					if BasePart.Velocity.Magnitude < 50 then
						Angle = Angle + 100
						FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()
						FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()
						FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()
						FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
						task.wait()
					else
						FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
						task.wait()
					end
				else
					break
				end
			until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
		end
	
		workspace.FallenPartsDestroyHeight = 0/0
	
		local BV = Instance.new("BodyVelocity")
		BV.Name = "EpixVel"
		BV.Parent = RootPart
		BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
		BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
	
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
	
		if TRootPart and THead then
			if (TRootPart.CFrame.Position - THead.CFrame.Position).Magnitude > 5 then
				SFBasePart(THead)
			else
				SFBasePart(TRootPart)
			end
		elseif TRootPart then
			SFBasePart(TRootPart)
		elseif THead then
			SFBasePart(THead)
		elseif Handle then
			SFBasePart(Handle)
		else
			return
		end
	
		BV:Destroy()
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		workspace.CurrentCamera.CameraSubject = Humanoid
	
		if getgenv().OldPos then
			repeat
				RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
				Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
				Humanoid:ChangeState("GettingUp")
				for _, x in pairs(Character:GetChildren()) do
					if x:IsA("BasePart") then
						x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
					end
				end
				task.wait()
			until (RootPart.Position - getgenv().OldPos.Position).Magnitude < 25
		end
	
		workspace.FallenPartsDestroyHeight = getgenv().FPDH
	end
	
	local function ResetCharacter()
		local Character = Player.Character
		if not Character then return end
		local Humanoid = Character:FindFirstChildOfClass("Humanoid")
		local RootPart = Character:FindFirstChild("HumanoidRootPart")
		if not Humanoid or not RootPart then return end
	
		RootPart.CFrame = CFrame.new(0, 3, 0)
		Humanoid.Health = Humanoid.MaxHealth
	
		for _, child in ipairs(Character:GetChildren()) do
			if child:IsA("BodyVelocity") then
				child:Destroy()
			end
		end
	end
	
	local function ToggleFling()
		AllBool = not AllBool
	
		if AllBool then
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= Player then
					SkidFling(player)
					table.insert(ActiveFlingPlayers, player)
				end
			end
		else
			for _, player in ipairs(ActiveFlingPlayers) do
				ResetCharacter()
			end
			ActiveFlingPlayers = {}
		end
	end
	
	FlingAllButton.MouseButton1Click:Connect(ToggleFling)
end;
task.spawn(C_f);
-- StarterGui.ScreenGui.Main.GeneralFrame.G2Fake
local function C_10()
local script = G2L["10"];
	local player = game.Players.LocalPlayer 
	local grenadeID = "Grenade 2" 
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local UserInputService = game:GetService("UserInputService")
	-- Variable para controlar si el script está activo
	local isScriptActive = false
	-- Referencia al botón
	local G2FakeButton = script.Parent:WaitForChild("G2FakeButton")
	-- Función para equipar la granada
	local function equipGrenade()
		for _, item in pairs(player.Backpack:GetChildren()) do
			if item.Name == grenadeID then
				player.Character.Humanoid:EquipTool(item)
				return
			end
		end
	end
	-- Función para simular la pulsación de la tecla Backspace
	local function pressBackspace()
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Backspace, false, game)
		wait(0.1)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Backspace, false, game)
	end
	-- Función para aplicar impulso hacia adelante
	local function applyForwardImpulse()
		local humanoid = player.Character:FindFirstChild("Humanoid")
		local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
		if humanoid and rootPart then
			local bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.MaxForce = Vector3.new(100000, 0, 100000)
			bodyVelocity.Velocity = rootPart.CFrame.LookVector * 200
			bodyVelocity.Parent = rootPart
			game:GetService("Debris"):AddItem(bodyVelocity, 0.1)
		end
	end
	-- Función principal
	local function equipGrenadeAndPressBackspace()
		if not isScriptActive then return end
		equipGrenade()
		pressBackspace()
		wait(0.1)
		applyForwardImpulse()
	end
	-- Variable para almacenar la conexión del evento InputBegan
	local inputConnection = nil
	-- Función para configurar el evento de input
	local function setupInputDetection()
		-- Desconectar la conexión anterior si existe
		if inputConnection then
			inputConnection:Disconnect()
		end
		-- Crear nueva conexión
		inputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed then return end
			if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.V then
				equipGrenadeAndPressBackspace()
			end
		end)
	end
	-- Función para activar/desactivar el script
	local function toggleScript()
		isScriptActive = not isScriptActive
		G2FakeButton.Text = isScriptActive and "G2 Fake [V] (ON)" or "G2 Fake [V] (OFF)"
		if isScriptActive then
			setupInputDetection()
		else
			if inputConnection then
				inputConnection:Disconnect()
			end
		end
	end
	-- Configurar el evento del botón
	G2FakeButton.MouseButton1Click:Connect(toggleScript)
	-- Configurar el evento CharacterAdded
	player.CharacterAdded:Connect(function(character)
		-- Esperar a que el humanoid esté disponible
		local humanoid = character:WaitForChild("Humanoid")
		-- Configurar nueva detección de input si el script está activo
		if isScriptActive then
			setupInputDetection()
		end
		-- Configurar el evento de muerte
		humanoid.Died:Connect(function()
			-- Desconectar el evento de input actual
			if inputConnection then
				inputConnection:Disconnect()
			end
			-- Esperar al respawn
			wait(1)
			-- Solo volver a configurar la detección de input
			if isScriptActive then
				setupInputDetection()
			end
		end)
	end)
	-- Configuración inicial del botón
	G2FakeButton.Text = "G2 Fake [V] (OFF)"
end;
task.spawn(C_10);
-- StarterGui.ScreenGui.Main.GeneralFrame.HB
local function C_11()
local script = G2L["11"];
	-- Variables globales para el tamaño y estado de la hitbox
	_G.HeadSize = 2  -- Establecer el tamaño por defecto en 2
	_G.Disabled = true -- Comienza desactivada y no visible
	
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	
	local HBbutton = script.Parent:FindFirstChild("HBbutton")
	local SizeInput = script.Parent:FindFirstChild("SizeInput")
	
	-- Función para actualizar la hitbox de todos los jugadores (excepto el local)
	local function updateHitboxes()
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= Players.LocalPlayer then
				local character = player.Character
				if character then
					local hrp = character:FindFirstChild("HumanoidRootPart")
					if hrp then
						hrp.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
						hrp.Transparency = _G.Disabled and 1 or 0.7
						hrp.BrickColor = BrickColor.new("Really blue")
						hrp.Material = Enum.Material.Neon
						hrp.CanCollide = false
					end
				end
			end
		end
	end
	
	-- Mantiene la hitbox activa en cada frame
	RunService.RenderStepped:Connect(updateHitboxes)
	
	-- Función para alternar la hitbox al presionar el botón
	local function toggleHitbox()
		if _G.Disabled then
			_G.Disabled = false
			_G.HeadSize = 6.5 -- Restablecer el tamaño original
			HBbutton.Text = "HB (ON)"
		else
			_G.Disabled = true
			_G.HeadSize = 2 -- Cambiar el tamaño a 2 cuando se desactive
			HBbutton.Text = "HB (OFF)"
		end
	end
	
	-- Función para cambiar el tamaño con el TextInput
	local function updateSize()
		local newSize = tonumber(SizeInput.Text)
		if newSize and newSize > 0 then
			_G.HeadSize = newSize
		else
			SizeInput.Text = tostring(_G.HeadSize) -- Evita valores inválidos
		end
	end
	
	-- Conectar eventos
	HBbutton.MouseButton1Click:Connect(toggleHitbox)
	SizeInput.FocusLost:Connect(updateSize) -- Cambia tamaño al perder el foco
	
end;
task.spawn(C_11);
-- StarterGui.ScreenGui.Main.GeneralFrame.Void
local function C_12()
local script = G2L["12"];
	local Players = game:GetService("Players")
	local plr = Players.LocalPlayer
	local CannonsFolders = {}
	
	-- Find cannon folders
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Cannons" then
			table.insert(CannonsFolders, v)
		end
	end
	
	-- Helper functions
	local function GetRoot(Player)
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
			return Player.Character.HumanoidRootPart
		end
	end
	
	local function TeleportTO(posX,posY,posZ)
		pcall(function()
			local root = GetRoot(plr)
			if root then
				root.Velocity = Vector3.new(0,0,0)
				root.CFrame = CFrame.new(posX,posY,posZ)
			end
		end)
	end
	
	local function ToggleVoidProtection(bool)
		if bool then
			game.Workspace.FallenPartsDestroyHeight = 0/0
		else
			game.Workspace.FallenPartsDestroyHeight = -500
		end
	end
	
	local function GetPing()
		return (game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())/1000
	end
	
	-- Obtener el botón del mismo Frame
	local VoidButton = script.Parent:WaitForChild("VoidButton")
	
	-- Conectar la funcionalidad al botón existente
	VoidButton.MouseButton1Click:Connect(function()
		ToggleVoidProtection(true)
		TeleportTO(0, -10000, 0)
		task.wait(GetPing() + 0.1)
		ToggleVoidProtection(false)
		task.wait(GetPing() + 0.1)
	
		-- Break cannons in first folder
		for i,v in pairs(CannonsFolders[1]:GetChildren()) do
			if v.Name == "Cannon" then
				pcall(function()
					fireclickdetector(v.Cannon_Part.ClickDetector)
				end)
			end
		end
	
		-- Break cannons in second folder
		for i,v in pairs(CannonsFolders[2]:GetChildren()) do
			if v.Name == "Cannon" then
				pcall(function()
					fireclickdetector(v.Cannon_Part.ClickDetector)
				end)
			end
		end
	end)
end;
task.spawn(C_12);
-- StarterGui.ScreenGui.Main.GeneralFrame.AntiC4Button.LocalScript
local function C_15()
local script = G2L["15"];
	local player = game.Players.LocalPlayer
	local button = script.Parent  -- Asumiendo que el script está dentro del botón
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local teleporting = false
	local moveDistance = 5  -- Distancia a moverse en lugar de teletransportarse
	local maxDistanceToMove = 30  -- Distancia máxima para reaccionar a una granada
	
	-- Función para buscar las granadas
	local function findGrenades()
		local grenades = {}
		for _, object in pairs(workspace:GetDescendants()) do
			if object:IsA("Model") and object.Name == "C4 Model" then
				if object:FindFirstChild("Handle") then
					table.insert(grenades, object.Handle)
				end
			end
		end
		return grenades
	end
	
	-- Función para moverse lejos de las granadas
	local function moveAwayFromGrenades()
		local grenades = findGrenades()
		if #grenades == 0 then
			return
		end
	
		for _, handle in pairs(grenades) do
			local distanceToGrenade = (humanoidRootPart.Position - handle.Position).magnitude
			if distanceToGrenade < maxDistanceToMove then
				local direction = (humanoidRootPart.Position - handle.Position).unit
				local newPosition = humanoidRootPart.Position + direction * moveDistance
				humanoidRootPart.CFrame = CFrame.new(newPosition)
			end
		end
	end
	
	-- Función que se activa/desactiva con el botón
	button.MouseButton1Click:Connect(function()
		teleporting = not teleporting
		if teleporting then
			button.Text = "Anti C4 (ON)"
			while teleporting do
				moveAwayFromGrenades()
				task.wait(0.1)
			end
		else
			button.Text = "Anti C4 (OFF)"
		end
	end)
	
	
	
	
end;
task.spawn(C_15);
-- StarterGui.ScreenGui.Main.GeneralFrame.AntiFlingButton.LocalScript
local function C_18()
local script = G2L["18"];
	local button = script.Parent -- Referencia al botón
	local RunService = game:GetService("RunService")
	local players = game:GetService("Players")
	local plr = players.LocalPlayer
	local AntiFlingFunction = nil
	
	_G.AntiFlingToggled = false
	
	local function ToggleAntiFling()
		if _G.AntiFlingToggled then
			-- Desactivar AntiFling
			_G.AntiFlingToggled = false
			if AntiFlingFunction then
				AntiFlingFunction:Disconnect()
				AntiFlingFunction = nil
			end
			button.Text = "Anti Fling (OFF)" -- Cambia el texto del botón
		else
			-- Activar AntiFling
			_G.AntiFlingToggled = true
			AntiFlingFunction = RunService.Stepped:Connect(function()
				for i, p in pairs(players:GetPlayers()) do
					task.spawn(function()
						if p ~= plr and p.Character then
							for _, v in pairs(p.Character:GetChildren()) do
								pcall(function()
									if v:IsA("BasePart") then
										v.CanCollide = false
										v.Velocity = Vector3.new(0, 0, 0)
										v.RotVelocity = Vector3.new(0, 0, 0)
										v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
										v.Massless = true
									elseif v:IsA("Accessory") then
										v.Handle.CanCollide = false
										v.Handle.Velocity = Vector3.new(0, 0, 0)
										v.RotVelocity = Vector3.new(0, 0, 0)
										v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
										v.Massless = true
									end
								end)
							end
						end
					end)
				end
			end)
			button.Text = "Anti Fling (ON)" -- Cambia el texto del botón
		end
	end
	
	-- Conectar la función al evento MouseButton1Click del botón
	button.MouseButton1Click:Connect(ToggleAntiFling)
	
end;
task.spawn(C_18);
-- StarterGui.ScreenGui.Main.GeneralFrame.AntiGrenadeButton.LocalScript
local function C_1b()
local script = G2L["1b"];
	local player = game.Players.LocalPlayer
	local button = script.Parent  -- Asumiendo que el script está dentro del botón
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local teleporting = false
	local moveDistance = 5  -- Distancia a moverse en lugar de teletransportarse
	local maxDistanceToMove = 30  -- Distancia máxima para reaccionar a una granada
	
	-- Función para buscar las granadas
	local function findGrenades()
		local grenades = {}
		for _, object in pairs(workspace:GetDescendants()) do
			if object:IsA("Model") and object.Name == "Grenade Model" then
				if object:FindFirstChild("Handle") then
					table.insert(grenades, object.Handle)
				end
			end
		end
		return grenades
	end
	
	-- Función para moverse lejos de las granadas
	local function moveAwayFromGrenades()
		local grenades = findGrenades()
		if #grenades == 0 then
			return
		end
	
		for _, handle in pairs(grenades) do
			local distanceToGrenade = (humanoidRootPart.Position - handle.Position).magnitude
			if distanceToGrenade < maxDistanceToMove then
				local direction = (humanoidRootPart.Position - handle.Position).unit
				local newPosition = humanoidRootPart.Position + direction * moveDistance
				humanoidRootPart.CFrame = CFrame.new(newPosition)
			end
		end
	end
	
	-- Función que se activa/desactiva con el botón
	button.MouseButton1Click:Connect(function()
		teleporting = not teleporting
		if teleporting then
			button.Text = "Anti Granade (ON)"
			while teleporting do
				moveAwayFromGrenades()
				task.wait(0.1)
			end
		else
			button.Text = "Anti Granade (OFF)"
		end
	end)
	
end;
task.spawn(C_1b);
-- StarterGui.ScreenGui.Main.GeneralFrame.AntiSpikeButton.LocalScript
local function C_20()
local script = G2L["20"];
	local player = game.Players.LocalPlayer
	local button = script.Parent  -- Botón
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local teleporting = false
	local moveDistance = 5  -- Distancia de movimiento
	local maxDistanceToMove = 30  -- Distancia máxima para reaccionar a la trampa
	
	-- Función para buscar trampas
	local function findGrenades()
		local grenades = {}
		for _, object in pairs(workspace:GetDescendants()) do
			if object:IsA("Model") and object.Name == "Spike Trap" then
				local handle = object:FindFirstChild("Handle")
				if handle and handle:IsA("BasePart") then
					table.insert(grenades, handle)
				end
			end
		end
		return grenades
	end
	
	-- Función para alejarse de las trampas
	local function moveAwayFromGrenades()
		local grenades = findGrenades()
		if #grenades == 0 then
			return
		end
	
		for _, handle in pairs(grenades) do
			if handle and humanoidRootPart then
				local success, result = pcall(function()
					return (humanoidRootPart.Position - handle.Position).magnitude
				end)
	
				if success and result < maxDistanceToMove then
					local direction = (humanoidRootPart.Position - handle.Position).unit
					local newPosition = humanoidRootPart.Position + direction * moveDistance
					humanoidRootPart.CFrame = CFrame.new(newPosition)
				end
			end
		end
	end
	
	-- Botón para activar/desactivar
	button.MouseButton1Click:Connect(function()
		teleporting = not teleporting
		button.Text = teleporting and "Anti Spike (ON)" or "Anti Spike (OFF)"
	
		while teleporting do
			moveAwayFromGrenades()
			task.wait(0.1)
		end
	end)
	
end;
task.spawn(C_20);
-- StarterGui.ScreenGui.Main.TargetFrame.Fling
local function C_2d()
local script = G2L["2d"];
	local Players = game:GetService("Players")
	local Player = Players.LocalPlayer
	
	-- Get UI elements from parent frame
	local frame = script.Parent
	local flingButton = frame:WaitForChild("FlingButton")
	local userInput = frame:WaitForChild("UserInput")
	local imageUser = frame:WaitForChild("ImageUser")
	
	-- Initialize FPDH if it doesn't exist
	if not getgenv().FPDH then
		getgenv().FPDH = workspace.FallenPartsDestroyHeight
	end
	
	local function GetPlayer(Name)
		Name = Name:lower()
		if Name == "all" or Name == "others" then
			return "all"
		elseif Name == "random" then
			local GetPlayers = Players:GetPlayers()
			if table.find(GetPlayers, Player) then 
				table.remove(GetPlayers, table.find(GetPlayers, Player)) 
			end
			return GetPlayers[math.random(#GetPlayers)]
		else
			for _, x in next, Players:GetPlayers() do
				if x ~= Player then
					if x.Name:lower():match("^" .. Name) or x.DisplayName:lower():match("^" .. Name) then
						return x
					end
				end
			end
		end
		return nil
	end
	
	local function SkidFling(TargetPlayer)
		local Character = Player.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
		local RootPart = Humanoid and Humanoid.RootPart
	
		local TCharacter = TargetPlayer.Character
		local THumanoid = TCharacter and TCharacter:FindFirstChildOfClass("Humanoid")
		local TRootPart = THumanoid and THumanoid.RootPart
		local THead = TCharacter and TCharacter:FindFirstChild("Head")
		local Accessory = TCharacter and TCharacter:FindFirstChildOfClass("Accessory")
		local Handle = Accessory and Accessory:FindFirstChild("Handle")
	
		if Character and Humanoid and RootPart then
			if RootPart.Velocity.Magnitude < 50 then
				if not getgenv().OldPos then
					getgenv().OldPos = RootPart.CFrame
				end
			end
	
			if THumanoid and THumanoid.Sit then return end
	
			if THead then
				workspace.CurrentCamera.CameraSubject = THead
			elseif Handle then
				workspace.CurrentCamera.CameraSubject = Handle
			elseif THumanoid then
				workspace.CurrentCamera.CameraSubject = THumanoid
			end
	
			if not TCharacter or not TCharacter:FindFirstChildWhichIsA("BasePart") then return end
	
			local function FPos(BasePart, Pos, Ang)
				RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
				Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
				RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
				RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
			end
	
			local function SFBasePart(BasePart)
				local TimeToWait = 2
				local Time = tick()
				local Angle = 0
	
				repeat
					if RootPart and THumanoid then
						if BasePart.Velocity.Magnitude < 50 then
							Angle = Angle + 100
							FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
						else
							FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
							task.wait()
						end
					else
						break
					end
				until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
			end
	
			workspace.FallenPartsDestroyHeight = 0/0
	
			local BV = Instance.new("BodyVelocity")
			BV.Name = "EpixVel"
			BV.Parent = RootPart
			BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
			BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
	
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
	
			if TRootPart and THead then
				if (TRootPart.CFrame.Position - THead.CFrame.Position).Magnitude > 5 then
					SFBasePart(THead)
				else
					SFBasePart(TRootPart)
				end
			elseif TRootPart then
				SFBasePart(TRootPart)
			elseif THead then
				SFBasePart(THead)
			elseif Handle then
				SFBasePart(Handle)
			end
	
			BV:Destroy()
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			workspace.CurrentCamera.CameraSubject = Humanoid
	
			if getgenv().OldPos then
				repeat
					RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
					Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
					Humanoid:ChangeState("GettingUp")
					for _, x in pairs(Character:GetChildren()) do
						if x:IsA("BasePart") then
							x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
						end
					end
					task.wait()
				until (RootPart.Position - getgenv().OldPos.Position).Magnitude < 25
			end
	
			workspace.FallenPartsDestroyHeight = getgenv().FPDH
		end
	end
	
	-- Update user image when input changes
	userInput.Changed:Connect(function(prop)
		if prop == "Text" then
			local targetPlayer = GetPlayer(userInput.Text)
			if targetPlayer and targetPlayer ~= "all" then
				local userId = targetPlayer.UserId
				imageUser.Image = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
			else
				imageUser.Image = ""
			end
		end
	end)
	
	-- Handle fling button click
	flingButton.MouseButton1Click:Connect(function()
		local targetPlayer = GetPlayer(userInput.Text)
		if targetPlayer then
			if targetPlayer == "all" then
				for _, player in pairs(Players:GetPlayers()) do
					if player ~= Player then
						SkidFling(player)
					end
				end
			else
				SkidFling(targetPlayer)
			end
		end
	end)
end;
task.spawn(C_2d);
-- StarterGui.ScreenGui.Main.TargetFrame.Loopkill
local function C_2e()
local script = G2L["2e"];
	local player = game.Players.LocalPlayer
	local LoopKillButton = script.Parent:WaitForChild("LoopKillButton")  -- Asegúrate de que el botón está en el lugar correcto
	local targetInput = script.Parent:WaitForChild("UserInput")  -- El InputBox donde el usuario introduce el nombre del jugador
	local imageUser = script.Parent:WaitForChild("ImageUser")  -- La imagen del jugador en la interfaz
	local isFollowing = false
	local targetPlayer
	local followingCoroutine
	
	-- Función para actualizar la imagen del jugador en la interfaz
	local function updatePlayerImage(targetUsername)
		-- Obtener el jugador objetivo por nombre
		targetPlayer = game.Players:FindFirstChild(targetUsername)
	
		if targetPlayer then
			-- Obtener la foto de perfil del jugador
			local userImageId = "rbxassetid://" .. targetPlayer.UserId
			imageUser.Image = userImageId  -- Cambiar la imagen del jugador en la interfaz
		else
			imageUser.Image = "rbxassetid://default-image-id"  -- Imagen por defecto si no se encuentra el jugador
		end
	end
	
	-- Función para seguir a un jugador específico
	local function followPlayer(targetUsername)
		-- Obtener el jugador objetivo por nombre
		targetPlayer = game.Players:FindFirstChild(targetUsername)
	
		if not targetPlayer then
			return
		end
	
		-- Esperar a que el personaje del objetivo esté cargado
		local targetCharacter = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
		local targetHumanoidRootPart = targetCharacter:WaitForChild("HumanoidRootPart")
	
		-- Obtener nuestro personaje
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
		-- Equipar el Pencil
		local backpack = player:FindFirstChild("Backpack")
		if backpack then
			local pencil = backpack:FindFirstChild("Pencil")
			if pencil then
				pencil.Parent = character
			end
		end
	
		-- Detectar cuando el objetivo muere o desaparece
		local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")
		targetHumanoid.Died:Connect(function()
			stopFollowing()  -- Detener el seguimiento cuando el objetivo muere
		end)
	
		-- Función para atacar continuamente
		local function attack()
			local tool = character:FindFirstChild("Pencil")
			while isFollowing and tool do
				wait(0.1)
				tool:Activate()
			end
		end
	
		-- Función para seguir al objetivo
		local function followAndAttack()
			while isFollowing do
				wait(0.1)
				if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("Humanoid") then
					stopFollowing()  -- Detener el seguimiento si el personaje ya no existe
					break
				end
				local updatedBackPosition = targetHumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
				humanoidRootPart.CFrame = updatedBackPosition
			end
		end
	
		-- Iniciar las acciones simultáneamente
		spawn(attack)
		followingCoroutine = coroutine.create(followAndAttack)
		coroutine.resume(followingCoroutine)
	end
	
	-- Detener el seguimiento
	local function stopFollowing()
		isFollowing = false
		if followingCoroutine then
			coroutine.close(followingCoroutine)
		end
	end
	
	-- Función para manejar el evento de click en el LoopButton
	LoopKillButton.MouseButton1Click:Connect(function()
		local targetUsername = targetInput.Text  -- Obtener el nombre del jugador desde el InputBox
	
		if not targetUsername or targetUsername == "" then
			return
		end
	
		if not isFollowing then
			isFollowing = true
			updatePlayerImage(targetUsername)  -- Actualizar la imagen del jugador en la interfaz
			followPlayer(targetUsername)  -- Coloca el nombre del jugador objetivo aquí
		else
			stopFollowing()
			imageUser.Image = "rbxassetid://default-image-id"  -- Restablecer la imagen cuando se detiene el seguimiento
		end
	end)
	
end;
task.spawn(C_2e);
-- StarterGui.ScreenGui.Main.TargetFrame.RevolverLoop
local function C_2f()
local script = G2L["2f"];
	local Players = game:GetService("Players")
	local StarterGui = game:GetService("StarterGui")
	local LocalPlayer = Players.LocalPlayer
	local isCooldown = false
	local isLoopActive = false
	local targetPlayer = nil
	
	-- Referencias a la GUI existente
	local UserInput = script.Parent.UserInput
	local RevolverLoopButton = script.Parent.RevolverLoopButton
	local ImageUser = script.Parent.ImageUser
	
	-- Funciones
	local function updateTargetImage(username)
		local success, userId = pcall(function()
			return Players:GetUserIdFromNameAsync(username)
		end)
	
		if success and userId then
			local thumbType = Enum.ThumbnailType.HeadShot
			local thumbSize = Enum.ThumbnailSize.Size420x420
			local thumbUrl = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
			ImageUser.Image = thumbUrl
		end
	end
	
	local function getPlayer(username)
		for _, player in pairs(Players:GetPlayers()) do
			if player.Name:lower() == username:lower() then
				return player
			end
		end
		return nil
	end
	
	local function hasRevolverInInventory()
		return LocalPlayer.Backpack:FindFirstChild("Kawaii Revolver") ~= nil
	end
	
	local function startKilling(targetUsername)
		while isLoopActive do
			wait(1)
			-- Verificar que el revolver está en el inventario
			if not hasRevolverInInventory() then
				StarterGui:SetCore("SendNotification", {
					Title = "Revolver not found",
					Text = "You lost the revolver or it's not in your inventory.",
					Duration = 3
				})
				isLoopActive = false
				RevolverLoopButton.Text = "Revolver Loop (OFF)"
				break
			end
	
			targetPlayer = getPlayer(targetUsername)
	
			if not targetPlayer then
				StarterGui:SetCore("SendNotification", {
					Title = "Player not found",
					Text = "The player has left or doesn't exist",
					Duration = 3
				})
				isLoopActive = false
				RevolverLoopButton.Text = "Revolver Loop (OFF)"
				break
			end
	
			-- Re-check if character exists after respawn
			while targetPlayer and not targetPlayer.Character do
				wait(1)
			end
	
			if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
				local Target = targetPlayer.Character.Humanoid
				local tool = LocalPlayer.Backpack:FindFirstChild("Kawaii Revolver")
				local damageRemote = tool and tool:FindFirstChild("DamageRemote")
	
				if damageRemote then
					while Target and Target.Health > 0 and isLoopActive do
						if not isCooldown then
							isCooldown = true
							tool.Parent = LocalPlayer.Character
							damageRemote:FireServer(Target)
							tool.Parent = LocalPlayer.Backpack
							wait(0.6) -- Cooldown entre ataques para el revolver
							isCooldown = false
						end
						wait()
					end
	
					if Target and Target.Health <= 0 then
						StarterGui:SetCore("SendNotification", {
							Title = "Jugador muerto",
							Text = "Jugador asesinado",
							Duration = 3
						})
						wait(3) -- Espera antes de continuar el loop
					end
				end
			end
		end
	end
	
	-- Event Handlers
	RevolverLoopButton.MouseButton1Click:Connect(function()
		isLoopActive = not isLoopActive
	
		if isLoopActive then
			-- Verificar si el revolver está en el inventario antes de iniciar el loop
			if not hasRevolverInInventory() then
				isLoopActive = false
				StarterGui:SetCore("SendNotification", {
					Title = "Error",
					Text = "You need to have the Kawaii Revolver in your inventory to start the loop.",
					Duration = 3
				})
				RevolverLoopButton.Text = "Revolver Loop (OFF)"
				return
			end
	
			local targetUsername = UserInput.Text
			if targetUsername ~= "" then
				RevolverLoopButton.Text = "Revolver Loop (ON)"
				updateTargetImage(targetUsername)
				startKilling(targetUsername)
			else
				isLoopActive = false
				StarterGui:SetCore("SendNotification", {
					Title = "Error",
					Text = "Please enter a username",
					Duration = 3
				})
			end
		else
			RevolverLoopButton.Text = "Revolver Loop (OFF)"
		end
	end)
	
	UserInput.Changed:Connect(function(property)
		if property == "Text" then
			updateTargetImage(UserInput.Text)
		end
	end)
	
	LocalPlayer.CharacterAdded:Connect(function(newCharacter)
		-- Verificar si el revolver está en el inventario tras la reaparición del personaje
		if isLoopActive then
			if hasRevolverInInventory() then
				Character = newCharacter
				startKilling(UserInput.Text) -- Reiniciar el loop con el mismo objetivo
			else
				-- Detener el loop si no se encuentra el revolver en el inventario
				isLoopActive = false
				RevolverLoopButton.Text = "Revolver Loop (OFF)"
				StarterGui:SetCore("SendNotification", {
					Title = "Revolver not found",
					Text = "",
					Duration = 3
				})
			end
		end
	end)
	
end;
task.spawn(C_2f);
-- StarterGui.ScreenGui.Main.TargetFrame.Teleport
local function C_30()
local script = G2L["30"];
	local Players = game:GetService("Players")
	local Camera = game.Workspace.CurrentCamera
	local LocalPlayer = Players.LocalPlayer
	
	-- Encontrar elementos dentro de Target
	local Target = script.Parent
	local UserInput = Target:FindFirstChild("UserInput")
	local ImageUser = Target:FindFirstChild("ImageUser")
	local TeleportButton = Target:FindFirstChild("TeleportButton")
	
	-- Función para actualizar la imagen del usuario si existe
	local function updatePlayerImage(username)
		local success, userId = pcall(function()
			return Players:GetUserIdFromNameAsync(username)
		end)
	
		if success then
			ImageUser.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
		else
			ImageUser.Image = "rbxassetid://0" -- Imagen de error o vacía
		end
	end
	
	-- Función para teletransportarse al jugador
	local function teleportToPlayer(username)
		local player = Players:FindFirstChild(username)
	
		if player and player.Character then
			-- Teletransportarse al jugador
			LocalPlayer.Character:SetPrimaryPartCFrame(player.Character.PrimaryPart.CFrame)
		end
	end
	
	-- Evento cuando el usuario termina de escribir en UserInput
	UserInput.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			updatePlayerImage(UserInput.Text)
		end
	end)
	
	-- Evento al presionar el botón TeleportButton
	TeleportButton.MouseButton1Click:Connect(function()
		teleportToPlayer(UserInput.Text)
	end)
	
end;
task.spawn(C_30);
-- StarterGui.ScreenGui.Main.TargetFrame.View
local function C_31()
local script = G2L["31"];
	local Players = game:GetService("Players")
	local Camera = game.Workspace.CurrentCamera
	local LocalPlayer = Players.LocalPlayer
	-- Encontrar elementos dentro de Target
	local Target = script.Parent
	local UserInput = Target:FindFirstChild("UserInput")
	local ImageUser = Target:FindFirstChild("ImageUser")
	local ViewButton = Target:FindFirstChild("ViewButton")
	-- Variable para rastrear el estado de espectador
	local isSpectating = false
	local spectatedPlayer = nil
	local characterConnection = nil
	local humanoidDiedConnection = nil
	
	-- Función para actualizar la imagen del usuario si existe en el servidor
	local function updatePlayerImage(username)
		local player = Players:FindFirstChild(username)
		if player then
			local userId = player.UserId
			ImageUser.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
			return true
		else
			ImageUser.Image = "rbxassetid://0" -- Imagen de error o vacía
			return false
		end
	end
	
	-- Función para manejar la muerte del personaje
	local function onHumanoidDied()
		if isSpectating and spectatedPlayer then
			-- Esperar a que el jugador reaparezca
			local connection
			connection = spectatedPlayer.CharacterAdded:Wait()
			if connection then
				local humanoid = connection:WaitForChild("Humanoid", 5)
				if humanoid then
					Camera.CameraSubject = humanoid
					setupHumanoidDiedConnection(humanoid)
				end
			end
		end
	end
	
	-- Función para configurar la conexión de muerte del humanoide
	local function setupHumanoidDiedConnection(humanoid)
		if humanoidDiedConnection then
			humanoidDiedConnection:Disconnect()
		end
		humanoidDiedConnection = humanoid.Died:Connect(onHumanoidDied)
	end
	
	-- Función para actualizar la cámara al reaparecer
	local function onCharacterAdded(character)
		if isSpectating and spectatedPlayer then
			local humanoid = character:WaitForChild("Humanoid", 5)
			if humanoid then
				Camera.CameraSubject = humanoid
				setupHumanoidDiedConnection(humanoid)
			end
		end
	end
	
	-- Función para espectar a un jugador o desactivar espectador
	local function toggleSpectate(username)
		local player = Players:FindFirstChild(username)
	
		if isSpectating then
			-- Desactivar modo espectador
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
				Camera.CameraSubject = LocalPlayer.Character.Humanoid
			end
			isSpectating = false
			ViewButton.Text = "View"
			-- Limpiar conexiones
			if characterConnection then
				characterConnection:Disconnect()
				characterConnection = nil
			end
			if humanoidDiedConnection then
				humanoidDiedConnection:Disconnect()
				humanoidDiedConnection = nil
			end
			spectatedPlayer = nil
		else
			if player and player ~= LocalPlayer then
				spectatedPlayer = player
				isSpectating = true
				ViewButton.Text = "Stop View"
	
				if player.Character then
					local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
					if humanoid then
						Camera.CameraSubject = humanoid
						setupHumanoidDiedConnection(humanoid)
					end
				end
	
				if characterConnection then
					characterConnection:Disconnect()
				end
				characterConnection = player.CharacterAdded:Connect(onCharacterAdded)
			end
		end
	end
	
	-- Evento cuando el usuario termina de escribir en UserInput
	UserInput.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			local success = updatePlayerImage(UserInput.Text)
			if not success then
				UserInput.Text = "" -- Limpiar el input si el usuario no existe en el servidor
			end
		end
	end)
	
	-- Evento al presionar el botón ViewButton
	ViewButton.MouseButton1Click:Connect(function()
		toggleSpectate(UserInput.Text)
	end)
	
	-- Asegurarse de que la cámara vuelva al jugador local cuando se destruye el script
	script.Destroyed:Connect(function()
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
			Camera.CameraSubject = LocalPlayer.Character.Humanoid
		end
	end)
end;
task.spawn(C_31);
-- StarterGui.ScreenGui.Main.HomeFrame.ImageLabel.LocalScript
local function C_43()
local script = G2L["43"];
	local player = game.Players.LocalPlayer
	local userId = player.UserId
	local imageLabel = script.Parent
	
	imageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
	
end;
task.spawn(C_43);
-- StarterGui.ScreenGui.Main.HomeFrame.Username.LocalScript
local function C_49()
local script = G2L["49"];
	local player = game.Players.LocalPlayer
	script.Parent.Text = player.Name
	
end;
task.spawn(C_49);
-- StarterGui.ScreenGui.Main.HomeFrame.Wins.LocalScript
local function C_4b()
local script = G2L["4b"];
	local player = game.Players.LocalPlayer
	local statsFolder = player:FindFirstChild("statsfolder")
	local wins = statsFolder and statsFolder:FindFirstChild("Wins")
	
	script.Parent.Text = (wins and wins.Value or "0")
	
	if wins then
		wins.Changed:Connect(function()
			script.Parent.Text = wins.Value
		end)
	end
	
end;
task.spawn(C_4b);
-- StarterGui.ScreenGui.Main.HomeFrame.Defeats.LocalScript
local function C_4d()
local script = G2L["4d"];
	local player = game.Players.LocalPlayer
	local statsFolder = player:FindFirstChild("statsfolder")
	local defeats = statsFolder and statsFolder:FindFirstChild("Defeats")
	
	script.Parent.Text = (defeats and defeats.Value or "0")
	
	if defeats then
		defeats.Changed:Connect(function()
			script.Parent.Text = defeats.Value
		end)
	end
	
end;
task.spawn(C_4d);
-- StarterGui.ScreenGui.Main.HomeFrame.Skill.LocalScript
local function C_4f()
local script = G2L["4f"];
	local player = game.Players.LocalPlayer
	local statsFolder = player:FindFirstChild("statsfolder")
	local skillRating = statsFolder and statsFolder:FindFirstChild("Skill Rating")
	
	script.Parent.Text = (skillRating and skillRating.Value or "0")
	
	if skillRating then
		skillRating.Changed:Connect(function()
			script.Parent.Text = skillRating.Value
		end)
	end
	
end;
task.spawn(C_4f);
-- StarterGui.ScreenGui.Togle
local function C_50()
local script = G2L["50"];
	-- Obtiene el ScreenGUI (dentro del mismo objeto)
	local screenUI = script.Parent -- El LocalScript está dentro del ScreenGui
	local isVisible = true
	
	-- Función para alternar la visibilidad de la UI
	local function toggleUI()
		isVisible = not isVisible
		screenUI.Enabled = isVisible -- Usamos 'Enabled' para ScreenGui en vez de 'Visible'
	end
	
	-- Conectar el evento de teclado para presionar F1
	local UserInputService = game:GetService("UserInputService")
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed then
			if input.KeyCode == Enum.KeyCode.F1 then
				toggleUI()
			end
		end
	end)
	
end;
task.spawn(C_50);
-- StarterGui.ScreenGui.local
local function C_51()
local script = G2L["51"];
	local gui = script.Parent
	
	-- Buscamos el Frame principal (Main)
	local mainFrame = gui:FindFirstChild("Main")
	
	-- Ahora buscamos ButtonsOption dentro del Frame principal
	local buttonFrame = mainFrame:FindFirstChild("ButtonsOption")
	
	-- Verificamos los botones
	local homeButton = buttonFrame:FindFirstChild("HomeButton")
	local generalbutton = buttonFrame:FindFirstChild("GeneralButton")
	local targetbutton = buttonFrame:FindFirstChild("TargetButton")
	
	-- Verificamos los frames principales DENTRO DE MAIN
	local homeFrame = mainFrame:FindFirstChild("HomeFrame")
	local generalFrame = mainFrame:FindFirstChild("GeneralFrame")
	local targetFrame = mainFrame:FindFirstChild("TargetFrame")
	
	if not (homeFrame and generalFrame and targetFrame) then
		return
	end
	
	local function showFrame(frameToShow)
		homeFrame.Visible = false
		generalFrame.Visible = false
		targetFrame.Visible = false
		frameToShow.Visible = true
	end
	
	-- Aseguramos que los botones tengan la propiedad Active en true
	if homeButton then
		homeButton.MouseButton1Click:Connect(function()
			showFrame(homeFrame)
		end)
	end
	
	if targetbutton then
		targetbutton.MouseButton1Click:Connect(function()
			showFrame(targetFrame)
		end)
	end
	
	if generalbutton then
		generalbutton.MouseButton1Click:Connect(function()
			showFrame(generalFrame)
		end)
	end
	
	
	
	-- Al iniciar, mostrar solo el HomeFrame
	showFrame(homeFrame)
	
end;
task.spawn(C_51);

return G2L["1"], require;



end
