ESX          = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_clip:clipcli')
AddEventHandler('esx_clip:clipcli', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    exports['mythic_progbar']:Progress({
      name = "inventoryhud_trunk",
      duration = 3000,
      label = 'mereload senjata',
      useWhileDead = true,
      canCancel = true,
      controlDisables = {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      },
      animation = {
        animDict = "missheistdockssetup1clipboard@idle_a",
        anim = "idle_b",
        flags = 49,
      },
    }, function(cancelled)
      if not cancelled then
      end
    end)
    Citizen.Wait(3000)
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      TriggerServerEvent('esx_clip:remove')

      AddAmmoToPed(GetPlayerPed(-1), hash,25)
      ESX.ShowNotification("tu as utilisé un chargeur")
    --else
    --  ESX.ShowNotification("tu n'as pas d'arme en main")
    end
  --else
    --ESX.ShowNotification("ce type de munition ne convient pas")
  end
end)
