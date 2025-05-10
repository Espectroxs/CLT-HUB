local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library", true))()

-- Criação da janela principal
local window = library:AddWindow("CLT HUB - Paid Version Finnaly", {
    main_color = Color3.fromRGB(0, 0, 0),
    min_size = Vector2.new(600, 450),
    can_resize = false,
})

local bug = window:AddTab("Bug")
bug:Show()

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local autoSoco = false
local fastPunch = false
local socosPorFrame = 30
local fastPunchConnection

local rockCFrames = {
   ["Frozen Rock"] = CFrame.new(-2556.88, 7.52, -257.55),
   ["Mystic Rock"] = CFrame.new(2206.99, 7.52, 1239.63),
   ["Rock Of Legends"] = CFrame.new(4145.30, 991.72, -4061.83),
   ["Inferno Rock"] = CFrame.new(-7272.95, 7.52, -1261.09),
   ["Punching Rock"] = CFrame.new(-147.49, 7.52, 421.69),
   ["Large Rock"] = CFrame.new(169.09, 7.52, -152.19),
   ["Golden Rock"] = CFrame.new(343.072723, 5.18950558, -588.691895, -0.0388103835, 8.80850166e-08, 0.999246597, -4.4545466e-08, 1, -8.988156e-08, -0.999246597, -4.8000242e-08, -0.0388103835),
   ["Ancient Jungle Rock"] = CFrame.new(-7644.70, 7.00, 2869.31),
   ["Muscle King Rock"] = CFrame.new(-8970.56, 17.42, -6035.80),
   ["Tiny Rock"] = CFrame.new(16.73, -0.97, 2102.54),
}

local teleportarParaPedra = false
local socarPedra = false
local selectedRock = nil

-- Switch para selecionar a pedra
for name, cframe in pairs(rockCFrames) do
    bug:AddSwitch(" " .. name, function(enabled)
        if enabled then
            selectedRock = { name = name, cframe = cframe }
            print("Pedra selecionada:", name)
        end
    end)
end

local autoSocarPedra = false

bug:AddSwitch("Auto Punch", function(state)
    autoSocarPedra = state
    task.spawn(function()
        while autoSocarPedra do
            wait(0)
            if selectedRock and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = LocalPlayer.Character.HumanoidRootPart

                -- Posiciona o jogador perto da pedra (pode ajustar o offset)
                hrp.CFrame = CFrame.new(selectedRock.cframe.Position - hrp.CFrame.LookVector * 1)

                -- Faz o personagem olhar para a pedra
                hrp.CFrame = CFrame.new(hrp.Position, selectedRock.cframe.Position) 

                -- Ativa o soco
                local tool = LocalPlayer.Character:FindFirstChild("Punch") or LocalPlayer.Backpack:FindFirstChild("Punch")
                if tool then
                    tool.Parent = LocalPlayer.Character
                    tool:Activate()
                end
            end
        end
    end)
end)

bug:AddSwitch("Lock Position", function(state)
    lockPositionEnabled = state

    if state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
  
        lockedPosition = LocalPlayer.Character.HumanoidRootPart.Position

        lockPositionConnection = RunService.Heartbeat:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.zero
                LocalPlayer.Character:MoveTo(lockedPosition)
            end
        end)
    else
        -- Desativa o travamento
        if lockPositionConnection then
            lockPositionConnection:Disconnect()
            lockPositionConnection = nil
        end
    end
end)

local glitch = window:AddTab("Glitch")

local switch = glitch:AddSwitch("Auto Soco", function(state)
    autoSoco = state
    task.spawn(function()
        while autoSoco do
            wait(0)

            local player = game.Players.LocalPlayer
            local tool = player.Character and player.Character:FindFirstChild("Punch") or player.Backpack:FindFirstChild("Punch")

            if tool then
                tool.Parent = player.Character
                wait(0)
                tool:Activate()
            end
        end
    end)
end)

local RunService = game:GetService("RunService")

local fastPunchConnection
local socosPorFrame = 30 

local fastSwitch = glitch:AddSwitch("Fast Punch", function(state)
    fastPunch = state

    if fastPunch then
        fastPunchConnection = RunService.RenderStepped:Connect(function()
            local player = game.Players.LocalPlayer
            local tool = player.Character and player.Character:FindFirstChild("Punch") or player.Backpack:FindFirstChild("Punch")

            if tool then
                tool.Parent = player.Character
                for i = 30, socosPorFrame do
                    tool:Activate()
                end
            end
        end)
    else
        if fastPunchConnection then
            fastPunchConnection:Disconnect()
            fastPunchConnection = nil
        end
    end
end)

glitch:AddButton("Boost", function()
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
        elseif v:IsA("Decal") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
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

glitch:AddButton("Ativar Anti-AFK", function()
    task.wait(0.5)

    local ba = Instance.new("ScreenGui")
    local ca = Instance.new("TextLabel")
    local da = Instance.new("Frame")
    local _b = Instance.new("TextLabel")
    local ab = Instance.new("TextLabel")

    ba.Name = "CLT HUB - Anti AFK"
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
    ca.Text = "CLT HUB - Anti AFK"
    ca.TextColor3 = Color3.new(255, 255, 255)
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
    _b.Text = "CLT HUB - Anti AFK"
    _b.TextColor3 = Color3.new(255, 255, 255)
    _b.TextSize = 20

    ab.Parent = da
    ab.BackgroundColor3 = Color3.new(0, 0, 0)
    ab.Position = UDim2.new(0, 0, 0.158, 0)
    ab.Size = UDim2.new(0, 370, 0, 44)
    ab.Font = Enum.Font.ArialBold
    ab.Text = "Status: Active"
    ab.TextColor3 = Color3.new(255, 255, 255)
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

glitch:AddSwitch("NoClip", function(state)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer

    local noclip = state  -- A variável noclip recebe o valor do switch (true ou false)

    -- Mantém o estado NoClip ativado ou desativado
    RunService.Stepped:Connect(function()
        if noclip and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
            LocalPlayer.Character.Humanoid:ChangeState(11)
        else
            -- Quando desativado, restaura a colisão das partes
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end)
end)

local TrainingTab = window:AddTab("Training")

local autoTrain = {}

local function startTraining(toolName)
    task.spawn(function()
        while autoTrain[toolName] do
            task.wait(0)
            for _, tool in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if tool:IsA("Tool") and tool.Name == toolName then
                    tool.Parent = game.Players.LocalPlayer.Character
                end
            end
            game.Players.LocalPlayer.muscleEvent:FireServer("rep")
        end
    end)
end

for _, tool in ipairs({ "Situps", "Pushups", "Handstands", "Weight" }) do
    autoTrain[tool] = false
    TrainingTab:AddSwitch(tool, function(state)
        autoTrain[tool] = state
        if state then
            startTraining(tool)
        end
    end)
end

local TeleportTab = window:AddTab("Teleport")

local teleportLocations = {
    {"Legends Gym", CFrame.new(4298.6, 1121.89, -3898.68)},
    {"Mythical Gym", CFrame.new(2386.89, 139.60, 1094.26)},
    {"Frost Gym", CFrame.new(-2752.56, 125.82, -386.73)},
    {"Eternal Gym", CFrame.new(-6917.79, 182.35, -1336.63)},
    {"Tiny Island", CFrame.new(-4.25, 220.99, 1963.60)},
    {"Brawl 1", CFrame.new(985.91, 163.79, -7037.80)},
    {"Brawl 2", CFrame.new(4466.75, 334.97, -8425.74)},
    {"Brawl 3", CFrame.new(-1901.87, 251.89, -5899.64)},
    {"Secret Area", CFrame.new(1947, -0.281700373, 6191, 1, 8.32729867e-08, 6.46744824e-14, -8.32729867e-08, 1, 2.28852119e-08, -6.27687599e-14, -2.28852119e-08, 1)},
}

for _, location in ipairs(teleportLocations) do
    local nome, destino = unpack(location)
    TeleportTab:AddButton(nome, function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = destino
        end
    end)
end

local rebirthTab = window:AddTab("Rebirths")

local autoRebirth = false
local desiredSize = 1
local fixarTamanhoAtivo = false
local lockedPosition = nil
local isLocked = false

local loopWeight = false
rebirthTab:AddSwitch("Auto Weight", function(state)
    loopWeight = state

    task.spawn(function()
        while loopWeight do
            task.wait(0)
            local player = game.Players.LocalPlayer
            for _, tool in ipairs(player.Backpack:GetChildren()) do
                if tool:IsA("Tool") and tool.Name == "Weight" then
                    tool.Parent = player.Character
                end
            end
            player.muscleEvent:FireServer("rep")
        end
    end)
end)

local switchRebirth = rebirthTab:AddSwitch("Auto Rebirth", function(state)
    autoRebirth = state
    task.spawn(function()
        while autoRebirth do
            game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            task.wait(0)
        end
    end)
end)
switchRebirth:Set(false)

local input = rebirthTab:AddDropdown("Size", function(value)
    local num = tonumber(value)
    if num then
        desiredSize = num
        window:Notify("Tamanho Atualizado", "Novo tamanho: " .. num)
    end
end)

for i = 1, 10 do
    input:Add(tostring(i))
end

rebirthTab:AddButton("Apply", function()
    game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", desiredSize)
end)

local switchFixar = rebirthTab:AddSwitch("Auto Size", function(state)
    fixarTamanhoAtivo = state
    if state then
        window:Notify("Auto Size", "Tamanho será fixado mesmo após a morte.")
    end
end)
switchFixar:Set(false)

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0)
    if fixarTamanhoAtivo and desiredSize then
        game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", desiredSize)
    end
end)

local loopClone = false
rebirthTab:AddSwitch("Muscle King", function(enabled)
    loopClone = enabled

    task.spawn(function()
        while loopClone do
            local player = game.Players.LocalPlayer
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("LowerTorso") and char.LowerTorso:FindFirstChild("Root") then
                local savePos = char.HumanoidRootPart.CFrame

                char.HumanoidRootPart.CFrame = CFrame.new(-8745.36816, 124.095375, -5863.38086, 0.96320647, 5.7537477e-08, -0.268762559, -4.33853558e-08, 1, 5.85960471e-08, 0.268762559, -4.47797319e-08, 0.96320647)
                wait(0.0001)

                local clone = char.LowerTorso.Root:Clone()
                char.LowerTorso.Root:Destroy()
                clone.Parent = char.LowerTorso

                wait(2)
                char.HumanoidRootPart.CFrame = savePos
            end
            wait(0)
        end
    end)
end)

local loopClone = false
rebirthTab:AddSwitch("Safe Área", function(enabled)
    loopClone = enabled

    task.spawn(function()
        while loopClone do
            local player = game.Players.LocalPlayer
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("LowerTorso") and char.LowerTorso:FindFirstChild("Root") then
                local savePos = char.HumanoidRootPart.CFrame

                char.HumanoidRootPart.CFrame = CFrame.new(915.095, 37.527, 349.809)
                wait(0.0001)

                local clone = char.LowerTorso.Root:Clone()
                char.LowerTorso.Root:Destroy()
                clone.Parent = char.LowerTorso

                wait(2)
                char.HumanoidRootPart.CFrame = savePos
            end
            wait(0)
        end
    end)
end)