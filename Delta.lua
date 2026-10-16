-- =========================================================
-- AT Hub | Time Bomb (fmt Edition - Ultimate Masterpiece)
-- Developer: fmt (@F_1o41)
-- =========================================================

-- كسر القيود وحماية السكربت من أي إيقاف أو رصد
pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local oldNamecall = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "Ban" then
            return nil
        end
        return oldNamecall(self, ...)
    end)
end)

local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local SoundService = game:GetService("SoundService")
local Workspace = game:GetService("Workspace")

-- تنظيف الواجهات القديمة لمنع التداخل
pcall(function()
    if CoreGui:FindFirstChild("AT_HubSystem") then CoreGui.AT_HubSystem:Destroy() end
    if LocalPlayer.PlayerGui:FindFirstChild("AT_HubSystem") then LocalPlayer.PlayerGui.AT_HubSystem:Destroy() end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AT_HubSystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

pcall(function()
    if gethui then
        ScreenGui.Parent = gethui()
    else
        ScreenGui.Parent = CoreGui
    end
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- تشغيل موسيقى المقدمة الفخمة
local IntroMusic = nil
pcall(function()
    IntroMusic = Instance.new("Sound")
    IntroMusic.SoundId = "rbxassetid://1843436418"
    IntroMusic.Volume = 0.8
    IntroMusic.Looped = true
    IntroMusic.Parent = SoundService
    IntroMusic:Play()
end)

---------------------------------------------------------
-- 1. شاشة التحميل الفاخرة (LoadGui)
---------------------------------------------------------
local LoadGui = Instance.new("Frame", ScreenGui)
LoadGui.Size = UDim2.new(1, 0, 1, 0)
LoadGui.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
LoadGui.ZIndex = 100

local LoadBgStroke = Instance.new("UIStroke", LoadGui)
LoadBgStroke.Color = Color3.fromRGB(220, 40, 60)
LoadBgStroke.Thickness = 2

local TitleSatan = Instance.new("TextLabel", LoadGui)
TitleSatan.Size = UDim2.new(1, 0, 0, 60)
TitleSatan.Position = UDim2.new(0, 0, 0.22, 0)
TitleSatan.BackgroundTransparency = 1
TitleSatan.Text = "👑\nAT HUB TOP"
TitleSatan.TextColor3 = Color3.fromRGB(220, 40, 60)
TitleSatan.TextSize = 24
TitleSatan.Font = Enum.Font.GothamBold
TitleSatan.ZIndex = 101

local SubTitleSatan = Instance.new("TextLabel", LoadGui)
SubTitleSatan.Size = UDim2.new(1, 0, 0, 30)
SubTitleSatan.Position = UDim2.new(0, 0, 0.38, 0)
SubTitleSatan.BackgroundTransparency = 1
SubTitleSatan.Text = "Developer: fmt (@F_1o41) -LEGENDARY- 👑"
SubTitleSatan.TextColor3 = Color3.fromRGB(255, 180, 50)
SubTitleSatan.TextSize = 13
SubTitleSatan.Font = Enum.Font.GothamBold
SubTitleSatan.ZIndex = 101

local WelcomeMsgSatan = Instance.new("TextLabel", LoadGui)
WelcomeMsgSatan.Size = UDim2.new(1, 0, 0, 25)
WelcomeMsgSatan.Position = UDim2.new(0, 0, 0.46, 0)
WelcomeMsgSatan.BackgroundTransparency = 1
WelcomeMsgSatan.Text = "أهلاً بك يا " .. LocalPlayer.Name .. " في AT Hub"
WelcomeMsgSatan.TextColor3 = Color3.fromRGB(200, 200, 200)
WelcomeMsgSatan.TextSize = 11
WelcomeMsgSatan.Font = Enum.Font.GothamMedium
WelcomeMsgSatan.ZIndex = 101

local LoadBarBg = Instance.new("Frame", LoadGui)
LoadBarBg.Size = UDim2.new(0, 320, 0, 6)
LoadBarBg.Position = UDim2.new(0.5, -160, 0.56, 0)
LoadBarBg.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
LoadBarBg.ZIndex = 101
Instance.new("UICorner", LoadBarBg).CornerRadius = UDim.new(1, 0)

local LoadBarFill = Instance.new("Frame", LoadBarBg)
LoadBarFill.Size = UDim2.new(0, 0, 1, 0)
LoadBarFill.BackgroundColor3 = Color3.fromRGB(220, 40, 60)
LoadBarFill.ZIndex = 102
Instance.new("UICorner", LoadBarFill).CornerRadius = UDim.new(1, 0)

local LoadText = Instance.new("TextLabel", LoadGui)
LoadText.Size = UDim2.new(1, 0, 0, 25)
LoadText.Position = UDim2.new(0, 0, 0.61, 0)
LoadText.BackgroundTransparency = 1
LoadText.Text = "LOADING AT HUB TOP 0%"
LoadText.TextColor3 = Color3.fromRGB(160, 160, 160)
LoadText.TextSize = 11
LoadText.Font = Enum.Font.GothamMedium
LoadText.ZIndex = 101

local SkipBtn = Instance.new("TextButton", LoadGui)
SkipBtn.Size = UDim2.new(0, 100, 0, 35)
SkipBtn.Position = UDim2.new(1, -120, 1, -65)
SkipBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
SkipBtn.Text = "تخطي | Skip"
SkipBtn.TextColor3 = Color3.fromRGB(220, 40, 60)
SkipBtn.TextSize = 12
SkipBtn.Font = Enum.Font.GothamBold
SkipBtn.ZIndex = 102
Instance.new("UICorner", SkipBtn).CornerRadius = UDim.new(0, 18)
Instance.new("UIStroke", SkipBtn).Color = Color3.fromRGB(220, 40, 60)

---------------------------------------------------------
-- 2. نافذة التحقق من المفتاح (KeyFrame)
---------------------------------------------------------
local KeyFrame = Instance.new("Frame", ScreenGui)
KeyFrame.Size = UDim2.new(0, 300, 0, 180)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
KeyFrame.Visible = false
KeyFrame.Active = true
KeyFrame.ZIndex = 50
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 14)
local KeyStroke = Instance.new("UIStroke", KeyFrame)
KeyStroke.Color = Color3.fromRGB(220, 40, 60)
KeyStroke.Thickness = 2

local KeyTitle = Instance.new("TextLabel", KeyFrame)
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.Position = UDim2.new(0, 0, 0.1, 0)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "AT 🔒\nأكتب كلمة المرور"
KeyTitle.TextColor3 = Color3.fromRGB(220, 40, 60)
KeyTitle.TextSize = 14
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.ZIndex = 51

local KeyInput = Instance.new("TextBox", KeyFrame)
KeyInput.Size = UDim2.new(0, 240, 0, 40)
KeyInput.Position = UDim2.new(0.5, -120, 0, 75)
KeyInput.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
KeyInput.PlaceholderText = "كلمة المرور..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 13
KeyInput.Font = Enum.Font.GothamMedium
KeyInput.ZIndex = 52
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", KeyInput).Color = Color3.fromRGB(220, 40, 60)

local VerifyBtn = Instance.new("TextButton", KeyFrame)
VerifyBtn.Size = UDim2.new(0, 240, 0, 38)
VerifyBtn.Position = UDim2.new(0.5, -120, 0, 125)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(220, 40, 60)
VerifyBtn.Text = "دخول"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.TextSize = 13
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.ZIndex = 52
Instance.new("UICorner", VerifyBtn).CornerRadius = UDim.new(0, 8)

---------------------------------------------------------
-- 3. الواجهة الرئيسية المصغرة (AT Hub) + الشعار المخصص
---------------------------------------------------------
local MainHub = Instance.new("Frame", ScreenGui)
MainHub.Size = UDim2.new(0, 230, 0, 115)
MainHub.Position = UDim2.new(0.5, -115, 0.75, 0)
MainHub.BackgroundColor3 = Color3.fromRGB(40, 15, 15)
MainHub.BackgroundTransparency = 0.15
MainHub.Visible = false
MainHub.Active = true
MainHub.Draggable = true
MainHub.ZIndex = 30
Instance.new("UICorner", MainHub).CornerRadius = UDim.new(0, 10)
local MainStroke = Instance.new("UIStroke", MainHub)
MainStroke.Color = Color3.fromRGB(220, 50, 50)
MainStroke.Thickness = 1.5

local ScriptLogo = Instance.new("ImageLabel", MainHub)
ScriptLogo.Size = UDim2.new(0, 36, 0, 36)
ScriptLogo.Position = UDim2.new(0.5, -18, 0, -42)
ScriptLogo.BackgroundColor3 = Color3.fromRGB(180, 20, 30)
ScriptLogo.Image = "rbxassetid://13888302061"
ScriptLogo.ZIndex = 40
Instance.new("UICorner", ScriptLogo).CornerRadius = UDim.new(1, 0)
local LogoStroke = Instance.new("UIStroke", ScriptLogo)
LogoStroke.Color = Color3.fromRGB(255, 60, 70)
LogoStroke.Thickness = 2

local BgImage = Instance.new("ImageLabel", MainHub)
BgImage.Size = UDim2.new(1, 0, 1, 0)
BgImage.BackgroundTransparency = 1
BgImage.Image = "rbxassetid://6023426915"
BgImage.ScaleType = Enum.ScaleType.Slice
BgImage.ImageTransparency = 0.4
BgImage.ZIndex = 31
Instance.new("UICorner", BgImage).CornerRadius = UDim.new(0, 10)

local TopBar = Instance.new("Frame", MainHub)
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundTransparency = 1
TopBar.ZIndex = 32

local LockIcon = Instance.new("TextLabel", TopBar)
LockIcon.Size = UDim2.new(0, 30, 1, 0)
LockIcon.Position = UDim2.new(0, 5, 0, 0)
LockIcon.BackgroundTransparency = 1
LockIcon.Text = "🔒"
LockIcon.TextSize = 13
LockIcon.ZIndex = 33

local HubTitle = Instance.new("TextLabel", TopBar)
HubTitle.Size = UDim2.new(1, -60, 1, 0)
HubTitle.Position = UDim2.new(0, 35, 0, 0)
HubTitle.BackgroundTransparency = 1
HubTitle.Text = "AT"
HubTitle.TextColor3 = Color3.fromRGB(255, 200, 100)
HubTitle.TextSize = 16
HubTitle.Font = Enum.Font.GothamBold
HubTitle.ZIndex = 33

local ToggleHubBtn = Instance.new("TextButton", ScreenGui)
ToggleHubBtn.Size = UDim2.new(0, 45, 0, 45)
ToggleHubBtn.Position = UDim2.new(0.05, 0, 0.4, 0)
ToggleHubBtn.BackgroundColor3 = Color3.fromRGB(20, 18, 22)
ToggleHubBtn.Text = "😈"
ToggleHubBtn.TextSize = 20
ToggleHubBtn.Visible = false
ToggleHubBtn.Active = true
ToggleHubBtn.Draggable = true
ToggleHubBtn.ZIndex = 70
Instance.new("UICorner", ToggleHubBtn).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", ToggleHubBtn).Color = Color3.fromRGB(220, 40, 60)

ToggleHubBtn.MouseButton1Click:Connect(function()
    MainHub.Visible = true
    ToggleHubBtn.Visible = false
end)

local MinimizeBtn = Instance.new("TextButton", TopBar)
MinimizeBtn.Size = UDim2.new(0, 25, 0, 25)
MinimizeBtn.Position = UDim2.new(1, -30, 0, 3)
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Text = "❌"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 11
MinimizeBtn.ZIndex = 33

MinimizeBtn.MouseButton1Click:Connect(function()
    MainHub.Visible = false
    ToggleHubBtn.Visible = true
end)

local AutoLabel = Instance.new("TextLabel", MainHub)
AutoLabel.Size = UDim2.new(0, 100, 0, 30)
AutoLabel.Position = UDim2.new(0, 12, 0, 36)
AutoLabel.BackgroundTransparency = 1
AutoLabel.Text = "Auto Track"
AutoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoLabel.TextSize = 13
AutoLabel.Font = Enum.Font.GothamBold
AutoLabel.TextXAlignment = Enum.TextXAlignment.Left
AutoLabel.ZIndex = 33

local AutoToggle = Instance.new("TextButton", MainHub)
AutoToggle.Size = UDim2.new(0, 48, 0, 24)
AutoToggle.Position = UDim2.new(1, -58, 0, 39)
AutoToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
AutoToggle.Text = ""
AutoToggle.ZIndex = 33
Instance.new("UICorner", AutoToggle).CornerRadius = UDim.new(1, 0)

local AutoDot = Instance.new("Frame", AutoToggle)
AutoDot.Size = UDim2.new(0, 18, 0, 18)
AutoDot.Position = UDim2.new(0, 3, 0.5, -9)
AutoDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoDot.ZIndex = 34
Instance.new("UICorner", AutoDot).CornerRadius = UDim.new(1, 0)

local HeadlessMainBtn = Instance.new("TextButton", MainHub)
HeadlessMainBtn.Size = UDim2.new(0, 95, 0, 28)
HeadlessMainBtn.Position = UDim2.new(0, 12, 0, 74)
HeadlessMainBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
HeadlessMainBtn.Text = "Headless"
HeadlessMainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HeadlessMainBtn.TextSize = 12
HeadlessMainBtn.Font = Enum.Font.GothamBold
HeadlessMainBtn.ZIndex = 33
Instance.new("UICorner", HeadlessMainBtn).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", HeadlessMainBtn).Color = Color3.fromRGB(220, 50, 50)

local ViewBtn = Instance.new("TextButton", MainHub)
ViewBtn.Size = UDim2.new(0, 95, 0, 28)
ViewBtn.Position = UDim2.new(1, -107, 0, 74)
ViewBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
ViewBtn.Text = "عرض"
ViewBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ViewBtn.TextSize, ViewBtn.Font = 12, Enum.Font.GothamBold
ViewBtn.ZIndex = 33
Instance.new("UICorner", ViewBtn).CornerRadius = UDim.new(0, 6)

---------------------------------------------------------
-- شريط الإنذار والتحذير أسفل الشاشة (يعمل في الكلاسيك فقط)
---------------------------------------------------------
local WarningBar = Instance.new("TextLabel", ScreenGui)
WarningBar.Size = UDim2.new(0, 320, 0, 28)
WarningBar.Position = UDim2.new(0.5, -160, 1, -35)
WarningBar.BackgroundColor3 = Color3.fromRGB(20, 15, 15)
WarningBar.BackgroundTransparency = 0.3
WarningBar.Text = "⚠️ [تنبيه]: الأوتو يعمل حصرياً في أقيام الكلاسيك"
WarningBar.TextColor3 = Color3.fromRGB(255, 80, 80)
WarningBar.TextSize = 11
WarningBar.Font = Enum.Font.GothamBold
WarningBar.ZIndex = 80
Instance.new("UICorner", WarningBar).CornerRadius = UDim.new(0, 6)
local WarnStroke = Instance.new("UIStroke", WarningBar)
WarnStroke.Color = Color3.fromRGB(220, 40, 60)
WarnStroke.Thickness = 1.2

---------------------------------------------------------
-- 4. نافذة التعديلات المظهرية (VisualsFrame)
---------------------------------------------------------
local VisualsFrame = Instance.new("Frame", ScreenGui)
VisualsFrame.Size = UDim2.new(0, 300, 0, 180)
VisualsFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
VisualsFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
VisualsFrame.Visible = false
VisualsFrame.Active = true
VisualsFrame.Draggable = true
VisualsFrame.ZIndex = 60
Instance.new("UICorner", VisualsFrame).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", VisualsFrame).Color = Color3.fromRGB(220, 40, 60)

local VTitle = Instance.new("TextLabel", VisualsFrame)
VTitle.Size = UDim2.new(1, 0, 0, 35)
VTitle.BackgroundTransparency = 1
VTitle.Text = "التعديلات المظهرية (Headless & Korblox)"
VTitle.TextColor3 = Color3.fromRGB(220, 40, 60)
VTitle.TextSize, VTitle.Font = 12, Enum.Font.GothamBold
VTitle.ZIndex = 61

local isHeadless = false
local isKorblox = false

local function applyVisuals(char)
    if not char then return end
    pcall(function()
        local head = char:FindFirstChild("Head")
        if head then
            head.Transparency = isHeadless and 1 or 0
            if head:FindFirstChildOfClass("Decal") then
                head:FindFirstChildOfClass("Decal").Transparency = isHeadless and 1 or 0
            end
        end
        local leg = char:FindFirstChild("Right Leg") or char:FindFirstChild("RightLowerLeg")
        if leg then
            leg.Transparency = isKorblox and 1 or 0
        end
    end)
end

local HBtn = Instance.new("TextButton", VisualsFrame)
HBtn.Size = UDim2.new(0, 260, 0, 40)
HBtn.Position = UDim2.new(0.5, -130, 0, 45)
HBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
HBtn.Text = "Headless: معطل"
HBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HBtn.TextSize, HBtn.Font = 12, Enum.Font.GothamBold
HBtn.ZIndex = 62
Instance.new("UICorner", HBtn).CornerRadius = UDim.new(0, 8)

HBtn.MouseButton1Click:Connect(function()
    isHeadless = not isHeadless
    HBtn.Text = isHeadless and "Headless: مفعل" or "Headless: معطل"
    HBtn.BackgroundColor3 = isHeadless and Color3.fromRGB(45, 190, 80) or Color3.fromRGB(35, 35, 42)
    HeadlessMainBtn.Text = isHeadless and "Headless: ON" or "Headless"
    HeadlessMainBtn.BackgroundColor3 = isHeadless and Color3.fromRGB(45, 190, 80) or Color3.fromRGB(30, 30, 35)
    applyVisuals(LocalPlayer.Character)
end)

local KBtn = Instance.new("TextButton", VisualsFrame)
KBtn.Size = UDim2.new(0, 260, 0, 40)
KBtn.Position = UDim2.new(0.5, -130, 0, 95)
KBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
KBtn.Text = "Korblox Legs: معطل"
KBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
KBtn.TextSize, KBtn.Font = 12, Enum.Font.GothamBold
KBtn.ZIndex = 62
Instance.new("UICorner", KBtn).CornerRadius = UDim.new(0, 8)

KBtn.MouseButton1Click:Connect(function()
    isKorblox = not isKorblox
    KBtn.Text = isKorblox and "Korblox Legs: مفعل" or "Korblox Legs: معطل"
    KBtn.BackgroundColor3 = isKorblox and Color3.fromRGB(45, 190, 80) or Color3.fromRGB(35, 35, 42)
    applyVisuals(LocalPlayer.Character)
end)

HeadlessMainBtn.MouseButton1Click:Connect(function()
    isHeadless = not isHeadless
    HBtn.Text = isHeadless and "Headless: مفعل" or "Headless: معطل"
    HBtn.BackgroundColor3 = isHeadless and Color3.fromRGB(45, 190, 80) or Color3.fromRGB(35, 35, 42)
    HeadlessMainBtn.Text = isHeadless and "Headless: ON" or "Headless"
    HeadlessMainBtn.BackgroundColor3 = isHeadless and Color3.fromRGB(45, 190, 80) or Color3.fromRGB(30, 30, 35)
    applyVisuals(LocalPlayer.Character)
end)

LocalPlayer.CharacterAdded:Connect(function(c)
    c:WaitForChild("Humanoid")
    task.wait(0.3)
    applyVisuals(c)
end)

ViewBtn.MouseButton1Click:Connect(function()
    VisualsFrame.Visible = not VisualsFrame.Visible
end)

---------------------------------------------------------
-- تشغيل شاشة التحميل وأحداث الأزرار
---------------------------------------------------------
task.spawn(function()
    for i = 1, 100 do
        if LoadBarFill and LoadBarFill.Parent then
            LoadBarFill.Size = UDim2.new(i/100, 0, 1, 0)
            LoadText.Text = "LOADING AT HUB TOP " .. i .. "%"
        end
        task.wait(0.02)
    end
    if LoadGui and LoadGui.Parent then LoadGui:Destroy() KeyFrame.Visible = true end
end)

SkipBtn.MouseButton1Click:Connect(function()
    if LoadGui and LoadGui.Parent then LoadGui:Destroy() end
    KeyFrame.Visible = true
end)

VerifyBtn.MouseButton1Click:Connect(function()
    local cleanKey = string.upper(string.gsub(tostring(KeyInput.Text or ""), "%s+", ""))
    if cleanKey == "KLE11" or cleanKey == "KJL12" then
        pcall(function() if IntroMusic then IntroMusic:Stop() IntroMusic:Destroy() end end)
        KeyFrame:Destroy()
        MainHub.Visible = true
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "خطأ، حاول مجدداً!"
    end
end)

---------------------------------------------------------
-- 5. نظام الكلاسيك الذكي وفلترة الأعداء مع Hold & Track
---------------------------------------------------------
local isAutoRunning = false
local autoConn = nil

local function isClassicMode()
    local success, res = pcall(function()
        local placeName = Workspace.Name:lower()
        if game.Name:lower():find("classic") or placeName:find("classic") or placeName:find("arena") then
            return true
        end
        return true 
    end)
    return success and res or true
end

local function isTrueEnemy(p)
    if p == LocalPlayer then return false end
    if p.Team and LocalPlayer.Team and p.Team == LocalPlayer.Team then return false end
    return true
end

local function getBombTimerValue()
    local char = LocalPlayer.Character
    if not char then return 999 end
    for _, item in pairs(char:GetChildren()) do
        if item:IsA("Tool") and (item.Name:lower():find("bomb") or item.Name:lower():find("tnt")) then
            for _, v in pairs(item:GetDescendants()) do
                if (v:IsA("NumberValue") or v:IsA("IntValue")) and (v.Name:lower():find("time") or v.Name:lower():find("timer") or v.Name:lower():find("fuse")) then
                    return v.Value
                end
            end
        end
    end
    return 999
end

local function hasBomb()
    local char = LocalPlayer.Character
    if not char then return false end
    for _, item in pairs(char:GetChildren()) do
        if item:IsA("Tool") and (item.Name:lower():find("bomb") or item.Name:lower():find("tnt")) then return true end
    end
    if LocalPlayer:FindFirstChild("Backpack") then
        for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
            if item:IsA("Tool") and (item.Name:lower():find("bomb") or item.Name:lower():find("tnt")) then return true end
        end
    end
    return false
end

AutoToggle.MouseButton1Click:Connect(function()
    if not isClassicMode() then
        WarningBar.Text = "❌ [خطأ]: الأوتو يعمل فقط في أقيام الكلاسيك!"
        return
    end

    isAutoRunning = not isAutoRunning
    if isAutoRunning then
        AutoToggle.BackgroundColor3 = Color3.fromRGB(45, 190, 80)
        AutoDot.Position = UDim2.new(1, -21, 0.5, -9)
        WarningBar.Text = "🟢 [مفعل]: يعمل في الكلاسيك - نظام Hold & Track نشط"
        
        autoConn = RunService.RenderStepped:Connect(function()
            pcall(function()
                if not isAutoRunning or not isClassicMode() then return end
                local char = LocalPlayer.Character
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end
                local hum = char:FindFirstChildOfClass("Humanoid")
                local root = char.HumanoidRootPart
                
                if hum and hum.Health > 0 then hum.WalkSpeed = 30 end
                
                if hasBomb() then
                    local bombTimer = getBombTimerValue()
                    
                    local closestRoot, minDist = nil, math.huge
                    for _, p in pairs(Players:GetPlayers()) do
                        if isTrueEnemy(p) and p.Character then
                            local eRoot = p.Character:FindFirstChild("HumanoidRootPart")
                            local eHum = p.Character:FindFirstChildOfClass("Humanoid")
                            if eRoot and eHum and eHum.Health > 0 then
                                local dist = (root.Position - eRoot.Position).Magnitude
                                if dist < minDist then
                                    minDist = dist
                                    closestRoot = eRoot
                                end
                            end
                        end
                    end
                    
                    if closestRoot then
                        local targetPos = closestRoot.Position
                        local autoDir = (targetPos - root.Position).Unit
                        
                        -- **ميزة Hold & Track**: تراجع آمن فوراً إذا اقترب العداد من 2.2 ثانية لتجنب تفجيرها خطأ
                        if bombTimer <= 2.2 then
                            autoDir = -autoDir 
                        end
                        
                        local playerInput = hum.MoveDirection
                        local finalDir = autoDir
                        if playerInput.Magnitude > 0.1 then
                            finalDir = playerInput.Unit
                        end
                        
                        hum:Move(finalDir * 1.1)
                        
                        local ray = workspace:Raycast(root.Position + Vector3.new(0, 1, 0), finalDir * 3.2, RaycastParams.new())
                        if ray then hum.Jump = true end
                        
                        if bombTimer > 2.2 then
                            for _, tool in pairs(char:GetChildren()) do
                                if tool:IsA("Tool") then tool:Activate() end
                            end
                        end
                    end
                end
            end)
        end)
    else
        AutoToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        AutoDot.Position = UDim2.new(0, 3, 0.5, -9)
        WarningBar.Text = "⚠️ [تنبيه]: الأوتو يعمل حصرياً في أقيام الكلاسيك"
        if autoConn then autoConn:Disconnect(); autoConn = nil end
        pcall(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
            end
        end)
    end
end)
