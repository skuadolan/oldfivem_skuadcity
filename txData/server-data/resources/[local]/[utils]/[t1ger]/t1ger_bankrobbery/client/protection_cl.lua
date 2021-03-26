-------------------------------------

------- Created by T1GER#9080 -------

------------------------------------- 

	-- Load Script:

	Citizen.CreateThread(function()
		TriggerServerEvent('t1ger_bankrobbery:loadDataSV')
	end)



	RegisterNetEvent('t1ger_bankrobbery:loadDataCL')
	AddEventHandler('t1ger_bankrobbery:loadDataCL', function(BankData, SafesData)
		Banks 	= BankData
		Safes 	= SafesData
	end)



	RegisterNetEvent('t1ger_bankrobbery:getPoliceCount')
	AddEventHandler('t1ger_bankrobbery:getPoliceCount', function(policeData)
		Police = policeData
	end)



	-- inUse state:

	RegisterNetEvent('t1ger_bankrobbery:inUseCL')
	AddEventHandler('t1ger_bankrobbery:inUseCL', function(state)
		for i = 1, #Banks do
			Banks[i].inUse = state
		end
	end)



	-- Keypad state:

	RegisterNetEvent('t1ger_bankrobbery:KeypadStateCL')
	AddEventHandler('t1ger_bankrobbery:KeypadStateCL', function(id, state, type)
		if id ~= nil or state ~= nil then  
			if type == "first" then
				Banks[id].keypads[1].hacked = state
			elseif type == "second" then
				Banks[id].keypads[2].hacked = state
			end	
		end
	end)



	-- Safe state:

	RegisterNetEvent('t1ger_bankrobbery:SafeDataCL')
	AddEventHandler('t1ger_bankrobbery:SafeDataCL', function(type, id, state)
		if id ~= nil or state ~= nil then  
			if type == "robbed" then
				Safes[id].robbed = state
			elseif type == "failed" then	
				Safes[id].failed = state
			end
		end
	end)



	-- Door open event:

	RegisterNetEvent('t1ger_bankrobbery:OpenVaultDoorCL')
	AddEventHandler('t1ger_bankrobbery:OpenVaultDoorCL', function(k,v,DoorHeading,amount)
		local PlayerPos = GetEntityCoords(PlayerPedId(), true)
		if (GetDistanceBetweenCoords(PlayerPos, v.vault.pos[1], v.vault.pos[2], v.vault.pos[3], true) < 100) then
			for i=1,amount do
				Citizen.Wait(10)
				SetEntityHeading(vaultDoor, round(DoorHeading, 1) - 0.4)
				DoorHeading = GetEntityHeading(vaultDoor)
			end
		end
	end)



	-- Door close event:

	RegisterNetEvent('t1ger_bankrobbery:CloseVaultDoorCL')
	AddEventHandler('t1ger_bankrobbery:CloseVaultDoorCL', function(k,v,DoorHeading,amount)
	local PlayerPos = GetEntityCoords(PlayerPedId(), true)
		if (GetDistanceBetweenCoords(PlayerPos, v.vault.pos[1], v.vault.pos[2], v.vault.pos[3], true) < 100) then
			for i=1,amount do
				Citizen.Wait(10)
				SetEntityHeading(vaultDoor, round(DoorHeading, 1 ) + 0.4)
				DoorHeading = GetEntityHeading(vaultDoor)
			end
		end
	end)



	-- Restore Bank:

	RegisterNetEvent('t1ger_bankrobbery:ResetCurrentBankCL')
	AddEventHandler('t1ger_bankrobbery:ResetCurrentBankCL', function()
		-- Banks:

		for i = 1, #Banks do
			Banks[i].inUse = false
			Banks[i].keypads[1].hacked = false
			Banks[i].keypads[2].hacked = false
		end

		-- Safes:

		for i = 1, #Safes do
			Safes[i].robbed = false
			Safes[i].failed = false
		end
	end)

	

	function RestoreBank(k,v)
		TriggerServerEvent('t1ger_bankrobbery:ResetCurrentBankSV')
		Citizen.Wait(1000)
		ShowNotifyESX(Lang['you_secured_bank'])
		keyPressed = false
	end