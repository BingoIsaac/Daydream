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

local a = X.New({
    Title = 'LocalPlayer'
})

speedKeybind = 'h'
speedLoop = nil
speedKeyDown = nil
speedKeyUp = nil
speedEnabled = false
local a_a = a.Button({
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

local a_b = a.Button({
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

local a_c = a.TextField({
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
