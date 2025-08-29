-- اسم السكريبت: SpeedBooster
-- هذا السكريبت يوضع في ملف .lua

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

if Player then
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    
    -- زيادة سرعة المشي
    Humanoid.WalkSpeed = 100 
    
    print("تم تفعيل سكريبت زيادة السرعة!")
end