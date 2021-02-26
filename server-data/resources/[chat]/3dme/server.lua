-- ## 3dme : server side

-- Command
RegisterCommand('me', function(source, args)
    --local text = "* " .. Languages[Config.language].prefix .. table.concat(args, " ") .. " *"
    local text = "* " .. table.concat(args, " ") .. " *"
    TriggerClientEvent('3dme:shareDisplay', -1, text, source, 'me')
end)

RegisterCommand('do', function(source, args)
    local text = "* " .. table.concat(args, " ") .. " *"
    TriggerClientEvent('3dme:shareDisplay', -1, text, source, 'do')
end)