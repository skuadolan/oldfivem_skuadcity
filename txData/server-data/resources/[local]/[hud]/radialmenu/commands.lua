local open = false
local ESX  = nil
 
-- ESX
-- Added this so you can include the rest of the Usage-stuff found on the GitHub page
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- Open ID card
RegisterNetEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function( data, type )
    open = true
    SendNUIMessage({
        action = "open",
        array  = data,
        type   = type
    })
end)

RegisterCommand("lihatid", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
end, false)

RegisterCommand("tunjukkanktp", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)
    local player, distance = ESX.Game.GetClosestPlayer()

    if distance ~= -1 and distance <= 3.0 then
      Citizen.Wait(100)
      TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
    else
      exports['mythic_notify']:SendAlert('error', 'Tidak Ada Orang Di Dekatmu')
      --ESX.ShowNotification('Tidak Ada Player Di Dekatmu')
    end
end, false)

RegisterCommand("lihatsim", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
end, false)

RegisterCommand("tunjukkankendaraan", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    local player, distance = ESX.Game.GetClosestPlayer()

    if distance ~= -1 and distance <= 3.0 then
      
      Citizen.Wait(100)
      TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
    else
      exports['mythic_notify']:SendAlert('error', 'Tidak Ada Orang Di Dekatmu')
      --exports['mythic_notify']:SendAlert('inform', _U('coke_processingstarted'))
      --ESX.ShowNotification('Tidak Ada Player Di Dekatmu')
    end
end, false)

RegisterCommand("lihatlisensi", function(source, args, rawCommand)
  -- Wait for next frame just to be safe
  Citizen.Wait(0)

  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
end, false)

RegisterCommand("tunjukkansenjataku", function(source, args, rawCommand)
  -- Wait for next frame just to be safe
  Citizen.Wait(0)
  local player, distance = ESX.Game.GetClosestPlayer()

  if distance ~= -1 and distance <= 3.0 then
    Citizen.Wait(250)
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
  else
    exports['mythic_notify']:SendAlert('error', 'Tidak Ada Orang Di Dekatmu')
    --ESX.ShowNotification('No players nearby')
  end
end, false)

engineoff = false
saved = false
controlsave_bool = false

-- E N G I N E --
IsEngineOn = true
RegisterCommand('engine',function() 
	local player = GetPlayerPed(-1)
	
	if (IsPedSittingInAnyVehicle(player)) then 
		local vehicle = GetVehiclePedIsIn(player,false)
		
		if IsEngineOn == true then
			IsEngineOn = false
			SetVehicleEngineOn(vehicle,false,false,false)
		else
			IsEngineOn = true
			SetVehicleUndriveable(vehicle,false)
			SetVehicleEngineOn(vehicle,true,false,false)
		end
		
		while (IsEngineOn == false) do
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
		end
	end
end)

RegisterCommand('engineoff',function() 
		local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			engineoff = true
			ShowNotification("Engine ~r~off~s~.")
			while (engineoff) do
			SetVehicleEngineOn(vehicle,false,false,false)
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
			end
		end
end)
RegisterCommand('engineon',function() 
    local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			engineoff = false
			SetVehicleUndriveable(vehicle,false)
			SetVehicleEngineOn(vehicle,true,false,false)
			ShowNotification("Engine ~g~on~s~.")
	end
end)