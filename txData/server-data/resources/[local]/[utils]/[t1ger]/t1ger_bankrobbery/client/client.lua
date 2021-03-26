-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 

Banks 		    = {}
Safes 	        = {}
vaultDoor 	    = nil
Police          = 0

-- Keypad [1] Hacking Thread:
local keyPressed = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local player = GetPlayerPed(-1)
        local coords = GetEntityCoords(player,true)
        for k,v in pairs(Banks) do
			if not v.inUse then
				if v.keypads[1] ~= nil and not v.keypads[1].hacked then
					if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.keypads[1].pos[1], v.keypads[1].pos[2], v.keypads[1].pos[3], false) <= 1.0 and not keyPressed then
						if Police >= v.minCops then
							if not isCop then
								DrawText3Ds(v.keypads[1].pos[1], v.keypads[1].pos[2], v.keypads[1].pos[3], Lang['hack_keypad_1'])
								if IsControlJustPressed(0,Config.KeyHackTerminal) and not keyPressed then
									ESX.TriggerServerCallback('t1ger_bankrobbery:hackerDevice', function(gotDevice)
										if gotDevice then
											keyPressed = true
											TriggerServerEvent('t1ger_bankrobbery:inUseSV', true)
											HackKeyPad1(k,v)
										else
											ShowNotifyESX(Lang['no_hacking_dev'])
										end
									end)
								end
							end	
						else
							DrawText3Ds(v.keypads[1].pos[1], v.keypads[1].pos[2], v.keypads[1].pos[3], Lang['bank_in_lockdown'])
						end
					end
				end
			end
			if k == 8 then
				if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.door.pos[1], v.door.pos[2], v.door.pos[3], true) <= 6.0 then
					local bankDoor = GetClosestObjectOfType(v.door.pos[1], v.door.pos[2], v.door.pos[3], 5.0, v.door.model, false, true, false)
					if bankDoor ~= nil and bankDoor ~= 0 then
						if not v.keypads[1].hacked then
							FreezeEntityPosition(bankDoor, true)
						else
							FreezeEntityPosition(bankDoor, false)
						end	
					end
				end
			end
        end
    end
end)

-- Keypad [2] Hacking Thread:
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local player = GetPlayerPed(-1)
        local coords = GetEntityCoords(player,true)
        for k,v in pairs(Banks) do
			if v.inUse then
				if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.keypads[2].pos[1], v.keypads[2].pos[2], v.keypads[2].pos[3], false) <= 1.0 and not keyPressed then
					if not v.keypads[2].hacked and v.keypads[1].hacked then
						if not isCop then
							DrawText3Ds(v.keypads[2].pos[1], v.keypads[2].pos[2], v.keypads[2].pos[3], Lang['hack_keypad_2'])
							if IsControlJustPressed(0,Config.KeyHackVault) and not keyPressed then
								ESX.TriggerServerCallback('t1ger_bankrobbery:hackerDevice', function(gotDevice)
									if gotDevice then
										keyPressed = true
										HackKeyPad2(k,v)
									else
										ShowNotifyESX(Lang['no_hacking_dev'])
									end
								end)
							end	
						end
					end
				end
			end
			if k ~= 8 then
				if v.door ~= nil and v.keypads[2] ~= nil then
					if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.door.pos[1], v.door.pos[2], v.door.pos[3], true) <= 6.0 then
						local cellDoor = GetClosestObjectOfType(v.door.pos[1], v.door.pos[2], v.door.pos[3], 5.0, v.door.model, false, true, false)
						if cellDoor ~= nil and cellDoor ~= 0 then
							if not v.keypads[2].hacked then
								FreezeEntityPosition(cellDoor, true)
							else
								FreezeEntityPosition(cellDoor, false)
							end	
						end
					end
				end
			end
        end
    end
end)

-- First Door Hacking (STARTER) // MHACKING
function HackKeyPad1(k,v)
    local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player,true)
	if v.keypads[1] ~= nil then
		if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.keypads[1].pos[1], v.keypads[1].pos[2], v.keypads[1].pos[3],false) <= 1.0 then
			SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"),true)
			Citizen.Wait(200)
			FreezeEntityPosition(player, true)
			TaskStartScenarioInPlace(player, 'WORLD_HUMAN_STAND_MOBILE', -1, true)
			Citizen.Wait(2000)
			if Config.mHacking then 
				TriggerEvent("mhacking:show")
				TriggerEvent("mhacking:start",3,25,KeyPad1Complete)
			else
				-- Add your own minigame here and make a callback to KeyPad1Complete function.
			end
		end
	end
end

-- CALLBACK FOR FIRST KEYPAD:
function KeyPad1Complete(success)
	local player = GetPlayerPed(-1)
	local coords = GetEntityCoords(player)
	TriggerEvent('mhacking:hide')
	if success then		
		if math.random(1,100) <= Config.ChanceHackerDeviceBack then
			ShowNotifyESX(Lang['hacker_dev_corrupted'])
		else
			local item = Config.HackItem
			TriggerServerEvent('t1ger_bankrobbery:giveItem',item)
		end
		for k,v in pairs(Banks) do			
			if GetDistanceBetweenCoords(coords, v.keypads[1].pos[1], v.keypads[1].pos[2], v.keypads[1].pos[3], true) < 1.5 then
				TriggerServerEvent('t1ger_bankrobbery:KeypadStateSV', "first", k, true)
				Citizen.Wait(500)
				NotifyPoliceFunction(v.name)
			end
		end
	else
		ESX.ShowNotification("Software blev beskadiget, enheden er ødelagt.")
		for k,v in pairs(Banks) do
			if GetDistanceBetweenCoords(coords, v.keypads[1].pos[1], v.keypads[1].pos[2], v.keypads[1].pos[3], true) < 1.5 then
				TriggerServerEvent('t1ger_bankrobbery:inUseSV', false)
				TriggerServerEvent('t1ger_bankrobbery:KeypadStateSV', "first", k, false)
				Citizen.Wait(500) 
				NotifyPoliceFunction(v.name)
			end	
		end
	end
	keyPressed = false
	ClearPedTasks(player)
	FreezeEntityPosition(player, false)
end

-- First Door Hacking // FINGER PRINT
function HackKeyPad2(k,v)
    local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player,true)
	if v.keypads[2] ~= nil then
		if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.keypads[2].pos[1], v.keypads[2].pos[2], v.keypads[2].pos[3],true) <= 1.0 then
			SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"),true)
			Citizen.Wait(200)
			FreezeEntityPosition(player, true)
			TaskStartScenarioInPlace(player, 'WORLD_HUMAN_STAND_MOBILE', -1, true)
			Citizen.Wait(2000)
			if Config.utkFingerPrint then
				TriggerEvent("utk_fingerprint:Start", 3, 3, 2, FingerPrintCallback)
			else
				-- Add your own minigame here and make a callback to FingerPrintCallback function.
			end
		end
	end
end

-- CALLBACK FOR SECOND DOOR HACKING:
function FingerPrintCallback(outcome,reason)
	local player = GetPlayerPed(-1)
	local coords = GetEntityCoords(player)
	local reason = "TEST TEST TEST"
	if outcome == true then -- reason will be nil if outcome is true
		if math.random(1,100) <= Config.ChanceHackerDeviceBack then
			ShowNotifyESX(Lang['hacker_dev_corrupted'])
		else
			local item = Config.HackItem
			TriggerServerEvent('t1ger_bankrobbery:giveItem',item)
		end
		for k,v in pairs(Banks) do	
			if GetDistanceBetweenCoords(coords, v.keypads[2].pos[1], v.keypads[2].pos[2], v.keypads[2].pos[3], true) < 1.5 then
				TriggerServerEvent('t1ger_bankrobbery:KeypadStateSV', "second", k, true)
				Citizen.Wait(500)
			end
		end
	elseif outcome == false then
		ESX.ShowNotification("Software blev beskadiget, enheden er ødelagt.")
		for k,v in pairs(Banks) do
			if GetDistanceBetweenCoords(coords, v.keypads[2].pos[1], v.keypads[2].pos[2], v.keypads[2].pos[3], true) < 1.5 then
				TriggerServerEvent('t1ger_bankrobbery:KeypadStateSV', "second", k, false)
				Citizen.Wait(500)
			end	
		end
    end
	keyPressed = false
	ClearPedTasks(player)
	FreezeEntityPosition(player, false)
end

-- Manage vault & doors thread:
Citizen.CreateThread(function()
	local PaletoDoor = false
    while true do
        Citizen.Wait(1)
        local player = GetPlayerPed(-1)
        local coords = GetEntityCoords(player,true)
        for k,v in pairs(Banks) do
			v.vault.pos[1] = v.vault.pos[1]
			v.vault.pos[2] = v.vault.pos[2]
			v.vault.pos[3] = v.vault.pos[3]
			if GetDistanceBetweenCoords(GetEntityCoords(player), -105.9, 6472.11, 31.9) > 50.0 then
				PaletoDoor = false
			end
			if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.vault.pos[1], v.vault.pos[2], v.vault.pos[3], true) <= 50.0 then
				vaultDoor = GetClosestObjectOfType(coords.x, coords.y, coords.z, 50.0, v.vault.model, false, false, false)
				if vaultDoor ~= nil and vaultDoor ~= 0 then
					if k == 7 and not PaletoDoor then
						SetEntityHeading(vaultDoor, 45.0)
						PaletoDoor = true
					end
					FreezeEntityPosition(vaultDoor, true)
					if v.inUse and ((k ~= 8 and v.keypads[1].hacked) or (k == 8 and v.keypads[2].hacked and v.keypads[1].hacked)) then
						if Vdist(coords.x, coords.y, coords.z, v.vault.pos[1], v.vault.pos[2], v.vault.pos[3]) <= 1.0 then
							local vaultHeading = GetEntityHeading(vaultDoor)
							if not keyPressed then
								if vaultHeading > v.vault.oHeadMin and vaultHeading < v.vault.oHeadMax then
									DrawText3Ds(v.vault.pos[1], v.vault.pos[2], v.vault.pos[3], Lang['close_vault_dr'])
								elseif vaultHeading > v.vault.cHeadMin and vaultHeading < v.vault.cHeadMax then
									if isCop then
										if k ~= 8 then
											DrawText3Ds(v.vault.pos[1], v.vault.pos[2], v.vault.pos[3], Lang['open_vault_dr_pol'])
										else
											DrawText3Ds(v.vault.pos[1], v.vault.pos[2], v.vault.pos[3], Lang['open_vault_dr'])
										end
									else
										DrawText3Ds(v.vault.pos[1], v.vault.pos[2], v.vault.pos[3], Lang['open_vault_dr'])
									end	
								end
							end
							if IsControlJustPressed(0,Config.KeyOpenVaultDoor) and vaultHeading > v.vault.cHeadMin and vaultHeading < v.vault.cHeadMax then 
								Citizen.Wait(0)
								if k == 7 then
									TriggerServerEvent('t1ger_bankrobbery:CloseVaultDoorSV', k,v,vaultHeading,280)
								else
									if k == 8 then
										TriggerServerEvent('t1ger_bankrobbery:OpenVaultDoorSV', k,v,vaultHeading,320)
									else
										TriggerServerEvent('t1ger_bankrobbery:OpenVaultDoorSV', k,v,vaultHeading,280)	
									end	
								end
							end
							if IsControlJustPressed(0,Config.KeyCloseVaultDoor) and vaultHeading > v.vault.oHeadMin and vaultHeading < v.vault.oHeadMax then 
								Citizen.Wait(0)
								if k == 7 then
									TriggerServerEvent('t1ger_bankrobbery:OpenVaultDoorSV', k,v,vaultHeading,280)
								else
									if k == 8 then
										TriggerServerEvent('t1ger_bankrobbery:CloseVaultDoorSV', k,v,vaultHeading,320)
									else
										TriggerServerEvent('t1ger_bankrobbery:CloseVaultDoorSV', k,v,vaultHeading,280)	
									end	
								end
							end
							if isCop then
								if IsControlJustPressed(0,Config.KeySecureVaultDoor) and not keyPressed then 
									if k ~= 8 then
										if vaultHeading > v.vault.cHeadMin and vaultHeading < v.vault.cHeadMax then
											if k == 7 then
												keyPressed = true
												RestoreBank(k,v)
											elseif k ~= 8 then
												keyPressed = true
												RestoreBank(k,v)												
											end
										else
											ShowNotifyESX(Lang['vault_dr_must_close'])
										end
									end
								end
							end
						end
					end	
					if v.inUse and k == 8 and (v.keypads[1].hacked or v.keypads[2].hacked) then
						if k == 8 then
							if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.keypads[1].pos[1], v.keypads[1].pos[2], v.keypads[1].pos[3], false) <= 1.5 and not keyPressed then
								if isCop then
									DrawText3Ds(v.keypads[1].pos[1], v.keypads[1].pos[2], v.keypads[1].pos[3], Lang['secure_vault_dr'])
									if IsControlJustPressed(0,Config.KeySecureVaultDoor) and not keyPressed then
										if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.vault.pos[1], v.vault.pos[2], v.vault.pos[3], true) <= 50.0 then
											local vaultHeading = GetEntityHeading(vaultDoor)
											if vaultHeading > v.vault.cHeadMin and vaultHeading < v.vault.cHeadMax then
												keyPressed = true
												RestoreBank(k,v)
											else
												ShowNotifyESX(Lang['vault_dr_must_close'])
											end
										end
									end
								end	
							end
						end
					end
				end
			end
        end
    end
end)

-- Drill Thread:
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local player = GetPlayerPed(-1)
        local coords = GetEntityCoords(player,true)
        for k,v in pairs(Safes) do
            if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.pos[1], v.pos[2], v.pos[3], true) <= 1.0 then
				if not v.robbed then
					if not v.failed then
						DrawText3Ds(v.pos[1], v.pos[2], v.pos[3], Lang['safe_not_drilled'])
					else
						DrawText3Ds(v.pos[1], v.pos[2], v.pos[3], Lang['safe_destroyed'])
					end
					if IsControlJustPressed(2,Config.DrillStopKey) then
						TriggerEvent("Drilling:Stop")
					end
				else
					DrawText3Ds(v.pos[1], v.pos[2], v.pos[3], Lang['safe_drilled'])
				end
			end
		end
    end
end)

-- Event to drill safe:
RegisterNetEvent('t1ger_bankrobbery:drillCloseSafe')
AddEventHandler('t1ger_bankrobbery:drillCloseSafe', function(item)
	local player    = GetPlayerPed(-1)
	local coords    = GetEntityCoords(player,true)
	local drilling  = false
	local drillSound
	local attachedDrill
	local effect
	for k,v in pairs(Safes) do
		if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.pos[1], v.pos[2], v.pos[3], false) <= 1.0 then
			if not v.failed then
				if not v.robbed then
					local animDict = "anim@heists@fleeca_bank@drilling"
					local animLib = "drill_straight_idle"	
					
					local closestPlayer, dist = ESX.Game.GetClosestPlayer()
					if closestPlayer ~= -1 and dist <= 1.0 then
						if IsEntityPlayingAnim(GetPlayerPed(closestPlayer), animDict, animLib, 3) then
                            return ShowNotifyESX(Lang['safe_drilled_by_ply'])
						end
					end
					
					drilling = true
					FreezeEntityPosition(player, true)
					SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"),true)
					Citizen.Wait(100)
					
					RequestAnimDict(animDict)
					while not HasAnimDictLoaded(animDict) do
						Citizen.Wait(50)
					end
					
					local drillProp = GetHashKey('hei_prop_heist_drill')
					local boneIndex = GetPedBoneIndex(player, 28422)
					
					RequestModel(drillProp)
					while not HasModelLoaded(drillProp) do
						Citizen.Wait(100)
					end
					
					SetEntityCoords(player, v.AnimPos[1], v.AnimPos[2], v.AnimPos[3]-0.95)
					SetEntityHeading(player, v.AnimHeading)
					TaskPlayAnimAdvanced(player, animDict, animLib, v.AnimPos[1], v.AnimPos[2], v.AnimPos[3], 0.0, 0.0, v.AnimHeading, 1.0, -1.0, -1, 2, 0, 0, 0 )
					
					attachedDrill = CreateObject(drillProp, 1.0, 1.0, 1.0, 1, 1, 0)
					AttachEntityToEntity(attachedDrill, player, boneIndex, 0.0, 0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
					
					SetEntityAsMissionEntity(attachedDrill, true, true)
						
					RequestAmbientAudioBank("DLC_HEIST_FLEECA_SOUNDSET", 0)
					RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL", 0)
					RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL_2", 0)
					drillSound = GetSoundId()
					Citizen.Wait(100)
					PlaySoundFromEntity(drillSound, "Drill", attachedDrill, "DLC_HEIST_FLEECA_SOUNDSET", 1, 0)
					Citizen.Wait(100)	
					
					local particleDictionary = "scr_fbi5a"
					local particleName = "scr_bio_grille_cutting"

					RequestNamedPtfxAsset(particleDictionary)
					while not HasNamedPtfxAssetLoaded(particleDictionary) do
						Citizen.Wait(0)
					end

					SetPtfxAssetNextCall(particleDictionary)
					effect = StartParticleFxLoopedOnEntity(particleName, attachedDrill, 0.0, -0.6, 0.0, 0.0, 0.0, 0.0, 2.0, 0, 0, 0)
					ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 1.0)
					Citizen.Wait(100)
							
					ESX.TriggerServerCallback('t1ger_bankrobbery:removeItem', function(itemRemoved)
						if itemRemoved then
							TriggerEvent("Drilling:Start",function(drillStatus)
								
								if (drillStatus == 1) then
									Safes[k].robbed = true
									TriggerServerEvent("t1ger_bankrobbery:SafeDataSV", "robbed", k, true)
									TriggerServerEvent('t1ger_bankrobbery:safeReward')
								elseif (drillStatus == 3) then
									ShowNotifyESX(Lang['drilling_paused'])
									local item = Config.DrillItem
									TriggerServerEvent('t1ger_bankrobbery:giveItem',item)
								elseif (drillStatus == 2) then
									Safes[k].failed = true
									TriggerServerEvent("t1ger_bankrobbery:SafeDataSV", "failed", k, true)
                                    ShowNotifyESX(Lang['you_destroyed_safe'])
								end
								
								drilling = false
								ClearPedTasksImmediately(player)
								StopSound(drillSound)
								ReleaseSoundId(drillSound)
								DeleteObject(attachedDrill)
								DeleteEntity(attachedDrill)
								FreezeEntityPosition(player, false)
								StopParticleFxLooped(effect, 0)
								StopGameplayCamShaking(true)
							end)
						end
					end, item)
				else
                    ShowNotifyESX(Lang['safe_arealdy_robbed'])
				end
            else
                ShowNotifyESX(Lang['safe_destroyed_noti'])
			end
		end
	end
end)
