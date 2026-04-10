-- SWILL COMPLETE EDITION - полный рабочий скрипт
-- Fling System v3 by milkaqyyy
-- Добавлено: анимированные кнопки в Extra, Fling по клавише E, анимация вкладок, исправлена кнопка IY

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local mouse = LocalPlayer:GetMouse()

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

-- ============ MAIN FRAME ============
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 720)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -385)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

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

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -70, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "HACH HUB"
TitleLabel.TextColor3 = Color3.fromRGB(220, 40, 40)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 22
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

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

local CollapseButton = Instance.new("TextButton")
CollapseButton.Position = UDim2.new(1, -65, 0, 12)
CollapseButton.Size = UDim2.new(0, 26, 0, 26)
CollapseButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
CollapseButton.BackgroundTransparency = 0.2
CollapseButton.BorderSizePixel = 0
CollapseButton.Text = "−"
CollapseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CollapseButton.Font = Enum.Font.GothamBold
CollapseButton.TextSize = 18
CollapseButton.Parent = TitleBar

local CollapseCorner = Instance.new("UICorner")
CollapseCorner.CornerRadius = UDim.new(1, 0)
CollapseCorner.Parent = CollapseButton

local CloseButton = Instance.new("TextButton")
CloseButton.Position = UDim2.new(1, -35, 0, 12)
CloseButton.Size = UDim2.new(0, 26, 0, 26)
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
CloseButton.BackgroundTransparency = 0.2
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

-- ============ TABS ============
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -24, 0, 38)
TabBar.Position = UDim2.new(0, 12, 0, 52)
TabBar.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
TabBar.BackgroundTransparency = 0.2
TabBar.BorderSizePixel = 0
TabBar.Parent = MainFrame

local TabBarCorner = Instance.new("UICorner")
TabBarCorner.CornerRadius = UDim.new(0, 10)
TabBarCorner.Parent = TabBar

local Tab1Button = Instance.new("TextButton")
Tab1Button.Size = UDim2.new(0.24, -4, 0, 30)
Tab1Button.Position = UDim2.new(0, 4, 0.5, -15)
Tab1Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
Tab1Button.BackgroundTransparency = 0.3
Tab1Button.BorderSizePixel = 0
Tab1Button.Text = "🔥 FLING"
Tab1Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab1Button.Font = Enum.Font.GothamBold
Tab1Button.TextSize = 10
Tab1Button.AutoButtonColor = false
Tab1Button.Parent = TabBar

local Tab1Corner = Instance.new("UICorner")
Tab1Corner.CornerRadius = UDim.new(0, 6)
Tab1Corner.Parent = Tab1Button

local Tab2Button = Instance.new("TextButton")
Tab2Button.Size = UDim2.new(0.24, -4, 0, 30)
Tab2Button.Position = UDim2.new(0.255, 0, 0.5, -15)
Tab2Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
Tab2Button.BackgroundTransparency = 0.3
Tab2Button.BorderSizePixel = 0
Tab2Button.Text = "🚀 TELEPORT"
Tab2Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab2Button.Font = Enum.Font.GothamBold
Tab2Button.TextSize = 10
Tab2Button.AutoButtonColor = false
Tab2Button.Parent = TabBar

local Tab2Corner = Instance.new("UICorner")
Tab2Corner.CornerRadius = UDim.new(0, 6)
Tab2Corner.Parent = Tab2Button

local Tab3Button = Instance.new("TextButton")
Tab3Button.Size = UDim2.new(0.24, -4, 0, 30)
Tab3Button.Position = UDim2.new(0.51, 0, 0.5, -15)
Tab3Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
Tab3Button.BackgroundTransparency = 0.3
Tab3Button.BorderSizePixel = 0
Tab3Button.Text = "🎮 GRAPHICS"
Tab3Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab3Button.Font = Enum.Font.GothamBold
Tab3Button.TextSize = 10
Tab3Button.AutoButtonColor = false
Tab3Button.Parent = TabBar

local Tab3Corner = Instance.new("UICorner")
Tab3Corner.CornerRadius = UDim.new(0, 6)
Tab3Corner.Parent = Tab3Button

local Tab4Button = Instance.new("TextButton")
Tab4Button.Size = UDim2.new(0.24, -4, 0, 30)
Tab4Button.Position = UDim2.new(0.765, 0, 0.5, -15)
Tab4Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
Tab4Button.BackgroundTransparency = 0.3
Tab4Button.BorderSizePixel = 0
Tab4Button.Text = "⭐ EXTRA"
Tab4Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab4Button.Font = Enum.Font.GothamBold
Tab4Button.TextSize = 10
Tab4Button.AutoButtonColor = false
Tab4Button.Parent = TabBar

local Tab4Corner = Instance.new("UICorner")
Tab4Corner.CornerRadius = UDim.new(0, 6)
Tab4Corner.Parent = Tab4Button

local function ApplySmoothHover(button)
    local originalTrans = button.BackgroundTransparency
    
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0.45
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = originalTrans
        }):Play()
    end)
end

local function AddClickFlash(button)
    button.MouseButton1Click:Connect(function()
        local flashFrame = Instance.new("Frame")
        flashFrame.Size = UDim2.new(1, 0, 1, 0)
        flashFrame.Position = UDim2.new(0, 0, 0, 0)
        flashFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        flashFrame.BackgroundTransparency = 0.8
        flashFrame.BorderSizePixel = 0
        flashFrame.ZIndex = 10
        flashFrame.Parent = button
        
        local buttonCorner = button:FindFirstChildWhichIsA("UICorner")
        local flashCorner = Instance.new("UICorner")
        if buttonCorner then
            flashCorner.CornerRadius = buttonCorner.CornerRadius
        end
        flashCorner.Parent = flashFrame
        
        TweenService:Create(flashFrame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1
        }):Play()
        
        task.wait(0.15)
        flashFrame:Destroy()
    end)
end

-- ============ CONTENT CONTAINERS ============
local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, 0, 1, -90)
ContentContainer.Position = UDim2.new(0, 0, 0, 90)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

local FlingTab = Instance.new("Frame")
FlingTab.Size = UDim2.new(1, 0, 1, 0)
FlingTab.BackgroundTransparency = 1
FlingTab.Visible = true
FlingTab.Parent = ContentContainer

local TeleportTab = Instance.new("Frame")
TeleportTab.Size = UDim2.new(1, 0, 1, 0)
TeleportTab.BackgroundTransparency = 1
TeleportTab.Visible = false
TeleportTab.Parent = ContentContainer

local GraphicsTab = Instance.new("Frame")
GraphicsTab.Size = UDim2.new(1, 0, 1, 0)
GraphicsTab.BackgroundTransparency = 1
GraphicsTab.Visible = false
GraphicsTab.Parent = ContentContainer

local ExtraTab = Instance.new("Frame")
ExtraTab.Size = UDim2.new(1, 0, 1, 0)
ExtraTab.BackgroundTransparency = 1
ExtraTab.Visible = false
ExtraTab.Parent = ContentContainer

-- ============ ИСПРАВЛЕННАЯ АНИМАЦИЯ ПЕРЕКЛЮЧЕНИЯ МЕЖДУ ВКЛАДКАМИ (БЕЛЫЙ ФОН ИСЧЕЗ) ============
local function SwitchTabWithAnimation(tabName)
    local tabs = {
        fling = FlingTab,
        teleport = TeleportTab,
        graphics = GraphicsTab,
        extra = ExtraTab
    }
    
    local targetTab = tabs[tabName]
    if not targetTab then return end
    
    -- Анимируем скрытие всех вкладок (только Position, без изменения прозрачности)
    for _, tab in pairs(tabs) do
        if tab ~= targetTab and tab.Visible then
            TweenService:Create(tab, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Position = UDim2.new(0.02, 0, 0, 0)
            }):Play()
            task.wait(0.05)
            tab.Visible = false
            tab.Position = UDim2.new(0, 0, 0, 0) -- Сбрасываем позицию для следующего раза
        end
    end
    
    -- Показываем целевую вкладку (начинаем с небольшого смещения)
    targetTab.Visible = true
    targetTab.Position = UDim2.new(-0.02, 0, 0, 0)
    
    -- Анимируем появление
    TweenService:Create(targetTab, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()
end

ApplySmoothHover(Tab1Button)
ApplySmoothHover(Tab2Button)
ApplySmoothHover(Tab3Button)
ApplySmoothHover(Tab4Button)
AddClickFlash(Tab1Button)
AddClickFlash(Tab2Button)
AddClickFlash(Tab3Button)
AddClickFlash(Tab4Button)

-- ============ FLING TAB CONTENT ============
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Position = UDim2.new(0, 15, 0, 5)
StatusLabel.Size = UDim2.new(1, -30, 0, 25)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Select targets"
StatusLabel.TextColor3 = Color3.fromRGB(80, 180, 255)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextSize = 14
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = FlingTab

local PowerLabel = Instance.new("TextLabel")
PowerLabel.Position = UDim2.new(0, 15, 0, 38)
PowerLabel.Size = UDim2.new(0, 80, 0, 25)
PowerLabel.BackgroundTransparency = 1
PowerLabel.Text = "⚡ POWER:"
PowerLabel.TextColor3 = Color3.fromRGB(255, 100, 40)
PowerLabel.Font = Enum.Font.GothamBold
PowerLabel.TextSize = 12
PowerLabel.TextXAlignment = Enum.TextXAlignment.Left
PowerLabel.Parent = FlingTab

local PowerValue = Instance.new("TextLabel")
PowerValue.Position = UDim2.new(1, -55, 0, 38)
PowerValue.Size = UDim2.new(0, 45, 0, 25)
PowerValue.BackgroundTransparency = 1
PowerValue.Text = "100%"
PowerValue.TextColor3 = Color3.fromRGB(255, 160, 60)
PowerValue.Font = Enum.Font.GothamBold
PowerValue.TextSize = 12
PowerValue.TextXAlignment = Enum.TextXAlignment.Right
PowerValue.Parent = FlingTab

local PowerSlider = Instance.new("Frame")
PowerSlider.Position = UDim2.new(0, 100, 0, 43)
PowerSlider.Size = UDim2.new(1, -165, 0, 15)
PowerSlider.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
PowerSlider.BackgroundTransparency = 0.3
PowerSlider.BorderSizePixel = 0
PowerSlider.Parent = FlingTab

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

PowerButton.MouseEnter:Connect(function()
    TweenService:Create(PowerButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundColor3 = Color3.fromRGB(255, 100, 50),
        BackgroundTransparency = 0
    }):Play()
end)

PowerButton.MouseLeave:Connect(function()
    TweenService:Create(PowerButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundColor3 = Color3.fromRGB(255, 140, 80),
        BackgroundTransparency = 0.1
    }):Play()
end)

local ModeLabel = Instance.new("TextLabel")
ModeLabel.Position = UDim2.new(0, 15, 0, 72)
ModeLabel.Size = UDim2.new(0, 100, 0, 20)
ModeLabel.BackgroundTransparency = 1
ModeLabel.Text = "ANTI-FLING:"
ModeLabel.TextColor3 = Color3.fromRGB(255, 200, 70)
ModeLabel.Font = Enum.Font.GothamBold
ModeLabel.TextSize = 12
ModeLabel.TextXAlignment = Enum.TextXAlignment.Left
ModeLabel.Parent = FlingTab

local Mode1Button = Instance.new("TextButton")
Mode1Button.Position = UDim2.new(0, 12, 0, 95)
Mode1Button.Size = UDim2.new(0.46, -6, 0, 32)
Mode1Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
Mode1Button.BackgroundTransparency = 0.2
Mode1Button.BorderSizePixel = 0
Mode1Button.Text = "🛡️ MODE 1"
Mode1Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Mode1Button.Font = Enum.Font.GothamBold
Mode1Button.TextSize = 12
Mode1Button.Parent = FlingTab

local Mode1Corner = Instance.new("UICorner")
Mode1Corner.CornerRadius = UDim.new(0, 8)
Mode1Corner.Parent = Mode1Button

local Mode2Button = Instance.new("TextButton")
Mode2Button.Position = UDim2.new(0.525, 0, 0, 95)
Mode2Button.Size = UDim2.new(0.46, -6, 0, 32)
Mode2Button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
Mode2Button.BackgroundTransparency = 0.2
Mode2Button.BorderSizePixel = 0
Mode2Button.Text = "🔰 MODE 2"
Mode2Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Mode2Button.Font = Enum.Font.GothamBold
Mode2Button.TextSize = 12
Mode2Button.Parent = FlingTab

local Mode2Corner = Instance.new("UICorner")
Mode2Corner.CornerRadius = UDim.new(0, 8)
Mode2Corner.Parent = Mode2Button

local AntiFlingStatus = Instance.new("TextLabel")
AntiFlingStatus.Position = UDim2.new(0, 15, 0, 132)
AntiFlingStatus.Size = UDim2.new(0.5, -10, 0, 18)
AntiFlingStatus.BackgroundTransparency = 1
AntiFlingStatus.Text = "Mode 1: Active"
AntiFlingStatus.TextColor3 = Color3.fromRGB(120, 220, 120)
AntiFlingStatus.Font = Enum.Font.Gotham
AntiFlingStatus.TextSize = 11
AntiFlingStatus.TextXAlignment = Enum.TextXAlignment.Left
AntiFlingStatus.Parent = FlingTab

local ListFrame = Instance.new("Frame")
ListFrame.Position = UDim2.new(0, 12, 0, 158)
ListFrame.Size = UDim2.new(1, -24, 0, 370)
ListFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
ListFrame.BackgroundTransparency = 0.3
ListFrame.BorderSizePixel = 0
ListFrame.Parent = FlingTab

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

local StartButton = Instance.new("TextButton")
StartButton.Position = UDim2.new(0, 12, 0, 540)
StartButton.Size = UDim2.new(0.46, -6, 0, 38)
StartButton.BackgroundColor3 = Color3.fromRGB(45, 75, 55)
StartButton.BackgroundTransparency = 0.2
StartButton.BorderSizePixel = 0
StartButton.Text = "🔥 START FLING"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 14
StartButton.Parent = FlingTab

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 10)
StartCorner.Parent = StartButton

local StopButton = Instance.new("TextButton")
StopButton.Position = UDim2.new(0.525, 0, 0, 540)
StopButton.Size = UDim2.new(0.46, -6, 0, 38)
StopButton.BackgroundColor3 = Color3.fromRGB(130, 55, 55)
StopButton.BackgroundTransparency = 0.2
StopButton.BorderSizePixel = 0
StopButton.Text = "🛑 STOP FLING"
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 14
StopButton.Parent = FlingTab

local StopCorner = Instance.new("UICorner")
StopCorner.CornerRadius = UDim.new(0, 10)
StopCorner.Parent = StopButton

local SelectAllBtn = Instance.new("TextButton")
SelectAllBtn.Position = UDim2.new(0, 12, 0, 585)
SelectAllBtn.Size = UDim2.new(0.46, -6, 0, 32)
SelectAllBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
SelectAllBtn.BackgroundTransparency = 0.3
SelectAllBtn.BorderSizePixel = 0
SelectAllBtn.Text = "✅ SELECT ALL"
SelectAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectAllBtn.Font = Enum.Font.GothamBold
SelectAllBtn.TextSize = 12
SelectAllBtn.Parent = FlingTab

local SelectAllCorner = Instance.new("UICorner")
SelectAllCorner.CornerRadius = UDim.new(0, 8)
SelectAllCorner.Parent = SelectAllBtn

local DeselectAllBtn = Instance.new("TextButton")
DeselectAllBtn.Position = UDim2.new(0.525, 0, 0, 585)
DeselectAllBtn.Size = UDim2.new(0.46, -6, 0, 32)
DeselectAllBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
DeselectAllBtn.BackgroundTransparency = 0.3
DeselectAllBtn.BorderSizePixel = 0
DeselectAllBtn.Text = "❌ DESELECT ALL"
DeselectAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DeselectAllBtn.Font = Enum.Font.GothamBold
DeselectAllBtn.TextSize = 12
DeselectAllBtn.Parent = FlingTab

local DeselectCorner = Instance.new("UICorner")
DeselectCorner.CornerRadius = UDim.new(0, 8)
DeselectCorner.Parent = DeselectAllBtn

local function ApplyButtonAnimation(button, hoverColor, hoverTrans)
    local originalColor = button.BackgroundColor3
    local originalTrans = button.BackgroundTransparency
    local originalSize = button.Size
    
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = hoverColor or originalColor,
            BackgroundTransparency = hoverTrans or math.max(originalTrans - 0.15, 0.05),
            Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, originalSize.Y.Scale, originalSize.Y.Offset + 2)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = originalColor,
            BackgroundTransparency = originalTrans,
            Size = originalSize
        }):Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        local flashFrame = Instance.new("Frame")
        flashFrame.Size = UDim2.new(1, 0, 1, 0)
        flashFrame.Position = UDim2.new(0, 0, 0, 0)
        flashFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        flashFrame.BackgroundTransparency = 0.6
        flashFrame.BorderSizePixel = 0
        flashFrame.ZIndex = 10
        flashFrame.Parent = button
        
        local buttonCorner = button:FindFirstChildWhichIsA("UICorner")
        local flashCorner = Instance.new("UICorner")
        if buttonCorner then
            flashCorner.CornerRadius = buttonCorner.CornerRadius
        else
            flashCorner.CornerRadius = UDim.new(0, 8)
        end
        flashCorner.Parent = flashFrame
        
        TweenService:Create(flashFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1
        }):Play()
        
        task.wait(0.4)
        flashFrame:Destroy()
    end)
end

ApplyButtonAnimation(CollapseButton, Color3.fromRGB(25, 25, 30), 0.1)
ApplyButtonAnimation(CloseButton, Color3.fromRGB(110, 35, 35), 0.1)
ApplyButtonAnimation(StartButton, Color3.fromRGB(35, 60, 45), 0.1)
ApplyButtonAnimation(StopButton, Color3.fromRGB(100, 40, 40), 0.1)
ApplyButtonAnimation(SelectAllBtn, Color3.fromRGB(30, 30, 35), 0.2)
ApplyButtonAnimation(DeselectAllBtn, Color3.fromRGB(30, 30, 35), 0.2)
ApplyButtonAnimation(Mode1Button, Color3.fromRGB(40, 40, 50), 0.1)
ApplyButtonAnimation(Mode2Button, Color3.fromRGB(40, 40, 50), 0.1)

-- ============ COLLAPSE ANIMATION ============
local isCollapsed = false
local originalHeight = 720

CollapseButton.MouseButton1Click:Connect(function()
    isCollapsed = not isCollapsed
    if isCollapsed then
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 420, 0, 50)
        }):Play()
        CollapseButton.Text = "+"
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 420, 0, originalHeight)
        }):Play()
        CollapseButton.Text = "−"
    end
end)

-- ============ LOGIC ============
local SelectedTargets = {}
local PlayerItems = {}
local FlingActive = false
local FlingPower = 1.0
local dragging = false
local CurrentAntiFlingMode = "MODE1"
local antiFlingConnection1 = nil
local JerkActive = false
local CurrentJerkThread = nil

local tpTool = nil
local tpActive = false

local function GiveTpTool()
    if tpActive then return end
    tpTool = Instance.new("Tool")
    tpTool.RequiresHandle = false
    tpTool.Name = "Click Teleport"
    tpTool.Activated:Connect(function()
        local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
        pos = CFrame.new(pos.X, pos.Y, pos.Z)
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = pos
        end
    end)
    tpTool.Parent = LocalPlayer.Backpack
    tpActive = true
    TpButton.Text = "🔮 CLICK TP [ON]"
    TweenService:Create(TpButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundColor3 = Color3.fromRGB(60, 85, 100)
    }):Play()
    notify("TP Tool", "Click Teleport Tool GIVEN")
end

local function RemoveTpTool()
    if not tpActive then return end
    if tpTool then
        tpTool:Destroy()
        tpTool = nil
    end
    local backpack = LocalPlayer.Backpack
    for _, item in pairs(backpack:GetChildren()) do
        if item.Name == "Click Teleport" then
            item:Destroy()
        end
    end
    local char = LocalPlayer.Character
    if char then
        for _, item in pairs(char:GetChildren()) do
            if item:IsA("Tool") and item.Name == "Click Teleport" then
                item:Destroy()
            end
        end
    end
    tpActive = false
    TpButton.Text = "🔮 CLICK TP [OFF]"
    TweenService:Create(TpButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundColor3 = Color3.fromRGB(40, 55, 70),
        BackgroundTransparency = 0.2
    }):Play()
    notify("TP Tool", "Click Teleport Tool REMOVED")
end

local function ToggleTpTool()
    if tpActive then
        RemoveTpTool()
    else
        GiveTpTool()
    end
end

local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title = title; Text = text; Duration = 3})
    end)
end

local function StopJerk()
    if CurrentJerkThread then
        task.cancel(CurrentJerkThread)
        CurrentJerkThread = nil
    end
    JerkActive = false
    if ExtraJerkButton then
        ExtraJerkButton.Text = "💦 JERK MODE"
        TweenService:Create(ExtraJerkButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(55, 55, 65)
        }):Play()
    end
    
    pcall(function()
        local backpack = LocalPlayer.Backpack
        for _, item in pairs(backpack:GetChildren()) do
            if item.Name and (item.Name:lower():find("jerk") or item.Name:lower():find("dildo") or item.Name:lower():find("sex")) then
                item:Destroy()
            end
        end
        local char = LocalPlayer.Character
        if char then
            for _, item in pairs(char:GetChildren()) do
                if item:IsA("Tool") and item.Name and (item.Name:lower():find("jerk") or item.Name:lower():find("dildo") or item.Name:lower():find("sex")) then
                    item:Destroy()
                end
            end
        end
    end)
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
        if ExtraJerkButton then
            ExtraJerkButton.Text = "💦 JERK MODE [ON]"
            TweenService:Create(ExtraJerkButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(70, 120, 70)
            }):Play()
        end
        notify("Jerk", "Jerk mode ACTIVATED 💦")
    end)
    if not success then
        JerkActive = false
        CurrentJerkThread = nil
        notify("Jerk Error", "Failed to load: " .. tostring(err))
    end
end

local function ToggleJerk()
    if JerkActive then 
        StopJerk()
        notify("Jerk", "Jerk mode DISABLED")
    else 
        StartJerk()
    end
end

local function UpdatePower(value)
    FlingPower = math.clamp(value, 0.1, 2.0)
    local percent = math.floor((FlingPower / 2.0) * 100)
    PowerValue.Text = percent .. "%"
    TweenService:Create(PowerFill, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(FlingPower / 2.0, 0, 1, 0)
    }):Play()
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
        TweenService:Create(Mode1Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(55, 55, 65),
            BackgroundTransparency = 0.2
        }):Play()
        AntiFlingStatus.Text = "Anti-Fling: Disabled"
        AntiFlingStatus.TextColor3 = Color3.fromRGB(230, 120, 120)
        notify("Anti-Fling", "Mode 1 DISABLED")
    else
        if CurrentAntiFlingMode == "MODE2" then
            if LocalAntiFlingConnection then LocalAntiFlingConnection:Disconnect() end
            for plr, data in pairs(AntiFlingDetection) do if data.Connection then data.Connection:Disconnect() end end
            AntiFlingDetection = {}
            TweenService:Create(Mode2Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(55, 55, 65),
                BackgroundTransparency = 0.2
            }):Play()
        end
        CurrentAntiFlingMode = "MODE1"
        StartAntiFlingMode1()
        TweenService:Create(Mode1Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(85, 85, 105),
            BackgroundTransparency = 0.1
        }):Play()
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
        TweenService:Create(Mode2Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(55, 55, 65),
            BackgroundTransparency = 0.2
        }):Play()
        AntiFlingStatus.Text = "Anti-Fling: Disabled"
        AntiFlingStatus.TextColor3 = Color3.fromRGB(230, 120, 120)
        notify("Anti-Fling", "Mode 2 DISABLED")
    else
        if CurrentAntiFlingMode == "MODE1" then
            if antiFlingConnection1 then antiFlingConnection1:Disconnect() end
            TweenService:Create(Mode1Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(55, 55, 65),
                BackgroundTransparency = 0.2
            }):Play()
        end
        CurrentAntiFlingMode = "MODE2"
        StartAntiFlingMode2()
        TweenService:Create(Mode2Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(85, 85, 105),
            BackgroundTransparency = 0.1
        }):Play()
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
    else
        StatusLabel.Text = "📋 Selected targets: " .. count
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
            nameLabel.TextColor3 = Color3.fromRGB(220, 220, 245)
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
                    TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(30, 30, 35),
                        BackgroundTransparency = 0.3
                    }):Play()
                else
                    SelectedTargets[plr.Name] = plr
                    checkmark.Visible = true
                    TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(55, 55, 75),
                        BackgroundTransparency = 0.2
                    }):Play()
                    task.wait(0.1)
                    TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundColor3 = Color3.fromRGB(30, 30, 35),
                        BackgroundTransparency = 0.3
                    }):Play()
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
    if #targets == 0 then
        StatusLabel.Text = "No targets selected!"
        TweenService:Create(StatusLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextColor3 = Color3.fromRGB(255, 100, 100)
        }):Play()
        task.wait(1.5)
        TweenService:Create(StatusLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            TextColor3 = Color3.fromRGB(80, 180, 255)
        }):Play()
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

StartButton.MouseButton1Click:Connect(StartFlinging)
StopButton.MouseButton1Click:Connect(StopFlinging)
SelectAllBtn.MouseButton1Click:Connect(function() SelectAll(true) end)
DeselectAllBtn.MouseButton1Click:Connect(function() SelectAll(false) end)

-- ============ FPS BOOSTER ============
local FPSBoosterScript = [[
if not _G.Ignore then _G.Ignore = {} end
_G.SendNotifications = false
_G.ConsoleLogs = false

_G.Settings = {
    Players = {["Ignore Me"] = true, ["Ignore Others"] = true},
    Meshes = {Destroy = false, LowDetail = true},
    Images = {Invisible = true, LowDetail = false, Destroy = false},
    ["No Particles"] = true,
    ["No Camera Effects"] = true,
    ["No Explosions"] = true,
    ["No Clothes"] = true,
    ["Low Water Graphics"] = true,
    ["No Shadows"] = true,
    ["Low Rendering"] = true,
    ["Low Quality Parts"] = true,
    Other = {
        ["FPS Cap"] = true,
        ["No Camera Effects"] = true,
        ["No Clothes"] = true,
        ["Low Water Graphics"] = true,
        ["No Shadows"] = true,
        ["Low Rendering"] = true,
        ["Low Quality Parts"] = true,
        ["Low Quality Models"] = true,
        ["Reset Materials"] = true,
        ["Lower Quality MeshParts"] = true,
        ClearNilInstances = false
    }
}

if not game:IsLoaded() then repeat task.wait() until game:IsLoaded() end

local Players, Lighting, StarterGui, MaterialService = game:GetService("Players"), game:GetService("Lighting"), game:GetService("StarterGui"), game:GetService("MaterialService")
local ME, CanBeEnabled = Players.LocalPlayer, {"ParticleEmitter", "Trail", "Smoke", "Fire", "Sparkles"}

local function PartOfCharacter(Inst)
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= ME and v.Character and Inst:IsDescendantOf(v.Character) then return true end
    end
    return false
end

local function DescendantOfIgnore(Inst)
    for i, v in pairs(_G.Ignore) do
        if Inst:IsDescendantOf(v) then return true end
    end
    return false
end

local function CheckIfBad(Inst)
    if not Inst:IsDescendantOf(Players) and (_G.Settings.Players["Ignore Others"] and not PartOfCharacter(Inst) 
    or not _G.Settings.Players["Ignore Others"]) and (_G.Settings.Players["Ignore Me"] and ME.Character and not Inst:IsDescendantOf(ME.Character) 
    or not _G.Settings.Players["Ignore Me"]) and (_G.Ignore and not table.find(_G.Ignore, Inst) and not DescendantOfIgnore(Inst) 
    or (not _G.Ignore or type(_G.Ignore) ~= "table" or #_G.Ignore <= 0)) then
        if Inst:IsA("DataModelMesh") then
            if Inst:IsA("SpecialMesh") then
                if _G.Settings.Meshes.NoMesh then Inst.MeshId = "" end
                if _G.Settings.Meshes.NoTexture then Inst.TextureId = "" end
            end
            if _G.Settings.Meshes.Destroy or _G.Settings["No Meshes"] then Inst:Destroy() end
        elseif Inst:IsA("FaceInstance") then
            if _G.Settings.Images.Invisible then Inst.Transparency = 1; Inst.Shiny = 1 end
            if _G.Settings.Images.LowDetail then Inst.Shiny = 1 end
            if _G.Settings.Images.Destroy then Inst:Destroy() end
        elseif table.find(CanBeEnabled, Inst.ClassName) then
            if _G.Settings["Invisible Particles"] or _G.Settings["No Particles"] then Inst.Enabled = false end
            if _G.Settings.Other["No Particles"] or _G.Settings["No Particles"] then Inst:Destroy() end
        elseif Inst:IsA("PostEffect") and (_G.Settings["No Camera Effects"] or _G.Settings.Other["No Camera Effects"]) then Inst.Enabled = false
        elseif Inst:IsA("Explosion") then
            if _G.Settings["No Explosions"] or _G.Settings.Other["No Explosions"] then Inst:Destroy() end
        elseif Inst:IsA("Clothing") or Inst:IsA("SurfaceAppearance") or Inst:IsA("BaseWrap") then
            if _G.Settings["No Clothes"] or _G.Settings.Other["No Clothes"] then Inst:Destroy() end
        elseif Inst:IsA("BasePart") and not Inst:IsA("MeshPart") then
            if _G.Settings["Low Quality Parts"] or _G.Settings.Other["Low Quality Parts"] then
                Inst.Material = Enum.Material.Plastic
                Inst.Reflectance = 0
            end
        elseif Inst:IsA("MeshPart") then
            if _G.Settings.Other["Lower Quality MeshParts"] or _G.Settings.Meshes.LowDetail then
                Inst.RenderFidelity = 2
                Inst.Reflectance = 0
                Inst.Material = Enum.Material.Plastic
            end
            if _G.Settings.Meshes.Destroy then Inst:Destroy() end
        elseif Inst:IsA("Model") then
            if _G.Settings.Other["Low Quality Models"] then Inst.LevelOfDetail = 1 end
        end
    end
end

pcall(function()
    if _G.Settings["Low Water Graphics"] or _G.Settings.Other["Low Water Graphics"] then
        local terrain = workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            terrain.WaterWaveSize = 0
            terrain.WaterWaveSpeed = 0
            terrain.WaterReflectance = 0
            terrain.WaterTransparency = 0
            if sethiddenproperty then sethiddenproperty(terrain, "Decoration", false) end
        end
    end
end)

pcall(function()
    if _G.Settings["No Shadows"] or _G.Settings.Other["No Shadows"] then
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Lighting.ShadowSoftness = 0
        if sethiddenproperty then sethiddenproperty(Lighting, "Technology", 2) end
    end
end)

pcall(function()
    if _G.Settings["Low Rendering"] or _G.Settings.Other["Low Rendering"] then
        settings().Rendering.QualityLevel = 1
        settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
    end
end)

pcall(function()
    if _G.Settings.Other["Reset Materials"] then
        for i, v in pairs(MaterialService:GetChildren()) do v:Destroy() end
        MaterialService.Use2022Materials = false
    end
end)

pcall(function()
    if _G.Settings.Other["FPS Cap"] then
        if setfpscap then setfpscap(1e6) end
    end
end)

local Descendants = game:GetDescendants()
for i, v in pairs(Descendants) do CheckIfBad(v) end

game.DescendantAdded:Connect(function(value)
    task.wait(0.5)
    CheckIfBad(value)
end)
]]

-- Warning label above FPS button
local FPSWarning = Instance.new("TextLabel")
FPSWarning.Size = UDim2.new(0.9, 0, 0, 16)
FPSWarning.Position = UDim2.new(0.05, 0, 0.008, 0)
FPSWarning.BackgroundTransparency = 1
FPSWarning.Text = "⚠️ FPS BOOST MAY CAUSE BUGS"
FPSWarning.TextColor3 = Color3.fromRGB(255, 200, 100)
FPSWarning.Font = Enum.Font.Gotham
FPSWarning.TextSize = 9
FPSWarning.TextXAlignment = Enum.TextXAlignment.Center
FPSWarning.Parent = GraphicsTab

local FPSButton = Instance.new("TextButton")
FPSButton.Size = UDim2.new(0.9, 0, 0, 32)
FPSButton.Position = UDim2.new(0.05, 0, 0.049, 0)
FPSButton.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
FPSButton.BackgroundTransparency = 0.2
FPSButton.BorderSizePixel = 0
FPSButton.Text = "⚡ FPS BOOST"
FPSButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FPSButton.Font = Enum.Font.GothamBold
FPSButton.TextSize = 13
FPSButton.Parent = GraphicsTab

local FPSButtonCorner = Instance.new("UICorner")
FPSButtonCorner.CornerRadius = UDim.new(0, 6)
FPSButtonCorner.Parent = FPSButton

local function RunFPSBooster()
    task.spawn(function()
        local success, err = pcall(function()
            loadstring(FPSBoosterScript)()
        end)
        if success then
            notify("FPS Boost", "Optimization started!")
            TweenService:Create(FPSButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(70, 120, 70),
                BackgroundTransparency = 0.1
            }):Play()
            task.wait(1)
            TweenService:Create(FPSButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(55, 55, 65),
                BackgroundTransparency = 0.2
            }):Play()
        else
            notify("FPS Boost", "Error: " .. tostring(err))
        end
    end)
end

FPSButton.MouseEnter:Connect(function()
    TweenService:Create(FPSButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.05,
        Size = UDim2.new(0.92, 0, 0, 34)
    }):Play()
end)

FPSButton.MouseLeave:Connect(function()
    TweenService:Create(FPSButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.2,
        Size = UDim2.new(0.9, 0, 0, 32)
    }):Play()
end)

FPSButton.MouseButton1Click:Connect(RunFPSBooster)

-- ============ DAMAGE HIGHLIGHT (INSTANT, NO DELAYS, NO DUPLICATES) ============
local DamageHighlightActive = false
local ActiveHighlights = {}
local IsFlashing = {}

local function FlashPlayer(player)
    if not DamageHighlightActive then return end
    if not player or player == LocalPlayer then return end
    if not player.Character then return end
    
    if IsFlashing[player] then
        return
    end
    
    IsFlashing[player] = true
    
    if ActiveHighlights[player] then
        pcall(function() ActiveHighlights[player]:Destroy() end)
        ActiveHighlights[player] = nil
    end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "DamageHighlight"
    highlight.FillColor = Color3.fromRGB(255, 50, 50)
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = Color3.fromRGB(255, 100, 100)
    highlight.OutlineTransparency = 0.3
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = player.Character
    
    ActiveHighlights[player] = highlight
    
    TweenService:Create(highlight, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        FillTransparency = 1,
        OutlineTransparency = 1
    }):Play()
    
    task.wait(0.3)
    pcall(function() highlight:Destroy() end)
    ActiveHighlights[player] = nil
    IsFlashing[player] = nil
end

local function SetupDamageDetection()
    local function trackHumanoid(humanoid, player)
        local lastHealth = humanoid.Health
        
        humanoid.HealthChanged:Connect(function(newHealth)
            if not DamageHighlightActive then return end
            if newHealth < lastHealth then
                FlashPlayer(player)
            end
            lastHealth = newHealth
        end)
    end
    
    local function setupPlayer(player)
        if player == LocalPlayer then return end
        
        local function onCharacterAdded(character)
            local humanoid = character:WaitForChild("Humanoid", 5)
            if humanoid then
                trackHumanoid(humanoid, player)
            end
        end
        
        if player.Character then
            onCharacterAdded(player.Character)
        end
        player.CharacterAdded:Connect(onCharacterAdded)
    end
    
    for _, player in ipairs(Players:GetPlayers()) do
        setupPlayer(player)
    end
    
    Players.PlayerAdded:Connect(setupPlayer)
end

local DamageButton = Instance.new("TextButton")
DamageButton.Size = UDim2.new(0.9, 0, 0, 32)
DamageButton.Position = UDim2.new(0.05, 0, 0.11, 0)
DamageButton.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
DamageButton.BackgroundTransparency = 0.2
DamageButton.BorderSizePixel = 0
DamageButton.Text = "💀 DAMAGE HL [OFF]"
DamageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DamageButton.Font = Enum.Font.GothamBold
DamageButton.TextSize = 12
DamageButton.Parent = GraphicsTab

local DamageButtonCorner = Instance.new("UICorner")
DamageButtonCorner.CornerRadius = UDim.new(0, 6)
DamageButtonCorner.Parent = DamageButton

local function ToggleDamageHighlight()
    DamageHighlightActive = not DamageHighlightActive
    
    if DamageHighlightActive then
        DamageButton.Text = "💀 DAMAGE HL [ON]"
        TweenService:Create(DamageButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(80, 50, 50),
            BackgroundTransparency = 0.1
        }):Play()
        notify("Damage Highlight", "ENABLED - Instant flash")
    else
        DamageButton.Text = "💀 DAMAGE HL [OFF]"
        TweenService:Create(DamageButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(55, 55, 65),
            BackgroundTransparency = 0.2
        }):Play()
        for player, highlight in pairs(ActiveHighlights) do
            pcall(function() highlight:Destroy() end)
        end
        ActiveHighlights = {}
        IsFlashing = {}
        notify("Damage Highlight", "DISABLED")
    end
end

DamageButton.MouseEnter:Connect(function()
    TweenService:Create(DamageButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.05,
        Size = UDim2.new(0.92, 0, 0, 34)
    }):Play()
end)

DamageButton.MouseLeave:Connect(function()
    TweenService:Create(DamageButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.2,
        Size = UDim2.new(0.9, 0, 0, 32)
    }):Play()
end)

DamageButton.MouseButton1Click:Connect(ToggleDamageHighlight)

SetupDamageDetection()

-- ============ SKYBOX SYSTEM (ONLY CLOUDS REMOVED) ============
local function RemoveCloudsOnly()
    pcall(function()
        local lighting = game:GetService("Lighting")
        
        if lighting:FindFirstChild("Clouds") then
            lighting.Clouds:Destroy()
        end
        
        if sethiddenproperty then
            sethiddenproperty(lighting, "CloudsEnabled", false)
        end
        
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name and (obj.Name:lower():find("cloud") or obj.Name:lower():find("облак")) then
                if not obj:IsA("Atmosphere") then
                    pcall(function() obj:Destroy() end)
                end
            end
            if obj:IsA("ParticleEmitter") and obj.Name:lower():find("cloud") then
                pcall(function() obj:Destroy() end)
            end
        end
    end)
end

local Skyboxes = {
    {
        Name = "🌌 PURPLE",
        Assets = {
            SkyboxBk = "rbxassetid://16553658937",
            SkyboxDn = "rbxassetid://16553660713",
            SkyboxFt = "rbxassetid://16553662144",
            SkyboxLf = "rbxassetid://16553664042",
            SkyboxRt = "rbxassetid://16553665766",
            SkyboxUp = "rbxassetid://16553667750"
        }
    },
    {
        Name = "🌫️ GRAY",
        Assets = {
            SkyboxBk = "rbxassetid://2350402582",
            SkyboxDn = "rbxassetid://2350402582",
            SkyboxFt = "rbxassetid://2350402582",
            SkyboxLf = "rbxassetid://2350402582",
            SkyboxRt = "rbxassetid://2350402582",
            SkyboxUp = "rbxassetid://2350402582"
        }
    },
    {
        Name = "🌍 REALISTIC",
        Assets = {
            SkyboxBk = "rbxassetid://6770309844",
            SkyboxDn = "rbxassetid://6770307217",
            SkyboxFt = "rbxassetid://6770309172",
            SkyboxLf = "rbxassetid://6770308637",
            SkyboxRt = "rbxassetid://6770306522",
            SkyboxUp = "rbxassetid://88955670983612"
        }
    },
    {
        Name = "🌙 ANIME",
        Assets = {
            SkyboxBk = "rbxassetid://13107325341",
            SkyboxDn = "rbxassetid://13107329809",
            SkyboxFt = "rbxassetid://13107334845",
            SkyboxLf = "rbxassetid://13107337703",
            SkyboxRt = "rbxassetid://13107340396",
            SkyboxUp = "rbxassetid://13107344387"
        }
    },
    {
        Name = "🌙 NIGHTLY",
        Assets = {
            SkyboxBk = "rbxassetid://17334213726",
            SkyboxDn = "rbxassetid://17334213726",
            SkyboxFt = "rbxassetid://17334213726",
            SkyboxLf = "rbxassetid://17334213726",
            SkyboxRt = "rbxassetid://17334213726",
            SkyboxUp = "rbxassetid://17334213726"
        }
    }
}

local function ChangeSkybox(skyboxData)
    pcall(function()
        local lighting = game:GetService("Lighting")
        
        local oldSky = lighting:FindFirstChild("Sky")
        if oldSky then
            oldSky:Destroy()
        end
        
        local newSky = Instance.new("Sky")
        newSky.SkyboxBk = skyboxData.Assets.SkyboxBk
        newSky.SkyboxDn = skyboxData.Assets.SkyboxDn
        newSky.SkyboxFt = skyboxData.Assets.SkyboxFt
        newSky.SkyboxLf = skyboxData.Assets.SkyboxLf
        newSky.SkyboxRt = skyboxData.Assets.SkyboxRt
        newSky.SkyboxUp = skyboxData.Assets.SkyboxUp
        newSky.Parent = lighting
        
        RemoveCloudsOnly()
        
        notify("Skybox", skyboxData.Name .. " ✓")
    end)
end

local SkyboxTrigger = Instance.new("TextButton")
SkyboxTrigger.Size = UDim2.new(0.9, 0, 0, 30)
SkyboxTrigger.Position = UDim2.new(0.05, 0, 0.17, 0)
SkyboxTrigger.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
SkyboxTrigger.BackgroundTransparency = 0.2
SkyboxTrigger.BorderSizePixel = 0
SkyboxTrigger.Text = "🎨 SKYBOX +"
SkyboxTrigger.TextColor3 = Color3.fromRGB(255, 255, 255)
SkyboxTrigger.Font = Enum.Font.GothamBold
SkyboxTrigger.TextSize = 12
SkyboxTrigger.Parent = GraphicsTab

local SkyboxCorner = Instance.new("UICorner")
SkyboxCorner.CornerRadius = UDim.new(0, 6)
SkyboxCorner.Parent = SkyboxTrigger

local DropdownContainer = Instance.new("Frame")
DropdownContainer.Size = UDim2.new(0.9, 0, 0, 0)
DropdownContainer.Position = UDim2.new(0.05, 0, 0.23, 0)
DropdownContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
DropdownContainer.BackgroundTransparency = 0.1
DropdownContainer.BorderSizePixel = 0
DropdownContainer.Visible = false
DropdownContainer.ClipsDescendants = true
DropdownContainer.Parent = GraphicsTab

local DropdownCorner = Instance.new("UICorner")
DropdownCorner.CornerRadius = UDim.new(0, 6)
DropdownCorner.Parent = DropdownContainer

local DropdownStroke = Instance.new("UIStroke")
DropdownStroke.Thickness = 1
DropdownStroke.Color = Color3.fromRGB(60, 60, 65)
DropdownStroke.Transparency = 0.4
DropdownStroke.Parent = DropdownContainer

local function AnimateDropdown(open)
    if open then
        DropdownContainer.Visible = true
        local targetHeight = #Skyboxes * 33 + 10
        TweenService:Create(DropdownContainer, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0.9, 0, 0, targetHeight)
        }):Play()
    else
        TweenService:Create(DropdownContainer, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = UDim2.new(0.9, 0, 0, 0)
        }):Play()
        task.wait(0.2)
        DropdownContainer.Visible = false
    end
end

local dropdownButtons = {}
local function CreateDropdownButtons()
    for _, btn in pairs(dropdownButtons) do
        pcall(function() btn:Destroy() end)
    end
    dropdownButtons = {}
    
    local yOffset = 6
    for i, skybox in ipairs(Skyboxes) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -12, 0, 28)
        btn.Position = UDim2.new(0, 6, 0, yOffset)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        btn.BackgroundTransparency = 0.2
        btn.BorderSizePixel = 0
        btn.Text = skybox.Name
        btn.TextColor3 = Color3.fromRGB(210, 210, 230)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 11
        btn.Parent = DropdownContainer
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 4)
        btnCorner.Parent = btn
        
        local isHovering = false
        btn.MouseEnter:Connect(function()
            if not isHovering then
                isHovering = true
                btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
                btn.BackgroundTransparency = 0.1
            end
        end)
        
        btn.MouseLeave:Connect(function()
            if isHovering then
                isHovering = false
                btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
                btn.BackgroundTransparency = 0.2
            end
        end)
        
        btn.MouseButton1Click:Connect(function()
            ChangeSkybox(skybox)
            
            local flash = Instance.new("Frame")
            flash.Size = UDim2.new(1, 0, 1, 0)
            flash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            flash.BackgroundTransparency = 0.6
            flash.BorderSizePixel = 0
            flash.Parent = btn
            local flashCorner = Instance.new("UICorner")
            flashCorner.CornerRadius = UDim.new(0, 4)
            flashCorner.Parent = flash
            task.wait(0.15)
            flash:Destroy()
            
            dropdownOpen = false
            AnimateDropdown(false)
            SkyboxTrigger.Text = "🎨 SKYBOX +"
        end)
        
        table.insert(dropdownButtons, btn)
        yOffset = yOffset + 33
    end
end

local dropdownOpen = false
SkyboxTrigger.MouseButton1Click:Connect(function()
    dropdownOpen = not dropdownOpen
    AnimateDropdown(dropdownOpen)
    SkyboxTrigger.Text = dropdownOpen and "🎨 SKYBOX -" or "🎨 SKYBOX +"
end)

SkyboxTrigger.MouseEnter:Connect(function()
    SkyboxTrigger.BackgroundColor3 = Color3.fromRGB(70, 70, 85)
    SkyboxTrigger.BackgroundTransparency = 0.1
end)

SkyboxTrigger.MouseLeave:Connect(function()
    SkyboxTrigger.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    SkyboxTrigger.BackgroundTransparency = 0.2
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if dropdownOpen and not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
        task.wait(0.05)
        local mousePos = UserInputService:GetMouseLocation()
        local btnPos = SkyboxTrigger.AbsolutePosition
        local btnSize = SkyboxTrigger.AbsoluteSize
        local ddPos = DropdownContainer.AbsolutePosition
        local ddSize = DropdownContainer.AbsoluteSize
        
        local clickedOnButton = (mousePos.X >= btnPos.X and mousePos.X <= btnPos.X + btnSize.X and
                                 mousePos.Y >= btnPos.Y and mousePos.Y <= btnPos.Y + btnSize.Y)
        local clickedOnDropdown = (ddPos and mousePos.X >= ddPos.X and mousePos.X <= ddPos.X + ddSize.X and
                                   mousePos.Y >= ddPos.Y and mousePos.Y <= ddPos.Y + ddSize.Y)
        
        if not clickedOnButton and not clickedOnDropdown then
            dropdownOpen = false
            AnimateDropdown(false)
            SkyboxTrigger.Text = "🎨 SKYBOX +"
        end
    end
end)

CreateDropdownButtons()
RemoveCloudsOnly()

-- ============ TELEPORT TAB ============
local TeleportTpButton = Instance.new("TextButton")
TeleportTpButton.Size = UDim2.new(0.9, 0, 0, 42)
TeleportTpButton.Position = UDim2.new(0.05, 0, 0.02, 0)
TeleportTpButton.BackgroundColor3 = Color3.fromRGB(40, 55, 70)
TeleportTpButton.BackgroundTransparency = 0.2
TeleportTpButton.BorderSizePixel = 0
TeleportTpButton.Text = "🔮 CLICK TP"
TeleportTpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportTpButton.Font = Enum.Font.GothamBold
TeleportTpButton.TextSize = 14
TeleportTpButton.Parent = TeleportTab

local TeleportTpCorner = Instance.new("UICorner")
TeleportTpCorner.CornerRadius = UDim.new(0, 10)
TeleportTpCorner.Parent = TeleportTpButton

local TpButton = TeleportTpButton

TeleportTpButton.MouseButton1Click:Connect(ToggleTpTool)
ApplyButtonAnimation(TeleportTpButton, Color3.fromRGB(25, 40, 55), 0.05)

-- ============ ДОБАВЛЯЕМ НАДПИСЬ В TELEPORT TAB ============
local ComingSoonLabel = Instance.new("TextLabel")
ComingSoonLabel.Size = UDim2.new(0.9, 0, 0, 40)
ComingSoonLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
ComingSoonLabel.BackgroundTransparency = 1
ComingSoonLabel.Text = "✨ More teleport features coming soon!\n👀 Stay tuned for updates..."
ComingSoonLabel.TextColor3 = Color3.fromRGB(180, 180, 220)
ComingSoonLabel.Font = Enum.Font.Gotham
ComingSoonLabel.TextSize = 12
ComingSoonLabel.TextXAlignment = Enum.TextXAlignment.Center
ComingSoonLabel.TextYAlignment = Enum.TextYAlignment.Center
ComingSoonLabel.Parent = TeleportTab

-- Добавляем легкую анимацию пульсации для надписи
task.spawn(function()
    while true do
        TweenService:Create(ComingSoonLabel, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            TextColor3 = Color3.fromRGB(220, 220, 255)
        }):Play()
        task.wait(2)
        TweenService:Create(ComingSoonLabel, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            TextColor3 = Color3.fromRGB(160, 160, 200)
        }):Play()
        task.wait(2)
    end
end)

-- ============ EXTRA TAB ============
-- Исправленная анимация для кнопок в Extra Tab
local function StyleExtraButtonImproved(button, hoverColor, hoverTrans)
    local originalColor = button.BackgroundColor3
    local originalTrans = button.BackgroundTransparency
    local originalSize = button.Size
    
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = hoverColor or Color3.fromRGB(85, 85, 105),
            BackgroundTransparency = hoverTrans or 0.1,
            Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, originalSize.Y.Scale, originalSize.Y.Offset + 3)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = originalColor,
            BackgroundTransparency = originalTrans,
            Size = originalSize
        }):Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        local flashFrame = Instance.new("Frame")
        flashFrame.Size = UDim2.new(1, 0, 1, 0)
        flashFrame.Position = UDim2.new(0, 0, 0, 0)
        flashFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        flashFrame.BackgroundTransparency = 0.7
        flashFrame.BorderSizePixel = 0
        flashFrame.ZIndex = 10
        flashFrame.Parent = button
        
        local buttonCorner = button:FindFirstChildWhichIsA("UICorner")
        local flashCorner = Instance.new("UICorner")
        if buttonCorner then
            flashCorner.CornerRadius = buttonCorner.CornerRadius
        else
            flashCorner.CornerRadius = UDim.new(0, 10)
        end
        flashCorner.Parent = flashFrame
        
        TweenService:Create(flashFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1
        }):Play()
        
        task.wait(0.3)
        flashFrame:Destroy()
    end)
end

-- Jerk Mode Button (исправленный)
local ExtraJerkButton = Instance.new("TextButton")
ExtraJerkButton.Size = UDim2.new(0.9, 0, 0, 42)
ExtraJerkButton.Position = UDim2.new(0.05, 0, 0.02, 0)
ExtraJerkButton.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
ExtraJerkButton.BackgroundTransparency = 0.2
ExtraJerkButton.BorderSizePixel = 0
ExtraJerkButton.Text = "💦 JERK MODE"
ExtraJerkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExtraJerkButton.Font = Enum.Font.GothamBold
ExtraJerkButton.TextSize = 13
ExtraJerkButton.Parent = ExtraTab

local ExtraJerkCorner = Instance.new("UICorner")
ExtraJerkCorner.CornerRadius = UDim.new(0, 10)
ExtraJerkCorner.Parent = ExtraJerkButton

local ExtraJerkStroke = Instance.new("UIStroke")
ExtraJerkStroke.Thickness = 1
ExtraJerkStroke.Color = Color3.fromRGB(130, 100, 160)
ExtraJerkStroke.Transparency = 0.4
ExtraJerkStroke.Parent = ExtraJerkButton

StyleExtraButtonImproved(ExtraJerkButton, Color3.fromRGB(85, 85, 110), 0.05)

ExtraJerkButton.MouseButton1Click:Connect(function()
    if JerkActive then 
        StopJerk()
        ExtraJerkButton.Text = "💦 JERK MODE"
        TweenService:Create(ExtraJerkButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(55, 55, 65),
            BackgroundTransparency = 0.2
        }):Play()
        notify("Jerk", "Jerk mode DISABLED")
    else 
        StartJerk()
        ExtraJerkButton.Text = "💦 JERK MODE [ON]"
        TweenService:Create(ExtraJerkButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(70, 120, 70),
            BackgroundTransparency = 0.1
        }):Play()
    end
end)

-- Infinite Yield Button (исправленный)
local IYButton = Instance.new("TextButton")
IYButton.Size = UDim2.new(0.9, 0, 0, 42)
IYButton.Position = UDim2.new(0.05, 0, 0.1, 0)
IYButton.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
IYButton.BackgroundTransparency = 0.2
IYButton.BorderSizePixel = 0
IYButton.Text = "♾️ INFINITE YIELD"
IYButton.TextColor3 = Color3.fromRGB(255, 255, 255)
IYButton.Font = Enum.Font.GothamBold
IYButton.TextSize = 13
IYButton.Parent = ExtraTab

local IYCorner = Instance.new("UICorner")
IYCorner.CornerRadius = UDim.new(0, 10)
IYCorner.Parent = IYButton

local IYStroke = Instance.new("UIStroke")
IYStroke.Thickness = 1
IYStroke.Color = Color3.fromRGB(130, 100, 160)
IYStroke.Transparency = 0.4
IYStroke.Enabled = true
IYStroke.Parent = IYButton

local function RunInfiniteYield()
    task.spawn(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end)
        if success then
            notify("Infinite Yield", "Loaded successfully!")
            TweenService:Create(IYButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                BackgroundColor3 = Color3.fromRGB(70, 120, 70),
                BackgroundTransparency = 0.1
            }):Play()
            task.wait(0.8)
            TweenService:Create(IYButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                BackgroundColor3 = Color3.fromRGB(55, 55, 65),
                BackgroundTransparency = 0.2
            }):Play()
        else
            notify("Infinite Yield", "Error: " .. tostring(err))
        end
    end)
end

StyleExtraButtonImproved(IYButton, Color3.fromRGB(85, 85, 110), 0.05)
IYButton.MouseButton1Click:Connect(RunInfiniteYield)

-- ============ FLING ON KEY "E" ============
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.E then
        if not FlingActive then
            StartFlinging()
            print("[Fling] Started by pressing E!")
        else
            print("[Fling] Already flinging! Press STOP first or close GUI")
        end
    end
end)

-- ============ ПОДКЛЮЧАЕМ КНОПКИ ВКЛАДОК К НОВОЙ АНИМАЦИИ ============
Tab1Button.MouseButton1Click:Connect(function() SwitchTabWithAnimation("fling") end)
Tab2Button.MouseButton1Click:Connect(function() SwitchTabWithAnimation("teleport") end)
Tab3Button.MouseButton1Click:Connect(function() SwitchTabWithAnimation("graphics") end)
Tab4Button.MouseButton1Click:Connect(function() SwitchTabWithAnimation("extra") end)

-- ============ CLEANUP ============
CloseButton.MouseButton1Click:Connect(function()
    StopFlinging()
    StopJerk()
    RemoveTpTool()
    if antiFlingConnection1 then antiFlingConnection1:Disconnect() end
    if LocalAntiFlingConnection then LocalAntiFlingConnection:Disconnect() end
    for plr, data in pairs(AntiFlingDetection) do if data.Connection then data.Connection:Disconnect() end end
    for player, highlight in pairs(ActiveHighlights) do
        if highlight and highlight.Gui then
            pcall(function() highlight.Gui:Destroy() end)
        end
    end
    ScreenGui:Destroy()
end)

Players.PlayerAdded:Connect(RefreshPlayerList)
Players.PlayerRemoving:Connect(function(plr)
    if SelectedTargets[plr.Name] then SelectedTargets[plr.Name] = nil end
    if ActiveHighlights[plr] then
        pcall(function() ActiveHighlights[plr].Gui:Destroy() end)
        ActiveHighlights[plr] = nil
    end
    RefreshPlayerList()
    UpdateStatus()
end)

RefreshPlayerList()
UpdateStatus()
notify("Fling System", "Loaded! Everything works | Press E to FLING")

print("[Fling System] COMPLETE - All features working! | Press E to start flinging")
