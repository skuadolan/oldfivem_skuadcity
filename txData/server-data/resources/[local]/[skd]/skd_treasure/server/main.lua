ESX             = nil
local status = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

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

ESX.RegisterServerCallback('skd_treasure:getStatusTreasure', function(source, cb)
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

ESX.RegisterServerCallback('skd_treasure:getTreasure', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if xPlayer.getMoney() then
		xPlayer.addAccountMoney(Config.TypeMoney, Config.TreasureNominal)
		xPlayer.showNotification(_U('congrats_treasuure'))
		xPlayer.showNotification(_U('got_moneytreasure')..Config.TreasureNominal)
		cb(true)
		updateStatusTreasure(source)
		updateTreasure(source)
	else
		cb(false)
	end
end)