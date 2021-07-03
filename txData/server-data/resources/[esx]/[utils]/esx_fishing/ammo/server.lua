ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('silencieux', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('silencieux', 1)
    TriggerClientEvent('nfw_wep:silencieux', source)
end)

ESX.RegisterUsableItem('flashlight', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('flashlight', 1)
    TriggerClientEvent('nfw_wep:flashlight', source)
end)

ESX.RegisterUsableItem('grip', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('grip', 1)
    TriggerClientEvent('nfw_wep:grip', source)
end)

ESX.RegisterUsableItem('yusuf', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('yusuf', 1)
    TriggerClientEvent('nfw_wep:yusuf', source)
end)

ESX.RegisterUsableItem('HeavyArmor', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('HeavyArmor', 1)
    TriggerClientEvent('nfw_wep:HeavyArmor', source)
end)

RegisterNetEvent('returnItem')
AddEventHandler('returnItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)

    --xPlayer.addInventoryItem(item, 1)
end)


ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterUsableItem(Config.ItemAmmo, function(source)
    TriggerClientEvent('disc-ammo:useAmmoItem', source, Config.ItemAmmo)
    TriggerClientEvent('disc-ammo:UseClip', source, Config.ItemAmmo)
end)

RegisterServerEvent('disc-ammo:removeAmmoItem')
AddEventHandler('disc-ammo:removeAmmoItem', function(ammo)
    local player = ESX.GetPlayerFromId(source)
    player.removeInventoryItem(ammo, 1)
end)