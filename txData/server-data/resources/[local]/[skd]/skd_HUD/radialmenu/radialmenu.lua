-- Menu state
local showMenu = false
local IsDead   = false

-- Keybind Lookup table
local keybindControls = {
	["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["Backspace"] = 177, ["Tab"] = 37, ["q"] = 44, ["w"] = 32, ["e"] = 38, ["r"] = 45, ["t"] = 245, ["y"] = 246, ["u"] = 303, ["p"] = 199, ["["] = 39, ["]"] = 40, ["Enter"] = 18, ["CapsLock"] = 137, ["a"] = 34, ["s"] = 8, ["d"] = 9, ["f"] = 23, ["g"] = 47, ["h"] = 74, ["k"] = 311, ["l"] = 182, ["Shift"] = 21, ["z"] = 20, ["x"] = 73, ["c"] = 26, ["v"] = 0, ["b"] = 29, ["n"] = 249, ["m"] = 244, [","] = 82, ["."] = 81, ["Home"] = 213, ["PageUp"] = 10, ["PageDown"] = 11, ["Delete"] = 178
}

-- Main thread
local isPause = false
CreateThread(function()
    -- Update every frame
    while true do
        Citizen.Wait(0)

        -- Loop through all menus in config
        for _, menuConfig in pairs(menuConfigs) do
            -- Check if menu should be enabled
            if menuConfig:enableMenu() then
                -- When keybind is pressed toggle UI
                local keybindControl = keybindControls[menuConfig.data.keybind]
                if IsPauseMenuActive() and not isPause then
                    isPause = true;
                elseif not IsPauseMenuActive() and isPause then
                    isPause = false;
                end

                if not IsPauseMenuActive() then
                    if IsDisabledControlJustPressed(0, keybindControl) then

                        if not showMenu then
                            showMenu = false
                        end
    
                        -- Init UI
                        showMenu = true
    
                        -- Play sound
                        PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
    
                        -- Prevent menu from showing again until key is released
                        if showMenu then
                            Citizen.Wait(100) 
                            SendNUIMessage({
                                type = 'init',
                                data = menuConfig.data,
                                resourceName = GetCurrentResourceName()
                            })
        
                            -- Set cursor position and set focus
                            SetCursorLocation(0.5, 0.5)
                            SetNuiFocus(true, true)
                        end
                        Citizen.Wait(100)
                        --while IsDisabledControlJustReleased(0, keybindControl) do Citizen.Wait(100) end
                    end
                end
            end
        end
    end
end)

RegisterCommand("qRadialmenu", function()
    CloseMenu()
    TriggerEvent('ip-inventory:forcekeluar')
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 200) then
            CloseMenu()
            TriggerEvent('ip-inventory:forcekeluar')
            TriggerEvent('esx_documents:forcekeluar')
        end
    end
end)

function CloseMenu()
    showMenu = false
    SendNUIMessage(
        {
            type = "destroy"
        }
    )
    SetNuiFocus(false, false)
end

-- Callback function for closing menu
RegisterNUICallback('closemenu', function(data, cb)
    -- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'destroy'
    })

    -- Play sound
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)

    -- Send ACK to callback function
    cb('ok')
end)

-- Callback function for when a slice is clicked, execute command
RegisterNUICallback('sliceclicked', function(data, cb)
    -- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'destroy'
    })

    -- Play sound
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)

    -- Run command
    ExecuteCommand(data.command)

    -- Send ACK to callback function
    cb('ok')
end)

-- Callback function for testing
RegisterNUICallback('testprint', function(data, cb)
    -- Print message
    TriggerEvent('chatMessage', "[test]", {255,0,0}, data.message)

    -- Send ACK to callback function
    cb('ok')
end)

RegisterCommand("pintu", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    showMenu = true
    SendNUIMessage({
        type = 'init',
        data = subMenuConfigs["pintu"].data,
        resourceName = GetCurrentResourceName()
    })
    SetNuiFocus(true, true)
end, false)

RegisterCommand("animasi", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    showMenu = true
    SendNUIMessage({
        type = 'init',
        data = subMenuConfigs["animasi"].data,
        resourceName = GetCurrentResourceName()
    })
    SetNuiFocus(true, true)
end, false)

RegisterCommand("rumah", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    if not IsDead then
        -- Init UI and set focus
        showMenu = true
        SendNUIMessage({
            type = 'init',
            data = subMenuConfigs["rumah"].data,
            resourceName = GetCurrentResourceName()
        })
        SetNuiFocus(true, true)
    end
end, false)

RegisterCommand("rumahkeduagaes", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)
        -- Init UI and set focus
    showMenu = true
    SendNUIMessage({
        type = 'init',
        data = subMenuConfigs["rumahkeduagaes"].data,
        resourceName = GetCurrentResourceName()
    })
    SetNuiFocus(true, true)
end, false)

RegisterCommand("idcard", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    showMenu = true
    SendNUIMessage({
        type = 'init',
        data = subMenuConfigs["idcard"].data,
        resourceName = GetCurrentResourceName()
    })
    SetNuiFocus(true, true)
end, false)

RegisterCommand("ruwetcok", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    showMenu = true
    SendNUIMessage({
        type = 'init',
        data = subMenuConfigs["ruwetcok"].data,
        resourceName = GetCurrentResourceName()
    })
    SetNuiFocus(true, true)
end, false)

RegisterCommand("pekerjaan", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    showMenu = true
    SendNUIMessage({
        type = 'init',
        data = subMenuConfigs["pekerjaan"].data,
        resourceName = GetCurrentResourceName()
    })
    SetNuiFocus(true, true)
end, false)

--[[RegisterCommand("me123", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    showMenu = true
    SendNUIMessage({
        type = 'init',
        data = subMenuConfigs["me123"].data,
        resourceName = GetCurrentResourceName()
    })
    SetNuiFocus(true, true)
end, false)

RegisterCommand("do123", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    showMenu = true
    SendNUIMessage({
        type = 'init',
        data = subMenuConfigs["do123"].data,
        resourceName = GetCurrentResourceName()
    })
    SetNuiFocus(true, true)
end, false)]]

RegisterCommand("pakaian", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    showMenu = true
    SendNUIMessage({
        type = 'init',
        data = subMenuConfigs["pakaian"].data,
        resourceName = GetCurrentResourceName()
    })
    SetNuiFocus(true, true)
end, false)

RegisterCommand("submenu6", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    showMenu = true
    SendNUIMessage({
        type = 'init',
        data = subMenuConfigs["submenu6"].data,
        resourceName = GetCurrentResourceName()
    })
    SetNuiFocus(true, true)
end, false)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

RegisterKeyMapping('Radial Menu', 'Tombol Radial Menu', 'keyboard', 'Tab')