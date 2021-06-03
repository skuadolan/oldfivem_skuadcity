ESX = nil


local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


local hudStatus = true
local health = 0
local armor = 0
local myStamina = 0
local usingSeatbelt = false
local isTalking = false
local myOxygen = 0.0

local hour = 0
local minute = 0

local opacityBars = 0

local Addition = 0.0

local HudStage = 1



opacity = 0

local thirsty = 0

local hunger = 0

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(5000)

		TriggerEvent('esx_status:getStatus', 'hunger', function(status)
			thirsty = status.val/1000000*100

		end)

		TriggerEvent('esx_status:getStatus', 'thirst', function(status)
			hunger = status.val/1000000*100

		end)

	end

end)


oxygenTank = 100.0

RegisterNetEvent("RemoveOxyTank")
AddEventHandler("RemoveOxyTank",function()
	if oxygenTank > 25.0 then
		oxygenTank = 25.0
	end
end)

RegisterNetEvent("UseOxygenTank")
AddEventHandler("UseOxygenTank",function()
	oxygenTank = 100.0
end)




function drawRct(x,y,width,height,r,g,b,a)

	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

function NdrawTxt(x, y, width, height, scale, text, r, g, b, a, center)
  SetTextFont(6)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 1, 1, 1, 1)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextCentre(center)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x - width / 2, y - height / 2 + 0.005)
end


local voipTypes = {

	{type = "Whisper", event = "pv:voip1"},
	{type = "Normal", event = "pv:voip2"},
	{type = "Yell", event = "pv:voip3"}
}

local voip = {}
voip['default'] = {name = 'default', setting = 18.0}
voip['whisper'] = {name = 'whisper', setting = 4.0}
voip['local'] = {name = 'local', setting = 18.0}
voip['yell'] = {name = 'yell', setting = 35.0}

AddEventHandler('np-base:playerSessionStarted', function()
	NetworkSetTalkerProximity(voice.default)
end)

RegisterNetEvent('pv:voip')
AddEventHandler('pv:voip', function(voipDistance)

	NotificationMessage("Your VOIP is now ~b~" .. voipsetting ..".")
	NetworkSetTalkerProximity(distanceSetting)

end)


distanceSetting = 5.0
NetworkSetTalkerProximity(5.0)

voipsetting = "Normal"
RegisterNetEvent('pv:voip1')
AddEventHandler('pv:voip1', function(voipDistance)
	distanceSetting = 4.0
	NetworkSetTalkerProximity(distanceSetting)
	voipsetting = "Whisper"
end)

RegisterNetEvent('pv:voip2')
AddEventHandler('pv:voip2', function(voipDistance)
	distanceSetting = 18.0
	NetworkSetTalkerProximity(distanceSetting)
	voipsetting = "Normal"
end)


RegisterNetEvent('pv:voip3')
AddEventHandler('pv:voip3', function(voipDistance)
	distanceSetting = 35.0
	NetworkSetTalkerProximity(distanceSetting)
	voipsetting = "Yell"
end)


Citizen.CreateThread(function()

	while true do
		--[[if sleeping then
			if IsControlJustPressed(0,38) then
				sleeping = false
				DetachEntity(GetPlayerPed(-1), 1, true)
			end
		end]]


		if IsControlJustPressed(0,40) then
			if HudStage == 1 then
				HudStage = 2
			elseif HudStage == 2 then
				HudStage = 3
				Addition = 0.001
			elseif HudStage == 3 then
				HudStage = 4
				Addition = 0.001
			else
				HudStage = 1
				Addition = 0.001
			end
			TriggerEvent("disableHUD",HudStage)
		end

		if HudStage == 4 then
			if opacityBars < 255 then
				opacityBars = opacityBars + 1
			else
				opacityBars = 255
			end
			if Addition < 0.2 then
				Addition = Addition + 0.001
			end

			DrawRect(0,-0.2 + Addition, 2.0, 0.2, 1, 1, 1, opacityBars)
			DrawRect(0,1.20 - Addition, 2.0, 0.2, 1, 1, 1, opacityBars)
		end

		if HudStage ~= 4 then
			if opacityBars > 0 then
				opacityBars = opacityBars - 1
				Addition = Addition + 0.001
				DrawRect(0,0 - Addition, 2.0, 0.2, 1, 1, 1, opacityBars)
				DrawRect(0,0.98 + Addition, 2.0, 0.2, 1, 1, 1, opacityBars)
			end
		end

		last_health = GetVehicleBodyHealth(GetVehiclePedIsIn(GetPlayerPed(-1),false))
		Citizen.Wait(1)

	    if IsHudComponentActive(1) then
	        HideHudComponentThisFrame(1)
	    end

	    if IsHudComponentActive(6) then
	        HideHudComponentThisFrame(6)
	    end

	    if IsHudComponentActive(7) then
	        HideHudComponentThisFrame(7)
	    end

	    if IsHudComponentActive(9) then
	        HideHudComponentThisFrame(9)
	    end

	    if IsHudComponentActive(0) and not IsPedInAnyVehicle(GetPlayerPed( -1 ), true) then
	        HideHudComponentThisFrame(0)
	    end

	    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)

		SetPedMinGroundTimeForStungun(GetPlayerPed(-1), 16000)

		if HudStage < 3 then

			local get_ped = GetPlayerPed(-1) -- current ped
			local get_ped_veh = GetVehiclePedIsIn(get_ped,false) -- Current Vehicle ped is in
			local plate_veh = GetVehicleNumberPlateText(get_ped_veh) -- Vehicle Plate
			local veh_stop = IsVehicleStopped(get_ped_veh) -- Parked or not
			local veh_engine_health = GetVehicleEngineHealth(get_ped_veh) -- Vehicle Engine Damage
			local veh_body_health = GetVehicleBodyHealth(get_ped_veh)
			local veh_burnout = IsVehicleInBurnout(get_ped_veh) -- Vehicle Burnout
			local thespeed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
			local siren_on = IsVehicleSirenOn(get_ped_veh)
			local varVoipSet = 0
			local stamina = 100 - GetPlayerSprintStaminaRemaining(PlayerId())


			if oxygenTank > 0 and IsPedSwimmingUnderWater(GetPlayerPed(-1)) then
				SetPedDiesInWater(GetPlayerPed(-1), true)
				if oxygenTank > 25.0 then
					oxygenTank = oxygenTank - 0.1
				else
					oxygenTank = oxygenTank - 0.0172
				end
			else
				SetPedDiesInWater(GetPlayerPed(-1), true)
			end

			if IsControlPressed(0, 20) then
				for k,v in ipairs(voipTypes) do
					if v.type == voipsetting then
						if k >= #voipTypes then TriggerEvent(voipTypes[1].event) break else TriggerEvent(voipTypes[k + 1].event) break end
					end
				end
			end

			if distanceSetting == 35.0 then
				varVoipSet = 0.027 * 0.1
			elseif distanceSetting == 18.0 then
				varVoipSet = 0.027 * 0.5
			elseif distanceSetting == 4.0 then
				varVoipSet = 0.027
			end


			if not IsPedSwimmingUnderWater( GetPlayerPed(-1) ) then
				if oxygenTank >= 100.0 then
					oxygenTank = 100.0
				else
					if oxygenTank < 25.0 then
						oxygenTank = oxygenTank + 0.0172
					else
						oxygenTank = oxygenTank + 0.1
					end
				end
			end

			if oxygenTank > 25.0 and not oxyOn then
				oxyOn = false

			elseif oxyOn and oxygenTank < 25.0 then
				oxyOn = true
			end

		    if opacity > 0 and not fadein then
		    	opacity = opacity - 10
		    end

		    if opacity < 250 and fadein then
		    	opacity = opacity + 10
		    end

			if IsControlPressed(0, 244) or IsDisabledControlPressed(0, 249)  then
				talking = true
			else
				talking = false
			end

			drawRct(0.015, 0.9677, 0.1418,0.028,80,80,80,177)
			if GetEntityMaxHealth(GetPlayerPed(-1)) ~= 200 then
				SetEntityMaxHealth(GetPlayerPed(-1), 200)
				SetEntityHealth(GetPlayerPed(-1), 200)
			end
			local health = GetEntityHealth(GetPlayerPed(-1)) - 100

			if health < 1 then health = 100 end

			local varSet = 0.06938 * (health / 100)

			drawRct(0.016, 0.97, 0.06938,0.01,190,190,190,80)
			drawRct(0.016, 0.97, varSet,0.01,60,179,113,177)



			armor = GetPedArmour(GetPlayerPed(-1))
			if armor > 100.0 then armor = 100.0 end

			local varSet = 0.06938 * (armor / 100)

			drawRct(0.0865, 0.97, 0.06938,0.01,190,190,190,80)
			drawRct(0.0865, 0.97, varSet,0.01,0, 153, 255,177)

			if hunger < 0 then
				hunger = 0
			end
			if thirsty < 0 then
				thirsty = 0
			end


			if thirsty > 100 then thirsty = 100 end
			varSet = 0.027 * (thirsty / 100)

			drawRct(0.016, 0.983, 0.0268,0.01,190,190,190,80)
			drawRct(0.016, 0.983, varSet,0.01,260,130,0,177)


			if hunger > 100 then hunger = 100 end
			varSet = 0.0268 * (hunger / 100)

			drawRct(0.044, 0.983, 0.027,0.01,190,190,190,80)
			drawRct(0.044, 0.983, varSet,0.01,0,0,204,177)


			varSet = 0.027 * (oxygenTank / 100)
			drawRct(0.072, 0.983, 0.027,0.01,190,190,190,80)
			drawRct(0.072, 0.983, varSet,0.01,255,255,55,177)

			if distanceSetting == 4.0 then
				varSet = 0.027 * 0.1
			elseif distanceSetting == 18.0 then
				varSet = 0.027 * 0.5
			elseif distanceSetting == 35.0 then
				varSet = 0.027
			end

			if talking  then
				drawRct(0.1, 0.983, varVoipSet,0.01,255, 55, 155,155)
				drawRct(0.1, 0.983, 0.027,0.01,255, 55, 155,170)
			else
				drawRct(0.1, 0.983, varVoipSet,0.01,205,205,205,155)
				drawRct(0.1, 0.983, 0.027,0.01,188,188,188,80)
			end

			varSet = 0.0278 * (stamina / 100)
			drawRct(0.128, 0.983, 0.0278,0.01,190,190,190,80)
			drawRct(0.128, 0.983, varSet,0.01,200, 0, 0,177)


			if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
				fadein = true
			else
				fadein = false
				veh_body_health = 0
			end
		end
	end
end)

Citizen.CreateThread(function()

    while true do
		local mapsOn = false
        Citizen.Wait(1)
        
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			DisplayRadar(true)
		else
			--[[ESX.TriggerServerCallback('skd_core:checkJobs', function(jobs)
				if jobs == 'police' or jobs == 'ambulance' or jobs == 'mechanic' or jobs == 'pedagang' or jobs == 'taxi' then
					mapsOn = true
				else
					mapsOn = false
				end
			end)]]

			if mapsOn then
				DisplayRadar(true)
			else
				DisplayRadar(false)
			end
			
		end
		Citizen.Wait(2000)	
	end
end)

RegisterKeyMapping('HUD', 'Tombol HUD', 'keyboard', ']')
RegisterKeyMapping('Radio', 'Tombol Radio', 'keyboard', 'N')
RegisterKeyMapping('Megaphone', 'Tombol Megaphone', 'keyboard', 'M')
RegisterKeyMapping('Jarak Berbicara', 'Tombol Jarak', 'keyboard', 'Z')