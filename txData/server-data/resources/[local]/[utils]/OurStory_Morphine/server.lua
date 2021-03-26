--This script is property of OurStory RP but has been released for free on the FiveM forums. Do NOT redisribute this for money or claim to have written it yourself. 
--If you use this script, all I ask is that you credit me using my Discord account 4th#4444
--Also, I politely request that you do not rename the script however if you really want to I wont stop you.
--Video showcase: https://www.youtube.com/watch?v=a-StxdwHPfE

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('morphine', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('morphine', 1)
	--TriggerClientEvent('esx_status:add', source, 'thirst', -50000)
	--TriggerClientEvent('esx_status:add', source, 'hunger', -50000)
	TriggerClientEvent('esx_armour:morphine', source)
end)