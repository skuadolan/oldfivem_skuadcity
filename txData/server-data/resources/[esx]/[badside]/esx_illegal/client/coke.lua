local spawnedCocaLeaf = 0
local CocaPlants = {}
local isPickingUp, isProcessing = false, false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.CokeField.coords, true) < 50 then
			SpawnCocaPlants()
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

		if GetDistanceBetweenCoords(coords, Config.CircleZones.CokeProcessing.coords, true) < 5 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('coke_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then
				isProcessing = true
				ProcessCoke()
			end
		else
			Citizen.Wait(500)
		end
	end
end)

function ProcessCoke()
	exports['mythic_notify']:SendAlert('inform', 'Memproses Micin')
	TriggerEvent("mythic_progbar:client:progress", {
		name = "micin",
		duration = 1500,
		label = "MEMPROSES MICIN",
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
	TriggerServerEvent('esx_illegal:processCocaLeaf')
	local timeLeft = Config.Delays.CokeProcessing / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.CokeProcessing.coords, false) > 5 then
			exports['mythic_notify']:SendAlert('error', 'Gagal Memproses')
			TriggerServerEvent('esx_illegal:cancelProcessing')
			break
		end
	end

	isProcessing = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		DisableControlAction(0, 323, true)

		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #CocaPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(CocaPlants[i]), false) < 1 then
				nearbyObject, nearbyID = CocaPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('coke_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				ESX.TriggerServerCallback('esx_illegal:getManyPolice', function(manyPolice)
					if manyPolice then
						isPickingUp = true

						ESX.TriggerServerCallback('esx_illegal:canPickUp', function(canPickUp)
							if canPickUp then
								exports['mythic_notify']:SendAlert('inform', 'Mengambil Micin')
								TaskStartScenarioInPlace(playerPed, 'world_human_bum_wash', 0, false)
								TriggerEvent("mythic_progbar:client:progress", {
									name = "micin",
									duration = 4500,
									label = "MENGAMBIL MICIN",
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

								exports['mythic_notify']:SendAlert('success', 'Micin Telah Terambil')
				
								table.remove(CocaPlants, nearbyID)
								spawnedCocaLeaf = spawnedCocaLeaf - 1
				
								TriggerServerEvent('esx_illegal:pickedUpCocaLeaf')
							else
								exports['mythic_notify']:SendAlert('error', 'Inventory Full')
							end

							isPickingUp = false

						end, 'micin')
					else
						ESX.ShowNotification('anda tidak bisa ~r~meladang!~s~ min ~g~2 polisi')
					end
				end)
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(CocaPlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnCocaPlants()
	while spawnedCocaLeaf < 15 do
		Citizen.Wait(0)
		local weedCoords = GenerateCocaLeafCoords()

		ESX.Game.SpawnLocalObject('bkr_prop_coke_tablepowder', weedCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(CocaPlants, obj)
			spawnedCocaLeaf = spawnedCocaLeaf + 1
		end)
	end
end

function ValidateCocaLeafCoord(plantCoord)
	if spawnedCocaLeaf > 0 then
		local validate = true

		for k, v in pairs(CocaPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.CokeField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateCocaLeafCoords()
	while true do
		Citizen.Wait(1)

		local weedCoordX, weedCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-20, 20)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 20)

		weedCoordX = Config.CircleZones.CokeField.coords.x + modX
		weedCoordY = Config.CircleZones.CokeField.coords.y + modY

		local coordZ = GetCoordZCoke(weedCoordX, weedCoordY)
		local coord = vector3(weedCoordX, weedCoordY, coordZ)

		if ValidateCocaLeafCoord(coord) then
			return coord
		end
	end
end

function GetCoordZCoke(x, y)
	local groundCheckHeights = { 70.0, 71.0, 72.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 77
end