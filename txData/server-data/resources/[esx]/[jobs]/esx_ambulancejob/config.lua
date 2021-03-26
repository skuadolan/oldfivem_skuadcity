Config                            = {}

Config.DrawDistance               = 20.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).

Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 700  -- Revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- Enable anti-combat logging? (Removes Items when a player logs back after intentionally logging out while dead.)
Config.LoadIpl                    = true -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 60000 * 15  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 20 -- time til the player bleeds out

Config.EnablePlayerManagement     = true -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath  = false
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = false

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 7500

Config.RespawnPoint = {coords = vector3(359.47, -597.37, 43.28), heading = 48.5}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(296.03, -583.97, 43.15),
			sprite = 61,
			scale  = 0.95,
			color  = 2
		},

		AmbulanceActions = {
			vector3(301.68, -598.96, 43.28)
		},

		Pharmacies = {
			vector3(309.65, -568.44, 43.28)
		},

		Vehicles = {
			{
				Spawner = vector3(294.84, -600.65, 43.3),
				InsideShop = vector3(365.19, -572.93, 39.31),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(280.34, -611.56, 43.18), heading = 69.94, radius = 4.0},
					{coords = vector3(280.34, -611.56, 43.18), heading = 69.94, radius = 4.0},
					{coords = vector3(280.34, -611.56, 43.18), heading = 69.94, radius = 4.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(341.52, -581.39, 74.17),
				InsideShop = vector3(314.62, -576.35, 94.48),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(350.91, -587.83, 74.17), heading = 152.21, radius = 10.0},
					{coords = vector3(350.91, -587.83, 74.17), heading = 152.21, radius = 10.0}
				}
			}
		},

		FastTravels = {
			{
				From = vector3(294.7, -1448.1, 29.0),
				To = {coords = vector3(272.8, -1358.8, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(275.3, -1361, 23.5),
				To = {coords = vector3(295.8, -1446.5, 28.9), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(247.3, -1371.5, 23.5),
				To = {coords = vector3(333.1, -1434.9, 45.5), heading = 138.6},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = {coords = vector3(249.1, -1369.6, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = {coords = vector3(320.9, -1478.6, 28.8), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = {coords = vector3(238.6, -1368.4, 23.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{model = 'qrv', price = 5000},
            {model = 'psp_bmwgs', price = 5000}
		},

		doctor = {
			{model = 'qrv', price = 5000},
            {model = 'psp_bmwgs', price = 5000}
		},

		chief_doctor = {
			{model = 'dodgeems', price = 5000},
			{model = 'qrv', price = 5000},
            {model = 'psp_bmwgs', price = 5000}
		},

		boss = {
			{model = 'dodgeems', price = 5000},
			{model = 'qrv', price = 5000},
            {model = 'psp_bmwgs', price = 5000}
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{model = 'supervolito', price = 15000}
		},

		chief_doctor = {
			{model = 'supervolito', price = 15000}
		},

		boss = {
			{model = 'supervolito', price = 15000}
		}
	}
}
