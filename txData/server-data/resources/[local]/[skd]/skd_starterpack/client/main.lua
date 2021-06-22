ESX = nil
local hasAlreadyEnteredMarker, lastZone
local currentAction, currentActionMsg, currentActionData = nil, nil, {}
local status = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)

end)


function getStarterpack()
	local playerPed = PlayerPedId()
	local generatedPlate = exports['esx_vehicleshop']:GeneratePlate()

	ESX.TriggerServerCallback('skd_starterpack:getStatusUser', function(success)
		if success then
			ESX.TriggerServerCallback('skd_starterpack:getStarterpack', function(success)
				if success then
					ESX.Game.SpawnVehicle(Config.VehicleModel, Config.SpawnVehicle, Config.SpawnHeading, function(vehicle)
						TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
						SetVehicleNumberPlateText(vehicle, generatedPlate)
		
						FreezeEntityPosition(playerPed, false)
						SetEntityVisible(playerPed, true)
					end)
				else
					ESX.ShowNotification(_U('error'))
				end
			end, Config.VehicleModel, generatedPlate)			
		end
	end, oldstatus)
	

end











function treasureMenu(zone)
	local elements = {
		{label = _U('claim'), value = 'claim'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'general_menu', {
		title    = _U('claim_starterpack'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'claim_confirm', {
			title    = _U('starterpack'),
			align    = 'bottom-right',
			elements = {
				{label = _U('no'),  value = 'no'},
				{label = _U('yes'), value = 'yes'}
		}}, function(data2, menu2)
			if data2.current.value == 'yes' then
				getStarterpack()
			end

			menu2.close()
		end, function(data2, menu2)
			menu2.close()
		end)
	end, function(data, menu)
		menu.close()

		currentAction     = 'starterpack_menu'
		currentActionMsg  = _U('press_menu')
		currentActionData = {zone = zone}
	end)
end

AddEventHandler('skd_starterpack:hasEnteredMarker', function(zone)
	currentAction     = 'starterpack_menu'
	currentActionMsg  = _U('press_menu')
	currentActionData = {zone = zone}
end)

AddEventHandler('skd_starterpack:hasExitedMarker', function(zone)
	currentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, letSleep, currentZone = false, false
		local distance = #(playerCoords - Config.MarkerPosition)

		if distance < Config.DrawDistance then
			DrawMarker(Config.Type, Config.MarkerPosition, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, nil, nil, false)
			letSleep = false

			if distance < Config.Size.x then
				isInMarker  = true
				currentZone = k
				lastZone    = k
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('skd_starterpack:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('skd_starterpack:hasExitedMarker', lastZone)
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if currentAction then
			ESX.ShowHelpNotification(currentActionMsg)

			if IsControlJustReleased(0, 38) then
				if currentAction == 'starterpack_menu' then
					treasureMenu(currentActionData.zone)
				end

				currentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)
