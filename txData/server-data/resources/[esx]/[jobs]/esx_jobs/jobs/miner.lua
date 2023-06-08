Config.Jobs.miner = {

	BlipInfos = {
		Sprite = 318,
		Color = 5
	},

	Vehicles = {

		Truck = {
			Spawner = 1,
			Hash = 'rubble',
			Trailer = 'none',
			HasCaution = true
		}

	},

	Zones = {

		CloakRoom = {
			Pos = vector3(892.35, -2172.77, 31.28),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U('m_miner_locker'),
			Type = 'cloakroom',
			Hint = _U('cloak_change'),
			GPS = vector3(884.86, -2176.51, 29.51)
		},

		Mine = {
			Pos = vector3(2962.40, 2746.20, 42.39),
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U('m_rock'),
			Type = 'work',
			Item = {
				{
					name = _U('m_rock'),
					db_name = 'stone',
					time = 3,
					max = 7,
					add = 1,
					remove = 1,
					requires = 'nothing',
					requires_name = 'Nothing',
					drop = 100
				}
			},
			Hint = _U('m_pickrocks'),
			GPS = vector3(289.24, 2862.90, 42.64)
		},

		StoneWash = {
			Pos = vector3(289.24, 2862.90, 42.64),
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U('m_washrock'),
			Type = 'work',
			Item = {
				{
					name = _U('m_washrock'),
					db_name = 'washed_stone',
					time = 5,
					max = 7,
					add = 1,
					remove = 1,
					requires = 'stone',
					requires_name = _U('m_rock'),
					drop = 100
				}
			},
			Hint = _U('m_rock_button'),
			GPS = vector3(1109.14, -2007.87, 30.01)
		},

		Foundry = {
			Pos = vector3(1109.14, -2007.87, 30.01),
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U('m_rock_smelting'),
			Type = 'work',
			Item = {
				{
					name = _U('m_copper'),
					db_name = 'copper',
					time = 4,
					max = 56,
					add = 8,
					remove = 1,
					requires = 'washed_stone',
					requires_name = _U('m_washrock'),
					drop = 100
				},
				{
					name = _U('m_iron'),
					db_name = 'iron',
					max = 42,
					add = 6,
					drop = 100
				},
				{
					name = _U('m_gold'),
					db_name = 'gold',
					max = 21,
					add = 3,
					drop = 100
				},
				{
					name = _U('m_diamond'),
					db_name = 'diamond',
					max = 50,
					add = 1,
					drop = 5
				}
			},
			Hint = _U('m_melt_button'),
			GPS = vector3(-169.48, -2659.16, 5.00)
		},

		VehicleSpawner = {
			Pos = vector3(884.86, -2176.51, 29.51),
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U('spawn_veh'),
			Type = 'vehspawner',
			Spawner = 1,
			Hint = _U('spawn_veh_button'),
			Caution = 2000,
			GPS = vector3(2962.40, 2746.20, 42.39)
		},

		VehicleSpawnPoint = {
			Pos = vector3(879.55, -2189.79, 29.51),
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Marker = -1,
			Blip = false,
			Name = _U('service_vh'),
			Type = 'vehspawnpt',
			Spawner = 1,
			Heading = 90.1,
			GPS = 0
		},

		VehicleDeletePoint = {
			Pos = vector3(881.93, -2198.01, 29.51),
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Color = {r = 255, g = 0, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U('return_vh'),
			Type = 'vehdelete',
			Hint = _U('return_vh_button'),
			Spawner = 1,
			Caution = 2000,
			GPS = 0,
			Teleport = 0
		},

		CopperDelivery = {
			Pos = vector3(-169.481, -2659.16, 5.00103),
			Color = {r = 204, g = 204, b = 0},
			Size = {x = 5.0, y = 5.0, z = 3.0},
			Marker = 1,
			Blip = true,
			Name = _U('m_sell_copper'),
			Type = 'delivery',
			Spawner = 1,
			Item = {
				{
					name = _U('delivery'),
					time = 0.5,
					remove = 1,
					max = 56, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 10,
					requires = 'copper',
					requires_name = _U('m_copper'),
					drop = 100
				}
			},
			Hint = _U('m_deliver_copper'),
			GPS = vector3(-148.78, -1040.38, 26.27)
		},

		IronDelivery = {
			Pos = vector3(-148.78, -1040.38, 26.27),
			Color = {r = 204, g = 204, b = 0},
			Size = {x = 5.0, y = 5.0, z = 3.0},
			Marker = 1,
			Blip = true,
			Name = _U('m_sell_iron'),
			Type = 'delivery',
			Spawner = 1,
			Item = {
				{
					name = _U('delivery'),
					time = 0.5,
					remove = 1,
					max = 42, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 25,
					requires = 'iron',
					requires_name = _U('m_iron'),
					drop = 100
				}
			},
			Hint = _U('m_deliver_iron'),
			GPS = vector3(261.48, 207.35, 109.28)
		},

		GoldDelivery = {
			Pos = vector3(261.48, 207.35, 109.28),
			Color = {r = 204, g = 204, b = 0},
			Size = {x = 5.0, y = 5.0, z = 3.0},
			Marker = 1,
			Blip = true,
			Name = _U('m_sell_gold'),
			Type = 'delivery',
			Spawner = 1,
			Item = {
				{
					name = _U('delivery'),
					time = 0.5,
					remove = 1,
					max = 21, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 50,
					requires = 'gold',
					requires_name = _U('m_gold'),
					drop = 100
				}
			},
			Hint = _U('m_deliver_gold'),
			GPS = vector3(-621.04, -228.53, 37.05)
		},

		DiamondDelivery = {
			Pos = vector3(-621.04, -228.53, 37.05),
			Color = {r = 204, g = 204, b = 0},
			Size = {x = 5.0, y = 5.0, z = 3.0},
			Marker = 1,
			Blip = true,
			Name = _U('m_sell_diamond'),
			Type = 'delivery',
			Spawner = 1,
			Item = {
				{
					name = _U('delivery'),
					time = 0.5,
					remove = 1,
					max = 50, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 250,
					requires = 'diamond',
					requires_name = _U('m_diamond'),
					drop = 100
				}
			},
			Hint = _U('m_deliver_diamond'),
			GPS = vector3(2962.40, 2746.20, 42.39)
		}

	}
}
