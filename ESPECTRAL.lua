local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Espectroxs/CLT-HUB/refs/heads/main/Library%20(1).txt", true))()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local startTime = os.time()
local startRebirths = player.leaderstats.Rebirths.Value
local displayName = player.DisplayName

local VirtualUser = game:GetService("VirtualUser")
local antiAFKConnection

local function setupAntiAFK()
    if antiAFKConnection then
        antiAFKConnection:Disconnect()
    end
    
    antiAFKConnection = player.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        print("Anti-AFK: Prevented idle kick")
    end)
    
    print("Anti-AFK system enabled")
end

setupAntiAFK()

local window = library:AddWindow("Espectral | Farming - God Mode", {
    main_color = Color3.fromRGB(0, 191, 255),
    min_size = Vector2.new(600, 600),
    can_resize = false,
})

local farmPlusTab = window:AddTab("Farm")
farmPlusTab:Show()

local autoRockFolder = farmPlusTab:AddFolder("Auto Rock")

-- Define the gettool function first
function gettool()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end

-- Add all rock farming toggles to the Auto Rock folder
autoRockFolder:AddSwitch("Tiny Rock", function(Value)
    selectrock = "Tiny Island Rock"
    getgenv().autoFarm = Value
    
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then break end
            
            if game:GetService("Players").LocalPlayer.Durability.Value >= 0 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 0 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)

autoRockFolder:AddSwitch("Starter Rock", function(Value)
    selectrock = "Starter Island Rock"
    getgenv().autoFarm = Value
    
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then break end
            
            if game:GetService("Players").LocalPlayer.Durability.Value >= 100 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 100 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)

autoRockFolder:AddSwitch("Legend Beach Rock", function(Value)
    selectrock = "Legend Beach Rock"
    getgenv().autoFarm = Value
    
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then break end
            
            if game:GetService("Players").LocalPlayer.Durability.Value >= 5000 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 5000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)

autoRockFolder:AddSwitch("Frozen Rock", function(Value)
    selectrock = "Frost Gym Rock"
    getgenv().autoFarm = Value
    
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then break end
            
            if game:GetService("Players").LocalPlayer.Durability.Value >= 150000 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 150000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)

autoRockFolder:AddSwitch("Mythical Rock", function(Value)
    selectrock = "Mythical Gym Rock"
    getgenv().autoFarm = Value
    
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then break end
            
            if game:GetService("Players").LocalPlayer.Durability.Value >= 400000 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 400000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)

autoRockFolder:AddSwitch("Eternal Rock", function(Value)
    selectrock = "Eternal Gym Rock"
    getgenv().autoFarm = Value
    
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then break end
            
            if game:GetService("Players").LocalPlayer.Durability.Value >= 750000 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 750000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)

autoRockFolder:AddSwitch("Legend Rock", function(Value)
    selectrock = "Legend Gym Rock"
    getgenv().autoFarm = Value
    
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then break end
            
            if game:GetService("Players").LocalPlayer.Durability.Value >= 1000000 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 1000000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)

autoRockFolder:AddSwitch("Muscle King Rock", function(Value)
    selectrock = "Muscle King Gym Rock"
    getgenv().autoFarm = Value
    
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then break end
            
            if game:GetService("Players").LocalPlayer.Durability.Value >= 5000000 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 5000000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end)

autoRockFolder:AddSwitch("Jungle Rock", function(Value)
    selectrock = "Ancient Jungle Rock"
    getgenv().autoFarm = Value
    
    task.spawn(function()
        while getgenv().autoFarm do
            task.wait()
            if not getgenv().autoFarm then break end
            
            if game:GetService("Players").LocalPlayer.Durability.Value >= 10000000 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 10000000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                        gettool()
                    end
                end
            end
        end
    end)
end) 

local autoEquipToolsFolder = farmPlusTab:AddFolder("Farming")

-- Free AutoLift Gamepass Button
autoEquipToolsFolder:AddButton("Gamepass AutoLift", function()
    local gamepassFolder = game:GetService("ReplicatedStorage").gamepassIds
    local player = game:GetService("Players").LocalPlayer
    for _, gamepass in pairs(gamepassFolder:GetChildren()) do
        local value = Instance.new("IntValue")
        value.Name = gamepass.Name
        value.Value = gamepass.Value
        value.Parent = player.ownedGamepasses
    end
end, "Free AutoLift")

-- Auto Weight Toggle
autoEquipToolsFolder:AddSwitch("Auto Weight", function(Value)
    _G.AutoWeight = Value
    
    if Value then
        local weightTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight")
        if weightTool then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(weightTool)
        end
    else
        local character = game.Players.LocalPlayer.Character
        local equipped = character:FindFirstChild("Weight")
        if equipped then
            equipped.Parent = game.Players.LocalPlayer.Backpack
        end
    end
    
    task.spawn(function()
        while _G.AutoWeight do
            if not _G.AutoWeight then break end
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            task.wait(0.001)
        end
    end)
end, "Automatic Weight")

-- Auto Pushups Toggle
autoEquipToolsFolder:AddSwitch("Auto Pushups", function(Value)
    _G.AutoPushups = Value
    
    if Value then
        local pushupsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Pushups")
        if pushupsTool then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(pushupsTool)
        end
    else
        local character = game.Players.LocalPlayer.Character
        local equipped = character:FindFirstChild("Pushups")
        if equipped then
            equipped.Parent = game.Players.LocalPlayer.Backpack
        end
    end
    
    task.spawn(function()
        while _G.AutoPushups do
            if not _G.AutoPushups then break end
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            task.wait(0.001)
        end
    end)
end, "Pushups Automatic")

-- Auto Handstands Toggle
autoEquipToolsFolder:AddSwitch("Auto Handstands", function(Value)
    _G.AutoHandstands = Value
    
    if Value then
        local handstandsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Handstands")
        if handstandsTool then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(handstandsTool)
        end
    else
        local character = game.Players.LocalPlayer.Character
        local equipped = character:FindFirstChild("Handstands")
        if equipped then
            equipped.Parent = game.Players.LocalPlayer.Backpack
        end
    end
    
    task.spawn(function()
        while _G.AutoHandstands do
            if not _G.AutoHandstands then break end
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            task.wait(0.001)
        end
    end)
end, "Automatic Handstands")

-- Auto Situps Toggle
autoEquipToolsFolder:AddSwitch("Auto Situps", function(Value)
    _G.AutoSitups = Value
    
    if Value then
        local situpsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Situps")
        if situpsTool then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(situpsTool)
        end
    else
        local character = game.Players.LocalPlayer.Character
        local equipped = character:FindFirstChild("Situps")
        if equipped then
            equipped.Parent = game.Players.LocalPlayer.Backpack
        end
    end
    
    task.spawn(function()
        while _G.AutoSitups do
            if not _G.AutoSitups then break end
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            task.wait(0.001)
        end
    end)
end, "Automatic Abdominal")

-- Auto Punch Toggle
autoEquipToolsFolder:AddSwitch("Auto Punch", function(Value)
    _G.fastHitActive = Value
    
    if Value then
        -- Function to equip and modify punch
        task.spawn(function()
            while _G.fastHitActive do
                if not _G.fastHitActive then break end
                
                local player = game.Players.LocalPlayer
                local punch = player.Backpack:FindFirstChild("Punch")
                if punch then
                    punch.Parent = player.Character
                    if punch:FindFirstChild("attackTime") then
                        punch.attackTime.Value = 0
                    end
                end
                task.wait(0.001)
            end
        end)
        
        -- Function for rapid punching
        task.spawn(function()
            while _G.fastHitActive do
                if not _G.fastHitActive then break end
                
                local player = game.Players.LocalPlayer
                player.muscleEvent:FireServer("punch", "rightHand")
                player.muscleEvent:FireServer("punch", "leftHand")
                
                local character = player.Character
                if character then
                    local punchTool = character:FindFirstChild("Punch")
                    if punchTool then
                        punchTool:Activate()
                    end
                end
                task.wait(0)
            end
        end)
    else
        local character = game.Players.LocalPlayer.Character
        local equipped = character:FindFirstChild("Punch")
        if equipped then
            equipped.Parent = game.Players.LocalPlayer.Backpack
        end
    end
end, "Automatic Punch")

-- Fast Tools Toggle
autoEquipToolsFolder:AddSwitch("Fast Tools", function(Value)
    _G.FastTools = Value
    
    local defaultSpeeds = {
        {
            "Punch",
            "attackTime",
            Value and 0 or 0.35
        },
        {
            "Ground Slam",
            "attackTime",
            Value and 0 or 6
        },
        {
            "Stomp",
            "attackTime",
            Value and 0 or 7
        },
        {
            "Handstands",
            "repTime",
            Value and 0 or 1
        },
        {
            "Pushups",
            "repTime",
            Value and 0 or 1
        },
        {
            "Weight",
            "repTime",
            Value and 0 or 1
        },
        {
            "Situps",
            "repTime",
            Value and 0 or 1
        }
    }
    
    local player = game.Players.LocalPlayer
    local backpack = player:WaitForChild("Backpack")
    
    for _, toolInfo in ipairs(defaultSpeeds) do
        local tool = backpack:FindFirstChild(toolInfo[1])
        if tool and tool:FindFirstChild(toolInfo[2]) then
            tool[toolInfo[2]].Value = toolInfo[3]
        end
        
        local equippedTool = player.Character and player.Character:FindFirstChild(toolInfo[1])
        if equippedTool and equippedTool:FindFirstChild(toolInfo[2]) then
            equippedTool[toolInfo[2]].Value = toolInfo[3]
        end
    end
end, "Fast")

local misc2Folder = farmPlusTab:AddFolder("Farming Premium")

-- Fast Punch toggle with auto-punch functionality and persistent equipping
misc2Folder:AddSwitch("Auto Punch", function(bool)
    _G.FastPunch = bool
    
    if bool then
        -- Function to continuously equip and modify punch
        spawn(function()
            while _G.FastPunch do
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                -- Check if tool is not equipped
                if character and not character:FindFirstChild("Punch") then
                    local punch = player.Backpack:FindFirstChild("Punch")
                    if punch then
                        if punch:FindFirstChild("attackTime") then
                            punch.attackTime.Value = 0
                        end
                        character.Humanoid:EquipTool(punch)
                    end
                elseif character and character:FindFirstChild("Punch") then
                    -- Make sure equipped tool is modified
                    local equipped = character:FindFirstChild("Punch")
                    if equipped:FindFirstChild("attackTime") then
                        equipped.attackTime.Value = 0
                    end
                end
                
                wait(0.001)
            end
        end)
        
        -- Function to rapidly punch
        spawn(function()
            while _G.FastPunch do
                local player = game.Players.LocalPlayer
                player.muscleEvent:FireServer("punch", "rightHand")
                player.muscleEvent:FireServer("punch", "leftHand")
                local character = player.Character
                if character then
                    local punchTool = character:FindFirstChild("Punch")
                    if punchTool then
                        punchTool:Activate()
                    end
                end
                wait(0)
            end
        end)
    else
        -- Unequip and reset tool
        local character = game.Players.LocalPlayer.Character
        local equipped = character:FindFirstChild("Punch")
        if equipped then
            if equipped:FindFirstChild("attackTime") then
                equipped.attackTime.Value = 0.35
            end
            equipped.Parent = game.Players.LocalPlayer.Backpack
        end
        
        -- Also reset the backpack tool
        local backpackTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Punch")
        if backpackTool and backpackTool:FindFirstChild("attackTime") then
            backpackTool.attackTime.Value = 0.35
        end
    end
end)

-- Fast Situps toggle with auto-situps functionality and persistent equipping
misc2Folder:AddSwitch("Auto Situps", function(bool)
    _G.FastSitups = bool
    
    if bool then
        -- Continuously equip and modify situps tool
        spawn(function()
            while _G.FastSitups do
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                -- Check if tool is not equipped
                if character and not character:FindFirstChild("Situps") then
                    local situpsTool = player.Backpack:FindFirstChild("Situps")
                    if situpsTool then
                        if situpsTool:FindFirstChild("repTime") then
                            situpsTool.repTime.Value = 0
                        end
                        character.Humanoid:EquipTool(situpsTool)
                    end
                elseif character and character:FindFirstChild("Situps") then
                    -- Make sure equipped tool is modified
                    local equipped = character:FindFirstChild("Situps")
                    if equipped:FindFirstChild("repTime") then
                        equipped.repTime.Value = 0
                    end
                end
                
                wait(0.001)
            end
        end)
        
        -- Auto do situps
        spawn(function()
            while _G.FastSitups do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                task.wait(0)
            end
        end)
    else
        -- Unequip and reset tool
        local character = game.Players.LocalPlayer.Character
        local equipped = character:FindFirstChild("Situps")
        if equipped then
            if equipped:FindFirstChild("repTime") then
                equipped.repTime.Value = 1
            end
            equipped.Parent = game.Players.LocalPlayer.Backpack
        end
        
        -- Also reset the backpack tool
        local backpackTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Situps")
        if backpackTool and backpackTool:FindFirstChild("repTime") then
            backpackTool.repTime.Value = 1
        end
    end
end)

-- Fast Weight toggle with auto-weight functionality and persistent equipping
misc2Folder:AddSwitch("Auto Weight", function(bool)
    _G.FastWeight = bool
    
    if bool then
        -- Continuously equip and modify weight tool
        spawn(function()
            while _G.FastWeight do
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                -- Check if tool is not equipped
                if character and not character:FindFirstChild("Weight") then
                    local weightTool = player.Backpack:FindFirstChild("Weight")
                    if weightTool then
                        if weightTool:FindFirstChild("repTime") then
                            weightTool.repTime.Value = 0
                        end
                        character.Humanoid:EquipTool(weightTool)
                    end
                elseif character and character:FindFirstChild("Weight") then
                    -- Make sure equipped tool is modified
                    local equipped = character:FindFirstChild("Weight")
                    if equipped:FindFirstChild("repTime") then
                        equipped.repTime.Value = 0
                    end
                end
                
                wait(0.001)
            end
        end)
        
        -- Auto do weight lifting
        spawn(function()
            while _G.FastWeight do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                task.wait(0)
            end
        end)
    else
        -- Unequip and reset tool
        local character = game.Players.LocalPlayer.Character
        local equipped = character:FindFirstChild("Weight")
        if equipped then
            if equipped:FindFirstChild("repTime") then
                equipped.repTime.Value = 1
            end
            equipped.Parent = game.Players.LocalPlayer.Backpack
        end
        
        -- Also reset the backpack tool
        local backpackTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight")
        if backpackTool and backpackTool:FindFirstChild("repTime") then
            backpackTool.repTime.Value = 1
        end
    end
end)

-- Fast Pushups toggle with auto-pushups functionality and persistent equipping
misc2Folder:AddSwitch("Auto Pushups", function(bool)
    _G.FastPushups = bool
    
    if bool then
        -- Continuously equip and modify pushups tool
        spawn(function()
            while _G.FastPushups do
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                -- Check if tool is not equipped
                if character and not character:FindFirstChild("Pushups") then
                    local pushupsTool = player.Backpack:FindFirstChild("Pushups")
                    if pushupsTool then
                        if pushupsTool:FindFirstChild("repTime") then
                            pushupsTool.repTime.Value = 0
                        end
                        character.Humanoid:EquipTool(pushupsTool)
                    end
                elseif character and character:FindFirstChild("Pushups") then
                    -- Make sure equipped tool is modified
                    local equipped = character:FindFirstChild("Pushups")
                    if equipped:FindFirstChild("repTime") then
                        equipped.repTime.Value = 0
                    end
                end
                
                wait(0.001)
            end
        end)
        
        -- Auto do pushups
        spawn(function()
            while _G.FastPushups do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                task.wait(0)
            end
        end)
    else
        -- Unequip and reset tool
        local character = game.Players.LocalPlayer.Character
        local equipped = character:FindFirstChild("Pushups")
        if equipped then
            if equipped:FindFirstChild("repTime") then
                equipped.repTime.Value = 1
            end
            equipped.Parent = game.Players.LocalPlayer.Backpack
        end
        
        -- Also reset the backpack tool
        local backpackTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Pushups")
        if backpackTool and backpackTool:FindFirstChild("repTime") then
            backpackTool.repTime.Value = 1
        end
    end
end)

-- Fast Handstands toggle with auto-handstands functionality and persistent equipping
misc2Folder:AddSwitch("Auto Handstands", function(bool)
    _G.FastHandstands = bool
    
    if bool then
        -- Continuously equip and modify handstands tool
        spawn(function()
            while _G.FastHandstands do
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                -- Check if tool is not equipped
                if character and not character:FindFirstChild("Handstands") then
                    local handstandsTool = player.Backpack:FindFirstChild("Handstands")
                    if handstandsTool then
                        if handstandsTool:FindFirstChild("repTime") then
                            handstandsTool.repTime.Value = 0
                        end
                        character.Humanoid:EquipTool(handstandsTool)
                    end
                elseif character and character:FindFirstChild("Handstands") then
                    -- Make sure equipped tool is modified
                    local equipped = character:FindFirstChild("Handstands")
                    if equipped:FindFirstChild("repTime") then
                        equipped.repTime.Value = 0
                    end
                end
                
                wait(0.001)
            end
        end)
        
        -- Auto do handstands
        spawn(function()
            while _G.FastHandstands do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                task.wait(0)
            end
        end)
    else
        -- Unequip and reset tool
        local character = game.Players.LocalPlayer.Character
        local equipped = character:FindFirstChild("Handstands")
        if equipped then
            if equipped:FindFirstChild("repTime") then
                equipped.repTime.Value = 1
            end
            equipped.Parent = game.Players.LocalPlayer.Backpack
        end
        
        -- Also reset the backpack tool
        local backpackTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Handstands")
        if backpackTool and backpackTool:FindFirstChild("repTime") then
            backpackTool.repTime.Value = 1
        end
    end
end)

-- Inicializar variables de seguimiento
local sessionStartTime = os.time()
local sessionStartStrength = 0
local sessionStartDurability = 0
local sessionStartKills = 0
local sessionStartRebirths = 0
local sessionStartBrawls = 0
local hasStartedTracking = false

local rebirthsFolder = farmPlusTab:AddFolder("Rebirths")

-- Target rebirth input - direct text input
rebirthsFolder:AddTextBox("Rebirth Target", function(text)
    local newValue = tonumber(text)
    if newValue and newValue > 0 then
        targetRebirthValue = newValue
        updateStats() -- Call the stats update function
        
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Updated Objective",
            Text = "New Objective: " .. tostring(targetRebirthValue) .. " renacimientos",
            Duration = 0
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Entrada Inválida",
            Text = "Use a number greater than 0",
            Duration = 0
        })
    end
end)

-- Create toggle switches
local infiniteSwitch -- Forward declaration

local targetSwitch = rebirthsFolder:AddSwitch("Auto Rebirth Target", function(bool)
    _G.targetRebirthActive = bool
    
    if bool then
        -- Turn off infinite rebirth if it's on
        if _G.infiniteRebirthActive and infiniteSwitch then
            infiniteSwitch:Set(false)
            _G.infiniteRebirthActive = false
        end
        
        -- Start target rebirth loop
        spawn(function()
            while _G.targetRebirthActive and wait(0.1) do
                local currentRebirths = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                
                if currentRebirths >= targetRebirthValue then
                    targetSwitch:Set(false)
                    _G.targetRebirthActive = false
                    
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Completed",
                        Text = "Completed " .. tostring(targetRebirthValue) .. " renascimentos",
                        Duration = 5
                    })
                    
                    break
                end
                
                game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            end
        end)
    end
end, "Renascimento automático")

infiniteSwitch = rebirthsFolder:AddSwitch("Auto Rebirth (Infinite)", function(bool)
    _G.infiniteRebirthActive = bool
    
    if bool then
        -- Turn off target rebirth if it's on
        if _G.targetRebirthActive and targetSwitch then
            targetSwitch:Set(false)
            _G.targetRebirthActive = false
        end
        
        -- Start infinite rebirth loop
        spawn(function()
            while _G.infiniteRebirthActive and wait(0.1) do
                game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            end
        end)
    end
end, "Rebirth Infinite")

local sizeSwitch = rebirthsFolder:AddSwitch("Auto Size 1", function(bool)
    _G.autoSizeActive = bool
    
    if bool then
        spawn(function()
            while _G.autoSizeActive and wait() do
                game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 1)
            end
        end)
    end
end, "Size 1")

local teleportSwitch = rebirthsFolder:AddSwitch("Auto Teleport Muscle King", function(bool)
    _G.teleportActive = bool
    
    if bool then
        spawn(function()
            while _G.teleportActive and wait() do
                if game.Players.LocalPlayer.Character then
                    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-8646, 17, -5738))
                end
            end
        end)
    end
end, "Teleport")

local rebirthFarmFolder = farmPlusTab:AddFolder("Rebirth Premium")

local function unequipAllPets()
    local petsFolder = player.petsFolder
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                ReplicatedStorage.rEvents.equipPetEvent:FireServer("unequipPet", pet)
            end
        end
    end
    task.wait(0.1)
end

local function equipUniquePet(petName)
    unequipAllPets()
    task.wait(0.01)
    for _, pet in pairs(player.petsFolder.Unique:GetChildren()) do
        if pet.Name == petName then
            ReplicatedStorage.rEvents.equipPetEvent:FireServer("equipPet", pet)
        end
    end
end

local function findMachine(machineName)
    local machine = workspace.machinesFolder:FindFirstChild(machineName)
    if not machine then
        for _, folder in pairs(workspace:GetChildren()) do
            if folder:IsA("Folder") and folder.Name:find("machines") then
                machine = folder:FindFirstChild(machineName)
                if machine then break end
            end
        end
    end
    return machine
end

local function pressE()
    local vim = game:GetService("VirtualInputManager")
    vim:SendKeyEvent(true, "E", false, game)
    task.wait(0.1)
    vim:SendKeyEvent(false, "E", false, game)
end

local function useOneEgg()
    ReplicatedStorage.rEvents.proteinEggEvent:FireServer("useEgg")
end

rebirthFarmFolder:AddLabel("Rebirth Farm (Packs)")

rebirthFarmFolder:AddTextBox("Target Rebirth", function(text)
    targetRebirth = tonumber(text) or math.huge
end)

-- Variable to store the position lock connection
local positionLockConnection = nil

-- Function to lock player position
local function lockPlayerPosition(position)
    if positionLockConnection then
        positionLockConnection:Disconnect()
    end
    
    positionLockConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = position
        end
    end)
end

-- Function to unlock player position
local function unlockPlayerPosition()
    if positionLockConnection then
        positionLockConnection:Disconnect()
        positionLockConnection = nil
    end
end

-- Add position lock toggle
rebirthFarmFolder:AddSwitch("Lock Position", function(bool)
    if bool then
        -- Get current position and lock it
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local currentPosition = player.Character.HumanoidRootPart.CFrame
            lockPlayerPosition(currentPosition)
        end
    else
        -- Unlock position
        unlockPlayerPosition()
    end
end)

local packFarm = rebirthFarmFolder:AddSwitch("Rebirth Farm", function(bool)
    isRunning = bool
    
    task.spawn(function()
        while isRunning do
            local currentRebirths = player.leaderstats.Rebirths.Value
            local rebirthCost = 10000 + (5000 * currentRebirths)
            
            if player.ultimatesFolder:FindFirstChild("Golden Rebirth") then
                local goldenRebirths = player.ultimatesFolder["Golden Rebirth"].Value
                rebirthCost = math.floor(rebirthCost * (1 - (goldenRebirths * 0.1)))
            end
            unequipAllPets()
            task.wait(0.1)
            equipUniquePet("Swift Samurai")
            
            while isRunning and player.leaderstats.Strength.Value < rebirthCost do
                for i = 1, 10 do
                    player.muscleEvent:FireServer("rep")
                end
                task.wait()
            end
            unequipAllPets()
            task.wait(0.1)
            equipUniquePet("Tribal Overlord")
            local machine = findMachine("Jungle Bar Lift")
            if machine and machine:FindFirstChild("interactSeat") then
                player.Character.HumanoidRootPart.CFrame = machine.interactSeat.CFrame * CFrame.new(0, 3, 0)
                repeat
                    task.wait(0.1)
                    pressE()
                until player.Character.Humanoid.Sit
            end
            local initialRebirths = player.leaderstats.Rebirths.Value
            repeat
                ReplicatedStorage.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                task.wait(0.1)
            until player.leaderstats.Rebirths.Value > initialRebirths
            if not isRunning then break end
            task.wait()
        end
    end)
end)

local frameToggle = rebirthFarmFolder:AddSwitch("Hide Frames", function(bool)
    local rSto = game:GetService("ReplicatedStorage")
    for _, obj in pairs(rSto:GetChildren()) do
        if obj.Name:match("Frame$") then
            obj.Visible = not bool
        end
    end
end)

local speedGrind = rebirthFarmFolder:AddSwitch("Fast Strength", function(bool)
    local isGrinding = bool
    
    if not bool then
        unequipAllPets()
        return
    end
    
    equipUniquePet("Swift Samurai")
    
    for i = 1, 14 do
        task.spawn(function()
            while isGrinding do
                player.muscleEvent:FireServer("rep")
                task.wait()
            end
        end)
    end
end)

local pets = window:AddTab("Pets")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

pets:AddLabel("Pets")

local selectedPet = "Neon Guardian"
local petDropdown = pets:AddDropdown("Select Pet", function(text)
    selectedPet = text
    print("Selected: " .. text)
end)

petDropdown:Add("Neon Guardian")
petDropdown:Add("Blue Birdie")
petDropdown:Add("Blue Bunny")
petDropdown:Add("Blue Firecaster")
petDropdown:Add("Blue Pheonix")
petDropdown:Add("Crimson Falcon")
petDropdown:Add("Cybernetic Showdown Dragon")
petDropdown:Add("Dark Golem")
petDropdown:Add("Dark Legends Manticore")
petDropdown:Add("Dark Vampy")
petDropdown:Add("Darkstar Hunter")
petDropdown:Add("Eternal Strike Leviathan")
petDropdown:Add("Frostwave Legends Penguin")
petDropdown:Add("Gold Warrior")
petDropdown:Add("Golden Pheonix")
petDropdown:Add("Golden Viking")
petDropdown:Add("Green Butterfly")
petDropdown:Add("Green Firecaster")
petDropdown:Add("Infernal Dragon")
petDropdown:Add("Lightning Strike Phantom")
petDropdown:Add("Magic Butterfly")
petDropdown:Add("Muscle Sensei")
petDropdown:Add("Orange Hedgehog")
petDropdown:Add("Orange Pegasus")
petDropdown:Add("Phantom Genesis Dragon")
petDropdown:Add("Purple Dragon")
petDropdown:Add("Purple Falcon")
petDropdown:Add("Red Dragon")
petDropdown:Add("Red Firecaster")
petDropdown:Add("Red Kitty")
petDropdown:Add("Silver Dog")
petDropdown:Add("Ultimate Supernova Pegasus")
petDropdown:Add("Ultra Birdie")
petDropdown:Add("White Pegasus")
petDropdown:Add("White Pheonix")
petDropdown:Add("Yellow Butterfly")

pets:AddSwitch("Auto Open Pet", function(bool)
    _G.AutoHatchPet = bool
    
    if bool then
        spawn(function()
            while _G.AutoHatchPet and selectedPet ~= "" do
                local petToOpen = ReplicatedStorage.cPetShopFolder:FindFirstChild(selectedPet)
                if petToOpen then
                    ReplicatedStorage.cPetShopRemote:InvokeServer(petToOpen)
                end
                task.wait(1)
            end
        end)
    end
end)

pets:AddLabel("AURAS")

local selectedAura = "Blue Aura"
local auraDropdown = pets:AddDropdown("Select Aura", function(text)
    selectedAura = text
    print("Aura Selected: " .. text)
end)

-- Add aura options
auraDropdown:Add("Astral Electro")
auraDropdown:Add("Azure Tundra")
auraDropdown:Add("Blue Aura")
auraDropdown:Add("Dark Electro")
auraDropdown:Add("Dark Lightning")
auraDropdown:Add("Dark Storm")
auraDropdown:Add("Electro")
auraDropdown:Add("Enchanted Mirage")
auraDropdown:Add("Entropic Blast")
auraDropdown:Add("Eternal Megastrike")
auraDropdown:Add("Grand Supernova")
auraDropdown:Add("Green Aura")
auraDropdown:Add("Inferno")
auraDropdown:Add("Lightning")
auraDropdown:Add("Muscle King")
auraDropdown:Add("Power Lightning")
auraDropdown:Add("Purple Aura")
auraDropdown:Add("Purple Nova")
auraDropdown:Add("Red Aura")
auraDropdown:Add("Supernova")
auraDropdown:Add("Ultra Inferno")
auraDropdown:Add("Ultra Mirage")
auraDropdown:Add("Unstable Mirage")
auraDropdown:Add("Yellow Aura")

-- Auto open aura toggle
pets:AddSwitch("Auto Open Auras", function(bool)
    _G.AutoHatchAura = bool
    
    if bool then
        spawn(function()
            while _G.AutoHatchAura and selectedAura ~= "" do
                local auraToOpen = ReplicatedStorage.cPetShopFolder:FindFirstChild(selectedAura)
                if auraToOpen then
                    ReplicatedStorage.cPetShopRemote:InvokeServer(auraToOpen)
                end
                task.wait(1)
            end
        end)
    end
end)

local teleportTab = window:AddTab("Teleport")

teleportTab:AddButton("Spawn", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(2, 8, 115)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teletransportado",
        Duration = 0
    })
end)

teleportTab:AddButton("Secret Area", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(1947, 2, 6191)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teletransportado",
        Duration = 0
    })
end)

teleportTab:AddButton("Tiny Island", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(-34, 7, 1903)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teletransportado",
        Duration = 0
    })
end)

teleportTab:AddButton("Teleport Frozen", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(- 2600.00244, 3.67686558, - 403.884369, 0.0873617008, 1.0482899e-09, 0.99617666, 3.07204253e-08, 1, - 3.7464023e-09, - 0.99617666, 3.09302628e-08, 0.0873617008)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teletransportado",
        Duration = 0
    })
end)

teleportTab:AddButton("Mythical", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(2255, 7, 1071)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teletransportado",
        Duration = 0
    })
end)

teleportTab:AddButton("Inferno", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(-6768, 7, -1287)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teletransportado",
        Duration = 0
    })
end)

teleportTab:AddButton("Legend", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(4604, 991, -3887)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teletransportado",
        Duration = 0
    })
end)

teleportTab:AddButton("Muscle King Gym", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(-8646, 17, -5738)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teletransportado",
        Duration = 0
    })
end)

teleportTab:AddButton("Jungle", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(-8659, 6, 2384)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teletransportado",
        Duration = 0
    })
end)

teleportTab:AddButton("Brawl Lava", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(4471, 119, -8836)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teletransportado",
        Duration = 0
    })
end)

teleportTab:AddButton("Brawl Desert", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(960, 17, -7398)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teletransportado",
        Duration = 0
    })
end)

teleportTab:AddButton("Brawl Regular", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(-1849, 20, -6335)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teletransportado",
        Duration = 0
    })
end)

teleportTab:AddButton("Secret Area", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(1947, -0.281700373, 6191, 1, 8.32729867e-08, 6.46744824e-14, -8.32729867e-08, 1, 2.28852119e-08, -6.27687599e-14, -2.28852119e-08, 1)

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Você foi para a Secret Area!",
        Duration = 0
    })
end)

local misc = window:AddTab("Misc")

misc:AddButton("Boost", function()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain

    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0

    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0

    pcall(function()
        settings().Rendering.QualityLevel = "Level01"
    end)

    for _, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
            v.CastShadow = false  
        elseif v:IsA("Decal") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
            v.Enabled = false 
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        end
    end

    for _, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)

misc:AddButton("Ativar Anti-AFK", function()
    task.wait(0.5)

    local ba = Instance.new("ScreenGui")
    local ca = Instance.new("TextLabel")
    local da = Instance.new("Frame")
    local _b = Instance.new("TextLabel")
    local ab = Instance.new("TextLabel")

    ba.Name = "Espectral - Anti AFK"
    ba.Parent = game.CoreGui
    ba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    ca.Name = "Main"
    ca.Parent = ba
    ca.Active = true
    ca.BackgroundColor3 = Color3.new(0, 0, 0)
    ca.Draggable = true
    ca.Position = UDim2.new(0.7, 0, 0.1, 0)
    ca.Size = UDim2.new(0, 370, 0, 52)
    ca.Font = Enum.Font.SourceSansSemibold
    ca.Text = "Espectral - Anti AFK"
    ca.TextColor3 = Color3.new(0, 191, 255)
    ca.TextSize = 22

    da.Parent = ca
    da.BackgroundColor3 = Color3.new(45, 45, 45)
    da.Position = UDim2.new(0, 0, 1.019, 0)
    da.Size = UDim2.new(0, 370, 0, 107)

    _b.Parent = da
    _b.BackgroundColor3 = Color3.new(0, 0, 0)
    _b.Position = UDim2.new(0, 0, 0.80, 0)
    _b.Size = UDim2.new(0, 370, 0, 21)
    _b.Font = Enum.Font.Arial
    _b.Text = "Espectral - Anti AFK"
    _b.TextColor3 = Color3.new(0, 191, 255)
    _b.TextSize = 20

    ab.Parent = da
    ab.BackgroundColor3 = Color3.new(0, 0, 0)
    ab.Position = UDim2.new(0, 0, 0.158, 0)
    ab.Size = UDim2.new(0, 370, 0, 44)
    ab.Font = Enum.Font.ArialBold
    ab.Text = "Status: Active"
    ab.TextColor3 = Color3.new(0, 191, 255)
    ab.TextSize = 20

    local bb = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
        ab.Text = "Try Again Roblox"
        task.wait(2)
        ab.Text = "Status: Active"
    end)
end)

local darkModeEnabled = false
local originalSettings = {}

misc:AddButton("Dark Mode", function()
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    
    darkModeEnabled = not darkModeEnabled  -- Alterna o estado
    
    if darkModeEnabled then
        -- Salva as configurações originais
        originalSettings = {
            Ambient = l.Ambient,
            Brightness = l.Brightness,
            OutdoorAmbient = l.OutdoorAmbient,
            WaterColor = t.WaterColor,
            WaterTransparency = t.WaterTransparency
        }
        
        -- Aplica o modo escuro
        l.Ambient = Color3.new(0, 0, 0)
        l.Brightness = 0
        l.OutdoorAmbient = Color3.new(0, 0, 0)
        l.GlobalShadows = false
        t.WaterColor = Color3.new(0, 0, 0)
        t.WaterTransparency = 0.7
        
        -- Escurece todas as partes
        for _, v in pairs(w:GetDescendants()) do
            if v:IsA("BasePart") then
                if not originalSettings[v] then
                    originalSettings[v] = {
                        Color = v.Color,
                        Material = v.Material,
                        Reflectance = v.Reflectance
                    }
                end
                v.Color = Color3.new(0, 0, 0)
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            end
        end
        
        print("Modo Escuro Ativado")
    else
        -- Restaura as configurações originais
        l.Ambient = originalSettings.Ambient
        l.Brightness = originalSettings.Brightness
        l.OutdoorAmbient = originalSettings.OutdoorAmbient
        t.WaterColor = originalSettings.WaterColor
        t.WaterTransparency = originalSettings.WaterTransparency
        
        -- Restaura as partes
        for _, v in pairs(w:GetDescendants()) do
            if v:IsA("BasePart") and originalSettings[v] then
                v.Color = originalSettings[v].Color
                v.Material = originalSettings[v].Material
                v.Reflectance = originalSettings[v].Reflectance
            end
        end
        
        print("Modo Escuro Desativado")
    end
end)

local noteTab = window:AddTab("Notes")

noteTab:AddLabel("AGRADEÇO A DEUS POR TUDO EM MINHA VIDA")
noteTab:AddLabel("Obrigado, Senhor, pela minha família, meus amigos, minha saúde,")
noteTab:AddLabel("Minhas conquistas e pelas oportunidades que me dá a cada dia.")
noteTab:AddLabel("Que eu nunca me esqueça de Te honrar e confiar em Teus planos.")
noteTab:AddLabel("Glória a Deus por cada vitória, cada aprendizado e cada momento de paz.")
