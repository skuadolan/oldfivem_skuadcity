local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

local menuIsShowed				  = false
local hasAlreadyEnteredMarker     = false
local lastZone                    = nil
local isInjaillistingMarker 		  = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function ShowJailListingMenu(data)
	

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'jaillisting',
			{
				title    = _U('jail_center'),
				elements = {
				{label = _U('citizen_wear'), value = 'citizen_wear'},
				{label = _U('jail_wear'), value = 'jail_wear'},
				{label = _U('oprasi_wear'), value = 'oprasi_wear'},
				{label = _U('rs_wear'), value = 'rs_wear'},
			},
			},
			function(data, menu)
			local ped = GetPlayerPed(-1)
			menu.close()

			if data.current.value == 'citizen_wear' then
				
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jailSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
				end)

			end

			if data.current.value == 'jail_wear' then 

				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jailSkin)
					if skin.sex == 0 then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 5, 0, 0)--lengan
						SetPedComponentVariation(GetPlayerPed(-1), 4, 9, 4, 0)--Jean
						SetPedComponentVariation(GetPlayerPed(-1), 6, 61, 0, 0)--sepatu
						SetPedComponentVariation(GetPlayerPed(-1), 11, 5, 0, 0)--baju
						SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)--rompi kuning
					elseif skin.sex == 1 then
                        SetPedComponentVariation(GetPlayerPed(-1), 3, 14, 0, 0)--Gants
                        SetPedComponentVariation(GetPlayerPed(-1), 4, 3, 15, 0)--Jean
                        SetPedComponentVariation(GetPlayerPed(-1), 6, 52, 0, 0)--Chaussure
                        SetPedComponentVariation(GetPlayerPed(-1), 11, 73, 0, 0)--Veste
                        SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 0)--GiletJaune
					else
						TriggerEvent('skinchanger:loadClothes', skin, jailSkin.skin_female)
					end
					
				end)
			end

			if data.current.value == 'oprasi_wear' then 

				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, oprasiSkin)
					if skin.sex == 0 then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 86, 0, 0)--lengan
						SetPedComponentVariation(GetPlayerPed(-1), 4, 40, 3, 0)--Jean
						SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)--sepatu
						SetPedComponentVariation(GetPlayerPed(-1), 11, 67, 3, 0)--baju
						SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)--rompi kuning
					elseif skin.sex == 1 then
                        SetPedComponentVariation(GetPlayerPed(-1), 3, 14, 0, 0)--Gants
                        SetPedComponentVariation(GetPlayerPed(-1), 4, 3, 15, 0)--Jean
                        SetPedComponentVariation(GetPlayerPed(-1), 6, 52, 0, 0)--Chaussure
                        SetPedComponentVariation(GetPlayerPed(-1), 11, 73, 0, 0)--Veste
                        SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 0)--GiletJaune
					else
						TriggerEvent('skinchanger:loadClothes', skin, oprasiSkin.skin_female)
					end
					
				end)
			end

			if data.current.value == 'rs_wear' then 

				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, rsSkin)
					if skin.sex == 0 then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 6, 0, 0)--lengan
						SetPedComponentVariation(GetPlayerPed(-1), 4, 65, 2, 0)--Jean
						SetPedComponentVariation(GetPlayerPed(-1), 6, 65, 2, 0)--sepatu
						SetPedComponentVariation(GetPlayerPed(-1), 11, 144, 2, 0)--baju
						SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)--rompi kuning
					elseif skin.sex == 1 then
                        SetPedComponentVariation(GetPlayerPed(-1), 3, 14, 0, 0)--Gants
                        SetPedComponentVariation(GetPlayerPed(-1), 4, 3, 15, 0)--Jean
                        SetPedComponentVariation(GetPlayerPed(-1), 6, 52, 0, 0)--Chaussure
                        SetPedComponentVariation(GetPlayerPed(-1), 11, 73, 0, 0)--Veste
                        SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 0)--GiletJaune
					else
						TriggerEvent('skinchanger:loadClothes', skin, rsSkin.skin_female)
					end
					
				end)
			end


		end,
			function(data, menu)
				menu.close()
			end
		)

	
end

AddEventHandler('eden_jail:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local sleep = true
		for i=1, #Config.Zones, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, true) < Config.DrawDistance) then
				sleep = false
			end
		end
		if sleep then
			Citizen.Wait(50)
		end
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		isInJaillistingMarker  = false
		local currentZone = nil
		local sleep = true
		for i=1, #Config.Zones, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, true) < Config.ZoneSize.x) then
				sleep = false
				isInJaillistingMarker  = true
				SetTextComponentFormat('STRING')
            	AddTextComponentString(_U('access_jail_center'))
            	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end
		end
		if sleep then
			Citizen.Wait(50)
		end
		if isInJaillistingMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
		end
		if not isInJaillistingMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('eden_jail:hasExitedMarker')
		end
	end
end)



-- Menu Controls
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, Keys['E']) and isInJaillistingMarker and not menuIsShowed then
			ShowJailListingMenu()
		end
	end
end)
