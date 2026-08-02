local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local PlaceId = game.PlaceId

-- // Configuration
local Config = {
    LogoID = "rbxassetid://115975178132422", -- Placeholder Logo ID
    MainColor = Color3.fromRGB(255, 128, 0), -- Orange
    BackgroundColor = Color3.fromRGB(15, 15, 15),
    BFTargetScript = "https://raw.githubusercontent.com/kingmamu007/Mirage/refs/heads/main/mirage.lua" -- Placeholder URL, user needs to change this
}

local SupportedGames = {
    -- Blox Fruits
    [2753915549] = "Blox Fruits",
    [4442272592] = "Blox Fruits",
    [7449423635] = "Blox Fruits"
}

-- // UI Creation
local LoaderUI = Instance.new("ScreenGui")
LoaderUI.Name = "SingularityLoader"
LoaderUI.Parent = CoreGui
LoaderUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Blur = Instance.new("BlurEffect")
Blur.Parent = Lighting
Blur.Size = 0
Blur.Name = "SingularityBlur"

local Background = Instance.new("Frame")
Background.Name = "Background"
Background.Parent = LoaderUI
Background.BackgroundColor3 = Config.BackgroundColor
Background.BackgroundTransparency = 1
Background.BorderSizePixel = 0
Background.Size = UDim2.new(1, 0, 1, 0)
Background.ZIndex = 1

local CenterFrame = Instance.new("Frame")
CenterFrame.Name = "CenterFrame"
CenterFrame.Parent = Background
CenterFrame.AnchorPoint = Vector2.new(0.5, 0.5)
CenterFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CenterFrame.BackgroundTransparency = 1.000
CenterFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
CenterFrame.Size = UDim2.new(0, 300, 0, 200)
CenterFrame.ZIndex = 2

local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Parent = CenterFrame
Logo.AnchorPoint = Vector2.new(0.5, 0.5)
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.Position = UDim2.new(0.5, 0, 0.35, 0)
Logo.Size = UDim2.new(0, 100, 0, 100)
Logo.Image = Config.LogoID
Logo.ImageTransparency = 1
Logo.ZIndex = 3

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = CenterFrame
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.5, 0, 0.75, 0)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "Loading Singularity Hub..."
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18.000
Title.TextTransparency = 1
Title.ZIndex = 3

local Status = Instance.new("TextLabel")
Status.Name = "Status"
Status.Parent = CenterFrame
Status.AnchorPoint = Vector2.new(0.5, 0.5)
Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1.000
Status.Position = UDim2.new(0.5, 0, 0.88, 0)
Status.Size = UDim2.new(1, 0, 0, 20)
Status.Font = Enum.Font.Gotham
Status.Text = "Checking Game ID..."
Status.TextColor3 = Color3.fromRGB(200, 200, 200)
Status.TextSize = 14.000
Status.TextTransparency = 1
Status.ZIndex = 3

local LoadingBarBack = Instance.new("Frame")
LoadingBarBack.Name = "LoadingBarBack"
LoadingBarBack.Parent = CenterFrame
LoadingBarBack.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingBarBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LoadingBarBack.BorderSizePixel = 0
LoadingBarBack.Position = UDim2.new(0.5, 0, 1.1, 0)
LoadingBarBack.Size = UDim2.new(0.8, 0, 0, 4)
LoadingBarBack.ZIndex = 3
LoadingBarBack.BackgroundTransparency = 1
local UICorner1 = Instance.new("UICorner")
UICorner1.CornerRadius = UDim.new(1, 0)
UICorner1.Parent = LoadingBarBack

local LoadingBarFill = Instance.new("Frame")
LoadingBarFill.Name = "LoadingBarFill"
LoadingBarFill.Parent = LoadingBarBack
LoadingBarFill.BackgroundColor3 = Config.MainColor
LoadingBarFill.BorderSizePixel = 0
LoadingBarFill.Size = UDim2.new(0, 0, 1, 0)
LoadingBarFill.ZIndex = 4
local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(1, 0)
UICorner2.Parent = LoadingBarFill

-- // Animation Logic
local tweenInfoFast = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenInfoSlow = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local tweenInfoPulse = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)

-- Fade In
TweenService:Create(Blur, tweenInfoFast, {Size = 24}):Play()
TweenService:Create(Background, tweenInfoFast, {BackgroundTransparency = 0.4}):Play()
task.wait(0.5)

TweenService:Create(Logo, tweenInfoSlow, {ImageTransparency = 0}):Play()
TweenService:Create(Title, tweenInfoSlow, {TextTransparency = 0}):Play()
TweenService:Create(Status, tweenInfoSlow, {TextTransparency = 0}):Play()
TweenService:Create(LoadingBarBack, tweenInfoSlow, {BackgroundTransparency = 0}):Play()
task.wait(1)

-- Pulse Logo
TweenService:Create(Logo, tweenInfoPulse, {Size = UDim2.new(0, 110, 0, 110)}):Play()

-- // Game Checking Logic
local GameName = SupportedGames[PlaceId]

if GameName then
    Status.Text = "Game Found: " .. GameName
    -- Simulate Loading
    TweenService:Create(LoadingBarFill, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0.7, 0, 1, 0)}):Play()
    task.wait(2)
    
    Status.Text = "Fetching Script..."
    TweenService:Create(LoadingBarFill, TweenInfo.new(1, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(1.2)
    
    Status.Text = "Complete!"
    Title.Text = "Singularity Hub Loaded"
    Title.TextColor3 = Config.MainColor
    
    -- Fade Out
    task.wait(1)
    TweenService:Create(Blur, tweenInfoFast, {Size = 0}):Play()
    TweenService:Create(Background, tweenInfoFast, {BackgroundTransparency = 1}):Play()
    
    for _, v in pairs(CenterFrame:GetChildren()) do
        if v:IsA("TextLabel") then
            TweenService:Create(v, tweenInfoFast, {TextTransparency = 1}):Play()
        elseif v:IsA("ImageLabel") then
            TweenService:Create(v, tweenInfoFast, {ImageTransparency = 1}):Play()
        elseif v:IsA("Frame") then
            TweenService:Create(v, tweenInfoFast, {BackgroundTransparency = 1}):Play()
        end
    end
    
    task.wait(0.5)
    LoaderUI:Destroy()
    Blur:Destroy()
    
    -- // Execute Script
    if GameName == "Blox Fruits" then
        -- Execute the main script
        -- IMPORTANT: The user must replace this link with their actual script link
        pcall(function()
            loadstring(game:HttpGet(Config.BFTargetScript))()
        end)
    end
else
    -- Game not supported
    Status.Text = "Game Not Supported!"
    Status.TextColor3 = Color3.fromRGB(255, 50, 50)
    TweenService:Create(LoadingBarFill, tweenInfoFast, {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(255, 50, 50)}):Play()
    
    task.wait(2)
    
    -- Fade Out
    TweenService:Create(Blur, tweenInfoFast, {Size = 0}):Play()
    TweenService:Create(Background, tweenInfoFast, {BackgroundTransparency = 1}):Play()
    for _, v in pairs(CenterFrame:GetChildren()) do
        if v:IsA("TextLabel") then
            TweenService:Create(v, tweenInfoFast, {TextTransparency = 1}):Play()
        elseif v:IsA("ImageLabel") then
            TweenService:Create(v, tweenInfoFast, {ImageTransparency = 1}):Play()
        elseif v:IsA("Frame") then
            TweenService:Create(v, tweenInfoFast, {BackgroundTransparency = 1}):Play()
        end
    end
    
    task.wait(0.5)
    LoaderUI:Destroy()
    Blur:Destroy()
end
