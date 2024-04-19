RegisterServerEvent('skd_shops:SetupInitShop')
AddEventHandler('skd_shops:SetupInitShop', function()
	CreateThread(function()
		while true do
			reSelectAllShops()
			Wait(15 * 60000)
		end
	end)
end)

function GetRealPlayerName(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		return xPlayer.getName()
	else
		return GetPlayerName(playerId)
	end
end

RegisterNetEvent('skd_shops:buyShopsProperty')
AddEventHandler('skd_shops:buyShopsProperty', function(newStore_label, zone) --newName store label
	local xPlayer   = ESX.GetPlayerFromId(source)
	local tempOwner = {
		identifier = xPlayer.identifier,
		name = GetRealPlayerName(source)
	}

	if Config.Shops[zone].price <= xPlayer.getMoney() then
		xPlayer.removeMoney(Config.Shops[zone].price)
		local emptyNilString = ''
		local zeroNilNumbeer = 0
		MySQL.update(
			'UPDATE shops SET owner = @owner, expired = CONVERT(DATE_ADD(CURDATE(), INTERVAL 14 DAY), CHAR), store_label = @store_label, isSales = @isSales WHERE id = @zone',
			{
				['@owner']       = json.encode(tempOwner),
				['@isSales']     = 1,
				['@store_label'] = newStore_label,
				['@zone']        = zone
			})
		localReselectAllShops(zone, tempOwner, emptyNilString, emptyNilString, zeroNilNumbeer, newStore_label,
			Config.Shops[zone].store_location, Config.Shops[zone].price, Config.Shops[zone].expired, 1)
		TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success', _U('berhasil_ambil_toko'))
	else
		TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('gagal_ambil_toko'))
	end
end)

RegisterNetEvent('skd_shops:updateShopName')
AddEventHandler('skd_shops:updateShopName', function(newStore_label, zone) --newName store label
	if Config.Shops[zone].idShop then
		MySQL.update('UPDATE shops SET store_label = @store_label WHERE id = @zone', {
			['@store_label'] = newStore_label,
			['@zone']        = zone
		})
		localReselectAllShops(zone, Config.Shops[zone].owner, Config.Shops[zone].items, Config.Shops[zone].pItems,
			Config.Shops[zone].bank_saves, newStore_label, Config.Shops[zone].store_location, Config.Shops[zone].price,
			Config.Shops[zone].expired, 1)

		reSelectAllShops()
		TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success', _U('berhasil_ganti_nama_toko'))
	else
		TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('gagal_ganti_nama_toko'))
	end
end)

ESX.RegisterServerCallback('skd_shops:checkOwnerIdentifier', function(source, cb, identifier)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.identifier == identifier then
		cb(true)
	else
		cb(false)
	end
end)

RegisterNetEvent('skd_shops:putItem')
AddEventHandler('skd_shops:putItem', function(zone, type, item, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	if type == 'item_standard' then
		local iShopsNow = Config.Shops[zone].items
		local stockItems = {}
		local isAlreadyHas = false
		local tSItems = count

		if iShopsNow ~= nil and iShopsNow ~= '[]' and iShopsNow ~= '' and iShopsNow ~= ' ' and iShopsNow ~= 'null' then
			for k, v in pairs(iShopsNow) do
				stockItems[k] = v
				if k == item then
					isAlreadyHas = true
					tSItems = tSItems + v
				end
			end
			if isAlreadyHas then
				stockItems[item] = tSItems
			else
				stockItems[item] = count
			end
		else
			stockItems[item] = count
		end

		local playerItemCount = xPlayer.getInventoryItem(item).count
		if playerItemCount >= count and count > 0 then
			xPlayer.removeInventoryItem(item, count)
			MySQL.update('UPDATE shops SET inventory = @items, price_items = @price_items WHERE id = @zone', {
				['@items'] = json.encode(stockItems),
				['@price_items'] = json.encode(stockItems),
				['@zone'] = zone
			})
			localReselectAllShops(zone, Config.Shops[zone].owner, stockItems, stockItems, Config.Shops[zone].bank_saves,
				Config.Shops[zone].store_label, Config.Shops[zone].store_location, Config.Shops[zone].price,
				Config.Shops[zone].expired, Config.Shops[zone].isSales)
			TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success',
				_U('have_deposited', count, ESX.GetItemLabel(item)))
		else
			TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('invalid_input'))
			--xPlayer.showNotification(_U('invalid_quantity'))
		end
	end
end)

RegisterNetEvent('skd_shops:setPriceItem')
AddEventHandler('skd_shops:setPriceItem', function(zone, type, item, price)
	local xPlayer = ESX.GetPlayerFromId(source)

	if type == 'item_standard' then
		local pShopsNow = Config.Shops[zone].pItems
		local pItems = {}
		local isAlreadyHas = false

		for k, v in pairs(pShopsNow) do
			pItems[k] = v
			if k == item then
				isAlreadyHas = true
			end
		end
		if isAlreadyHas then
			pItems[item] = price
		end

		if price >= 0 then
			MySQL.update('UPDATE shops SET price_items = @price_items WHERE id = @zone', {
				['@price_items'] = json.encode(pItems),
				['@zone'] = zone
			})
			localReselectAllShops(zone, Config.Shops[zone].owner, Config.Shops[zone].items, pItems,
				Config.Shops[zone].bank_saves, Config.Shops[zone].store_label, Config.Shops[zone].store_location,
				Config.Shops[zone].price, Config.Shops[zone].expired, Config.Shops[zone].isSales)
			TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success', _U('success_update_price'))
		else
			TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('invalid_input'))
			--xPlayer.showNotification(_U('invalid_quantity'))
		end
	end
end)


RegisterNetEvent('skd_shops:getItem')
AddEventHandler('skd_shops:getItem', function(zone, type, item, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local iShopsNow = Config.Shops[zone].items
	local stockItems = {}
	local tSItems = count
	local canWithdraw = false
	for k, v in pairs(iShopsNow) do
		stockItems[k] = v
		if k == item then
			if tSItems <= v then
				canWithdraw = true
				tSItems = v - tSItems
			end
		end
	end
	if canWithdraw then
		stockItems[item] = tSItems
		xPlayer.addInventoryItem(item, count)
		MySQL.update('UPDATE shops SET inventory = @items WHERE id = @zone', {
			['@items'] = json.encode(stockItems),
			['@zone'] = zone
		})
		localReselectAllShops(zone, Config.Shops[zone].owner, stockItems, pItems, Config.Shops[zone].bank_saves,
			Config.Shops[zone].store_label, Config.Shops[zone].store_location, Config.Shops[zone].price,
			Config.Shops[zone].expired, Config.Shops[zone].isSales)
		TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success',
			_U('withdraw_barang_jualan', count, ESX.GetItemLabel(item)))
	else
		TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('invalid_input'))
	end
end)

RegisterNetEvent('skd_shops:withdrawnBalance')
AddEventHandler('skd_shops:withdrawnBalance', function(zone, wd)
	local xPlayer = ESX.GetPlayerFromId(source)
	local balance_shop = Config.Shops[zone].bank_saves
	local canWithdraw = false
	local wdBalance = wd
	wdBalance = balance_shop - wdBalance

	if wdBalance <= balance_shop then
		canWithdraw = true
	end

	if canWithdraw then
		xPlayer.addMoney(wd)
		MySQL.update('UPDATE shops SET bank_saves = @bank_saves WHERE id = @zone', {
			['@bank_saves'] = wdBalance,
			['@zone'] = zone
		})
		localReselectAllShops(zone, Config.Shops[zone].owner, Config.Shops[zone].items, Config.Shops[zone].pItems,
			wdBalance, Config.Shops[zone].store_label, Config.Shops[zone].store_location, Config.Shops[zone].price,
			Config.Shops[zone].expired, Config.Shops[zone].isSales)
		TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success', _U('success_withdrawnBalance'))
	else
		TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('invalid_input'))
	end
end)

RegisterNetEvent('skd_shops:resellOwnedShop')
AddEventHandler('skd_shops:resellOwnedShop', function(zone)
	local xPlayer = ESX.GetPlayerFromId(source)
	local iShopsNow = Config.Shops[zone].items
	if iShopsNow ~= nil and iShopsNow ~= '[]' and iShopsNow ~= '' and iShopsNow ~= ' ' and iShopsNow ~= 'null' then
		for k, v in pairs(iShopsNow) do
			xPlayer.addInventoryItem(k, v)
		end
	end
	local realShopPrice = Config.Shops[zone].price
	local balance_shop = Config.Shops[zone].bank_saves
	local resellPrice = ESX.Math.Round(realShopPrice / 100 * Config.ResellPercentage)
	local allMoney = balance_shop + resellPrice
	xPlayer.addMoney(allMoney)
	local owner = '{"identifier":"steam:","name":"Pemerintah"}'
	local emptyNilString = ''
	local zeroNilNumbeer = 0
	local store_label = 'TwentyFourSeven ' .. zone
	MySQL.update(
		'UPDATE shops SET owner = @owner, inventory = @inventory, price_items = @price_items, bank_saves = @bank_saves, store_label = @store_label, isSales = @isSales WHERE id = @zone',
		{
			['@owner'] = owner,
			['@inventory'] = emptyNilString,
			['@price_items'] = emptyNilString,
			['@bank_saves'] = zeroNilNumbeer,
			['@store_label'] = store_label,
			['@isSales'] = zeroNilNumbeer,
			['@zone'] = zone
		})

	localReselectAllShops(zone, owner, emptyNilString, emptyNilString, zeroNilNumbeer, store_label,
		Config.Shops[zone].store_location, Config.Shops[zone].price, emptyNilString, zeroNilNumbeer)

	reSelectAllShops()
	TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success', _U('success_resell_shop'))
end)

RegisterServerEvent('skd_shops:buyItem')
AddEventHandler('skd_shops:buyItem', function(itemName, price, amount, zone)
	local xPlayer = ESX.GetPlayerFromId(source)
	local balance_shop = Config.Shops[zone].bank_saves
	amount = ESX.Math.Round(amount)

	local iShopsNow = Config.Shops[zone].items
	local stockItems = {}
	local isAlreadyHas = false
	local tSItems = amount

	if iShopsNow ~= nil and iShopsNow ~= '[]' and iShopsNow ~= '' and iShopsNow ~= ' ' and iShopsNow ~= 'null' then
		for k, v in pairs(iShopsNow) do
			stockItems[k] = v
			if k == itemName then
				isAlreadyHas = true
				tSItems = v - tSItems
			end
		end
		if isAlreadyHas then
			stockItems[itemName] = tSItems
		end
	end

	if xPlayer.getMoney() >= price then
		local tPaid = price * amount
		balance_shop = balance_shop + tPaid
		-- can the player carry the said amount of x item?
		if xPlayer.canCarryItem(itemName, amount) then
			xPlayer.removeMoney(tPaid)
			xPlayer.addInventoryItem(itemName, amount)
			MySQL.update('UPDATE shops SET inventory = @inventory, bank_saves = @bank_saves WHERE id = @zone', {
				['@inventory'] = json.encode(stockItems),
				['@bank_saves'] = balance_shop,
				['@zone'] = zone
			})
			localReselectAllShops(zone, Config.Shops[zone].owner, stockItems, Config.Shops[zone].pItems, balance_shop,
				Config.Shops[zone].store_label, Config.Shops[zone].store_location, Config.Shops[zone].price,
				Config.Shops[zone].expired, Config.Shops[zone].isSales)
			TriggerClientEvent('skd_cSide:forServerNotify', -1, 'success',
				_U('bought', amount, label, ESX.Math.GroupDigits(price)))
		else
			TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('player_cannot_hold'))
		end
	else
		local missingMoney = price - xPlayer.getMoney()
		TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('not_enough', ESX.Math.GroupDigits(missingMoney)))
	end
end)

RegisterServerEvent('skd_shops:freeMoneyIfHaveShops')
AddEventHandler('skd_shops:freeMoneyIfHaveShops', function()
	for i = 1, #Config.Shops, 1 do
		if not Config.Shops[i].isSales then
			local tempBalance = Config.Shops[i].bank_saves + Config.FreeMoney
			MySQL.update('UPDATE shops bank_saves = @bank_saves WHERE id = @zone', {
				['@bank_saves'] = tempBalance,
				['@zone'] = i
			})
			localReselectAllShops(i, Config.Shops[i].owner, Config.Shops[i].items, Config.Shops[i].pItems, tempBalance,
				Config.Shops[i].store_label, Config.Shops[i].store_location, Config.Shops[i].price,
				Config.Shops[i].expired, Config.Shops[i].isSales)
			TriggerClientEvent('skd_cSide:forServerNotify', -1, 'iniform', _U('free_money_for_have_shops'))
		end
	end
end)

ESX.RegisterServerCallback('skd_shops:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({
		items = items
	})
end)

ESX.RegisterServerCallback('skd_shops:OpenShopInventoryMenu', function(source, cb, zone)
	local iShopsNow = Config.Shops[zone].items
	local pShopsNow = Config.Shops[zone].pItems
	local sItems = {}
	if iShopsNow ~= nil and iShopsNow ~= '[]' and iShopsNow ~= '' and iShopsNow ~= ' ' and iShopsNow ~= 'null' then
		for k, price in pairs(pShopsNow) do
			for k1, v1 in pairs(iShopsNow) do
				if k == k1 then
					--local itemLabel = ESX.GetItemLabel(k)
					sItems[k1] = {
						itemLabel = ESX.GetItemLabel(k1),
						nameItems = k1,
						stock = v1,
						itemPrice = price
					}
				end
			end
		end
		cb(sItems)
	else
		TriggerClientEvent('skd_cSide:forServerNotify', -1, 'error', _U('shop_inventory_empty'))
	end
end)


ESX.RegisterServerCallback('skd_shops:setPriceItems', function(source, cb, zone)
	local iShopsNow = Config.Shops[zone].pItems
	local sItems = {}
	for k, v in pairs(iShopsNow) do
		--local itemLabel = ESX.GetItemLabel(k)
		sItems[k] = {
			itemLabel = ESX.GetItemLabel(k),
			stock = v
		}
	end
	cb(sItems)
end)

function reSelectAllShops()
	MySQL.Async.fetchAll('SELECT * FROM shops', {}, function(allShops)
		for i = 1, #allShops, 1 do
			local shop = allShops[i]
			local sales = true

			if shop.isSales == 0 then
				sales = true
			else
				sales = false
			end

			Config.Shops[shop.id] = {
				idShop = shop.id,
				owner = json.decode(shop.owner),
				items = json.decode(shop.inventory),
				pItems = json.decode(shop.price_items),
				bank_saves = shop.bank_saves,
				store_label = shop.store_label,
				store_location = json.decode(shop.store_location),
				price = shop.price,
				expired = shop.expired,
				isSales = sales
			}
		end
	end)
	TriggerClientEvent('skd_shops:sendShops', -1, Config.Shops)
	print("Refresh Shops")
end

function localReselectAllShops(zone, owner, items, pItems, bank_saves, store_label, store_location, price, expired,
							   isSales)
	Config.Shops[zone] = {
		idShop = zone,
		owner = owner,
		items = items,
		pItems = pItems,
		bank_saves = bank_saves,
		store_label = store_label,
		store_location = store_location,
		price = price,
		expired = expired,
		isSales = sales
	}
	TriggerClientEvent('skd_shops:sendShops', -1, Config.Shops)
	print("Refresh Local Shops")
end
