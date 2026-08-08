local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/kentatvv1-tech/UI-BYKENTA/refs/heads/main/ui.lua"))()
local UIS = game:GetService("UserInputService")
local WindowSize = UIS.TouchEnabled and UDim2.fromOffset(550, 550) or UDim2.fromOffset(570,450)

local Window = Library:Window({
    Title = "Singularity Hub",
    Desc = "Laundry Simulator Auto Farm",
    Icon = 115975178132422,
    Theme = "Dark",
    Config = {
        Keybind = Enum.KeyCode.RightShift,
        Size = WindowSize
    },
    CloseUIButton = {
        Enabled = true,
        Text = "Close"
    }
})

local FarmTab = Window:Tab({ Title = "Auto Farm", Icon = "zap" })

getgenv().AutoGrab = false
getgenv().AutoWash = false
getgenv().AutoSell = false
getgenv().AutoSellDirty = false
getgenv().AutoSpin = false
getgenv().AutoBuyMachine = false
getgenv().AutoEquipMachine = false
getgenv().AutoBuyBasket = false
getgenv().AutoChallenge = false
getgenv().IsSelling = false
getgenv().IsWashing = false
getgenv().Noclip = false
getgenv().FilterNormal = true
getgenv().FilterGold = true
getgenv().FilterPurple = true
getgenv().FilterRed = true
getgenv().FilterBlue = true
getgenv().FilterGreen = true
getgenv().FilterOther = true
getgenv().FilterMitten = true
getgenv().FilterSock = true
getgenv().FilterShirt = true
getgenv().FilterShorts = true
getgenv().FilterSweater = true
getgenv().FilterTowel = true
getgenv().FilterUnderpants = true

local PlayerTab = Window:Tab({ Title = "Player", Icon = "user" })

PlayerTab:Toggle({ 
    Title = "Noclip (เดินทะลุกำแพง)", 
    Image = "user-minus", 
    Value = getgenv().Noclip, 
    Callback = function(val) 
        getgenv().Noclip = val 
    end 
})

FarmTab:Toggle({ 
    Title = "Auto Grab Clothes (เก็บผ้าออโต้)", 
    Image = "user", 
    Value = getgenv().AutoGrab, 
    Callback = function(val) 
        getgenv().AutoGrab = val 
    end 
})

FarmTab:Toggle({ 
    Title = "Auto Wash (ซักผ้าออโต้)", 
    Image = "zap", 
    Value = getgenv().AutoWash, 
    Callback = function(val) 
        getgenv().AutoWash = val 
    end 
})

FarmTab:Toggle({ 
    Title = "Auto Sell (โยนลงปล่องขายออโต้)", 
    Image = "coins", 
    Value = getgenv().AutoSell, 
    Callback = function(val) 
        getgenv().AutoSell = val 
    end 
})

FarmTab:Toggle({ 
    Title = "Auto Sell Dirty (ขายผ้าสกปรกออโต้)", 
    Image = "coins", 
    Value = getgenv().AutoSellDirty, 
    Callback = function(val) 
        getgenv().AutoSellDirty = val 
    end 
})

FarmTab:Toggle({ 
    Title = "Auto Spin Wheel (หมุนวงล้อออโต้)", 
    Image = "target", 
    Value = getgenv().AutoSpin, 
    Callback = function(val) 
        getgenv().AutoSpin = val 
    end 
})

FarmTab:Toggle({ 
    Title = "Auto Buy Machine (ซื้อเครื่องซักผ้าออโต้)", 
    Image = "shopping-cart", 
    Value = getgenv().AutoBuyMachine, 
    Callback = function(val) 
        getgenv().AutoBuyMachine = val 
    end 
})

FarmTab:Toggle({ 
    Title = "Auto Equip Best Machine (จัดวางเครื่องที่ดีที่สุด)", 
    Image = "package", 
    Value = getgenv().AutoEquipMachine, 
    Callback = function(val) 
        getgenv().AutoEquipMachine = val 
    end 
})

FarmTab:Toggle({ 
    Title = "Auto Buy Basket (ซื้อตะกร้าออโต้)", 
    Image = "shopping-bag", 
    Value = getgenv().AutoBuyBasket, 
    Callback = function(val) 
        getgenv().AutoBuyBasket = val 
    end 
})

FarmTab:Toggle({ 
    Title = "Auto Claim Challenges (รับของรางวัลเควส)", 
    Image = "award", 
    Value = getgenv().AutoChallenge, 
    Callback = function(val) 
        getgenv().AutoChallenge = val 
    end 
})

local FilterTab = Window:Tab({ Title = "Cloth Filter", Icon = "filter" })

FilterTab:Toggle({ Title = "Normal (ไม่มีเอฟเฟกต์)", Image = "target", Value = getgenv().FilterNormal, Callback = function(v) getgenv().FilterNormal = v end })
FilterTab:Toggle({ Title = "Gold / Yellow (สีทอง/เหลือง)", Image = "target", Value = getgenv().FilterGold, Callback = function(v) getgenv().FilterGold = v end })
FilterTab:Toggle({ Title = "Purple / Pink (สีม่วง/ชมพู)", Image = "target", Value = getgenv().FilterPurple, Callback = function(v) getgenv().FilterPurple = v end })
FilterTab:Toggle({ Title = "Red (สีแดง)", Image = "target", Value = getgenv().FilterRed, Callback = function(v) getgenv().FilterRed = v end })
FilterTab:Toggle({ Title = "Blue (สีฟ้า/น้ำเงิน)", Image = "target", Value = getgenv().FilterBlue, Callback = function(v) getgenv().FilterBlue = v end })
FilterTab:Toggle({ Title = "Green (สีเขียว)", Image = "target", Value = getgenv().FilterGreen, Callback = function(v) getgenv().FilterGreen = v end })
FilterTab:Toggle({ Title = "Other Effects (สีขาวและอื่นๆ)", Image = "target", Value = getgenv().FilterOther, Callback = function(v) getgenv().FilterOther = v end })

-- Cloth Type Filters
FilterTab:Toggle({ Title = "Mitten (ถุงมือ)", Image = "target", Value = getgenv().FilterMitten, Callback = function(v) getgenv().FilterMitten = v end })
FilterTab:Toggle({ Title = "Sock (ถุงเท้า)", Image = "target", Value = getgenv().FilterSock, Callback = function(v) getgenv().FilterSock = v end })
FilterTab:Toggle({ Title = "Shirt (เสื้อ)", Image = "target", Value = getgenv().FilterShirt, Callback = function(v) getgenv().FilterShirt = v end })
FilterTab:Toggle({ Title = "Shorts (กางเกงขาสั้น)", Image = "target", Value = getgenv().FilterShorts, Callback = function(v) getgenv().FilterShorts = v end })
FilterTab:Toggle({ Title = "Sweater (สเวตเตอร์)", Image = "target", Value = getgenv().FilterSweater, Callback = function(v) getgenv().FilterSweater = v end })
FilterTab:Toggle({ Title = "Towel (ผ้าเช็ดตัว)", Image = "target", Value = getgenv().FilterTowel, Callback = function(v) getgenv().FilterTowel = v end })
FilterTab:Toggle({ Title = "Underpants (กางเกงใน)", Image = "target", Value = getgenv().FilterUnderpants, Callback = function(v) getgenv().FilterUnderpants = v end })

local TeleportTab = Window:Tab({ Title = "Teleports", Icon = "map" })

TeleportTab:Button({
    Title = "วาร์ปไปร้านขายเครื่องซักผ้า",
    Desc = "ไปที่ Archy's Shop (ซื้อเครื่องซักผ้าใหม่)",
    Image = "shopping-cart",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        local shop = workspace:FindFirstChild("ArchysShopEntrance")
        if char and char:FindFirstChild("HumanoidRootPart") and shop and shop:FindFirstChild("Open") then
            char.HumanoidRootPart.CFrame = shop.Open.CFrame * CFrame.new(0, 3, 0)
        end
    end
})

-- // Services & Variables
local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
local LocalPlayer = game.Players.LocalPlayer
local WashingMachinesInfo = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("WashingMachines"))

local function IsClothAllowed(cloth)
    -- ตรวจสอบประเภทของเสื้อผ้า
    local clothName = cloth.Name
    if clothName == "Mitten" and not getgenv().FilterMitten then return false end
    if clothName == "Sock" and not getgenv().FilterSock then return false end
    if clothName == "Shirt" and not getgenv().FilterShirt then return false end
    if clothName == "Shorts" and not getgenv().FilterShorts then return false end
    if clothName == "Sweater" and not getgenv().FilterSweater then return false end
    if clothName == "Towel" and not getgenv().FilterTowel then return false end
    if clothName == "Underpants" and not getgenv().FilterUnderpants then return false end

    -- ตรวจสอบความหายาก (สี)
    local hasEffect = false
    local cType = "Normal"
    for _, desc in ipairs(cloth:GetDescendants()) do
        if desc:IsA("ParticleEmitter") then
            hasEffect = true
            local color = desc.Color.Keypoints[1].Value
            local r, g, b = color.R, color.G, color.B
            if r > 0.8 and g > 0.8 and b > 0.8 then cType = "Other" 
            elseif r > 0.7 and g > 0.7 and b < 0.4 then cType = "Gold"
            elseif r > 0.7 and b > 0.7 and g < 0.4 then cType = "Purple"
            elseif r > 0.6 and g < 0.4 and b < 0.4 then cType = "Red"
            elseif g > 0.6 and r < 0.4 and b < 0.4 then cType = "Green"
            elseif b > 0.6 and r < 0.4 and g < 0.4 then cType = "Blue"
            else cType = "Other" end
            break
        end
    end
    
    if not hasEffect then return getgenv().FilterNormal end
    if cType == "Gold" then return getgenv().FilterGold end
    if cType == "Purple" then return getgenv().FilterPurple end
    if cType == "Red" then return getgenv().FilterRed end
    if cType == "Blue" then return getgenv().FilterBlue end
    if cType == "Green" then return getgenv().FilterGreen end
    return getgenv().FilterOther
end 

-- // Auto Standby at ConveyorEdge
task.spawn(function()
    while task.wait(0.5) do
        if getgenv().AutoGrab and not getgenv().IsSelling and not getgenv().IsWashing then
            pcall(function()
                if LocalPlayer.NonSaveVars.BackpackAmount.Value < LocalPlayer.NonSaveVars.BasketSize.Value then
                    local conveyor = workspace:FindFirstChild("ConveyorEdge")
                    local char = LocalPlayer.Character
                    if conveyor and char and char:FindFirstChild("HumanoidRootPart") then
                        local targetPos = conveyor:GetPivot().Position
                        local dist = (char.HumanoidRootPart.Position - targetPos).Magnitude
                        if dist > 10 then
                            FlyToTarget(targetPos + Vector3.new(0, 5, 0))
                        end
                    end
                end
            end)
        end
    end
end)

-- // Auto Grab
task.spawn(function()
    while task.wait(0.1) do
        if getgenv().AutoGrab then
            pcall(function()
                if LocalPlayer.NonSaveVars.BackpackAmount.Value < LocalPlayer.NonSaveVars.BasketSize.Value then
                    for _, v in ipairs(workspace.Debris.Clothing:GetChildren()) do
                        if getgenv().AutoGrab and LocalPlayer.NonSaveVars.BackpackAmount.Value < LocalPlayer.NonSaveVars.BasketSize.Value then
                            Events.GrabClothing:FireServer(v)
                            task.wait(0.05)
                        end
                    end
                end
            end)
        end
    end
end)

local TweenService = game:GetService("TweenService")

local function GetMyPlot()
    local plots = workspace:FindFirstChild("Plots")
    if plots then
        for i = 1, 8 do
            local plot = plots:FindFirstChild("Plot" .. i)
            if plot then
                local sign = plot:FindFirstChild("Furniture") and plot.Furniture:FindFirstChild("Sign")
                if sign and sign:FindFirstChild("Main") and sign.Main:FindFirstChild("SurfaceGui") and sign.Main.SurfaceGui:FindFirstChild("TextLabel") then
                    if sign.Main.SurfaceGui.TextLabel.Text == LocalPlayer.Name .. "'s Plot" then
                        return plot
                    end
                end
            end
        end
    end
    return LocalPlayer.NonSaveVars.OwnsPlot.Value
end

local currentFlightId = 0
local function FlyToTarget(targetPosition)
    currentFlightId = currentFlightId + 1
    local myFlightId = currentFlightId
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    
    if humanoid then
        humanoid.PlatformStand = true
        humanoid.Sit = false
    end
    
    local flyVelocity = hrp:FindFirstChild("AutoFarmFly") or Instance.new("BodyVelocity")
    flyVelocity.Name = "AutoFarmFly"
    flyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    flyVelocity.Parent = hrp
    
    local flyGyro = hrp:FindFirstChild("AutoFarmGyro") or Instance.new("BodyGyro")
    flyGyro.Name = "AutoFarmGyro"
    flyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    flyGyro.P = 3000
    flyGyro.D = 500
    flyGyro.Parent = hrp
    
    local steppedConn
    steppedConn = game:GetService("RunService").Stepped:Connect(function()
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
        if humanoid and humanoid.Sit then
            humanoid.Sit = false
        end
    end)
    
    while char and hrp.Parent and (hrp.Position - targetPosition).Magnitude > 5 and currentFlightId == myFlightId do
        local dir = (targetPosition - hrp.Position).Unit
        flyVelocity.Velocity = dir * 60
        flyGyro.CFrame = CFrame.new(hrp.Position, targetPosition)
        task.wait()
    end
    
    if currentFlightId == myFlightId then
        if steppedConn then steppedConn:Disconnect() end
        flyVelocity:Destroy()
        flyGyro:Destroy()
        if humanoid then
            humanoid.PlatformStand = false
        end
        hrp.Velocity = Vector3.zero
        hrp.RotVelocity = Vector3.zero
    else
        if steppedConn then steppedConn:Disconnect() end
    end
end

-- // Auto Wash
task.spawn(function()
    while task.wait(0.5) do
        if getgenv().AutoWash and not getgenv().IsSelling then
            pcall(function()
                local plot = GetMyPlot()
                if plot and plot:FindFirstChild("WashingMachines") then
                    for _, machine in ipairs(plot.WashingMachines:GetChildren()) do
                        if machine:FindFirstChild("Config") then
                            local cycleFinished = machine.Config.CycleFinished.Value
                            local basketStatus = LocalPlayer.NonSaveVars.BasketStatus.Value
                            local amount = LocalPlayer.NonSaveVars.BackpackAmount.Value
                            local maxAmount = LocalPlayer.NonSaveVars.BasketSize.Value
                            local currentCap = machine.Config.Capacity.Value
                            local maxCap = WashingMachinesInfo[machine.Name].Capacity
                            local isFull = currentCap >= maxCap
                            
                            local needUnload = cycleFinished and (basketStatus == "Clean" or amount == 0) and amount < maxAmount
                            local needLoad = (not isFull) and (not cycleFinished) and (basketStatus ~= "Clean") and amount > 0
                            
                            if needUnload or needLoad then
                                getgenv().IsWashing = true
                                local char = LocalPlayer.Character
                                if char and char:FindFirstChild("HumanoidRootPart") and machine:FindFirstChild("MAIN") then
                                    local hrp = char.HumanoidRootPart
                                    local targetCFrame = machine.MAIN.CFrame * CFrame.new(0, 3, -4)
                                    local dist = (hrp.Position - targetCFrame.Position).Magnitude
                                    
                                    if dist > 5 then
                                        FlyToTarget(targetCFrame.Position)
                                        task.wait(0.2)
                                    end
                                    
                                    if needUnload then
                                        Events.UnloadWashingMachine:FireServer(machine)
                                        task.wait(0.2)
                                    elseif needLoad then
                                        Events.LoadWashingMachine:FireServer(machine)
                                        task.wait(0.2)
                                    end
                                end
                                getgenv().IsWashing = false
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- // Auto Sell (Drop Clothes In Chute)
task.spawn(function()
    while task.wait(0.5) do
        if getgenv().AutoSell or getgenv().AutoSellDirty then
            pcall(function()
                if LocalPlayer.NonSaveVars.BackpackAmount.Value > 0 then
                    local isClean = (LocalPlayer.NonSaveVars.BasketStatus.Value == "Clean")
                    local dumpDirty = false
                    local shouldSell = false
                    
                    if isClean then
                        if LocalPlayer.NonSaveVars.BackpackAmount.Value >= LocalPlayer.NonSaveVars.BasketSize.Value then
                            shouldSell = true
                        else
                            local plot = GetMyPlot()
                            local moreToUnload = false
                            if plot and plot:FindFirstChild("WashingMachines") then
                                for _, machine in ipairs(plot.WashingMachines:GetChildren()) do
                                    if machine:FindFirstChild("Config") and machine.Config.CycleFinished.Value then
                                        moreToUnload = true
                                        break
                                    end
                                end
                            end
                            if not moreToUnload then
                                shouldSell = true
                            end
                        end
                    else
                        if getgenv().AutoSellDirty then
                            dumpDirty = true
                        else
                            local plot = GetMyPlot()
                            if plot and plot:FindFirstChild("WashingMachines") then
                                for _, machine in ipairs(plot.WashingMachines:GetChildren()) do
                                    if machine:FindFirstChild("Config") and machine.Config.CycleFinished.Value then
                                        dumpDirty = true
                                        break
                                    end
                                end
                            end
                        end
                    end
                    
                    if (isClean and shouldSell) or dumpDirty then
                        getgenv().IsSelling = true
                        local char = LocalPlayer.Character
                        local chute = workspace:FindFirstChild("_FinishChute")
                        if char and char:FindFirstChild("HumanoidRootPart") and chute and chute:FindFirstChild("Handle") then
                            local hrp = char.HumanoidRootPart
                            local targetCFrame = chute.Handle.CFrame * CFrame.new(0, 3, 0)
                            local dist = (hrp.Position - targetCFrame.Position).Magnitude
                            
                            -- วาปไปหา (Ghost Fly)
                            FlyToTarget(targetCFrame.Position)
                            task.wait(0.2)
                            
                            local dropEvent = Events:FindFirstChild("DropClothesInChute")
                            if dropEvent then
                                dropEvent:FireServer()
                                task.wait(0.5)
                            end
                        end
                        getgenv().IsSelling = false
                    end
                end
            end)
        end
    end
end)

-- // Auto Spin Wheel
task.spawn(function()
    while task.wait(2) do
        if getgenv().AutoSpin then
            pcall(function()
                local wheel = workspace.Debris.NPCVehicles:FindFirstChild("SpinTheWheel")
                if wheel and wheel:FindFirstChild("_ClickToSpin") then
                    if wheel.Timer.Value <= 0 and not wheel._ClickToSpin.Spun.Value then
                        Events.SpinTheWheel:InvokeServer()
                        task.wait(1.5)
                        Events.ClaimWheelAward:InvokeServer()
                    end
                end
            end)
        end
    end
end)

-- // Auto Buy Washing Machine
task.spawn(function()
    while task.wait(3) do
        if getgenv().AutoBuyMachine then
            pcall(function()
                local maxID = 1
                -- เช็คของในกระเป๋าว่ามีระดับไหน
                for _, v in pairs(LocalPlayer.SaveVars.Inventory:GetChildren()) do
                    local num = tonumber(v.Name)
                    if num and num > maxID then
                        maxID = num
                    end
                end
                -- เช็คที่อยู่บน Plot
                local plot = LocalPlayer.NonSaveVars.OwnsPlot.Value
                if plot and plot:FindFirstChild("WashingMachines") then
                    for _, machine in ipairs(plot.WashingMachines:GetChildren()) do
                        local num = tonumber(machine.Name)
                        if num and num > maxID then
                            maxID = num
                        end
                    end
                end
                -- พยายามซื้อรัวๆ จนกว่าจะซื้อไม่ได้ (เงินหมด หรือ ตัน)
                local nextID = maxID + 1
                while nextID <= 100 do
                    local success = game:GetService("ReplicatedStorage").Events.BuyWashingMachine:InvokeServer(tostring(nextID))
                    if success then
                        nextID = nextID + 1
                        task.wait(0.1)
                    else
                        break
                    end
                end
            end)
        end
    end
end)

-- // Auto Equip Best Machine
local lastEquipConfig = ""
task.spawn(function()
    while task.wait(5) do
        if getgenv().AutoEquipMachine then
            pcall(function()
                local availableMachines = {}
                -- เอาเครื่องในกระเป๋ามารวม
                for _, v in pairs(LocalPlayer.SaveVars.Inventory:GetChildren()) do
                    local num = tonumber(v.Name)
                    if num and v.Value > 0 then
                        for i = 1, v.Value do table.insert(availableMachines, num) end
                    end
                end
                -- เอาเครื่องบน Plot มารวม
                for _, v in pairs(LocalPlayer.SaveVars.Plot:GetChildren()) do
                    local num = tonumber(v.Name)
                    if num then
                        table.insert(availableMachines, num)
                    end
                end
                
                -- เรียงจากระดับสูงสุดไปต่ำสุด
                table.sort(availableMachines, function(a, b) return a > b end)
                
                local currentConfig = ""
                for i = 1, 8 do
                    if availableMachines[i] then
                        currentConfig = currentConfig .. availableMachines[i] .. ","
                    end
                end
                
                -- อัปเดตเมื่อมีเครื่องระดับสูงกว่าให้วาง
                if currentConfig ~= lastEquipConfig then
                    for i = 1, 8 do
                        if availableMachines[i] then
                            game:GetService("ReplicatedStorage").Events.PlaceWashingMachine:InvokeServer(tostring(availableMachines[i]), i)
                            task.wait(0.1)
                        end
                    end
                    lastEquipConfig = currentConfig
                end
            end)
        end
    end
end)

-- // Auto Buy Basket
task.spawn(function()
    while task.wait(3) do
        if getgenv().AutoBuyBasket then
            pcall(function()
                local maxID = 1
                for _, v in pairs(LocalPlayer.SaveVars.Baskets:GetChildren()) do
                    local num = tonumber(v.Name)
                    if num and num > maxID then
                        maxID = num
                    end
                end
                
                -- พยายามซื้อตะกร้ารัวๆ จนกว่าจะซื้อไม่ได้ (เงินหมด หรือ ตัน)
                local nextID = maxID + 1
                while nextID <= 100 do
                    local success = game:GetService("ReplicatedStorage").Events.BuyBasket:InvokeServer(tostring(nextID))
                    if success then
                        nextID = nextID + 1
                        task.wait(0.1)
                    else
                        break
                    end
                end
            end)
        end
    end
end)

-- // Noclip
game:GetService("RunService").Stepped:Connect(function()
    if getgenv().Noclip then
        local char = game.Players.LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end
end)

-- // Auto Claim Challenges
task.spawn(function()
    while task.wait(5) do
        if getgenv().AutoChallenge then
            pcall(function()
                local ChallengesData = require(game:GetService("ReplicatedStorage").Modules.Challenges)
                local GetChallenges = game:GetService("ReplicatedStorage").Events.Challenges.GetChallenges
                local ClaimChallenge = game:GetService("ReplicatedStorage").Events.Challenges.ClaimChallenge
                
                local activeChallenges = GetChallenges:InvokeServer()
                if activeChallenges then
                    for _, v in pairs(activeChallenges) do
                        if not v.Claimed then
                            local goal = 1
                            if ChallengesData.Easy and ChallengesData.Easy[v.ID] then
                                goal = ChallengesData.Easy[v.ID].Goal
                            elseif ChallengesData.Medium and ChallengesData.Medium[v.ID] then
                                goal = ChallengesData.Medium[v.ID].Goal
                            elseif ChallengesData.Hard and ChallengesData.Hard[v.ID] then
                                goal = ChallengesData.Hard[v.ID].Goal
                            elseif ChallengesData[v.ID] then
                                goal = ChallengesData[v.ID].Goal
                            end
                            
                            if v.Progress >= goal then
                                ClaimChallenge:InvokeServer(v.ID)
                                task.wait(0.5)
                            end
                        end
                    end
                end
            end)
        end
    end
end)
