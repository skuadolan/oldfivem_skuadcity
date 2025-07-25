local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

isInInventory = false
ESX = nil

local fastWeapons = {
    [1] = nil,
    [2] = nil,
    [3] = nil,
}

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(0)
        end
    end
)

--[[Citizen.CreateThread(function()

    while true do

        Citizen.Wait(0)

        if IsControlJustReleased(0, Config.OpenControl) and IsInputDisabled(0) then

            openInventory()

        end

    end

end)]]

local isPause = false
RegisterCommand('tas', function()
    if IsPauseMenuActive() and not isPause then
        isPause = true;
    elseif not IsPauseMenuActive() and isPause then
        isPause = false;
    end
	if not IsPauseMenuActive() then
		openInventory()
	end
end, false)

RegisterKeyMapping('tas', 'Buka Tas', 'keyboard', 'F1')

function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end

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

RegisterNetEvent("esx_inventoryhud:doClose")
AddEventHandler("esx_inventoryhud:doClose", function()
    closeInventory()
end)

RegisterCommand('ttptas', function(source, args, raw)
    closeInventory()
end)

function closeInventory()
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

function isWeapon(name)
    local oke = nil

    if string.find(name, 'WEAPON_') then 
        oke = true 

    elseif string.find(name, 'GADGET_') then
        oke = true 

    else
        oke = false
    end

    return oke
end

RegisterNUICallback(
    "GetNearPlayers",
    function(data, cb)
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
                            label = "No ID: ",
                            player = GetPlayerServerId(players[i])
                        }
                    )
            end
        end

        if not foundPlayers then
        
            --exports['b1g_notify']:Notify('true', _U("players_nearby"))
            exports['mythic_notify']:SendAlert('inform', _U("players_nearby"))
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
    end
)

RegisterNUICallback("UseItem", function(data, cb)
    TriggerServerEvent("esx:useItem", data.item.name)
    data.item.msg = "USE x1"
    data.item.qty = 1
    TriggerEvent('esx_inventoryhud:showItemUse', data.item)
    if shouldCloseInventory(data.item.name) then
        closeInventory()
    else
        Citizen.Wait(250)
        loadPlayerInventory()
    end
    cb("ok")
end)

RegisterNetEvent('esx_inventoryhud:showItemUse')
AddEventHandler('esx_inventoryhud:showItemUse', function(items)
    local data = {}
    table.insert(data, {
        item = {
            label = items.label,
            itemId = items.name
        },
        qty = items.qty,
        message = items.msg
    })
    SendNUIMessage({
        action = 'itemUsed',
        alerts = data
    })
end)


RegisterNUICallback("DropItem",function(data, cb)
    if IsPedSittingInAnyVehicle(playerPed) then
        return
    end

    if type(data.number) == "number" and math.floor(data.number) == data.number then
        if data.item.type == "item_money" then
            TriggerServerEvent("esx:removeInventoryItem", "item_account", "money", data.number)
        else
            TriggerServerEvent("esx:removeInventoryItem", data.item.type, data.item.name, data.number)
        end
    end

    TaskPlayAnim(playerPed, 'random@domestic', 'pickup_low', 8.0, -8, -1, 48, 0, 0, 0, 0)
    Wait(250)
    loadPlayerInventory()

    cb("ok")
end)

RegisterNUICallback("GiveItem",function(data, cb)
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

        TriggerServerEvent("esx:giveInventoryItem", data.player, data.item.type, data.item.name, count)

        playAnim('mp_common', 'givetake1_a', 2500)
        Wait(250)
        loadPlayerInventory()
    else
    
        --exports['b1g_notify']:Notify('true', _U("player_nearby"))
        exports['mythic_notify']:SendAlert('inform', _U('player_nearby'))
    end
    cb("ok")
end)

function shouldCloseInventory(itemName)
    for index, value in ipairs(Config.CloseUiItems) do
        if value == itemName then
            return true
        end
    end

    return false
end

function shouldSkipAccount(accountName)
    for index, value in ipairs(Config.ExcludeAccountsList) do
        if value == accountName then
            return true
        end
    end

    return false
end

function loadPlayerInventory()
    ESX.TriggerServerCallback("esx_inventoryhud:getPlayerInventory", function(data)
            items = {}
            fastItems = {}
            inventory = data.inventory
            accounts = data.accounts
            money = data.money
            weapons = data.weapons
            weight = data.weight*5.0
            maxWeight = data.maxWeight*1.0

            SendNUIMessage(
                {
                    action = "weight",
                    label = 'inventorywy',
                    id = GetPlayerName(PlayerId()),
                    max = data.maxWeight,
                    used = data.weight,
                }
            )


            if Config.IncludeCash and money ~= nil and money > 0 then
                for key, value in pairs(accounts) do
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
            
            SendNUIMessage(
                {
                    action = "setItems",
                    itemList = items,
                    fastItems = fastItems,
                    text = texts
                })  
        end, GetPlayerServerId(PlayerId())
    )
end

Citizen.CreateThread(

    function()

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

                DisableControlAction(0, Keys["W"], true) -- W

                DisableControlAction(0, Keys["A"], true) -- A

                DisableControlAction(0, 31, true) -- S (fault in Keys table!)

                DisableControlAction(0, 30, true) -- D (fault in Keys table!)



                DisableControlAction(0, Keys["R"], true) -- Reload

                DisableControlAction(0, Keys["SPACE"], true) -- Jump

                DisableControlAction(0, Keys["Q"], true) -- Cover

                DisableControlAction(0, Keys["TAB"], true) -- Select Weapon

                DisableControlAction(0, Keys["F"], true) -- Also 'enter'?



                DisableControlAction(0, Keys["F1"], true) -- Disable phone

                DisableControlAction(0, Keys["F2"], true) -- Inventory

                DisableControlAction(0, Keys["F3"], true) -- Animations

                DisableControlAction(0, Keys["F6"], true) -- Job



                DisableControlAction(0, Keys["V"], true) -- Disable changing view

                DisableControlAction(0, Keys["C"], true) -- Disable looking behind

                DisableControlAction(0, Keys["X"], true) -- Disable clearing animation

                DisableControlAction(2, Keys["P"], true) -- Disable pause screen



                DisableControlAction(0, 59, true) -- Disable steering in vehicle

                DisableControlAction(0, 71, true) -- Disable driving forward in vehicle

                DisableControlAction(0, 72, true) -- Disable reversing in vehicle



                DisableControlAction(2, Keys["LEFTCTRL"], true) -- Disable going stealth



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

    end

)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        HideHudComponentThisFrame(19)
        HideHudComponentThisFrame(20)
        BlockWeaponWheelThisFrame()
        DisableControlAction(0, Keys["TAB"],true)
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
        TriggerServerEvent("esx_inventoryhud:changeFastItem",data.slot,data.item.name)
        loadPlayerInventory()
        cb("ok")
end)

RegisterNUICallback("TakeFromFast", function(data, cb)
    fastWeapons[data.item.slot] = nil
    TriggerServerEvent("esx_inventoryhud:changeFastItem",0,data.item.name)
    loadPlayerInventory()
    cb("ok")
end)


Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if IsDisabledControlJustReleased(1, 157) then
            --if IsDisabledControlPressed(0, 19) and IsDisabledControlJustReleased(1, 157) then
                if fastWeapons[1] ~= nil then
                    if string.find(fastWeapons[1],"WEAPON_") then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[1]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[1],true)
                        end
                    else
                        TriggerServerEvent("esx:useItem", fastWeapons[1])
                        Citizen.Wait(250)
                    end
                    loadPlayerInventory()
                end
            end
            if IsDisabledControlJustReleased(1, 158) then
            --if IsDisabledControlPressed(0, 19) and IsDisabledControlJustReleased(1, 158) then
                if fastWeapons[2] ~= nil then
                    if string.find(fastWeapons[2],"WEAPON_") then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[2]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[2],true)
                        end
                    else
                        TriggerServerEvent("esx:useItem", fastWeapons[2])
                        Citizen.Wait(250)
                    end
                    loadPlayerInventory()                    
                end
            end
            if IsDisabledControlJustReleased(1, 160) then
            --if IsDisabledControlPressed(0, 19) and IsDisabledControlJustReleased(1, 160) then
                if fastWeapons[3] ~= nil then
                    if string.find(fastWeapons[3],"WEAPON_") then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[3]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[3],true)
                        end
                    else
                        TriggerServerEvent("esx:useItem", fastWeapons[3])
                        Citizen.Wait(250)
                    end
                    loadPlayerInventory()
                end
            end
            if IsDisabledControlJustReleased(1, 164) then
            --if IsDisabledControlPressed(0, 19) and IsDisabledControlJustReleased(1, 164) then
                if fastWeapons[4] ~= nil then
                    if string.find(fastWeapons[4],"WEAPON_") then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[4]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[4],true)
                        end
                    else
                        TriggerServerEvent("esx:useItem", fastWeapons[4])
                        Citizen.Wait(250)
                    end
                    loadPlayerInventory()
                end
            end
            if IsDisabledControlJustReleased(1, 165) then
            --if IsDisabledControlPressed(0, 19) and IsDisabledControlJustReleased(1, 165) then
                if fastWeapons[5] ~= nil then
                    if string.find(fastWeapons[5],"WEAPON_") then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[5]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[5],true)
                        end
                    else
                        TriggerServerEvent("esx:useItem", fastWeapons[5])
                        Citizen.Wait(250)
                    end
                    loadPlayerInventory()
                end
            end
            if IsDisabledControlJustReleased(1, Keys['6']) then
                if fastWeapons[6] ~= nil then
                    if string.find(fastWeapons[6],"WEAPON_") then
                        if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[6]) then
                            SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
                        else
                            SetCurrentPedWeapon(GetPlayerPed(-1), fastWeapons[6],true)
                        end
                    else
                        TriggerServerEvent("esx:useItem", fastWeapons[6])
                        Citizen.Wait(250)
                    end
                    loadPlayerInventory()
                end
            end
        end
end)


--Add Items--

RegisterNetEvent('esx_inventoryhud:client:addItem')
AddEventHandler('esx_inventoryhud:client:addItem', function(itemname, itemlabel)
    local data = { name = itemname, label = itemlabel }
    SendNUIMessage({type = "addInventoryItem", addItemData = data})
end)

RegisterNetEvent('esx_inventoryhud:forcekeluar')
AddEventHandler('esx_inventoryhud:forcekeluar', function()
  closeInventory()
end)
