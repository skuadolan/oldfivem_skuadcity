ESX                             = nil
local VaultDoor                 = nil
local DrillObject               = nil
local CashObject                = nil
local RobbingMarkers            = false
local Robbing                   = false
local Drilling                  = false
local CurrentTimer              = 0
local OpeningDoor               = false --16k
local MoneyCounter              = 0
local packingAnimation          = false

local particles                 = nil
local particles2                = nil
local blipRobbery               = nil

local HaveTermal                = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1))

		for k in pairs(Config.BigBanks) do
			if GetDistanceBetweenCoords(playerCoords, Config.BigBanks[k].Pos.x, Config.BigBanks[k].Pos.y, Config.BigBanks[k].Pos.z, true) <= 1.5 then
				DrawMarker(25, Config.BigBanks[k].Pos.x, Config.BigBanks[k].Pos.y, Config.BigBanks[k].Pos.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 0, 0, 80, false, false, 2, false, nil, nil, false)
				ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby, obarabować skarbiec.')
				if IsControlJustPressed(0, 38) then
					if HaveTermal then
						TriggerServerEvent('genesis-holdUp:robBigBank', k)
					else
						ESX.ShowNotification('~r~Nie posiadasz wiertła!')
					end
					Citizen.Wait(500)
				end
			end
		end
	end
end)

RegisterNetEvent('genesis-holdUp:thermalSync')
AddEventHandler('genesis-holdUp:thermalSync', function(bool)
	HaveTermal = bool
end)

RegisterNetEvent('genesis-holdUp:startRobbing')
AddEventHandler('genesis-holdUp:startRobbing', function(bName)
	local Vault = Config.BigBanks[bName]
	RobbingMarkers = true
	Robbing = true

	ESX.ShowNotification('~b~Uruchomiono alarm, zainstaluj wiertło aby, dostać się do skarbca!')

	Citizen.CreateThread(function()
		while Robbing do
			Citizen.Wait(10)
			local playerCoords = GetEntityCoords(GetPlayerPed(-1))
			if RobbingMarkers then
				if GetDistanceBetweenCoords(playerCoords, Vault.DrillSpawn.x, Vault.DrillSpawn.y, Vault.DrillSpawn.z, true) <= 2.0 then
					--DrawMarker(25, Vault.DrillSpawn.x, Vault.DrillSpawn.y, Vault.DrillSpawn.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.5, 3.5, 1.0, 0, 0, 0, 80, false, false, 2, false, nil, nil, false)			
					ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby, zainstalować wiertło.')
					if IsControlJustPressed(0, 38) then
						if DrillObject == nil then
							SpawnDrill(Vault)
							Citizen.Wait(100)
						end
					end
				end
			end
		end
	end)

	Citizen.CreateThread(function()
		while Robbing do
			Citizen.Wait(10)
			local playerCoords = GetEntityCoords(GetPlayerPed(-1))
			if RobbingMarkers then
				if GetDistanceBetweenCoords(playerCoords, Vault.DrillSpawn.x, Vault.DrillSpawn.y, Vault.DrillSpawn.z, true) <= 15.0 then
					DrawMarker(25, Vault.DrillSpawn.x, Vault.DrillSpawn.y, Vault.DrillSpawn.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.5, 3.5, 1.0, 0, 0, 0, 80, false, false, 2, false, nil, nil, false)
				end
			end
		end
	end)
end)

--Licznik
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1))
		if Drilling then
			if CurrentTimer >= 1 then
				CurrentTimer = CurrentTimer-1	
			else				
				DeleteObject(DrillObject)
				Drilling = false				
				if CashObject == nil then
					SpawnMoneyPile()					
				end
				TriggerServerEvent('genesis-holdUp:syncParticles', false)
				TriggerServerEvent('genesis-holdUp:syncOpenAnim')
			end
		end
	end
end)
--Display timer

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if OpeningDoor then
			Citizen.Wait(6000)			
			FreezeEntityPosition(VaultDoor, true)
			OpeningDoor = false
		end
	end
end)

function SpawnDrill(bName)
	SetEntityCoordsNoOffset(GetPlayerPed(-1), bName.PlayerAnimPos.x, bName.PlayerAnimPos.y, bName.PlayerAnimPos.z, false, false, false, true)
	SetEntityHeading(GetPlayerPed(-1), bName.PlayerAnimHea)
	ESX.Streaming.RequestAnimDict('mini@repair', function()
		TaskPlayAnim(PlayerPedId(), 'mini@repair', 'fixing_a_ped', 0.5, -8.0, -1, 17, 0, false, false, false)
	end)

	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'zip', 0.5)

	Citizen.Wait(10000)
	ClearPedTasks(PlayerPedId())

	DrillObject = CreateObject(GetHashKey('genesis_heist_drill'),  254.29, 225.95, 100.88, true, true, true)
	SetEntityHeading(DrillObject, bName.DrillHeading)

	while DrillObject == nil do
		Citizen.Wait(200)
		DrillObject = CreateObject(GetHashKey('genesis_heist_drill'),  254.29, 225.95, 100.88, true, true, true)
		SetEntityHeading(DrillObject, bName.DrillHeading)
	end

	CurrentTimer = bName.Time
	Drilling = true
	RobbingMarkers = false	

	TriggerServerEvent('genesis-holdUp:syncParticles', true)

	Citizen.CreateThread(function()
		while Drilling do
			Citizen.Wait(10)
			local editedCoords = {x = bName.DrillSpawnPoint.x, y = bName.DrillSpawnPoint.y, z = bName.DrillSpawnPoint.z}
			ESX.Game.Utils.DrawText3D(editedCoords, 'Pozostały czas ~r~'..CurrentTimer..'s', 1.0)
		end
	end)
end

RegisterNetEvent('genesis-holdUp:openAnim')
AddEventHandler('genesis-holdUp:openAnim', function()
	OpeningDoor = true
	
	VaultDoor = GetClosestObjectOfType(253.43, 224.31, 101.88, 25.0, GetHashKey('v_ilev_bk_vaultdoor'), false, false, false)
	local heading = GetEntityHeading(VaultDoor)

	while OpeningDoor == true do
		Citizen.Wait(9 * 4)
		heading = heading - 1
		SetEntityHeading(VaultDoor, heading)
	end --prop_cash_crate_01	
end)

RegisterNetEvent('genesis-holdUp:openVaultSound')
AddEventHandler('genesis-holdUp:openVaultSound', function()
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 15.0, 'vaultOpen', 0.8)
end)

RegisterNetEvent('genesis-holdUp:playParticles')
AddEventHandler('genesis-holdUp:playParticles', function(bool)
	if bool == true then
		if not HasNamedPtfxAssetLoaded("core") then
			RequestNamedPtfxAsset("core")
			while not HasNamedPtfxAssetLoaded("core") do
				Wait(1)
			end
		end

		UseParticleFxAssetNextCall("core")
		particles  = StartParticleFxLoopedAtCoord("ent_amb_sparking_wires", 253.85, 224.73, 101.4, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		UseParticleFxAssetNextCall("core")
		particles2 = StartParticleFxLoopedAtCoord("ent_amb_stoner_vent_smoke", 253.85, 224.73, 101.4, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	else
		StopParticleFxLooped(particles, 0)
		StopParticleFxLooped(particles2, 0)
	end
end)

function SpawnMoneyPile()
	CashObject = CreateObject(GetHashKey('prop_cash_crate_01'), 264.35, 213.7, 101.58, true, true, true)
	FreezeEntityPosition(CashObject, true)

	Citizen.CreateThread(function()
		while CashObject ~= nil do			
			Citizen.Wait(10)
			local playerCoords = GetEntityCoords(GetPlayerPed(-1))
			if GetDistanceBetweenCoords(playerCoords, 264.35, 213.7, 101.58, true) <= 2.0 then
				ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby, zapakować pieniądze.')
				if IsControlJustPressed(0, 38) then
					if not packingAnimation then
						PackAnim()
					end
					Citizen.Wait(500)
				end
			end
		end
	end)
end

function PackAnim()
	packingAnimation = true

	local lib = 'mp_missheist_ornatebank'
	local animLoop = 'put_cash_into_bag_loop'

	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, animLoop, 0.5, -8.0, -1, 17, 0, false, false, false)

		Wait(3000)
		TriggerServerEvent('genesis-holdUp:giveMoney')
		PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
		
		Wait(1350)
		TriggerServerEvent('genesis-holdUp:giveMoney')
		PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
		
		Wait(1350)
		TriggerServerEvent('genesis-holdUp:giveMoney')
		PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
		
		Wait(1350)
		TriggerServerEvent('genesis-holdUp:giveMoney')
		PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
		
		Wait(1350)
		TriggerServerEvent('genesis-holdUp:giveMoney')
		PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)		
		Wait(1350)
		ClearPedTasks(PlayerPedId())

		MoneyCounter = MoneyCounter+1

		if MoneyCounter >= 8 then
			ResetAllFunctions() 
		else
			MoneyCounter = MoneyCounter+1
		end
	end)

	packingAnimation = false
end

function ResetAllFunctions() 
	DeleteObject(DrillObject)
	DeleteObject(CashObject)

	VaultDoor                 = nil
	DrillObject               = nil
	CashObject                = nil
	RobbingMarkers            = false
	Robbing                   = false
	Drilling                  = false
	CurrentTimer              = 0
	OpeningDoor               = false --16k
	MoneyCounter              = 0
	packingAnimation          = false

	--StopParticleFxLooped(particles, 0)


	TriggerServerEvent('genesis-holdUp:robEnded')
	ESX.ShowNotification('~b~Zebrałeś już wyszystkie pieniądze, ~r~UCIEKAJ!')
end --642

Citizen.CreateThread(function()
	local coords = Config.BigBanks["Central_Bank"].Pos
	
	local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip , 642)
    SetBlipScale(blip , 1.0)
    SetBlipColour(blip, 5)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Napad na Pacific Standard')
	EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent('genesis-holdUp:copsNotif')
AddEventHandler('genesis-holdUp:copsNotif', function ()
	local coords = Config.BigBanks["Central_Bank"].Pos
	
	ESX.ShowNotification(_U('cops_notif'))

	blipRobbery = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 2.0)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
end)

RegisterNetEvent('genesis-holdUp:killBlip')
AddEventHandler('genesis-holdUp:killBlip', function ()
	ESX.ShowNotification(_U('cops_notif2'))
	RemoveBlip(blipRobbery)
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		DeleteObject(DrillObject)
		DeleteObject(CashObject)
		StopParticleFxLooped(particles, 0)
		StopParticleFxLooped(particles2, 0)
		RemoveBlip(blipRobbery)
	end
end)
