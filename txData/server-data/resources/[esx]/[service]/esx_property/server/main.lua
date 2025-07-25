function GetProperty(name)
	for i=1, #Config.Properties, 1 do
		if Config.Properties[i].name == name then
			return Config.Properties[i]
		end
	end
end

function SetPropertyOwned(name, price, rented, owner)
	MySQL.update('INSERT INTO owned_properties (name, price, rented, owner) VALUES (@name, @price, @rented, @owner)', {
		['@name']   = name,
		['@price']  = price,
		['@rented'] = (rented and 1 or 0),
		['@owner']  = owner
	}, function(rowsChanged)
		local xPlayer = ESX.GetPlayerFromIdentifier(owner)

		if xPlayer then
			TriggerClientEvent('esx_property:setPropertyOwned', xPlayer.source, name, true, rented)

			if rented then
				TriggerClientEvent('skd_cSide:forServerNotify', -1, 'inform', _U('rent_for', ESX.Math.GroupDigits(price)))
				--xPlayer.showNotification(_U('rent_for', ESX.Math.GroupDigits(price)))
			else
				TriggerClientEvent('skd_cSide:forServerNotify', -1, 'inform', _U('buy_for', ESX.Math.GroupDigits(price)))
				--xPlayer.showNotification(_U('buy_for', ESX.Math.GroupDigits(price)))
			end
		end
	end)
end

function RemoveOwnedProperty(name, owner, noPay)
	MySQL.query('SELECT id, rented, price FROM owned_properties WHERE name = @name AND owner = @owner', {
		['@name']  = name,
		['@owner'] = owner
	}, function(result)
		if result[1] then
			MySQL.update('DELETE FROM owned_properties WHERE id = @id', {
				['@id'] = result[1].id
			}, function(rowsChanged)
				local xPlayer = ESX.GetPlayerFromIdentifier(owner)

				if xPlayer then
					xPlayer.triggerEvent('esx_property:setPropertyOwned', name, false)

					if not noPay then
						if result[1].rented == 1 then
							TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success', _U('moved_out'))
							--xPlayer.showNotification(_U('moved_out'))
						else
							local sellPrice = ESX.Math.Round(result[1].price / Config.SellModifier)

							TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('moved_out_sold', ESX.Math.GroupDigits(sellPrice)))
							--xPlayer.showNotification(_U('moved_out_sold', ESX.Math.GroupDigits(sellPrice)))
							xPlayer.addAccountMoney('bank', sellPrice)
						end
					end
				end

				if Config.OxInventory then
					MySQL.query('DELETE FROM ox_inventory WHERE owner = ? AND name = ?', {
						owner, ('%s%s'):format(owner, name)
					})
				end
			end)
		end
	end)
end

MySQL.ready(function()
	Wait(1500)

	MySQL.query('SELECT * FROM `properties`', {}, function(properties)

		for i=1, #properties, 1 do
			local property = properties[i]
			local entering  = nil
			local exit      = nil
			local inside    = nil
			local outside   = nil
			local isSingle  = nil
			local isRoom    = nil
			local isGateway = nil
			local isBuilding = nil
			local roomMenu  = nil

			if property.entering then
				entering = json.decode(property.entering)
			end

			if property.exit then
				exit = json.decode(property.exit)
			end

			if property.inside then
				inside = json.decode(property.inside)
			end

			if property.outside then
				outside = json.decode(property.outside)
			end

			if property.is_single == 0 then
				isSingle = false
			else
				isSingle = true
			end

			if property.is_room == 0 then
				isRoom = false
			else
				isRoom = true
			end

			if property.is_gateway == 0 then
				isGateway = false
			else
				isGateway = true
			end

			if property.isBuilding == 0 then
				isBuilding = false
			else
				isBuilding = true
			end

			if property.room_menu then
				roomMenu = json.decode(property.room_menu)
			end

			table.insert(Config.Properties, {
				name      = property.name,
				label     = property.label,
				entering  = entering,
				exit      = exit,
				inside    = inside,
				outside   = outside,
				ipls      = json.decode(property.ipls),
				gateway   = property.gateway,
				isSingle  = isSingle,
				isRoom    = isRoom,
				isGateway = isGateway,
				roomMenu  = roomMenu,
				price     = property.price,
				isBuilding = isBuilding
			})

			if Config.OxInventory then
				exports.ox_inventory:RegisterStash(property.name, property.label, 50, 100000, true)
			end
		end

		TriggerClientEvent('esx_property:sendProperties', -1, Config.Properties)
	end)
end)

if Config.OxInventory then
	AddEventHandler('onServerResourceStart', function(resource)
		if resource == 'ox_inventory' then
			for i=1, #Config.Properties do
				local property = Config.Properties[i]
				exports.ox_inventory:RegisterStash(property.name, property.label, 50, 100000, true)
			end
		end
	end)
end

ESX.RegisterServerCallback('esx_property:getProperties', function(source, cb)
	cb(Config.Properties)
end)

AddEventHandler('esx_ownedproperty:getOwnedProperties', function(cb)
	MySQL.query('SELECT * FROM owned_properties', function(result)
		local properties = {}

		for i=1, #result, 1 do
			table.insert(properties, {
				id     = result[i].id,
				name   = result[i].name,
				label  = GetProperty(result[i].name).label,
				price  = result[i].price,
				rented = (result[i].rented == 1 and true or false),
				owner  = result[i].owner
			})
		end

		cb(properties)
	end)
end)

AddEventHandler('esx_property:setPropertyOwned', function(name, price, rented, owner)
	SetPropertyOwned(name, price, rented, owner)
end)

AddEventHandler('esx_property:removeOwnedProperty', function(name, owner)
	RemoveOwnedProperty(name, owner)
end)

RegisterNetEvent('esx_property:rentProperty')
AddEventHandler('esx_property:rentProperty', function(propertyName)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local property = GetProperty(propertyName)
	local rent     = ESX.Math.Round(property.price / Config.RentModifier)

	SetPropertyOwned(propertyName, rent, true, xPlayer.identifier)
end)

RegisterNetEvent('esx_property:buyProperty')
AddEventHandler('esx_property:buyProperty', function(propertyName)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local property = GetProperty(propertyName)

	if property.price <= xPlayer.getMoney() then
		xPlayer.removeMoney(property.price)
		SetPropertyOwned(propertyName, property.price, false, xPlayer.identifier)
	else
		TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('not_enough'))
		--xPlayer.showNotification(_U('not_enough'))
	end
end)

RegisterNetEvent('esx_property:removeOwnedProperty')
AddEventHandler('esx_property:removeOwnedProperty', function(propertyName)
	local xPlayer = ESX.GetPlayerFromId(source)
	RemoveOwnedProperty(propertyName, xPlayer.identifier)
end)

AddEventHandler('esx_property:removeOwnedPropertyIdentifier', function(propertyName, identifier)
	RemoveOwnedProperty(propertyName, identifier)
end)

RegisterNetEvent('esx_property:saveLastProperty')
AddEventHandler('esx_property:saveLastProperty', function(property)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.update('UPDATE users SET last_property = @last_property WHERE identifier = @identifier', {
		['@last_property'] = property,
		['@identifier']    = xPlayer.identifier
	})
end)

RegisterNetEvent('esx_property:deleteLastProperty')
AddEventHandler('esx_property:deleteLastProperty', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.update('UPDATE users SET last_property = NULL WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	})
end)

RegisterNetEvent('esx_property:getItem')
AddEventHandler('esx_property:getItem', function(owner, type, item, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)

	if type == 'item_standard' then
		TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayerOwner.identifier, function(inventory)
			local inventoryItem = inventory.getItem(item)

			-- is there enough in the property?
			if count > 0 and inventoryItem.count >= count then
				-- can the player carry the said amount of x item?
				if xPlayer.canCarryItem(item, count) then
					inventory.removeItem(item, count)
					xPlayer.addInventoryItem(item, count)
					TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success', _U('have_withdrawn', count, inventoryItem.label))
					--xPlayer.showNotification(_U('have_withdrawn', count, inventoryItem.label))
				else
					TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('player_cannot_hold'))
					--xPlayer.showNotification(_U('player_cannot_hold'))
				end
			else
				TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('not_enough_in_property'))
				--xPlayer.showNotification(_U('not_enough_in_property'))
			end
		end)
	elseif type == 'item_account' then
		TriggerEvent('esx_addonaccount:getAccount', 'property_' .. item, xPlayerOwner.identifier, function(account)
			if account.money >= count then
				account.removeMoney(count)
				xPlayer.addAccountMoney(item, count)
			else
				TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('amount_invalid'))
				--xPlayer.showNotification(_U('amount_invalid'))
			end
		end)
	elseif type == 'item_weapon' then
		TriggerEvent('esx_datastore:getDataStore', 'property', xPlayerOwner.identifier, function(store)
			local storeWeapons = store.get('weapons') or {}
			local weaponName   = nil
			local ammo         = nil

			for i=1, #storeWeapons, 1 do
				if storeWeapons[i].name == item then
					weaponName = storeWeapons[i].name
					ammo       = storeWeapons[i].ammo

					table.remove(storeWeapons, i)
					break
				end
			end

			store.set('weapons', storeWeapons)
			xPlayer.addWeapon(weaponName, ammo)
		end)
	end
end)

RegisterNetEvent('esx_property:putItem')
AddEventHandler('esx_property:putItem', function(owner, type, item, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)

	if type == 'item_standard' then
		local playerItemCount = xPlayer.getInventoryItem(item).count

		if playerItemCount >= count and count > 0 then
			TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayerOwner.identifier, function(inventory)
				xPlayer.removeInventoryItem(item, count)
				inventory.addItem(item, count)
				TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success', _U('have_deposited', count, inventory.getItem(item).label))
				--xPlayer.showNotification(_U('have_deposited', count, inventory.getItem(item).label))
			end)
		else
			TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('invalid_quantity'))
			--xPlayer.showNotification(_U('invalid_quantity'))
		end
	elseif type == 'item_account' then
		if xPlayer.getAccount(item).money >= count and count > 0 then
			xPlayer.removeAccountMoney(item, count)

			TriggerEvent('esx_addonaccount:getAccount', 'property_' .. item, xPlayerOwner.identifier, function(account)
				account.addMoney(count)
			end)
		else
			TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('amount_invalid'))
			--xPlayer.showNotification(_U('amount_invalid'))
		end
	elseif type == 'item_weapon' then
		if xPlayer.hasWeapon(item) then
			xPlayer.removeWeapon(item)

			TriggerEvent('esx_datastore:getDataStore', 'property', xPlayerOwner.identifier, function(store)
				local storeWeapons = store.get('weapons') or {}

				table.insert(storeWeapons, {
					name = item,
					ammo = count
				})

				store.set('weapons', storeWeapons)
			end)
		end
	end
end)

ESX.RegisterServerCallback('esx_property:getOwnedProperties', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.query('SELECT name, rented FROM owned_properties WHERE owner = @owner', {
		['@owner'] = xPlayer.identifier
	}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('esx_property:getLastProperty', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.query('SELECT last_property FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(users)
		cb(users[1].last_property)
	end)
end)

ESX.RegisterServerCallback('esx_property:getPropertyInventory', function(source, cb, owner)
	local xPlayer    = ESX.GetPlayerFromIdentifier(owner)
	local blackMoney = 0
	local items      = {}
	local weapons    = {}

	TriggerEvent('esx_addonaccount:getAccount', 'property_black_money', xPlayer.identifier, function(account)
		blackMoney = account.money
	end)

	TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayer.identifier, function(inventory)
		items = inventory.items
	end)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		weapons = store.get('weapons') or {}
	end)

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = weapons
	})
end)

ESX.RegisterServerCallback('esx_property:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local blackMoney = xPlayer.getAccount('black_money').money
	local items      = xPlayer.inventory

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = xPlayer.getLoadout()
	})
end)

ESX.RegisterServerCallback('esx_property:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local count  = store.count('dressing')
		local labels = {}

		for i=1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end

		cb(labels)
	end)
end)

ESX.RegisterServerCallback('esx_property:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local outfit = store.get('dressing', num)
		cb(outfit.skin)
	end)
end)

RegisterNetEvent('esx_property:removeOutfit')
AddEventHandler('esx_property:removeOutfit', function(label)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing') or {}

		table.remove(dressing, label)
		store.set('dressing', dressing)
	end)
end)

function payRent(d, h, m)
	local tasks, timeStart = {}, os.clock()
	print('[esx_property] [^2INFO^7] Paying rent cron job started')

	MySQL.query('SELECT * FROM owned_properties WHERE rented = 1', function(result)
		for k,v in ipairs(result) do
			table.insert(tasks, function(cb)
				local xPlayer = ESX.GetPlayerFromIdentifier(v.owner)

				if xPlayer then
					if xPlayer.getAccount('bank').money >= v.price then
						xPlayer.removeAccountMoney('bank', v.price)
						TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', (_U('paid_rent', ESX.Math.GroupDigits(v.price), GetProperty(v.name).label)))
						--xPlayer.showNotification(_U('paid_rent', ESX.Math.GroupDigits(v.price), GetProperty(v.name).label))
					else
						TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('paid_rent_evicted', GetProperty(v.name).label, ESX.Math.GroupDigits(v.price)))
						--xPlayer.showNotification(_U('paid_rent_evicted', GetProperty(v.name).label, ESX.Math.GroupDigits(v.price)))
						RemoveOwnedProperty(v.name, v.owner, true)
					end
				else
					MySQL.scalar('SELECT accounts FROM users WHERE identifier = @identifier', {
						['@identifier'] = v.owner
					}, function(accounts)
						if accounts then
							local playerAccounts = json.decode(accounts)

							if playerAccounts and playerAccounts.bank then
								if playerAccounts.bank >= v.price then
									playerAccounts.bank = playerAccounts.bank - v.price

									MySQL.update('UPDATE users SET accounts = @accounts WHERE identifier = @identifier', {
										['@identifier'] = v.owner,
										['@accounts'] = json.encode(playerAccounts)
									})
								else
									RemoveOwnedProperty(v.name, v.owner, true)
								end
							end
						end
					end)
				end

				TriggerEvent('esx_addonaccount:getSharedAccount', 'society_realestateagent', function(account)
					account.addMoney(v.price)
				end)

				cb()
			end)
		end

		Async.parallelLimit(tasks, 5, function(results) end)

		local elapsedTime = os.clock() - timeStart
		print(('[esx_property] [^2INFO^7] Paying rent cron job took %s seconds'):format(elapsedTime))
	end)
end

TriggerEvent('cron:runAt', 22, 0, payRent)
