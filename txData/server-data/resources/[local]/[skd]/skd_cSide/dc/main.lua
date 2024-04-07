ESX = nil
local playersOnServer = 0
CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Wait(0)
    end
end)

AddEventHandler('playerDropped', function(reason)
    playersOnServer = playersOnServer - 1
    -- print('Player ' .. GetPlayerName(source) .. ' dropped (Reason: ' .. reason .. ')')
end)

local function OnPlayerConnecting()
    playersOnServer = playersOnServer + 1
end

-- AddEventHandler('playerSpawned', OnPlayerConnecting)
AddEventHandler('esx:onPlayerSpawn', OnPlayerConnecting)

CreateThread(function()
    while true do
        Wait(5000)

        SetDiscordAppId(739024981505081404)

        SetRichPresence(playersOnServer .. "/" .. Config.maxClient .. " 🏃🏻‍♀️🏃🏻‍♂️Warga")

        SetDiscordRichPresenceAsset("skd")
        SetDiscordRichPresenceAssetText("RPG Vanilla Freeroam #SKUADCITY")

        SetDiscordRichPresenceAssetSmall("verif")
        SetDiscordRichPresenceAssetSmallText("Verified")

        SetDiscordRichPresenceAction(0, "Website", "https://skuadproduction.github.io/")
        SetDiscordRichPresenceAction(1, "Discord Server", "https://discord.gg/mCEDuP6WGC")
    end
end)
