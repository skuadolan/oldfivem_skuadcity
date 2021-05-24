Config                            = {}

Config.DrawDistance               = 20.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).

Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 700  -- Revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = false -- Enable anti-combat logging? (Removes Items when a player logs back after intentionally logging out while dead.)
Config.LoadIpl                    = true -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

Config.EarlyRespawnTimer          = 60000 * 15  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 15 -- time til the player bleeds out

Config.EnablePlayerManagement     = true -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath  = false
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = false

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 15000

Config.RespawnPoint = {coords = vector3(341.0, -1397.3, 32.5), heading = 48.5}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(301.42, -599.03, 42.28),
			sprite = 61,
			scale  = 1.2,
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
			{model = 'ambulance', price = 5000}
		},

		perawat = {
			{model = 'ambulance', price = 5000}
		},

		asisten_doctor = {
			{model = 'ambulance', price = 4500}
		},

		chief_doctor = {
			{model = 'ambulance', price = 4500}
		},

		asisten_boss = {
			{model = 'ambulance', price = 3000}
		},

		boss = {
			{model = 'ambulance', price = 2000}
		}
	},

	helicopter = {

		asisten_perawat = {
			{model = 'polmav', price = 5000}
		},

		perawat = {
			{model = 'polmav', price = 5000}
		},

		asisten_doctor = {
			{model = 'polmav', price = 4500}
		},

		chief_doctor = {
			{model = 'polmav', price = 4500}
		},

		asisten_boss = {
			{model = 'polmav', price = 3000}
		},

		boss = {
			{model = 'polmav', price = 2000}
		}
	}
}
