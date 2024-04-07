ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(10000)
		CreateBlips()
    end
end)

RegisterNetEvent('skd_shops:sendShops')
AddEventHandler('skd_shops:sendShops', function (getShops)
	Config.Shops = getShops
	CreateBlips()
end)

local Blips = {}
function CreateBlips()
	CreateThread(function()
		for i=1, #Config.Shops do
			local allShops = Config.Shops[i]
			local coordsShops = vector3(allShops.store_location.x, allShops.store_location.y, allShops.store_location.z)
			if allShops then
				if DoesBlipExist(Blips[allShops.idShop]) then
					RemoveBlip(Blips[allShops.idShop])
				end
				Blips[allShops.idShop] =  AddBlipForCoord(coordsShops) -- ganti x, y, dan z dengan koordinat yang diinginkan
				if allShops.isSales then
					SetBlipSprite(Blips[allShops.idShop], Config.Blips.Sprite) -- mengatur sprite blip (1 adalah sprite default)
					SetBlipDisplay(Blips[allShops.idShop], 4) -- mengatur tampilan blip (4 adalah tampilan default)
					SetBlipScale(Blips[allShops.idShop], Config.Blips.Scale) -- mengatur skala blip (1.0 adalah skala default)
					--SetBlipColour(Blips[allShops.idShop], Config.Blips.Color) -- mengatur warna blip (1 adalah warna default)
					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString(_U('shop_sale')) -- ganti "Nama Blip" dengan nama yang diinginkan
					EndTextCommandSetBlipName(Blips[allShops.idShop])
				else
					SetBlipSprite(Blips[allShops.idShop], Config.Blips.Sprite) -- mengatur sprite blip (1 adalah sprite default)
					SetBlipDisplay(Blips[allShops.idShop], 4) -- mengatur tampilan blip (4 adalah tampilan default)
					SetBlipScale(Blips[allShops.idShop], Config.Blips.Scale) -- mengatur skala blip (1.0 adalah skala default)
					SetBlipColour(Blips[allShops.idShop], Config.Blips.Color) -- mengatur warna blip (1 adalah warna default)
					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString(allShops.store_label) -- ganti "Nama Blip" dengan nama yang diinginkan
					EndTextCommandSetBlipName(Blips[allShops.idShop])
				end
			end
		end
	end)
end

local hasAlreadyEnteredMarker, lastZone
local currentAction, currentActionMsg, currentActionData = nil, nil, {}
AddEventHandler('skd_shops:hasEnteredMarker', function(zone)
	currentAction     = 'shop_menu'
	currentActionMsg  = _U('press_menu')
	currentActionData = {zone = zone}
end)

AddEventHandler('skd_shops:hasExitedMarker', function(zone)
	currentAction = nil
	ESX.UI.Menu.CloseAll()
end)

function openShopMenu(zone)
	ESX.UI.Menu.CloseAll()
	local allShops = Config.Shops[zone]
	local elements = {}
	if allShops.isSales then
		local convrtPrice = tostring(allShops.price)
		local fixedPrice = 'nil'
		if string.len(convrtPrice) == 7 then
			local tempPrice = string.sub(convrtPrice, 1, 1)
			fixedPrice = tempPrice..'Jt'
		else
			fixedPrice = allShops.price
		end
		ESX.UI.Menu.CloseAll()
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
				title    = allShops.store_label..' - Rp.'..fixedPrice,
				align    = 'bottom-right',
				elements = {
					{label = _U('beli_toko'), value = 'beli_toko'},
					{label = _U('batal'),  value = 'batal'}
				}
			}, function(data, menu)
				if data.current.value == 'beli_toko' then
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'beli_toko', {
						title    = _U('beli_toko'),
						align    = 'bottom-right',
						elements = {
							{label = _U('yes'), value = 'yes'},
							{label = _U('no'),  value = 'no'}
					}}, function(data2, menu2)
						if data2.current.value == 'yes' then
							local inputText = nil -- Mengatur inputText ke nil untuk memulai dari awal
							DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 128+1)
							
							while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
								Citizen.Wait(0)
							end
							
							if UpdateOnscreenKeyboard() ~= 2 then
								inputText = GetOnscreenKeyboardResult()
								TriggerServerEvent('skd_shops:buyShopsProperty', inputText, zone) --newName store label
							else
								inputText = nil
								exports['mythic_notify']:SendAlert('error', _U('batal_beli_toko'))
							end
						end
						menu2.close()
					end, function(data2, menu2)
						menu2.close()
					end)
				end
				menu.close()
			end, function(data, menu)
				menu.close()
		
				currentAction     = 'shop_menu'
				currentActionMsg  = _U('press_menu')
				currentActionData = {zone = zone}
		end)
	else
		ESX.TriggerServerCallback('skd_shops:checkOwnerIdentifier', function(isOwner)
			if isOwner then
				openOwnerMenu(zone, allShops)
			else
				openCustomerMenu(zone, allShops)
			end
		end, allShops.owner.identifier)
	end
end

function openCustomerMenu(zone, allShops)
	ESX.TriggerServerCallback('skd_shops:OpenShopInventoryMenu', function(iShops)
		local elements = {}
		for k, v in pairs(iShops) do
			local sItems = v.stock
			local nItems = v.nameItems
			local lItems = v.itemLabel
			local pItems = v.itemPrice

			table.insert(elements, {
				label      = ('%s - <span style="color:green;">%s</span>'):format(lItems, _U('shop_item', ESX.Math.GroupDigits(pItems))),
				itemLabel = lItems,
				item       = nItems,
				price      = pItems,
	
				-- menu properties
				value      = 1,
				type       = 'slider',
				min        = 1,
				max        = sItems
			})
		end

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
			title    = _U('shops_inventory'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
				title    = _U('item_confirm', data.current.value, data.current.itemLabel, ESX.Math.GroupDigits(data.current.price * data.current.value)),
				align    = 'bottom-right',
				elements = {
					{label = _U('no'),  value = 'no'},
					{label = _U('yes'), value = 'yes'}
			}}, function(data2, menu2)
				if data2.current.value == 'yes' then
					TriggerServerEvent('skd_shops:buyItem', data.current.item, data.current.price, data.current.value, zone)
				end

				menu2.close()
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()

			currentAction     = 'shop_menu'
			currentActionMsg  = _U('press_menu')
			currentActionData = {zone = zone}
		end)
	end, zone)
end

function openOwnerMenu(zone, allShops)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
		title    = allShops.store_label,
		align    = 'bottom-right',
		elements = {
			{label = _U('ganti_nama_toko'), value = 'ganti_nama_toko'},
			{label = _U('deposit_barang_jualan'), value = 'deposit_barang'},
			{label = _U('ambil_barang_jualan'), value = 'ambil_barang'},
			{label = _U('price_items'), value = 'price_items'},
			{label = _U('brangkas_toko'), value = 'brangkas_toko'},
			{label = _U('jual_toko'), value = 'jual_toko'},
			{label = _U('berikan_toko'), value = 'berikan_toko'},
			{label = _U('batal'), value = 'batal'},
		}
		}, function(data, menu)
			if data.current.value == 'ganti_nama_toko' then
				changeShopName(zone, allShops)
			elseif data.current.value == 'deposit_barang' then
				OpenPlayerInventoryMenu(zone, allShops)
			elseif data.current.value == 'ambil_barang' then
				OpenShopInventoryMenu(zone, allShops)
			elseif data.current.value == 'price_items' then
				openPriceItemsMenu(zone, allShops)
			elseif data.current.value == 'brangkas_toko' then
				openBrangkasMenu(zone, allShops)
			elseif data.current.value == 'jual_toko' then
				openResellOwnedShops(zone, allShops)
			elseif data.current.value == 'berikan_toko' then
			end
			menu.close()
		end, function(data, menu)
			menu.close()
	end)
end

function changeShopName (zone, allShops)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_name', {
		title = _U('nama_baru_toko')
	}, function(data2, menu2)
		local inputText = data2.value

		if inputText == nil or inputText == '' or inputText == ' ' then
			exports['mythic_notify']:SendAlert('error', _U('invalid_input'))
		else
			TriggerServerEvent('skd_shops:updateShopName', inputText, zone) --newName store label
			ESX.SetTimeout(1000, function()
				openOwnerMenu(zone, allShops)
			end)
		end
		menu2.close()
	end, function(data2, menu2)
		menu2.close()
		ESX.SetTimeout(300, function()
			openOwnerMenu(zone, allShops)
		end)
	end)
end

function OpenPlayerInventoryMenu(zone, allShops)
	ESX.TriggerServerCallback('skd_shops:getPlayerInventory', function(inventory)
		local elements = {}
		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type  = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_inventory', {
			title    = _U('tas'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count', {
				title = _U('amount')
			}, function(data2, menu2)
				local quantity = tonumber(data2.value)

				if quantity == nil then
					exports['mythic_notify']:SendAlert('error', _U('invalid_input'))
				else
					TriggerServerEvent('skd_shops:putItem', zone, data.current.type, data.current.value, tonumber(data2.value))
				end
				menu2.close()
				menu.close()
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenShopInventoryMenu(zone, allShops)
	ESX.TriggerServerCallback('skd_shops:OpenShopInventoryMenu', function(iShops)
		local elements = {}
		for k, v in pairs(iShops) do
			local sItems = v.stock
			local lItems = v.itemLabel

			table.insert(elements, {
				label = lItems .. ' x' .. sItems,
				type  = 'item_standard',
				value = k
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_inventory', {
			title    = _U('shops_inventory'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count', {
				title = _U('amount')
			}, function(data2, menu2)
				local quantity = tonumber(data2.value)

				if quantity == nil then
					exports['mythic_notify']:SendAlert('error', _U('invalid_input'))
				else
					TriggerServerEvent('skd_shops:getItem', zone, data.current.type, data.current.value, tonumber(data2.value))
				end
				menu2.close()
				menu.close()
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end, zone)
end

function openPriceItemsMenu(zone, allShops)
	ESX.TriggerServerCallback('skd_shops:setPriceItems', function(iShops)
		local elements = {}
		for k, v in pairs(iShops) do
			local sItems = v.stock
			local lItems = v.itemLabel

			table.insert(elements, {
				label = lItems .. ' Rp. ' .. sItems,
				type  = 'item_standard',
				value = k
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'price_items', {
			title    = _U('price_items'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_price', {
				title = _U('set_price_items')
			}, function(data2, menu2)
				local price = tonumber(data2.value)

				if price == nil then
					exports['mythic_notify']:SendAlert('error', _U('invalid_input'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('skd_shops:setPriceItem', zone, data.current.type, data.current.value, tonumber(data2.value))
					ESX.SetTimeout(300, function()
						openOwnerMenu(zone, allShops)
					end)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end, zone)
end

function openBrangkasMenu(zone, allShops)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'shop_balance', {
		title = _U('brangkas_uang')..allShops.bank_saves
	}, function(data, menu)
		local price = tonumber(data.value)

		if price <= allShops.bank_saves and (price ~= 0 or price ~= nil) then
			TriggerServerEvent('skd_shops:withdrawnBalance', zone, tonumber(data.value))
		else
			exports['mythic_notify']:SendAlert('error', _U('invalid_input'))
		end
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

function openResellOwnedShops(zone, allShops)
	local realShopPrice = Config.Shops[zone].price
	local balance_shop = Config.Shops[zone].bank_saves
	local resellPrice = ESX.Math.Round(realShopPrice / 100 * Config.ResellPercentage)
	local allMoney = balance_shop + resellPrice
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_balance', {
		title    = _U('resell_owned_shops', allMoney),
		align    = 'bottom-right',
		elements = {
			{label = _U('yes'), value = 'yes'},
			{label = _U('no'), value = 'no'}
		}
		
		}, function(data, menu)
			if data.current.value == 'yes' then
				TriggerServerEvent('skd_shops:resellOwnedShop', zone)
			end
			menu.close()
		end, function(data, menu)
			menu.close()
	end)
end

CreateThread(function()
	while true do
		local Sleep = 1500

		if currentAction then
			Sleep = 0
			ESX.ShowHelpNotification(currentActionMsg)

			if IsControlJustReleased(0, 38) and currentAction == 'shop_menu' then
				currentAction = nil
				openShopMenu(currentActionData.zone)
			end
		end

		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, currentZone = false

		for k,v in pairs(Config.Shops) do
			local allShops = Config.Shops[k]
			local coordsShops = vector3(allShops.store_location.x, allShops.store_location.y, allShops.store_location.z)
			local distance = #(playerCoords - coordsShops)

			if distance < Config.DrawDistance then
				Sleep = 0
				DrawMarker(Config.MarkerType, coordsShops, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
				if distance < Config.DrawDistance then
					isInMarker  = true
					currentZone = k
					lastZone    = k
				end
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('skd_shops:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('skd_shops:hasExitedMarker', lastZone)
		end
	Wait(Sleep)
	end
end)