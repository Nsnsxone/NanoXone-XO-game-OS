

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")


local RequestPlayerEvent = ReplicatedStorage:WaitForChild("RequestPlayerEvent")

local StartMatchEvent = ReplicatedStorage:WaitForChild("StartMatchEvent")
local StartMatchEvent2 = ReplicatedStorage:WaitForChild("StartMatchEvent2")
local remoteEvent = ReplicatedStorage:WaitForChild("SendDataEvent")
local PlayerRespondGameCtrl = ReplicatedStorage:WaitForChild("PlayerRespondGameCtrl")
local GuiTarPlayerEvent = ReplicatedStorage:WaitForChild("GuiTarPlayerEvent")
local GuiTarPlayerEvent2 = ReplicatedStorage:WaitForChild("GuiTarPlayerEvent2")
local GuiTarPlayerEventspecial = ReplicatedStorage:WaitForChild("GuiTarPlayerEventspecial")
local FullboardEvent = ReplicatedStorage:WaitForChild("FullboardEvent")


local NamePlyRe = ReplicatedStorage:WaitForChild("NamePly")
local playerListFrame = script.Parent:WaitForChild("PlayerListFrame")
local templateLabel = playerListFrame:WaitForChild("Template")
local playerNameBox = script.Parent:WaitForChild("PlayerNameBox")
local kickButton = script.Parent:WaitForChild("inviteButton")
local RefreshButton = script.Parent:WaitForChild("RefreshButton")
local frame = script.Parent:WaitForChild("Frame")
local close = script.Parent:WaitForChild("CloseButton")
local TE = script.Parent:WaitForChild("TextEnter")
local TL = script.Parent:WaitForChild("TextList")
local spe = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("GameGui"):WaitForChild("gameser")
local fr = spe:WaitForChild("FSER")
--[[local N = ReplicatedStorage:WaitForChild("ResetAllRemote")
N.OnClientEvent:Connect(function()
	print("New!")
	local RequestPlayerEvent = ReplicatedStorage:WaitForChild("RequestPlayerEvent")

	local StartMatchEvent = ReplicatedStorage:WaitForChild("StartMatchEvent")
	local StartMatchEvent2 = ReplicatedStorage:WaitForChild("StartMatchEvent2")
	local remoteEvent = ReplicatedStorage:WaitForChild("SendDataEvent")
	local PlayerRespondGameCtrl = ReplicatedStorage:WaitForChild("PlayerRespondGameCtrl")
	local GuiTarPlayerEvent = ReplicatedStorage:WaitForChild("GuiTarPlayerEvent")
	local GuiTarPlayerEvent2 = ReplicatedStorage:WaitForChild("GuiTarPlayerEvent2")
	local GuiTarPlayerEventspecial = ReplicatedStorage:WaitForChild("GuiTarPlayerEventspecial")
	local FullboardEvent = ReplicatedStorage:WaitForChild("FullboardEvent")


	local NamePlyRe = ReplicatedStorage:WaitForChild("NamePly")
end)
--]]
playerListFrame.Visible = false
frame.Visible = false
close.Visible = false
TE.Visible = false
kickButton.Visible = false
TL.Visible = false
playerNameBox.Visible = false
RefreshButton.Visible = false

local var = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("GameGui")
--local gameser = script.Parent:WaitForChild("gameSer2p")
local gameser = var:WaitForChild("gameSer2p")



local Netu1 --DO NOT DEL
local Netu2 --DO NOT DEL
--[[
local remoteEvent = ReplicatedStorage:WaitForChild("NamePly")
remoteEvent.OnClientEvent:Connect(function(NameTagPass)

	frame.Visible = true
	playerListFrame.Visible = true
	close.Visible = true
	TE.Visible = true
	kickButton.Visible = true
	TL.Visible = true
	playerNameBox.Visible = true
	RefreshButton.Visible = true
end)
--]]


local function Closeclick()
	playerListFrame.Visible = false
	frame.Visible = false
	close.Visible = false
	TE.Visible = false
	kickButton.Visible = false
	TL.Visible = false
	playerNameBox.Visible = false
	RefreshButton.Visible = false
end

close.MouseButton1Click:Connect(Closeclick)

local plusPosition = 0

local function updatePlayerList()
	for _, playerLabel in pairs(playerListFrame:GetChildren()) do
		if playerLabel:IsA("TextButton") and playerLabel.Name ~= "Template" then
			playerLabel:Destroy()
			plusPosition -= 50	
			print("Updated")
		end

	end
	game.Players.PlayerAdded:Connect(function(player)

	end)

	for _, player in pairs(Players:GetPlayers()) do
		local playerLabel = templateLabel:Clone()
		playerLabel.Text = player.Name
		playerLabel.Name = player.Name
		playerLabel.Parent = playerListFrame
		playerLabel.Visible = true
		playerLabel.Position = UDim2.new( playerLabel.Position.X.Scale, playerLabel.Position.X.Offset, playerLabel.Position.Y.Scale, plusPosition)
		plusPosition += 50
		local plyerNM = game:GetService("Players").LocalPlayer.Name
		if plyerNM == playerLabel.Name then
			local plyNameSame = playerListFrame:FindFirstChild(plyerNM)
			plyNameSame:Destroy()
			templateLabel.Visible = false
			plusPosition -= 50
			--player.Name  
			print("hiding cl")
		else
			print("huh?")
		end
	end
end

local function Refreshffun()
	print("Refreshing")
	updatePlayerList()
end
RefreshButton.MouseButton1Click:Connect(Refreshffun)

Players.PlayerRemoving:Connect(updatePlayerList)
Players.PlayerAdded:Connect(updatePlayerList)

kickButton.MouseButton1Click:Connect(function()
	local var2 = game:GetService("Players").LocalPlayer.Name --Name Original
	local playeRName = playerNameBox.Text

	local targetPlayer1 = Players:FindFirstChild(playeRName)
	if targetPlayer1 then


		if playeRName and playeRName ~= "" then
			RequestPlayerEvent:FireServer(playeRName, var2)
			print(playeRName,var2)
		end

	else
		warn("Player " .. playeRName .. " not found.")
	end
end)
local sp = script.Parent
--:WaitForChild("gameser")
--local spp = sp:WaitForChild("Folder")
local bg1 = sp:WaitForChild("Frbg1")
local bg2 = sp:WaitForChild("Frbg2")
local acc = sp:WaitForChild("Acc")
local dec = sp:WaitForChild("Dec")
local NRED = sp:WaitForChild("NameRequest")
--acc.MouseButton1Click:Connect(function()
--	local playerhasAcc = playerNameBox.Text 
--	local var4 = game:GetService("Players").LocalPlayer.Name --Name Original
--	local AccN = "Acc"
--	print("during")
--	print(var4)
--	AccRemotePlayerEvent:FireServer(playerhasAcc, var4)
--	print("fire Acc")
--	print(playerhasAcc)
--end)
updatePlayerList()

gameser.MouseButton1Click:Connect(function()
	if fr.Visible == false then
	frame.Visible = true
	playerListFrame.Visible = true
	close.Visible = true
	TE.Visible = true
	kickButton.Visible = true
	TL.Visible = true
	playerNameBox.Visible = true
	RefreshButton.Visible = true
	end
end)



--local ReplicatedStorage = game:GetService("ReplicatedStorage")


-- ฟังก์ชันสำหรับรับข้อมูลที่ส่งมาจากเซิร์ฟเวอร์

local gameser2 = var:WaitForChild("gameser")
local buttons0 = {}
local fr = gameser2:WaitForChild("FSER")
local resetgame = gameser2:WaitForChild("resetgameSer")
local curply = gameser2:WaitForChild("curplySer")
local exit = gameser2:WaitForChild("ExitSer")

StartMatchEvent2.OnClientEvent:Connect(function(targetPlayer2)
	local var2 = game:GetService("Players").LocalPlayer.Name
	if targetPlayer2 ~= var2 then
		Netu2 = targetPlayer2
		print("Starting...")
		print(targetPlayer2)
		for e = 1, 9 do
			buttons0[e] = gameser2:WaitForChild("ButtonSer"..e)
			buttons0[e].Visible = true
		end
		fr.Visible = true
		--resetgame.Visible = true
		curply.Visible = true
		--exit.Visible = true

		exit.MouseButton1Click:Connect(function()
			for e = 1, 9 do
				buttons0[e] = gameser2:WaitForChild("ButtonSer"..e)
				buttons0[e].Visible = false
				buttons0[e].Text = " "

			end
			exit.Visible = false
			fr.Visible = false
			--resetgame.Visible = true
			curply.Visible = false
			curply.Text = "N/A"
		end)

		playerListFrame.Visible = false
		frame.Visible = false
		close.Visible = false
		TE.Visible = false
		kickButton.Visible = false
		TL.Visible = false
		playerNameBox.Visible = false
		RefreshButton.Visible = false

		bg1.Visible = false
		bg2.Visible = false
		acc.Visible = false
		dec.Visible = false
		NRED.Visible = false

		--GuiTarPlayerEvent:FireServer()
		local function A()

			GuiTarPlayerEvent2:FireServer(Netu2)
			GuiTarPlayerEventspecial:FireServer()
		end
		A()
		local buttons1 = gameser2:WaitForChild("ButtonSer1")
		buttons1.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons1.Name)


		end)

		local buttons2 = gameser2:WaitForChild("ButtonSer2")
		buttons2.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons2.Name)

		end)

		local buttons3 = gameser2:WaitForChild("ButtonSer3")
		buttons3.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons3.Name)

		end)

		local buttons4 = gameser2:WaitForChild("ButtonSer4")
		buttons4.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons4.Name)

		end)

		local buttons5 = gameser2:WaitForChild("ButtonSer5")
		buttons5.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons5.Name)

		end)

		local buttons6 = gameser2:WaitForChild("ButtonSer6")
		buttons6.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons6.Name)

		end)

		local buttons7 = gameser2:WaitForChild("ButtonSer7")
		buttons7.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons7.Name)

		end)

		local buttons8 = gameser2:WaitForChild("ButtonSer8")
		buttons8.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons8.Name)

		end)

		local buttons9 = gameser2:WaitForChild("ButtonSer9")
		buttons9.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons9.Name)

		end)






	end
	print("1pass")
end)

StartMatchEvent.OnClientEvent:Connect(function(targetPlayer1)
	local var2 = game:GetService("Players").LocalPlayer.Name
	if targetPlayer1 ~= var2 then
		Netu1 = targetPlayer1
		print("Starting2...")
		print(targetPlayer1)
		for e = 1, 9 do
			buttons0[e] = gameser2:WaitForChild("ButtonSer"..e)
			buttons0[e].Visible = true
		end
		fr.Visible = true
		--resetgame.Visible = true
		curply.Visible = true
		--exit.Visible = true

		exit.MouseButton1Click:Connect(function()
			for e = 1, 9 do
				buttons0[e] = gameser2:WaitForChild("ButtonSer"..e)
				buttons0[e].Visible = false
				buttons0[e].Text = " "

			end
			exit.Visible = false
			fr.Visible = false
			--resetgame.Visible = true
			curply.Visible = false
			curply.Text = "N/A"
		end)

		GuiTarPlayerEvent:FireServer(Netu1)

		playerListFrame.Visible = false
		frame.Visible = false
		close.Visible = false
		TE.Visible = false
		kickButton.Visible = false
		TL.Visible = false
		playerNameBox.Visible = false
		RefreshButton.Visible = false

		bg1.Visible = false
		bg2.Visible = false
		acc.Visible = false
		dec.Visible = false
		NRED.Visible = false



		--GuiTarPlayerEvent:FireServer()


		local function B()
			GuiTarPlayerEvent:FireServer(targetPlayer1)
		end



		local buttons1 = gameser2:WaitForChild("ButtonSer1")
		buttons1.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons1.Name)


		end)

		local buttons2 = gameser2:WaitForChild("ButtonSer2")
		buttons2.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons2.Name)

		end)

		local buttons3 = gameser2:WaitForChild("ButtonSer3")
		buttons3.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons3.Name)

		end)

		local buttons4 = gameser2:WaitForChild("ButtonSer4")
		buttons4.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons4.Name)

		end)

		local buttons5 = gameser2:WaitForChild("ButtonSer5")
		buttons5.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons5.Name)

		end)

		local buttons6 = gameser2:WaitForChild("ButtonSer6")
		buttons6.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons6.Name)

		end)

		local buttons7 = gameser2:WaitForChild("ButtonSer7")
		buttons7.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons7.Name)

		end)

		local buttons8 = gameser2:WaitForChild("ButtonSer8")
		buttons8.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons8.Name)

		end)

		local buttons9 = gameser2:WaitForChild("ButtonSer9")
		buttons9.MouseButton1Click:Connect(function()
			PlayerRespondGameCtrl:FireServer(buttons9.Name)

		end)


	end
	print("2pass")
end)




















