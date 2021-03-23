Citizen.CreateThread( function()
    SetPedHelmet(GetPlayerPed(-1), false)

    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        local playerVeh = GetVehiclePedIsUsing(playerPed)

        if gPlayerVeh ~= 1000 then SetPedHelmet(playerPed,false) end
    end

end)