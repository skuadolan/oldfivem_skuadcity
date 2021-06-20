ESX             = nil
local status = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getStatusStarterpack(playerId, data)
	local Identifier = ESX.GetPlayerFromId(playerId).identifier

	MySQL.Async.fetchAll("SELECT starterpack FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		data(result[1].starterpack)

	end)
end

function updateStatusStarterpack(source)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier

	MySQL.Async.execute(
       "UPDATE users SET starterpack = @newStatus WHERE identifier = @identifier",
        {
			['@identifier'] = Identifier,
			['@newStatus'] = 1
		}
	)
end

ESX.RegisterServerCallback('skd_utils:getStatusUser', function(source, cb, status)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	getStatusStarterpack(_source, function(starterpack)
		if starterpack == 0 then
			status = true
			cb(status)
		else
			status = false
			cb(status)
			xPlayer.showNotification(_U('has_starterpack'))
		end
	end) 

	
end)
	

ESX.RegisterServerCallback('skd_utils:getStarterpack', function(source, cb, model, plate)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if xPlayer.getMoney() then
		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
			['@owner']   = xPlayer.identifier,
			['@plate']   = plate,
			['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate})
		}, function(rowsChanged)
			xPlayer.showNotification(_U('got_vehicle'))
			cb(true)
		end)
		xPlayer.addAccountMoney(Config.Zones.Starterpack.TypeReward, Conifg.Zones.Starterpack.NominalReward)
		xPlayer.showNotification(_U('congrats'))
		xPlayer.showNotification(_U('got_money')..Conifg.Zones.Starterpack.NominalReward)
		updateStatusStarterpack(source)
	else
		cb(false)
	end
end)

RegisterServerEvent('skd_utils:main')
AddEventHandler('skd_utils:main', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	-- can the player afford this item?
	if xPlayer.getMoney() then
		-- can the player carry the said amount of x item?
		getStatusStarterpack(_source, function(starterpack)
			if starterpack == 0 then
				status = true
			else
				xPlayer.showNotification(_U('has_starterpack'))
			end
		end) 
	end
end)



function getTheWinnerTreasure(data)

	MySQL.Async.fetchAll("SELECT theWinner FROM data_treasure", {}, function(result)

		data(result[1].theWinner)

	end)
end

function getStatusTreasure(data)

	MySQL.Async.fetchAll("SELECT status_treasure FROM data_treasure", {}, function(result)

		data(result[1].status_treasure)

	end)
end

function getStatusTheWinnerLastname(data)

	MySQL.Async.fetchAll("SELECT lastname FROM users WHERE treasure = @status", { ["@status"] = 1 }, function(result)

		data(result[1].lastname)

	end)
end

function getStatusTheWinnerFirstname(data)

	MySQL.Async.fetchAll("SELECT firstname FROM users WHERE treasure = @status", { ["@status"] = 1 }, function(result)

		data(result[1].firstname)

	end)
end

function updateTreasure(source)
	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local theWinner = nil

	getStatusTheWinnerFirstname(function(firstname)
		getStatusTheWinnerLastname(function(lastname)
			theWinner = firstname..' '..lastname

			MySQL.Async.execute(
			"UPDATE data_treasure SET status_treasure = @newStatus, theWinner = @theWinner",
				{
					['@newStatus'] = 1,
					['@theWinner'] = theWinner
				}
			)
		end)
	end)
end

function updateStatusTreasure(source)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier

	MySQL.Async.execute(
       "UPDATE users SET treasure = @newStatus WHERE identifier = @identifier",
        {
			['@identifier'] = Identifier,
			['@newStatus'] = 1
		}
	)
end

ESX.RegisterServerCallback('skd_utils:getStatusTreasure', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	getStatusTreasure(function(statusTreasure)
		if statusTreasure == 0  then
			status = true
			cb(status)
		else
			status = false
			cb(status)
			getTheWinnerTreasure(function(theWinner)
				xPlayer.showNotification(_U('thewinner')..theWinner)
			end)
		end
	end)
end)

ESX.RegisterServerCallback('skd_utils:getTreasure', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if xPlayer.getMoney() then
		xPlayer.addAccountMoney(Config.Zones.Treasure.TypeReward, Config.Zones.Treasure.NominalReward)
		xPlayer.showNotification(_U('congrats_treasuure'))
		xPlayer.showNotification(_U('got_moneytreasure')..Config.Zones.Treasure.NominalReward)
		cb(true)
		updateStatusTreasure(source)
		updateTreasure(source)
	else
		cb(false)
	end
end)