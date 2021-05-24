local CurrentActionData, PlayerData, userProperties, this_Garage, vehInstance, BlipList, PrivateBlips, JobBlips = {}, {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, WasInPound, WasinJPound = false, false, false
local LastZone, CurrentAction, CurrentActionMsg
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	CreateBlips()
	RefreshJobBlips()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	if Config.UsePrivateCarGarages then
		ESX.TriggerServerCallback('esx_advancedgarage:getOwnedProperties', function(properties)
			userProperties = properties
			DeletePrivateBlips()
			RefreshPrivateBlips()
		end)
	end

	ESX.PlayerData = xPlayer

	RefreshJobBlips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job

	DeleteJobBlips()
	RefreshJobBlips()
end)

RegisterNetEvent('esx_advancedgarage:getPropertiesC')
AddEventHandler('esx_advancedgarage:getPropertiesC', function(xPlayer)
	if Config.UsePrivateCarGarages then
		ESX.TriggerServerCallback('esx_advancedgarage:getOwnedProperties', function(properties)
			userProperties = properties
			DeletePrivateBlips()
			RefreshPrivateBlips()
		end)

		exports['mythic_notify']:SendAlert('error', _U('get_properties'))
		TriggerServerEvent('esx_advancedgarage:printGetProperties')
	end
end)


local function has_value (tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end
	return false
end

-- Start of Ambulance Code
function ListOwnedAmbulanceMenu()
	local elements = {}

	if Config.ShowVehicleLocation and Config.ShowSpacers then
		local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - <span style="color:red;">%s</span> |'):format(_U('plate'), _U('vehicle'), _U('location'))
		table.insert(elements, {label = spacer, value = nil})
	elseif Config.ShowVehicleLocation == false and Config.ShowSpacers then
		local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format(_U('plate'), _U('vehicle'))
		table.insert(elements, {label = ('<span style="color:red;">%s</span>'):format(_U('spacer1')), value = nil})
		table.insert(elements, {label = spacer, value = nil})
	end

	ESX.TriggerServerCallback('esx_advancedgarage:getOwnedAmbulanceCars', function(ownedAmbulanceCars)
		if #ownedAmbulanceCars == 0 then
			exports['mythic_notify']:SendAlert('error', _U('garage_no_ambulance'))
		else
			for _,v in pairs(ownedAmbulanceCars) do
				local hashVehicule = v.vehicle.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)
				local labelvehicle3 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, vehicleName)

				if Config.ShowVehicleLocation then
					if v.stored then
						labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('loc_garage'))
					else
						labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format(_U('loc_pound'))
					end
				else
					if v.stored then
						labelvehicle = labelvehicle3
					else
						labelvehicle = labelvehicle3
					end
				end

				table.insert(elements, {label = labelvehicle, value = v})
			end
		end

		table.insert(elements, {label = _U('spacer2'), value = nil})

		ESX.TriggerServerCallback('esx_advancedgarage:getOwnedAmbulanceAircrafts', function(ownedAmbulanceAircrafts)
			if #ownedAmbulanceAircrafts == 0 then
				exports['mythic_notify']:SendAlert('error', _U('garage_no_ambulance_aircraft'))
			else
				for _,v in pairs(ownedAmbulanceAircrafts) do
					local hashVehicule = v.vehicle.model
					local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
					local vehicleName = GetLabelText(aheadVehName)
					local plate = v.plate
					local labelvehicle
					local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)
					local labelvehicle3 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, vehicleName)

					if Config.ShowVehicleLocation then
						if v.stored then
							labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('loc_garage'))
						else
							labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format(_U('loc_pound'))
						end
					else
						if v.stored then
							labelvehicle = labelvehicle3
						else
							labelvehicle = labelvehicle3
						end
					end

					table.insert(elements, {label = labelvehicle, value = v})
				end
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_ambulance', {
				title = _U('garage_ambulance'),
				align = Config.MenuAlign,
				elements = elements
			}, function(data, menu)
				if data.current.value == nil then
				elseif data.current.value.vtype == 'aircraft' or data.current.value.vtype == 'helicopter' then
					if data.current.value.stored then
						menu.close()
						SpawnVehicle2(data.current.value.vehicle, data.current.value.plate)
					else
						exports['mythic_notify']:SendAlert('error', _U('ambulance_is_impounded'))
					end
				else
					if data.current.value.stored then
						menu.close()
						SpawnVehicle(data.current.value.vehicle, data.current.value.plate)
					else
						exports['mythic_notify']:SendAlert('error', _U('ambulance_is_impounded'))
					end
				end
			end, function(data, menu)
				menu.close()
			end)
		end)
	end)
end

function StoreOwnedAmbulanceMenu()
	local playerPed  = GetPlayerPed(-1)

	if IsPedInAnyVehicle(playerPed,  false) then
		local playerPed = GetPlayerPed(-1)
		local coords = GetEntityCoords(playerPed)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
		local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
		local engineHealth = GetVehicleEngineHealth(current)
		local plate = vehicleProps.plate

		ESX.TriggerServerCallback('esx_advancedgarage:storeVehicle', function(valid)
			if valid then
				if engineHealth < 990 then
					if Config.UseDamageMult then
						local apprasial = math.floor((1000 - engineHealth)/1000*Config.AmbulancePoundPrice*Config.DamageMult)
						RepairVehicle(apprasial, vehicle, vehicleProps)
					else
						local apprasial = math.floor((1000 - engineHealth)/1000*Config.AmbulancePoundPrice)
						RepairVehicle(apprasial, vehicle, vehicleProps)
					end
				else
					StoreVehicle(vehicle, vehicleProps)
				end	
			else
				exports['mythic_notify']:SendAlert('error', _U('cannot_store_vehicle'))
			end
		end, vehicleProps)
	else
		exports['mythic_notify']:SendAlert('error', _U('no_vehicle_to_enter'))
	end
end

function ReturnOwnedAmbulanceMenu()
	if WasinJPound then
		exports['mythic_notify']:SendAlert('error', _U('must_wait', Config.JPoundWait))
	else
		ESX.TriggerServerCallback('esx_advancedgarage:getOutOwnedAmbulanceCars', function(ownedAmbulanceCars)
			local elements = {}

			if Config.ShowVehicleLocation == false and Config.ShowSpacers then
				local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format(_U('plate'), _U('vehicle'))
				table.insert(elements, {label = spacer, value = nil})
			end

			for _,v in pairs(ownedAmbulanceCars) do
				local hashVehicule = v.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)

				labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('return'))

				table.insert(elements, {label = labelvehicle, value = v})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'return_owned_ambulance', {
				title = _U('pound_ambulance', ESX.Math.GroupDigits(Config.AmbulancePoundPrice)),
				align = Config.MenuAlign,
				elements = elements
			}, function(data, menu)
				local doesVehicleExist = false

				for k,v in pairs (vehInstance) do
					if ESX.Math.Trim(v.plate) == ESX.Math.Trim(data.current.value.plate) then
						if DoesEntityExist(v.vehicleentity) then
							doesVehicleExist = true
						else
							table.remove(vehInstance, k)
							doesVehicleExist = false
						end
					end
				end

				if not doesVehicleExist and not DoesAPlayerDrivesVehicle(data.current.value.plate) then
					ESX.TriggerServerCallback('esx_advancedgarage:checkMoneyAmbulance', function(hasEnoughMoney)
						if hasEnoughMoney then
							if data.current.value == nil then
							else
								SpawnVehicle(data.current.value, data.current.value.plate)
								TriggerServerEvent('esx_advancedgarage:payAmbulance')
								if Config.UsePoundTimer then
									WasinJPound = true
								end
							end
						else
							exports['mythic_notify']:SendAlert('error', _U('not_enough_money'))
						end
					end)
				else
					exports['mythic_notify']:SendAlert('error', _U('cant_take_out'))
				end
			end, function(data, menu)
				menu.close()
			end)
		end)
	end
end
-- End of Ambulance Code

-- Start of Police Code
function ListOwnedPoliceMenu()
	local elements = {}

	if Config.ShowVehicleLocation and Config.ShowSpacers then
		local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - <span style="color:red;">%s</span> |'):format(_U('plate'), _U('vehicle'), _U('location'))
		table.insert(elements, {label = spacer, value = nil})
	elseif Config.ShowVehicleLocation == false and Config.ShowSpacers then
		local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format(_U('plate'), _U('vehicle'))
		table.insert(elements, {label = ('<span style="color:red;">%s</span>'):format(_U('spacer1')), value = nil})
		table.insert(elements, {label = spacer, value = nil})
	end

	ESX.TriggerServerCallback('esx_advancedgarage:getOwnedPoliceCars', function(ownedPoliceCars)
		if #ownedPoliceCars == 0 then
			exports['mythic_notify']:SendAlert('error', _U('garage_no_police'))
		else
			for _,v in pairs(ownedPoliceCars) do
				local hashVehicule = v.vehicle.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)
				local labelvehicle3 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, vehicleName)

				if Config.ShowVehicleLocation then
					if v.stored then
						labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('loc_garage'))
					else
						labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format(_U('loc_pound'))
					end
				else
					if v.stored then
						labelvehicle = labelvehicle3
					else
						labelvehicle = labelvehicle3
					end
				end

				table.insert(elements, {label = labelvehicle, value = v})
			end
		end

		table.insert(elements, {label = _U('spacer2'), value = nil})

		ESX.TriggerServerCallback('esx_advancedgarage:getOwnedPoliceAircrafts', function(ownedPoliceAircrafts)
			if #ownedPoliceAircrafts == 0 then
				exports['mythic_notify']:SendAlert('error', _U('garage_no_police_aircraft'))
			else
				for _,v in pairs(ownedPoliceAircrafts) do
					local hashVehicule = v.vehicle.model
					local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
					local vehicleName = GetLabelText(aheadVehName)
					local plate = v.plate
					local labelvehicle
					local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)
					local labelvehicle3 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, vehicleName)

					if Config.ShowVehicleLocation then
						if v.stored then
							labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('loc_garage'))
						else
							labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format(_U('loc_pound'))
						end
					else
						if v.stored then
							labelvehicle = labelvehicle3
						else
							labelvehicle = labelvehicle3
						end
					end

					table.insert(elements, {label = labelvehicle, value = v})
				end
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_police', {
				title = _U('garage_police'),
				align = Config.MenuAlign,
				elements = elements
			}, function(data, menu)
				if data.current.value == nil then
				elseif data.current.value.vtype == 'aircraft' or data.current.value.vtype == 'helicopter' then
					if data.current.value.stored then
						menu.close()
						SpawnVehicle2(data.current.value.vehicle, data.current.value.plate)
					else
						exports['mythic_notify']:SendAlert('inform', _U('police_is_impounded'))
					end
				else
					if data.current.value.stored then
						menu.close()
						SpawnVehicle(data.current.value.vehicle, data.current.value.plate)
					else
						exports['mythic_notify']:SendAlert('inform', _U('police_is_impounded'))
					end
				end
			end, function(data, menu)
				menu.close()
			end)
		end)
	end)
end

function StoreOwnedPoliceMenu()
	local playerPed  = GetPlayerPed(-1)

	if IsPedInAnyVehicle(playerPed,  false) then
		local playerPed = GetPlayerPed(-1)
		local coords = GetEntityCoords(playerPed)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
		local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
		local engineHealth = GetVehicleEngineHealth(current)
		local plate = vehicleProps.plate

		ESX.TriggerServerCallback('esx_advancedgarage:storeVehicle', function(valid)
			if valid then
				if engineHealth < 990 then
					if Config.UseDamageMult then
						local apprasial = math.floor((1000 - engineHealth)/1000*Config.PolicePoundPrice*Config.DamageMult)
						RepairVehicle(apprasial, vehicle, vehicleProps)
					else
						local apprasial = math.floor((1000 - engineHealth)/1000*Config.PolicePoundPrice)
						RepairVehicle(apprasial, vehicle, vehicleProps)
					end
				else
					StoreVehicle(vehicle, vehicleProps)
				end	
			else
				exports['mythic_notify']:SendAlert('error', _U('cannot_store_vehicle'))
			end
		end, vehicleProps)
	else
		exports['mythic_notify']:SendAlert('error', _U('no_vehicle_to_enter'))
	end
end

function ReturnOwnedPoliceMenu()
	if WasinJPound then
		exports['mythic_notify']:SendAlert('error', _U('must_wait', Config.JPoundWait))
	else
		ESX.TriggerServerCallback('esx_advancedgarage:getOutOwnedPoliceCars', function(ownedPoliceCars)
			local elements = {}

			if Config.ShowVehicleLocation == false and Config.ShowSpacers then
				local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format(_U('plate'), _U('vehicle'))
				table.insert(elements, {label = spacer, value = nil})
			end

			for _,v in pairs(ownedPoliceCars) do
				local hashVehicule = v.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)

				labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('return'))

				table.insert(elements, {label = labelvehicle, value = v})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'return_owned_police', {
				title = _U('pound_police', ESX.Math.GroupDigits(Config.PolicePoundPrice)),
				align = Config.MenuAlign,
				elements = elements
			}, function(data, menu)
				local doesVehicleExist = false

				for k,v in pairs (vehInstance) do
					if ESX.Math.Trim(v.plate) == ESX.Math.Trim(data.current.value.plate) then
						if DoesEntityExist(v.vehicleentity) then
							doesVehicleExist = true
						else
							table.remove(vehInstance, k)
							doesVehicleExist = false
						end
					end
				end

				if not doesVehicleExist and not DoesAPlayerDrivesVehicle(data.current.value.plate) then
					ESX.TriggerServerCallback('esx_advancedgarage:checkMoneyPolice', function(hasEnoughMoney)
						if hasEnoughMoney then
							if data.current.value == nil then
							else
								SpawnVehicle(data.current.value, data.current.value.plate)
								TriggerServerEvent('esx_advancedgarage:payPolice')
								if Config.UsePoundTimer then
									WasinJPound = true
								end
							end
						else
							exports['mythic_notify']:SendAlert('error', _U('not_enough_money'))
						end
					end)
				else
					exports['mythic_notify']:SendAlert('error', _U('cant_take_out'))
				end
			end, function(data, menu)
				menu.close()
			end)
		end)
	end
end
-- End of Police Code

-- Start of Car Code
function ListOwnedCarsMenu()
	local elements = {}

	if Config.ShowVehicleLocation and Config.ShowSpacers then
		local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - <span style="color:red;">%s</span> |'):format(_U('plate'), _U('vehicle'), _U('location'))
		table.insert(elements, {label = spacer, value = nil})
	elseif Config.ShowVehicleLocation == false and Config.ShowSpacers then
		local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format(_U('plate'), _U('vehicle'))
		table.insert(elements, {label = ('<span style="color:red;">%s</span>'):format(_U('spacer1')), value = nil})
		table.insert(elements, {label = spacer, value = nil})
	end

	ESX.TriggerServerCallback('esx_advancedgarage:getOwnedCars', function(ownedCars)
		if #ownedCars == 0 then
			exports['mythic_notify']:SendAlert('error', _U('garage_no_cars'))
		else
			for _,v in pairs(ownedCars) do
				local hashVehicule = v.vehicle.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)
				local labelvehicle3 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, vehicleName)

				if Config.ShowVehicleLocation then
					if v.stored then
						labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('loc_garage'))
					else
						labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format(_U('loc_pound'))
					end
				else
					if v.stored then
						labelvehicle = labelvehicle3
					else
						labelvehicle = labelvehicle3
					end
				end

				table.insert(elements, {label = labelvehicle, value = v})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
			title = _U('garage_cars'),
			align = Config.MenuAlign,
			elements = elements
		}, function(data, menu)
			if data.current.value == nil then
			else
				if data.current.value.stored then
					menu.close()
					SpawnVehicle(data.current.value.vehicle, data.current.value.plate)
				else
					exports['mythic_notify']:SendAlert('error', _U('car_is_impounded'))
				end
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function StoreOwnedCarsMenu()
	local playerPed  = GetPlayerPed(-1)

	if IsPedInAnyVehicle(playerPed,  false) then
		local playerPed = GetPlayerPed(-1)
		local coords = GetEntityCoords(playerPed)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
		local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
		local engineHealth = GetVehicleEngineHealth(current)
		local plate = vehicleProps.plate

		ESX.TriggerServerCallback('esx_advancedgarage:storeVehicle', function(valid)
			if valid then
				if engineHealth < 990 then
					if Config.UseDamageMult then
						local apprasial = math.floor((1000 - engineHealth)/1000*Config.CarPoundPrice*Config.DamageMult)
						RepairVehicle(apprasial, vehicle, vehicleProps)
					else
						local apprasial = math.floor((1000 - engineHealth)/1000*Config.CarPoundPrice)
						RepairVehicle(apprasial, vehicle, vehicleProps)
					end
				else
					StoreVehicle(vehicle, vehicleProps)
				end	
			else
				exports['mythic_notify']:SendAlert('error', _U('cannot_store_vehicle'))
			end
		end, vehicleProps)
	else
		exports['mythic_notify']:SendAlert('error', _U('no_vehicle_to_enter'))
	end
end

function StoreOwnedCarsMenu()
	local playerPed  = GetPlayerPed(-1)

	if IsPedInAnyVehicle(playerPed,  false) then
		local playerPed = GetPlayerPed(-1)
		local coords = GetEntityCoords(playerPed)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
		local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
		local engineHealth = GetVehicleEngineHealth(current)
		local plate = vehicleProps.plate

		ESX.TriggerServerCallback('esx_advancedgarage:storeVehicle', function(valid)
			if valid then
				if engineHealth < 990 then
					if Config.UseDamageMult then
						local apprasial = math.floor((1000 - engineHealth)/1000*Config.CarPoundPrice*Config.DamageMult)
						RepairVehicle(apprasial, vehicle, vehicleProps)
					else
						local apprasial = math.floor((1000 - engineHealth)/1000*Config.CarPoundPrice)
						RepairVehicle(apprasial, vehicle, vehicleProps)
					end
				else
					StoreVehicle(vehicle, vehicleProps)
				end	
			else
				ESX.ShowNotification(_U('cannot_store_vehicle'))
			end
		end, vehicleProps)
	else
		ESX.ShowNotification(_U('no_vehicle_to_enter'))
	end
end

function ReturnOwnedCarsMenu()
	if WasInPound then
		exports['mythic_notify']:SendAlert('error', _U('must_wait', Config.PoundWait))
	else
		ESX.TriggerServerCallback('esx_advancedgarage:getOutOwnedCars', function(ownedCars)
			local elements = {}

			if Config.ShowVehicleLocation == false and Config.ShowSpacers then
				local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format(_U('plate'), _U('vehicle'))
				table.insert(elements, {label = spacer, value = nil})
			end

			for _,v in pairs(ownedCars) do
				local hashVehicule = v.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, vehicleName)

				labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('return'))

				table.insert(elements, {label = labelvehicle, value = v})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'return_owned_car', {
				title = _U('pound_cars', ESX.Math.GroupDigits(Config.CarPoundPrice)),
				align = Config.MenuAlign,
				elements = elements
			}, function(data, menu)
				local doesVehicleExist = false

				for k,v in pairs (vehInstance) do
					if ESX.Math.Trim(v.plate) == ESX.Math.Trim(data.current.value.plate) then
						if DoesEntityExist(v.vehicleentity) then
							doesVehicleExist = true
						else
							table.remove(vehInstance, k)
							doesVehicleExist = false
						end
					end
				end

				if not doesVehicleExist and not DoesAPlayerDrivesVehicle(data.current.value.plate) then
					ESX.TriggerServerCallback('esx_advancedgarage:checkMoneyCars', function(hasEnoughMoney)
						if hasEnoughMoney then
							if data.current.value == nil then
							else
								SpawnVehicle(data.current.value, data.current.value.plate)
								TriggerServerEvent('esx_advancedgarage:payCar')
								if Config.UsePoundTimer then
									WasInPound = true
								end
							end
						else
							exports['mythic_notify']:SendAlert('error', _U('not_enough_money'))
						end
					end)
				else
					exports['mythic_notify']:SendAlert('error', _U('cant_take_out'))
				end
			end, function(data, menu)
				menu.close()
			end)
		end)
	end
end
-- End of Car Code

-- WasInPound & WasinJPound Code
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if Config.UsePoundTimer then
			if WasInPound then
				Citizen.Wait(Config.PoundWait * 60000)
				WasInPound = false
			end
		end

		if Config.UseJPoundTimer then
			if WasinJPound then
				Citizen.Wait(Config.JPoundWait * 60000)
				WasinJPound = false
			end
		end
	end
end)

-- Repair Vehicles
function RepairVehicle(apprasial, vehicle, vehicleProps)
	ESX.UI.Menu.CloseAll()

	local elements = {
		{label = _U('return_vehicle').." ($"..apprasial..")", value = 'yes'},
		{label = _U('see_mechanic'), value = 'no'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'delete_menu', {
		title = _U('damaged_vehicle'),
		align = Config.MenuAlign,
		elements = elements
	}, function(data, menu)
		menu.close()

		if data.current.value == 'yes' then
			TriggerServerEvent('esx_advancedgarage:payhealth', apprasial)
			vehicleProps.bodyHealth = 0.0 -- must be a decimal value!!!
			vehicleProps.engineHealth = 0.0
			StoreVehicle(vehicle, vehicleProps)
		elseif data.current.value == 'no' then
			exports['mythic_notify']:SendAlert('error', _U('visit_mechanic'))
		end
	end, function(data, menu)
		menu.close()
	end)
end

-- Store Vehicles
function StoreVehicle(vehicle, vehicleProps)
	for k,v in pairs (vehInstance) do
		if ESX.Math.Trim(v.plate) == ESX.Math.Trim(vehicleProps.plate) then
			table.remove(vehInstance, k)
		end
	end

	DeleteEntity(vehicle)
	TriggerServerEvent('esx_advancedgarage:setVehicleState', vehicleProps.plate, true)
	exports['mythic_notify']:SendAlert('error', _U('vehicle_in_garage'))
end

-- Spawn Vehicles
function SpawnVehicle(vehicle, plate)
    ESX.Game.SpawnVehicle(vehicle.model, this_Garage.Spawner, this_Garage.Heading, function(callback_vehicle)
        ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
        SetVehRadioStation(callback_vehicle, "OFF")
        SetVehicleFixed(callback_vehicle)
        SetVehicleDeformationFixed(callback_vehicle)
        SetVehicleUndriveable(callback_vehicle, false)
        SetVehicleEngineOn(callback_vehicle, true, true)
        if vehicle["engineHealth"] then
            SetVehicleEngineHealth(callback_vehicle, vehicle["engineHealth"] + 1000.0) -- Might not be needed
            --SetVehicleBodyHealth(callback_vehicle, vehicle.bodyHealth) -- Might not be needed
        else
            SetVehicleEngineHealth(callback_vehicle, vehicle["engineHealth"]) -- Might not be needed
            --SetVehicleBodyHealth(callback_vehicle, 1000) -- Might not be needed
        end
        local carplate = GetVehicleNumberPlateText(callback_vehicle)
        table.insert(vehInstance, {vehicleentity = callback_vehicle, plate = carplate})
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
    end)

    TriggerServerEvent('esx_advancedgarage:setVehicleState', plate, false)
end

function SpawnVehicle2(vehicle, plate)
    ESX.Game.SpawnVehicle(vehicle.model, this_Garage.Spawner2, this_Garage.Heading2, function(callback_vehicle)
        ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
        SetVehRadioStation(callback_vehicle, "OFF")
        SetVehicleFixed(callback_vehicle)
        SetVehicleDeformationFixed(callback_vehicle)
        SetVehicleUndriveable(callback_vehicle, false)
        SetVehicleEngineOn(callback_vehicle, true, true)
        if vehicle["engineHealth"] then
            SetVehicleEngineHealth(callback_vehicle, vehicle["engineHealth"] + 1000.0) -- Might not be needed
            --SetVehicleBodyHealth(callback_vehicle, vehicle.bodyHealth) -- Might not be needed
        else
            SetVehicleEngineHealth(callback_vehicle, vehicle["engineHealth"]) -- Might not be needed
            --SetVehicleBodyHealth(callback_vehicle, 1000) -- Might not be needed
        end
        local carplate = GetVehicleNumberPlateText(callback_vehicle)
        table.insert(vehInstance, {vehicleentity = callback_vehicle, plate = carplate})
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
    end)

    TriggerServerEvent('esx_advancedgarage:setVehicleState', plate, false)
end

-- Check Vehicles
function DoesAPlayerDrivesVehicle(plate)
	local isVehicleTaken = false
	local players = ESX.Game.GetPlayers()
	for i=1, #players, 1 do
		local target = GetPlayerPed(players[i])
		if target ~= PlayerPedId() then
			local plate1 = GetVehicleNumberPlateText(GetVehiclePedIsIn(target, true))
			local plate2 = GetVehicleNumberPlateText(GetVehiclePedIsIn(target, false))
			if plate == plate1 or plate == plate2 then
				isVehicleTaken = true
				break
			end
		end
	end
	return isVehicleTaken
end

-- Entered Marker
AddEventHandler('esx_advancedgarage:hasEnteredMarker', function(zone)
	if zone == 'ambulance_pound_point' then
		CurrentAction = 'ambulance_pound_point'
		CurrentActionMsg = _U('press_to_impound')
		CurrentActionData = {}
	elseif zone == 'police_pound_point' then
		CurrentAction = 'police_pound_point'
		CurrentActionMsg = _U('press_to_impound')
		CurrentActionData = {}
	elseif zone == 'car_garage_point' then
		CurrentAction = 'car_garage_point'
		CurrentActionMsg = _U('press_to_enter')
		CurrentActionData = {}
	elseif zone == 'car_store_point' then
		CurrentAction = 'car_store_point'
		CurrentActionMsg = _U('press_to_delete')
		CurrentActionData = {}
	elseif zone == 'car_pound_point' then
		CurrentAction = 'car_pound_point'
		CurrentActionMsg = _U('press_to_impound')
		CurrentActionData = {}
	end
end)

-- Exited Marker
AddEventHandler('esx_advancedgarage:hasExitedMarker', function()
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

-- Resource Stop
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		ESX.UI.Menu.CloseAll()
	end
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.028+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- Enter / Exit marker events & Draw Markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, currentZone = false
		local sleep = true

		

		if Config.UseCarGarages then
			for k,v in pairs(Config.CarGarages) do
				local distance = #(playerCoords - v.Marker)
				local distance2 = #(playerCoords - v.Deleter)
				local player = GetPlayerPed(-1)

				if distance < Config.DrawDistance then
					
					sleep = false

					if Config.PointMarker.Type ~= -1 and not IsPedInAnyVehicle(player, false) then
						DrawText3Ds(v.Marker.x, v.Marker.y, v.Marker.z, "TEKAN ~g~[E]~w~ UNTUK MENGAMBIL KENDARAAN")
						--DrawMarker(Config.PointMarker.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z, Config.PointMarker.r, Config.PointMarker.g, Config.PointMarker.b, 100, false, true, 2, false, nil, nil, false)
					end

					if distance < Config.PointMarker.x then
						
						isInMarker, this_Garage, currentZone = true, v, 'car_garage_point'
					end
				end

				if distance2 < Config.DrawDistance then
					
					sleep = false

					if Config.DeleteMarker.Type ~= -1  and IsPedInAnyVehicle(player, false) then
						
						
						DrawText3Ds(v.Deleter.x, v.Deleter.y, v.Deleter.z, "TEKAN ~r~[E]~w~ UNTUK MEMASUKKAN KENDARAAN")
						--DrawMarker(Config.DeleteMarker.Type, v.Deleter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.DeleteMarker.x, Config.DeleteMarker.y, Config.DeleteMarker.z, Config.DeleteMarker.r, Config.DeleteMarker.g, Config.DeleteMarker.b, 100, false, true, 2, false, nil, nil, false)
					end

					if distance2 < Config.DeleteMarker.x then
						isInMarker, this_Garage, currentZone = true, v, 'car_store_point'
					end
				end
			end

			for k,v in pairs(Config.CarPounds) do
				local distance = #(playerCoords - v.Marker)

				if distance < Config.DrawDistance then
					sleep = false

					if Config.PoundMarker.Type ~= -1 and not IsPedInAnyVehicle(player, false) then
						DrawText3Ds(v.Marker.x, v.Marker.y, v.Marker.z, "TEKAN ~g~[E]~w~ UNTUK MENGAMBIL KENDARAAN")
						--DrawMarker(Config.PoundMarker.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.PoundMarker.x, Config.PoundMarker.y, Config.PoundMarker.z, Config.PoundMarker.r, Config.PoundMarker.g, Config.PoundMarker.b, 100, false, true, 2, false, nil, nil, false)
					end

					if distance < Config.PoundMarker.x then
						isInMarker, this_Garage, currentZone = true, v, 'car_pound_point'
					end
				end
			end
		end

		if Config.UseAmbulancePounds then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
				for k,v in pairs(Config.AmbulancePounds) do
					local distance = #(playerCoords - v.Marker)

					if distance < Config.DrawDistance then
						sleep = false

						if Config.JPoundMarker.Type ~= -1 and not IsPedInAnyVehicle(player, false) then
							DrawText3Ds(v.Marker.x, v.Marker.y, v.Marker.z, "TEKAN ~g~[E]~w~ UNTUK MENGAMBIL KENDARAAN")
							--DrawMarker(Config.JPoundMarker.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.JPoundMarker.x, Config.JPoundMarker.y, Config.JPoundMarker.z, Config.JPoundMarker.r, Config.JPoundMarker.g, Config.JPoundMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.JPoundMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'ambulance_pound_point'
						end
					end
				end
			end
		end

		if Config.UsePolicePounds then
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
				for k,v in pairs(Config.PolicePounds) do
					local distance = #(playerCoords - v.Marker)

					if distance < Config.DrawDistance then
						sleep = false

						if Config.JPoundMarker.Type ~= -1 and not IsPedInAnyVehicle(player, false) then
							DrawText3Ds(v.Marker.x, v.Marker.y, v.Marker.z, "TEKAN ~g~[E]~w~ UNTUK MENGAMBIL KENDARAAN")
							--DrawMarker(Config.JPoundMarker.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.JPoundMarker.x, Config.JPoundMarker.y, Config.JPoundMarker.z, Config.JPoundMarker.r, Config.JPoundMarker.g, Config.JPoundMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.JPoundMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'police_pound_point'
						end
					end
				end
			end
		end

		if Config.UsePrivateCarGarages then
			for k,v in pairs(Config.PrivateCarGarages) do
				if not v.Private or has_value(userProperties, v.Private) then
					local distance = #(playerCoords - v.Marker)
					local distance2 = #(playerCoords - v.Deleter)

					if distance < Config.DrawDistance then
						sleep = false

						if Config.PointMarker.Type ~= -1 and not IsPedInAnyVehicle(player, false) then
							
							DrawMarker(Config.PointMarker.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z, Config.PointMarker.r, Config.PointMarker.g, Config.PointMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.PointMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'car_garage_point'
						end
					end

					if distance2 < Config.DrawDistance then
						sleep = false

						if Config.DeleteMarker.Type ~= -1 and IsPedInAnyVehicle(player, false) then
							
							DrawMarker(Config.DeleteMarker.Type, v.Deleter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.DeleteMarker.x, Config.DeleteMarker.y, Config.DeleteMarker.z, Config.DeleteMarker.r, Config.DeleteMarker.g, Config.DeleteMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance2 < Config.DeleteMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'car_store_point'
						end
					end
				end
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker, LastZone = true, currentZone
			LastZone = currentZone
			TriggerEvent('esx_advancedgarage:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_advancedgarage:hasExitedMarker', LastZone)
		end

		if sleep then
			Citizen.Wait(1000)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		local model = GetEntityModel(playerVeh)

		if CurrentAction then

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'ambulance_pound_point' then
					if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
						ReturnOwnedAmbulanceMenu()
					else
						exports['mythic_notify']:SendAlert('error', _U('must_ambulance'))
						
					end
				elseif CurrentAction == 'police_pound_point' then
					if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
						ReturnOwnedPoliceMenu()
					else
						exports['mythic_notify']:SendAlert('error', _U('must_police'))
						
					end
				elseif CurrentAction == 'car_garage_point' then
					ListOwnedCarsMenu()
				elseif CurrentAction == 'car_store_point' then
					if IsThisModelACar(model) or IsThisModelABicycle(model) or IsThisModelABike(model) or IsThisModelAQuadbike(model) then
						if (GetPedInVehicleSeat(playerVeh, -1) == playerPed) then
							StoreOwnedCarsMenu()
						else
							exports['mythic_notify']:SendAlert('error', _U('driver_seat'))
						
						end
					else
						exports['mythic_notify']:SendAlert('error', _U('not_correct_veh'))
						
					end
				elseif CurrentAction == 'car_pound_point' then
					ReturnOwnedCarsMenu()
				end

				CurrentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Create Blips
function CreateBlips()
	if Config.UseAircraftGarages and Config.UseAircraftBlips then
		for k,v in pairs(Config.AircraftGarages) do
			local blip = AddBlipForCoord(v.Marker)

			SetBlipSprite (blip, Config.GarageBlip.Sprite)
			SetBlipColour (blip, Config.GarageBlip.Color)
			SetBlipDisplay(blip, Config.GarageBlip.Display)
			SetBlipScale  (blip, Config.GarageBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_garage'))
			EndTextCommandSetBlipName(blip)
			table.insert(BlipList, blip)
		end

		for k,v in pairs(Config.AircraftPounds) do
			local blip = AddBlipForCoord(v.Marker)

			SetBlipSprite (blip, Config.PoundBlip.Sprite)
			SetBlipColour (blip, Config.PoundBlip.Color)
			SetBlipDisplay(blip, Config.PoundBlip.Display)
			SetBlipScale  (blip, Config.PoundBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_pound'))
			EndTextCommandSetBlipName(blip)
			table.insert(BlipList, blip)
		end
	end

	if Config.UseBoatGarages and Config.UseBoatBlips then
		for k,v in pairs(Config.BoatGarages) do
			local blip = AddBlipForCoord(v.Marker)

			SetBlipSprite (blip, Config.GarageBlip.Sprite)
			SetBlipColour (blip, Config.GarageBlip.Color)
			SetBlipDisplay(blip, Config.GarageBlip.Display)
			SetBlipScale  (blip, Config.GarageBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_garage'))
			EndTextCommandSetBlipName(blip)
			table.insert(BlipList, blip)
		end

		for k,v in pairs(Config.BoatPounds) do
			local blip = AddBlipForCoord(v.Marker)

			SetBlipSprite (blip, Config.PoundBlip.Sprite)
			SetBlipColour (blip, Config.PoundBlip.Color)
			SetBlipDisplay(blip, Config.PoundBlip.Display)
			SetBlipScale  (blip, Config.PoundBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_pound'))
			EndTextCommandSetBlipName(blip)
			table.insert(BlipList, blip)
		end
	end

	if Config.UseCarGarages and Config.UseCarBlips then
		for k,v in pairs(Config.CarGarages) do
			local blip = AddBlipForCoord(v.Marker)

			SetBlipSprite (blip, Config.GarageBlip.Sprite)
			SetBlipColour (blip, Config.GarageBlip.Color)
			SetBlipDisplay(blip, Config.GarageBlip.Display)
			SetBlipScale  (blip, Config.GarageBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_garage'))
			EndTextCommandSetBlipName(blip)
			table.insert(BlipList, blip)
		end

		for k,v in pairs(Config.CarPounds) do
			local blip = AddBlipForCoord(v.Marker)

			SetBlipSprite (blip, Config.PoundBlip.Sprite)
			SetBlipColour (blip, Config.PoundBlip.Color)
			SetBlipDisplay(blip, Config.PoundBlip.Display)
			SetBlipScale  (blip, Config.PoundBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_pound'))
			EndTextCommandSetBlipName(blip)
			table.insert(BlipList, blip)
		end
	end
end

-- Handles Private Blips
function DeletePrivateBlips()
	if PrivateBlips[1] ~= nil then
		for i=1, #PrivateBlips, 1 do
			RemoveBlip(PrivateBlips[i])
			PrivateBlips[i] = nil
		end
	end
end

function RefreshPrivateBlips()
	for zoneKey,zoneValues in pairs(Config.PrivateCarGarages) do
		if zoneValues.Private and has_value(userProperties, zoneValues.Private) then
			local blip = AddBlipForCoord(zoneValues.Marker)

			SetBlipSprite(blip, Config.PGarageBlip.Sprite)
			SetBlipColour(blip, Config.PGarageBlip.Color)
			SetBlipDisplay(blip, Config.PGarageBlip.Display)
			SetBlipScale(blip, Config.PGarageBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_garage_private'))
			EndTextCommandSetBlipName(blip)
			table.insert(PrivateBlips, blip)
		end
	end
end

-- Handles Job Blips
function DeleteJobBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end

function RefreshJobBlips()

	if Config.UseAmbulancePounds and Config.UseAmbulanceBlips then
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
			for k,v in pairs(Config.AmbulancePounds) do
				local blip = AddBlipForCoord(v.Marker)

				SetBlipSprite (blip, Config.JPoundBlip.Sprite)
				SetBlipColour (blip, Config.JPoundBlip.Color)
				SetBlipDisplay(blip, Config.JPoundBlip.Display)
				SetBlipScale  (blip, Config.JPoundBlip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(_U('blip_ambulance_pound'))
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
	end

	if Config.UsePolicePounds and Config.UsePoliceBlips then
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
			for k,v in pairs(Config.PolicePounds) do
				local blip = AddBlipForCoord(v.Marker)

				SetBlipSprite (blip, Config.JPoundBlip.Sprite)
				SetBlipColour (blip, Config.JPoundBlip.Color)
				SetBlipDisplay(blip, Config.JPoundBlip.Display)
				SetBlipScale  (blip, Config.JPoundBlip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(_U('blip_police_pound'))
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
	end
end
