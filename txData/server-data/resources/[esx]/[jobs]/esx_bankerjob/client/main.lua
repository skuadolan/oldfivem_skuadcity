local CurrentActionData, CurrentAction, CurrentActionMsg, hasAlreadyEnteredMarker, lastZone = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function (xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function (job)
	ESX.PlayerData.job = job

	if ESX.PlayerData.job.name == 'banker' then
		RegisterKeyMapping('bankerMenu', 'Open Banker Menu', 'keyboard', 'F2')
	end
end)

function OpenBankActionsMenu(tempopen)
	local elements = {
		{label = _U('customers'), value = 'customers'},
		{label = _U('freeProperties'), value = 'freeProperties'},
		{label = _U('billing'),   value = 'billing'}
	}

	if ESX.PlayerData.job.grade_name == 'boss' then
		table.insert(elements, { label = _U('boss_actions'), value = 'boss_actions' })
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'bank_actions', {
		title    = _U('bank'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'customers' then
			OpenCustomersMenu()
		elseif data.current.value == 'freeProperties' then
			freeProperties(tempopen)
		elseif data.current.value == 'billing' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
				title = _U('bill_amount')
			}, function(data, menu)
					
			local amount = tonumber(data.value)
			if amount == nil then
				exports['mythic_notify']:SendAlert('error', _U('amount_invalid'))
				--ESX.ShowNotification(_U('amount_invalid'))
			else
				menu.close()
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer == -1 or closestDistance > 2.0 then
					exports['mythic_notify']:SendAlert('error', _U('no_player_nearby'))
					--ESX.ShowNotification(_U('no_players'))
				else
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_banker', 'Banker', amount)
					TriggerServerEvent("esx:bankerjob", GetPlayerName(closestPlayer), amount)
					exports['mythic_notify']:SendAlert('inform', _U('billing_sent'))
					--ESX.ShowNotification(_U('billing_sent'))
				end
			end	
			end, function(data, menu)
				menu.close()
			end)
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBossMenu', 'banker', function (data, menu)
			menu.close()
			end, {wash = false})
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'bank_actions_menu'
		CurrentActionMsg  = _U('press_input_context_to_open_menu')
		CurrentActionData = {}
	end)
end

function OpenCustomersMenu()
	ESX.TriggerServerCallback('esx_bankerjob:getCustomers', function(customers)
		local elements = {
			head = { _U('customer'), _U('balance'), _U('actions') },
			rows = {}
		}

		for i=1, #customers do
			table.insert(elements.rows, {
				data = customers[i],
				cols = {
					customers[i].name,
					customers[i].bankSavings,
					'{{' .. _U('deposit') .. '|deposit}} {{' .. _U('withdraw') .. '|withdraw}}'
				}
			})
		end

		ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'customers', elements, function(data, menu)
			local customer = data.data

			if data.value == 'deposit' then
				menu.close()

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'customer_deposit_amount', {
					title = _U('amount')
				}, function(data2, menu2)
					local amount = tonumber(data2.value)

					if amount == nil then
						exports['mythic_notify']:SendAlert('error', _U('invalid_amounts'))
						--ESX.ShowNotification(_U('invalid_amount'))
					else
						menu2.close()
						TriggerServerEvent('esx_bankerjob:customerDeposit', customer.source, amount)
						OpenCustomersMenu()
					end
				end, function(data2, menu2)
					menu2.close()
					OpenCustomersMenu()
				end)
			elseif data.value == 'withdraw' then
				menu.close()

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'customer_withdraw_amount', {
					title = _U('amount')
				}, function(data2, menu2)
					local amount = tonumber(data2.value)

					if amount == nil then
						exports['mythic_notify']:SendAlert('error', _U('invalid_amounts'))
						--ESX.ShowNotification(_U('invalid_amount'))
					else
						menu2.close()
						TriggerServerEvent('esx_bankerjob:customerWithdraw', customer.source, amount)
						OpenCustomersMenu()
					end
				end, function(data2, menu2)
					menu2.close()
					OpenCustomersMenu()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

AddEventHandler('esx_bankerjob:hasEnteredMarker', function (zone)
	if zone == 'BankActions' and ESX.PlayerData.job and ESX.PlayerData.job.name == 'banker' then
		CurrentAction     = 'bank_actions_menu'
		CurrentActionMsg  = _U('press_input_context_to_open_menu')
		CurrentActionData = {}
	end
end)

AddEventHandler('esx_bankerjob:hasExitedMarker', function (zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Create Blips
--[[CreateThread(function()
	local blip = AddBlipForCoord(Config.Zones.BankActions.Coords)

	SetBlipSprite(blip, 108)
	SetBlipColour(blip, 30)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(_U('bank'))
	EndTextCommandSetBlipName(blip)
end)]]

-- Draw marker & activate menu when player is inside marker
--[[CreateThread(function()
	while true do
		Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'banker' then
			local playerCoords = GetEntityCoords(PlayerPedId())
			local isInMarker, letSleep, currentZone = false, true

			for k,v in pairs(Config.Zones) do
				local distance = #(playerCoords - v.Coords)

				if v.Type ~= -1 and distance < Config.DrawDistance then
					letSleep = false
					DrawMarker(v.Type, v.Coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, nil, nil, false)
				end

				if distance < v.Size.x then
					isInMarker, currentZone, letSleep = true, k, false
				end
			end

			if isInMarker and not hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker, lastZone = true, currentZone
				TriggerEvent('esx_bankerjob:hasEnteredMarker', currentZone)
			end

			if not isInMarker and hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = false
				TriggerEvent('esx_bankerjob:hasExitedMarker', lastZone)
			end

			if letSleep then
				Wait(500)
			end
		else
			Wait(500)
		end
	end
end)]]

-- Key Controls
--[[CreateThread(function()
	while true do
		Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustPressed(0, Config.Keys['F1']) and ESX.PlayerData.job and ESX.PlayerData.job.name == 'banker' then
				if CurrentAction == 'bank_actions_menu' then
					
				end
				OpenBankActionsMenu()
			end
		else
			Wait(500)
		end
	end
end)]]

RegisterNetEvent('esx_bankerjob:sendProperties')
AddEventHandler('esx_bankerjob:sendProperties', function(properties)
	Config.Properties = properties
end)

local open = false
function freeProperties(tempopen)
	ESX.UI.Menu.CloseAll()
	ESX.TriggerServerCallback('esx_bankerjob:getFreeProperties', function(hasProp, isEmpty)
		local haveFreeProperties = {}
		for i=1, #hasProp, 1 do
			table.insert(haveFreeProperties, {
				store_label = hasProp[i].store_label,
				store_location = hasProp[i].store_location,
				owner_identifier = hasProp[i].owner_identifier,
				owner_name = hasProp[i].owner_name,
				price = hasProp[i].price,
				expired = hasProp[i].expired,
				isSales = hasProp[i].isSales,
			})
		end

		SendNUIMessage({
			action = tempopen;
			lengthProperties = #hasProp;
			freeProperties = haveFreeProperties;
		})
		
		if tempopen then
			SetNuiFocus(true, true)
		else
			SetNuiFocus(false, false)
		end
	end)
end

RegisterNUICallback('cJobs', function(data, cb)
    -- Clear focus and destroy UI
    open = false
	SendNUIMessage({
		action = open;
	})
	freeProperties(open)
end)

RegisterCommand('bankerMenu', function()
	if ESX.PlayerData.job.name == 'banker' and not isDead then
		local tempopen = not open
		OpenBankActionsMenu(tempopen)
	end
	--[[if not isDead then
		open = not open
		OpenBankerMenu(open)
	end]]
end, false)



RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function (phoneNumber, contacts)
	local specialContact = {
		name       = _U('phone_label'),
		number     = 'banker',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAMAAAD04JH5AAAABGdBTUEAALGPC/xhBQAAAwBQTFRFAAAAJUO2JUS4JkW7Jka+L0y5M0+7O1e9J0fBKEjEKEnHKUrJKUvMKk3PK07SK0/VLFHaLVLeLVPgLlTjOl7kO1/lQFu/RmDBTmbEU2vHXHLIR2jmSGnnVHPoVXToaX7NYX7pYn/qbIHPd4rReYzTbojre5PtfZTuhZbWh5jYiJ7vkqHblqnwl6rxoK3fpLXzsb/1u8Xovsr2ydHty9X419zy5Oj25ur88vT78vT88/X9////AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAATuU7PwAAAQB0Uk5T////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////AFP3ByUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAAYdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjEuNv1OCegAAAUoSURBVHhe5ZvrdtQ2FEZjoCmFltsQ2gYCA4VA06GUhktK3v+5ppK8bUu2jnTk26zV7l+JbH1nR7Y0QglH+zHstpsBb7hWSLHAjnpxttylp0zgKXWSXHCzjgKBxxRQcE4XBVqBc6LV0C+LTqDgh+/Y0TmNRoDAcjRPIi8w6qdvyI9CTiAy4csgRyQjQMoUHhMlkBSYNPodpMVJCdB/OqlBkAXO6D0LZEYQBeg5F+L6LAnQbz7OCO4jCNBrVojuERUoXvh1kB4SE1ioftwgIjDr6x9CBZ+hwGI/v4UaHgOBRetHDAYC3LgYlGnpC3DbcvSX5Z4Ady1Jb+McCnDPslALAoEFJ6AP1WoCAW5YHMo5fAEuL4//GngCM+1/NFDR4glwcRUoaegEuFTEp+vr6298XUS3P2kFRuy/X5rylvd8XwJVPQEu6Dn5Rn3Dc9r0PKVsK1D8BtrR7yh/DtRtBWjWckHhjr+5oobCCNCo5BlFQ95yVUldeJTAVyoOOOEGFXws1gIlb8AHqsX4yj0qXGUEaFLQTD2JgilZTwQnoN6G+VNP4iX35ukEaMgSTj0J9ZQsFRhOPYlP9MjRCKhewfjUk9BNyUaAb5OIU0/iGR1T2EMsncBfpJagmZK1QPb8NTf1JD7QX6YW4BuJE+LGkJuSGgHd1JP4hxQJK5A+f1esPGkeEBTHCvClADHjOb5HUpQVBE6rH4iKsYJAVVU3yIpwlhV4Tg58NnnwhCbLFW0WmuCjayMswv4o/Q5agvfQ5TmuaHHQZvhIi+MJjdUjsgbsj/LbccJqCDQElWgzvKPFcUpjVUmTYX/EFwn8legX8izeEPxGk+UzbYZLmix3SeuhEbC4PKJ8CppvERWyokB8MuxWFIhOhu2qAtVD4jrO1hWohuvyygLVHQJb1haobpLYsLpA/1U8gEC4Lh9CIFiXDyJQ/USs4TAC1W1yDybQrssrr4Q+dfD54QTqybDuh1GP+yZ4zY/jIWZd3h+9oUQamzi/gNmkZHfFYBMXEKiq/73Aq0ML2H+aqc7pbeJSAqohsIn/RYFfDy1QH9FcUCSFTVxMQDMENnF+ge8OLWBqOwHFYblNXE5AMQQ2cXaB77UC3hGJ/y/+L7QZvtBkuaTN4J/cRLCla4G0QXBU2Z1Q/EGL4x2NVXVKi6M+IZJwpRUC70lz0NcQVGoPg6pjWhwvaIziKiOQOKl6O+ms9PKYahFcZQTkISBoPOIgvK4rIyDORGImQL0BdeFGQBwCUiZAvT6/U7gRkN4CUsbjz1Af6rYC0hBMPq4X3kKqegKSATlj+ZOCfSjqC0i/vBvzC6uGq259CKGmoROQp+I9es2H2Qk1eAKywSP6zQYFLb5A4jeoN+g5D9Rz+ALyEGw2d+g7B6yBNYFAyuABvadjN2IdoUByf0r/yVALQoH0H/TdImEaVGroCaQewmbzIxlToE5LXyBt8JCU8TSfQS0DgbTB1BfhFUU6hgIZg9tEjcJbARsiAhmD+4SN4GcK+MQEMgajF+bh+BuiAhmDkQvz4P1zxAVyf1hzl8wSSO4jCOQObsoXZnIHSALZx0CuknD995EFcgYlC3Pw+ReSEMg9Bv1GibwoKYGZ5mNk9fFIC+TOjzTzkSSJjEDu76yyGyVSZLICmeeQno/xtSdAIZBZlqgVQVFeKZB+EMJ8pGcOpYCBchEiGyV3/qRCL5A4ROhtlORlL0KJgIWSfShtSM/6IaUCltjW2W2Uoh/4GcYI1Oy2rcj2XPe/rIfs9/8CuOBqaLBm2ZcAAAAASUVORK5CYII='
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)