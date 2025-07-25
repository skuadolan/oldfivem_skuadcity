ESX = nil

PlayerData = {}
local spawnedVehs = {}
local rentedCars = {}

local rentNoJob = 0 
local rentJob = 0
local vehiclesNeedsToCreate = {}


Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)

        TriggerEvent("esx:getSharedObject", function(response)
            ESX = response
        end)
    end

    if ESX.IsPlayerLoaded() then
		PlayerData = ESX.GetPlayerData()
    end
	
	ESX.TriggerServerCallback('esx_vehiclesRent:retrieveVehicles', function(vehicles)
	vehiclesNeedsToCreate = vehicles
	end)
	
	--[[ESX.TriggerServerCallback('esx_truckshop:getVehicles', function (vehicles)
    Vehicles = vehicles
    end)
  
    ESX.TriggerServerCallback('esx_tvehicleshop:getVehicles', function (vehicles)
    Vehicles = vehicles
    end)]]
  
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(response)
	PlayerData = response
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)



function ReloadVehicles(vehicles)
for i=1, #spawnedVehs, 1 do
ESX.Game.DeleteVehicle(spawnedVehs[i].entityId)
end
spawnedVehs = {}
vehiclesNeedsToCreate = vehicles
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(30)
			for i = 1, #vehiclesNeedsToCreate, 1 do
			local playerPed = GetPlayerPed(-1)
			local coords    = GetEntityCoords(playerPed)
				if(GetDistanceBetweenCoords(coords, vehiclesNeedsToCreate[i].x, vehiclesNeedsToCreate[i].y, vehiclesNeedsToCreate[i].z, true) < Config.DistanseSpawn) then
					if not vehiclesNeedsToCreate[i].isOwned and not vehiclesNeedsToCreate[i].created then 
						vehiclesNeedsToCreate[i].created = true
						LoadModel(GetHashKey(vehiclesNeedsToCreate[i].model))
						local entity =  CreateVehicle(GetHashKey(vehiclesNeedsToCreate[i].model), vehiclesNeedsToCreate[i].x, vehiclesNeedsToCreate[i].y, vehiclesNeedsToCreate[i].z, vehiclesNeedsToCreate[i].h, false)
						SetVehicleOnGroundProperly(entity)
						FreezeEntityPosition(entity, true)
						SetEntityAsMissionEntity(entity, true, true)
						SetModelAsNoLongerNeeded(entity)
						SetEntityInvincible( entity, true )
						local price = vehiclesNeedsToCreate[i].price
						table.insert(spawnedVehs, {entityId = entity, price = price, id = i, x =  vehiclesNeedsToCreate[i].x, y = vehiclesNeedsToCreate[i].y, z = vehiclesNeedsToCreate[i].z, h = vehiclesNeedsToCreate[i].h, model = vehiclesNeedsToCreate[i].model, job =  vehiclesNeedsToCreate[i].job})  
					end
				else 
				vehiclesNeedsToCreate[i].created = false
				for z = 1, #spawnedVehs, 1 do
				if spawnedVehs[z].id == i then 
				ESX.Game.DeleteVehicle(spawnedVehs[z].entityId)
				table.remove(spawnedVehs, z)
				break
				end
				end
				end
			end
		end
end)		



function RentAndDespawnThisCar(vehicle, minutes)
ESX.Game.DeleteVehicle(vehicle.entityId)
ESX.Game.SpawnVehicle(vehicle.model, {
    x = vehicle.x,
    y = vehicle.y,
    z = vehicle.z
}, vehicle.h, function (veh)
table.insert(rentedCars, veh)
TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
SetVehicleNumberPlateText(veh, Config.PlateText)
TriggerServerEvent('esx_vehiclesRent:setVehicleTimer', vehicle, veh, minutes)
SetVehicleFuelLevel(veh, 100.0)
end)
end

RegisterNetEvent('esx_vehiclesRent:deleteRentCar')
AddEventHandler('esx_vehiclesRent:deleteRentCar', function(entityId)
rentNoJob = rentNoJob - 1
ESX.Game.DeleteVehicle(entityId)
exports['mythic_notify']:SendAlert('success', 'Sesi rental selesai')
--ESX.ShowNotification("~g~Vehicle rental completed")
end)


function OpenVehicleMenu(vehicle)
local elements = {}
local price = vehicle.price
local curRentPrice = 0

if vehicle.job ~= 'none' then 
price = false
end

ESX.UI.Menu.CloseAll()

for i = 1, #spawnedVehs, 1 do
local ped = PlayerPedId()
	if IsPedInVehicle(ped, spawnedVehs[i].entityId, false) then
		if spawnedVehs[i].job == 'none' then 
		table.insert(elements, {
			name    = 'rentTime',
			label   = 'Lama Pinjam (Menit)',
			value   = 0,
			type    = 'slider',
			max     = 15
			})
		end
	end
end
	
table.insert(elements, { label = "Konfirmasi", value = "rentButton" })

ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehiclesRentrent_this_veh',
		{
			title    = "Pinjam Kendaraan",
			align    = 'top-left',
			elements = elements
		},
	function(data, menu)
		if data.current.value == 'rentButton' then
			if curRentPrice > 0 then 
				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'vehiclesRentshop_confirm',
					{ 
					title = 'Konfirmasi Pinjam',
					align = 'top-left',
					elements = {
						{label = '<span style="color:Yellow;">Ambil kendaraan?</span>', value = 'lol'},
						{label = '<span style="color:Green;">Iya</span>', value = 'yes'},
						{label = 'Kembali', value = 'no'},
					},
					},
					function (data2, menu2)
						if data2.current.value == 'yes' then
						ESX.TriggerServerCallback('esx_vehiclesRent:getVehicle', function()
							rentJob = rentJob + 1
							RentAndDespawnThisCar(vehicle, curRentPrice)
							exports['mythic_notify']:SendAlert('success', 'Berhsail menghambil kendaraan rental')
							--ESX.ShowNotification("~g~You have successfully taken the transport")
						end, vehicle)
						end
						if data2.current.value == 'no' then
						menu2.close()
						end
					end,
					function (data2, menu2)
					menu2.close()
					end
				)

			else
				exports['mythic_notify']:SendAlert('error', 'Tidak dapat menyewa untuk 0 Menit')
				--ESX.ShowNotification("~r~Unable to rent a car for 0 minutes.")
			end
	  	end
	  
end, function(data, menu)
		menu.close()
	end, function(data, menu)
		if type(tonumber(data.current.value)) == 'number' then 
		if price then 
		curRentPrice = tonumber(data.current.value) * price
		else 
		curRentPrice = tonumber(data.current.value)
		end
		end
	end)


end

RegisterNetEvent('esx_vehiclesRent:respawnCars')
AddEventHandler('esx_vehiclesRent:respawnCars', function ()
ESX.TriggerServerCallback('esx_vehiclesRent:retrieveVehicles', function(vehicles)
    ReloadVehicles(vehicles)
end)
end)

TriggerEvent('instance:registerType', 'bike')

RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)
	if instance.type == 'bike' then
		TriggerEvent('instance:enter', instance)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if Config.CarLock == true then
		if IsControlJustReleased(0, 182) then
		local playerPed = GetPlayerPed(-1)
		local coords    = GetEntityCoords(playerPed)
		for i = 1, #rentedCars, 1 do
		local carCoords = GetEntityCoords(rentedCars[i])
		if(GetDistanceBetweenCoords(coords, carCoords, true) < Config.DistanseLock) then
		local locked = GetVehicleDoorLockStatus(rentedCars[i])
		RequestAnimDict("anim@mp_player_intmenu@key_fob@")
        while not HasAnimDictLoaded("anim@mp_player_intmenu@key_fob@") do
        Wait(1)
        end
		if locked == 1 then
			SetVehicleDoorsLocked(rentedCars[i], 2)
			TaskPlayAnim(GetPlayerPed(-1),"anim@mp_player_intmenu@key_fob@","fob_click", 8.0, -8.0, -1, 49, 1, 0, 0, 0)
			Wait(1000) -- 1 second
            ClearPedTasks(GetPlayerPed(-1))
		    TriggerServerEvent("InteractSound_SV:PlayOnSource", "lock", 0.8)
			exports['mythic_notify']:SendAlert('error', 'Tutup')
			--ESX.ShowNotification("Car: ~r~Closed")
			else
			SetVehicleDoorsLocked(rentedCars[i], 1)
			TaskPlayAnim(GetPlayerPed(-1),"anim@mp_player_intmenu@key_fob@","fob_click", 8.0, -8.0, -1, 49, 1, 0, 0, 0)
			Wait(1000) -- 1 second
                ClearPedTasks(GetPlayerPed(-1))
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "unlock", 0.8)
				exports['mythic_notify']:SendAlert('success', 'Buka')
			--ESX.ShowNotification("Car: ~g~Open")
			end
		end
		end
		end
		end
		end
end)

Citizen.CreateThread(function()
local sleep = 1000
local isInInstance = false
	while true do
		Citizen.Wait(0)
			local founded = false
			local tickfound = false
			for i = 1, #spawnedVehs, 1 do
				local ped = PlayerPedId()
				if IsPedInVehicle(ped, spawnedVehs[i].entityId, false) then
				tickfound = true
				if not isInInstance then 
				TriggerEvent('instance:create', 'bike')
				isInInstance = true
				end
				if spawnedVehs[i].job == 'none' then 
				founded = true
				SetTextComponentFormat('STRING')
				AddTextComponentString('Press ~INPUT_CONTEXT~ to rent a car')
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0, 38) then
					if rentNoJob >= Config.MaxNoJob then 
						exports['mythic_notify']:SendAlert('error', 'Tidak dapat menyewa lagi')
					--ESX.ShowNotification("You can not rent more " .. Config.MaxNoJob .. " one car!")
					else 
					OpenVehicleMenu(spawnedVehs[i])
					end
				end
				else 
				if PlayerData.job ~= nil and PlayerData.job.name == spawnedVehs[i].job then 
				founded = true
				SetTextComponentFormat('STRING')
				AddTextComponentString('Press ~INPUT_CONTEXT~ to take a car')
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0, 38) then
				if rentJob >= Config.MaxJob then 
					exports['mythic_notify']:SendAlert('error', 'Tidak dapat menyewa lagi')
					--ESX.ShowNotification("You can not rent more ~y~" .. Config.MaxJob .. " cars!")
					else 
					OpenVehicleMenu(spawnedVehs[i])
				end
				end
				else
				founded = true
				SetTextComponentFormat('STRING')
				AddTextComponentString('You can not take this car!')
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				end
				end
				end
			end
			if not tickfound then 
				if isInInstance then 
				TriggerEvent('instance:close')
				isInInstance = false
				end
			end
			if not founded then 
			if ESX ~= nil then 
				if ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'vehiclesRentrent_this_veh') then
					ESX.UI.Menu.Close('default', GetCurrentResourceName(), 'vehiclesRentrent_this_veh')
				end
				if ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'vehiclesRentshop_confirm') then
					ESX.UI.Menu.Close('default', GetCurrentResourceName(), 'vehiclesRentshop_confirm')
				end
			end	
				Citizen.Wait(sleep)
			end
	end
end)	


LoadModel = function(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		Citizen.Wait(1)
	end
end



-- Create Blips
CreateThread(function()
	local blip = AddBlipForCoord(-1010.71, -2696.58, 13.00)

	SetBlipSprite (blip, 493)
	SetBlipScale  (blip, 0.75)
	--SetBlipColour (blip, Config.Zones.Starterpack.Color)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName("Pinjam Kendaraan")
	EndTextCommandSetBlipName(blip)
end)