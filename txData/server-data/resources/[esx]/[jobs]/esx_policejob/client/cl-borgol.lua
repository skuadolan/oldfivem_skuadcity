--Skrypt By Ruski, Contact Information @Ruski#0001 on Discord, Made For PlanetaRP 
ESX               				= nil
local PlayerData                = {}
local PracaPolice 				= 'police'	-- Job needed to arrest

local Aresztuje					= false		-- Biarkan False, kalau tidak saya akan menahan Anda di awal Script
local Aresztowany				= false		-- Biarkan False jika tidak Anda akan Ditangkap di awal Script
 
local SekcjaAnimacji			= 'mp_arrest_paired'	-- Bagian Katalog Animasi
local AnimAresztuje 			= 'cop_p2_back_left'	-- Animasi Arrestor
local AnimAresztowany			= 'crook_p2_back_left'	-- Animasi yang Ditangkap
local OstatnioAresztowany		= 0						-- Kau bisa menebaknya;)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx_ruski_areszt:aresztowany')
AddEventHandler('esx_ruski_areszt:aresztowany', function(target)
	Aresztowany = true

	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	RequestAnimDict(SekcjaAnimacji)

	while not HasAnimDictLoaded(SekcjaAnimacji) do
		Citizen.Wait(10)
	end

	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 11816, -0.1, 0.45, 0.0, 0.0, 0.0, 20.0, false, false, false, false, 20, false)
	TaskPlayAnim(playerPed, SekcjaAnimacji, AnimAresztowany, 8.0, -8.0, 5500, 33, 0, false, false, false)

	Citizen.Wait(950)
	DetachEntity(GetPlayerPed(-1), true, false)

	Aresztowany = false
end)

RegisterNetEvent('esx_ruski_areszt:aresztuj')
AddEventHandler('esx_ruski_areszt:aresztuj', function()
	local playerPed = GetPlayerPed(-1)

	RequestAnimDict(SekcjaAnimacji)

	while not HasAnimDictLoaded(SekcjaAnimacji) do
		Citizen.Wait(10)
	end

	TaskPlayAnim(playerPed, SekcjaAnimacji, AnimAresztuje, 8.0, -8.0, 5500, 33, 0, false, false, false)

	Citizen.Wait(3000)

	Aresztuje = false

end)

-- Glówna Funkcja Animacji
