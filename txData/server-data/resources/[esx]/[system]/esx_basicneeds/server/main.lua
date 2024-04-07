ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success', _U('used_bread'))
	--xPlayer.showNotification(_U('used_bread'))
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success', _U('used_water'))
	--xPlayer.showNotification(_U('used_water'))
end)

ESX.RegisterCommand('heal', 'admin', function(xPlayer, args, showError)
	args.playerId.triggerEvent('esx_basicneeds:healPlayer')
	TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success', 'You have been healed')
	-- args.playerId.showNotification('You have been healed.')
end, true, {
	help = 'Heal a player, or yourself - restores thirst, hunger and health.',
	validate = true,
	arguments = {
		{ name = 'playerId', help = 'the player id', type = 'player' }
	}
})

AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
	if GetInvokingResource() ~= "monitor" or type(eventData) ~= "table" or type(eventData.id) ~= "number" then
		return
	end

	TriggerClientEvent('esx_basicneeds:healPlayer', eventData.id)
end)
