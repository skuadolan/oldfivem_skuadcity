local shopData = nil
local Licenses = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30)
        player = GetPlayerPed(-1)
        coords = GetEntityCoords(player)
        if IsInRegularShopZone(coords) or IsInRobsLiquorZone(coords) or IsInYouToolZone(coords) or IsInWeaponShopZone(coords) then
            if IsInRegularShopZone(coords) then
                ESX.ShowHelpNotification('E - Market')
                if IsControlJustReleased(0, Config.Keys["E"]) then
                    OpenShopInv("regular")
                    Citizen.Wait(2000)
                end
            end
            if IsInRobsLiquorZone(coords) then
                ESX.ShowHelpNotification('E - Market')
                if IsControlJustReleased(0, Config.Keys["E"]) then
                    OpenShopInv("robsliquor")
                    Citizen.Wait(2000)
                end
            end
            if IsInYouToolZone(coords) then
                ESX.ShowHelpNotification('E - Market')
                if IsControlJustReleased(0, Config.Keys["E"]) then
                    OpenShopInv("youtool")
                    Citizen.Wait(2000)
                end
            end
            if IsInWeaponShopZone(coords) then
                ESX.ShowHelpNotification('E - Market')
                if IsControlJustReleased(0, Config.Keys["E"]) then
                    if Licenses['weapon'] ~= nil then
                        OpenShopInv("weaponshop")
                        Citizen.Wait(2000)
                    else
                        exports['mythic_notify']:SendAlert('error', 'Anda membutuhkan lisensi untuk membeli senjata!')
                    end
                end
            end
        end
    end
end)

function OpenShopInv(shoptype)
    text = "Toko"
    data = {text = text}
    inventory = {}

    ESX.TriggerServerCallback("suku:getShopItems", function(shopInv)
        for i = 1, #shopInv, 1 do
            table.insert(inventory, shopInv[i])
        end
    end, shoptype)

    Citizen.Wait(500)
    TriggerEvent("lucky_inventory:openShopInventory", data, inventory)
end

RegisterNetEvent("suku:OpenCustomShopInventory")
AddEventHandler("suku:OpenCustomShopInventory", function(type, shopinventory)
    text = "Toko"
    data = {text = text}
    inventory = {}

    ESX.TriggerServerCallback("suku:getCustomShopItems", function(shopInv)
        for i = 1, #shopInv, 1 do
            table.insert(inventory, shopInv[i])
        end
    end, type, shopinventory)
    Citizen.Wait(500)

    TriggerEvent("lucky_inventory:openShopInventory", data, inventory)
end)

RegisterNetEvent("lucky_inventory:openShopInventory")
AddEventHandler("lucky_inventory:openShopInventory", function(data, inventory)
        setShopInventoryData(data, inventory, weapons)
        openShopInventory()
end)

function setShopInventoryData(data, inventory)
    shopData = data

    SendNUIMessage(
        {
            action = "setInfoText",
            text = data.text
        }
    )

    items = {}

    SendNUIMessage(
        {
            action = "setShopInventoryItems",
            itemList = inventory
        }
    )
end

function openShopInventory()
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action = "display",
            type = "shop"
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback("TakeFromShop", function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            TriggerServerEvent("suku:SellItemToPlayer", GetPlayerServerId(PlayerId()), data.item.type, data.item.name, tonumber(data.number))
        end

        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNetEvent("suku:AddAmmoToWeapon")
AddEventHandler("suku:AddAmmoToWeapon", function(hash, amount)
    AddAmmoToPed(GetPlayerPed(-1), hash, amount)
end)

function IsInRegularShopZone(coords)
    RegularShop = Config.Shops.RegularShop.Locations
    for i = 1, #RegularShop, 1 do
        if Vdist2(coords, RegularShop[i].x, RegularShop[i].y, RegularShop[i].z) < 5 then
            return true
        end
    end
    return false
end

function IsInRobsLiquorZone(coords)
    RobsLiquor = Config.Shops.RobsLiquor.Locations
    for i = 1, #RobsLiquor, 1 do
        if Vdist2(coords, RobsLiquor[i].x, RobsLiquor[i].y, RobsLiquor[i].z) < 5 then
            return true
        end
    end
    return false
end

function IsInYouToolZone(coords)
    YouTool = Config.Shops.YouTool.Locations
    for i = 1, #YouTool, 1 do
        if Vdist2(coords, YouTool[i].x, YouTool[i].y, YouTool[i].z) < 5 then
            return true
        end
    end
    return false
end

function IsInWeaponShopZone(coords)
    WeaponShop = Config.Shops.WeaponShop.Locations
    for i = 1, #WeaponShop, 1 do
        if Vdist2(coords, WeaponShop[i].x, WeaponShop[i].y, WeaponShop[i].z) < 5 then
            return true
        end
    end
    return false
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30)
        player = GetPlayerPed(-1)
        coords = GetEntityCoords(player)

        if Vdist2(coords, Config.WeaponLiscence.x, Config.WeaponLiscence.y, Config.WeaponLiscence.z) < 5 then
            DrawMarker(20, Config.WeaponLiscence.x, Config.WeaponLiscence.y, Config.WeaponLiscence.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
            if IsControlJustReleased(0, Config.Keys["E"]) then
                if Licenses['weapon'] == nil then
                    OpenBuyLicenseMenu()
                else
                    exports['mythic_notify']:SendAlert('error', 'Anda sudah memiliki izin untuk membawa senjata!')
                end
            end
        end
    end
end)


RegisterNetEvent('suku:GetLicenses')
AddEventHandler('suku:GetLicenses', function (licenses)
    for i = 1, #licenses, 1 do
        Licenses[licenses[i].type] = true
    end
end)

function OpenBuyLicenseMenu()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_license',{
        title = 'Pendaftaran Lisensi?', --Register a License
        elements = {
          { label = 'Yes' ..' (Rp.' .. Config.LicensePrice ..')', value = 'yes' }, --yes
          { label = 'Tidak', value = 'no' },
        }
      },
      function (data, menu)
        if data.current.value == 'yes' then
            TriggerServerEvent('suku:buyLicense')
        end
        menu.close()
    end,
    function (data, menu)
        menu.close()
    end)
end


Citizen.CreateThread(function()
    player = GetPlayerPed(-1)
    coords = GetEntityCoords(player)
    for k, v in pairs(Config.Shops.RegularShop.Locations) do
        CreateBlip(vector3(Config.Shops.RegularShop.Locations[k].x, Config.Shops.RegularShop.Locations[k].y, Config.Shops.RegularShop.Locations[k].z ), "Indomaret", 3.0, Config.Color, Config.ShopBlipID)
    end

    for k, v in pairs(Config.Shops.YouTool.Locations) do
        CreateBlip(vector3(Config.Shops.YouTool.Locations[k].x, Config.Shops.YouTool.Locations[k].y, Config.Shops.YouTool.Locations[k].z ), "Plaza Mebel", 3.0, Config.Color, Config.YouToolBlipID)
    end

    for k, v in pairs(Config.Shops.WeaponShop.Locations) do
        CreateBlip(vector3(Config.Shops.WeaponShop.Locations[k].x, Config.Shops.WeaponShop.Locations[k].y, Config.Shops.WeaponShop.Locations[k].z), "Ammunation", 3.0, Config.WeaponColor, Config.WeaponShopBlipID)
    end
end)

Citizen.CreateThread(function()
    while true do
        Player = nil
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local isInMarker, letSleep, currentZone = false, false
        for k,v in pairs(Config.Shops) do
            for i = 1, #v.Locations, 1 do
                local distance = GetDistanceBetweenCoords(playerCoords, v.Locations[i].x, v.Locations[i].y, v.Locations[i].z, true)
                if distance <  1.5 then
                    letSleep = false
                    if distance < Config.MarkerSize.x then
                        isInMarker  = true
                        currentZone = k
                        lastZone    = k
                    end
                end
            end
        end
        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            TriggerEvent('suku:hasEnteredMarker', currentZone)
        end
        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('suku:hasExitedMarker', lastZone)
        end
        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

AddEventHandler('suku:hasEnteredMarker', function(zone)
    currentAction     = 'shop_menu'
    currentActionMsg  = _U('shop_press_menu')
    currentActionData = {zone = zone}
end)

AddEventHandler('suku:hasExitedMarker', function(zone)
    SendNUIMessage({
        display = false,
        clear = true
    })
    currentAction = false
    SetNuiFocus(false, false)
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        player = GetPlayerPed(-1)
        coords = GetEntityCoords(player)

        for k, v in pairs(Config.Shops.RegularShop.Locations) do
            if GetDistanceBetweenCoords(coords, Config.Shops.RegularShop.Locations[k].x, Config.Shops.RegularShop.Locations[k].y, Config.Shops.RegularShop.Locations[k].z, true) < 100 then
                DrawMarker(20, Config.Shops.RegularShop.Locations[k].x, Config.Shops.RegularShop.Locations[k].y, Config.Shops.RegularShop.Locations[k].z + 0.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
            end
        end

        for k, v in pairs(Config.Shops.RobsLiquor.Locations) do
            if GetDistanceBetweenCoords(coords, Config.Shops.RobsLiquor.Locations[k].x, Config.Shops.RobsLiquor.Locations[k].y, Config.Shops.RobsLiquor.Locations[k].z + 0.01, true) < 100 then
                DrawMarker(20, Config.Shops.RobsLiquor.Locations[k].x, Config.Shops.RobsLiquor.Locations[k].y, Config.Shops.RobsLiquor.Locations[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
            end
        end

        for k, v in pairs(Config.Shops.YouTool.Locations) do
            if GetDistanceBetweenCoords(coords, Config.Shops.YouTool.Locations[k].x, Config.Shops.YouTool.Locations[k].y, Config.Shops.YouTool.Locations[k].z + 0.01, true) < 100 then
                DrawMarker(20, Config.Shops.YouTool.Locations[k].x, Config.Shops.YouTool.Locations[k].y, Config.Shops.YouTool.Locations[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
            end
        end

        for k, v in pairs(Config.Shops.WeaponShop.Locations) do
            if GetDistanceBetweenCoords(coords, Config.Shops.WeaponShop.Locations[k].x, Config.Shops.WeaponShop.Locations[k].y, Config.Shops.WeaponShop.Locations[k].z + 0.01, true) < 100 then
                DrawMarker(20, Config.Shops.WeaponShop.Locations[k].x, Config.Shops.WeaponShop.Locations[k].y, Config.Shops.WeaponShop.Locations[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
            end
        end
    end
end)

function CreateBlip(coords, text, radius, color, sprite)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, color)
    SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end