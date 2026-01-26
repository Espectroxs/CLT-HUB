-- usa TAB existente do Elerium
local youtube = getgenv().ELERIUM_MISC_TAB
if not youtube then
    warn("TAB do Elerium não encontrada")
    return
end

-- evita carregar duas vezes
if getgenv().YOUTUBE_RAW_LOADED then return end
getgenv().YOUTUBE_RAW_LOADED = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YouTubeUI"
ScreenGui.Parent = player.PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.Enabled = false

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 850, 0, 480)
MainFrame.Position = UDim2.new(0.5, -425, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
MainFrame.BorderSizePixel = 0

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)

-- TopBar
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1,0,0,50)
TopBar.BackgroundColor3 = Color3.fromRGB(32,32,32)
TopBar.BorderSizePixel = 0
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 14)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1,-60,1,0)
Title.Position = UDim2.new(0,15,0,0)
Title.Text = "YouTube"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 26
Title.TextColor3 = Color3.fromRGB(255,0,0)
Title.TextXAlignment = Left
Title.BackgroundTransparency = 1

local Close = Instance.new("TextButton", TopBar)
Close.Size = UDim2.new(0,40,0,40)
Close.Position = UDim2.new(1,-45,0,5)
Close.Text = "✕"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 22
Close.BackgroundTransparency = 1
Close.TextColor3 = Color3.fromRGB(200,200,200)

-- Video
local Video = Instance.new("VideoFrame", MainFrame)
Video.Position = UDim2.new(0,15,0,65)
Video.Size = UDim2.new(0,580,0,380)
Video.Video = "rbxassetid://5608321996"
Video.Looped = true
Video.Volume = 1
Instance.new("UICorner", Video).CornerRadius = UDim.new(0,12)

-- Sidebar
local SideBar = Instance.new("Frame", MainFrame)
SideBar.Position = UDim2.new(0,610,0,65)
SideBar.Size = UDim2.new(0,220,0,380)
SideBar.BackgroundColor3 = Color3.fromRGB(24,24,24)
SideBar.BorderSizePixel = 0
Instance.new("UICorner", SideBar).CornerRadius = UDim.new(0,12)

local videos = {
    {name="Trailer Roblox", id="rbxassetid://131255219223247"},
    {name="Fight UFC", id="rbxassetid://5608368298"},
    {name="Não Beba", id="rbxassetid://5608321996"},
}

for i,v in ipairs(videos) do
    local btn = Instance.new("TextButton", SideBar)
    btn.Size = UDim2.new(1,-10,0,45)
    btn.Position = UDim2.new(0,5,0,(i-1)*50+5)
    btn.Text = v.name
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.BackgroundColor3 = Color3.fromRGB(38,38,38)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

    btn.MouseButton1Click:Connect(function()
        Video.Video = v.id
        Video:Play()
    end)
end

-- animações
local function open()
    ScreenGui.Enabled = true
    Video:Play()
end

local function close()
    Video:Pause()
    ScreenGui.Enabled = false
end

Close.MouseButton1Click:Connect(close)

-- BOTÃO NO ELERIUM (TAB EXISTENTE)
youtube:AddButton("📺 YouTube Videos", function()
    if ScreenGui.Enabled then
        close()
    else
        open()
    end
end)
