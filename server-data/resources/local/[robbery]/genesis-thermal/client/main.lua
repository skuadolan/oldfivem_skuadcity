ESX                             = nil
HaveThermal                     = true
local BoxContainerModel         = nil
local InteractNPC               = nil
local InteractNPC_CurrentAction = nil
local blip = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while InteractNPC == nil do		
		TriggerEvent('genesis_heist_thermal:createPed')
		Citizen.Wait(2500)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		TriggerEvent('genesis-holdUp:thermalSync', HaveThermal)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1))
		for i=1, #Config.InteractionZones, 1 do 
			if GetDistanceBetweenCoords(playerCoords, Config.InteractionZones[i].x, Config.InteractionZones[i].y, Config.InteractionZones[i].z, true) <= 2.0 then
				local editedCoords = { x = Config.InteractionZones[i].x, y = Config.InteractionZones[i].y, z = Config.InteractionZones[i].z-0.1}
				DrawMarker(25, Config.InteractionZones[i].x, Config.InteractionZones[i].y, Config.InteractionZones[i].z-1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.0, 0, 0, 0, 80, false, false, 2, false, nil, nil, false)
				ESX.Game.Utils.DrawText3D(Config.InteractionZones[i], 'Naciśnij [E] aby, zamówić wiertło przemysłowe.', 0.5)
				ESX.Game.Utils.DrawText3D(editedCoords, '~g~'..Config.ThermalDrillCost..'$', 0.5)
				if IsControlJustPressed(0, 38) and InteractNPC_CurrentAction == nil then--E 
					StartThermalBuyProcess()
					DoScreenFadeOut(500)
					Citizen.Wait(500)
					DoScreenFadeIn(300)
				end
			end
		end

		if BoxContainerModel ~= nil then
			local boxCoords = GetEntityCoords(BoxContainerModel)
			if GetDistanceBetweenCoords(playerCoords, boxCoords.x, boxCoords.y, boxCoords.z, true) <= 4.5 then	
				DrawMarker(23, boxCoords.x, boxCoords.y, boxCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.5, 4.5, 1.0, 0, 0, 0, 80, false, false, 2, false, nil, nil, false)
				ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby, otworzyć i zebrać zawartość skrzyni.')
				if IsControlJustPressed(0, 38) and InteractNPC_CurrentAction == nil then--E 
					StartThermalPickupProcess()
					Citizen.Wait(500)
				end
			end
		end
	end
end)

local cinema = false
local blockinput = false
function ToggleHUD(bool)
	if bool == true then
		blockinput = true
		cinema = true
		TriggerEvent('es:setMoneyDisplay', 0.0)
		ESX.UI.HUD.SetDisplay(0.0)
		TriggerEvent('esx_status:setDisplay', 0.0)
		DisplayRadar(false)
	else
		blockinput = false
		cinema = false
		TriggerEvent('es:setMoneyDisplay', 1.0)
		ESX.UI.HUD.SetDisplay(1.0)
		TriggerEvent('esx_status:setDisplay', 1.0)
	end
end

function StartThermalPickupProcess()
	RemoveBlip(blip)
	TaskStartScenarioInPlace(GetPlayerPed(-1), 'CODE_HUMAN_MEDIC_KNEEL', 1, true)
	Wait(2000)
	DoScreenFadeOut(300)
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.5, 'crateOpen', 0.5)
	Wait(5000)
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 4.5, 'crateOpen', 0.8)
	Wait(4500)
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 4.5, 'zip', 0.8)
	Wait(500)
	DeleteObject(BoxContainerModel)
	BoxContainerModel = nil

	TriggerEvent('skinchanger:getSkin', function(skin)
	
		if skin.sex == 0 then
			local clothesSkin = {
				['bags_1'] = 41, ['bags_2'] = 0
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		else
			local clothesSkin = {
				['bags_1'] = 41, ['bags_2'] = 0
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end
	end)	
	HaveThermal = true
	DoScreenFadeIn(1000)
	ClearPedTasks(GetPlayerPed(-1))
end

function StartThermalBuyProcess()
	local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
	SetCamCoord(cam, 3318.68, 5173.15, 18.42)
	SetCamRot(cam, 0.0, 0.0, 35.4, 0)
	RenderScriptCams(1, 0, 0, 1, 1)

	ToggleHUD(true)

	TaskGoToCoordAnyMeans(GetPlayerPed(-1), 3315.02, 5178.30, 19.61, 1.0, 0, 0, 786603, 1.0)
	Citizen.Wait(4000)
	InteractNPC_CurrentAction = 'talking_with_stranger'
	ClearPedTasks(InteractNPC)
	Citizen.Wait(3000)
	SetEntityHeading(InteractNPC, 135.08)
	Citizen.Wait(10000)	
	Citizen.Wait(1000)
	DoScreenFadeOut(100)
	DestroyCam(cam, 0)
	RenderScriptCams(0, 0, 1, 1, 1)
	TaskGoToCoordAnyMeans(GetPlayerPed(-1), 3317.09, 5172.09, 18.45, 1.0, 0, 0, 786603, 1.0)
	DoScreenFadeIn(600)
	Citizen.Wait(4000)
	ToggleHUD(false)
	EnableControls()	
	SetEntityHeading(InteractNPC, Config.NPCSpawn.Heading)
	InteractNPC_CurrentAction = nil
	TriggerServerEvent('genesis_heist_thermal:buyDrill')
end


RegisterNetEvent('genesis_heist_thermal:spawnDrill')
AddEventHandler('genesis_heist_thermal:spawnDrill', function()
	local rand = GetRandomIntInRange(1,  #Config.ThermalPickupLocations)
	local spawn = Config.ThermalPickupLocations[rand]

	RichNotif()

	ESX.ShowNotification('~b~Punkt odbioru przesyłki został oznaczony na GPS')

	blip = AddBlipForCoord(spawn.x, spawn.y, spawn.z)
	SetBlipRoute(blip, true)
	SetBlipSprite(blip, 615)
	SetBlipRouteColour(blip, 76)
	SetBlipColour(blip, 76)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Przesyłka')
	EndTextCommandSetBlipName(blip)

	local coords = vector3(spawn.x, spawn.y, spawn.z-1.0)

	BoxContainerModel = CreateObject(GetHashKey('prop_box_wood08a'), coords.x, coords.y, coords.z, true, true, true)
	PlaceObjectOnGroundProperly(BoxContainerModel)
end)

RegisterNetEvent('genesis_heist_thermal:notif')
AddEventHandler('genesis_heist_thermal:notif', function(msg)
	ESX.ShowNotification(msg)
end)

function RichNotif()	
	SetNotificationTextEntry("STRING")
    AddTextComponentString('~w~Tytuł: ~y~••••• \n~w~Usługa: ~y~•••••. \n~w~Kwota: ~g~'..Config.ThermalDrillCost..'$')
	Citizen.InvokeNative(0x92F0DA1E27DB96DC, 200)
	Citizen.InvokeNative(0x1E6611149DB3DB6B, 'CHAR_BANK_FLEECA', 'CHAR_BANK_FLEECA', true, 7, '-Fleeca Bank-', '~g~Nowa transakcja', 2.0)
    DrawNotification_4(true, true)
end


function EnableControls()
	EnableAllControlActions(0)
	EnableAllControlActions(1)
	EnableAllControlActions(2)
	EnableAllControlActions(3)
	EnableAllControlActions(4)
	EnableAllControlActions(5)
	EnableAllControlActions(6)
	EnableAllControlActions(7)
	EnableAllControlActions(8)
	EnableAllControlActions(9)
	EnableAllControlActions(10)
	EnableAllControlActions(11)
	EnableAllControlActions(12)
	EnableAllControlActions(13)
	EnableAllControlActions(14)
	EnableAllControlActions(15)
	EnableAllControlActions(16)
	EnableAllControlActions(17)
	EnableAllControlActions(18)
	EnableAllControlActions(19)
	EnableAllControlActions(20)
	EnableAllControlActions(21)
	EnableAllControlActions(22)
	EnableAllControlActions(23)
	EnableAllControlActions(24)
	EnableAllControlActions(25)
	EnableAllControlActions(26)
	EnableAllControlActions(27)
	EnableAllControlActions(28)
	EnableAllControlActions(29)
	EnableAllControlActions(30)
	EnableAllControlActions(31)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		if cinema then
		local hasCinema = false
			while cinema do
				Wait(5)
				DrawRect(0.5, 0.075, 1.0, 0.15, 0, 0, 0, 255)
				DrawRect(0.5, 0.925, 1.0, 0.15, 0, 0, 0, 255)
				SetDrawOrigin(0.0, 0.0, 0.0, 0)
				DisplayRadar(false)
			end
		end
	end
end)

Citizen.CreateThread(function()
	local count
	while true do
		Citizen.Wait(0)
		if blockinput then
			count = 1
			DisableAllControlActions(0)
			DisableAllControlActions(1)
			DisableAllControlActions(2)
			DisableAllControlActions(3)
			DisableAllControlActions(4)
			DisableAllControlActions(5)
			DisableAllControlActions(6)
			DisableAllControlActions(7)
			DisableAllControlActions(8)
			DisableAllControlActions(9)
			DisableAllControlActions(10)
			DisableAllControlActions(11)
			DisableAllControlActions(12)
			DisableAllControlActions(13)
			DisableAllControlActions(14)
			DisableAllControlActions(15)
			DisableAllControlActions(16)
			DisableAllControlActions(17)
			DisableAllControlActions(18)
			DisableAllControlActions(19)
			DisableAllControlActions(20)
			DisableAllControlActions(21)
			DisableAllControlActions(22)
			DisableAllControlActions(23)
			DisableAllControlActions(24)
			DisableAllControlActions(25)
			DisableAllControlActions(26)
			DisableAllControlActions(27)
			DisableAllControlActions(28)
			DisableAllControlActions(29)
			DisableAllControlActions(30)
			DisableAllControlActions(31)
		else
		Citizen.Wait(500)
		end
	end
end)

--NPC
AddEventHandler('genesis_heist_thermal:createPed', function()
	if InteractNPC ~= nil then
		return
	end

	local model = GetHashKey(Config.NPCModelName)
	Citizen.CreateThread(function()
		RequestModel(model)

		while not HasModelLoaded(model) do
			Citizen.Wait(1)
		end

		InteractNPC = CreatePed(5, model, Config.NPCSpawn.Pos.x, Config.NPCSpawn.Pos.y, Config.NPCSpawn.Pos.z-1, 0.0, false, true)
		Citizen.Wait(440)
		SetEntityHeading(InteractNPC, Config.NPCSpawn.Heading)
		FreezeEntityPosition(InteractNPC, true)
		SetEntityInvincible(InteractNPC, true)
		SetBlockingOfNonTemporaryEvents(InteractNPC, true)
		TaskStartScenarioInPlace(InteractNPC, 'WORLD_HUMAN_SMOKING', 0, false)
	end)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if InteractNPC ~= nil and InteractNPC_CurrentAction == nil then
			if not IsPedUsingScenario(InteractNPC, 'WORLD_HUMAN_SMOKING') then
				TaskStartScenarioInPlace(InteractNPC, 'WORLD_HUMAN_SMOKING', 0, false)
			end
		else
			Citizen.Wait(500)
		end
	end
end)








-------------------------------------------

--[[
function SpawnDrill(bank)
	DrillObject = CreateObject(GetHashKey(bank.DrillObj), bank.DrillPos.x, bank.DrillPos.y, bank.DrillPos.z, true, true, true)
end--]]