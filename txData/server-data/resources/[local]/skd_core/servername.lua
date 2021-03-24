function SetData()
    players = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert( players, player)
    end

    local name = GetPlayerName(PlayerId())
    local id = GetPlayerServerId(PlayerId())
    Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', "SKUAD CITY ROLEPLAY")
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        SetData()
    end
end)
