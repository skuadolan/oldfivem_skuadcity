-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Banks = Config.Banks
Safes = Config.Safes

RegisterServerEvent('t1ger_bankrobbery:ResetCurrentBankSV')
AddEventHandler('t1ger_bankrobbery:ResetCurrentBankSV', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	-- Banks:
    for i = 1, #Banks do
		Banks[i].inUse = false
		Banks[i].keypads[1].hacked = false
		Banks[i].keypads[2].hacked = false
	end
	
	-- Safes:
	for i = 1, #Safes do
		Safes[i].robbed = false
		Safes[i].failed = false
    end
	TriggerClientEvent('t1ger_bankrobbery:ResetCurrentBankCL', -1)

	-- Secure News:
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'journalist' then
			TriggerClientEvent('chatMessage', xPlayers[i], "^2News: | ^7", { 128, 128, 128 }, string.sub('The bank has been secured. All banks are now open again!',0))
		end
	end
end) 

-- Hacker Device:
ESX.RegisterServerCallback('t1ger_bankrobbery:hackerDevice',function(source,cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local gotItem = xPlayer.getInventoryItem(Config.HackItem ).count >= 1
	if gotItem then
		xPlayer.removeInventoryItem(Config.HackItem ,1)
		cb(true)
	else
		cb(false)
	end
end)

-- Usable Drill Item:
ESX.RegisterUsableItem(Config.DrillItem, function(source)
	TriggerClientEvent('t1ger_bankrobbery:drillCloseSafe',source,Config.DrillItem)
end)

-- Callback to remove item:
ESX.RegisterServerCallback('t1ger_bankrobbery:removeItem',function(source,cb,item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local gotItem = xPlayer.getInventoryItem(item).count >= 1
	if gotItem then
		xPlayer.removeInventoryItem(item,1)
		cb(true)
	end
end)

-- Safe Reward:
RegisterServerEvent('t1ger_bankrobbery:safeReward')
AddEventHandler('t1ger_bankrobbery:safeReward', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	-- Chance to keep drill:
	math.randomseed(GetGameTimer())
	if math.random(0,100) <= Config.ChanceToKeepDrill then 
		xPlayer.addInventoryItem(Config.DrillItem,1)
	end

	-- Money:
	for k,v in pairs(Config.SafeMoneyReward) do
		local amount = (math.random(v.minAmount, v.maxAmount) * 1000)
		if v.dirtyCash then
			xPlayer.addAccountMoney('black_money', amount)
		else
			xPlayer.addMoney(amount)
		end
	end

	-- Item Reward:
	for k,v in pairs(Config.SafeItemRewards) do
		if math.random(0,100) <= v.chance then
			local itemAmount = math.random(v.min,v.max)
			local itemName = ''
			if Config.HasItemLabel then
				itemName = ESX.GetItemLabel(v.item)
			else
				itemName = tostring(v.item)
			end
			xPlayer.addInventoryItem(v.item,itemAmount)
			TriggerClientEvent('t1ger_bankrobbery:ShowNotifyESX', xPlayer.source, (Lang['drill_item_not_usable']:format(itemName,itemAmount)))
		end
	end
end)

RegisterServerEvent('t1ger_bankrobbery:giveItem')
AddEventHandler('t1ger_bankrobbery:giveItem', function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(item,1)
end)

-- Event for police alerts
RegisterServerEvent('t1ger_bankrobbery:PoliceNotifySV')
AddEventHandler('t1ger_bankrobbery:PoliceNotifySV', function(targetCoords, streetName, name)
	TriggerClientEvent('t1ger_bankrobbery:PoliceNotifyCL', -1, (Lang['police_notify']):format(name,streetName))
	TriggerClientEvent('t1ger_bankrobbery:PoliceNotifyBlip', -1, targetCoords)
end)

-- get police online:
function getPoliceCount()
	local xPlayers = ESX.GetPlayers()
	PoliceOnline = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			PoliceOnline = PoliceOnline + 1
		end
	end
	TriggerClientEvent('t1ger_bankrobbery:getPoliceCount', -1, PoliceOnline)
	SetTimeout(30 * 1000, getPoliceCount)
end

