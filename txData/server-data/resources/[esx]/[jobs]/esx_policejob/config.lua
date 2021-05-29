Config                            = {}
--borgol
Config.ArrestDistance				= 3.0

Config.DrawDistance               = 2.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true -- Enable if you want society managing.
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- Enable if you're using esx_identity.
Config.EnableLicenses             = true -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = false -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

Config.EnableJobBlip              = true -- Enable blips for cops on duty, requires esx_society.
Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService           = false -- Enable esx service?
Config.MaxInService               = -1 -- How much people can be in service at once?

Config.Locale                     = 'en'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(452.6, -992.8, 30.6)
		},

		Armories = {
			vector3(451.7, -980.1, 30.6)
		},

		Vehicles = {
			{
				Spawner = vector3(458.44, -1017.12, 28.22),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0},
					{coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0},
					{coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0},
					{coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0}
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0},
					{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(448.4, -973.2, 30.6)
		}

	}

}

Config.AuthorizedWeapons = {
	tamtama = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 10000}
	},

	bripda = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000}
	},

	briptu = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000}
	},

	brigpol = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000}
	},

	bripka = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000}
	},

	aipda = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000}
	},

	aiptu = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000}
	},

	ipda = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000},
		{weapon = 'WEAPON_SMG', price = 50000}
	},

	iptu = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000},
		{weapon = 'WEAPON_SMG', price = 50000}
	},

	akp = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000},
		{weapon = 'WEAPON_SMG', price = 50000}
	},

	kompol = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000},
		{weapon = 'WEAPON_SMG', price = 50000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 50000}
	},

	akbp = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000},
		{weapon = 'WEAPON_SMG', price = 50000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 50000}
	},

	brigjen = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000},
		{weapon = 'WEAPON_SMG', price = 50000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 75000},
		{weapon = 'WEAPON_HEAVYSNIPER', price = 100000}
	},

	irjen = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000},
		{weapon = 'WEAPON_SMG', price = 50000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 75000},
		{weapon = 'WEAPON_HEAVYSNIPER', price = 100000}
	},

	komjen = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000},
		{weapon = 'WEAPON_SMG', price = 50000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 75000},
		{weapon = 'WEAPON_REVOLVER', price = 100000},
		{weapon = 'WEAPON_HEAVYSNIPER', price = 100000}

	},

	boss = {
        {weapon = 'WEAPON_NIGHTSTICK', price = 10000},
		{weapon = 'WEAPON_COMBATPISTOL', price = 20000},
		{weapon = 'WEAPON_SMG', price = 50000},
		{weapon = 'WEAPON_CARBINERIFLE', price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 75000},
		{weapon = 'WEAPON_REVOLVER', price = 100000},
		{weapon = 'WEAPON_HEAVYSNIPER', price = 100000}

	}
}

Config.AuthorizedVehicles = {
	car = {
		tamtama = {
			{model = 'police', price = 10000}
		},

		bripda = {
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		briptu = {
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		brigpol = {
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		bripka = {
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		aipda = {
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		aiptu = {			
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		ipda = {			
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		iptu = {
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		akp = {
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		kompol = {
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		kombes = {
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		akbp = {
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		brigjen = {			
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		irjen = {
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstang', price = 10000}
		},

		komjen = {			
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstangprice', price = 10000},
			{model = 'fbi', price = 10000}
		},

		boss = {			
			{model = 'police', price = 10000},
			{model = 'police2', price = 10000},
			{model = 'polb', price = 10000},
			{model = 'sheriff', price = 10000},
			{model = 'sheriff2', price = 10000},
			{model = 'sanchezpol', price = 10000},
			{model = 'riot', price = 10000},
			{model = 'riota', price = 10000},
			{model = 'insurgent2', price = 10000},
			{model = 'polthrust', price = 10000},
			{model = '2015polstangprice', price = 10000},
			{model = 'fbi', price = 10000}
		}
	},

	helicopter = {
		tamtama = {},
		bripda = {},
		briptu = {},
		brigpol = {},
		bripka = {},
		aipda = {},
		aiptu = {},
		ipda = {},
		iptu = {},
		akp = {},
		kompol = {},
		akbp = {},
		kombes = {},

		brigjen = {
            {model = 'polmav', props = {modLivery = 0}, price = 30000}
		},

		irjen = {
            {model = 'polmav', props = {modLivery = 0}, price = 30000}
        },
		
		komjen = {
            {model = 'polmav', props = {modLivery = 0}, price = 30000}
        },

		boss = {
			{model = 'polmav', props = {modLivery = 0}, price = 30000}
		}
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	recruit = {},

	officer = {},

	irjen = {},

	komjen = {},

	boss = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	tamtama = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 150,   torso_2 = 11,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	bripda = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 150,   torso_2 = 10,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	briptu = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 150,   torso_2 = 9,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	brigpol = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 150,   torso_2 = 8,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	bripka = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 150,   torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	aipda = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 150,   torso_2 = 6,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	aiptu = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 150,   torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ipda = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 150,   torso_2 = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	iptu = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 150,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	akp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 150,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	kompol = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 150,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
	},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	akbp = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 150,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	irjen = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 149,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
	},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	brigjen = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 149,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
	},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	komjen = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 149,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
	},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	boss = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 149,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 28,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
	},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 2,  bproof_2 = 0
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},

	gilet_wear = {
		male = {
			helmet_1 = 118,  helmet_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1
		}
	},

	baju_lapangan = {
		male = {
			helmet_1 = 118,  helmet_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1
		}
	}
}
