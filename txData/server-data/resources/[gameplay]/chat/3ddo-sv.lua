RegisterServerEvent('3ddo:shareDisplay')
AddEventHandler('3ddo:shareDisplay', function(text)
	TriggerClientEvent('3ddo:triggerDisplay', -1, text, source)
end)
