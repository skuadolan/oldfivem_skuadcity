CreateThread(function()
    while true do
        Wait(21)
        local ped = GetPlayerPed(-1);
        local vehicle = GetVehiclePedIsIn(ped);
        local isDriver = GetPedInVehicleSeat(vehicle, -1);
        if (isDriver == ped) then
            --RIGHT CLICK
            DisableControlAction(0, 25)
            DisableControlAction(0, 68)
            DisableControlAction(0, 70)
            DisableControlAction(0, 91)
            DisableControlAction(0, 114)
            DisableControlAction(0, 222)
            DisableControlAction(0, 225)
            DisableControlAction(0, 238)
            DisableControlAction(0, 330)
            DisableControlAction(0, 331)
            DisableControlAction(0, 347)

            SetPlayerCanDoDriveBy(ped, false)
        end
    end
end)
CreateThread(function()
    while true do
        Wait(40)
        --TAB
        DisableControlAction(0, 37)
        DisableControlAction(0, 192)
        DisableControlAction(0, 204)
        DisableControlAction(0, 211)
        DisableControlAction(0, 349)

        --PAUSE
        DisableControlAction(0, 199)
        DisableControlAction(1, 199)

        --R ATTACK
        DisableControlAction(0, 140)
        DisableControlAction(0, 263)
        --Q ATTACK
        DisableControlAction(0, 141)
        DisableControlAction(0, 264)
    end
end)
