--------------------------------
---COPYRIGHT © AndroX23#9971---
--------------------------------

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

local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastStation             = nil
local LastPart                = nil
local LastPartNum             = nil
local LastEntity              = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local IsHandcuffed            = false
local HandcuffTimer           = {}
local DragStatus              = {}
DragStatus.IsDragged          = false
local hasAlreadyJoined        = false
local blipsCops               = {}
local isDead                  = false
local CurrentTask             = {}
local playerInService         = false

local maAuto = false

local Kopie = false

local JobMapBlip2             = nil
local JobMapBlip3            = nil

local pole1 = nil
local pole2 = nil
local pole3 = nil
local pole4 = nil
local pole5 = nil
local ploned1 = false
local ploned2 = false
local ploned3 = false
local ploned4 = false
local ploned5 = false

local HaveDMV                 = true
local jobVehicle              = nil

local PlayerDoingJob          = false
local BlipsSetup              = false
ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
	JobMapBlip()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	JobMapBlip()
end)

RegisterNetEvent('AndroxFarmerJob:UstalPrace')
AddEventHandler('AndroxFarmerJob:UstalPrace', function(obecnapraca)
	PlayerData.job = obecnapraca
	PlayerData.job.name = obecnapraca
	JobMapBlip()
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local Prodaj = false
local Sekundi = 60

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if Prodaj then
			local Gracz = GetPlayerPed(-1)
			local Polozaj = GetEntityCoords(Gracz)
			ESX.Game.Utils.DrawText3D(Polozaj, "Lain ~b~"..Sekundi.."~s~ detik~n~sampai akhir penjualan...", 0.9)
			if Sekundi < 1 then
				Prodaj = false
				Sekundi = 60
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if Prodaj then
			Sekundi = Sekundi - 1
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if Kopie then
			Polozaj = GetEntityCoords(GetPlayerPed(-1))
			ESX.Game.Utils.DrawText3D(Polozaj, "Mengambil ~b~Dikumpulkan~s~ nilai...", 0.6)
		end
	end
end)

-- Display marker
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(1)

		if PlayerData.job ~= nil then

			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)

			if PlayerDoingJob and BlipsSetup then


        if GetDistanceBetweenCoords(coords, 1946.670, 5018.533, 42.952, true) < 15.0 and ploned1 == true then
          local Polozaj = {
            ["x"] = 1946.670,
            ["y"] = 5018.533,
            ["z"] = 42.952 - 1
          }
          ESX.Game.Utils.DrawText3D(Polozaj, "Klik [~g~E~s~] untuk menggali kentang", 0.5)
        end
        if GetDistanceBetweenCoords(coords, 1941.715, 5022.883, 42.634, true) < 15.0 and ploned2 == true then
          local Polozaj2 = {
            ["x"] = 1941.715,
            ["y"] = 5022.883,
            ["z"] = 42.634
          }
          ESX.Game.Utils.DrawText3D(Polozaj2, "Klik [~g~E~s~] untuk menggali kentang", 0.5)
        end
        if GetDistanceBetweenCoords(coords, 1940.599, 5013.583, 42.634, true) < 15.0 and ploned3 == true then
          local Polozaj3 = {
            ["x"] = 1940.599,
            ["y"] = 5013.583,
            ["z"] = 42.634
          }
          ESX.Game.Utils.DrawText3D(Polozaj3, "Klik [~g~E~s~] untuk menggali kentang", 0.5)
        end
        if GetDistanceBetweenCoords(coords, 1938.436, 5020.075, 43.060, true) < 15.0 and ploned4 == true then
          local Polozaj4 = {
            ["x"] = 1938.436,
            ["y"] = 5020.075,
            ["z"] = 43.060
          }
          ESX.Game.Utils.DrawText3D(Polozaj4, "Klik [~g~E~s~] untuk menggali kentang", 0.5)
        end
        if GetDistanceBetweenCoords(coords, 1930.202, 5004.469, 43.728, true) < 20.0 and ploned5 == true then
          local Polozaj5 = {
            ["x"] = 1930.202,
            ["y"] = 5004.469,
            ["z"] = 43.728
          }
          ESX.Game.Utils.DrawText3D(Polozaj5, "Klik [~g~E~s~] untuk menggali kentang", 0.5)
        end

				if GetDistanceBetweenCoords(coords, 1946.670, 5018.533, 42.952, true) < 2.0 and ploned1 == true then
					--ESX.ShowHelpNotification('Drzi ~INPUT_CONTEXT~ da uberes zetvu.')

					if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, true)
						Kopie = true
						DrawSubtitleTimed(20000, 1)
						Citizen.Wait(20000)
						ClearPedTasksImmediately(GetPlayerPed(-1))
						RemoveBlip(pole1)
						local rand = math.random(5, 10)
						TriggerServerEvent('AndroxFarmerJob:giveItem', 'kecubung', rand)	--world_human_gardener_plant
						PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
						----TriggerEvent('crazy-energy:takeEnergy', math.random(5000, 15000))
						PlaySoundFrontend(-1, "MEDAL_GOLD", "HUD_AWARDS", 0);
						ploned1 = false
						Kopie = false
					end
				end

				if GetDistanceBetweenCoords(coords, 1941.715, 5022.883, 42.634, true) < 2.0 and ploned2 == true then
					--ESX.ShowHelpNotification('Drzi ~INPUT_CONTEXT~ da uberes zetvu.')

					if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, true)
						Kopie = true
						DrawSubtitleTimed(20000, 1)
						Citizen.Wait(20000)
						ClearPedTasksImmediately(GetPlayerPed(-1))
						RemoveBlip(pole2)
						local rand = math.random(5, 10)
						TriggerServerEvent('AndroxFarmerJob:giveItem', 'kecubung', rand)
						PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
						PlaySoundFrontend(-1, "MEDAL_GOLD", "HUD_AWARDS", 0);
						--TriggerEvent('crazy-energy:takeEnergy', math.random(5000, 15000))
						ploned2 = false
						Kopie = false
					end
				end

				if GetDistanceBetweenCoords(coords, 1940.599, 5013.583, 42.634, true) < 2.0 and ploned3 == true then
					--ESX.ShowHelpNotification('drzi ~INPUT_CONTEXT~ da ubere zetvu.')

					if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, true)
						Kopie = true
						DrawSubtitleTimed(20000, 1)
						Citizen.Wait(20000)
						ClearPedTasksImmediately(GetPlayerPed(-1))
						RemoveBlip(pole3)
						local rand = math.random(5, 10)
						TriggerServerEvent('AndroxFarmerJob:giveItem', 'kecubung', rand)
						PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
						PlaySoundFrontend(-1, "MEDAL_GOLD", "HUD_AWARDS", 0);
						--TriggerEvent('crazy-energy:takeEnergy', math.random(5000, 15000))
						ploned3 = false
						Kopie = false
					end
				end

				if GetDistanceBetweenCoords(coords, 1938.436, 5020.075, 43.060, true) < 2.0 and ploned4 == true then
					--ESX.ShowHelpNotification('drzi ~INPUT_CONTEXT~ da ubere zetvu.')

					if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, true)
						Kopie = true
						DrawSubtitleTimed(20000, 1)
						Citizen.Wait(20000)
						ClearPedTasksImmediately(GetPlayerPed(-1))
						RemoveBlip(pole4)
						local rand = math.random(5, 10)
						TriggerServerEvent('AndroxFarmerJob:giveItem', 'kecubung', rand)
						PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
						PlaySoundFrontend(-1, "MEDAL_GOLD", "HUD_AWARDS", 0);
						--TriggerEvent('crazy-energy:takeEnergy', math.random(5000, 15000))
						ploned4 = false
						Kopie = false
					end
				end

				if GetDistanceBetweenCoords(coords, 1930.202, 5004.469, 43.728, true) < 2.0 and ploned5 == true then
					--ESX.ShowHelpNotification('drzi ~INPUT_CONTEXT~ da ubere zetvu.')

					if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, true)
						Kopie = true
						DrawSubtitleTimed(20000, 1)
						Citizen.Wait(20000)
						ClearPedTasksImmediately(GetPlayerPed(-1))
						RemoveBlip(pole5)
						local rand = math.random(5, 10)
						TriggerServerEvent('AndroxFarmerJob:giveItem', 'kecubung', rand)
						PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
						PlaySoundFrontend(-1, "MEDAL_GOLD", "HUD_AWARDS", 0);
						--TriggerEvent('crazy-energy:takeEnergy', math.random(5000, 15000))
						ploned5 = false
						Kopie = false
					end
				end

				--vozilo

				if GetDistanceBetweenCoords(coords, 2010.932, 4969.550, 41.572, true) < 2.0 then
					--ESX.ShowHelpNotification('Drzi ~INPUT_CONTEXT~ da izvuces vozilo iz garaze.')

					if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil then
						if not IsPedInAnyVehicle(GetPlayerPed(-1), false) and not maAuto then
							maAuto = true
							if HaveDMV then
								local cord = { x = 2010.932, y = 4969.550, z = 41.572 }

								--DisplayHelpText(_U('Vozilo se ucitava...'))
								DrawSubtitleTimed(5000, 1)
								--Citizen.Wait(5000)
									--TriggerEvent('crazy-energy:takeEnergy', math.random(2000, 4000))
									PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)

										ESX.Game.SpawnVehicle('paradise', cord, 307.5, function(vehicle)
											jobVehicle = vehicle
											SetVehicleLivery(vehicle, 2)
											TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
										end)
						
							else
								Notif('Ne mogu da te pustim da vozis! Nemate vozacku dozvolu!')
							end
						elseif not IsPedInAnyVehicle(GetPlayerPed(-1), false) and maAuto then
							Notif('Vec ste dobili vozilo')
						end
					end

					if IsControlJustReleased(0, 38) and IsPedSittingInVehicle(GetPlayerPed(-1), jobVehicle) then
						Notif('Dostavno vozilo ostaviti po strani! Sada možete da izaberete drugu!')
						Notif('Hvala na trudu!')
						maAuto = false
						local pojazd = GetVehiclePedIsIn(GetPlayerPed(-1), false)
						DeleteVehicle(pojazd)
						DeleteEntity(pojazd)
					end
				end

				--Prodaja

				if GetDistanceBetweenCoords(coords, 428.073, 6477.219, 27.860, true) < 2.0 and IsPedSittingInVehicle(GetPlayerPed(-1), jobVehicle) then
					--ESX.ShowHelpNotification('Drzi ~INPUT_CONTEXT~ za istovar tereta')

					if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil then

						SetVehicleEngineOn(jobVehicle, false, true, false)
						TriggerEvent("pNotify:SendNotification", {text = 'Istovar je u toku...'})
						Prodaj = true
						DrawSubtitleTimed(30000, 1)
						FreezeEntityPosition(jobVehicle, true)
						SetVehicleUndriveable(jobVehicle, true)
						Notif('Krompiri polako rastu idi na njivu za njih')
						maAuto = false
						Notif('Mozete zameniti vozilo')
						Citizen.Wait(30000)
						Prodaj = false
						Sekundi = 60
						TriggerServerEvent('AndroxFarmerJob:sellItem', 'kecubung')
						--TriggerEvent('crazy-energy:takeEnergy', math.random(10000, 20000))
						FreezeEntityPosition(jobVehicle, false)
						SetVehicleUndriveable(jobVehicle, false)
						SetVehicleEngineOn(jobVehicle, true, true, false)
						reGrow()
					end
				end



				if not IsPedSittingInVehicle(GetPlayerPed(-1), jobVehicle) then
					local vehcord = GetEntityCoords(jobVehicle)

					DrawMarker(22, vehcord.x, vehcord.y, vehcord.z+2.5, 0.0, 0.0, 0.0, 0, 0, 0, 2.0, 3.0, 1.0, 244, 176, 66, 80, true, true, 2, false, nil, nil, false)
				end

			end

			if PlayerDoingJob and GetDistanceBetweenCoords(coords, 2010.932, 4969.550, 41.572, true) < 40.0 then
				if not IsPedInAnyVehicle(GetPlayerPed(-1), false) and not maAuto then
					local Polozaj = {
						["x"] = 2010.932,
						["y"] = 4969.550,
						["z"] = 41.572 + 0.5
					}
					ESX.Game.Utils.DrawText3D(Polozaj, "Klik [~g~E~s~]  untuk mengambil van", 0.8)
				elseif IsPedSittingInVehicle(GetPlayerPed(-1), jobVehicle) then
					local Polozaj = {
						["x"] = 2010.932,
						["y"] = 4969.550,
						["z"] = 41.572 + 0.5
					}
					ESX.Game.Utils.DrawText3D(Polozaj, "Klik [~g~E~s~]  untuk mengambil van", 0.8)
				end
			end

			if PlayerDoingJob and GetDistanceBetweenCoords(coords, 438.308, 6470.696, 38.816, true) < 40.0 then
				--DrawMarker(27, 428.073, 6477.219, 27.860, 0.0, 0.0, 0.0, 0, 0, 0, 5.0, 5.0, 1.0, 244, 176, 66, 140, false, false, 2, false, nil, nil, false)
        local Polozaj = {
         	["x"] = 428.073,
          	["y"] = 6477.219,
          	["z"] = 27.860 + 1.5
        }
        ESX.Game.Utils.DrawText3D(Polozaj, "tekan [~g~E~s~] untuk membongkar kargo", 1.0)
			end

		else
			Citizen.Wait(500)
		end

	end
end)

function reGrow()
	Citizen.Wait(300000)
	Notif('Tanaman siap panen!')
	SetupBlips()
end

function JobMapBlip()
	if PlayerData.job ~= nil then
		for k,v in pairs(Config.Farm) do
			JobMapBlip2 = AddBlipForCoord(v.Blip.Pos.x, v.Blip.Pos.y, v.Blip.Pos.z)

			SetBlipSprite (JobMapBlip2, v.Blip.Sprite)
			SetBlipDisplay(JobMapBlip2, v.Blip.Display)
			SetBlipScale  (JobMapBlip2, v.Blip.Scale)
			SetBlipColour (JobMapBlip2, v.Blip.Colour)
			SetBlipAsShortRange(JobMapBlip2, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('1. '.._U('map_blip'))
			EndTextCommandSetBlipName(JobMapBlip2)
		end
    if PlayerData.job ~= nil then
    JobMapBlipGaraz = AddBlipForCoord(2010.932, 4969.550, 41.572)

    SetBlipSprite (JobMapBlipGaraz, 479)
    SetBlipDisplay(JobMapBlipGaraz, 4)
    SetBlipScale  (JobMapBlipGaraz, 0.8)
    SetBlipColour (JobMapBlipGaraz, 5)
    SetBlipAsShortRange(JobMapBlipGaraz, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("3. Vehicle selection")
    EndTextCommandSetBlipName(JobMapBlipGaraz)
    end

			JobMapBlip3 = AddBlipForCoord(438.308, 6470.696, 38.816)

			SetBlipSprite (JobMapBlip3, 431)
			SetBlipDisplay(JobMapBlip3, 4)
			SetBlipScale  (JobMapBlip3, 0.7)
			SetBlipColour (JobMapBlip3, 5)
			SetBlipAsShortRange(JobMapBlip3, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("4. ".._U('map_blip2'))
			EndTextCommandSetBlipName(JobMapBlip3)

	else
		if JobMapBlip2 ~= nil then
			RemoveBlip(JobMapBlip2)
		end
		if JobMapBlip3 ~= nil then
			RemoveBlip(JobMapBlip3)
		end
	end
end

function KillBlip(blipName)
	RemoveBlip(blipName)
end

function Notif(msg)
  TriggerEvent("pNotify:SendNotification", {text = msg})
end

function SetupBlips()
	pole1 = AddBlipForCoord(1946.670, 5018.533, 42.952)

	SetBlipSprite (pole1, 1)
	SetBlipDisplay(pole1, 4)
	SetBlipScale  (pole1, 0.6)
	SetBlipColour (pole1, 43)
	SetBlipAsShortRange(pole1, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('2. '.._U('poles'))
	EndTextCommandSetBlipName(pole1)

	pole2 = AddBlipForCoord(1941.715, 5022.883, 42.634)

	SetBlipSprite (pole2, 1)
	SetBlipDisplay(pole2, 4)
	SetBlipScale  (pole2, 0.6)
	SetBlipColour (pole2, 43)
	SetBlipAsShortRange(pole2, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('poles'))
	EndTextCommandSetBlipName(pole2)

	pole3 = AddBlipForCoord(1940.599, 5013.583, 42.634)

	SetBlipSprite (pole3, 1)
	SetBlipDisplay(pole3, 4)
	SetBlipScale  (pole3, 0.6)
	SetBlipColour (pole3, 43)
	SetBlipAsShortRange(pole3, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('poles'))
	EndTextCommandSetBlipName(pole3)

	pole4 = AddBlipForCoord(1938.436, 5020.075, 43.060)

	SetBlipSprite (pole4, 1)
	SetBlipDisplay(pole4, 4)
	SetBlipScale  (pole4, 0.6)
	SetBlipColour (pole4, 43)
	SetBlipAsShortRange(pole4, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('poles'))
	EndTextCommandSetBlipName(pole4)

	pole5 = AddBlipForCoord(1930.202, 5004.469, 43.728)

	SetBlipSprite (pole5, 1)
	SetBlipDisplay(pole5, 4)
	SetBlipScale  (pole5, 0.6)
	SetBlipColour (pole5, 43)
	SetBlipAsShortRange(pole5, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('poles'))
	EndTextCommandSetBlipName(pole5)

	ploned1 = true
	ploned2 = true
	ploned3 = true
	ploned4 = true
	ploned5 = true
end

function SetupJob()
	SetupBlips()
	BlipsSetup = true
end

function CheckJob()
	local canWork = false

	--TriggerEvent('esx_status:getStatus', 'energy', function(status)
		--local energy = status.val
		--if energy >= Config.JobNeed then
			canWork = true
		--else
		--	canWork = false
		--end
	--end)

	return canWork
end

-- Key Controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(10)

		--local PlayerPed = PlayerId()

		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 2012.865, 4994.723, 41.173, true) < 10.0 and PlayerData.job ~= nil then
			--ESX.ShowHelpNotification('Klik ~INPUT_CONTEXT~ da počnem da radim kao poljoprivrednik!')
			local Polozaj = {
				["x"] = 2012.865,
				["y"] = 4994.723,
				["z"] = 41.173
			}
			ESX.Game.Utils.DrawText3D(Polozaj, "tekan [~g~E~s~] untuk memulai penggalian", 0.6)

			if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 2012.865, 4994.723, 41.173, true) < 2.0 then
				if PlayerDoingJob then
					if PlayerDoingJob then
						Notif('Već ste započeli posao!')
					end
				else
					local canWork = CheckJob()

					if canWork == nil then
						Citizen.Wait(500)
					end

					if canWork then
						--SetupJob()
						PlayerDoingJob = true
						Notif('Kami sedang mempersiapkan tempat kerja Anda!')
						PlaySoundFrontend(-1, "10s", "MP_MISSION_COUNTDOWN_SOUNDSET", 0)
						Wait(10000)
						--PlaySoundFrontend(-1, "DRUG_TRAFFIC_AIR_BOMB_DROP_ERROR_MASTER", 0, 1)
						Notif('Anda memulai bisnis! Pergi ke ladang terdekat untuk memanen')
						SetupJob()
					elseif not canWork then
						Notif('Anda tampak lelah! Kamu perlu istirahat!')
					end
				end
			end
		end
	end
end)

--------------------------------
---COPYRIGHT © AndroX23#9971---
--------------------------------