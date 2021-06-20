ESX = nil
local hasAlreadyEnteredMarker, lastZone, zoneDoing
local currentAction, currentActionMsg, currentActionData = nil, nil, {}
local status = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)

end)

AddEventHandler('skd_utils:hasEnteredMarker', function(zone, zoneDoing)
	currentAction     = zoneDoing
	currentActionMsg  = _U('press_menu')
	currentActionData = {zone = zone}
end)

AddEventHandler('skd_utils:hasExitedMarker', function(zone)
	currentAction = nil
	ESX.UI.Menu.CloseAll()
end)


function getTreasure()
	local playerPed = PlayerPedId()

	ESX.TriggerServerCallback('skd_treasure:getStatusTreasure', function(success)
		if success then
			ESX.TriggerServerCallback('skd_treasure:getTreasure', function(success)
				if success then
					--ESX.ShowNotification(_U('success'))
				end
			end)			
		end
	end)

end

function treasureMenu(zone)
	local elements = {
		{label = _U('treasure'), value = 'claim'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'general_menu', {
		title    = _U('get_treasure'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'claim_confirm', {
			title    = _U('value_treasure')..Config.TreasureNominal,
			align    = 'bottom-right',
			elements = {
				{label = _U('no'),  value = 'no'},
				{label = _U('yes'), value = 'yes'}
		}}, function(data2, menu2)
			if data2.current.value == 'yes' then
				getTreasure()
			end

			menu2.close()
		end, function(data2, menu2)
			menu2.close()
		end)
	end, function(data, menu)
		menu.close()

		currentAction     = 'treasure_menu'
		currentActionMsg  = _U('menu_treasure')
		currentActionData = {zone = zone}
	end)
end





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


function starterpackMenu(zone)
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








-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, letSleep, currentZone = false, false
		local distance = #(playerCoords - Config.MarkerPosition)

		if distance < Config.DrawDistance then

            for k,v in pairs(Conifg.Zones) do
                if v ~= 'Treasure' then
                    DrawMarker(Config.Type, v.MarkerPosition, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, nil, nil, false)
                end
            end


			letSleep = false

			if distance < Config.Size.x then
				isInMarker  = true
				currentZone = k
				lastZone    = k
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
            for k,v in pairs(Conifg.Zones) do
                if v == 'Starterpack' then
                    zoneDoing == 'Starterpack'
                elseif v == 'Treasure' then
                    zoneDoing == 'Treasure'
                end
            end
			hasAlreadyEnteredMarker = true
			TriggerEvent('skd_utils:hasEnteredMarker', currentZone, zoneDoing)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('skd_utils:hasExitedMarker', lastZone)
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
				if currentAction == 'Starterpack' then
					starterpackMenu(currentActionData.zone)
                elseif currentAction == 'Treasure' then
                    treasureMenu(currentActionData.zone)
				end

				currentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)





-- DRAW TEXT START
function DrawText3Ds(Pos, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(Pos, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.028+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local distance = 25

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local sleep = true
        local player = PlayerPedId()
        local getentity = GetEntityCoords

        for k,v in pairs(Config.DrawTextZones) do
			for i = 1, #v.Pos, 1 do
				local distance = Vdist2(getentity(player, false), v.Pos[i])

				if distance < 25 then
                    sleep = false
                    DrawText3Ds(v.Pos[i], _U('drawtext'))
				end
			end
		end
        
        --end
        if sleep then
			Citizen.Wait(50)
		end
    end
end)
-- DRAW TEXT END


-- DRAW BLIPS START
-- Create Blips
Citizen.CreateThread(function()
	
	for i=1, #Config.BlipMap, 1 do
		
		local blip = AddBlipForCoord(Config.BlipMap[i].pos)
		SetBlipSprite (blip, Config.BlipMap[i].id)
		SetBlipScale  (blip, 0.7)
		SetBlipDisplay(blip, 4)
		SetBlipColour (blip, Config.BlipMap[i].color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.BlipMap[i].name)
		EndTextCommandSetBlipName(blip)
	end

end)
-- DRAW BLIPS END