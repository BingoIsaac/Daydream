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
