-- SWILL FINAL EDITION - сдержанно, но сочно. Все текста кнопок БЕЛЫЕ.
-- Fling System v3 by milkaqyyy

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

pcall(function()
    for _, gui in pairs(game:GetService("CoreGui"):GetChildren()) do
        if gui.Name == "FlingGUI" then
            gui:Destroy()
        end
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FlingGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

-- ============ ОСНОВНОЙ ФРЕЙМ ============
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 730)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -380)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Blur = Instance.new("BlurEffect")
Blur.Size = 14
Blur.Parent = MainFrame

local Shadow = Instance.new("Frame")
Shadow.Size = UDim2.new(1, 0, 1, 0)
Shadow.Position = UDim2.new(0, 0, 0, 0)
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.7
Shadow.BorderSizePixel = 0
Shadow.ZIndex = -1
Shadow.Parent = MainFrame

local ShadowCorner = Instance.new("UICorner")
ShadowCorner.CornerRadius = UDim.new(0, 18)
ShadowCorner.Parent = Shadow

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 18)
MainCorner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 1
Stroke.Color = Color3.fromRGB(60, 60, 65)
Stroke.Transparency = 0.4
Stroke.Parent = MainFrame

-- TITLE BAR
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
TitleBar.BackgroundTransparency = 0.1
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 18)
TitleCorner.Parent = TitleBar

-- FLING SYSTEM - КРАСНЫЙ
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -70, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "FLING SYSTEM"
TitleLabel.TextColor3 = Color3.fromRGB(220, 40, 40)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 22
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

-- Автор - ПЕПЕЛЬНЫЙ
local AuthorLabel = Instance.new("TextLabel")
AuthorLabel.Size = UDim2.new(1, -70, 0, 15)
AuthorLabel.Position = UDim2.new(0, 16, 1, -18)
AuthorLabel.BackgroundTransparency = 1
AuthorLabel.Text = "by milkaqyyy"
AuthorLabel.TextColor3 = Color3.fromRGB(170, 170, 190)
AuthorLabel.Font = Enum.Font.Gotham
AuthorLabel.TextSize = 10
AuthorLabel.TextXAlignment = Enum.TextXAlignment.Left
AuthorLabel.Parent = TitleBar

-- Collapse Button - ТЕКСТ БЕЛЫЙ
local CollapseButton = Instance.new("TextButton")
CollapseButton.Position = UDim2.new(1, -65, 0, 12)
CollapseButton.Size = UDim2.new(0, 26, 0, 26)
CollapseButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
CollapseButton.BackgroundTransparency = 0.2
CollapseButton.BorderSizePixel = 0
CollapseButton.Text = "▼"
CollapseButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- БЕЛЫЙ
CollapseButton.Font = Enum.Font.GothamBold
CollapseButton.TextSize = 18
CollapseButton.Parent = TitleBar

local CollapseCorner = Instance.new("UICorner")
CollapseCorner.CornerRadius = UDim.new(1, 0)
CollapseCorner.Parent = CollapseButton

-- Close Button - ТЕКСТ БЕЛЫЙ
local CloseButton = Instance.new("TextButton")
CloseButton.Position = UDim2.new(1, -35, 0, 12)
CloseButton.Size = UDim2.new(0, 26, 0, 26)
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
CloseButton.BackgroundTransparency = 0.2
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- БЕЛЫЙ
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

local function AddDarkenHover(button, darkColor, normalColor, darkTrans, normalTrans)
    normalColor = normalColor or button.BackgroundColor3
    normalTrans = normalTrans or button.BackgroundTransparency
    darkTrans = darkTrans or (normalTrans + 0.2)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = darkColor,
            BackgroundTransparency = darkTrans
        }):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = normalColor,
            BackgroundTransparency = normalTrans
        }):Play()
    end)
end

local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, 0, 1, -50)
ContentContainer.Position = UDim2.new(0, 0, 0, 50)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

-- СТАТУС - ЭЛЕКТРИК СИНИЙ
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Position = UDim2.new(0, 15, 0, 5)
StatusLabel.Size = UDim2.new(1, -30, 0, 25)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Select targets"
StatusLabel.TextColor3 = Color3.fromRGB(80, 180, 255)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextSize = 14
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = ContentContainer

-- POWER LABEL - ОГНЕННЫЙ
local PowerLabel = Instance.new("TextLabel")
PowerLabel.Position = UDim2.new(0, 15, 0, 38)
PowerLabel.Size = UDim2.new(0, 80, 0, 25)
PowerLabel.BackgroundTransparency = 1
PowerLabel.Text = "⚡ POWER:"
PowerLabel.TextColor3 = Color3.fromRGB(255, 100, 40)
PowerLabel.Font = Enum.Font.GothamBold
PowerLabel.TextSize = 12
PowerLabel.TextXAlignment = Enum.TextXAlignment.Left
PowerLabel.Parent = ContentContainer

-- POWER VALUE - ЯНТАРНЫЙ
local PowerValue = Instance.new("TextLabel")
PowerValue.Position = UDim2.new(1, -55, 0, 38)
PowerValue.Size = UDim2.new(0, 45, 0, 25)
PowerValue.BackgroundTransparency = 1
PowerValue.Text = "100%"
PowerValue.TextColor3 = Color3.fromRGB(255, 160, 60)
PowerValue.Font = Enum.Font.GothamBold
PowerValue.TextSize = 12
PowerValue.TextXAlignment = Enum.TextXAlignment.Right
PowerValue.Parent = ContentContainer

local PowerSlider = Instance.new("Frame")
PowerSlider.Position = UDim2.new(0, 100, 0, 43)
PowerSlider.Size = UDim2.new(1, -165, 0, 15)
PowerSlider.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
PowerSlider.BackgroundTransparency = 0.3
PowerSlider.BorderSizePixel = 0
PowerSlider.Parent = ContentContainer

local PowerSliderCorner = Instance.new("UICorner")
PowerSliderCorner.CornerRadius = UDim.new(1, 0)
PowerSliderCorner.Parent = PowerSlider

local PowerFill = Instance.new("Frame")
PowerFill.Size = UDim2.new(1, 0, 1, 0)
PowerFill.BackgroundColor3 = Color3.fromRGB(255, 100, 40)
PowerFill.BackgroundTransparency = 0.2
PowerFill.BorderSizePixel = 0
PowerFill.Parent = PowerSlider

local PowerFillCorner = Instance.new("UICorner")
PowerFillCorner.CornerRadius = UDim.new(1, 0)
PowerFillCorner.Parent = PowerFill

local PowerButton = Instance.new("TextButton")
PowerButton.Size = UDim2.new(0, 20, 1, 0)
PowerButton.Position = UDim2.new(1, -10, 0, 0)
PowerButton.BackgroundColor3 = Color3.fromRGB(255, 140, 80)
PowerButton.BackgroundTransparency = 0.1
PowerButton.BorderSizePixel = 0
PowerButton.Text = ""
PowerButton.Parent = PowerSlider

local PowerButtonCorner = Instance.new("UICorner")
PowerButtonCorner.CornerRadius = UDim.new(1, 0)
PowerButtonCorner.Parent = PowerButton

-- ANTI-FLING LABEL - ЗОЛОТОЙ
local ModeLabel = Instance.new("TextLabel")
ModeLabel.Position = UDim2.new(0, 15, 0, 72)
ModeLabel.Size = UDim2.new(0, 100, 0, 20)
ModeLabel.BackgroundTransparency = 1
ModeLabel.Text = "ANTI-FLING:"
ModeLabel.TextColor3 = Color3.fromRGB(255, 200, 70)
ModeLabel.Font = Enum.Font.GothamBold
ModeLabel.TextSize = 12
ModeLabel.TextXAlignment = Enum.TextXAlignment.Left
ModeLabel.Parent = ContentContainer

-- MODE 1 / MODE 2 - текст БЕЛЫЙ (кнопки)
local Mode1Button = Instance.new("TextButton")
Mode1Button.Position = UDim2.new(0, 12, 0, 95)
Mode1Button.Size = UDim2.new(0.48, -6, 0, 32)
Mode1Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
Mode1Button.BackgroundTransparency = 0.2
Mode1Button.BorderSizePixel = 0
Mode1Button.Text = "🛡️ MODE 1"
Mode1Button.TextColor3 = Color3.fromRGB(255, 255, 255) -- БЕЛЫЙ
Mode1Button.Font = Enum.Font.GothamBold
Mode1Button.TextSize = 12
Mode1Button.Parent = ContentContainer

local Mode1Corner = Instance.new("UICorner")
Mode1Corner.CornerRadius = UDim.new(0, 8)
Mode1Corner.Parent = Mode1Button

local Mode2Button = Instance.new("TextButton")
Mode2Button.Position = UDim2.new(0.52, 0, 0, 95)
Mode2Button.Size = UDim2.new(0.48, -6, 0, 32)
Mode2Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
Mode2Button.BackgroundTransparency = 0.2
Mode2Button.BorderSizePixel = 0
Mode2Button.Text = "🔰 MODE 2"
Mode2Button.TextColor3 = Color3.fromRGB(255, 255, 255) -- БЕЛЫЙ
Mode2Button.Font = Enum.Font.GothamBold
Mode2Button.TextSize = 12
Mode2Button.Parent = ContentContainer

local Mode2Corner = Instance.new("UICorner")
Mode2Corner.CornerRadius = UDim.new(0, 8)
Mode2Corner.Parent = Mode2Button

-- AntiFlingStatus - НЕ ТРОГАЕМ
local AntiFlingStatus = Instance.new("TextLabel")
AntiFlingStatus.Position = UDim2.new(0, 15, 0, 132)
AntiFlingStatus.Size = UDim2.new(0.5, -10, 0, 18)
AntiFlingStatus.BackgroundTransparency = 1
AntiFlingStatus.Text = "Mode 1: Active"
AntiFlingStatus.TextColor3 = Color3.fromRGB(120, 220, 120)
AntiFlingStatus.Font = Enum.Font.Gotham
AntiFlingStatus.TextSize = 11
AntiFlingStatus.TextXAlignment = Enum.TextXAlignment.Left
AntiFlingStatus.Parent = ContentContainer

-- СПИСОК ИГРОКОВ
local ListFrame = Instance.new("Frame")
ListFrame.Position = UDim2.new(0, 12, 0, 158)
ListFrame.Size = UDim2.new(1, -24, 0, 370)
ListFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
ListFrame.BackgroundTransparency = 0.3
ListFrame.BorderSizePixel = 0
ListFrame.Parent = ContentContainer

local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 12)
ListCorner.Parent = ListFrame

local ListStroke = Instance.new("UIStroke")
ListStroke.Thickness = 1
ListStroke.Color = Color3.fromRGB(60, 60, 65)
ListStroke.Transparency = 0.4
ListStroke.Parent = ListFrame

local PlayerScroll = Instance.new("ScrollingFrame")
PlayerScroll.Position = UDim2.new(0, 6, 0, 6)
PlayerScroll.Size = UDim2.new(1, -12, 1, -12)
PlayerScroll.BackgroundTransparency = 1
PlayerScroll.BorderSizePixel = 0
PlayerScroll.ScrollBarThickness = 4
PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerScroll.Parent = ListFrame

-- START BUTTON - текст БЕЛЫЙ
local StartButton = Instance.new("TextButton")
StartButton.Position = UDim2.new(0, 12, 0, 540)
StartButton.Size = UDim2.new(0.48, -6, 0, 38)
StartButton.BackgroundColor3 = Color3.fromRGB(45, 75, 55)
StartButton.BackgroundTransparency = 0.2
StartButton.BorderSizePixel = 0
StartButton.Text = "🔥 START FLING"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- БЕЛЫЙ
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 14
StartButton.Parent = ContentContainer

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 10)
StartCorner.Parent = StartButton

-- STOP BUTTON - текст БЕЛЫЙ
local StopButton = Instance.new("TextButton")
StopButton.Position = UDim2.new(0.52, 0, 0, 540)
StopButton.Size = UDim2.new(0.48, -6, 0, 38)
StopButton.BackgroundColor3 = Color3.fromRGB(130, 55, 55)
StopButton.BackgroundTransparency = 0.2
StopButton.BorderSizePixel = 0
StopButton.Text = "🛑 STOP FLING"
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- БЕЛЫЙ
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 14
StopButton.Parent = ContentContainer

local StopCorner = Instance.new("UICorner")
StopCorner.CornerRadius = UDim.new(0, 10)
StopCorner.Parent = StopButton

-- SELECT ALL - текст БЕЛЫЙ
local SelectAllBtn = Instance.new("TextButton")
SelectAllBtn.Position = UDim2.new(0, 12, 0, 585)
SelectAllBtn.Size = UDim2.new(0.48, -6, 0, 32)
SelectAllBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
SelectAllBtn.BackgroundTransparency = 0.3
SelectAllBtn.BorderSizePixel = 0
SelectAllBtn.Text = "✅ SELECT ALL"
SelectAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255) -- БЕЛЫЙ
SelectAllBtn.Font = Enum.Font.GothamBold
SelectAllBtn.TextSize = 12
SelectAllBtn.Parent = ContentContainer

local SelectAllCorner = Instance.new("UICorner")
SelectAllCorner.CornerRadius = UDim.new(0, 8)
SelectAllCorner.Parent = SelectAllBtn

-- DESELECT ALL - текст БЕЛЫЙ
local DeselectAllBtn = Instance.new("TextButton")
DeselectAllBtn.Position = UDim2.new(0.52, 0, 0, 585)
DeselectAllBtn.Size = UDim2.new(0.48, -6, 0, 32)
DeselectAllBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
DeselectAllBtn.BackgroundTransparency = 0.3
DeselectAllBtn.BorderSizePixel = 0
DeselectAllBtn.Text = "❌ DESELECT ALL"
DeselectAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255) -- БЕЛЫЙ
DeselectAllBtn.Font = Enum.Font.GothamBold
DeselectAllBtn.TextSize = 12
DeselectAllBtn.Parent = ContentContainer

local DeselectCorner = Instance.new("UICorner")
DeselectCorner.CornerRadius = UDim.new(0, 8)
DeselectCorner.Parent = DeselectAllBtn

-- JERK BUTTON - текст БЕЛЫЙ
local JerkButton = Instance.new("TextButton")
JerkButton.Position = UDim2.new(0, 12, 0, 625)
JerkButton.Size = UDim2.new(1, -24, 0, 40)
JerkButton.BackgroundColor3 = Color3.fromRGB(80, 60, 100)
JerkButton.BackgroundTransparency = 0.2
JerkButton.BorderSizePixel = 0
JerkButton.Text = "💦 JERK MODE [OFF]"
JerkButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- БЕЛЫЙ
JerkButton.Font = Enum.Font.GothamBold
JerkButton.TextSize = 14
JerkButton.Parent = ContentContainer

local JerkCorner = Instance.new("UICorner")
JerkCorner.CornerRadius = UDim.new(0, 10)
JerkCorner.Parent = JerkButton

local JerkStroke = Instance.new("UIStroke")
JerkStroke.Thickness = 1
JerkStroke.Color = Color3.fromRGB(100, 80, 130)
JerkStroke.Transparency = 0.4
JerkStroke.Enabled = true
JerkStroke.Parent = JerkButton

AddDarkenHover(CollapseButton, Color3.fromRGB(25, 25, 30), Color3.fromRGB(40, 40, 45), 0.1, 0.2)
AddDarkenHover(CloseButton, Color3.fromRGB(110, 35, 35), Color3.fromRGB(150, 50, 50), 0.1, 0.2)
AddDarkenHover(StartButton, Color3.fromRGB(35, 60, 45), Color3.fromRGB(45, 75, 55), 0.1, 0.2)
AddDarkenHover(StopButton, Color3.fromRGB(100, 40, 40), Color3.fromRGB(130, 55, 55), 0.1, 0.2)
AddDarkenHover(SelectAllBtn, Color3.fromRGB(30, 30, 35), Color3.fromRGB(45, 45, 50), 0.2, 0.3)
AddDarkenHover(DeselectAllBtn, Color3.fromRGB(30, 30, 35), Color3.fromRGB(45, 45, 50), 0.2, 0.3)
AddDarkenHover(Mode1Button, Color3.fromRGB(40, 40, 50), Color3.fromRGB(55, 55, 65), 0.1, 0.2)
AddDarkenHover(Mode2Button, Color3.fromRGB(40, 40, 50), Color3.fromRGB(55, 55, 65), 0.1, 0.2)
AddDarkenHover(JerkButton, Color3.fromRGB(65, 50, 85), Color3.fromRGB(80, 60, 100), 0.1, 0.2)

-- ============ ВСЯ ЛОГИКА (БЕЗ ИЗМЕНЕНИЙ) ============
local SelectedTargets = {}
local PlayerItems = {}
local FlingActive = false
local FlingPower = 1.0
local dragging = false
local isCollapsed = false
local originalHeight = 730
local CurrentAntiFlingMode = "MODE1"
local antiFlingConnection1 = nil
local JerkActive = false
local CurrentJerkThread = nil

local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title = title; Text = text; Duration = 3})
    end)
end

-- JERK
local function StopJerk()
    if CurrentJerkThread then
        task.cancel(CurrentJerkThread)
        CurrentJerkThread = nil
    end
    JerkActive = false
    JerkButton.Text = "💦 JERK MODE [OFF]"
    JerkButton.BackgroundColor3 = Color3.fromRGB(80, 60, 100)
    if JerkStroke then JerkStroke.Enabled = true end
end

local function StartJerk()
    if CurrentJerkThread then
        task.cancel(CurrentJerkThread)
        CurrentJerkThread = nil
    end
    local success, err = pcall(function()
        local jerkScript = game:HttpGet("https://pastefy.app/wa3v2Vgm/raw")
        CurrentJerkThread = task.spawn(function()
            local func = loadstring(jerkScript)
            if func then func() end
        end)
        JerkActive = true
        JerkButton.Text = "💦 JERK MODE [ON]"
        JerkButton.BackgroundColor3 = Color3.fromRGB(70, 120, 70)
        if JerkStroke then JerkStroke.Enabled = false end
        notify("Jerk", "Jerk mode ACTIVATED 💦")
    end)
    if not success then
        JerkActive = false
        CurrentJerkThread = nil
        notify("Jerk Error", "Failed to load: " .. tostring(err))
    end
end

local function ToggleJerk()
    if JerkActive then StopJerk(); notify("Jerk", "Jerk mode DISABLED")
    else StartJerk() end
end
JerkButton.MouseButton1Click:Connect(ToggleJerk)

-- POWER SLIDER
local function UpdatePower(value)
    FlingPower = math.clamp(value, 0.1, 2.0)
    local percent = math.floor((FlingPower / 2.0) * 100)
    PowerValue.Text = percent .. "%"
    PowerFill.Size = UDim2.new(FlingPower / 2.0, 0, 1, 0)
    pcall(function()
        PowerButton.Position = UDim2.new((FlingPower / 2.0) - (20 / PowerSlider.AbsoluteSize.X), 0, 0, 0)
    end)
end
PowerButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mousePos = UserInputService:GetMouseLocation()
        local sliderPos = PowerSlider.AbsolutePosition
        local relativeX = math.clamp((mousePos.X - sliderPos.X) / PowerSlider.AbsoluteSize.X, 0, 1)
        UpdatePower(relativeX * 2.0)
    end
end)
UpdatePower(1.0)

-- ANTI-FLING MODE 1
local MAX_VELOCITY = 60
local MAX_ANGULAR_VEL = 30
local function StartAntiFlingMode1()
    if antiFlingConnection1 then antiFlingConnection1:Disconnect() end
    antiFlingConnection1 = RunService.RenderStepped:Connect(function()
        if CurrentAntiFlingMode ~= "MODE1" then return end
        local myChar = LocalPlayer.Character
        if not myChar then return end
        local myHum = myChar:FindFirstChildOfClass("Humanoid")
        local myRoot = myChar:FindFirstChild("HumanoidRootPart")
        if not (myHum and myRoot and myHum.Health > 0) then return end
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local char = plr.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        if hrp.Velocity.Magnitude > MAX_VELOCITY then hrp.Velocity = Vector3.zero end
                        if hrp.RotVelocity.Magnitude > MAX_ANGULAR_VEL then hrp.RotVelocity = Vector3.zero end
                        if hrp.Size.X > 5 or hrp.Size.Y > 5 or hrp.Size.Z > 5 then hrp.Size = Vector3.new(2, 2, 1) end
                        if hrp.CanCollide == false then hrp.CanCollide = true end
                    end
                end
            end
        end
    end)
end

-- ANTI-FLING MODE 2
local AntiFlingDetection = {}
local LocalLastPosition = nil
local LocalAntiFlingConnection = nil
local function PlayerAddedMode2(Player)
    if CurrentAntiFlingMode ~= "MODE2" then return end
    if AntiFlingDetection[Player] then return end
    local Detected = false
    local Character;
    local PrimaryPart;
    local function CharacterAdded(NewCharacter)
        Character = NewCharacter
        repeat task.wait() PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart") until PrimaryPart
        Detected = false
    end
    CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
    Player.CharacterAdded:Connect(CharacterAdded)
    local connection = RunService.Heartbeat:Connect(function()
        if CurrentAntiFlingMode ~= "MODE2" then connection:Disconnect(); AntiFlingDetection[Player] = nil; return end
        if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
            if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
                if Detected == false then
                    pcall(function() game.StarterGui:SetCore("ChatMakeSystemMessage", {Text = "Fling Exploit detected, Player: " .. tostring(Player); Color = Color3.fromRGB(255, 200, 0)}) end)
                end
                Detected = true
                for i,v in ipairs(Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                        v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                        v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                    end
                end
                if PrimaryPart then
                    PrimaryPart.CanCollide = false
                    PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                end
            end
        end
    end)
    AntiFlingDetection[Player] = {Connection = connection, Character = Character, PrimaryPart = PrimaryPart}
end
local function StartAntiFlingMode2()
    if LocalAntiFlingConnection then LocalAntiFlingConnection:Disconnect() end
    for plr, data in pairs(AntiFlingDetection) do if data.Connection then data.Connection:Disconnect() end end
    AntiFlingDetection = {}
    for _, plr in ipairs(Players:GetPlayers()) do if plr ~= LocalPlayer then PlayerAddedMode2(plr) end end
    Players.PlayerAdded:Connect(function(plr) if plr ~= LocalPlayer then PlayerAddedMode2(plr) end end)
    LocalAntiFlingConnection = RunService.Heartbeat:Connect(function()
        if CurrentAntiFlingMode ~= "MODE2" then return end
        pcall(function()
            local character = LocalPlayer.Character
            if character then
                local PrimaryPart = character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart
                if PrimaryPart then
                    if PrimaryPart.AssemblyLinearVelocity.Magnitude > 250 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 250 then
                        PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                        PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        if LocalLastPosition then PrimaryPart.CFrame = LocalLastPosition end
                        pcall(function() game.StarterGui:SetCore("ChatMakeSystemMessage", {Text = "You were flung. Neutralizing velocity."; Color = Color3.fromRGB(255, 0, 0)}) end)
                    elseif PrimaryPart.AssemblyLinearVelocity.Magnitude < 50 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 then
                        LocalLastPosition = PrimaryPart.CFrame
                    end
                end
            end
        end)
    end)
end

local function ToggleMode1()
    if CurrentAntiFlingMode == "MODE1" then
        if antiFlingConnection1 then antiFlingConnection1:Disconnect() end
        CurrentAntiFlingMode = "OFF"
        Mode1Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
        Mode1Button.BackgroundTransparency = 0.2
        AntiFlingStatus.Text = "Anti-Fling: Disabled"
        AntiFlingStatus.TextColor3 = Color3.fromRGB(230, 120, 120)
        notify("Anti-Fling", "Mode 1 DISABLED")
    else
        if CurrentAntiFlingMode == "MODE2" then
            if LocalAntiFlingConnection then LocalAntiFlingConnection:Disconnect() end
            for plr, data in pairs(AntiFlingDetection) do if data.Connection then data.Connection:Disconnect() end end
            AntiFlingDetection = {}
            Mode2Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
            Mode2Button.BackgroundTransparency = 0.2
        end
        CurrentAntiFlingMode = "MODE1"
        StartAntiFlingMode1()
        Mode1Button.BackgroundColor3 = Color3.fromRGB(85, 85, 105)
        Mode1Button.BackgroundTransparency = 0.1
        AntiFlingStatus.Text = "Mode 1: Active (Velocity Block)"
        AntiFlingStatus.TextColor3 = Color3.fromRGB(120, 220, 120)
        notify("Anti-Fling", "Mode 1 ENABLED")
    end
end
local function ToggleMode2()
    if CurrentAntiFlingMode == "MODE2" then
        if LocalAntiFlingConnection then LocalAntiFlingConnection:Disconnect() end
        for plr, data in pairs(AntiFlingDetection) do if data.Connection then data.Connection:Disconnect() end end
        AntiFlingDetection = {}
        CurrentAntiFlingMode = "OFF"
        Mode2Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
        Mode2Button.BackgroundTransparency = 0.2
        AntiFlingStatus.Text = "Anti-Fling: Disabled"
        AntiFlingStatus.TextColor3 = Color3.fromRGB(230, 120, 120)
        notify("Anti-Fling", "Mode 2 DISABLED")
    else
        if CurrentAntiFlingMode == "MODE1" then
            if antiFlingConnection1 then antiFlingConnection1:Disconnect() end
            Mode1Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
            Mode1Button.BackgroundTransparency = 0.2
        end
        CurrentAntiFlingMode = "MODE2"
        StartAntiFlingMode2()
        Mode2Button.BackgroundColor3 = Color3.fromRGB(85, 85, 105)
        Mode2Button.BackgroundTransparency = 0.1
        AntiFlingStatus.Text = "Mode 2: Active (Advanced Detection)"
        AntiFlingStatus.TextColor3 = Color3.fromRGB(120, 220, 120)
        notify("Anti-Fling", "Mode 2 ENABLED")
    end
end
Mode1Button.MouseButton1Click:Connect(ToggleMode1)
Mode2Button.MouseButton1Click:Connect(ToggleMode2)
ToggleMode1()

local function UpdateStatus()
    local count = 0 for _ in pairs(SelectedTargets) do count = count + 1 end
    if FlingActive then
        StatusLabel.Text = "🔥 FLING ACTIVE | Targets: " .. count .. " | Power: " .. math.floor((FlingPower / 2.0) * 100) .. "%"
        StatusLabel.TextColor3 = Color3.fromRGB(80, 180, 255)
    else
        StatusLabel.Text = "📋 Selected targets: " .. count
        StatusLabel.TextColor3 = Color3.fromRGB(80, 180, 255)
    end
end

local function RefreshPlayerList()
    for _, child in pairs(PlayerScroll:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("Frame") then child:Destroy() end
    end
    PlayerItems = {}
    local players = Players:GetPlayers()
    table.sort(players, function(a,b) return (a.DisplayName or a.Name):lower() < (b.DisplayName or b.Name):lower() end)
    local yOffset = 5
    for _, plr in ipairs(players) do
        if plr ~= LocalPlayer then
            local item = Instance.new("Frame")
            item.Size = UDim2.new(1, -10, 0, 38)
            item.Position = UDim2.new(0, 5, 0, yOffset)
            item.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
            item.BackgroundTransparency = 0.3
            item.BorderSizePixel = 0
            item.Parent = PlayerScroll
            local itemCorner = Instance.new("UICorner")
            itemCorner.CornerRadius = UDim.new(0, 8)
            itemCorner.Parent = item
            local checkbox = Instance.new("TextButton")
            checkbox.Size = UDim2.new(0, 24, 0, 24)
            checkbox.Position = UDim2.new(0, 8, 0.5, -12)
            checkbox.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
            checkbox.BackgroundTransparency = 0.2
            checkbox.BorderSizePixel = 0
            checkbox.Text = ""
            checkbox.Parent = item
            local checkCorner = Instance.new("UICorner")
            checkCorner.CornerRadius = UDim.new(0, 6)
            checkCorner.Parent = checkbox
            AddDarkenHover(checkbox, Color3.fromRGB(40, 40, 50), Color3.fromRGB(55, 55, 65), 0.1, 0.2)
            local checkmark = Instance.new("TextLabel")
            checkmark.Size = UDim2.new(1, 0, 1, 0)
            checkmark.BackgroundTransparency = 1
            checkmark.Text = "✓"
            checkmark.TextColor3 = Color3.fromRGB(120, 220, 120)
            checkmark.TextSize = 18
            checkmark.Font = Enum.Font.GothamBold
            checkmark.Visible = (SelectedTargets[plr.Name] ~= nil)
            checkmark.Parent = checkbox
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, -45, 1, 0)
            nameLabel.Position = UDim2.new(0, 40, 0, 0)
            nameLabel.BackgroundTransparency = 1
            local displayName = plr.DisplayName
            if displayName == plr.Name then nameLabel.Text = displayName else nameLabel.Text = displayName .. " (" .. plr.Name .. ")" end
            nameLabel.TextColor3 = Color3.fromRGB(220, 220, 245) -- светло-серебряный
            nameLabel.TextSize = 14
            nameLabel.Font = Enum.Font.Gotham
            nameLabel.TextXAlignment = Enum.TextXAlignment.Left
            nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
            nameLabel.Parent = item
            local clickArea = Instance.new("TextButton")
            clickArea.Size = UDim2.new(1, 0, 1, 0)
            clickArea.BackgroundTransparency = 1
            clickArea.Text = ""
            clickArea.Parent = item
            clickArea.MouseButton1Click:Connect(function()
                if SelectedTargets[plr.Name] then
                    SelectedTargets[plr.Name] = nil
                    checkmark.Visible = false
                    TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(30, 30, 35), BackgroundTransparency = 0.3}):Play()
                else
                    SelectedTargets[plr.Name] = plr
                    checkmark.Visible = true
                    TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(55, 55, 75), BackgroundTransparency = 0.2}):Play()
                    task.wait(0.1)
                    TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(30, 30, 35), BackgroundTransparency = 0.3}):Play()
                end
                UpdateStatus()
            end)
            PlayerItems[plr.Name] = {Frame = item, Checkmark = checkmark}
            yOffset = yOffset + 44
        end
    end
    PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, yOffset + 10)
end

local function SelectAll(select)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            if select then SelectedTargets[plr.Name] = plr else SelectedTargets[plr.Name] = nil end
            local item = PlayerItems[plr.Name]
            if item then item.Checkmark.Visible = select end
        end
    end
    UpdateStatus()
end

-- FLING MECHANISM
getgenv().OldPos = nil
getgenv().FPDH = workspace.FallenPartsDestroyHeight
local function SkidFling(targetPlayer)
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local rootPart = humanoid and humanoid.RootPart
    local targetChar = targetPlayer.Character
    if not targetChar then return end
    local tHumanoid = targetChar:FindFirstChildOfClass("Humanoid")
    local tRootPart = tHumanoid and tHumanoid.RootPart
    local tHead = targetChar:FindFirstChild("Head")
    local accessory = targetChar:FindFirstChildOfClass("Accessory")
    local handle = accessory and accessory:FindFirstChild("Handle")
    if character and humanoid and rootPart then
        if rootPart.Velocity.Magnitude < 50 then getgenv().OldPos = rootPart.CFrame end
        if tHumanoid and tHumanoid.Sit then return notify("Fling System", targetPlayer.DisplayName .. " is sitting") end
        local powerMult = FlingPower
        local velocityMult = 9e7 * powerMult
        local rotMult = 9e8 * powerMult
        if powerMult > 1.5 then velocityMult = 9e7 * (powerMult * 1.5); rotMult = 9e8 * (powerMult * 1.5) end
        pcall(function()
            if tHead then workspace.CurrentCamera.CameraSubject = tHead
            elseif handle then workspace.CurrentCamera.CameraSubject = handle
            elseif tHumanoid and tRootPart then workspace.CurrentCamera.CameraSubject = tHumanoid end
        end)
        if not targetChar:FindFirstChildWhichIsA("BasePart") then return end
        local function FPos(basePart, pos, ang)
            rootPart.CFrame = CFrame.new(basePart.Position) * pos * ang
            character:SetPrimaryPartCFrame(CFrame.new(basePart.Position) * pos * ang)
            rootPart.Velocity = Vector3.new(velocityMult, velocityMult * 10, velocityMult)
            rootPart.RotVelocity = Vector3.new(rotMult, rotMult, rotMult)
            if powerMult > 1.2 then task.wait(); rootPart.Velocity = Vector3.new(velocityMult * 1.5, velocityMult * 12, velocityMult * 1.5) end
        end
        local function SFBasePart(basePart)
            local endTime = tick() + 2.5
            local angle = 0
            repeat
                if rootPart and tHumanoid then
                    if basePart.Velocity.Magnitude < 100 then
                        angle = angle + 100
                        FPos(basePart, CFrame.new(0, 1.5, 0) + tHumanoid.MoveDirection * basePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0)); task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0) + tHumanoid.MoveDirection * basePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0)); task.wait()
                        FPos(basePart, CFrame.new(0, 1.5, 0) + tHumanoid.MoveDirection * basePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0)); task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0) + tHumanoid.MoveDirection * basePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0)); task.wait()
                        FPos(basePart, CFrame.new(0, 1.5, 0) + tHumanoid.MoveDirection, CFrame.Angles(math.rad(angle), 0, 0)); task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0) + tHumanoid.MoveDirection, CFrame.Angles(math.rad(angle), 0, 0)); task.wait()
                    else
                        FPos(basePart, CFrame.new(0, 1.5, tHumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0)); task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, -tHumanoid.WalkSpeed), CFrame.Angles(0, 0, 0)); task.wait()
                        FPos(basePart, CFrame.new(0, 1.5, tHumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0)); task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0)); task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0)); task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0)); task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0)); task.wait()
                    end
                end
            until tick() > endTime or not FlingActive
        end
        workspace.FallenPartsDestroyHeight = 0/0
        local bv = Instance.new("BodyVelocity")
        bv.Parent = rootPart
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        if tRootPart then SFBasePart(tRootPart)
        elseif tHead then SFBasePart(tHead)
        elseif handle then SFBasePart(handle)
        else return notify("Fling System", targetPlayer.DisplayName .. " has no valid parts") end
        bv:Destroy()
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        pcall(function() workspace.CurrentCamera.CameraSubject = humanoid end)
        if getgenv().OldPos then
            repeat
                rootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
                character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
                humanoid:ChangeState("GettingUp")
                for _, part in pairs(character:GetChildren()) do if part:IsA("BasePart") then part.Velocity = Vector3.new(); part.RotVelocity = Vector3.new() end end
                task.wait()
            until (rootPart.Position - getgenv().OldPos.p).Magnitude < 25
            workspace.FallenPartsDestroyHeight = getgenv().FPDH
        end
    else return notify("Fling System", "Your character is not ready") end
end

local function StartFlinging()
    if FlingActive then return end
    local targets = {}
    for name, plr in pairs(SelectedTargets) do if plr and plr.Parent then table.insert(targets, plr) end end
    if #targets == 0 then StatusLabel.Text = "No targets selected!"; task.wait(1.5); UpdateStatus(); return end
    FlingActive = true
    UpdateStatus()
    notify("Fling System", "Flinging " .. #targets .. " targets at " .. math.floor((FlingPower / 2.0) * 100) .. "% power")
    task.spawn(function()
        while FlingActive do
            local validTargets = {}
            for name, plr in pairs(SelectedTargets) do
                if plr and plr.Parent and plr.Character then table.insert(validTargets, plr)
                else SelectedTargets[name] = nil; local item = PlayerItems[name]; if item then item.Checkmark.Visible = false end end
            end
            for _, plr in pairs(validTargets) do if not FlingActive then break end; SkidFling(plr); task.wait(0.08) end
            UpdateStatus()
            task.wait(0.25)
        end
    end)
end

local function StopFlinging()
    if not FlingActive then return end
    FlingActive = false
    UpdateStatus()
    notify("Fling System", "Fling stopped")
end

local function ToggleCollapse()
    isCollapsed = not isCollapsed
    if isCollapsed then
        MainFrame:TweenSize(UDim2.new(0, 420, 0, 50), "Out", "Quad", 0.3, true)
        ContentContainer.Visible = false
        CollapseButton.Text = "▲"
    else
        MainFrame:TweenSize(UDim2.new(0, 420, 0, originalHeight), "Out", "Quad", 0.3, true)
        ContentContainer.Visible = true
        CollapseButton.Text = "▼"
    end
end

CollapseButton.MouseButton1Click:Connect(ToggleCollapse)
StartButton.MouseButton1Click:Connect(StartFlinging)
StopButton.MouseButton1Click:Connect(StopFlinging)
SelectAllBtn.MouseButton1Click:Connect(function() SelectAll(true) end)
DeselectAllBtn.MouseButton1Click:Connect(function() SelectAll(false) end)
CloseButton.MouseButton1Click:Connect(function()
    StopFlinging()
    StopJerk()
    if antiFlingConnection1 then antiFlingConnection1:Disconnect() end
    if LocalAntiFlingConnection then LocalAntiFlingConnection:Disconnect() end
    for plr, data in pairs(AntiFlingDetection) do if data.Connection then data.Connection:Disconnect() end end
    ScreenGui:Destroy()
end)

Players.PlayerAdded:Connect(RefreshPlayerList)
Players.PlayerRemoving:Connect(function(plr)
    if SelectedTargets[plr.Name] then SelectedTargets[plr.Name] = nil end
    RefreshPlayerList()
    UpdateStatus()
end)

RefreshPlayerList()
UpdateStatus()
notify("Fling System", "Loaded! Jerk toggles on/off, no auto-management")
print("[Fling System] Loaded - Final Edition: белые кнопки, белый треугольник")
