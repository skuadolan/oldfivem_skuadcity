local shopData = nil

Keys = {
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

local Licenses = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do

        Citizen.Wait(10)

    end
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        player = GetPlayerPed(-1)
        coords = GetEntityCoords(player)
        if IsInRegularShopZone(coords) or IsInRobsLiquorZone(coords) or IsInBlackMarketZone(coords) or IsInYouToolZone(coords) or IsInMechZone(coords) or IsInPedagangZone(coords) or IsInAmbulanceZone(coords) or IsInPoliceZone(coords) then
            if IsInRegularShopZone(coords) then
                if IsControlJustReleased(0, Keys["E"]) then
                    OpenShopInv("regular")
                    Citizen.Wait(1000)
                end
            end
            if IsInRobsLiquorZone(coords) then
                if IsControlJustReleased(0, Keys["E"]) then
                    OpenShopInv("robsliquor")
                    Citizen.Wait(1000)
                end
            end
            if IsInYouToolZone(coords) then
                if IsControlJustReleased(0, Keys["E"]) then
                    OpenShopInv("youtool")
                    Citizen.Wait(1000)
                end
            end
            if IsInBlackMarketZone(coords) then
                if IsControlJustReleased(0, Keys["E"]) then
                    OpenShopInv("weaponshop") --black market
                    Citizen.Wait(1000)
                end
            end


            
            if IsInPedagangZone(coords) then
                letSleep = false    
                if IsControlJustReleased(0, Keys["E"]) then    
                    if PlayerData.job ~= nil and PlayerData.job.name == 'pedagang' then    
                        OpenShopInv("pedagang")    
                    end    
                end    
            end
            if IsInAmbulanceZone(coords) then
                letSleep = false    
                if IsControlJustReleased(0, Keys["E"]) then   
                    if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then    
                        OpenShopInv("ambulance")        
                    end    
                end    
            end
            if IsInMechZone(coords) then
                if IsControlJustReleased(0, Keys["E"]) then
                    if PlayerData.job ~= nil and PlayerData.job.name == 'mechanic' then
                        OpenShopInv("mech")
                        Citizen.Wait(1000)
                    end    
                end
            end
            if IsInPoliceZone(coords) then
                if IsControlJustReleased(0, Keys["E"]) then
                    if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
                        OpenShopInv("police")
                        Citizen.Wait(1000)
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
    TriggerEvent("esx_inventoryhud:openShopInventory", data, inventory)
end

RegisterNetEvent("suku:OpenCustomShopInventory")
AddEventHandler("suku:OpenCustomShopInventory", function(type, shopinventory)
    text = "Supermarket"
    data = {text = text}
    inventory = {}

    ESX.TriggerServerCallback("suku:getCustomShopItems", function(shopInv)
        for i = 1, #shopInv, 1 do
            table.insert(inventory, shopInv[i])
        end
    end, type, shopinventory)
    Citizen.Wait(500)

    TriggerEvent("esx_inventoryhud:openShopInventory", data, inventory)
end)

RegisterNetEvent("esx_inventoryhud:openShopInventory")
AddEventHandler("esx_inventoryhud:openShopInventory", function(data, inventory)
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
        if take then
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

function IsInRegularShopZone(coords)
    RegularShop = Config.Shops.RegularShop.Locations
    
    for i = 1, #RegularShop, 1 do
        if GetDistanceBetweenCoords(coords, RegularShop[i], true) < 1.5 then
           
            return true
        end
    end
    return false
end

function IsInRobsLiquorZone(coords)
    RobsLiquor = Config.Shops.RobsLiquor.Locations
    
    for i = 1, #RobsLiquor, 1 do
        if GetDistanceBetweenCoords(coords, RobsLiquor[i], true) < 1.5 then
            
            return true
        end
    end
    return false
end

function IsInBlackMarketZone(coords)
    RobsLiquor = Config.Shops.WeaponShop.Locations
    
    for i = 1, #RobsLiquor, 1 do
        if GetDistanceBetweenCoords(coords, RobsLiquor[i], true) < 1.5 then
            
            return true
        end
    end
    return false
end

function IsInYouToolZone(coords)
    YouTool = Config.Shops.YouTool.Locations
    
    for i = 1, #YouTool, 1 do
        if GetDistanceBetweenCoords(coords, YouTool[i], true) < 1.5 then
            
            return true
        end
    end
    return false
end

function IsInMechZone(coords)
    Mech = Config.Shops.Mech.Locations
    
    for i = 1, #Mech, 1 do
        if GetDistanceBetweenCoords(coords, Mech[i], true) < 1.5 then
           
            return true
        end
    end
    return false
end

function IsInAmbulanceZone(coords)
    Ambulance = Config.Shops.Ambulance.Locations
    
    for i = 1, #Ambulance, 1 do
        if GetDistanceBetweenCoords(coords, Ambulance[i], true) < 1.5 then
            
            return true
        end
    end
    return false
end

function IsInPedagangZone(coords)
    Pedagang = Config.Shops.Pedagang.Locations
    
    for i = 1, #Pedagang, 1 do
        if GetDistanceBetweenCoords(coords, Pedagang[i], true) < 0.5 then
            
            return true
        end
    end
    return false
end

function IsInPoliceZone(coords)
    Police = Config.Shops.Police.Locations
    

    for i = 1, #Police, 1 do
        if GetDistanceBetweenCoords(coords, Police[i], true) < 0.5 then
            
            return true
        end
    end
    return false
end

local test1 = false
local test2 = false
local test3 = false
local test4 = false
local test5 = false
local test6 = false
local test7 = false
local test8 = false
local test9 = false
local take = false
local already = false

Citizen.CreateThread(function()
    while(true) do
        --config shop
        test1 = GetDistanceBetweenCoords(coords, Config.Shops.RegularShop.Locations[k], true)
        test2 = GetDistanceBetweenCoords(coords, Config.Shops.RobsLiquor.Locations[k], true)
        test3 = GetDistanceBetweenCoords(coords, Config.Shops.YouTool.Locations[k], true)
        test4 = GetDistanceBetweenCoords(coords, Config.Shops.Mech.Locations[k], true)
        test5 = GetDistanceBetweenCoords(coords, Config.Shops.PrisonShop.Locations[k], true)
        test6 = GetDistanceBetweenCoords(coords, Config.Shops.Pedagang.Locations[k], true)
        test7 = GetDistanceBetweenCoords(coords, Config.Shops.Police.Locations[k], true)
        test8 = GetDistanceBetweenCoords(coords, Config.Shops.Ambulance.Locations[k], true)
        test9 = GetDistanceBetweenCoords(coords, Config.Shops.WeaponShop.Locations[k], true)
        --take
        take = IsPedSittingInAnyVehicle(playerPed)
        --already
        already = hasAlreadyEnteredMarker
        Citizen.Wait(500)
    end
end)
--config shop
Citizen.CreateThread(function()
   
    while true do
        Citizen.Wait(0)
        player = GetPlayerPed(-1)
        coords = GetEntityCoords(player)
        local sleep = true

        for k, v in pairs(Config.Shops.RegularShop.Locations) do
            if test1 < 2.0 then
            sleep = false
            end
        end

        for k, v in pairs(Config.Shops.RobsLiquor.Locations) do
            if test2 < 2.0 then
            sleep = false
            end
        end

        for k, v in pairs(Config.Shops.YouTool.Locations) do
            if test3 < 2.0 then
            sleep = false
            end
        end

        for k, v in pairs(Config.Shops.Mech.Locations) do
            if test4 < 2.0 then
            sleep = false
            end
        end

        for k, v in pairs(Config.Shops.PrisonShop.Locations) do
            if test5 < 2.0 then
            sleep = false
            end
        end

        for k, v in pairs(Config.Shops.Pedagang.Locations) do
            if test6 < 2.0 then
            sleep = false
            end
        end

        for k, v in pairs(Config.Shops.Police.Locations) do
            if test7 < 2.0 then
            sleep = false
            end
        end

        for k, v in pairs(Config.Shops.Ambulance.Locations) do
            if test8 < 2.0 then
            sleep = false
            end
        end

        for k, v in pairs(Config.Shops.WeaponShop.Locations) do
            if test9 < 2.0 then
            sleep = false
            end
        end
        if sleep then
            Citizen.Wait(1000)
        end
    end
   
end)

--location marker
CreateThread(function()
	while true do
		local Sleep = 1500

		if currentAction then
			Sleep = 0
			ESX.ShowHelpNotification(currentActionMsg)
		end

		local playerCoords = GetEntityCoords(PlayerPedId())
		local isInMarker, currentZone = false

		for k,v in pairs(Config.Shops) do
			for i = 1, #v.Locations, 1 do
				local distance = #(playerCoords - v.Locations[i])

				if distance < 2.0 then
					Sleep = 0
					if true then
                        DrawMarker(Config.MarkerType, v.Locations[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
                    end
					if distance < 2.0 then
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
	Wait(Sleep)
	end
end)
--[[Citizen.CreateThread(function()
    while true do
        Player = nil
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local isInMarker, currentZone = false
        local sleep = true
        for k,v in pairs(Config.Shops) do
            for i = 1, #v.Locations, 1 do
                local distance = GetDistanceBetweenCoords(playerCoords, v.Locations[i], true)
                if distance <  1.5 then
                    sleep = false
                    if distance < 1.5 then
                        isInMarker  = true
                        currentZone = k
                        lastZone    = k
                    end
                end
            end
        end
        if isInMarker and not already then
            already = true
            TriggerEvent('suku:hasEnteredMarker', currentZone)
        end
        if not isInMarker and already then
            already = false
            TriggerEvent('suku:hasExitedMarker', lastZone)
        end
        if sleep then
			Citizen.Wait(50)
		end
    end
end)]]

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


    for k, v in pairs(Config.Shops.RegularShop.Locations) do

        CreateBlip(vector3(Config.Shops.RegularShop.Locations[k].x, Config.Shops.RegularShop.Locations[k].y, Config.Shops.RegularShop.Locations[k].z ), "Supermarket", 3.0, 2, Config.ShopBlipID)

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

function DrawText3DTest(x,y,z, text)



    local onScreen,_x,_y=World3dToScreen2d(x,y,z)

    local px,py,pz=table.unpack(GetGameplayCamCoords())

    

    SetTextScale(0.35, 0.35)

    SetTextFont(4)

    SetTextProportional(1)

    SetTextColour(255, 255, 255, 215)

    SetTextEntry("STRING")

    SetTextCentre(1)

    AddTextComponentString(text)

    --DrawText(_x,_y)

    local factor = (string.len(text)) / 370

    --DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)

end