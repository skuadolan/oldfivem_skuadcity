ESX = nil
local police = 'https://discord.com/api/webhooks/831335476329054229/JF6wHaJn0-FWYhSW3ZOxKOnXot4psDsJtFVaqnE-hytJgGn1KnIDHKRsWfCwIRUqOmNZ'
local communityName = '#SKUAD CITY ROLEPLAY'
local communityLogo = 'https://dianadi021.github.io/assets/content/icon/skdc.png'

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_illegal:sellDrug')
AddEventHandler('esx_illegal:sellDrug', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.DrugDealerItems[itemName]
	local xItem = xPlayer.getInventoryItem(itemName)

	if not price then
		print(('esx_illegal: %s attempted to sell an invalid drug!'):format(xPlayer.identifier))
		return
	end

	if xItem.count < amount then
		TriggerClientEvent('esx:showNotification', source, _U('dealer_notenough'))
		return
	end

	price = ESX.Math.Round(price * amount)

	if Config.GiveBlack then
		xPlayer.addAccountMoney('black_money', price)
	else
		xPlayer.addMoney(price)
	end

	xPlayer.removeInventoryItem(xItem.name, amount)

	TriggerClientEvent('esx:showNotification', source, _U('dealer_sold', amount, xItem.label, ESX.Math.GroupDigits(price)))
end)

ESX.RegisterServerCallback('esx_illegal:buyLicense', function(source, cb, licenseName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local license = Config.LicensePrices[licenseName]

	if license == nil then
		print(('esx_illegal: %s attempted to buy an invalid license!'):format(xPlayer.identifier))
		cb(false)
	end

	if xPlayer.getMoney() >= license.price then
		xPlayer.removeMoney(license.price)

		TriggerEvent('esx_license:addLicense', source, licenseName, function()
			cb(true)
		end)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_illegal:canPickUp', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem(item)

	if xItem.limit ~= -1 and xItem.count >= xItem.limit then
		cb(false)
	else
		cb(true)
	end
end)

ESX.RegisterServerCallback('esx_illegal:CheckLisense', function(source, cb, itemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xLisence = xPlayer.getInventoryItem(itemName)

	if xLisence.count == 1 then
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_illegal:getManyPolice', function(source, cb)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	local connect = {
		{
			["color"] = "8663711",
			["title"] = "Laporan Tindakan Illegal Di Kota!",
			["description"] = "Telah terjadi tindakan illegal yang dilakukan oleh sejumlah warga dikota. Diharapkan untuk kepada seluruh anggota kepolisian untuk mengamankan kota. Terimakasih!",
			["footer"] = {
				["text"] = communityName,
				["icon_url"] = communityLogo,
			},
		}
	}

	local cops = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			cops = cops + 1
		end
	end

	if cops >= Config.PoliceLimit then
		cb(true)
	else
		cb(false)
		PerformHttpRequest(police, function(err, text, headers) end, 'POST', json.encode({username = "Logs Tindakan Illegal", embeds = connect}), { ["Content-Type"] = 'application/json' })
	end
end)