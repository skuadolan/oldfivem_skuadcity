ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function concatenate(args)
    local str = ''
    for i=1, #args do
        str = str..' '..args[i]
    end
    return str
end

RegisterCommand('bisik', function(source, args, rawCommand)
    --local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    local name = GetPlayerName(source)
    local text = 'Bisik | '..xPlayer.name..' :'.. concatenate(args)

    TriggerClientEvent('bisik:allPlayer', -1, text, source)
end, false)