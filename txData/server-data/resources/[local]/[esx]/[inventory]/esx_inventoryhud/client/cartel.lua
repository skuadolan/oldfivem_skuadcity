--[[ DUMPED USING COMPOSER DEVIL ]]--

RegisterNetEvent("esx_inventoryhud:openCartelInventory")
AddEventHandler('esx_inventoryhud:openCartelInventory', function(data)
    setCartelInventoryData(data)
    openCartelInventory()
end)

function refreshCartelInventory()
    ESX.TriggerServerCallback('esx_inventoryhud:getPoliceInventory', function(inventory)
        setCartelInventoryData(inventory)
    end, ESX.GetPlayerData().identifier)
end

function setCartelInventoryData(data)
    items = {}
    local blackMoney = data.blackMoney
    local propertyItems = data.items
    local propertyWeapons = data.weapons
    if blackMoney > 0 then
        accountData = {
            label = _U("black_money"),
            count = blackMoney,
            type = "item_account",
            name = "black_money",
            usable = false,
            rare = false,
            limit = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end
    for i = 1, #propertyItems, 1 do
        local item = propertyItems[i]
        if item.count > 0 then
            item.type = "item_standard"
            item.usable = false
            item.rare = false
            item.limit = -1
            item.canRemove = false
            table.insert(items, item)
        end
    end
    for i = 1, #propertyWeapons, 1 do
        local weapon = propertyWeapons[i]
        if propertyWeapons[i].name ~= "WEAPON_UNARMED" then
            table.insert(
                items,
                {
                    label = ESX.GetWeaponLabel(weapon.name),
                    count = weapon.ammo,
                    limit = -1,
                    type = "item_weapon",
                    name = weapon.name,
                    usable = false,
                    rare = false,
                    canRemove = false
                }
            )
        end
    end
    SendNUIMessage(
        {
            action = "setSecondInventoryItems",
            isProperties = false,
            itemList = items
        }
    )
end
function openCartelInventory()
    loadPlayerInventory()
    isInInventory = true
    SendNUIMessage(
        {
            action = "display",
            type = "cartel"
        }
    )
    SetNuiFocus(true, true)
end
RegisterNUICallback("PutIntoCartel",function(data, cb)
    if IsPedSittingInAnyVehicle(playerPed) then
        return
    end
    if type(data.number) == "number" and math.floor(data.number) == data.number then
        local count = tonumber(data.number)
        if data.item.type == "item_weapon" then
            count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
        end
        TriggerServerEvent("esx_property:putItemCartel", ESX.GetPlayerData().identifier, data.item.type, data.item.name, count)
    end
    Wait(150)
    refreshPropertyInventory()
    Wait(150)
    loadPlayerInventory()
    cb("ok")
end)

RegisterNUICallback("TakeFromCartel",function(data, cb)
    if IsPedSittingInAnyVehicle(playerPed) then
        return
    end

    if type(data.number) == "number" and math.floor(data.number) == data.number then
        TriggerServerEvent("esx_property:getItemCartel", ESX.GetPlayerData().identifier, data.item.type, data.item.name, tonumber(data.number))
    end

    Wait(150)
    refreshPropertyInventory()
    Wait(150)
    loadPlayerInventory()

    cb("ok")
end)
