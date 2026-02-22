-- [[ Brainrot Radar V5 - 30M+ Elite Edition ]] --
local WEBHOOK_URL = "https://discord.com/api/webhooks/1475196401695854683/HAXmxhC8qu0F1jGMMMgzYzAjznIOcj8HGtqjMRuXCYnziBQAVT05DR1shVItiLTLfdVF"
local MIN_VALUE = 30000000 -- القيمة محددة بـ 30 مليون

local function sendDiscovery(player, value)
    local request = (syn and syn.request) or (http_request) or request
    if request then
        -- تنسيق الرقم عشان يظهر بشكل M في ديسكورد (مثال: 30.5M)
        local formattedValue = string.format("%.1fM", value / 1000000)
        local joinLink = "roblox://placeId=" .. game.PlaceId .. "&gameInstanceId=" .. game.JobId
        
        request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode({
                content = "🚨 **⚠️ صيدة مليووونية (30M+)!!** @everyone",
                embeds = {{
                    title = "💎 هامور عملاق في Steal a Brainrot",
                    description = "هذا السيرفر فيه كنز، ادخل الحين!",
                    fields = {
                        {name = "اللاعب الأسطوري", value = player, inline = true},
                        {name = "القيمة الحالية", value = formattedValue, inline = true},
                        {name = "رابط الدخول المباشر", value = "[اضغط هنا للدخول فوراً](" .. joinLink .. ")"}
                    },
                    color = 16766720 -- لون ذهبي
                }}
            })
        })
    end
end

-- فحص السيرفر بدقة
local found = false
for _, p in pairs(game.Players:GetPlayers()) do
    local stats = p:findFirstChild("leaderstats")
    if stats then
        local val = stats:findFirstChild("Brainrot") or stats:findFirstChild("Value")
        if val and val.Value >= MIN_VALUE then
            sendDiscovery(p.Name, val.Value)
            found = true
            break
        end
    end
end

-- نظام التنقل التلقائي السريع (Server Hop)
task.wait(8) -- وقت انتظار كافي للفحص قبل الانتقال
if not found then
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"))
    for _, s in pairs(servers.data) do
        if s.playing < s.maxPlayers and s.id ~= game.JobId then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id)
            break
        end
    end
end
