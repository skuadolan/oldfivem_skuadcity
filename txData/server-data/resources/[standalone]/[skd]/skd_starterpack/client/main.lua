local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

local hasAlreadyEnteredMarker, lastZone
local currentAction, currentActionMsg, currentToDo, currentActionData = nil, nil, nil, {}
AddEventHandler('skd_starterpack:hasEnteredMarker', function(zone)
	currentAction     = 'start_question'
	currentActionMsg  = _U('press_menu')
	currentActionData = {zone = zone}
end)

AddEventHandler('skd_starterpack:hasExitedMarker', function(zone)
	currentAction = nil
	currentToDo = nil
	ESX.UI.Menu.CloseAll()
end)

function startGetGiveaway()
	currentToDo = 'getGiveaway'

	SendNUIMessage({
		openQuestion = true
	})

	ESX.SetTimeout(200, function()
		SetNuiFocus(true, true)
	end)
end

function stopGiveaway(success, choices, kritikSaran)
	currentToDo = nil
	local convertChoices = (choices == 'A' and nil or choices)
	local isFill = (convertChoices ~= nil and true or false)

	SendNUIMessage({
		openQuestion = false
	})

	SetNuiFocus(false)

	if success then
		if isFill then
			local generatedPlate = GeneratePlate()
			local foundSpawn, spawnPoint = GetAvailableVehicleSpawnPoint()
			local playerPed = PlayerPedId()

			if foundSpawn then
				ESX.TriggerServerCallback('skd_starterpack:getVehicle', function(success)
					if success then
						if choices == 'B' then
							ESX.Game.SpawnVehicle(Config.carModel, spawnPoint, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
								TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
								SetVehicleNumberPlateText(vehicle, generatedPlate)
	
								FreezeEntityPosition(playerPed, false)
								SetEntityVisible(playerPed, true)
							end)
						else
							ESX.Game.SpawnVehicle(Config.motorModel, spawnPoint, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
								TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
								SetVehicleNumberPlateText(vehicle, generatedPlate)
	
								FreezeEntityPosition(playerPed, false)
								SetEntityVisible(playerPed, true)
							end)
						end
						TriggerServerEvent('skd_starterpack:getGiveaway', convertChoices, kritikSaran)
						exports['mythic_notify']:SendAlert('success', _U('can_get_giveaway'))
					end
				end, Config.carModel, generatedPlate)
			else
				exports['mythic_notify']:SendAlert('error', 'Tidak dapat mengeluarkan kendaraan')
				exports['mythic_notify']:SendAlert('error', _U('failed_test'))
			end
		else
			TriggerServerEvent('skd_starterpack:getGiveaway', choices, kritikSaran)
			exports['mythic_notify']:SendAlert('success', _U('can_get_giveaway'))
		end
		TriggerServerEvent('skd_starterpack:setGiveawayStatus', true)
		--ESX.ShowNotification(_U('passed_test'))
	else
		exports['mythic_notify']:SendAlert('error', _U('failed_test'))
		--ESX.ShowNotification(_U('failed_test'))
	end
end

RegisterNUICallback('question', function(data, cb)
	SendNUIMessage({
		openSection = 'question'
	})

	cb()
end)

RegisterNUICallback('sendGiveaway', function(data, cb)
	--print(data.isEmpty)
	if data.isEmpty then
		exports['mythic_notify']:SendAlert('error', _U('unchecked_giveaway'))
		stopGiveaway(false, data.choices, data.QnA)
	else
		stopGiveaway(true, data.choices, data.QnA)
	end

	cb()
end)

RegisterNUICallback('close', function(data, cb)
	--[[stopGiveaway(true, 'choices', '-kosong')
	cb()]]
	SendNUIMessage({
		openSection = 'QnA'
	})

	cb()
end)

RegisterNUICallback('kick', function(data, cb)
	stopGiveaway(false, 'choices', '-kosong')
	cb()
end)

CreateThread(function()
	while true do
		local Sleep = 1500

		if currentAction then
			Sleep = 0
			ESX.ShowHelpNotification(currentActionMsg)

			if IsControlJustPressed(0, 38) and currentAction == 'start_question' then
				currentAction = nil
				ESX.TriggerServerCallback('skd_starterpack:canGetGiveaway', function(canDo)
					if canDo then
						startGetGiveaway()
					else
						exports['mythic_notify']:SendAlert('error', _U('cannot_giveaway'))
						--ESX.ShowNotification(_U('not_enough_money'))
					end
				end)
			end
		end

		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, currentZone = false

		local distance = #(playerCoords - Config.Zones.Starterpack.Pos)

		if distance < 2.0 then
			Sleep = 0
			DrawMarker(Config.Zones.Starterpack.Marker, Config.Zones.Starterpack.Pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Zones.Starterpack.Size.x, Config.Zones.Starterpack.Size.y, Config.Zones.Starterpack.Size.z, Config.Zones.Starterpack.markerColor.r, Config.Zones.Starterpack.markerColor.g, Config.Zones.Starterpack.markerColor.b, 100, false, true, 2, false, nil, nil, false)
			if distance < 2.0 then
				isInMarker  = true
				currentZone = k
				lastZone    = k
			end
		end

		if currentToDo == 'getGiveaway' then
			
			sleep = 0
			DisableControlAction(0, 1, true) -- LookLeftRight
			DisableControlAction(0, 2, true) -- LookUpDown
			DisablePlayerFiring(playerPed, true) -- Disable weapon firing
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('skd_starterpack:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('skd_starterpack:hasExitedMarker', lastZone)
		end
	Wait(Sleep)
	end
end)

-- Create Blips
CreateThread(function()
	local blip = AddBlipForCoord(Config.Zones.Starterpack.Pos)

	SetBlipSprite (blip, Config.Zones.Starterpack.Type)
	SetBlipScale  (blip, Config.Zones.Starterpack.Scale)
	SetBlipColour (blip, Config.Zones.Starterpack.Color)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(_U('blip'))
	EndTextCommandSetBlipName(blip)
end)

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Wait(0)
		math.randomseed(GetGameTimer())
		if Config.PlateUseSpace then
			generatedPlate = string.upper(GetRandomLetter(Config.PlateLetters) .. ' ' .. GetRandomNumber(Config.PlateNumbers))
		else
			generatedPlate = string.upper(GetRandomLetter(Config.PlateLetters) .. GetRandomNumber(Config.PlateNumbers))
		end

		ESX.TriggerServerCallback('esx_vehicleshop:isPlateTaken', function(isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

function GetRandomNumber(length)
	Wait(0)
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Wait(0)
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

function GetAvailableVehicleSpawnPoint()
	local spawnPoints = Config.Zones.VehicleSpawnPoint.Pos
	local found, foundSpawnPoint = false, nil

	for i=1, #spawnPoints, 1 do
		if ESX.Game.IsSpawnPointClear(spawnPoints[i].Coords, spawnPoints[i].Radius) then
			found, foundSpawnPoint = true, spawnPoints[i].Coords
			break
		end
	end

	if found then
		return true, foundSpawnPoint
	else
		exports['mythic_notify']:SendAlert('error', 'Kendaraan terhalangi')
		--ESX.ShowNotification(_U('garage_blocked'))
		return false
	end
end