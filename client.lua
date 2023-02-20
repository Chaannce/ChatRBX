--[[
    Name: client.lua
    Author(s): Yeild, PixelPenguin, PixelCircuit
]]

local Player = game:GetService("Players").LocalPlayer
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")
local RequestFunction = (syn or syn.request) or request or http_request
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/bleklib/main/library.lua", true))()
local Logo = {"ChatGPT in ROBLOX! - ChatRBX", "Created by Yxild, PixelPenguin and PixelCircuit!"}
local DCSE = game:GetService("ReplicatedStorage")["DefaultChatSystemChatEvents"]

if (not RequestFunction) then
    Player:Kick [[Exploit not supported.]]
    return
end

for _, v in pairs(Logo) do
    print(v)
end

local Uri = "https://example.com"

local Window = Library:Create({
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

MainTab:Label[[Make sure you press "F9" to view messages.]]

local Printing = false
local Enabled = false
local Message = nil

MainTab:Textbox("Send Text", function(v)
    Message = v
end)

MainTab:Button("Send Message", function()
    local Message_Encoded = HttpService:UrlEncode(Message)

    local Response = RequestFunction({
        Url = string.format("%s?prompt=%s", Uri, Message_Encoded),
        Method = "GET"
    })

    if (Enabled == true) then
        if (not Printing) then
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = string.format("[ChatRBX]: Client > %s\nServer > %s", Message, Response.Body),
                Color = Color3.fromRGB(0, 255, 0),
                Font = Enum.Font.SourceSansBold,
            })
        else
            print(string.format("Client > %s", Message))
            print(string.format("Server > %s", Response.Body))
        end
    end
end)

MainTab:Toggle("Aimbot", function(v)
    Enabled = v
end)

MainTab:Toggle("Aimbot", function(v)
    Printing = v
end)

-- Options / UI Tab:

OptionsTab:Button("Destroy UI", function()
    print("Ending...")
    task.wait(0.5)
    Window:Exit()
    print("---------------------------------------")
end)
