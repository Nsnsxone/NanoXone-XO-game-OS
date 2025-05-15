

local menuu = script.Parent:WaitForChild("gameconnect")
local F1 = script.Parent:WaitForChild("FrOPTION")
local F2 = script.Parent:WaitForChild("FrOPTION2")
local gamecli = script.Parent:WaitForChild("gameCli2p")
local gameser = script.Parent:WaitForChild("gameSer2p")




local sp = script.Parent:WaitForChild("gameser")
local exit = script.Parent:WaitForChild("gameser"):WaitForChild("ExitSer")
local fr = sp:WaitForChild("FSER")
local resetgame = sp:WaitForChild("resetgameSer")
local curply = sp:WaitForChild("curplySer")


local spp = sp:WaitForChild("Folder")
local bg1 = spp:WaitForChild("Frbg1")
local bg2 = spp:WaitForChild("Frbg2")
local acc = spp:WaitForChild("Acc")
local dec = spp:WaitForChild("Dec")
local NRED = spp:WaitForChild("NameRequest")



bg1.Visible = false
bg2.Visible = false
acc.Visible = false
dec.Visible = false
NRED.Visible = false
--menuu.Visible = false
--F1.Visible = false
--F2.Visible = false
--gamecli.Visible = false
--gameser.Visible = false
--soonfr.Visible = false
exit.Visible = false
local buttons0 = {}
for e = 1, 9 do
	buttons0[e] = sp:WaitForChild("ButtonSer"..e)
	buttons0[e].Visible = false 
end

fr.Visible = false
resetgame.Visible = false
curply.Visible = false
local var2 = game:GetService("Players").LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")


local remoteEvent = ReplicatedStorage:WaitForChild("SendDataEvent")
local AccRemotePlayerEvent = ReplicatedStorage:WaitForChild("AccEvent")
local GuiTarPlayerEvent = ReplicatedStorage:WaitForChild("GuiTarPlayerEvent")


local NameWant
local NameClickAcc

remoteEvent.OnClientEvent:Connect(function(data, Var22)
	if  data == Var22 then
		print("You Cannot Match with yourself")
		print("Try play Client Mode")
		print("Error 2 filters passed")
	else
		print("Data received from server: " .. data)
		print(var2.Name)
		print(Var22)
		if data == var2.Name then
			if fr.Visible == false then
			print("true")
			-- สามารถทำอย่างอื่นได้ เช่น แสดงข้อความใน GUI หรือจัดการข้อมูลอื่น ๆ
			bg1.Visible = true
			bg2.Visible = true
			acc.Visible = true
			dec.Visible = true
			NRED.Visible = true
			NRED.Text = Var22 
				.. " want to match with you"
			NameWant = Var22
			NameClickAcc = data
			end
		else
			print("false")
		end 
	end
end)


local FullboardEvent = ReplicatedStorage:WaitForChild("FullboardEvent")


acc.MouseButton1Click:Connect(function()
	if fr.Visible == false then
	local playerhasAcc = NameWant
	--playerNameBox.Text 
	local var4 = NameClickAcc
	--game:GetService("Players").LocalPlayer.Name --Name Original
	local AccN = "Acc"
	print("during")
	print(var4)
	AccRemotePlayerEvent:FireServer(playerhasAcc, var4)
	FullboardEvent.OnClientEvent:Connect(function()
		--FullboardEvent:FireServer()
		AccRemotePlayerEvent:FireServer(playerhasAcc, var4)

	end)
	print("fire Acc")
	print(playerhasAcc)
	end
end)
--[[
gameser.MouseButton1Click:Connect(function()
	for e = 1, 9 do
		buttons0[e] = sp:WaitForChild("ButtonSer"..e)
		buttons0[e].Visible = true
	end
	fr.Visible = true
	resetgame.Visible = true
	curply.Visible = true
end)
--]]


dec.MouseButton1Click:Connect(function()

	bg1.Visible = false
	bg2.Visible = false
	acc.Visible = false
	dec.Visible = false
	NRED.Visible = false
end)















