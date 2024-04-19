Config                            = {}

Config.Keys = {
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

Config.DrawDistance               = 2.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).

Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 100  -- Revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = false -- Enable anti-combat logging? (Removes Items when a player logs back after intentionally logging out while dead.)
Config.LoadIpl                    = false -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

Config.EarlyRespawnTimer          = 60000 * 25  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 25 -- time til the player bleeds out

Config.EnablePlayerManagement     = true -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 0

Config.RespawnPoint = {coords = vector3(351.75,-588.54,43.28), heading = 68.44}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(301.42, -599.03, 42.28),
			sprite = 61,
			scale  = 0.75,
			color  = 2
		},

		AmbulanceActions = {
			vector3(301.42, -599.03, 42.28)
		},

		Pharmacies = {
			vector3(0, 0, 0)
		},

		Vehicles = {
			{
				Spawner = vector3(298.84, -571.67, 43.26),
				InsideShop = vector3(228.5, -993.5, -99.5),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(290.4, -581.56, 42.92), heading = 341.35, radius = 4.0},
					{coords = vector3(288.0, -588.69, 42.91), heading = 341.35, radius = 4.0},
					{coords = vector3(285.6, -595.77, 42.91), heading = 341.35, radius = 4.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(341.69, -581.64, 74.17),
				InsideShop = vector3(315.73, -576.52, 94.88),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(353.39, -589.53, 74.55), heading = 68.69, radius = 10.0}
				}
			}
		},

		FastTravels = {
			{
				From = vector3(0, 0, 0),
				To = {coords = vector3(0, 0, 0), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},
		},

		FastTravelsPrompt = {
			{
				From = vector3(0, 0, 0),
				To = {coords = vector3(0, 0, 0), heading = 0.0},
				Marker = {type = 21, x = 0.5, y = 0.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(0, 0, 0),
				To = {coords = vector3(0, 0, 0), heading = 0.0},
				Marker = {type = 21, x = 0.5, y = 0.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		asisten_perawat = {
		},

		perawat = {
			{model = 'ambulance', price = 150}
		},

		asisten_doctor = {
			{model = 'ambulance', price = 150}
		},

		chief_doctor = {
			{model = 'ambulance', price = 150}
		},

		asisten_boss = {
			{model = 'ambulance', price = 150}
		},

		boss = {
			{model = 'ambulance', price = 150}
		}
	},

	helicopter = {

		asisten_perawat = {
			
		},

		perawat = {
		},

		asisten_doctor = {
		},

		chief_doctor = {
		},

		asisten_boss = {
			{model = 'polmav', price = 500}
		},

		boss = {
			{model = 'polmav', price = 500}
		}
	}
}
