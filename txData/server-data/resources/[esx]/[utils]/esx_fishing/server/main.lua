ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx_fishing:caughtFish')
AddEventHandler('esx_fishing:caughtFish', function(getFish)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(getFish, 1)
end)

ESX.RegisterUsableItem('bait', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local baitquantity = xPlayer.getInventoryItem('fishingrod').count
	if baitquantity > 0 then
		TriggerClientEvent('esx_fishing:startFishing', source, 'bait')
	else 
		TriggerClientEvent('esx:showNotification', source, "Anda tidak memiliki pancingan.")
	end
end)

ESX.RegisterUsableItem('fishbait', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local baitquantity = xPlayer.getInventoryItem('fishingrod').count
	if baitquantity > 0 then
		TriggerClientEvent('esx_fishing:startFishing', source, 'fishbait')
	else 
		TriggerClientEvent('esx:showNotification', source, "Anda tidak memiliki pancingan.")
	end
end)


RegisterServerEvent('esx_fishing:removeInventoryItem')
AddEventHandler('esx_fishing:removeInventoryItem', function(item, quantity)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, quantity)
end)
