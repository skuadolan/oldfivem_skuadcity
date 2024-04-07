--- action functions
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil

--- esx
local GUI = {}
ESX = nil
GUI.Time = 0
local PlayerData = {}

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Wait(0)
    end
end)

CreateThread(function()
    while true do
        Wait(10000)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        PlayerData = ESX.GetPlayerData()
        Wait(25000)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
    if PlayerData.job.name == 'ambulance' then
        TriggerServerEvent('skd_duty:overall', true, 'ambulance')
    elseif PlayerData.job.name == 'police' then
        TriggerServerEvent('skd_duty:overall', true, 'police')
    elseif PlayerData.job.name == 'mechanic' then
        TriggerServerEvent('skd_duty:overall', true, 'mechanic')
    elseif PlayerData.job.name == 'banker' then
        TriggerServerEvent('skd_duty:overall', true, 'banker')
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    ESX.TriggerServerCallback('esx_joblisting:haveSecJob', function(hasJobs, isEmpty)
        local tempFirstJob = nil

        for _, v in pairs(hasJobs) do
            tempFirstJob = v.firstJob
        end

        -- for i = 1, #hasJobs, 1 do
        --     tempFirstJob = hasJobs[i].firstJob
        -- end

        if (PlayerData.job.name == 'offambulance') or
            (PlayerData.job.name ~= 'ambulance' and tempFirstJob == 'offambulance') or
            (PlayerData.job.name ~= 'ambulance' and tempFirstJob == 'ambulance') then
            TriggerServerEvent('skd_duty:overall', true, 'offambulance')
        elseif (PlayerData.job.name == 'ambulance') then
            TriggerServerEvent('skd_duty:overall', true, 'ambulance')
        elseif (PlayerData.job.name == 'offpolice') or (PlayerData.job.name ~= 'police' and tempFirstJob == 'offpolice') or
            (PlayerData.job.name ~= 'police' and tempFirstJob == 'police') then
            TriggerServerEvent('skd_duty:overall', true, 'offpolice')
        elseif (PlayerData.job.name == 'police') then
            TriggerServerEvent('skd_duty:overall', true, 'police')
        elseif (PlayerData.job.name == 'offmechanic') or
            (PlayerData.job.name ~= 'mechanic' and tempFirstJob == 'offmechanic') or
            (PlayerData.job.name ~= 'mechanic' and tempFirstJob == 'mechanic') then
            TriggerServerEvent('skd_duty:overall', true, 'offmechanic')
        elseif (PlayerData.job.name == 'mechanic') then
            TriggerServerEvent('skd_duty:overall', true, 'mechanic')
        elseif (PlayerData.job.name == 'offbanker') or (PlayerData.job.name ~= 'banker' and tempFirstJob == 'offbanker') or
            (PlayerData.job.name ~= 'banker' and tempFirstJob == 'banker') then
            TriggerServerEvent('skd_duty:overall', true, 'offbanker')
        elseif (PlayerData.job.name == 'banker') then
            TriggerServerEvent('skd_duty:overall', true, 'banker')
        end
    end)
end)

RegisterNetEvent('skd_duty:playerDropped')
AddEventHandler('skd_duty:playerDropped', function()
    if PlayerData.job.name == 'ambulance' then
        TriggerServerEvent('skd_duty:overall', true, 'ambulance')
    elseif PlayerData.job.name == 'police' then
        TriggerServerEvent('skd_duty:overall', true, 'police')
    elseif PlayerData.job.name == 'mechanic' then
        TriggerServerEvent('skd_duty:overall', true, 'mechanic')
    elseif PlayerData.job.name == 'banker' then
        TriggerServerEvent('skd_duty:overall', true, 'banker')
    end
end)

----markers
AddEventHandler('skd_duty:hasEnteredMarker', function(zone)
    if zone == 'AmbulanceDuty' then
        CurrentAction = 'ambulance_duty'
        CurrentActionMsg = _U('duty')
        CurrentActionData = {}
    end
    if zone == 'PoliceDuty' then
        CurrentAction = 'police_duty'
        CurrentActionMsg = _U('duty')
        CurrentActionData = {}
    end
    if zone == 'MechanicDuty' then
        CurrentAction = 'mechanic_duty'
        CurrentActionMsg = _U('duty')
        CurrentActionData = {}
    end
    if zone == 'PedagangDuty' then
        CurrentAction = 'pedagang_duty'
        CurrentActionMsg = _U('duty')
        CurrentActionData = {}
    end
end)

AddEventHandler('skd_duty:hasExitedMarker', function(zone)
    CurrentAction = nil
end)

-- keycontrols
CreateThread(function()
    while true do
        Wait(0)
        local playerPed = GetPlayerPed(-1)

        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlJustPressed(0, Config.Keys['E']) then
                if CurrentAction == 'ambulance_duty' then
                    if PlayerData.job.name == 'ambulance' then
                        TriggerServerEvent('skd_duty:overall', PlayerData.job.name, 'offambulance')
                        exports['mythic_notify']:SendAlert('error', 'Anda Off Duty EMS')
                    elseif PlayerData.job.name == 'offambulance' then
                        TriggerServerEvent('skd_duty:overall', PlayerData.job.name, 'ambulance')
                        exports['mythic_notify']:SendAlert('inform', 'Anda On Duty EMS')
                    else
                        exports['mythic_notify']:SendAlert('error', 'Anda bukan EMS')
                    end
                elseif CurrentAction == 'police_duty' then
                    if PlayerData.job.name == 'police' then
                        TriggerServerEvent('skd_duty:overall', PlayerData.job.name, 'offpolice')
                        exports['mythic_notify']:SendAlert('error', 'Anda Off Duty Polisi')
                    elseif PlayerData.job.name == 'offpolice' then
                        TriggerServerEvent('skd_duty:overall', PlayerData.job.name, 'police')
                        exports['mythic_notify']:SendAlert('inform', 'Anda On Duty Polisi')
                    else
                        exports['mythic_notify']:SendAlert('error', 'Anda bukan Polisi')
                    end
                elseif CurrentAction == 'mechanic_duty' then
                    if PlayerData.job.name == 'mechanic' then
                        TriggerServerEvent('skd_duty:overall', PlayerData.job.name, 'offmechanic')
                        exports['mythic_notify']:SendAlert('error', 'Anda Off Duty Mekanik')
                    elseif PlayerData.job.name == 'offmechanic' then
                        TriggerServerEvent('skd_duty:overall', PlayerData.job.name, 'mechanic')
                        exports['mythic_notify']:SendAlert('inform', 'Anda On Duty Mekanik')
                    else
                        exports['mythic_notify']:SendAlert('error', 'Anda bukan Mekanik')
                    end
                else
                    exports['mythic_notify']:SendAlert('error', 'Pengangguran ya?')
                end
            end
        end
    end
end)

-- Display markers
CreateThread(function()
    while true do
        Wait(0)

        local coords = GetEntityCoords(GetPlayerPed(-1))

        for k, v in pairs(Config.Zones) do
            if (v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
                DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y,
                    v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
            end
        end
    end
end)

-- Enter / Exit marker events
CreateThread(function()
    while true do
        Wait(0)

        local coords = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker = false
        local currentZone = nil

        for k, v in pairs(Config.Zones) do
            if (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
                isInMarker = true
                currentZone = k
            end
        end

        if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
            HasAlreadyEnteredMarker = true
            LastZone = currentZone
            TriggerEvent('skd_duty:hasEnteredMarker', currentZone)
        end

        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('skd_duty:hasExitedMarker', LastZone)
        end
    end
end)
