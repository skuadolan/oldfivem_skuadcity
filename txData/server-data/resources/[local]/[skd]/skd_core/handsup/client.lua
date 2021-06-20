Citizen.CreateThread(function()
    local dict = "missminuteman_1ig_2"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
        local player = GetPlayerPed(-1)
        if IsPedInAnyVehicle(player, false) then
            if IsControlJustPressed(1, 323) then --Start holding X
                if not handsup then
                    handsup = true
                else
                    handsup = false
                    ClearPedTasks(GetPlayerPed(-1))
                end
            end
        end

        while handsup do
            TaskPlayAnim(GetPlayerPed(-1), dict, "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
        end
    end
end)