--This script is property of OurStory RP but has been released for free on the FiveM forums! Do NOT redisribute this for money or claim it as yours.
--If you use this script, all I ask is that you credit me using my Discord account 4th#4444
--Also, I politely request that you do not rename the script.
--Video showcase: https://www.youtube.com/watch?v=a-StxdwHPfE

ESX              = nil
local PlayerData = {}
local hasInjected = false
local morphineTimer = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

--Morphine
RegisterNetEvent('ourstory_morphine:inject')
AddEventHandler('ourstory_morphine:inject', function()
	prop_name = 'p_syringe_01_s'
	Citizen.CreateThread(function()
		local playerPed = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(playerPed))
		local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
		local boneIndex = GetPedBoneIndex(playerPed, 18905)
		AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.03, 0.02, -50.0, 130.0, -.0, true, true, false, true, 1, true)
		loadAnimDict('mp_arresting')
		TaskPlayAnim(playerPed, 'mp_arresting', 'a_uncuff', 8.0, -8, -1, 49, 0, 0, 0, 0)
		--exports['mythic_notify']:DoHudText('success', 'Injecting morphine')
		SetPedMoveRateOverride(PlayerId(),10.0)
		SetRunSprintMultiplierForPlayer(PlayerId(),1.03)
		SetSwimMultiplierForPlayer(PlayerId(),1.06)
		Citizen.Wait(1200)
		--[[local syringeSound = math.random(1,3)
		if syringeSound == 1 then
			TriggerEvent('LIFE_CL:Sound:PlayOnOne', 'syringe1', 0.2)
		elseif syringeSound == 2 then
			TriggerEvent('LIFE_CL:Sound:PlayOnOne', 'syringe2', 0.2)
		elseif syringeSound == 3 then
			TriggerEvent('LIFE_CL:Sound:PlayOnOne', 'syringe3', 0.2)
		end]]
		Citizen.Wait(2500)
		ClearPedSecondaryTask(playerPed)
		DeleteObject(prop)
		ClearAllPedProps(prop)
		ClearPedTasks(playerPed)
		if hasInjected == false then
			hasInjected = true
			while morphineTimer < 1800 do -- 1800 seconds
				morphineTimer = morphineTimer + 1
				local HP = GetEntityHealth(PlayerPedId())
				HP = HP + 1
				SetEntityHealth(PlayerPedId(), HP)
				Citizen.Wait(1000)
			end
			if hasInjected == true then
				hasInjected = false
				--exports['mythic_notify']:DoHudText('error', 'Your morphine high has run out.')
				morphineTimer = 0
				SetPedMoveRateOverride(PlayerId(),10.0)
				SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
				SetSwimMultiplierForPlayer(PlayerId(),1.0)
			end
		else
			--exports['mythic_notify']:DoHudText('inform', 'You renew your morphine injection')
		end
	end)
end)