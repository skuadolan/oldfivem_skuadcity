AddEventHandler('esx:playerLoaded', function(source)
			TriggerClientEvent('t1ger_bankrobbery:loadDataCL', source, Banks, Safes)
		end)

		

		RegisterServerEvent('t1ger_bankrobbery:loadDataSV')
		AddEventHandler('t1ger_bankrobbery:loadDataSV', function()
			TriggerClientEvent('t1ger_bankrobbery:loadDataCL', -1, Banks, Safes)
		end)

		

		-- inUse state:

		RegisterServerEvent('t1ger_bankrobbery:inUseSV')
		AddEventHandler('t1ger_bankrobbery:inUseSV', function(state)
			for i = 1, #Banks do
				Banks[i].InProgress = state
			end
			TriggerClientEvent('t1ger_bankrobbery:inUseCL', -1, state)
		end)

		

		RegisterServerEvent('t1ger_bankrobbery:KeypadStateSV')
		AddEventHandler('t1ger_bankrobbery:KeypadStateSV', function(type, id, state)
			local xPlayer = ESX.GetPlayerFromId(source)
			if type == "first" then
				Banks[id].keypads[1].hacked = state
			elseif type == "second" then
				Banks[id].keypads[2].hacked = state
			end	
			TriggerClientEvent('t1ger_bankrobbery:KeypadStateCL', -1, id, state, type)
		end)

		

		RegisterServerEvent('t1ger_bankrobbery:SafeDataSV')
		AddEventHandler('t1ger_bankrobbery:SafeDataSV', function(type, id, state)
			local xPlayer = ESX.GetPlayerFromId(source)
			if type == "robbed" then
				Safes[id].robbed = state
			elseif type == "failed" then
				Safes[id].failed = state
			end
			Wait(100)
			TriggerClientEvent('t1ger_bankrobbery:SafeDataCL', -1, type, id, state)
		end)



		RegisterServerEvent('t1ger_bankrobbery:OpenVaultDoorSV')
		AddEventHandler('t1ger_bankrobbery:OpenVaultDoorSV', function(k,v,heading,amount)
			local xPlayer = ESX.GetPlayerFromId(source)
			TriggerClientEvent('t1ger_bankrobbery:OpenVaultDoorCL', -1, k,v,heading,amount)
		end)



		RegisterServerEvent('t1ger_bankrobbery:CloseVaultDoorSV')
		AddEventHandler('t1ger_bankrobbery:CloseVaultDoorSV', function(k,v,heading,amount)
			local xPlayer = ESX.GetPlayerFromId(source)
			TriggerClientEvent('t1ger_bankrobbery:CloseVaultDoorCL', -1, k,v,heading,amount)
		end)
		getPoliceCount()