-- Example made by twink marie
local Material = loadstring(game:HttpGet('https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua'))()

local X = Material.Load({
    Title = 'Bingus Bingus',
    Style = 3,
    SizeX = 500,
    SizeY = 350,
    Theme = 'Dark'
})

local p = game.Players.LocalPlayer
local m = p:GetMouse()

function getRoot(plr)
    return plr:WaitForChild('HumanoidRootPart')
end

infJumpToggle = false
infJumpFunction = nil
function infJump()
    if not infJumpToggle then
        infJumpToggle = true
        infJumpFunction = m.KeyDown:Connect(function(key)
            if key:byte() == 32 then
                p.Character:FindFirstChild('Humanoid'):ChangeState(3)
            end
        end)
    elseif infJumpToggle then
        infJumpToggle = false
        infJumpFunction:Disconnect()
    end
end

-- thanks infinite yield! full credit <3
FLYING = false
QEfly = true
iyflyspeed = 1
vehicleflyspeed = 1
function Fly(vFly)
	repeat wait() until p and p.Character and getRoot(p.Character) and p.Character:FindFirstChild('Humanoid')
	repeat wait() until m
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

	local T = getRoot(p.Character)
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.CFrame = T.CFrame
		BV.Velocity = Vector3.new(0, 0, 0)
		BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
			repeat wait()
				if not vfly and p.Character:FindFirstChildOfClass('Humanoid') then
				    p.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.Velocity = Vector3.new(0, 0, 0)
				end
				BG.CFrame = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if p.Character:FindFirstChildOfClass('Humanoid') then
				p.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	flyKeyDown = m.KeyDown:Connect(function(key)
		if key:lower() == 'w' then
			CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
		elseif key:lower() == 's' then
			CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif key:lower() == 'a' then
			CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif key:lower() == 'd' then 
			CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
		elseif QEfly and key:lower() == 'e' then
			CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
		elseif QEfly and key:lower() == 'q' then
			CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
		end
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
	end)
	flyKeyUp = m.KeyUp:Connect(function(key)
		if key:lower() == 'w' then
			CONTROL.F = 0
		elseif key:lower() == 's' then
			CONTROL.B = 0
		elseif key:lower() == 'a' then
			CONTROL.L = 0
		elseif key:lower() == 'd' then
			CONTROL.R = 0
		elseif key:lower() == 'e' then
			CONTROL.Q = 0
		elseif key:lower() == 'q' then
			CONTROL.E = 0
		end
	end)
	FLY()
end

function noFly()
	FLYING = false
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
	if p.Character:FindFirstChildOfClass('Humanoid') then
		p.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end
    

local a = X.New({
    Title = 'LocalPlayer'
})

local a_a = a.Button({
    Text = 'Load InfYield',
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = 'Loads Infinite Yield admin.'
            })
        end
    }
})

speedKeybind = 'h'
speedLoop = nil
speedKeyDown = nil
speedKeyUp = nil
speedEnabled = false
local a_b = a.Button({
    Text = 'Speed',
    Callback = function()
        if speedEnabled == false then
            speedEnabled = true
            speedKeyDown = m.KeyDown:Connect(function(key)
                if key == speedKeybind then
                    speedLoop = true
                    while speedLoop do
                        p.Character:FindFirstChild('HumanoidRootPart').CFrame = p.Character:FindFirstChild('HumanoidRootPart').CFrame + p.Character:FindFirstChild('HumanoidRootPart').CFrame.lookVector * 3
                        wait()
                    end
                end
            end)
            speedKeyUp = m.KeyUp:Connect(function(key)
                if key == speedKeybind then
                    speedLoop = false
                end
            end)
        end
    end,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = 'Apply speed to character; removes on death.'
            })
        end
    }
})

local a_c = a.Button({
    Text = 'Stop Speed',
    Callback = function()
        if speedEnabled == true then
            speedEnabled = false
            speedKeyDown:Disconnect()
            speedKeyUp:Disconnect()
        end
    end,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = 'Remove speed from character.'
            })
        end
    }
})

local a_d = a.TextField({
    Text = 'Speed Keybind',
    Callback = function(Value)
        speedKeybind = tostring(Value)
    end,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = 'Keybind for speed.'
            })
        end,
        Default = function(self)
            X.Banner({
                Text = 'Default for speed is "h".'
            })
        end
    }
})

infJumpToggle = nil
local a_e = a.Toggle({
    Text = 'Inf Jump',
    Callback = function(Value)
        infJump()
    end,
    Enabled = false,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = 'Allows you to jump always, even in air.'
            })
        end
    }
})
infJump()

local a_f = a.Toggle({
    Text = 'Fly',
    Callback = function(Value)
        if Value then
            noFly()
            wait()
            Fly(true)
        elseif not Value then
            noFly()
        end
    end,
    Enabled = false,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = 'Fly the character. (RECOMMENDED! WORKS BEST IN A RAFT/SQUAD RAFT)'
            })
        end
    }
})

local a_g = a.Slider({
    Text = 'Fly Speed',
    Callback = function(Value)
        iyflyspeed = tonumber(Value)
        vehicleflyspeed = tonumber(Value)
    end,
    Min = 1,
    Max = 3,
    Def = 1,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = 'Fly speed for the fly toggle.'
            })
        end
    }
})

local dupeType = nil
local dupeItem = nil
local dupeAmountChest = nil
local dupeAmountChest = nil

local b = X.New({
    Title = 'Duping'
})

local b_a = b.Button({
    Text = 'DUPE!',
    Callback = function()
        if dupeType == nil then
            X.Banner({
                Text = 'Set a dupe type first!'
            })
        else
            if dupeType == 1 then
                dupeAmountChest = tonumber(p.PlayerGui.MainGui.LeftPanel.Shop.Lists.ChestList:FindFirstChild(dupeItem).Quantity.Text) - 0.1
                game.ReplicatedStorage.Events.SubmitTrade:FireServer(dupeItem, dupeAmountChest, 100000)
                wait()
                game.ReplicatedStorage.Events.ChestDrop:FireServer(dupeItem)
            elseif dupeType == 2 then
                dupeAmountItem = tonumber(dupeAmountItem) - 0.1
                game.ReplicatedStorage.Events.SubmitTrade:FireServer(dupeItem, dupeAmountItem, 100000)
                wait()
                game.ReplicatedStorage.Events.DropBagItem:FireServer(dupeItem)
            end
        end
    end,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = 'Dupe your item; will require advanced experience!'
            })
        end
    }
})

local b_b = b.Dropdown({
    Text = 'Dupe Type',
    Callback = function(Value)
        if Value == 'Chest' then
            dupeType = 1
        elseif Value == 'Item' then
            dupeType = 2
        end
    end,
    Options = {'Chest', 'Item'},
    Menu = {
        Information = function(self)
            X.Banner({
                Text = 'Type for duping; will require advanced experience!'
            })
        end
    }
})

local b_c = b.TextField({
    Text = 'Item',
    Callback = function(Value)
        dupeItem = tostring(Value)
    end,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = 'Will require advanced experience!'
            })
        end
    }
})

local b_d = b.TextField({
    Text = 'Amount (ITEM ONLY!)',
    Callback = function(Value)
        dupeAmountItem = tonumber(Value)
    end,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = 'Will require advanced experience!'
            })
        end
    }
})
