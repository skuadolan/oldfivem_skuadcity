if Config.UseESX then
	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = ESX.Math.Round(price)

		if price > 0 then
			xPlayer.removeMoney(amount)
			--xPlayer.addWeapon('WEAPON_PETROLCAN', 4500)
		end
	end)

	RegisterServerEvent('fuel:givePetrol')
	AddEventHandler('fuel:givePetrol', function()
		local xPlayer = ESX.GetPlayerFromId(source)

		xPlayer.removeWeapon('WEAPON_PETROLCAN', 4500)
		xPlayer.addWeapon('WEAPON_PETROLCAN', 4500)
		--xPlayer.addInventoryItem("WEAPON_PETROLCAN", 100)
	end)
end
