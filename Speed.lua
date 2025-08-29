-- تعريف المتغيرات
local textBox = script.Parent
local musicService = game:GetService("SoundService")

-- جدول يحتوي على أكواد الموسيقى
local musicLibrary = {
    -- يمكنك تغيير الأكواد وIDs الموسيقى هنا
    -- للعثور على IDs الموسيقى، اذهب إلى Roblox Library
    ["happy"] = 123456789,   -- مثال: ID لموسيقى سعيدة
    ["epic"] = 987654321,    -- مثال: ID لموسيقى ملحمية
    ["chill"] = 112233445    -- مثال: ID لموسيقى هادئة
}

-- الدالة المسؤولة عن تشغيل الموسيقى
function playMusic(id)
    -- إيقاف أي موسيقى سابقة
    if musicService.Playing then
        musicService:Stop()
    end
    
    -- إنشاء ملف الصوت وتشغيله
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. id
    sound.Parent = musicService
    
    sound:Play()
    sound.Ended:Wait()
    
    -- حذف ملف الصوت بعد الانتهاء
    sound:Destroy()
end

-- حدث عندما يضغط اللاعب على Enter في مربع النص
textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local inputCode = string.lower(textBox.Text) -- تحويل النص إلى حروف صغيرة
        
        -- التحقق من الكود المكتوب
        if musicLibrary[inputCode] then
            print("Playing music for code: " .. inputCode)
            playMusic(musicLibrary[inputCode])
            textBox.Text = "" -- مسح النص بعد التشغيل
        else
            print("Invalid code: " .. inputCode)
            textBox.PlaceholderText = "Invalid Code!"
            wait(2)
            textBox.PlaceholderText = "Enter Music Code"
            textBox.Text = ""
        end
    end
end)
