RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)
	local playerCoords = GetEntityCoords(playerPed)
	local targetCoords = GetEntityCoords(targetPed)

	if target ~= -1 then
		if target == player or #(playerCoords - targetCoords) < 20 then
			TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
		end
	end
end)

Citizen.CreateThread(function()
	--TriggerEvent('chat:addSuggestion', '/twt',  _U('twt_help'),  {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})
    TriggerEvent('chat:removeSuggestion', '/wait')
    TriggerEvent('chat:removeSuggestion', '/emotes')
    TriggerEvent('chat:removeSuggestion', '/radiotest')
    TriggerEvent('chat:removeSuggestion', '/tc')
    TriggerEvent('chat:removeSuggestion', '/unfreeze')
    TriggerEvent('chat:removeSuggestion', '/invin')
    TriggerEvent('chat:removeSuggestion', '/openinvtrunk')
    TriggerEvent('chat:removeSuggestion', '/pekerjaan')
    TriggerEvent('chat:removeSuggestion', '/showbills')
    TriggerEvent('chat:removeSuggestion', '/delcarplate')
    TriggerEvent('chat:removeSuggestion', '/do123')
    TriggerEvent('chat:removeSuggestion', '/giveitem')
    TriggerEvent('chat:removeSuggestion', '/giveweapon')
    TriggerEvent('chat:removeSuggestion', '/heal')
    TriggerEvent('chat:removeSuggestion', '/joinradio')
    TriggerEvent('chat:removeSuggestion', '/joinsecradio')
    TriggerEvent('chat:removeSuggestion', '/clothingexit')
    TriggerEvent('chat:removeSuggestion', '/coords')
    TriggerEvent('chat:removeSuggestion', '/version')
    TriggerEvent('chat:removeSuggestion', '/nearby')
    TriggerEvent('chat:removeSuggestion', '/me123')
    TriggerEvent('chat:removeSuggestion', '/car')
    TriggerEvent('chat:removeSuggestion', '/cls')
    TriggerEvent('chat:removeSuggestion', '/clear')
    TriggerEvent('chat:removeSuggestion', '/clearloadout')
    TriggerEvent('chat:removeSuggestion', '/kill')
    TriggerEvent('chat:removeSuggestion', '/cardel')
    TriggerEvent('chat:removeSuggestion', '/clsall')
    TriggerEvent('chat:removeSuggestion', '/warn')
    TriggerEvent('chat:removeSuggestion', '/admin')
    TriggerEvent('chat:removeSuggestion', '/skin')
    TriggerEvent('chat:removeSuggestion', '/dv')
    TriggerEvent('chat:removeSuggestion', '/giveweaponcomponent')
    TriggerEvent('chat:removeSuggestion', '/giveaccountmoney')
    TriggerEvent('chat:removeSuggestion', '/char')
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/wait')
        TriggerEvent('chat:removeSuggestion', '/emotes')
        TriggerEvent('chat:removeSuggestion', '/radiotest')
        TriggerEvent('chat:removeSuggestion', '/tc')
        TriggerEvent('chat:removeSuggestion', '/unfreeze')
        TriggerEvent('chat:removeSuggestion', '/invin')
        TriggerEvent('chat:removeSuggestion', '/openinvtrunk')
        TriggerEvent('chat:removeSuggestion', '/pekerjaan')
        TriggerEvent('chat:removeSuggestion', '/showbills')
        TriggerEvent('chat:removeSuggestion', '/delcarplate')
        TriggerEvent('chat:removeSuggestion', '/do123')
        TriggerEvent('chat:removeSuggestion', '/giveitem')
        TriggerEvent('chat:removeSuggestion', '/giveweapon')
        TriggerEvent('chat:removeSuggestion', '/heal')
        TriggerEvent('chat:removeSuggestion', '/joinradio')
        TriggerEvent('chat:removeSuggestion', '/joinsecradio')
        TriggerEvent('chat:removeSuggestion', '/clothingexit')
        TriggerEvent('chat:removeSuggestion', '/coords')
        TriggerEvent('chat:removeSuggestion', '/version')
        TriggerEvent('chat:removeSuggestion', '/nearby')
        TriggerEvent('chat:removeSuggestion', '/me123')
	end
end)



-- /ME && /DO
-- @desc Client-side /me handling
-- @author Elio
-- @version 3.0

local peds = {}

-- Localization
local GetGameTimer = 5000

-- @desc Draw text in 3d
-- @param coords world coordinates to where you want to draw the text
-- @param text the text to display
-- FOR /ME
local function draw3dText(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)

    -- Format the text
    SetTextColour(255, 51, 153,255)
    SetTextScale(0.0, 0.5 * scale)
    SetTextFont(0)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()

end

-- @desc Display the text above the head of a ped
-- @param ped the target ped
-- @param text the text to display
local function displayText(ped, text)
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local targetPos = GetEntityCoords(ped)
    local dist = #(playerPos - targetPos)
    local los = HasEntityClearLosToEntity(playerPed, ped, 17)

    if dist <= 250 and los then
        local exists = peds[ped] ~= nil

        peds[ped] = {
            time = GetGameTimer,
            text = text
        }

        if not exists then
            local display = true

            Citizen.CreateThread(function()
                Citizen.Wait(GetGameTimer)
                display = false
            end)

            while display do
                Wait(0)
                local pos = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 0.0)
                draw3dText(pos, peds[ped].text)
            end

            peds[ped] = nil
        end

    end
end

-- @desc Trigger the display of teh text for a player
-- @param text text to display
-- @param target the target server id
local function onShareDisplay(text, target)
    local player = GetPlayerFromServerId(target)
    if player ~= -1 or target == GetPlayerServerId(PlayerId()) then
        local ped = GetPlayerPed(player)
        displayText(ped, text)
    end
end

-- Register the event
RegisterNetEvent('3dme:shareDisplay', onShareDisplay)


-- FOR /DO
local function draw3dTextDo(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)

    -- Format the text
    SetTextColour(102, 255, 51,255)
    SetTextScale(0.0, 0.5 * scale)
    SetTextFont(0)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()

end

-- @desc Display the text above the head of a ped
-- @param ped the target ped
-- @param text the text to display
local function displayTextDo(ped, text)
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local targetPos = GetEntityCoords(ped)
    local dist = #(playerPos - targetPos)
    local los = HasEntityClearLosToEntity(playerPed, ped, 17)

    if dist <= 250 and los then
        local exists = peds[ped] ~= nil

        peds[ped] = {
            time = GetGameTimer,
            text = text
        }

        if not exists then
            local display = true

            Citizen.CreateThread(function()
                Citizen.Wait(GetGameTimer)
                display = false
            end)

            while display do
                Wait(0)
                local pos = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 1.0)
                draw3dTextDo(pos, peds[ped].text)
            end

            peds[ped] = nil
        end

    end
end

-- @desc Trigger the display of teh text for a player
-- @param text text to display
-- @param target the target server id
local function onShareDisplayDo(text, target)
    local player = GetPlayerFromServerId(target)
    if player ~= -1 or target == GetPlayerServerId(PlayerId()) then
        local ped = GetPlayerPed(player)
        displayTextDo(ped, text)
    end
end

-- Register the event
RegisterNetEvent('3ddo:shareDisplay', onShareDisplayDo)