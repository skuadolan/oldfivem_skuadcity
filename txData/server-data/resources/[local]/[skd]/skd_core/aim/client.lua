local global_wait 		= 300 			-- Don't change this
local disable_reticle 	= true			-- Change this to false if you want a reticle
local camera_shake 		= 0.1			-- Set this between 0.0-1.0 
local scopedWeapons 	= {				-- Scoped weapons (Add's reticle back for them)
	--100416529, 205991906, 177293209, 3342088282, -952879014 
}

function HashInTable(hash)
    for k, v in pairs(scopedWeapons) do 
        if (hash == v) then 
            return true 
        end 
    end 

    return false 
end 

function ManageReticle(i)
    local k, v = GetCurrentPedWeapon(i, true)
    if not HashInTable(v) then 
       HideHudComponentThisFrame(14)
	   SetPlayerTargetingMode(3)
	end 
end


local recoils = {
	-- Pistols
	[453432689] 		= 0.3, 		-- PISTOL
	[-1075685676] 		= 0.4, 		-- PISTOL MK2
	[1593441988] 		= 0.3, 		-- COMBAT PISTOL
	[-1716589765] 		= 0.6, 		-- PISTOL .50
	[-1076751822] 		= 0.2, 		-- SNS PISTOL
	[2009644972] 		= 0.25, 	-- SNS PISTOL MK2
	[-771403250] 		= 0.5, 		-- HEAVY PISTOL
	[137902532] 		= 0.4, 		-- VINTAGE PISTOL
	[-598887786] 		= 0.9, 		-- MARKSMAN PISTOL
	[-1045183535] 		= 0.6, 		-- HEAVY REVOLVER
	[-879347409] 		= 0.65, 	-- HEAVY REVOLVER MK2
	[584646201] 		= 0.2, 		-- AP PISTOL
	[911657153]			= 0.05, 	-- STUN GUN
	[1198879012] 		= 0.9, 		-- FLARE GUN

	-- Small Machine Guns (SMG)
	[324215364] 		= 0.2, 		-- MICRO SMG
	[-619010992] 		= 0.3, 		-- MACHINE PISTOL
	[-1121678507]		= 0.2,		-- MINI SMG
	[736523883] 		= 0.2, 		-- SMG
	[2024373456] 		= 0.2,		-- SMG MK2
	[-270015777] 		= 0.2,		-- ASSAULT SMG
	[171789620] 		= 0.2, 		-- COMBAT PDW
	[-1660422300] 		= 0.25, 	-- MG
	[2144741730] 		= 0.25, 	-- COMBAT MG
	[-608341376] 		= 0.25, 	-- COMBAT MG MK2
	[1627465347] 		= 0.2, 		-- GUSENBERG

	-- Assault Rifles (AR)
	[-1074790547] 		= 0.2, 		-- ASSAULT RIFLE
	[961495388]			= 0.2,		 -- ASSAULT RIFLE MK2
	[-2084633992] 		= 0.2, 		-- CARBINE RIFLE 		
	[-86904375] 		= 0.2, 		-- CARBINE RIFLE MK2
	[-1357824103]		= 0.2, 		-- ADVANCED RIFLE
	[-1063057011] 		= 0.2, 		-- SPECIAL CARBINE
	[-1768145561]		= 0.25, 	-- SPECIAL CARBINE MK2
	[2132975508] 		= 0.2, 		-- BULLPUP RIFLE
	[-2066285827]		= 0.25,		 -- BULLPUP RIFLE MK2
	[1649403952] 		= 0.3, 		-- COMPACT RIFLE

	--- Snipers
	[100416529] 		= 0.5, 		-- SNIPER RIFLE
	[205991906] 		= 0.7, 		-- HEAVY SNIPER
	[177293209] 		= 0.7,		-- HEAVY SNIPER MK2
	[3342088282]		= 0.3, 		-- MARKSMAN RIFLE
	[-952879014] 		= 0.35, 	-- MARKSMAN RIFLE MK2

	--- Shotguns
	[487013001] 		= 0.4, 		-- PUMP SHOTGUN
	[1432025498] 		= 0.4, 		-- PUMP SHOTGUN MK2
	[2017895192] 		= 0.7, 		-- SAWNOFF SHOTGUN
	[-1654528753] 		= 0.2, 		-- BULLPUP SHOTGUN
	[-494615257] 		= 0.4, 		-- ASSAULT SHOTGUN
	[-1466123874] 		= 0.7, 		-- MUSKET
	[984333226] 		= 0.4, 		-- HEAVY SHOTGUN
	[4019527611] 		= 2.1, 		-- DOUBLE BARREL SHOTGUN
	[317205821]			= 0.7,		-- SWEEPER SHOTGUN

	--- BIG BANG! MUCH WOW!
	[-1568386805]		= 0.5,		-- GRENADE LAUNCHER
	[1305664598] 		= 1.0, 		-- GRENADE LAUNCHER SMOKE (Unsure if this is the right hash?)
	[-1312131151] 		= 0.2, 		-- RPG
	[1119849093] 		= 0.00001, 	-- MINIGUN
	[2138347493] 		= 0.2, 		-- FIREWORK LAUNCHER
	[1834241177] 		= 1.2, 		-- RAILGUN
	[1672152130] 		= 0.2, 		-- HOMING LAUNCHER
	[125959754] 		= 0.5, 		-- COMPACT GRENADE LAUNCHER	
}

local GetFollowCamView = 0
local isPedArmed = false
local isPedShooting = false
local ped = 0
local isPedDoingDrive = false

Citizen.CreateThread(function()
	local wait = global_wait
	local playerPed = GetPlayerPed(-1)
	local car = GetVehiclePedIsIn(playerPed, false)
	local passengerDriveBy = true
	local PedAnyVeh = IsPedInAnyVehicle(ped)
	local seatPedImVeh = GetPedInVehicleSeat(car, -1)

	while true do
		Citizen.Wait(wait)
		--Disables first person driveby as the recoil doesn't work properly during this.
		if car then
			if GetFollowCamView == 4 and PedAnyVeh then
				if seatPedImVeh == playerPed then
					SetPlayerCanDoDriveBy(PlayerId(), false)
				elseif passengerDriveBy then
					SetPlayerCanDoDriveBy(PlayerId(), true)
				else
					SetPlayerCanDoDriveBy(PlayerId(), false)
				end
			end
		end
		
		if isPedArmed then
			wait = 0

			-- Disable ammo HUD			
			DisplayAmmoThisFrame(false)	

			-- Disables reticle if 'disable_reticle' is set to true
			if disable_reticle then		
				ManageReticle(ped)
				DisableControlAction(0, 140)
				SetPlayerTargetingMode(3)
			end

			-- Disable melee while aiming (may be not working)	
			if isPedShooting then	
		       	DisableControlAction(1, 140, true)
		        DisableControlAction(1, 141, true)
		        DisableControlAction(1, 142, true)
				SetPlayerTargetingMode(3)
		    end
		else
			wait = global_wait
		end
	end
end)

Citizen.CreateThread(function()
	local wait = global_wait
	math.random(GetGameTimer())
	while true do
		Citizen.Wait(wait)
		if isPedArmed then
			wait = 0
			if isPedShooting then
				print(GetCurrentPedWeapon(ped))
						print(GetCurrentPedWeapon(ped))
				local _, wep = GetCurrentPedWeapon(ped)
				_, cAmmo = GetAmmoInClip(ped, wep)
				if recoils[wep] and recoils[wep] ~= 0 then
					tv = 0
					repeat 
						Wait(0)
						x = GetGameplayCamRelativePitch()
						y = GetGameplayCamRelativeHeading()
						local cx
						local cy
						if GetFollowCamView == 4 then
							if isPedDoingDrive then
								--print("\nFirst Person -- Vehicle")
								cx = math.random(250, 350)/100
								cy = math.random(-100, 100)/100
							else
								--print("\nFirst Person -- Ped")
								cx = math.random(0, 100)/100
								cy = math.random(-100, 100)/100
							end
						else
							if isPedDoingDrive then
								--print("\nThird Person -- Vehicle")
								cx = math.random(250, 350)/100
								cy = math.random(-100, 100)/100
							else
								--print("\nThird Person -- Ped")
								cx = math.random(0, 100)/100
								cy = math.random(-100, 100)/100
							end
						end

						SetGameplayCamRelativePitch(x+cx, 1.0)
						SetGameplayCamRelativeHeading(y+cy)
						--print("Pitch: "..GetGameplayCamRelativePitch())
						--print("Heading: "..GetGameplayCamRelativeHeading())
						ShakeGameplayCam('VIBRATE_SHAKE', camera_shake)
						tv = tv+0.1
					until tv >= recoils[wep]
				end
			end
		else
			wait = global_wait
		end
	end
end)

local isPedBeingStun = false

local tiempo = 1 -- in miliseconds >> 1000 ms = 1s

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedBeingStunned(ped) then
		SetPedMinGroundTimeForStungun(ped, tiempo)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isPedBeingStun then
		SetPedMinGroundTimeForStungun(ped, tiempo)
		end
	end
end)

Citizen.CreateThread(function()
    while true do
		ped = PlayerPedId()
        GetFollowCamView = GetFollowVehicleCamViewMode()
		isPedArmed = IsPedArmed(PlayerPedId(), 6)
		isPedShooting = IsPedShooting(ped)
		isPedDoingDrive = IsPedDoingDriveby(ped)
		isPedBeingStun = IsPedBeingStunned(ped, 0)
        Citizen.Wait(500)
    end
end)