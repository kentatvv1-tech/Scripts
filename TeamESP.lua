local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- // ป้องกันรันซ้อน (Anti-Overlap) //
local env = (getgenv and getgenv()) or _G
env.TeamESP_Running = false -- ปิดลูปเก่า
task.wait(0.1) -- รอให้ลูปเก่าหยุดทำงาน
env.TeamESP_Running = true -- เปิดลูปใหม่

if env.TeamESP_Folder then env.TeamESP_Folder:Destroy() end

-- สร้าง Folder ไปเก็บใน CoreGui เพื่อไม่ให้รก Workspace
local espFolder = Instance.new("Folder")
espFolder.Name = "MyTeamESP"
pcall(function() espFolder.Parent = CoreGui end)
if not espFolder.Parent then
    espFolder.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
end
env.TeamESP_Folder = espFolder

local espCache = {}

local function createESP(targetPlayer)
    if espCache[targetPlayer] then return end -- ป้องกันสร้างซ้ำ
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = targetPlayer.Name .. "_ESP"
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Enabled = false
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = false
    textLabel.TextSize = 14
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextStrokeTransparency = 0
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.Parent = billboard
    
    billboard.Parent = espFolder
    
    local highlight = Instance.new("Highlight")
    highlight.Name = targetPlayer.Name .. "_Highlight"
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0.2
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Enabled = false
    highlight.Parent = espFolder
    
    espCache[targetPlayer] = {
        Gui = billboard,
        Label = textLabel,
        Highlight = highlight
    }
end

local localPlayer = Players.LocalPlayer

-- ลูปที่ 1: ตรวจสอบผู้เล่นเข้า/ออกเกม (วนเช็คทุก 1 วินาที)
task.spawn(function()
    while env.TeamESP_Running do
        -- เช็คคนเข้าใหม่
        for _, p in ipairs(Players:GetPlayers()) do
            if not espCache[p] then
                createESP(p)
            end
        end
        
        -- เช็คคนออกเกม
        for p, data in pairs(espCache) do
            if not p or not p.Parent then
                if data.Gui then data.Gui:Destroy() end
                if data.Highlight then data.Highlight:Destroy() end
                espCache[p] = nil
            end
        end
        
        task.wait(1)
    end
end)

-- ลูปที่ 2: อัปเดตตำแหน่ง ESP และ ไฮไลต์ (วนแบบความไวสูงตลอดเวลา)
task.spawn(function()
    while env.TeamESP_Running do
        for targetPlayer, data in pairs(espCache) do
            local char = targetPlayer.Character
            local head = char and char:FindFirstChild("Head")
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            
            if head and hrp and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                data.Gui.Adornee = head
                data.Gui.Enabled = true
                
                -- หาข้อมูลทีม
                local teamName = "No Team"
                local teamColor = Color3.new(1, 1, 1)
                
                if targetPlayer.Team then
                    teamName = targetPlayer.Team.Name
                    teamColor = targetPlayer.TeamColor.Color
                end
                
                -- คำนวณระยะห่าง
                local distance = 0
                local myChar = localPlayer.Character
                if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                    distance = math.floor((myChar.HumanoidRootPart.Position - hrp.Position).Magnitude)
                end
                
                data.Label.Text = string.format("[%s]\n%s\n[%d m]", teamName, targetPlayer.Name, distance)
                data.Label.TextColor3 = teamColor
                
                -- อัปเดตไฮไลต์
                data.Highlight.Adornee = char
                data.Highlight.FillColor = teamColor
                data.Highlight.OutlineColor = teamColor
                data.Highlight.Enabled = true
            else
                data.Gui.Enabled = false
                data.Gui.Adornee = nil
                data.Highlight.Enabled = false
                data.Highlight.Adornee = nil
            end
        end
        task.wait() -- รันตลอดเวลาทุกเฟรมของเกม
    end
end)

print("✅ ระบบ Team ESP ทำงานเรียบร้อยแล้ว!")
