ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('lucky_hunting:reward')
AddEventHandler('lucky_hunting:reward', function(Weight)
    local xPlayer = ESX.GetPlayerFromId(source)

    if Weight >= 1 then
        xPlayer.addInventoryItem('meat', 1)
    elseif Weight >= 9 then
        xPlayer.addInventoryItem('meat', 2)
    elseif Weight >= 15 then
        xPlayer.addInventoryItem('meat', 3)
    end

    xPlayer.addInventoryItem('leather', math.random(1, 4))    
end)

RegisterServerEvent('lucky_hunting:sell')
AddEventHandler('lucky_hunting:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local MeatPrice = 125
    local LeatherPrice = 25

    local MeatQuantity = xPlayer.getInventoryItem('meat').count
    local LeatherQuantity = xPlayer.getInventoryItem('leather').count

    if MeatQuantity > 0 or LeatherQuantity > 0 then
        xPlayer.addMoney(MeatQuantity * MeatPrice)
        xPlayer.addMoney(LeatherQuantity * LeatherPrice)

        xPlayer.removeInventoryItem('meat', MeatQuantity)
        xPlayer.removeInventoryItem('leather', LeatherQuantity)
        TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {text = 'You sold ' .. LeatherQuantity + MeatQuantity .. ' and earned $' .. LeatherPrice * LeatherQuantity + MeatPrice * MeatQuantity, type = "success", queue = "lmao", timeout = 10000, layout = "centerLeft"})
    else
        TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {text = "You dont have any meat or leather", type = "error", queue = "lmao", timeout = 10000, layout = "centerLeft"})
    end
end)