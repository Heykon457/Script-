Jogadores locais = jogo:ObterServiço("Jogadores")
local LocalPlayer = Players.LocalPlayer
Câmera local = espaço de trabalho.CâmeraAtual
local RunService = jogo:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local AimbotEnabled = false
local ESPEnabled = false
-- ==================== SOM ====================
função local PlaySound(abrir)
	som local = Instância.novo("Som")
	sound.SoundId = aberto e "rbxassetid://131057517" ou "rbxassetid://131057499"
	Volume do som = 0,7
	som.Pai = Serviço de Som
	som:Reproduzir()
	jogo.Detritos:AdicionarItem(som, 3)
fim
-- ==================== INTRODUÇÃO ====================
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
TítuloIntro.Position = UDim2.new(0.1,0,0.35,0)
TítuloIntro.BackgroundTransparency = 1
TítuloIntro.Texto = "ARSENAL SC"
TitleIntro.TextColor3 = Color3.fromRGB(255, 0, 80)
TítuloIntro.TextoEscalado = verdadeiro
TítuloIntro.Fonte = Enum.Fonte.GothamBlack
TitleIntro.Parent = IntroFrame
local Subtitle = Instance.new("TextLabel")
Legenda.Tamanho = UDim2.new(0.5,0,0.08,0)
Subtitle.Position = UDim2.new(0.25,0,0.55,0)
Legenda.TransparênciaDeFundo = 1
Subtitle.Text = "Carregando script..."
Subtítulo.TextColor3 = Color3.fromRGB(200.200.200)
Legenda.TextoEscalado = verdadeiro
Legenda.Fonte = Enum.Fonte.Gotham
Legenda.Pai = IntroFrame
TweenService:Create(IntroFrame, TweenInfo.new(0.8), {BackgroundTransparency = 0.15}):Play()
aguarde(0,5)
TweenService:Create(TitleIntro, TweenInfo.new(0.9), {TextTransparency = 0}):Play()
aguarde(0.6)
TweenService:Create(Subtitle, TweenInfo.new(0.7), {TextTransparency = 0}):Play()
aguarde(1.8)
IntroFrame:Destruir()
-- ==================== LOGOTIPO "SC" ====================
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
LogoButton.MouseEnter:Conectar(function()
	TweenService:Create(LogoButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 105, 0, 105)}):Play()
fim)
LogoButton.MouseLeave:Connect(function()
	TweenService:Create(LogoButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 90, 0, 90)}):Play()
fim)
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
Título.Tamanho = UDim2.novo(1, 0, 0, 65)
Título.CorDeFundo3 = Cor3.fromRGB(255, 0, 80)
Título.Texto = "ARSENAL SC"
... (134 linhas)
