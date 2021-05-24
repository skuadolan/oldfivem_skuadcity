local playersProcessingCocaLeaf = {}

RegisterServerEvent('esx_illegal:pickedUpCocaLeaf')
AddEventHandler('esx_illegal:pickedUpCocaLeaf', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('micin')

	if xItem.limit ~= -1 and (xItem.count + 1) > xItem.limit then
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Inventory Full'})
		--TriggerClientEvent('esx:showNotification', _source, _U('coca_leaf_inventoryfull'))
	else
		xPlayer.addInventoryItem(xItem.name, 1)
	end
end)

RegisterServerEvent('esx_illegal:processCocaLeaf')
AddEventHandler('esx_illegal:processCocaLeaf', function()
	if not playersProcessingCocaLeaf[source] then
		local _source = source

		playersProcessingCocaLeaf[_source] = ESX.SetTimeout(Config.Delays.CokeProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCocaLeaf, xCoke = xPlayer.getInventoryItem('micin'), xPlayer.getInventoryItem('pmicin')

			if xCoke.limit ~= -1 and (xCoke.count + 1) > xCoke.limit then
				TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Inventory Full'})
				--TriggerClientEvent('esx:showNotification', _source, _U('coke_processingfull'))
			elseif xCocaLeaf.count < 3 then
				TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Micin Kurang'})
				--TriggerClientEvent('esx:showNotification', _source, _U('coke_processingenough'))
			else
				xPlayer.removeInventoryItem('micin', 3)
				xPlayer.addInventoryItem('pmicin', 1)

				TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Memproses Micin'})
				--TriggerClientEvent('esx:showNotification', _source, _U('coke_processed'))
			end

			playersProcessingCocaLeaf[_source] = nil
		end)
	else
		print(('esx_illegal: %s attempted to exploit coke processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingCocaLeaf[playerID] then
		ESX.ClearTimeout(playersProcessingCocaLeaf[playerID])
		playersProcessingCocaLeaf[playerID] = nil
	end
end

RegisterServerEvent('esx_illegal:cancelProcessing')
AddEventHandler('esx_illegal:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('esx:playerDropped', function(playerID, reason)
	CancelProcessing(playerID)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	CancelProcessing(source)
end)