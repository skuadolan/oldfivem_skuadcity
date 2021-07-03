ESX = nil
local IsDead = false

supp1 = {-2084633992, -1357824103, 2132975508, -494615257}
supp2 = {-1716589765, 324215364, -270015777, -1074790547, -1063057011, -1654528753, 984333226}
supp3 = {1593441988, -771403250, 584646201, 137902532, 736523883}
supp4 = {487013001}

flash1 = {453432689, 1593441988, 584646201, -1716589765, -771403250, 324215364}
flash2 = {736523883, -270015777, 171789620, -1074790547, -2084633992, -1357824103, -1063057011, 2132975508, 487013001, -494615257, -1654528753, 984333226}

grip1 = {171789620, -1074790547, -2084633992, -1063057011, 2132975508, 2144741730, -494615257, -1654528753, 984333226}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('playerSpawned', function()
    used = 0
    used2 = 0
    used3 = 0
    used4 = 0
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

local used = 0

RegisterNetEvent('nfw_wep:silencieux')
AddEventHandler('nfw_wep:silencieux', function()
    local inventory = ESX.GetPlayerData().inventory
    local silencieux = 0
    local item = 'silencieux'
    
    for i=1, #inventory, 1 do
        if inventory[i].name == 'silencieux' then
            silencieux = inventory[i].count
        end
    end

    local ped = PlayerPedId()
    local WepHash = GetSelectedPedWeapon(ped)

    if WepHash == GetHashKey("WEAPON_PISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))
        exports['mythic_notify']:DoHudText('inform', 'You have equipped a silencer!')
        used = used + 1
    elseif table.includes(supp1, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0x837445AA)
        exports['mythic_notify']:DoHudText('inform', 'You have equipped a silencer!')
        used = used + 1
    elseif table.includes(supp2, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0xA73D4664)
        exports['mythic_notify']:DoHudText('inform', 'You have equipped a silencer!')
        used = used + 1
    elseif table.includes(supp3, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0xC304849A)
        exports['mythic_notify']:DoHudText('inform', 'You have equipped a silencer!')
        used = used + 1
    elseif table.includes(supp4, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0xE608B35E)
        exports['mythic_notify']:DoHudText('inform', 'You have equipped a silencer!')
        used = used + 1
    else
        exports['mythic_notify']:DoHudText('inform', 'This weapon is not compatible with a silencer')
        TriggerServerEvent('returnItem', item)
    end
end)

local used2 = 0

RegisterNetEvent('nfw_wep:flashlight')
AddEventHandler('nfw_wep:flashlight', function() 
    local inventory = ESX.GetPlayerData().inventory
    local flashlight = 0
    local item = 'flashlight'
    
    for i=1, #inventory, 1 do
		if inventory[i].name == 'flashlight' then
			flashlight = inventory[i].count
		end
	end
    local ped = PlayerPedId()
    local WepHash = GetSelectedPedWeapon(ped)

    if table.includes(flash1, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0x359B7AAE)
        exports['mythic_notify']:DoHudText('inform', 'You have equipped a flashlight!')
    elseif table.includes(flash2, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0x7BC4CDDC)
        exports['mythic_notify']:DoHudText('inform', 'You have equipped a flashlight!')
    else
        exports['mythic_notify']:DoHudText('inform', 'This weapon is not compatible with a flashlight')
        TriggerServerEvent('returnItem', item)
    end
end)

local used3 = 0

RegisterNetEvent('nfw_wep:grip')
AddEventHandler('nfw_wep:grip', function()
    local inventory = ESX.GetPlayerData().inventory
    local grip = 0
    local item = 'grip'

    for i=1, #inventory, 1 do
        if inventory[i].name == 'grip' then
            grip = inventory[i].count
        end
    end

    local ped = PlayerPedId()
    local WepHash = GetSelectedPedWeapon(ped) 

    if table.includes(grip1, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0xC164F53)
        exports['mythic_notify']:DoHudText('inform', 'You have equipped a grip!')
    else
        exports['mythic_notify']:DoHudText('inform', 'This weapon is not compatible with a grip')
        TriggerServerEvent('returnItem', item)
    end
end)

RegisterNetEvent('nfw_wep:yusuf')
AddEventHandler('nfw_wep:yusuf', function()
    local inventory = ESX.GetPlayerData().inventory
    local yusuf = 0
    for i=1, #inventory, 1 do
        if inventory[i].name == 'yusuf' then
            yusuf = inventory[i].count
        end
    end

    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
    if used4 < yusuf then

        if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You have applied a Luxury Weapon Skin')
            used4 = used4 + 1
        
        elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You have applied a Luxury Weapon Skin')
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You have applied a Luxury Weapon Skin')
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You have applied a Luxury Weapon Skin')
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You have applied a Luxury Weapon Skin')
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You have applied a Luxury Weapon Skin')
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You have applied a Luxury Weapon Skin')
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You have applied a Luxury Weapon Skin')
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You have applied a Luxury Weapon Skin')
            used4 = used4 + 1
        else
            exports['mythic_notify']:DoHudText('inform', 'You do not have a wepaon in hand that is compatible with a skin')
        end
    else
        exports['mythic_notify']:DoHudText('inform', 'You have used all your weapon skins')
    end
end)

RegisterNetEvent('nfw_wep:HeavyArmor')
AddEventHandler('nfw_wep:HeavyArmor', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local item = 'SmallArmor'

    if(armor >= 100) or (armor+30 > 100) then
        exports['mythic_notify']:DoHudText('inform', 'Your armor is already maxed!')
        TriggerServerEvent('returnItem', item)
        return
    end

    TriggerEvent('mythic_progbar:client:progress', {
        name = 'heavyb_armor',
        duration = 5000,
        label = 'Memakai Body Armor...',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },--[[
        animation = {
            animDict = "rcmfanatic3",
            anim = "kneel_idle_a",
        },
        prop = {
            model = "prop_bodyarmour_02",
        }]]
    }, function(status)
        if not status then
            --SetPedComponentVariation(ped, 9, 10, 0, 0)
            AddArmourToPed(ped, 100)
        end
    end)
end)

function table.includes(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end



RegisterNetEvent('disc-ammo:useAmmoItem')
AddEventHandler('disc-ammo:useAmmoItem', function(ammo)
    local playerPed = GetPlayerPed(-1)
    local weapon

    local found, currentWeapon = GetCurrentPedWeapon(playerPed, true)
    if found then
        for _, v in pairs(Config.WeapNames) do
            if currentWeapon == v then
                weapon = v
                break
            end
        end
        if weapon ~= nil then
            local pedAmmo = GetAmmoInPedWeapon(playerPed, weapon)
            local newAmmo = pedAmmo + Config.AddAmmo
            ClearPedTasks(playerPed)
            local found, maxAmmo = GetMaxAmmo(playerPed, weapon)
            if newAmmo < maxAmmo then
                TaskReloadWeapon(playerPed)
                --[[SetPedAmmo(playerPed, weapon, newAmmo)
                SetAmmoInClip(playerPed, weapon, newAmmo)]]
                AddAmmoToPed(playerPed, weapon, newAmmo)
                RefillAmmoInstantly(playerPed)
                TriggerServerEvent('disc-ammo:removeAmmoItem', ammo)
                exports['mythic_notify']:SendAlert('success', 'Reloaded')
            else
                exports['mythic_notify']:SendAlert('error', 'Max Ammo')
            end
        end
    end
end)

RegisterNetEvent('disc-ammo:UseClip')
AddEventHandler('disc-ammo:UseClip', function(ammo)
local ped = GetPlayerPed(-1)
local currentWeaponHash = GetSelectedPedWeapon(ped)
local ammo = GetAmmoInPedWeapon(ped, currentWeaponHash)

if(ammo >= 250 or ammo + 50 > 250) then
--exports['mythic_notify']:DoHudText('inform', 'Your weapon ammo is already maxed!')
TriggerServerEvent('returnItem', item)
return
end

if table.includes(Config.WeapHash, currentWeaponHash) then
--exports['mythic_notify']:SendAlert('success', 'Reloaded')
AddAmmoToPed(ped, currentWeaponHash, Config.AddAmmo)
else
--exports['mythic_notify']:SendAlert('error', 'Max Ammo')
TriggerServerEvent('returnItem', 'clip')
end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local currentWeapon = GetSelectedPedWeapon(GetPlayerPed(-1)) --morpheause show ammo fix
        DisplayAmmoThisFrame(currentWeapon)
    end
end)