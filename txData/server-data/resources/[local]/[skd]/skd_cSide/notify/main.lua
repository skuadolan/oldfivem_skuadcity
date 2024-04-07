RegisterNetEvent('skd_cSide:forServerNotify')
AddEventHandler('skd_cSide:forServerNotify', function(alert, msg)
    if alert == 'error' then
        exports['mythic_notify']:SendAlert('error', msg)
    elseif alert == 'inform' then
        exports['mythic_notify']:SendAlert('inform', msg)
    else
        if alert == 'success' then
            exports['mythic_notify']:SendAlert('success', msg)
        end
    end
end)

--TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U(''))
--ShowNotification
