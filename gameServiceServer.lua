local ReplicatedStorage = game:GetService("ReplicatedStorage")
local N = ReplicatedStorage:WaitForChild("ResetAllRemote")
--game.Players.PlayerAdded:Connect(function()
	
	--N:FireAllClient()
	
--end)
local GuiTarPlayerEvent = ReplicatedStorage:WaitForChild("GuiTarPlayerEvent")
local GuiTarPlayerEvent2 = ReplicatedStorage:WaitForChild("GuiTarPlayerEvent2")
local GuiTarPlayerEventspecial = ReplicatedStorage:WaitForChild("GuiTarPlayerEventspecial")
local ServerStorage = game:GetService("ServerStorage")
local RequestPlayerEvent = ReplicatedStorage:WaitForChild("RequestPlayerEvent")
local Players = game:GetService("Players")
local StartMatchEvent = ReplicatedStorage:WaitForChild("StartMatchEvent")
local StartMatchEvent2 = ReplicatedStorage:WaitForChild("StartMatchEvent2")
local remoteEvent = ReplicatedStorage:WaitForChild("SendDataEvent")
local PlayerRespondGameCtrl = ReplicatedStorage:WaitForChild("PlayerRespondGameCtrl")
local AccRemoteEvent = ReplicatedStorage:WaitForChild("AccEvent")

local KickPlayerEvent = ReplicatedStorage:WaitForChild("RequestPlayerEvent")

local RemoteEvent = ReplicatedStorage:WaitForChild("SendDataEvent")

local FullboardEvent = Instance.new("RemoteEvent")
FullboardEvent.Name = "FullboardEvent"
FullboardEvent.Parent = ReplicatedStorage

--local N = ReplicatedStorage:WaitForChild("ResetAllRemote")

--local function GetNewboolValue()
--	local boolValue = Instance.new("BoolValue")
--	boolValue.Name = "Has" .. targetPlayer1
--	boolValue.Value = false
--	boolValue.Parent = ReplicatedStorage
--end
--if not ReplicatedStorage:FindFirstChild("Has".. targetPlayer1) then

local dataNameMatch = {} --1.คนรับ 2.คนเชิญ
local dataNameMatch2 = {}
KickPlayerEvent.OnServerEvent:Connect(function(player, playeRName, var2)
	local targetPlayer = Players:FindFirstChild(playeRName)
	if targetPlayer then
		print("invited")
		print(var2)
		print(playeRName)
		local Var22 = var2
		local data = playeRName
		RemoteEvent:FireClient(targetPlayer, data, Var22)
		dataNameMatch = {playeRName}
		dataNameMatch2 = {var2}
	end
end)
--GetNewboolValue()
	local boolValue1 = ServerStorage:WaitForChild("Value1")
	boolValue1.Value = false
--	if not boolValue1.Value then
--	ServerNamePlayerAccPassed = false
--	local B = true
--	local C = true
--	local D = true
--	local F = true
--	local G = true
--	local H = true
--	local I = true
--	local J = true
--	local K = true
--	local L = true
--	local M = true
AccRemoteEvent.OnServerEvent:Connect(function(player, playerhasAcc, var4)
	
	--print(dataNameMatch)
	--if boolValue1.Value == false then
		print("starting Match")
		boolValue1.Value = true
		
	local targetPlayer1 = Players:FindFirstChild(playerhasAcc)
	local targetPlayer2 = Players:FindFirstChild(var4)
	print(targetPlayer1)
	print(targetPlayer2)
	local ServerNamePlayerAccPassed = true

	if targetPlayer1 then
		StartMatchEvent:FireClient(targetPlayer1, targetPlayer1)
	else
		warn("Player " .. playerhasAcc .. " not found.")
		ServerNamePlayerAccPassed = false
	end

	if targetPlayer2 then
		StartMatchEvent2:FireClient(targetPlayer2, targetPlayer2)
	else
		warn("Player " .. var4 .. " not found.")
		ServerNamePlayerAccPassed = false
	end

	if ServerNamePlayerAccPassed then
		--local A = "None"


GuiTarPlayerEventspecial.OnServerEvent:Connect(function()
	
	--if A == targetPlayer1 and targetPlayer2 or "None" then	
	--local P1 = targetPlayer1
	--local P2 = targetPlayer2
	--A = P1 and P2

	--local B = A

	
	local buttons = {}


	local buttons222 = {}

	local ButtonSetAllServer
    local allrun = 0

	local curplyALLCLIENT1
	local curplyALLCLIENT2
	local  NumberOfRunerScript = 1

	--local newtable = {}
	--print(newtable)
	print(NumberOfRunerScript)

	local board = {"", "", "", "", "", "", "", "", ""}
	print(board)
	local currentPlayer = "X"


	local gameOver = false
	local winPatterns = {
		{1, 2, 3}, {4, 5, 6}, {7, 8, 9},  
		{1, 4, 7}, {2, 5, 8}, {3, 6, 9},  
		{1, 5, 9}, {3, 5, 7}               
	}
	local ExitSer11
	local ExitSer22

	local gameReset = false
	local gameReset2 = false
	
	local function ResetboardAllClient()
					if currentPlayer == "X" then
						currentPlayer = "O"

					else 
						currentPlayer = "X"
					end
	end
	local aaaa = 1
	local function getnewscpt()
		--if aaaa == 1 then
					--if targetPlayer then
					local humanoid = targetPlayer1.Character and targetPlayer1.Character:FindFirstChildOfClass("Humanoid")
					if humanoid then
						wait(2)
						humanoid.Health = 0
						--print("Reset player:", targetName)
					else
						--print("Humanoid not found for player:", targetName)
					end
					local humanoid2 = targetPlayer2.Character and targetPlayer2.Character:FindFirstChildOfClass("Humanoid")
					if humanoid2 then
						wait(2)
						humanoid2.Health = 0
						--print("Reset player:", targetName)
					else
					--	print("Humanoid not found for player:", targetName)
					end
					
					allrun += 1
					
					--else
					--print("Player not found:", targetName)
					--end
	--local getnewscript = game:GetService("ServerScriptService"):WaitForChild("GameService")
	--local new = getnewscript:Clone()
	--local getnewscript2 = game:GetService("ServerScriptService"):WaitForChild("ServergameCtrl")
	--local new2 = getnewscript2:Clone()
	
	--new.Name = "GameService"
	--new.Parent = game:GetService("ServerScriptService")
  --  new2.Name = "ServergameCtrl"
	--new2.Parent = game:GetService("ServerScriptService")
	--getnewscript:Destroy()
   -- getnewscript2:Destroy()
	print("Getting New Remote")
					--N:FireClient(targetPlayer1)
					--N:FireClient(targetPlayer2)
					local keepEvents = {
						["KickPlayerEvent"] = true,
						["NamePly"] = true,
						["NameNP"] = true,
						["ResetAllRemote"] = true
					}

					

					-- เรียกใช้ฟังก์ชันเพื่อลบ RemoteEvent เก่าทั้งหมด
						
					print("wait...")
					

                  --  if allrun == 1 then
print("getting")
						-- วนลูปผ่านทุก RemoteEvent ใน ReplicatedStorage
					--	for _, child in pairs(ReplicatedStorage:GetChildren()) do
							-- ตรวจสอบว่ามีประเภทเป็น RemoteEvent และไม่มีอยู่ในรายการ keepEvents
					--		if child:IsA("RemoteEvent") and not keepEvents[child.Name] then
					--			child:Destroy()
					--		end
					--	end
						
					
					
					
					local KickPlayerEvent = ReplicatedStorage:WaitForChild("KickPlayerEvent")
					KickPlayerEvent = nil
					local ReplicatedStorage = game:GetService("ReplicatedStorage")

					
					
					local RemoteEvent = ReplicatedStorage:FindFirstChild("SendDataEvent")
					local AccRemoteEvent = ReplicatedStorage:FindFirstChild("AccEvent")
					local StartMatchEvent = ReplicatedStorage:FindFirstChild("StartMatchEvent")
					local StartMatchEvent2 = ReplicatedStorage:FindFirstChild("StartMatchEvent2")
					local PlayerRespondGameCtrl = ReplicatedStorage:FindFirstChild("PlayerRespondGameCtrl")
					local GuiTarPlayerEvent = ReplicatedStorage:FindFirstChild("GuiTarPlayerEvent")
					local GuiTarPlayerEvent2 = ReplicatedStorage:FindFirstChild("GuiTarPlayerEvent2")
					local GuiTarPlayerEventspecial = ReplicatedStorage:FindFirstChild("GuiTarPlayerEventspecial")
					local FullboardEvent = ReplicatedStorage:FindFirstChild("FullboardEvent")

					
					
					RemoteEvent = nil
					AccRemoteEvent = nil
					StartMatchEvent = nil
					StartMatchEvent2 = nil
					PlayerRespondGameCtrl = nil
					GuiTarPlayerEvent = nil
					GuiTarPlayerEvent2 = nil
					GuiTarPlayerEventspecial = nil
					FullboardEvent = nil

					
					
					
					
					
					
					--[[
					local KickPlayerEvent = Instance.new("RemoteEvent")
					KickPlayerEvent.Name = "RequestPlayerEvent"
					KickPlayerEvent.Parent = ReplicatedStorage
					wait(0.1)

					local RemoteEvent = Instance.new("RemoteEvent")
					RemoteEvent.Name = "SendDataEvent"
					RemoteEvent.Parent = ReplicatedStorage
						wait(0.05)
					local AccRemoteEvent = Instance.new("RemoteEvent")
					AccRemoteEvent.Name = "AccEvent"
					AccRemoteEvent.Parent = ReplicatedStorage
						wait(0.05)
					local StartMatchEvent = Instance.new("RemoteEvent")
					StartMatchEvent.Name = "StartMatchEvent"
					StartMatchEvent.Parent = ReplicatedStorage
						wait(0.05)
					local StartMatchEvent2 = Instance.new("RemoteEvent")
					StartMatchEvent2.Name = "StartMatchEvent2"
					StartMatchEvent2.Parent = ReplicatedStorage
						wait(0.05)
					local PlayerRespondGameCtrl = Instance.new("RemoteEvent")
					PlayerRespondGameCtrl.Name = "PlayerRespondGameCtrl"
					PlayerRespondGameCtrl.Parent = ReplicatedStorage
						wait(0.05)
					local GuiTarPlayerEvent = Instance.new("RemoteEvent")
					GuiTarPlayerEvent.Name = "GuiTarPlayerEvent"
					GuiTarPlayerEvent.Parent = ReplicatedStorage
						wait(0.05)
					local GuiTarPlayerEvent2 = Instance.new("RemoteEvent")
					GuiTarPlayerEvent2.Name = "GuiTarPlayerEvent2"
					GuiTarPlayerEvent2.Parent = ReplicatedStorage
						wait(0.05)
					local GuiTarPlayerEventspecial = Instance.new("RemoteEvent")
					GuiTarPlayerEventspecial.Name = "GuiTarPlayerEventspecial"
					GuiTarPlayerEventspecial.Parent = ReplicatedStorage
						wait(0.05)
					local FullboardEvent = Instance.new("RemoteEvent")
					FullboardEvent.Name = "FullboardEvent"
					FullboardEvent.Parent = ReplicatedStorage
					--]]
					--local N = Instance.new("RemoteEvent")
					--N.Name = "ResetAllRemote"
					--N.Parent = ReplicatedStorage
					
						local ResetSP = ReplicatedStorage:FindFirstChild("ReSVSP")
						N:FireClient(targetPlayer1)
						N:FireClient(targetPlayer2)
						ResetSP.Value = true
					
					
					
					--else
						print("nah why again")
						--allrun = 0
					--end
					
	--end
	end
	GuiTarPlayerEvent.OnServerEvent:Connect(function(playerr1,player11)

		--local board
		--boardT = board
		NumberOfRunerScript += 1
		gameOver = false
		local player1A = playerr1
		local playerGui = playerr1:WaitForChild("PlayerGui")
		local gameGui = playerGui:WaitForChild("GameGui")
		local LocalGameGui = gameGui:WaitForChild("gameser")
		local curply = LocalGameGui:WaitForChild("curplySer")
		local ExitSer = LocalGameGui:WaitForChild("ExitSer")
		ExitSer11 = ExitSer
		curplyALLCLIENT1 = curply
		for i = 1, 9 do
			buttons[i] = LocalGameGui:WaitForChild("ButtonSer"..i)
		end
		--waitfor = LocalGameGui:WaitForChild("ButtonSer")


					curply.Text = currentPlayer .. " turn"

		--curply.Text = currentPlayer .. " turn"
		--curplyALLCLIENT2.Text = curply.Text

		local function resetBoard1()
			--if gameReset == true and gameReset2 == true then
				
			for i = 1, 9 do
				buttons[i].Text = " "
				board[i] = ""
			end
			if currentPlayer == "X" then
				currentPlayer = "O"

			else 
				currentPlayer = "X"
			end

			--resetgame.Visible = false
			--curply.Text = currentPlayer .. " turn"
			--curplyALLCLIENT2.Text = currentPlayer .. " turn"
			--A = "None"
			boolValue1.Value = false
			--end
						
						if gameReset == true and gameReset2 == true then
							--gameReset = false
							ResetboardAllClient()
							
						else
						print("pass?")
						end
					ResetboardAllClient()
					getnewscpt()

		end

		game.Players.PlayerRemoving:Connect(function(leavingPlayer)
			if leavingPlayer == playerr1 then
				print("Player 1 left")
				gameOver = true
				--resetBoard1()
				ExitSer22.Visible = true
				gameReset = true
				--gameReset2 = true
				curplyALLCLIENT2.Text = leavingPlayer.Name .. " left the game!"
							resetBoard1()
			end
		end)

		ExitSer.MouseButton1Click:Connect(function()
			resetBoard1()
			ExitSer.Visible = false
			 gameReset = true
			-- gameReset2 = true
		end)


		local function checkWin()


			for _, pattern in ipairs(winPatterns) do
				if board[pattern[1]] == currentPlayer and board[pattern[2]] == currentPlayer and board[pattern[3]] == currentPlayer then
					gameOver = true
					curply.Text = currentPlayer .. " Wins!"
					curplyALLCLIENT2.Text = curply.Text
					ExitSer.Visible = true
					ExitSer22.Visible = true
					--curply.Text = currentPlayer .. " wins!"
					--curplySPEC1.Text = currentPlayer .. " wins!"
					--curplySPEC2.Text = currentPlayer .. " wins!"
					return true
				end
			end

			local allFilled = true
			for i = 1, 9 do
				if board[i] == "" then
					allFilled = false
					break
				end
			end

			if allFilled then
				gameOver = true
				curply.Text = " Draw!"
				curplyALLCLIENT2.Text = curply.Text
				ExitSer.Visible = true
				ExitSer22.Visible = true

				--curply.Text = "Draw!"
				--curplySPEC1.Text = " Draw!"
				--curplySPEC2.Text = " Draw!"
				return true
			end

			return false
		end

		for i = 1, 9 do
			buttons[i].MouseButton1Click:Connect(function()
				if not gameOver and board[i] == "" then
					if currentPlayer == "O" then
						board[i] = currentPlayer
						buttons[i].Text = currentPlayer
						buttons222[i].Text = buttons[i].Text
						if not checkWin() then
							currentPlayer = (currentPlayer == "X") and "O" or "X"
							curply.Text = currentPlayer .. " turn"
							curplyALLCLIENT2.Text = curply.Text
							--curplySPEC1.Text = currentPlayer .. " turn"
							--curplySPEC2.Text = currentPlayer .. " turn"
						end
					end
				end
			end)
		end



		wait(0.1)
		curply.Text = currentPlayer .. " turn"
		curplyALLCLIENT1.Text = curply.Text








	end)
	GuiTarPlayerEvent2.OnServerEvent:Connect(function(playerrr2,player22)
		gameOver = false
		local player2A = playerrr2
		local playerGui2 = playerrr2:WaitForChild("PlayerGui")
		local gameGui2 = playerGui2:WaitForChild("GameGui")
		local LocalGameGui2 = gameGui2:WaitForChild("gameser")
		local curply2 = LocalGameGui2:WaitForChild("curplySer")
		local ExitSer2 = LocalGameGui2:WaitForChild("ExitSer")
		ExitSer22 = ExitSer2
		curplyALLCLIENT2 = curply2
		for j = 1, 9 do
			buttons222[j] = LocalGameGui2:WaitForChild("ButtonSer"..j)
		end

					curply2.Text = currentPlayer .. " turn"
		local function resetBoard2()
			--if gameReset == true and gameReset2 == true then
			for i = 1, 9 do
				buttons222[i].Text = " "
				board[i] = ""
			end
			if currentPlayer == "X" then
				currentPlayer = "O"

			else 
				currentPlayer = "X"
			end

			--resetgame.Visible = false
			
						--curplyALLCLIENT2.Text = currentPlayer .. " turn"
							boolValue1.Value = false
						
						if gameReset == true and gameReset2 == true then
							--gameReset2 = false
							
							
						else
							print("pass?")
						end
					ResetboardAllClient()
					getnewscpt()
		end


		ExitSer2.MouseButton1Click:Connect(function()
			resetBoard2()
			ExitSer2.Visible = false
			--gameReset = true
			gameReset2 = true
		end)

		game.Players.PlayerRemoving:Connect(function(leavingPlayer)
			if leavingPlayer == playerrr2 then
				print("Player 2 left")
				
				gameOver = true
				--resetBoard2()
				ExitSer11.Visible = true
				--gameReset = true
				gameReset2 = true
				curplyALLCLIENT1.Text = leavingPlayer.Name .. " left the game!"
							resetBoard2()
							
			end
		end)


		local function checkWin()


			for _, pattern in ipairs(winPatterns) do
				if board[pattern[1]] == currentPlayer and board[pattern[2]] == currentPlayer and board[pattern[3]] == currentPlayer then
					gameOver = true
					curply2.Text = currentPlayer .. " Wins!"
					curplyALLCLIENT1.Text = curply2.Text
					ExitSer2.Visible = true
					ExitSer11.Visible = true

					return true
				end
			end

			local allFilled = true
			for i = 1, 9 do
				if board[i] == "" then
					allFilled = false
					break
				end
			end

			if allFilled then
				gameOver = true
				curply2.Text = " Draw!"
				curplyALLCLIENT1.Text = curply2.Text
				ExitSer2.Visible = true
				ExitSer11.Visible = true

				return true
			end

			return false
		end






		for i = 1, 9 do
			buttons222[i].MouseButton1Click:Connect(function()
				if not gameOver and board[i] == "" then
					if currentPlayer == "X" then
						board[i] = currentPlayer
						buttons222[i].Text = currentPlayer
						buttons[i].Text = buttons222[i].Text
						if not checkWin() then
							currentPlayer = (currentPlayer == "X") and "O" or "X"
							curply2.Text = currentPlayer .. " turn"
							curplyALLCLIENT1.Text = curply2.Text
						end
					end
				end
			end)
		end

		wait(0.1)
		curply2.Text = currentPlayer .. " turn"
		curplyALLCLIENT1.Text = curply2.Text
		
		
		
		
		



	end)
	
	
	
	
	
	
	
	
	
end)



	end
	
	 
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
	--end
end)


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
--Players.PlayerRemoving:Connect(function()
--	print("player left")
--end)
-- RemoteEvents
local KickPlayerEvent = Instance.new("RemoteEvent")
KickPlayerEvent.Name = "RequestPlayerEvent"
KickPlayerEvent.Parent = ReplicatedStorage

local RemoteEvent = Instance.new("RemoteEvent")
RemoteEvent.Name = "SendDataEvent"
RemoteEvent.Parent = ReplicatedStorage

local AccRemoteEvent = Instance.new("RemoteEvent")
AccRemoteEvent.Name = "AccEvent"
AccRemoteEvent.Parent = ReplicatedStorage

local StartMatchEvent = Instance.new("RemoteEvent")
StartMatchEvent.Name = "StartMatchEvent"
StartMatchEvent.Parent = ReplicatedStorage

local StartMatchEvent2 = Instance.new("RemoteEvent")
StartMatchEvent2.Name = "StartMatchEvent2"
StartMatchEvent2.Parent = ReplicatedStorage

local PlayerRespondGameCtrl = Instance.new("RemoteEvent")
PlayerRespondGameCtrl.Name = "PlayerRespondGameCtrl"
PlayerRespondGameCtrl.Parent = ReplicatedStorage

local GuiTarPlayerEvent = Instance.new("RemoteEvent")
GuiTarPlayerEvent.Name = "GuiTarPlayerEvent"
GuiTarPlayerEvent.Parent = ReplicatedStorage

local GuiTarPlayerEvent2 = Instance.new("RemoteEvent")
GuiTarPlayerEvent2.Name = "GuiTarPlayerEvent2"
GuiTarPlayerEvent2.Parent = ReplicatedStorage

local GuiTarPlayerEventspecial = Instance.new("RemoteEvent")
GuiTarPlayerEventspecial.Name = "GuiTarPlayerEventspecial"
GuiTarPlayerEventspecial.Parent = ReplicatedStorage

local N = Instance.new("RemoteEvent")
N.Name = "ResetAllRemote"
N.Parent = ReplicatedStorage

local GetNewServerScript

local dataNameMatch = {} --1.คนรับ 2.คนเชิญ
local dataNameMatch2 = {}

