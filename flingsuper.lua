--[[
    Fling System v6 by milkaqyyy
    - Dual Anti-Fling modes (toggleable)
    - Adjustable fling power slider
    - Dark theme with blue tones
    - Collapsible menu
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

-- Удаляем старые GUI если есть
pcall(function()
    for _, gui in pairs(game:GetService("CoreGui"):GetChildren()) do
        if gui.Name == "FlingGUI" then
            gui:Destroy()
        end
    end
end)

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FlingGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

-- Main window (темно-синяя тема)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 700)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -335)
MainFrame.BackgroundColor3 = Color3.fromRGB(28, 30, 36)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- Тень
local Shadow = Instance.new("Frame")
Shadow.Size = UDim2.new(1, 0, 1, 0)
Shadow.Position = UDim2.new(0, 0, 0, 0)
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.75
Shadow.BorderSizePixel = 0
Shadow.ZIndex = -1
Shadow.Parent = MainFrame

-- Title bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(35, 37, 45)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -70, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "FLING SYSTEM"
TitleLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 22
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

-- Author label
local AuthorLabel = Instance.new("TextLabel")
AuthorLabel.Size = UDim2.new(1, -70, 0, 15)
AuthorLabel.Position = UDim2.new(0, 15, 1, -16)
AuthorLabel.BackgroundTransparency = 1
AuthorLabel.Text = "by milkaqyyy"
AuthorLabel.TextColor3 = Color3.fromRGB(150, 150, 160)
AuthorLabel.Font = Enum.Font.Gotham
AuthorLabel.TextSize = 10
AuthorLabel.TextXAlignment = Enum.TextXAlignment.Left
AuthorLabel.Parent = TitleBar

-- Collapse Button
local CollapseButton = Instance.new("TextButton")
CollapseButton.Position = UDim2.new(1, -65, 0, 12)
CollapseButton.Size = UDim2.new(0, 26, 0, 26)
CollapseButton.BackgroundColor3 = Color3.fromRGB(50, 52, 60)
CollapseButton.BorderSizePixel = 0
CollapseButton.Text = "▼"
CollapseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CollapseButton.Font = Enum.Font.GothamBold
CollapseButton.TextSize = 18
CollapseButton.Parent = TitleBar

local CollapseCorner = Instance.new("UICorner")
CollapseCorner.CornerRadius = UDim.new(1, 0)
CollapseCorner.Parent = CollapseButton

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Position = UDim2.new(1, -35, 0, 12)
CloseButton.Size = UDim2.new(0, 26, 0, 26)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

-- Hover effects
local function AddHoverEffect(button, darkenColor, originalColor)
    if not originalColor then
        originalColor = button.BackgroundColor3
    end
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = darkenColor}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = originalColor}):Play()
    end)
end

-- Content container
local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, 0, 1, -50)
ContentContainer.Position = UDim2.new(0, 0, 0, 50)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

-- Status label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Position = UDim2.new(0, 15, 0, 10)
StatusLabel.Size = UDim2.new(1, -30, 0, 30)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Select targets"
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 210)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextSize = 15
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = ContentContainer

-- FLING POWER SLIDER
local PowerLabel = Instance.new("TextLabel")
PowerLabel.Position = UDim2.new(0, 15, 0, 48)
PowerLabel.Size = UDim2.new(0, 80, 0, 25)
PowerLabel.BackgroundTransparency = 1
PowerLabel.Text = "⚡ POWER:"
PowerLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
PowerLabel.Font = Enum.Font.GothamBold
PowerLabel.TextSize = 12
PowerLabel.TextXAlignment = Enum.TextXAlignment.Left
PowerLabel.Parent = ContentContainer

local PowerValue = Instance.new("TextLabel")
PowerValue.Position = UDim2.new(1, -55, 0, 48)
PowerValue.Size = UDim2.new(0, 45, 0, 25)
PowerValue.BackgroundTransparency = 1
PowerValue.Text = "100%"
PowerValue.TextColor3 = Color3.fromRGB(255, 150, 150)
PowerValue.Font = Enum.Font.GothamBold
PowerValue.TextSize = 12
PowerValue.TextXAlignment = Enum.TextXAlignment.Right
PowerValue.Parent = ContentContainer

local PowerSlider = Instance.new("Frame")
PowerSlider.Position = UDim2.new(0, 100, 0, 53)
PowerSlider.Size = UDim2.new(1, -165, 0, 15)
PowerSlider.BackgroundColor3 = Color3.fromRGB(45, 47, 55)
PowerSlider.BorderSizePixel = 0
PowerSlider.Parent = ContentContainer

local PowerSliderCorner = Instance.new("UICorner")
PowerSliderCorner.CornerRadius = UDim.new(1, 0)
PowerSliderCorner.Parent = PowerSlider

local PowerFill = Instance.new("Frame")
PowerFill.Size = UDim2.new(1, 0, 1, 0)
PowerFill.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
PowerFill.BorderSizePixel = 0
PowerFill.Parent = PowerSlider

local PowerFillCorner = Instance.new("UICorner")
PowerFillCorner.CornerRadius = UDim.new(1, 0)
PowerFillCorner.Parent = PowerFill

local PowerButton = Instance.new("TextButton")
PowerButton.Size = UDim2.new(0, 20, 1, 0)
PowerButton.Position = UDim2.new(1, -10, 0, 0)
PowerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PowerButton.BorderSizePixel = 0
PowerButton.Text = ""
PowerButton.Parent = PowerSlider

local PowerButtonCorner = Instance.new("UICorner")
PowerButtonCorner.CornerRadius = UDim.new(1, 0)
PowerButtonCorner.Parent = PowerButton

-- Anti-Fling Mode Toggle Buttons
local ModeLabel = Instance.new("TextLabel")
ModeLabel.Position = UDim2.new(0, 15, 0, 82)
ModeLabel.Size = UDim2.new(0, 100, 0, 20)
ModeLabel.BackgroundTransparency = 1
ModeLabel.Text = "ANTI-FLING:"
ModeLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
ModeLabel.Font = Enum.Font.GothamBold
ModeLabel.TextSize = 12
ModeLabel.TextXAlignment = Enum.TextXAlignment.Left
ModeLabel.Parent = ContentContainer

local Mode1Button = Instance.new("TextButton")
Mode1Button.Position = UDim2.new(0, 12, 0, 105)
Mode1Button.Size = UDim2.new(0.48, -6, 0, 32)
Mode1Button.BackgroundColor3 = Color3.fromRGB(50, 52, 60)
Mode1Button.BorderSizePixel = 0
Mode1Button.Text = "🛡️ MODE 1"
Mode1Button.TextColor3 = Color3.fromRGB(220, 220, 230)
Mode1Button.Font = Enum.Font.GothamBold
Mode1Button.TextSize = 12
Mode1Button.Parent = ContentContainer

local Mode1Corner = Instance.new("UICorner")
Mode1Corner.CornerRadius = UDim.new(0, 6)
Mode1Corner.Parent = Mode1Button

local Mode2Button = Instance.new("TextButton")
Mode2Button.Position = UDim2.new(0.52, 0, 0, 105)
Mode2Button.Size = UDim2.new(0.48, -6, 0, 32)
Mode2Button.BackgroundColor3 = Color3.fromRGB(50, 52, 60)
Mode2Button.BorderSizePixel = 0
Mode2Button.Text = "🔰 MODE 2"
Mode2Button.TextColor3 = Color3.fromRGB(220, 220, 230)
Mode2Button.Font = Enum.Font.GothamBold
Mode2Button.TextSize = 12
Mode2Button.Parent = ContentContainer

local Mode2Corner = Instance.new("UICorner")
Mode2Corner.CornerRadius = UDim.new(0, 6)
Mode2Corner.Parent = Mode2Button

-- Add hover effects for mode buttons
AddHoverEffect(Mode1Button, Color3.fromRGB(65, 67, 75), Color3.fromRGB(50, 52, 60))
AddHoverEffect(Mode2Button, Color3.fromRGB(65, 67, 75), Color3.fromRGB(50, 52, 60))

-- Anti-Fling Status
local AntiFlingStatus = Instance.new("TextLabel")
AntiFlingStatus.Position = UDim2.new(0, 15, 0, 142)
AntiFlingStatus.Size = UDim2.new(1, -30, 0, 20)
AntiFlingStatus.BackgroundTransparency = 1
AntiFlingStatus.Text = "Mode 1: Active"
AntiFlingStatus.TextColor3 = Color3.fromRGB(100, 255, 100)
AntiFlingStatus.Font = Enum.Font.Gotham
AntiFlingStatus.TextSize = 11
AntiFlingStatus.TextXAlignment = Enum.TextXAlignment.Left
AntiFlingStatus.Parent = ContentContainer

-- Player list frame
local ListFrame = Instance.new("Frame")
ListFrame.Position = UDim2.new(0, 12, 0, 170)
ListFrame.Size = UDim2.new(1, -24, 0, 370)
ListFrame.BackgroundColor3 = Color3.fromRGB(35, 37, 45)
ListFrame.BorderSizePixel = 0
ListFrame.Parent = ContentContainer

local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 8)
ListCorner.Parent = ListFrame

local PlayerScroll = Instance.new("ScrollingFrame")
PlayerScroll.Position = UDim2.new(0, 6, 0, 6)
PlayerScroll.Size = UDim2.new(1, -12, 1, -12)
PlayerScroll.BackgroundTransparency = 1
PlayerScroll.BorderSizePixel = 0
PlayerScroll.ScrollBarThickness = 4
PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerScroll.Parent = ListFrame

-- Buttons
local StartButton = Instance.new("TextButton")
StartButton.Position = UDim2.new(0, 12, 0, 555)
StartButton.Size = UDim2.new(0.48, -6, 0, 38)
StartButton.BackgroundColor3 = Color3.fromRGB(40, 180, 70)
StartButton.BorderSizePixel = 0
StartButton.Text = "🔥 START FLING"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 14
StartButton.Parent = ContentContainer

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 8)
StartCorner.Parent = StartButton

local StopButton = Instance.new("TextButton")
StopButton.Position = UDim2.new(0.52, 0, 0, 555)
StopButton.Size = UDim2.new(0.48, -6, 0, 38)
StopButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
StopButton.BorderSizePixel = 0
StopButton.Text = "🛑 STOP FLING"
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 14
StopButton.Parent = ContentContainer

local StopCorner = Instance.new("UICorner")
StopCorner.CornerRadius = UDim.new(0, 8)
StopCorner.Parent = StopButton

local SelectAllBtn = Instance.new("TextButton")
SelectAllBtn.Position = UDim2.new(0, 12, 0, 600)
SelectAllBtn.Size = UDim2.new(0.48, -6, 0, 32)
SelectAllBtn.BackgroundColor3 = Color3.fromRGB(50, 52, 60)
SelectAllBtn.BorderSizePixel = 0
SelectAllBtn.Text = "✅ SELECT ALL"
SelectAllBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
SelectAllBtn.Font = Enum.Font.GothamBold
SelectAllBtn.TextSize = 12
SelectAllBtn.Parent = ContentContainer

local SelectAllCorner = Instance.new("UICorner")
SelectAllCorner.CornerRadius = UDim.new(0, 6)
SelectAllCorner.Parent = SelectAllBtn

local DeselectAllBtn = Instance.new("TextButton")
DeselectAllBtn.Position = UDim2.new(0.52, 0, 0, 600)
DeselectAllBtn.Size = UDim2.new(0.48, -6, 0, 32)
DeselectAllBtn.BackgroundColor3 = Color3.fromRGB(50, 52, 60)
DeselectAllBtn.BorderSizePixel = 0
DeselectAllBtn.Text = "❌ DESELECT ALL"
DeselectAllBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
DeselectAllBtn.Font = Enum.Font.GothamBold
DeselectAllBtn.TextSize = 12
DeselectAllBtn.Parent = ContentContainer

local DeselectCorner = Instance.new("UICorner")
DeselectCorner.CornerRadius = UDim.new(0, 6)
DeselectCorner.Parent = DeselectAllBtn

-- Add hover effects for action buttons
AddHoverEffect(StartButton, Color3.fromRGB(30, 160, 60), Color3.fromRGB(40, 180, 70))
AddHoverEffect(StopButton, Color3.fromRGB(180, 40, 40), Color3.fromRGB(200, 50, 50))
AddHoverEffect(SelectAllBtn, Color3.fromRGB(65, 67, 75), Color3.fromRGB(50, 52, 60))
AddHoverEffect(DeselectAllBtn, Color3.fromRGB(65, 67, 75), Color3.fromRGB(50, 52, 60))
AddHoverEffect(CollapseButton, Color3.fromRGB(65, 67, 75), Color3.fromRGB(50, 52, 60))
AddHoverEffect(CloseButton, Color3.fromRGB(180, 50, 50), Color3.fromRGB(200, 60, 60))

-- Variables
local SelectedTargets = {}
local PlayerItems = {}
local FlingActive = false
local FlingPower = 1.0
local dragging = false
local isCollapsed = false
local originalHeight = 700
local CurrentAntiFlingMode = "MODE1"
local antiFlingConnection1 = nil
local antiFlingConnection2 = nil

-- Notification function
local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title;
            Text = text;
            Duration = 3;
        })
    end)
end

-- Power slider function
local function UpdatePower(value)
    FlingPower = math.clamp(value, 0.1, 2.0)
    local percent = math.floor((FlingPower / 2.0) * 100)
    PowerValue.Text = percent .. "%"
    PowerFill.Size = UDim2.new(FlingPower / 2.0, 0, 1, 0)
    pcall(function()
        PowerButton.Position = UDim2.new((FlingPower / 2.0) - (20 / PowerSlider.AbsoluteSize.X), 0, 0, 0)
    end)
end

-- Slider input
PowerButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
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

-- ============ ANTI-FLING MODE 1 ============
local MAX_VELOCITY = 60
local MAX_ANGULAR_VEL = 30

local function StartAntiFlingMode1()
    if antiFlingConnection1 then 
        antiFlingConnection1:Disconnect()
        antiFlingConnection1 = nil
    end
    
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
                        if hrp.Velocity.Magnitude > MAX_VELOCITY then
                            hrp.Velocity = Vector3.zero
                        end
                        if hrp.RotVelocity.Magnitude > MAX_ANGULAR_VEL then
                            hrp.RotVelocity = Vector3.zero
                        end
                        if hrp.Size.X > 5 or hrp.Size.Y > 5 or hrp.Size.Z > 5 then
                            hrp.Size = Vector3.new(2, 2, 1)
                        end
                        if hrp.CanCollide == false then
                            hrp.CanCollide = true
                        end
                    end
                end
            end
        end
    end)
end

-- ============ ANTI-FLING MODE 2 ============
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
        repeat
            task.wait()
            PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
        until PrimaryPart
        Detected = false
    end

    CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
    Player.CharacterAdded:Connect(CharacterAdded)
    
    local connection = RunService.Heartbeat:Connect(function()
        if CurrentAntiFlingMode ~= "MODE2" then 
            connection:Disconnect()
            AntiFlingDetection[Player] = nil
            return 
        end
        
        if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
            if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
                if Detected == false then
                    pcall(function()
                        game.StarterGui:SetCore("ChatMakeSystemMessage", {
                            Text = "Fling Exploit detected, Player: " .. tostring(Player);
                            Color = Color3.fromRGB(255, 200, 0);
                        })
                    end)
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
    
    AntiFlingDetection[Player] = {
        Connection = connection,
        Character = Character,
        PrimaryPart = PrimaryPart
    }
end

local function StartAntiFlingMode2()
    -- Clean up old
    if LocalAntiFlingConnection then
        LocalAntiFlingConnection:Disconnect()
        LocalAntiFlingConnection = nil
    end
    
    for plr, data in pairs(AntiFlingDetection) do
        if data.Connection then
            data.Connection:Disconnect()
        end
    end
    AntiFlingDetection = {}
    
    -- Setup for existing players
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            PlayerAddedMode2(plr)
        end
    end
    
    -- Setup for new players
    Players.PlayerAdded:Connect(function(plr)
        if plr ~= LocalPlayer then
            PlayerAddedMode2(plr)
        end
    end)
    
    -- Local player anti-fling
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
                        if LocalLastPosition then
                            PrimaryPart.CFrame = LocalLastPosition
                        end
                        pcall(function()
                            game.StarterGui:SetCore("ChatMakeSystemMessage", {
                                Text = "You were flung. Neutralizing velocity.";
                                Color = Color3.fromRGB(255, 0, 0);
                            })
                        end)
                    elseif PrimaryPart.AssemblyLinearVelocity.Magnitude < 50 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 then
                        LocalLastPosition = PrimaryPart.CFrame
                    end
                end
            end
        end)
    end)
end

-- Switch anti-fling mode (toggle)
local function ToggleMode1()
    if CurrentAntiFlingMode == "MODE1" then
        -- Выключаем MODE 1
        if antiFlingConnection1 then
            antiFlingConnection1:Disconnect()
            antiFlingConnection1 = nil
        end
        CurrentAntiFlingMode = "OFF"
        Mode1Button.BackgroundColor3 = Color3.fromRGB(50, 52, 60)
        AntiFlingStatus.Text = "Anti-Fling: Disabled"
        AntiFlingStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
        notify("Anti-Fling", "Mode 1 DISABLED")
    else
        -- Включаем MODE 1, выключаем MODE 2 если был
        if CurrentAntiFlingMode == "MODE2" then
            if LocalAntiFlingConnection then
                LocalAntiFlingConnection:Disconnect()
                LocalAntiFlingConnection = nil
            end
            for plr, data in pairs(AntiFlingDetection) do
                if data.Connection then
                    data.Connection:Disconnect()
                end
            end
            AntiFlingDetection = {}
            Mode2Button.BackgroundColor3 = Color3.fromRGB(50, 52, 60)
        end
        CurrentAntiFlingMode = "MODE1"
        StartAntiFlingMode1()
        Mode1Button.BackgroundColor3 = Color3.fromRGB(100, 180, 100)
        AntiFlingStatus.Text = "Mode 1: Active (Velocity Block)"
        AntiFlingStatus.TextColor3 = Color3.fromRGB(100, 255, 100)
        notify("Anti-Fling", "Mode 1 ENABLED")
    end
end

local function ToggleMode2()
    if CurrentAntiFlingMode == "MODE2" then
        -- Выключаем MODE 2
        if LocalAntiFlingConnection then
            LocalAntiFlingConnection:Disconnect()
            LocalAntiFlingConnection = nil
        end
        for plr, data in pairs(AntiFlingDetection) do
            if data.Connection then
                data.Connection:Disconnect()
            end
        end
        AntiFlingDetection = {}
        CurrentAntiFlingMode = "OFF"
        Mode2Button.BackgroundColor3 = Color3.fromRGB(50, 52, 60)
        AntiFlingStatus.Text = "Anti-Fling: Disabled"
        AntiFlingStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
        notify("Anti-Fling", "Mode 2 DISABLED")
    else
        -- Включаем MODE 2, выключаем MODE 1 если был
        if CurrentAntiFlingMode == "MODE1" then
            if antiFlingConnection1 then
                antiFlingConnection1:Disconnect()
                antiFlingConnection1 = nil
            end
            Mode1Button.BackgroundColor3 = Color3.fromRGB(50, 52, 60)
        end
        CurrentAntiFlingMode = "MODE2"
        StartAntiFlingMode2()
        Mode2Button.BackgroundColor3 = Color3.fromRGB(100, 180, 100)
        AntiFlingStatus.Text = "Mode 2: Active (Advanced Detection)"
        AntiFlingStatus.TextColor3 = Color3.fromRGB(100, 255, 100)
        notify("Anti-Fling", "Mode 2 ENABLED")
    end
end

Mode1Button.MouseButton1Click:Connect(ToggleMode1)
Mode2Button.MouseButton1Click:Connect(ToggleMode2)

-- Start with Mode 1 by default
ToggleMode1()

-- Update status
local function UpdateStatus()
    local count = 0
    for _ in pairs(SelectedTargets) do count = count + 1 end
    if FlingActive then
        StatusLabel.Text = "🔥 FLING ACTIVE | Targets: " .. count .. " | Power: " .. math.floor((FlingPower / 2.0) * 100) .. "%"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 120, 120)
    else
        StatusLabel.Text = "📋 Selected targets: " .. count
        StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 210)
    end
end

-- Refresh player list
local function RefreshPlayerList()
    for _, child in pairs(PlayerScroll:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("Frame") then
            child:Destroy()
        end
    end
    PlayerItems = {}

    local players = Players:GetPlayers()
    table.sort(players, function(a, b)
        return (a.DisplayName or a.Name):lower() < (b.DisplayName or b.Name):lower()
    end)

    local yOffset = 5
    for _, plr in ipairs(players) do
        if plr ~= LocalPlayer then
            local item = Instance.new("Frame")
            item.Size = UDim2.new(1, -10, 0, 38)
            item.Position = UDim2.new(0, 5, 0, yOffset)
            item.BackgroundColor3 = Color3.fromRGB(42, 44, 52)
            item.BorderSizePixel = 0
            item.Parent = PlayerScroll

            local itemCorner = Instance.new("UICorner")
            itemCorner.CornerRadius = UDim.new(0, 6)
            itemCorner.Parent = item

            local checkbox = Instance.new("TextButton")
            checkbox.Size = UDim2.new(0, 24, 0, 24)
            checkbox.Position = UDim2.new(0, 8, 0.5, -12)
            checkbox.BackgroundColor3 = Color3.fromRGB(55, 57, 65)
            checkbox.BorderSizePixel = 0
            checkbox.Text = ""
            checkbox.Parent = item

            local checkCorner = Instance.new("UICorner")
            checkCorner.CornerRadius = UDim.new(0, 4)
            checkCorner.Parent = checkbox

            local checkmark = Instance.new("TextLabel")
            checkmark.Size = UDim2.new(1, 0, 1, 0)
            checkmark.BackgroundTransparency = 1
            checkmark.Text = "✓"
            checkmark.TextColor3 = Color3.fromRGB(100, 255, 100)
            checkmark.TextSize = 18
            checkmark.Font = Enum.Font.GothamBold
            checkmark.Visible = (SelectedTargets[plr.Name] ~= nil)
            checkmark.Parent = checkbox

            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, -45, 1, 0)
            nameLabel.Position = UDim2.new(0, 40, 0, 0)
            nameLabel.BackgroundTransparency = 1
            local displayName = plr.DisplayName
            if displayName == plr.Name then
                nameLabel.Text = displayName
            else
                nameLabel.Text = displayName .. " (" .. plr.Name .. ")"
            end
            nameLabel.TextColor3 = Color3.fromRGB(230, 230, 240)
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
                    TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(42, 44, 52)}):Play()
                else
                    SelectedTargets[plr.Name] = plr
                    checkmark.Visible = true
                    TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(60, 80, 60)}):Play()
                    task.wait(0.1)
                    TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(42, 44, 52)}):Play()
                end
                UpdateStatus()
            end)

            PlayerItems[plr.Name] = {
                Frame = item,
                Checkmark = checkmark
            }

            yOffset = yOffset + 44
        end
    end

    PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, yOffset + 10)
end

-- Select / Deselect all
local function SelectAll(select)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            if select then
                SelectedTargets[plr.Name] = plr
            else
                SelectedTargets[plr.Name] = nil
            end
            local item = PlayerItems[plr.Name]
            if item then
                item.Checkmark.Visible = select
            end
        end
    end
    UpdateStatus()
end

-- ============ FLING MECHANISM ============
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
        if rootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = rootPart.CFrame
        end

        if tHumanoid and tHumanoid.Sit then
            return notify("Fling System", targetPlayer.DisplayName .. " is sitting")
        end

        local powerMult = FlingPower
        local velocityMult = 9e7 * powerMult
        local rotMult = 9e8 * powerMult
        
        if powerMult > 1.5 then
            velocityMult = 9e7 * (powerMult * 1.5)
            rotMult = 9e8 * (powerMult * 1.5)
        end

        pcall(function()
            if tHead then
                workspace.CurrentCamera.CameraSubject = tHead
            elseif handle then
                workspace.CurrentCamera.CameraSubject = handle
            elseif tHumanoid and tRootPart then
                workspace.CurrentCamera.CameraSubject = tHumanoid
            end
        end)

        if not targetChar:FindFirstChildWhichIsA("BasePart") then
            return
        end

        local function FPos(basePart, pos, ang)
            rootPart.CFrame = CFrame.new(basePart.Position) * pos * ang
            character:SetPrimaryPartCFrame(CFrame.new(basePart.Position) * pos * ang)
            rootPart.Velocity = Vector3.new(velocityMult, velocityMult * 10, velocityMult)
            rootPart.RotVelocity = Vector3.new(rotMult, rotMult, rotMult)
            
            if powerMult > 1.2 then
                task.wait()
                rootPart.Velocity = Vector3.new(velocityMult * 1.5, velocityMult * 12, velocityMult * 1.5)
            end
        end

        local function SFBasePart(basePart)
            local endTime = tick() + 2.5
            local angle = 0
            repeat
                if rootPart and tHumanoid then
                    if basePart.Velocity.Magnitude < 100 then
                        angle = angle + 100
                        FPos(basePart, CFrame.new(0, 1.5, 0) + tHumanoid.MoveDirection * basePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
                        task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0) + tHumanoid.MoveDirection * basePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
                        task.wait()
                        FPos(basePart, CFrame.new(0, 1.5, 0) + tHumanoid.MoveDirection * basePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
                        task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0) + tHumanoid.MoveDirection * basePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
                        task.wait()
                        FPos(basePart, CFrame.new(0, 1.5, 0) + tHumanoid.MoveDirection, CFrame.Angles(math.rad(angle), 0, 0))
                        task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0) + tHumanoid.MoveDirection, CFrame.Angles(math.rad(angle), 0, 0))
                        task.wait()
                    else
                        FPos(basePart, CFrame.new(0, 1.5, tHumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, -tHumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()
                        FPos(basePart, CFrame.new(0, 1.5, tHumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                        FPos(basePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
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

        if tRootPart then
            SFBasePart(tRootPart)
        elseif tHead then
            SFBasePart(tHead)
        elseif handle then
            SFBasePart(handle)
        else
            return notify("Fling System", targetPlayer.DisplayName .. " has no valid parts")
        end

        bv:Destroy()
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        
        pcall(function()
            workspace.CurrentCamera.CameraSubject = humanoid
        end)

        if getgenv().OldPos then
            repeat
                rootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
                character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
                humanoid:ChangeState("GettingUp")
                for _, part in pairs(character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.Velocity = Vector3.new()
                        part.RotVelocity = Vector3.new()
                    end
                end
                task.wait()
            until (rootPart.Position - getgenv().OldPos.p).Magnitude < 25
            workspace.FallenPartsDestroyHeight = getgenv().FPDH
        end
    else
        return notify("Fling System", "Your character is not ready")
    end
end

local function StartFlinging()
    if FlingActive then return end

    local targets = {}
    for name, plr in pairs(SelectedTargets) do
        if plr and plr.Parent then
            table.insert(targets, plr)
        end
    end

    if #targets == 0 then
        StatusLabel.Text = "No targets selected!"
        task.wait(1.5)
        UpdateStatus()
        return
    end

    FlingActive = true
    UpdateStatus()
    notify("Fling System", "Flinging " .. #targets .. " targets at " .. math.floor((FlingPower / 2.0) * 100) .. "% power")

    task.spawn(function()
        while FlingActive do
            local validTargets = {}
            for name, plr in pairs(SelectedTargets) do
                if plr and plr.Parent and plr.Character then
                    table.insert(validTargets, plr)
                else
                    SelectedTargets[name] = nil
                    local item = PlayerItems[name]
                    if item then
                        item.Checkmark.Visible = false
                    end
                end
            end

            for _, plr in pairs(validTargets) do
                if not FlingActive then break end
                SkidFling(plr)
                task.wait(0.08)
            end
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

-- Collapse functionality
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

-- Button connections
StartButton.MouseButton1Click:Connect(StartFlinging)
StopButton.MouseButton1Click:Connect(StopFlinging)
SelectAllBtn.MouseButton1Click:Connect(function() SelectAll(true) end)
DeselectAllBtn.MouseButton1Click:Connect(function() SelectAll(false) end)
CloseButton.MouseButton1Click:Connect(function()
    StopFlinging()
    if antiFlingConnection1 then antiFlingConnection1:Disconnect() end
    if LocalAntiFlingConnection then LocalAntiFlingConnection:Disconnect() end
    for plr, data in pairs(AntiFlingDetection) do
        if data.Connection then data.Connection:Disconnect() end
    end
    ScreenGui:Destroy()
end)

-- Player events
Players.PlayerAdded:Connect(RefreshPlayerList)
Players.PlayerRemoving:Connect(function(plr)
    if SelectedTargets[plr.Name] then
        SelectedTargets[plr.Name] = nil
    end
    RefreshPlayerList()
    UpdateStatus()
end)

-- Initialize
RefreshPlayerList()
UpdateStatus()
notify("Fling System", "Loaded! Click mode buttons to toggle anti-fling")
print("[Fling System] Loaded successfully by milkaqyyy")
