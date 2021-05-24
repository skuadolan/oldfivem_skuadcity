ESX = nil
local PlayerData, CurrentActionData = {}, {}
local LastZone, CurrentAction, CurrentActionMsg, FoodInPlace
local OnJob, Cooking, HasAlreadyEnteredMarker = false, false, false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


function OpenPedagangActionsMenu()
	local elements = {
		{label = _U('vehicle_list'), 	value = 'vehicle_list'},
		{label = _U('job_clothes'), 	value = 'cloakroom'},
		{label = _U('civil'), 			value = 'cloakroom2'}
	}

	if PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
  		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pedagang_actions', {
			title    = _U('blip_pedagang'),
			elements = elements
		}, function(data, menu)

			if data.current.value == 'vehicle_list' then
				local elements = {
					{label = 'Mobil Pedagang', value = 'taco'}
				}

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_vehicle', {
						title    = _U('vehicles'),
						elements = elements
					}, function(data, menu)

						local playerPed = GetPlayerPed(-1)
						local coords    = Config.Zones.VehicleSpawnPoint.Pos
						ESX.Game.SpawnVehicle(data.current.value, coords, 260.14, function(vehicle)
							TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
						end)	
						ESX.UI.Menu.CloseAll()
					end,function(data, menu)
						menu.close()
					end)
			end

			if data.current.value == 'cloakroom' then
				menu.close()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    				if skin.sex == 0 then
        				TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
    				else
        				TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
    				end    
				end)
			end

			if data.current.value == 'cloakroom2' then
				menu.close()
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    				TriggerEvent('skinchanger:loadSkin', skin)    
				end)
			end

			if data.current.value == 'boss_actions' then

                ESX.UI.Menu.CloseAll()
				TriggerEvent('esx_society:openBossMenu', 'pedagang', function(data, menu)
					menu.close()
				end, { wash = false, grades = false })
            end
		end, function(data, menu)
			menu.close()
			CurrentAction     = 'pedagang_actions_menu'
			CurrentActionMsg  = _U('pedagang_actions_menu')
			CurrentActionData = {}
		end)
end


function OpenBillingMenu()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
		title = _U('billing_amount')
	  }, function(data, menu)
	  
		local amount = tonumber(data.value)
		local player, distance = ESX.Game.GetClosestPlayer()
		local sleep = true
  
		if player ~= -1 and distance <= 3.0 then
			sleep = false
			menu.close()

			if amount == nil then
				ESX.ShowNotification(_U('amount_invalid'))
			else
				TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_pedagang', _U('billing'), amount)
			end
		else
		  ESX.ShowNotification(_U('no_players_nearby'))
		end
		if sleep then
			Citizen.Wait(50)
		end
	end, function(data, menu)
		menu.close()
	end)
end



RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

AddEventHandler('np-pedagang:hasEnteredMarker', function(zone)
	Citizen.Trace('zone: ' .. zone)
	if zone == 'Actions' then
		CurrentAction     = 'pedagang_actions_menu'
		CurrentActionMsg  = _U('pedagang_menu')
		CurrentActionData = {}
	end
end)

AddEventHandler('np-pedagang:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('blip_pedagang'),
		number     = 'pedagang',
		base64Icon = 'data:image/png;base64,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'
	}
	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- Create Blips
--[[Citizen.CreateThread(function()		
	blip = AddBlipForCoord(Config.Zones.Actions.Pos.x, Config.Zones.Actions.Pos.y, Config.Zones.Actions.Pos.z)
	SetBlipSprite (blip, 93)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 1.0)
	SetBlipColour (blip, 27)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('blip_market'))
	EndTextCommandSetBlipName(blip)
end)]]

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if PlayerData.job ~= nil and PlayerData.job.name == 'pedagang' then
			local coords = GetEntityCoords(GetPlayerPed(-1))
			local sleep = true

			for k,v in pairs(Config.Zones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					sleep = false
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
			if sleep then
				Citizen.Wait(50)
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if PlayerData.job ~= nil and PlayerData.job.name == 'pedagang' then
			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local sleep = true
			local isInMarker  = false
			local currentZone = nil
			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					sleep = false
					isInMarker  = true
					currentZone = k
				end
			end
			if sleep then
				Citizen.Wait(50)
			end
			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('np-pedagang:hasEnteredMarker', currentZone)
			end
			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('np-pedagang:hasExitedMarker', LastZone)
			end
		end
	end
end)

AddEventHandler('np-pedagang:hasExitedEntityZone', function(entity)
	CurrentAction = nil
end)

-- Enter / Exit entity zone events
Citizen.CreateThread(function()

	local trackedEntities = {
	}

	while true do

		Citizen.Wait(0)

		local playerPed = GetPlayerPed(-1)
		local coords    = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil
		local sleep = true

		for i=1, #trackedEntities, 1 do

			local object = GetClosestObjectOfType(coords.x,  coords.y,  coords.z,  3.0,  GetHashKey(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then

				local objCoords = GetEntityCoords(object)
				local distance  = GetDistanceBetweenCoords(coords.x,  coords.y,  coords.z,  objCoords.x,  objCoords.y,  objCoords.z,  true)

				if closestDistance == -1 or closestDistance > distance then
					sleep = false
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			sleep = false

 			if LastEntity ~= closestEntity then
 				TriggerEvent('esx_basicneeds:isEating', function(isEating)
 					if not isEating then
						TriggerEvent('np-pedagang:hasEnteredEntityZone', closestEntity)
					end
				end)
				LastEntity = closestEntity
			end

		else

			if LastEntity ~= nil then
				TriggerEvent('np-pedagang:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end
		end
		if sleep then
			Citizen.Wait(50)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            
            if IsControlJustReleased(0, 38) and PlayerData.job ~= nil and PlayerData.job.name == 'pedagang' then
				OpenPedagangActionsMenu()

            	--TriggerServerEvent('esx:clientLog', 'PUSHING E')
                if CurrentAction == 'pedagang_actions_menu' then
                    
                elseif CurrentAction == 'pedagang_client_burger' or CurrentAction == 'pedagang_client_tacos' or CurrentAction == 'pedagang_client_makiriime' then
                    --TriggerServerEvent('np-pedagang:removeFood', CurrentActionData.item)
                    TriggerServerEvent('np-pedagang:addItem', CurrentActionData.item, 1)
                    ESX.Game.DeleteObject(FoodInPlace)
                    FoodInPlace = nil
                end

                CurrentAction = nil
            end
        end

        if IsControlJustReleased(0, 167) and PlayerData.job ~= nil and PlayerData.job.name == 'pedagang' then
            OpenBillingMenu()
        end
    end
end)
