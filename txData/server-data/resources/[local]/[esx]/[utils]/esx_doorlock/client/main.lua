ESX = nil
local playerCoords = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while not ESX.GetPlayerData().job do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	playerCoords = GetEntityCoords(PlayerPedId())

	-- Update the door list
	ESX.TriggerServerCallback('esx_doorlock:getDoorState', function(doorState)
		for index,state in pairs(doorState) do
			Config.DoorList[index].locked = state
		end
	end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job) ESX.PlayerData.job = job end)

RegisterNetEvent('esx_doorlock:setDoorState')
AddEventHandler('esx_doorlock:setDoorState', function(index, state) Config.DoorList[index].locked = state end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		local coordsMe = GetEntityCoords(GetPlayerPed(-1))
		for k,v in ipairs(Config.DoorList) do
			local dist = Vdist2(coordsMe, v.textCoords)
			v.isAuthorized = isAuthorized(v)

			if dist <= 3 then
				if v.doors then
					for k2,v2 in ipairs(v.doors) do
						if v2.object and DoesEntityExist(v2.object) then
							if v.locked and v2.objHeading and ESX.Math.Round(GetEntityHeading(v2.object)) ~= v2.objHeading then
								SetEntityHeading(v2.object, v2.objHeading)
							end
						else
							v2.object = GetClosestObjectOfType(v2.objCoords, 1.0, v2.objHash, false, false, false)
						end
					end
				else
					if v.object and DoesEntityExist(v.object) then
						if v.locked and v.objHeading and ESX.Math.Round(GetEntityHeading(v.object)) ~= v.objHeading then
							SetEntityHeading(v.object, v.objHeading)
						end
					else
						v.object = GetClosestObjectOfType(v.objCoords, 1.0, v.objHash, false, false, false)
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local letSleep = true
		local coordsMe = GetEntityCoords(GetPlayerPed(-1))

		for k,v in ipairs(Config.DoorList) do
			local dist = Vdist2(coordsMe, v.textCoords)
			--if v.distanceToPlayer and v.distanceToPlayer < 50 then
			if dist <= 1.5 then
				letSleep = false

				if v.doors then
					for k2,v2 in ipairs(v.doors) do
						FreezeEntityPosition(v2.object, v.locked)
					end
				else
					FreezeEntityPosition(v.object, v.locked)
				end
			end

			--if v.distanceToPlayer and v.distanceToPlayer < v.maxDistance then
			if dist <= 1.5 then
				local size, displayText = 1, _U('unlocked')

				if v.size then size = v.size end
				if v.locked then displayText = _U('locked') end
				if v.isAuthorized then displayText = _U('press_button', displayText) end

				ESX.Game.Utils.DrawText3D(v.textCoords, displayText, size)

				if IsControlJustReleased(0, 38) then
					if v.isAuthorized then
						v.locked = not v.locked
						openDoorAnim()
						TriggerServerEvent('esx_doorlock:updateState', k, v.locked) -- broadcast new state of the door to everyone
					end
				end
			end
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

function isAuthorized(door)
	if not ESX or not ESX.PlayerData.job then
		return false
	end

	for k,job in pairs(door.authorizedJobs) do
		if job == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end

function openDoorAnim()
	if not IsPedInAnyVehicle(PlayerPedId()) then
    	loadAnimDict("anim@heists@keycard@") 
    	TaskPlayAnim( GetPlayerPed(-1), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
		SetTimeout(600, function()
			ClearPedTasks(GetPlayerPed(-1))
		end)
	end
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end