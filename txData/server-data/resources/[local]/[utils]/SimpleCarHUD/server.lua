RegisterServerEvent('skd_core:syncCarLights')
AddEventHandler('skd_core:syncCarLights', function(status)
	TriggerClientEvent('skd_core:syncCarLights', -1, source, status)
end)
