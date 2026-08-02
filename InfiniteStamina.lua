-- สคริปต์ทำสตามิน่า (Stamina) อมตะแบบ Hook ป้องกันการลดสตามิน่า
local TakeStaminaEvent = game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Character"):WaitForChild("TakeStamina")

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    
    -- ดักจับการยิง Event "TakeStamina" ไปที่เซิร์ฟเวอร์
    if self == TakeStaminaEvent and method == "FireServer" then
        -- หากตรวจพบว่าเกมกำลังจะลดสตามิน่า ให้ยกเลิกคำสั่งนั้น (Return ทิ้งไปเลย)
        return
    end
    
    -- หากไม่ใช่ Event ลดสตามิน่า ให้ทำงานตามปกติ
    return oldNamecall(self, ...)
end)

print("✅ เปิดใช้งาน Infinite Stamina (สตามิน่าไม่มีวันหมด) เรียบร้อยแล้ว!")

-- ==============================================
-- [ทางเลือกสำรอง] หากวิธีข้างบน (Hook) ไม่ทำงาน 
-- เนื่องจาก Executor ของคุณไม่รองรับ hookmetamethod 
-- ให้ลบสคริปต์ด้านบนทิ้ง แล้วใช้สคริปต์ด้านล่างนี้แทน:
-- ==============================================

--[[
local TakeStaminaEvent = game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Character"):WaitForChild("TakeStamina")
getgenv().InfStamina = true

task.spawn(function()
    while getgenv().InfStamina do
        task.wait(0.5)
        -- ลองส่งค่าบวก (+) เพื่อเพิ่มสตามิน่ารัวๆ แทนการปล่อยให้โดนลด
        TakeStaminaEvent:FireServer(100) 
    end
end)
]]--
