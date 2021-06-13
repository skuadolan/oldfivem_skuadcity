local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local playerCoords, targetCoords = GetEntityCoords(playerPed), GetEntityCoords(targetPed)

	if target == player or #(playerCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
	end
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/ooc', 'Out of character chat')
  end)

--[[Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/twt',  _U('twt_help'),  {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})
end)
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/twt')
	end
end)]]



-----------
-- 3D ME --
-----------

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/me', 'Can show personal actions, face expressions & much more.')
end)

local nbrDisplaying = 1

RegisterCommand('me', function(source, args, raw)
    local text = string.sub(raw, 4)
    TriggerServerEvent('3dme:shareDisplay', text)
end)

RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, source)
    local offset = 1 + (nbrDisplaying*0.15)
    Display(GetPlayerFromServerId(source), text, offset)
end)

function Display(mePlayer, text, offset)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(5000)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 500 then
                 DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z'], text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DrawText3D(x,y,z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = scale * fov
  if onScreen then
		SetTextScale(0.30, 0.40)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(102, 255, 51, 215)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
		-- local factor = (string.len(text)) / 370
		-- DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
    end
end

-- ############################################
-- --------------------------------------------
-- 3dme : /me command but its 3D printed
-- Author : Elio
-- Client side
-- --------------------------------------------
-- ############################################

-- --------------------------------------------
-- Settings
-- --------------------------------------------

local defaultScale = 0.5 -- Text scale
local color = { r = 0, g = 0, b = 128, a = 255 } -- Text color
local font = 0 -- Text font
local displayTime = 5000 -- Duration to display the text (in ms)
local distToDraw = 250 -- Min. distance to draw 

-- --------------------------------------------
-- Variable
-- --------------------------------------------

local pedDisplaying = {}

-- --------------------------------------------
-- Functions
-- --------------------------------------------

-- OBJ : draw text in 3d
-- PARAMETERS :
--      - coords : world coordinates to where you want to draw the text
--      - text : the text to display
local function DrawText3D(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 130 / (GetGameplayCamFov() * dist)

    --if onScreen then

        -- Format the text
        SetTextColour(255, 51, 153, 255)
        SetTextScale(0.0, defaultScale * scale)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextDropShadow()
        SetTextCentre(true)

        -- Diplay the text
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        SetDrawOrigin(coords, 0)
        EndTextCommandDisplayText(0.0, 0.0)
        ClearDrawOrigin()

    --end
end

-- OBJ : handle the drawing of text above a ped head
-- PARAMETERS :
--      - coords : world coordinates to where you want to draw the text
--      - text : the text to display
local function Display(ped, text)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local pedCoords = GetEntityCoords(ped)
    local dist = #(playerCoords - pedCoords)

    if dist <= distToDraw then

        pedDisplaying[ped] = (pedDisplaying[ped] or 1) + 1

        -- Timer
        local display = true

        Citizen.CreateThread(function()
            Wait(displayTime)
            display = false
        end)

        -- Display
        local offset = 0.8 + pedDisplaying[ped] * 0.1
        while display do
            if HasEntityClearLosToEntity(playerPed, ped, 17 ) then
                local x, y, z = table.unpack(GetEntityCoords(ped))
                z = z + offset
                DrawText3D(vector3(x, y, z), text)
            end
            Wait(0)
        end

        pedDisplaying[ped] = pedDisplaying[ped] - 1

    end
end

-- --------------------------------------------
-- Event
-- --------------------------------------------

RegisterNetEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text, serverId)
    local ped = GetPlayerPed(GetPlayerFromServerId(serverId))
    Display(ped, text)
end)





RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)
	local playerCoords = GetEntityCoords(playerPed)
	local targetCoords = GetEntityCoords(targetPed)

	if target == player or #(playerCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
	end
end)