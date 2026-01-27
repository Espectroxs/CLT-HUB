--// YouTube Floating UI - RAW
--// Funciona via loadstring + HttpGet
--// Compatível com executores (CoreGui)

-- Proteção contra duplicar
local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("YouTubeUI") then
    CoreGui.YouTubeUI:Destroy()
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YouTubeUI"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- Main Frame
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 850, 0, 480)
MainFrame.Position = UDim2.new(0.5, -425, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 1

-- Rounded corners
local function round(ui, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r)
    c.Parent = ui
end

round(MainFrame, 14)

-- Top Bar
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1,0,0,50)
TopBar.BackgroundColor3 = Color3.fromRGB(32,32,32)
TopBar.BorderSizePixel = 0
round(TopBar, 14)

-- Title
local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(0,300,1,0)
Title.Position = UDim2.new(0,15,0,0)
Title.Text = "YouTube"
Title.TextColor3 = Color3.fromRGB(255,0,0)
Title.TextSize = 28
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1

-- Close Button
local Close = Instance.new("TextButton", TopBar)
Close.Size = UDim2.new(0,40,0,40)
Close.Position = UDim2.new(1,-50,0,5)
Close.Text = "✕"
Close.TextSize = 24
Close.Font = Enum.Font.GothamBold
Close.TextColor3 = Color3.fromRGB(200,200,200)
Close.BackgroundTransparency = 1

-- Video Frame
local Video = Instance.new("VideoFrame", MainFrame)
Video.Position = UDim2.new(0,15,0,65)
Video.Size = UDim2.new(0,580,0,380)
Video.Looped = true
Video.Volume = 1
Video.Video = "rbxassetid://5608410985"
round(Video, 12)

-- Sidebar
local SideBar = Instance.new("Frame", MainFrame)
SideBar.Position = UDim2.new(0,610,0,65)
SideBar.Size = UDim2.new(0,220,0,380)
SideBar.BackgroundColor3 = Color3.fromRGB(24,24,24)
SideBar.BorderSizePixel = 0
round(SideBar, 12)

-- Video List
local videos = {
    {name = "Trailer Roblox", id = "rbxassetid://131255219223247"},
    {name = "Fight UFC", id = "rbxassetid://5608368298"},
    {name = "Não Beba", id = "rbxassetid://5608321996"},
}

for i,v in ipairs(videos) do
    local btn = Instance.new("TextButton", SideBar)
    btn.Size = UDim2.new(1,-10,0,45)
    btn.Position = UDim2.new(0,5,0,(i-1)*50+5)
    btn.Text = v.name
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.TextWrapped = true
    btn.BackgroundColor3 = Color3.fromRGB(38,38,38)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BorderSizePixel = 0
    round(btn, 8)

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(55,55,55)
        }):Play()
    end)

    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(38,38,38)
        }):Play()
    end)

    btn.MouseButton1Click:Connect(function()
        Video.Video = v.id
        Video:Play()
    end)
end

-- Open Animation
local originalPos = MainFrame.Position

local function openUI()
    MainFrame.Visible = true
    TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Quint), {
        BackgroundTransparency = 0,
        Position = originalPos
    }):Play()
    Video:Play()
end

-- Close Animation
local function closeUI()
    Video:Pause()
    TweenService:Create(MainFrame, TweenInfo.new(0.25), {
        BackgroundTransparency = 1
    }):Play()
    task.delay(0.25, function()
        ScreenGui:Destroy()
    end)
end

-- Drag System
do
    local dragging, dragStart, startPos

    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

Close.MouseButton1Click:Connect(closeUI)

-- Start
openUI()

print("YouTube UI carregada com sucesso")
