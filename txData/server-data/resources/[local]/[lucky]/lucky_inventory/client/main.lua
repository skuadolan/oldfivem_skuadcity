ESX = nil

local AnimTrunk = false
local isInInventory = false
local fastWeapons = {
	[1] = nil,
	[2] = nil,
	[3] = nil
}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

--[[Citizen.CreateThread(function ()
        while true do
            Citizen.Wait(30)
            if IsControlJustPressed(0, Config.Keys['F2']) and IsInputDisabled(0) then
                openInventory()
            end
        end
end)]]

RegisterCommand('openBackPack', function()
	if not isDead and IsInputDisabled(0) then
		openInventory()
	end
end, false)

RegisterKeyMapping('openBackPack', 'open Backpack menu', 'keyboard', 'F1')

function openInventory()
    loadPlayerInventory()
    isInInventory = true
    SendNUIMessage(
        {
            action = "display",
            type = "normal"
        }
    )
    SetNuiFocus(true, true)
end

function closeInventory()
    if AnimTrunk then
        AnimTrunk = false
        ClearPedTasksImmediately(GetPlayerPed(-1))
        ClearPedTasks(GetPlayerPed(-1))
    end
    isInInventory = false
    SendNUIMessage(
        {
            action = "hide"
        }
    )
    SetNuiFocus(false, false)
end


RegisterNUICallback(
    "NUIFocusOff",
    function()
        closeInventory()
    end
)

RegisterNetEvent("lucky_inventory:AnimTrunk")
AddEventHandler("lucky_inventory:AnimTrunk" , function(data)
    AnimTrunk = true
    if AnimTrunk then

        local lib, anim = 'mini@repair', 'fixing_a_ped'
        while AnimTrunk do
            ESX.Streaming.RequestAnimDict(lib, function()
                TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
            end)
            Citizen.Wait(3000)
        end

    end
end)

function AnimationGive(target)
    if not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and not IsPedSittingInAnyVehicle(GetPlayerPed(GetPlayerFromServerId(target))) then
        TriggerServerEvent("ServerValidEmote", target, 'give', 'give')
    end
end

RegisterNUICallback("GetNearPlayers", function(data, cb)
	local playerPed = PlayerPedId()
	local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
	local foundPlayers = false
	local elements = {}

	for i = 1, #players, 1 do
		if players[i] ~= PlayerId() then
			foundPlayers = true

			table.insert(
				elements,
                    {
                        label = "No ID : ",
                        player = GetPlayerServerId(players[i])
                    }
                )
        end
    end

    if not foundPlayers then
            exports['mythic_notify']:SendAlert('error', 'Tidak ada orang di sekitar!')
        else
            SendNUIMessage(
                {
                    action = "nearPlayers",
                    foundAny = foundPlayers,
                    players = elements,
                    item = data.item
                }
            )
        end

        cb("ok")
    end)

RegisterNUICallback(
    "UseItem",
    function(data, cb)
        TriggerServerEvent("esx:useItem", data.item.name)
        data.item.msg = "Removed (1)"
            TriggerEvent('lucky_inventory:showItemUse', {
            data.item
        })
        if shouldCloseInventory(data.item.name) then
            closeInventory()
        else
            Citizen.Wait(250)
            loadPlayerInventory()
        end

        cb("ok")
    end
)

RegisterNUICallback(
    "DropItem",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            TriggerServerEvent("esx:removeInventoryItem", data.item.type, data.item.name, data.number)
        end

        Wait(250)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "GiveItem",
    function(data, cb)
        local playerPed = PlayerPedId()
        local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
        local foundPlayer = false
        for i = 1, #players, 1 do
            if players[i] ~= PlayerId() then
                if GetPlayerServerId(players[i]) == data.player then
                    foundPlayer = true
                end
            end
        end

        if foundPlayer then
            local count = tonumber(data.number)

            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end
            AnimationGive(data.player)
            TriggerServerEvent("esx:giveInventoryItem", data.player, data.item.type, data.item.name, count)
            data.item.msg = "Received (1)"
                TriggerEvent('lucky_inventory:showItemUse', {
                data.item
            })
            Wait(250)
            loadPlayerInventory()
        else
            exports['mythic_notify']:SendAlert('error', 'Tidak ada orang di sekitar!')
        end
        cb("ok")
    end
)

function shouldCloseInventory(itemName)
    for index, value in ipairs(Config.CloseUiItems) do
        if value == itemName then
            return true
        end
    end

    return false
end

RegisterNetEvent('lucky_inventory:refreshInventory')
AddEventHandler('lucky_inventory:refreshInventory', function()
    if isInInventory then
        loadPlayerInventory()
    end
end)

function shouldSkipAccount(accountName)
    for index, value in ipairs(Config.ExcludeAccountsList) do
        if value == accountName then
            return true
        end
    end

    return false
end

--local arrayWeight = Config.localWeight
function getInventoryWeight(inventory)
    local weight = 0
    local itemWeight = 0
    if inventory ~= nil then
      for i = 1, #inventory, 1 do
        if inventory[i] ~= nil then
          itemWeight = Config.DefaultWeight
          if arrayWeight[inventory[i].name] ~= nil then
            itemWeight = arrayWeight[inventory[i].name]
          end
          weight = weight + (itemWeight * (inventory[i].count or 1))
        end
      end
    end
    return weight
  end

function loadPlayerInventory()
    ESX.TriggerServerCallback(
        "lucky_inventory:getPlayerInventory",
        function(data)
            items = {}
            fastItems = {}
            inventory = data.inventory
            accounts = data.accounts
            money = data.money
            weapons = data.weapons

            if Config.IncludeCash and money ~= nil and money > 0 then
                moneyData = {
                    label = _U("cash"),
                    name = "cash",
                    type = "item_money",
                    count = money,
                    usable = false,
                    rare = false,
                    limit = -1,
                    canRemove = true
                }

                table.insert(items, moneyData)
            end

            if Config.IncludeAccounts and accounts ~= nil then
                for key, value in pairs(accounts) do
                    if not shouldSkipAccount(accounts[key].name) then
                        local canDrop = accounts[key].name ~= "bank"

                        if accounts[key].money > 0 then
                            accountData = {
                                label = accounts[key].label,
                                count = accounts[key].money,
                                type = "item_account",
                                name = accounts[key].name,
                                usable = false,
                                rare = false,
                                limit = -1,
                                canRemove = canDrop
                            }
                            table.insert(items, accountData)
                        end
                    end
                end
            end

            if inventory ~= nil then
                
                for key, value in pairs(inventory) do
                    local fnd = false
                    for slot, inv in pairs(fastWeapons) do
                        if inv == inventory[key].name then
                            inventory[key].type = "item_standard"
                            inventory[key].slot = slot
                            table.insert(fastItems, inventory[key])
                            fnd = true
                            break
                            -- print("fAST SLOT"..inventory[key].name)
                        end
                    end
                    if fnd == false then
                        if inventory[key].count <= 0 then
                            inventory[key] = nil
                        else
                            print("Inventory"..inventory[key].name)
                            inventory[key].type = "item_standard"
                            table.insert(items, inventory[key])
                        end
                    end
                end
            end

            if Config.IncludeWeapons and weapons ~= nil then
                for key, value in pairs(weapons) do
                    local weaponHash = GetHashKey(weapons[key].name)
                    local playerPed = PlayerPedId()
                    if HasPedGotWeapon(playerPed, weaponHash, false) and weapons[key].name ~= "WEAPON_UNARMED" then
							local found = false
							for slot, weapon in pairs(fastWeapons) do
								if weapon == weapons[key].name then
									local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
									table.insert(
										fastItems,
										{
											label = weapons[key].label,
											count = ammo,
											limit = -1,
											type = "item_weapon",
											name = weapons[key].name,
											usable = false,
											rare = false,
											canRemove = true,
											slot = slot
										}
									)
									found = true
                                    break
								end
							end
							if found == false then
								local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
								table.insert(
									items,
									{
										label = weapons[key].label,
										count = ammo,
										limit = -1,
										type = "item_weapon",
										name = weapons[key].name,
										usable = false,
										rare = false,
										canRemove = true
									}
								)
							end
                    end
                end
            end

            local arrayWeight = Config.localWeight
			local weight = 0
			local itemWeight = 0
			local itemsW = 0
			if items ~= nil then
			for i = 1, #items, 1 do
				if items[i] ~= nil then
				  itemWeight = Config.DefaultWeight
				  itemWeight = itemWeight / items[1].count * 0.0
				if arrayWeight[items[i].name] ~= nil then
				  itemWeight = arrayWeight[items[i].name]
				  items[i].limit = itemWeight / 1000
				end
				  weight = weight + (itemWeight * (items[i].count or 1))
				end
		      end
			end
			
			local texts =  _U("player_info", (weight / 1000), (Config.Limit / 1000))
			
            if weight > Config.Limit then
                TriggerEvent("DoShortHudText","Inventory Full, can't walk")
			    setHurt()
			   texts = _U("player_info_full", (weight / 1000), (Config.Limit / 1000))
			elseif weight <= Config.Limit then
			   setNotHurt()
			   texts =  _U("player_info", (weight / 1000), (Config.Limit / 1000))
			end

            SendNUIMessage(
                {
                    action = "setItems",
                    itemList = items,
                    fastItems = fastItems,
                    text = texts
                }
            )
        end,
        GetPlayerServerId(PlayerId())
    )
end

function setHurt()
    FreezeEntityPosition(GetPlayerPed(-1), true)
end
			 
function setNotHurt()
	 FreezeEntityPosition(GetPlayerPed(-1), false)
end

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1)
        if isInInventory then
            local playerPed = PlayerPedId()
            DisableControlAction(0, 1, true) -- Disable pan
            DisableControlAction(0, 2, true) -- Disable tilt
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 263, true) -- Melee Attack 1
            DisableControlAction(0, Config.Keys["W"], true) -- W
            DisableControlAction(0, Config.Keys["A"], true) -- A
            DisableControlAction(0, 31, true) -- S (fault in Keys table!)
            DisableControlAction(0, 30, true) -- D (fault in Keys table!)

            DisableControlAction(0, Config.Keys["R"], true) -- Reload
            DisableControlAction(0, Config.Keys["SPACE"], true) -- Jump
            DisableControlAction(0, Config.Keys["Q"], true) -- Cover
            DisableControlAction(0, Config.Keys["TAB"], true) -- Select Weapon
            DisableControlAction(0, Config.Keys["F"], true) -- Also 'enter'?

            DisableControlAction(0, Config.Keys["F1"], true) -- Disable phone
            DisableControlAction(0, Config.Keys["F2"], true) -- Inventory
            DisableControlAction(0, Config.Keys["F3"], true) -- Animations
            DisableControlAction(0, Config.Keys["F6"], true) -- Job

            DisableControlAction(0, Config.Keys["V"], true) -- Disable changing view
            DisableControlAction(0, Config.Keys["C"], true) -- Disable looking behind
            DisableControlAction(0, Config.Keys["X"], true) -- Disable clearing animation
            DisableControlAction(2, Config.Keys["P"], true) -- Disable pause screen

            DisableControlAction(0, 59, true) -- Disable steering in vehicle
            DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
            DisableControlAction(0, 72, true) -- Disable reversing in vehicle

            DisableControlAction(2, Config.Keys["LEFTCTRL"], true) -- Disable going stealth

            DisableControlAction(0, 47, true) -- Disable weapon
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
            DisableControlAction(0, 75, true) -- Disable exit vehicle
            DisableControlAction(27, 75, true) -- Disable exit vehicle
        end
    end
end)

-- HIDE WEAPON WHEEL
Citizen.CreateThread(function ()
	Citizen.Wait(2000)
	while true do
		Citizen.Wait(0)
		HideHudComponentThisFrame(19)
		HideHudComponentThisFrame(20)
		BlockWeaponWheelThisFrame()
		DisableControlAction(0, 37,true)
	end
end)

--FAST ITEMS
RegisterNUICallback("PutIntoFast", function(data, cb)
    print(data.slot)
    print(data.item.name)
	if data.item.slot ~= nil then
		fastWeapons[data.item.slot] = nil
	end
		fastWeapons[data.slot] = data.item.name
		TriggerServerEvent("lucky_inventory:changeFastItem",data.slot,data.item.name)
		loadPlayerInventory()
		cb("ok")
end)

RegisterNUICallback("TakeFromFast", function(data, cb)
	fastWeapons[data.item.slot] = nil
	TriggerServerEvent("lucky_inventory:changeFastItem",0,data.item.name)
	loadPlayerInventory()
	cb("ok")
end)

Citizen.CreateThread(function()
		while true do
            Citizen.Wait(30)
            if IsDisabledControlJustReleased(1, Config.Keys['1']) then
                if fastWeapons[1] ~= nil then
                    if string.find(fastWeapons[1],"WEAPON_") then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[1]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
                            TriggerEvent('lucky_inventory:refreshWeapon')
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[1],true)
                            TriggerEvent('lucky_inventory:refreshWeapon')
                        end
                    else
                        TriggerServerEvent("esx:useItem", fastWeapons[1])
                        Citizen.Wait(250)
                        loadPlayerInventory()
                    end
				end
            end
			if IsDisabledControlJustReleased(1, Config.Keys['2']) then
                if fastWeapons[2] ~= nil then
                    if string.find(fastWeapons[2],"WEAPON_") then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[2]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
                            TriggerEvent('lucky_inventory:refreshWeapon')
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[2],true)
                            TriggerEvent('lucky_inventory:refreshWeapon')
                        end
                    else
                        TriggerServerEvent("esx:useItem", fastWeapons[2])
                        Citizen.Wait(250)
                        loadPlayerInventory()
                    end
					
				end
            end
			if IsDisabledControlJustReleased(1, Config.Keys['3']) then
                if fastWeapons[3] ~= nil then
                    if string.find(fastWeapons[3],"WEAPON_") then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[3]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
                            TriggerEvent('lucky_inventory:refreshWeapon')
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[3],true)
                            TriggerEvent('lucky_inventory:refreshWeapon')
                        end
                    else
                        TriggerServerEvent("esx:useItem", fastWeapons[3])
                        Citizen.Wait(250)
                        loadPlayerInventory()
                    end
				end
            end
            if IsDisabledControlJustReleased(1, Config.Keys['4']) then
                if fastWeapons[4] ~= nil then
                    if string.find(fastWeapons[4],"WEAPON_") then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[4]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
                            TriggerEvent('lucky_inventory:refreshWeapon')
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[4],true)
                            TriggerEvent('lucky_inventory:refreshWeapon')
                        end
                    else
                        TriggerServerEvent("esx:useItem", fastWeapons[4])
                        Citizen.Wait(250)
                        loadPlayerInventory()
                    end
					
				end
            end
            if IsDisabledControlJustReleased(1, Config.Keys['5']) then
                if fastWeapons[5] ~= nil then
                    if string.find(fastWeapons[5],"WEAPON_") then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[5]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
                            TriggerEvent('lucky_inventory:refreshWeapon')
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[5],true)
                            TriggerEvent('lucky_inventory:refreshWeapon')
                        end
                    else
                        TriggerServerEvent("esx:useItem", fastWeapons[5])
                        Citizen.Wait(250)
                        loadPlayerInventory()
                    end
					
				end
            end
        end
end)



RegisterNetEvent('lucky_inventory:showItemUse')
AddEventHandler('lucky_inventory:showItemUse', function(items)
    local data = {}
    for k, v in pairs(items) do
        table.insert(data, {
            item = {
                label = v.label,
                name = v.name,
                itemId = v.id
            },
            message = v.msg
        })
    end
    SendNUIMessage({
        action = 'itemUsed',
        alerts = data
    })
end)
