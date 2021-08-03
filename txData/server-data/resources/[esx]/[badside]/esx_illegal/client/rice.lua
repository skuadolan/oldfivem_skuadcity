local spawnedWeeds = 0
local weedPlants = {}
local isPickingUp, isProcessing = false, false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.FarmField.coords, true) < 50 then
			SpawnPadiPlants()
			Citizen.Wait(500)
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.FarmProcess.coords, true) < 5 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('weed_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then
				isProcessing = true
				ProcessWeed()
			end
		else
			Citizen.Wait(500)
		end
	end
end)

function ProcessWeed()
	exports['mythic_notify']:SendAlert('inform', 'Memproses Padi')
	TriggerEvent("mythic_progbar:client:progress", {
		name = "",
		duration = 1500,
		label = "MEMPROSES PADI",
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		animation = {
			animDict = "",
			anim = "",
		},
		prop = {
			model = "",
		}
	}, function(status)
		if not status then
			-- Do Something If Event Wasn't Cancelled
		end
	end)
	TriggerServerEvent('esx_illegal:processPadi')
	local timeLeft = Config.Delays.FarmProcess / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.FarmProcess.coords, false) > 5 then
			exports['mythic_notify']:SendAlert('inform', 'Gagal Memproses')
			TriggerServerEvent('esx_illegal:cancelProcessing')
			break
		end
	end

	isProcessing = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #weedPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(weedPlants[i]), false) < 1 then
				nearbyObject, nearbyID = weedPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('weed_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

					ESX.TriggerServerCallback('esx_illegal:canPickUp', function(canPickUp)

						if canPickUp then
							exports['mythic_notify']:SendAlert('inform', 'Mengambil Padi')
							TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 4000, false)
							TriggerEvent("mythic_progbar:client:progress", {
								name = "",
								duration = 4500,
								label = "MENGAMBIL PADI",
								useWhileDead = false,
								canCancel = true,
								controlDisables = {
									disableMovement = true,
									disableCarMovement = true,
									disableMouse = false,
									disableCombat = true,
								},
								animation = {
									animDict = "",
									anim = "",
								},
								prop = {
									model = "",
								}
							}, function(status)
								if not status then
									-- Do Something If Event Wasn't Cancelled
								end
							end)

							Citizen.Wait(4000)
							ClearPedTasks(playerPed)
							Citizen.Wait(500)
			
							ESX.Game.DeleteObject(nearbyObject)

							exports['mythic_notify']:SendAlert('inform', 'Padi Terambil')
			
							table.remove(weedPlants, nearbyID)
							spawnedWeeds = spawnedWeeds - 1
			
							TriggerServerEvent('esx_illegal:pickedUpPadi')
						else
							exports['mythic_notify']:SendAlert('error', 'Inventory Full')
						end

						isPickingUp = false

					end, 'kecubung')
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(weedPlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnPadiPlants()
	while spawnedWeeds < 15 do
		Citizen.Wait(0)
		local weedCoords = GenerateWeedCoords()

		ESX.Game.SpawnLocalObject('prop_veg_grass_01_a', weedCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(weedPlants, obj)
			spawnedWeeds = spawnedWeeds + 1
		end)
	end
end

function ValidateWeedCoord(plantCoord)
	if spawnedWeeds > 0 then
		local validate = true

		for k, v in pairs(weedPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.FarmField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateWeedCoords()
	while true do
		Citizen.Wait(1)

		local weedCoordX, weedCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-20, 20)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 20)

		weedCoordX = Config.CircleZones.FarmField.coords.x + modX
		weedCoordY = Config.CircleZones.FarmField.coords.y + modY

		local coordZ = GetCoordZWeed(weedCoordX, weedCoordY)
		local coord = vector3(weedCoordX, weedCoordY, coordZ)

		if ValidateWeedCoord(coord) then
			return coord
		end
	end
end

function GetCoordZWeed(x, y)
	local groundCheckHeights = { 50, 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0, 59.0, 60.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 53.85
end