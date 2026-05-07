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
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBlack
Title.Parent = MainFrame

-- Função de Toggle Corrigida
local function CreateProToggle(initialText, y, variableRef, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.88, 0, 0, 55)
	btn.Position = UDim2.new(0.06, 0, 0, y)
	btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	btn.Text = initialText
	btn.TextColor3 = Color3.new(1,1,1)
	btn.TextScaled = true
	btn.Font = Enum.Font.GothamSemibold
	btn.Parent = MainFrame
	
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
	Instance.new("UIStroke", btn).Color = Color3.fromRGB(255, 0, 80)
	
	btn.MouseButton1Click:Connect(function()
		variableRef[1] = not variableRef[1]  -- Atualiza a variável
		callback(variableRef[1])
		btn.Text = initialText:gsub("OFF", variableRef[1] and "ON ✅" or "OFF ❌")
	end)
	
	return btn
end

-- Usando referência para atualizar corretamente
local aimRef = {AimbotEnabled}
local espRef = {ESPEnabled}

local aimBtn = CreateProToggle("Aimbot: OFF", 85, aimRef, function(state)
	AimbotEnabled = state
end)

local espBtn = CreateProToggle("ESP: OFF", 155, espRef, function(state)
	ESPEnabled = state
end)

local closeBtn = CreateProToggle("FECHAR MENU", 225, {false}, function()
	MainFrame.Visible = false
	PlaySound(false)
end)

-- Clique na Logo
LogoButton.MouseButton1Click:Connect(function()
	local isOpening = not MainFrame.Visible
	MainFrame.Visible = isOpening
	PlaySound(isOpening)
end)

print("✅ Arsenal SC carregado!")
print("Clique na logo 'SC' para abrir o menu")

-- ==================== ESP + AIMBOT ====================
local ESPObjects = {}

local function CreateESP(plr)
	if plr == LocalPlayer or ESPObjects[plr] then return end
	local box = Drawing.new("Square")
	box.Thickness = 2.8
	box.Filled = false
	box.Color = Color3.fromRGB(255, 0, 80)
	box.Transparency = 1
	ESPObjects[plr] = box
end

local function UpdateESP()
	for plr, box in pairs(ESPObjects) do
		local char = plr.Character
		if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Head") and ESPEnabled then
			if plr.Team == LocalPlayer.Team then box.Visible = false continue end
			local rootPos, onScreen = Camera:WorldToViewportPoint(char.HumanoidRootPart.Position)
			if onScreen then
				local head = char.Head
				local top = Camera:WorldToViewportPoint(head.Position + Vector3.new(0,1,0))
				local bottom = Camera:WorldToViewportPoint(char.HumanoidRootPart.Position - Vector3.new(0,3,0))
				local height = bottom.Y - top.Y
				box.Size = Vector2.new(height/2, height)
				box.Position = Vector2.new(rootPos.X - box.Size.X/2, top.Y)
				box.Visible = true
			else
				box.Visible = false
			end
		else
			box.Visible = false
		end
	end
end

for _, plr in ipairs(Players:GetPlayers()) do CreateESP(plr) end
Players.PlayerAdded:Connect(CreateESP)

local function IsVisible(target)
	local origin = Camera.CFrame.Position
	local direction = (target.Position - origin)
	local ray = Ray.new(origin, direction.Unit * 500)
	local hit = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character})
	return hit == nil or hit:IsDescendantOf(target.Parent)
end

RunService.RenderStepped:Connect(function()
	UpdateESP()
	
	if not AimbotEnabled then return end
	
	local closest = nil
	local shortest = 9999
	
	for _, player in ipairs(Players:GetPlayers()) do
		if player == LocalPlayer or not player.Character or not player.Character:FindFirstChild("Head") then continue end
		if player.Team == LocalPlayer.Team then continue end
		
		local head = player.Character.Head
		if not IsVisible(head) then continue end
		
		local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
		if onScreen then
			local mousePos = UserInputService:GetMouseLocation()
			local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
			if dist < shortest then
				shortest = dist
				closest = head
			end
		end
	end
	
	if closest then
		local targetCFrame = CFrame.lookAt(Camera.CFrame.Position, closest.Position)
		Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, 0.17)
	end
end)
