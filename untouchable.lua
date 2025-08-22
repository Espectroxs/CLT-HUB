local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library", true))()

-- Criação da janela principal
local window = library:AddWindow("Espectral - Paid Version Finnaly", {
    main_color = Color3.fromRGB(255, 0, 0),
    min_size = Vector2.new(600, 400),
    can_resize = false,
})

local main = window:AddTab("Main")

main:AddSwitch("NoClip", function(state)
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

local bug = window:AddTab("Glitch")
bug:Show()

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local autoSoco = false
local fastPunch = false
local socosPorFrame = 30
local fastPunchConnection

local rockCFrames = {
    ["Tiny Rock"] = CFrame.new(10.40, 5.88, 2097.69),
    ["Punching Rock"] = CFrame.new(-167.17, 5.19, 422.81),
    ["Large Rock"] = CFrame.new(180.37, 5.19, -145.04),
    ["Golden Rock"] = CFrame.new(286.32, 5.19, -573.00),
    ["Frozen Rock"] = CFrame.new(-2588.86, 5.19, -230.34),
    ["Mystic Rock"] = CFrame.new(2214.32, 5.19, 1218.25),
    ["Inferno Rock"] = CFrame.new(-7227.37, 5.41, -1273.85),
    ["Rock Of Legends"] = CFrame.new(4188.90, 989.70, -4068.73),
    ["Muscle King Rock"] = CFrame.new(-9038.01, 7.06, -6065.93),
    ["Ancient Jungle Rock"] = CFrame.new(-7699.73, 4.67, 2889.65),
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

bug:AddSwitch("Punch Rock", function(state)
    autoSocarPedra = state
    task.spawn(function()
        while autoSocarPedra do
            wait()
            if selectedRock and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = LocalPlayer.Character.HumanoidRootPart

                -- Posiciona o jogador perto da pedra (pode ajustar o offset)
                hrp.CFrame = CFrame.new(selectedRock.cframe.Position - hrp.CFrame.LookVector * 1)

                -- Por este código corrigido:
                local targetPosition = selectedRock.cframe.Position
                local lookAtCFrame = CFrame.new(hrp.Position, Vector3.new(targetPosition.X, hrp.Position.Y, targetPosition.Z))
                hrp.CFrame = lookAtCFrame

                -- Ativa o soco
                local tool = LocalPlayer.Character:FindFirstChild("Punch") or LocalPlayer.Backpack:FindFirstChild("Punch")
                if tool then
                    tool.Parent = LocalPlayer.Backpack           
                    tool.Parent = LocalPlayer.Character           
                    for i = 1, 10 do tool:Activate();
end
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

local TrainingTab = window:AddTab("Training")

-- Variáveis para controlar os loops
local handstandsActive = false
local situpsActive = false
local pushupsActive = false
local weightActive = false

-- Função para equipar/desequipar ferramentas
local function manageTool(toolName, shouldEquip)
    local backpack = game.Players.LocalPlayer.Backpack
    local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    
    if shouldEquip then
        for _, tool in pairs(backpack:GetChildren()) do
            if tool:IsA("Tool") and tool.Name == toolName then
                tool.Parent = character
            end
        end
    else
        for _, tool in pairs(character:GetChildren()) do
            if tool:IsA("Tool") and tool.Name == toolName then
                tool.Parent = backpack
            end
        end
    end
end

-- Handstands Switch
local handstandsSwitch = TrainingTab:AddSwitch("Auto Handstands", function(state)
    handstandsActive = state
    manageTool("Handstands", state)
    
    while handstandsActive do
        local args = { [1] = "rep" }
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(args))
        task.wait()
    end
    
    manageTool("Handstands", false)
end)
handstandsSwitch:Set(false)

-- Situps Switch
local situpsSwitch = TrainingTab:AddSwitch("Auto Situps", function(state)
    situpsActive = state
    manageTool("Situps", state)
    
    while situpsActive do
        local args = { [1] = "rep" }
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(args))
        task.wait()
    end
    
    manageTool("Situps", false)
end)
situpsSwitch:Set(false)

-- Pushups Switch
local pushupsSwitch = TrainingTab:AddSwitch("Auto Pushups", function(state)
    pushupsActive = state
    manageTool("Pushups", state)
    
    while pushupsActive do
        local args = { [1] = "rep" }
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(args))
        task.wait()
    end
    
    manageTool("Pushups", false)
end)
pushupsSwitch:Set(false)

-- Weight Switch
local weightSwitch = TrainingTab:AddSwitch("Auto Weight", function(state)
    weightActive = state
    manageTool("Weight", state)
    
    while weightActive do
        local args = { [1] = "rep" }
        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack(args))
        task.wait()
    end
    
    manageTool("Weight", false)
end)
weightSwitch:Set(false)

-- Variável para controlar o Fast Tools
local fastToolsActive = false

-- Função para acelerar as ferramentas
local function accelerateTools()
    while fastToolsActive do
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        
        -- Verificar todas as ferramentas no personagem
        for _, tool in pairs(character:GetChildren()) do
            if tool:IsA("Tool") then
                -- Técnica de reequipar para acelerar
                tool.Parent = LocalPlayer.Backpack
                tool.Parent = character
                
                -- Ativar rapidamente
                for i = 1, 10 do
                    if not fastToolsActive then break end
                    tool:Activate()
                    task.wait()
                end
            end
        end
        
        task.wait(0) -- Pequeno delay para evitar crash
    end
end

-- Fast Tools Switch
local fastToolsSwitch = TrainingTab:AddSwitch("Fast Tools", function(state)
    fastToolsActive = state
    if state then
        -- Iniciar o loop de aceleração
        coroutine.wrap(accelerateTools)()
    end
end)
fastToolsSwitch:Set(false)

local TeleportTab = window:AddTab("Teleport")

local teleportLocations = {
    {"Beach", CFrame.new(6.11, 5.24, 168.93)},
    {"Tiny Island", CFrame.new(-31.37, 5.39, 1929.17)},
    {"Frost Gym", CFrame.new(-2669.84, 5.24, -423.79)},
    {"Eternal Gym", CFrame.new(-6887.54, 5.24, -1284.66)},
    {"Legends Gym", CFrame.new(4603.28, 989.42, -3897.87)},
    {"Mythical Gym", CFrame.new(2250.78, 5.24, 1073.23)},
    {"Muscle King", CFrame.new(-8625.93, 15.09, -5730.47)},
    {"Jungle", CFrame.new(-8047.21, 4.67, 2572.06)},
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

local toggle = rebirthTab:AddSwitch("Auto Rebirth", function(State)
    dragons = State
    while dragons do
        wait(0.1)
        local args = { [1] = "rebirthRequest" }
        game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer(unpack(args))
    end
end)
toggle:Set(false) -- Default state set to false

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
rebirthTab:AddSwitch("Safe Area", function(enabled)
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
    _b.Text = "Espectral - Anti AFK"
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