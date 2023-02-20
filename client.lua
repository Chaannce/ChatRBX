local Player = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService")
local RequestFunction = (syn or syn.request) or request or http_request
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/bleklib/main/library.lua", true))()
local Logo = { "ChatGPT in ROBLOX! - ChatRBX", "Created by Cyros and PixelPenguin" }

if not RequestFunction then
    Player:Kick[[Exploit not supported.]]
    return
end

local Uri = "https://example.com"

for _, v in pairs(Logo) do
    print(v)
end

local Window = UILibrary:Create({
    Name = "ChatRBX",
    StartupSound = {
        Toggle = true,
        SoundID = "rbxassetid://6958727243",
        TimePosition = 1,
    }
})

local MainTab = Window:Tab("Main")
local OptionsTab = Window:Tab("Options")

-- Main Tab:

MainTab:Label[[Make sure you press "F9" to view messages.]]

local Message = nil

MainTab:Textbox("Send Text", function(v)
    Message = v
end)

MainTab:Button("Send Message", function()
    print(string.format("Client > %s", Message))
    
    local Message_Encoded = HttpService:UrlEncode(Message)
    
    local Response = RequestFunction({
        Url = string.format("%s?prompt=%s", Uri, Message_Encoded),
        Method = "GET"
    })
        
    print(string.format("Server > %s", Response.Body))
end)

-- Options / UI Tab:

OptionsTab:Button("Destroy UI", function()
    print("Ending...")
    task.wait(0.5)
    Window:Exit()
    print("---------------------------------------")
end)
