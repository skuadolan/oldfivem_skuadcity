local spawnedrices = 0
local ricePlants = {}
local isPickingUp, isProcessing = false, false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.RiceField.coords, true) < 50 then
			SpawnRicePlants()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.RiceProcessing.coords, true) < 1 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('rice_processprompt'))
			end

			if IsControlJustReleased(0, 38) and not isProcessing then
				ESX.TriggerServerCallback('esx_farm:rice_count', function(xCannabis)
					ProcessRice(xCannabis)
				end)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

function ProcessRice(xCannabis)
	isProcessing = true
	ESX.ShowNotification(_U('rice_processingstarted'))
  TriggerServerEvent('esx_farm:processRice')
	if(xCannabis <= 3) then
		xCannabis = 0
	end
  local timeLeft = (Config.Delays.RiceProcessing * xCannabis) / 1000
	local playerPed = PlayerPedId()

	while timeLeft > 0 do
		Citizen.Wait(1000)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.RiceProcessing.coords, false) > 4 then
			ESX.ShowNotification(_U('rice_processingtoofar'))
			TriggerServerEvent('esx_farm:cancelProcessing')
			TriggerServerEvent('esx_farm:outofbound')
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

		for i=1, #ricePlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(ricePlants[i]), false) < 1 then
				nearbyObject, nearbyID = ricePlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then
			if not isPickingUp then
				ESX.ShowHelpNotification(_U('rice_pickupprompt'))
			end

			if IsControlJustReleased(0, 38) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('esx_farm:canPickUp', function(canPickUp)
					if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)

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

						Citizen.Wait(2000)
						ClearPedTasks(playerPed)
						Citizen.Wait(1500)
		
						ESX.Game.DeleteObject(nearbyObject)
		
						table.remove(ricePlants, nearbyID)
						spawnedrices = spawnedrices - 1
		
						TriggerServerEvent('esx_farm:pickedUpRice')
					else
						ESX.ShowNotification(_U('rice_inventoryfull'))
					end

					isPickingUp = false
				end, 'padi')
			end
		else
			Citizen.Wait(500)
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(ricePlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnRicePlants()
	while spawnedrices <= 100 do
		Citizen.Wait(0)
		local riceCoords = GeneratericeCoords()

		ESX.Game.SpawnLocalObject('prop_veg_grass_01_a', riceCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(ricePlants, obj)
			spawnedrices = spawnedrices + 1
		end)
	end
end

function ValidatericeCoord(plantCoord)
	if spawnedrices > 0 then
		local validate = true

		for k, v in pairs(ricePlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.RiceField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GeneratericeCoords()
	while true do
		Citizen.Wait(1)

		local riceCoordX, riceCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-21, 21)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-21, 21)

		riceCoordX = Config.CircleZones.RiceField.coords.x + modX
		riceCoordY = Config.CircleZones.RiceField.coords.y + modY

		local coordZ = GetCoordZ(riceCoordX, riceCoordY)
		local coord = vector3(riceCoordX, riceCoordY, coordZ)

		if ValidatericeCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 43.0
end
