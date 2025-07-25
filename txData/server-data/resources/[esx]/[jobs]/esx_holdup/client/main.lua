local holdingUp = false
local store = ''
local blipRobbery = nil

function DrawTxt(x,y, width, height, scale, text, r, g, b, a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then
        SetTextOutline()
    end
	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width / 2, y - height / 2 + 0.005)
end

RegisterNetEvent('esx_holdup:currentlyRobbing')
AddEventHandler('esx_holdup:currentlyRobbing', function(currentStore)
	holdingUp, store = true, currentStore
end)

RegisterNetEvent('esx_holdup:killBlip')
AddEventHandler('esx_holdup:killBlip', function()
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdup:setBlip')
AddEventHandler('esx_holdup:setBlip', function(position)
	blipRobbery = AddBlipForCoord(position)
	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 2.0)
	SetBlipColour(blipRobbery, 3)
	PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdup:tooFar')
AddEventHandler('esx_holdup:tooFar', function()
	holdingUp, store = false, ''
	ESX.ShowNotification(_U('robbery_cancelled'))
end)

RegisterNetEvent('esx_holdup:robberyComplete')
AddEventHandler('esx_holdup:robberyComplete', function(award)
	holdingUp, store = false, ''
	ESX.ShowNotification(_U('robbery_complete', award))
end)

RegisterNetEvent('esx_holdup:startTimer')
AddEventHandler('esx_holdup:startTimer', function()
	local timer = Stores[store].secondsRemaining
	CreateThread(function()
		while timer > 0 and holdingUp do
			Wait(1000)
			if timer > 0 then
				timer = timer - 1
			end
		end
	end)
	CreateThread(function()
		while holdingUp do
			Wait(0)
			DrawTxt(0.66, 1.44, 1.0, 1.0, 0.4, _U('robbery_timer', timer), 255, 255, 255, 255)
		end
	end)
end)

--[[CreateThread(function()
	for k,v in pairs(Stores) do
		local blip = AddBlipForCoord(v.position)
		SetBlipSprite(blip, 156)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('shop_robbery'))
		EndTextCommandSetBlipName(blip)
	end
end)]]

local police = 0
CreateThread(function()
	while true do
		Wait(0)
		local playerPos, letSleep = GetEntityCoords(PlayerPedId()), true
		for k,v in pairs(Stores) do
			local distance = #(playerPos - v.position)
			if distance < Config.Marker.DrawDistance then
				if not holdingUp then
                    letSleep = false
					DrawMarker(Config.Marker.Type, v.position, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)
					if distance < 2.0 then
						ESX.ShowHelpNotification(_U('press_to_rob', v.nameOfStore))
						ESX.TriggerServerCallback('esx_scoreboard:getConnectedPlayers', function(connectedPlayers)
							for k,v in pairs(connectedPlayers) do
								if v.job == 'police' then
									police = 1
								end
							end
						end)
						if police > 0 then
							if IsControlJustReleased(0, 38) then
								if IsPedArmed(PlayerPedId(), 4) then
									TriggerServerEvent('esx_holdup:robberyStarted', k)
								else
									ESX.ShowNotification(_U('no_threat'))
								end
							end
						else
							ESX.ShowNotification('No Police in Town')
						end
					end
				end
                break
			end
		end
		if holdingUp then
            letSleep = false
			if #(playerPos - Stores[store].position) > Config.MaxDistance then
				TriggerServerEvent('esx_holdup:tooFar', store)
			end
		end
        if letSleep then
            Wait(500)
        end
	end
end)
