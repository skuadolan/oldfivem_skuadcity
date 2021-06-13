ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
SetNuiFocus(false, false)
end)

RegisterNetEvent('errormessage2')
AddEventHandler('errormessage2', function()
PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
end)

RegisterNetEvent('spinit2')
AddEventHandler('spinit2', function()
	PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)

	SendNUIMessage({
			canspin = true
		})
	Citizen.Wait(100)

		SendNUIMessage({
			canspin = false
		})
end)

RegisterNUICallback('close', function(data, cb)

	SetNuiFocus(false, false)
	SendNUIMessage({
		show = false
	})
	cb("ok")
	PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)
end)

RegisterNUICallback('payforplayer', function(winnings, cb)
	PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", 0, 0, 1)
	TriggerServerEvent('payforplayer2',winnings)
end)

RegisterNUICallback('playerpays', function(bet, cb)
	TriggerServerEvent('playerpays2',bet)
end)

local moneymachine_slot = {
	vector3(968.4396, 65.88132, 75.73474),
	vector3(968.5714, 67.74066, 75.73474),
	vector3(970.378, 67.76704, 75.73474),
	vector3(970.2462, 71.36704, 75.73474),
	vector3(969.6792, 73.13406, 75.73474),
	vector3(971.4462, 73.71428, 75.73474),
	vector3(972.0922, 71.94726, 75.73474),
	vector3(975.4154, 73.12088, 75.73474),
	vector3(976.9056, 74.24176, 75.73474),
	vector3(978.0396, 72.72528, 75.73474),
	vector3(976.523, 71.6044, 75.73474),
	vector3(978.7384, 68.76924, 75.73474),
	vector3(980.2286, 67.71428, 75.73474),
	vector3(979.134, 66.17144, 75.73474),
	vector3(975.6792, 63.24396, 75.73474),
	vector3(974.0176, 62.45274, 75.73474),
	vector3(973.1472, 64.27252, 75.73474),
	vector3(974.8088, 65.14286, 75.73474),
	vector3(977.6044, 67.26594, 75.73474),
	vector3(970.4044, 65.88132, 75.73474)
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(moneymachine_slot) do
			if(Vdist(v, pos.x, pos.y, pos.z) < 20.0)then
				DrawMarker(29, v + 0.2, 0, 0, 0, 0, 0, 0, 0.6001, 1.0001, 0.6, 0, 255, 5, 90, 1,0, 0,1)
				if(Vdist(v, pos.x, pos.y, pos.z) < 1.0)then
						ESX.ShowHelpNotification('tekan ~INPUT_CONTEXT~')
					if IsControlJustPressed(1, 38) then
						SendNUIMessage({
							show = true
						})
						SetNuiFocus(true,true)
						PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", 0, 0, 1)
					end
				end
			end
		end
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
