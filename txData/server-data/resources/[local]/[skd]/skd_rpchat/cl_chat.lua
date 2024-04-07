RegisterNetEvent('skd_rpchat:sendProximityMessage')
AddEventHandler('skd_rpchat:sendProximityMessage', function(playerId, title, message, color)
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

--[[CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/me', 'Can show personal actions, face expressions & much more.')
	--TriggerEvent('chat:addSuggestion', '/twt',  _U('help_msg'),  {{name = _U('msg'), help = _U('help_msg')}})
end)]]

local nbrDisplaying = 1

RegisterCommand('me', function(source, args, raw)
    local text = string.sub(raw, 4)
    TriggerServerEvent('3dme:shareDisplay', text, true)
end)

RegisterCommand('do', function(source, args, raw)
    local text = string.sub(raw, 4)
    TriggerServerEvent('3dme:shareDisplay', text, false)
end)

RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, type, source)
    local offset = 1 + (nbrDisplaying*0.15)
    Display(GetPlayerFromServerId(source), text, offset, type)
end)

function Display(mePlayer, text, offset, type)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(5000)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer))
            local coords = GetEntityCoords(PlayerPedId())
            local dist = Vdist2(coordsMe, coords)
            if dist <= 1 then
                 if type then
                    DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z']+offset-0.775, text, type)
                 else
                    DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z']+offset-0.550, text, type)
                 end
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DrawText3D(x,y,z, text, type)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local coords = vector3(p.x, p.y, p.z)
    local playerloc = vector3(x, y, z)
    local distance = Vdist2(playerloc, coords)
    --local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
		if type then
            SetTextScale(0.35, 0.35)
            SetTextFont(0)
            SetTextProportional(1)
            SetTextColour(255, 102, 153, 255)
            SetTextEntry("STRING")
            SetTextCentre(1)
            AddTextComponentString("** "..text.." **")
            DrawText(_x,_y)
            --[[local factor = (string.len(text)) / 370
            DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 59, 8, 49, 68)]]
        else
            SetTextScale(0.35, 0.35)
            SetTextFont(0)
            SetTextProportional(1)
            SetTextColour(0, 255, 255, 255)
            SetTextEntry("STRING")
            SetTextCentre(1)
            AddTextComponentString("** "..text.." **")
            DrawText(_x,_y)
        end
    end
end