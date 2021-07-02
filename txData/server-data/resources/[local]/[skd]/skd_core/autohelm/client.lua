Citizen.CreateThread( function()
    while true do
        Citizen.Wait(0)
        SetPedHelmet(GetPlayerPed(-1), Config.AutoHelm)
        local playerPed = GetPlayerPed(-1)
        local playerVeh = GetVehiclePedIsUsing(playerPed)

        if gPlayerVeh ~= 1000 then SetPedHelmet(playerPed,Config.AutoHelm) end
    end
end)