local seatbeltIsOn = false;
local cruiseIsOn = false;
local cruiseSpeed = 999.0;
local speedLevel, gearlevel, fuelLevel, oilLevel = 0, 0, 0, 0;
local pause = false
local MinimapScaleform = {
    scaleform = nil,
}

CreateThread(function()
    MinimapScaleform.scaleform = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(250)
    SetRadarBigmapEnabled(false, false)
end)

local playerAccounts, jobLabel, jobGrade = nil, nil, nil
CreateThread(function()
    while true do
        Wait(1000)
        playerAccounts = ESX.PlayerData.accounts
        jobLabel = ESX.PlayerData.job.label
        jobGrade = ESX.PlayerData.job.grade_label
        Wait(25000)
    end
end)

CreateThread(function()
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(250)
    SetRadarBigmapEnabled(false, false)
    while true do
        Wait(250)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()

        local ped = GetPlayerPed(-1);
        if IsPedSittingInAnyVehicle(ped) and not IsPauseMenuActive() then
            DisplayRadar(true)
        elseif not IsPedSittingInAnyVehicle(ped) then
            DisplayRadar(false)
        end
    end
end)

local oxy = 100
CreateThread(function()
    while true do
        Wait(1000)
        local ped                              = GetPlayerPed(-1);
        local vehicle                          = GetVehiclePedIsIn(ped);
        local isCurrentPlayerSittingInVehicles = IsPedSittingInAnyVehicle(ped)

        if IsPedSwimmingUnderWater(ped) and not isCurrentPlayerSittingInVehicles then
            if IsPlayerDead(ped) then
                oxy = 0
                SetStatusBar()
            else
                if oxy > 0 and oxy <= 100 then
                    oxy = oxy - 10
                    SetStatusBar()
                end
            end
        elseif not IsPedSwimmingUnderWater(ped) and not isCurrentPlayerSittingInVehicles then
            if oxy >= 0 and oxy < 100 then
                oxy = 100
                SetStatusBar()
            end
            SetStatusBar()
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        local ped                              = GetPlayerPed(-1);
        local vehicle                          = GetVehiclePedIsIn(ped);
        local IsPedInAnyVehicle2               = IsPedInAnyVehicle(ped);
        local isCurrentPlayerSittingInVehicles = IsPedSittingInAnyVehicle(ped)

        if (IsPedInAnyVehicle2) and (isCurrentPlayerSittingInVehicles) and not IsPauseMenuActive() then
            gearlevel = GetVehicleCurrentGear(GetVehiclePedIsIn(ped, false));
            fuelLevel = math.floor(GetVehicleFuelLevel(vehicle))
            oilLevel = GetVehicleEngineHealth(vehicle) / 10;
            SetStatusBar()
        else
            oilLevel = 0
            fuelLevel = 0;
            speedLevel = 0;
            gearlevel = 0;
        end
    end
end)

local prevVelocity = { x = 0.0, y = 0.0, z = 0.0 };
local seatbeltEjectSpeed = math.ceil(21.0 * 3.6) -- Speed threshold to eject player 160KM;
local seatbeltEjectAccel = 21.21                 -- Acceleration threshold to eject player (G's);
CreateThread(function()
    while true do
        Wait(30)

        local ped = GetPlayerPed(-1);
        local IsPedInAnyVehicle2 = IsPedInAnyVehicle(ped);
        local isCurrentPlayerSittingInVehicles = IsPedSittingInAnyVehicle(ped)
        local vehicle = GetVehiclePedIsIn(ped);
        local seatbeltPlaySound = true;
        local vehicleClass = GetVehicleClass(vehicle);
        local isDriver = GetPedInVehicleSeat(vehicle, -1);

        if (IsPedInAnyVehicle2) and (isCurrentPlayerSittingInVehicles) then
            speedLevel = GetEntitySpeed(vehicle);
            if (isDriver == ped) then
                -- Check if cruise control button pressed, toggle state and set maximum speed appropriately
                if IsControlJustPressed(0, Config.CruiseKey) and (vehicleClass ~= 13) then
                    cruiseIsOn = not cruiseIsOn;
                    cruiseSpeed = speedLevel;

                    if cruiseIsOn then
                        exports['mythic_notify']:SendAlert('success', 'Cruise On')
                    else
                        exports['mythic_notify']:SendAlert('error', 'Cruise Off')
                    end
                end

                local maxSpeed = cruiseIsOn and cruiseSpeed or
                    GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel");
                SetEntityMaxSpeed(vehicle, maxSpeed)
                SetDriveTaskCruiseSpeed(ped, maxSpeed)
            end
            if IsControlJustPressed(0, Config.SeatbeltKey) and (vehicleClass ~= 13) and (vehicleClass ~= 8) then
                -- Toggle seatbelt status and play sound when enabled
                seatbeltIsOn = not seatbeltIsOn;
                if seatbeltPlaySound then
                    -- PlaySoundFrontend(-1, "Faster_Click", "RESPAWN_ONLINE_SOUNDSET", 1)
                    if seatbeltIsOn then
                        exports['mythic_notify']:SendAlert('success', 'Seatbelt Terpasang')
                    else
                        exports['mythic_notify']:SendAlert('error', 'Seatbelt Terlepas')
                    end
                end
            end
        else
            -- Reset cruise control
            cruiseIsOn = false;
            seatbeltIsOn = false;
        end
    end
end)

CreateThread(function()
    while true do
        Wait(30)
        local ped                              = GetPlayerPed(-1);
        local position                         = GetEntityCoords(ped);
        local isCurrentPlayerInVehicles        = IsPedInAnyVehicle(ped)
        local isCurrentPlayerSittingInVehicles = IsPedSittingInAnyVehicle(ped)
        if isCurrentPlayerInVehicles and isCurrentPlayerSittingInVehicles then
            local vehicle      = GetVehiclePedIsIn(ped);
            local vehicleClass = GetVehicleClass(vehicle);
            local prevSpeed    = speedLevel;
            speedLevel         = GetEntitySpeed(vehicle);
            if (vehicleClass ~= 13) and (vehicleClass ~= 8) then
                if (not seatbeltIsOn) then
                    -- Set PED flags
                    SetPedConfigFlag(PlayerPedId(), 33, true)
                    -- Eject PED when moving forward, vehicle was going over 45 MPH and acceleration over 100 G's
                    local vehIsMovingFwd = GetEntitySpeedVector(vehicle, true).y > 1.0;
                    local vehAcc = (prevSpeed - speedLevel) / GetFrameTime();
                    if (vehIsMovingFwd and (prevSpeed > (seatbeltEjectSpeed / 2.237)) and (vehAcc > (seatbeltEjectAccel * 9.81))) then
                        SetEntityCoords(ped, position.x, position.y, position.z - 0.47, true, true, true)
                        SetEntityVelocity(ped, prevVelocity.x, prevVelocity.y, prevVelocity.z)
                        Wait(1)
                        SetPedToRagdoll(ped, 1, 1, 0, 0, 0, 0)
                    else
                        -- Update previous velocity for ejecting ped
                        prevVelocity = GetEntityVelocity(vehicle);
                    end
                elseif Config.seatbeltDisableExit then
                    -- Disable vehicle exit when seatbelt is on
                    DisableControlAction(0, 75)
                end
            end
        else
            -- Reset cruise control
            cruiseIsOn = false;
            seatbeltIsOn = false;
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        UpdateHungerThirst()
    end
end)

local percentHunger, percentThirst = 0, 0
function UpdateHungerThirst()
    TriggerEvent('esx_status:getStatus', 'hunger', function(getStatus)
        percentHunger = getStatus.getPercent()
    end)
    TriggerEvent('esx_status:getStatus', 'thirst', function(getStatus)
        percentThirst = getStatus.getPercent()
    end)
end

local isControllPanelOpen = false;
function SetStatusBar()
    local ped                              = GetPlayerPed(-1);
    local vehicle                          = GetVehiclePedIsIn(ped);
    local isCurrentPlayerSittingInVehicles = IsPedSittingInAnyVehicle(ped)

    SendNUIMessage({
        isPanelOpen = isControllPanelOpen,
        isPauseMenuOpen = IsPauseMenuActive(),

        health = GetEntityHealth(PlayerPedId()),
        armour = GetPedArmour(PlayerPedId()),
        hunger = percentHunger,
        thristy = percentThirst,
        oxygenPercent = oxyPercent,

        idPlayer = PlayerId(),
        job_label = jobLabel,
        job_grade = jobGrade,
        accounts = json.encode(playerAccounts),

        isInVehicles = isCurrentPlayerSittingInVehicles,
        GearLevel = gearlevel,
        SpeedLevel = math.ceil(GetEntitySpeed(vehicle) * 3.6),
        FuelLevel = fuelLevel,
        OilLevel = oilLevel,

        isSeatbeltOn = seatbeltIsOn,
        isCruiseControllOn = cruiseIsOn,

    })
end

RegisterCommand('hudpanel', function()
    if not IsPlayerDead(ped) and not IsPauseMenuActive() then
        if isControllPanelOpen then
            SetStatusBar()
            SetNuiFocus(false)
        else
            SetStatusBar()
            ESX.SetTimeout(200, function()
                SetNuiFocus(true, true)
            end)
        end
        isControllPanelOpen = not isControllPanelOpen
    end
end, false)
