ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local RobbedBanks = {}

RegisterServerEvent('genesis-holdUp:robBigBank')
AddEventHandler('genesis-holdUp:robBigBank', function(bankName)
	if not CheckRobbed(bankName) then
		if CountPolice() >= Config.CopsToRob then
			NotifLSPD()
			table.insert(RobbedBanks, bankName)
			TriggerClientEvent('genesis-holdUp:startRobbing', source, bankName)
		else
			TriggerClientEvent('esx:showNotification', source, _U('error_notmanycops'))
		end
	else
		TriggerClientEvent('esx:showNotification', source, _U('error_robbed'))
	end
end)

RegisterServerEvent('genesis-holdUp:robEnded')
AddEventHandler('genesis-holdUp:robEnded', function()
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		local xPlayerJob = xPlayer.getJob()

		if xPlayerJob.name == 'police' then
			TriggerClientEvent('genesis-holdUp:killBlip', xPlayer.source)
		end
	end
end)

RegisterServerEvent('genesis-holdUp:syncOpenAnim')
AddEventHandler('genesis-holdUp:syncOpenAnim', function()
	TriggerClientEvent('genesis-holdUp:openAnim', -1)
	TriggerClientEvent('genesis-holdUp:openVaultSound', source)
end)

RegisterServerEvent('genesis-holdUp:syncParticles')
AddEventHandler('genesis-holdUp:syncParticles', function(bool)
	TriggerClientEvent('genesis-holdUp:playParticles', -1, bool)
end)


RegisterServerEvent('genesis-holdUp:giveMoney')
AddEventHandler('genesis-holdUp:giveMoney', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local mn = math.random(20000, 26000)

	xPlayer.addAccountMoney('black_money', mn)
	TriggerClientEvent('esx:showNotification', source, _U('kasa', mn))
end)

function CountPolice()
	local count = 0
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		local xPlayerJob = xPlayer.getJob()

		if xPlayerJob.name == 'police' then
			count = count+1
		end
	end

	return count
end--cops_notif

function NotifLSPD()
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		local xPlayerJob = xPlayer.getJob()

		if xPlayerJob.name == 'police' then
			TriggerClientEvent('genesis-holdUp:copsNotif', xPlayer.source)
		end
	end
end

function CheckRobbed(bankN)
	local found = false

	for i=1, #RobbedBanks, 1 do
		if RobbedBanks[i] == bankN then
			found = true
		end
	end

	return found
end