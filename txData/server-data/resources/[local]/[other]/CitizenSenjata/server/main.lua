ESX = nil
local Items = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function()

	MySQL.Async.fetchAll('SELECT * FROM weashops', {}, function(result)
		for i=1, #result, 1 do
			if Items[result[i].zone] == nil then
				Items[result[i].zone] = {}
			end

			table.insert(Items[result[i].zone], {
				item  = result[i].item,
				price = result[i].price,
				label = ESX.GetWeaponLabel(result[i].item)
			})
		end

		TriggerClientEvent('scr-blackmarket:sendShop', -1, Items)
	end)

end)

ESX.RegisterServerCallback('scr-blackmarket:CheckJob', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local Playerjob = xPlayer.getJob()
	local Jobfound = false
	for k,job in pairs(Config.AllowedJobs) do
		if job.name == Playerjob.name then
			if job.grade == xPlayer.job.grade then
				Jobfound = true
			end
		end
	end
	if Jobfound == true then
		cb(true)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Anda Tidak Berwenang'})
		cb(false)
	end
end)

ESX.RegisterServerCallback('scr-blackmarket:getShop', function(source, cb)
	cb(Items)
end)

ESX.RegisterServerCallback('scr-blackmarket:buyWeapon', function(source, cb, weaponName, zone)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = GetPrice(weaponName, zone)

	if price == 0 then
		print(('scr-blackmarket: %s attempted to buy a unknown weapon!'):format(xPlayer.identifier))
		cb(false)
	else
		if xPlayer.hasWeapon(weaponName) then
			cb(false)
		else
			if zone == 'BlackWeashop' then
				if xPlayer.getAccount('black_money').money >= price then
					xPlayer.removeAccountMoney('black_money', price)
					xPlayer.addWeapon(weaponName, 42)
	
					cb(true)
				else
					cb(false)
				end
			else
				if xPlayer.getMoney() >= price then
					xPlayer.removeMoney(price)
					xPlayer.addWeapon(weaponName, 42)
	
					cb(true)
				else
					cb(false)
				end
			end
		end
	end
end)

function GetPrice(weaponName, zone)
	local price = MySQL.Sync.fetchScalar('SELECT price FROM weashops WHERE zone = @zone AND item = @item', {
		['@zone'] = zone,
		['@item'] = weaponName
	})

	if price then
		return price
	else
		return 0
	end
end
