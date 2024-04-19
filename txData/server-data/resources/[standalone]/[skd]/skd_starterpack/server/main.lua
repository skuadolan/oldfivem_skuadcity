ESX.RegisterServerCallback('skd_starterpack:canGetGiveaway', function(source, cb)
	getStatusStarterpack(source, cb)
end)

ESX.RegisterServerCallback('skd_starterpack:getVehicle', function(source, cb, model, plate)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (?, ?, ?)',
		{ xPlayer.identifier, plate, json.encode({ model = GetHashKey(model), plate = plate })
		}, function(rowsChanged)
		TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success', _U('vehicle_belongs', plate))
		--xPlayer.showNotification(_U('vehicle_belongs', plate))
		cb(true)
	end)
end)

AddEventHandler('skd_starterpack:canGetGiveaway', function(source, cb)
	getStatusStarterpack(source, cb)
end)

function getStatusStarterpack(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.scalar('SELECT starterpack FROM users WHERE identifier = ?', { xPlayer.identifier },
		function(result)
			if result == 0 then
				cb(true)
			else
				cb(false)
			end
		end)
end

RegisterNetEvent('skd_starterpack:setGiveawayStatus')
AddEventHandler('skd_starterpack:setGiveawayStatus', function(isGetGiveaway)
	local xPlayer = ESX.GetPlayerFromId(source)

	if isGetGiveaway then
		MySQL.Sync.execute('UPDATE users SET starterpack = @isDoneGetGiveaway WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier,
			['@isDoneGetGiveaway'] = 1
		})
	end
end)

RegisterNetEvent('skd_starterpack:getGiveaway')
AddEventHandler('skd_starterpack:getGiveaway', function(choices, kritikSaran)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerName = GetRealPlayerName(_source)
	local embed = {
		{
			["color"] = 65535, --https://convertingcolors.com/
			["title"] = "**" .. playerName .. "**",
			["description"] = kritikSaran,
			["footer"] = {
				["text"] = '#skuadcity',
			},
		}
	}
	TriggerEvent('skd_DC:postToDCWithEmbed', embed, 'QnA')
	if choices then
		xPlayer.addAccountMoney('bank', Config.getMoney)
	else
		xPlayer.addAccountMoney('bank', Config.carMoney)
	end
end)

function GetRealPlayerName(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if Config.EnableESXIdentity then
			if Config.OnlyFirstname then
				return xPlayer.get('firstName')
			else
				return xPlayer.getName()
			end
		else
			return xPlayer.getName()
		end
	else
		return GetPlayerName(playerId)
	end
end
