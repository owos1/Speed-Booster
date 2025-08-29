-- LocalScript (ضع هذا في StarterCharacterScripts)

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

-- اسم اللاعب الذي نريد التحول إلى شخصيته
local targetPlayerName = "s9cythe"

local function transformCharacter()
    local targetPlayer = Players:FindFirstChild(targetPlayerName)
    
    if targetPlayer and targetPlayer.Character then
        local newCharacter = targetPlayer.Character:Clone()
        
        -- إزالة أي سكريبتات أو كائنات قد تسبب مشاكل
        for _, obj in ipairs(newCharacter:GetDescendants()) do
            if obj:IsA("Script") or obj:IsA("LocalScript") then
                obj:Destroy()
            end
        end

        Player.Character = newCharacter
        newCharacter.Parent = workspace

        print("تم تغيير الشخصية بنجاح إلى " .. targetPlayerName)
        Character:Destroy()
    else
        warn("اللاعب " .. targetPlayerName .. " غير موجود حاليًا في اللعبة.")
    end
end

-- انتظر لعدة ثوانٍ للتأكد من أن شخصية اللاعب المستهدف قد تم تحميلها
task.wait(5)
transformCharacter()
