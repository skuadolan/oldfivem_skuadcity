RegisterServerEvent('esx_barbershop:pay')
AddEventHandler('esx_barbershop:pay', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeMoney(Config.Price)
	TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success', _U('you_paid', ESX.Math.GroupDigits(Config.Price)))
	--TriggerClientEvent('esx:showNotification', source, _U('you_paid', ESX.Math.GroupDigits(Config.Price)))
end)

ESX.RegisterServerCallback('esx_barbershop:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb(xPlayer.getMoney() >= Config.Price)
end)
