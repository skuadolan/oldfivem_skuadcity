ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local SomeoneBuyingDrill = false

local RobbedBigBanks = {}

RegisterServerEvent('genesis_heist_thermal:buyDrill')
AddEventHandler('genesis_heist_thermal:buyDrill', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if SomeoneBuyingDrill then
		TriggerClientEvent('genesis_heist_thermal:notif', xPlayer.source, _U('error_01'))
	else
		local xMoney = xPlayer.getMoney()
		if xMoney < Config.ThermalDrillCost then
			TriggerClientEvent('genesis_heist_thermal:notif', xPlayer.source, _U('error_02'))
		else
			SomeoneBuyingDrill = true
			xPlayer.removeMoney(Config.ThermalDrillCost)		
			TriggerClientEvent('genesis_heist_thermal:spawnDrill', xPlayer.source)
		end
	end
end)


RegisterServerEvent('genesis_heist_thermal:startBigRob')
AddEventHandler('genesis_heist_thermal:startBigRob', function(bigBank)
	for i=1, #RobbedBigBanks, 1 do
		if RobbedBigBanks[i] == bigBank then
			--return cant RobbedBigBanks
		else
			CallPolice(bigBank.StartRob)
			table.insert(RobbedBigBanks, bigBank)

			TriggerClientEvent('genesis_heist_thermal:robBigBank', bigBank)
		end
	end
end)


function CallPolice(coords)
--called LSPD
end