local HttpService = game:GetService("HttpService")
local RequestFunction = (syn or syn.request) or request or http_request
local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/bleklib/main/library.lua"))()
local logo = {"ChatGPT in ROBLOX! - ChatRBX", "Created by Cyros and PixelPenguin"}

local URI = "add your url here"

for _, v in pairs(logo) do
    print(v)
end

local Window = UILibrary:Create({
    Name = "ChatRBX",
    StartupSound = {
        Toggle = true,
        SoundID = "rbxassetid://6958727243",
        TimePosition = 1
    }
})

local MainTab = Window:Tab("Main")
local OptionsTab = Window:Tab("Options")

-- Main Tab:

MainTab:Label("Make sure you press 'F9' to see messages")

local Message

MainTab:Textbox("Send Text", function(v)
    Message = v
end)

MainTab:Button("Send Message", function()
    print("Client > " .. Message)
    
    local Message_Encoded = HttpService:UrlEncode(Message)
    
    local response = RequestFunction({
        Url = URI .. "?prompt=" .. Message_Encoded,
        Method = "GET"
    })

    print("Server > " .. response.Body)
end)

-- Options / UI Tab:

OptionsTab:Button("Destroy UI", function()
    print("Ending...")
    task.wait(.5)
    Window:Exit()
    print("---------------------------------------")
end)
