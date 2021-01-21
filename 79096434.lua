local Finity = loadstring(game:HttpGet('http://bingoisaac.xyz/finity.lua'))()

if game.CoreGui:FindFirstChild('FinityUI') then
   game.CoreGui['FinityUI']:Destroy()
end

local function rmspaces(str)
	return str:gsub('%s+', '') or str
end

local function findPlayer(str)
	str = rmspaces(str)
	for _,_plr in pairs(game.Players:GetPlayers()) do
		if _plr.Name:lower():match('^'.. str:lower()) then
			return _plr
		end
	end
	return nil
end

local FinityWindow = Finity.new(false, 'Daydream Hub - ' .. game.MarketplaceService:GetProductInfo(game.PlaceId).Name)
FinityWindow.ChangeToggleKey(Enum.KeyCode.Semicolon)
local a = FinityWindow:Category('Main')
local a_a = a:Sector('Server')
a_a:Cheat('Button', 'Activate Power Plant', function()
    fireclickdetector(workspace.PowerPlant.Panel1.Button.ClickDetector)
    fireclickdetector(workspace.PowerPlant.Panel2.Button.ClickDetector)
    fireclickdetector(workspace.PowerPlant.Panel3.Button.ClickDetector)
    fireclickdetector(workspace.PowerPlant.Panel4.Button.ClickDetector)
end)
a_a:Cheat('Button', 'Activate Elevator Power', function()
    fireclickdetector(workspace.Lift.FuseBox.FuseButton.ClickDetector)
end)
a_a:Cheat('Textbox', 'Respawn Player', function(Value)
    local plr = findPlayer(Value)
    plr["Respawn-Character"]:FireServer()
end, {placeholder = 'plr'})
aaState = false
a_a:Cheat('Checkbox', 'Annoy All', function(State)
    aaState = not aaState
    while aaState do
        for i,v in pairs(game.Players:GetPlayers()) do
            v.MaleFunny:FireServer()
            v.MaleMorose:FireServer()
            v.MScream:FireServer()
            v.MAggresive:FireServer()
            v.MHelp:FireServer()
            v.WFunny:FireServer()
            v.WomenMorose:FireServer()
            v.WScream:FireServer()
            v.WAgressive:FireServer()
            v.WHelp:FireServer()
        end
        wait()
    end
end)
mguState = false
a_a:Cheat('Checkbox', 'Make Game Unusable', function(State)
    mguState = not mguState
    while mguState do
        for i,v in pairs(game.Players:GetPlayers()) do
            v["Respawn-Character"]:FireServer()
        end
        wait(1)
    end
end)
a_a:Cheat('Button', 'Sans All', function()
    for i,v in pairs(game.Players:GetPlayers()) do
        v.Sans:FireServer()
    end
end)
frState = false
a_a:Cheat('Checkbox', 'Fast Run', function(State)
    frState = not frState
    while frState do
        if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed == 28 then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 80
        end
        wait()
    end
end)
