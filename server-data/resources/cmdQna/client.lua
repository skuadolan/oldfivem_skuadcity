--[[ help script made at JEVA by Zua (https://github.com/thatziv) ]]


-- This function is used to register a command for the chat. 
--When this is exectuted, it will execute a function, doing the msg function to the client
RegisterCommand('aboutus', function()
    msg("- WELCOME TO SKUAD CITY -")
    msg("Website: skuadcity.com")
    msg("~Happy Roleplay!")
end, false)

RegisterCommand('help', function()
    msg("if you need some help, please do..")
    msg("/report and admin will arrive to you and help you")
end, false)

-- We declare this 'msg' function on the bottom due to better practices.
function msg(text)
    -- TriggerEvent will send a chat message to the client in the prefix as red
    TriggerEvent("chatMessage",  "[Server]", {255,0,0}, text)
end