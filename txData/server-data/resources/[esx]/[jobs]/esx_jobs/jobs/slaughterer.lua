Config.Jobs.slaughterer = {

	BlipInfos = {
		Sprite = 256,
		Color = 5
	},

	Vehicles = {

		Truck = {
			Spawner = 1,
			Hash = 'benson',
			Trailer = 'none',
			HasCaution = true
		}
	},

	Zones = {

		CloakRoom = {
			Pos = vector3(-1071.13, -2003.78, 14.78),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U('s_slaughter_locker'),
			Type = 'cloakroom',
			Hint = _U('cloak_change')
		},

		AliveChicken = {
			Pos = vector3(-62.90, 6241.46, 30.09),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U('s_hen'),
			Type = 'work',
			Item = {
				{
					name = _U('s_alive_chicken'),
					db_name = 'alive_chicken',
					time = 3,
					max = 20,
					add = 1,
					remove = 1,
					requires = 'nothing',
					requires_name = 'Nothing',
					drop = 100
				}
			},
			Hint = _U('s_catch_hen')
		},

		SlaughterHouse = {
			Pos = vector3(-77.99, 6229.06, 30.09),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U('s_slaughtered'),
			Type = 'work',
			Item = {
				{
					name = _U('s_slaughtered_chicken'),
					db_name = 'slaughtered_chicken',
					time = 5,
					max = 20,
					add = 1,
					remove = 1,
					requires = 'alive_chicken',
					requires_name = _U('s_alive_chicken'),
					drop = 100
				}
			},
			Hint = _U('s_chop_animal')
		},

		Packaging = {
			Pos = vector3(-101.97, 6208.79, 30.02),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U('s_package'),
			Type = 'work',
			Item = {
				{
					name = _U('s_packagechicken'),
					db_name = 'packaged_chicken',
					time = 4,
					max = 100,
					add = 5,
					remove = 1,
					requires = 'slaughtered_chicken',
					requires_name = _U('s_unpackaged'),
					drop = 100
				}
			},
			Hint = _U('s_unpackaged_button')
		},

		VehicleSpawner = {
			Pos = vector3(-1042.94, -2023.25, 12.16),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U('spawn_veh'),
			Type = 'vehspawner',
			Spawner = 1,
			Hint = _U('spawn_veh_button'),
			Caution = 2000
		},

		VehicleSpawnPoint = {
			Pos = vector3(-1048.85, -2025.32, 12.16),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Marker = -1,
			Blip = false,
			Name = _U('service_vh'),
			Type = 'vehspawnpt',
			Spawner = 1,
			Heading = 130.1
		},

		VehicleDeletePoint = {
			Pos = vector3(-1061.51, -2008.35, 12.16),
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

		Delivery = {
			Pos = vector3(-596.15, -889.32, 24.50),
			Color = {r = 204, g = 204, b = 0},
			Size = {x = 5.0, y = 5.0, z = 1.0},
			Marker = 1,
			Blip = true,
			Name = _U('delivery_point'),
			Type = 'delivery',
			Spawner = 1,
			Item = {
				{
					name = _U('delivery'),
					time = 0.5,
					remove = 1,
					max = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price = 50,
					requires = 'packaged_chicken',
					requires_name = _U('s_packagechicken'),
					drop = 100
				}
			},
			Hint = _U('s_deliver')
		}
	}
}
