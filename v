-- farming.lua
-- Executado quando chamado pelo script principal

return function(window)

    -- ===============================
    -- SERVICES / PLAYER
    -- ===============================
    local Players = game:GetService("Players")
    local Workspace = game:GetService("Workspace")
    local VirtualUser = game:GetService("VirtualUser")

    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local Backpack = LocalPlayer:WaitForChild("Backpack")

    Players.LocalPlayer.CharacterAdded:Connect(function(char)
        Character = char
        Backpack = LocalPlayer:WaitForChild("Backpack")
    end)

    -- ===============================
    -- GLOBAL STATE
    -- ===============================
    getgenv().FarmState = getgenv().FarmState or {
        autoFarm = false,
        selectedRock = nil,
        farmMuscle = false,
        farmJungle = false,
        autoPushups10M = false,
        fastGlitch = {},
        fastGlitchV2 = {}
    }

    -- ===============================
    -- TOOL / PUNCH
    -- ===============================
    local lastEquipAttempt = 0
    local lastPunchFired = 0

    local function gettool()
        if tick() - lastEquipAttempt > 1 then
            if Character and Character:FindFirstChild("Humanoid") then
                if not Character:FindFirstChild("Punch") then
                    for _, tool in ipairs(Backpack:GetChildren()) do
                        if tool.Name == "Punch" then
                            pcall(function()
                                Character.Humanoid:EquipTool(tool)
                            end)
                            break
                        end
                    end
                end
            end
            lastEquipAttempt = tick()
        end

        if tick() - lastPunchFired > 0.0001 then
            pcall(function()
                LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
            end)
            lastPunchFired = tick()
        end
    end

    -- ===============================
    -- UI FARM TAB
    -- ===============================
    local farmPlusTab = window:AddTab("Farm")
    farmPlusTab:Show()

    farmPlusTab:AddLabel("Farmming Rock").Font = Enum.Font.Bangers
    farmPlusTab:AddLabel("Select Rock:")

    -- ===============================
    -- ROCK LIST
    -- ===============================
    local rockList = {
        ["Tiny Island Rock"] = 0,
        ["Starter Island Rock"] = 100,
        ["Golden Rock"] = 5000,
        ["Frost Gym Rock"] = 150000,
        ["Mythical Gym Rock"] = 400000,
        ["Eternal Gym Rock"] = 750000,
        ["Legend Gym Rock"] = 1000000,
        ["Muscle King Gym Rock"] = 5000000,
        ["Ancient Jungle Rock"] = 10000000,
    }

    local dropdown = farmPlusTab:AddDropdown("Espectral Rocks", function(text)
        getgenv().FarmState.selectedRock = text
    end)

    for rockName in pairs(rockList) do
        dropdown:Add(rockName)
    end

    -- ===============================
    -- AUTO ROCK
    -- ===============================
    farmPlusTab:AddSwitch("Auto Rock", function(state)
        getgenv().FarmState.autoFarm = state

        if state then
            task.spawn(function()
                while getgenv().FarmState.autoFarm do
                    task.wait()

                    local rockName = getgenv().FarmState.selectedRock
                    if not rockName then continue end

                    if LocalPlayer.Durability.Value < rockList[rockName] then continue end

                    for _, v in ipairs(Workspace.machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == rockList[rockName] then
                            local rock = v.Parent:FindFirstChild("Rock")
                            local rh = Character:FindFirstChild("RightHand") or Character:FindFirstChild("Right Arm")
                            local lh = Character:FindFirstChild("LeftHand") or Character:FindFirstChild("Left Arm")

                            if rock and rh and lh then
                                firetouchinterest(rock, rh, 0)
                                firetouchinterest(rock, rh, 1)
                                firetouchinterest(rock, lh, 0)
                                firetouchinterest(rock, lh, 1)
                                gettool()
                            end
                        end
                    end
                end
            end)
        end
    end)

    -- ===============================
    -- AUTO TOOLS
    -- ===============================
    farmPlusTab:AddLabel("Auto Training").Font = Enum.Font.Bangers
    farmPlusTab:AddLabel("Select Tools:")

    local SelectedTool = nil
    local AutoTools = false

    local toolDropdown = farmPlusTab:AddDropdown("Select Tools", function(sel)
        SelectedTool = sel
    end)

    toolDropdown:Add("Weight")
    toolDropdown:Add("Pushups")
    toolDropdown:Add("Situps")
    toolDropdown:Add("Handstands")
    toolDropdown:Add("Fast Punch")

    farmPlusTab:AddSwitch("Auto Tools", function(state)
        AutoTools = state

        if state then
            task.spawn(function()
                while AutoTools do
                    task.wait()

                    if not SelectedTool then continue end

                    if SelectedTool == "Fast Punch" then
                        gettool()
                        continue
                    end

                    local tool = Backpack:FindFirstChild(SelectedTool)
                        or Character:FindFirstChild(SelectedTool)

                    if tool and Character:FindFirstChild("Humanoid") then
                        Character.Humanoid:EquipTool(tool)
                        LocalPlayer.muscleEvent:FireServer("rep")
                    end
                end
            end)
        end
    end)

    -- ===============================
    -- FAST GLITCH
    -- ===============================
    farmPlusTab:AddLabel("Fast Glitch").Font = Enum.Font.Bangers

    local FastGlitchFolder = farmPlusTab:AddFolder("    Fast Glitch")

    local rockData = {
        {Name="Tiny Island Rock",Durability=0},
        {Name="Punching Rock",Durability=10},
        {Name="Large Island Rock",Durability=100},
        {Name="Golden Rock",Durability=5000},
        {Name="Frost Gym Rock",Durability=150000},
        {Name="Mythical Gym Rock",Durability=400000},
        {Name="Inferno Gym Rock",Durability=750000},
        {Name="Legend Gym Rock",Durability=1000000},
        {Name="Muscle King Gym Rock",Durability=5000000},
        {Name="Ancient Jungle Rock",Durability=10000000},
    }

    for _, rock in ipairs(rockData) do
        FastGlitchFolder:AddSwitch(rock.Name, function(state)
            getgenv().FarmState.fastGlitch[rock.Durability] = state

            if state then
                task.spawn(function()
                    while getgenv().FarmState.fastGlitch[rock.Durability] do
                        task.wait()

                        if LocalPlayer.Durability.Value < rock.Durability then continue end

                        for _, v in ipairs(Workspace.machinesFolder:GetDescendants()) do
                            if v.Name == "neededDurability" and v.Value == rock.Durability then
                                local rockPart = v.Parent:FindFirstChild("Rock")
                                local hand = Character:FindFirstChild("RightHand")
                                if rockPart and hand then
                                    firetouchinterest(rockPart, hand, 0)
                                    firetouchinterest(rockPart, hand, 1)
                                    gettool()
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end

end
