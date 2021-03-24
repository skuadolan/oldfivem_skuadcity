local playersProcessingCannabis = {}

RegisterServerEvent('esx_illegal:pickedUpCannabis')
AddEventHandler('esx_illegal:pickedUpCannabis', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('mushroom')

	if xItem.limit ~= -1 and (xItem.count + 1) > xItem.limit then
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Inventory Full'})
		--TriggerClientEvent('esx:showNotification', _source, _U('weed_inventoryfull'))
	else
		xPlayer.addInventoryItem(xItem.name, 1)
	end
end)

RegisterServerEvent('esx_illegal:processCannabis')
AddEventHandler('esx_illegal:processCannabis', function()
	if not playersProcessingCannabis[source] then
		local _source = source

		playersProcessingCannabis[_source] = ESX.SetTimeout(Config.Delays.WeedProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCannabis, xMarijuana = xPlayer.getInventoryItem('mushroom'), xPlayer.getInventoryItem('pmushroom')

			if xMarijuana.limit ~= -1 and (xMarijuana.count + 1) > xMarijuana.limit then
				TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Inventory Full'})
				--TriggerClientEvent('esx:showNotification', _source, _U('weed_processingfull'))
			elseif xCannabis.count < 1 then
				TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Mushroom Kurang'})
				--TriggerClientEvent('esx:showNotification', _source, _U('weed_processingenough'))
			else
				xPlayer.removeInventoryItem('mushroom', 1)
				xPlayer.addInventoryItem('pmushroom', 1)

				TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Memproses Mushroom'})
				--TriggerClientEvent('esx:showNotification', _source, _U('weed_processed'))
			end

			playersProcessingCannabis[_source] = nil
		end)
	else
		print(('esx_illegal: %s attempted to exploit weed processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingCannabis[playerID] then
		ESX.ClearTimeout(playersProcessingCannabis[playerID])
		playersProcessingCannabis[playerID] = nil
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