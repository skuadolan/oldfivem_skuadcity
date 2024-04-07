ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_plasticsurgery:pay')
AddEventHandler('esx_plasticsurgery:pay', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeMoney(Config.Price)
	TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('you_paid', ESX.Math.GroupDigits(Config.Price)))
	--TriggerClientEvent('esx:showNotification', source, _U('you_paid', ESX.Math.GroupDigits(Config.Price)))
end)

ESX.RegisterServerCallback('esx_plasticsurgery:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb(xPlayer.get('money') >= Config.Price)
end)
