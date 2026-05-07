local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

local AimbotEnabled = false
local ESPEnabled = false

-- ==================== SOM ====================
local function PlaySound(open)
	local sound = Instance.new("Sound")
	sound.SoundId = open and "rbxassetid://131057517" or "rbxassetid://131057499"
	sound.Volume = 0.7
	sound.Parent = SoundService
	sound:Play()
	game.Debris:AddItem(sound, 3)
end

-- ==================== INTRO ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local IntroFrame = Instance.new("Frame")
IntroFrame.Size = UDim2.new(1,0,1,0)
IntroFrame.BackgroundColor3 = Color3.fromRGB(8,8,8)
IntroFrame.BackgroundTransparency = 1
IntroFrame.Parent = ScreenGui

local TitleIntro = Instance.new("TextLabel")
TitleIntro.Size = UDim2.new(0.8,0,0.25,0)
TitleIntro.Position = UDim2.new(0.1,0,0.35,0)
TitleIntro.BackgroundTransparency = 1
TitleIntro.Text = "ARSENAL SC"
TitleIntro.TextColor3 = Color3.fromRGB(255, 0, 80)
TitleIntro.TextScaled = true
TitleIntro.Font = Enum.Font.GothamBlack
TitleIntro.Parent = IntroFrame

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(0.5,0,0.08,0)
Subtitle.Position = UDim2.new(0.25,0,0.55,0)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Carregando script..."
Subtitle.TextColor3 = Color3.fromRGB(200,200,200)
Subtitle.TextScaled = true
Subtitle.Font = Enum.Font.Gotham
Subtitle.Parent = IntroFrame

TweenService:Create(IntroFrame, TweenInfo.new(0.8), {BackgroundTransparency = 0.15}):Play()
wait(0.5)
TweenService:Create(TitleIntro, TweenInfo.new(0.9), {TextTransparency = 0}):Play()
wait(0.6)
TweenService:Create(Subtitle, TweenInfo.new(0.7), {TextTransparency = 0}):Play()
wait(1.8)
IntroFrame:Destroy()

-- ==================== LOGO "SC" ====================
local LogoButton = Instance.new("TextButton")
LogoButton.Size = UDim2.new(0, 90, 0, 90)
LogoButton.Position = UDim2.new(0, 20, 0.4, 0)
LogoButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
LogoButton.Text = "SC"
LogoButton.TextColor3 = Color3.fromRGB(255, 0, 80)
LogoButton.TextScaled = true
LogoButton.Font = Enum.Font.GothamBlack
LogoButton.Parent = ScreenGui

Instance.new("UICorner", LogoButton).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", LogoButton).Color = Color3.fromRGB(255, 0, 80)
Instance.new("UIStroke", LogoButton).Thickness = 3.5

TweenService:Create(LogoButton, TweenInfo.new(3.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), 
{Position = UDim2.new(0, 20, 0.36, 0)}):Play()

LogoButton.MouseEnter:Connect(function()
	TweenService:Create(LogoButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 105, 0, 105)}):Play()
end)
LogoButton.MouseLeave:Connect(function()
	TweenService:Create(LogoButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 90, 0, 90)}):Play()
end)

-- ==================== MENU ====================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 380, 0, 340)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(255, 0, 80)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 65)
Title.BackgroundColor3 = Color3.fromRGB(255, 0, 80)
Title.Text = "ARSENAL SC"
... (134 linhas)
