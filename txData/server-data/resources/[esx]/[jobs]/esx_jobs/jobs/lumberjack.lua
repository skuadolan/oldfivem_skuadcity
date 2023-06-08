Config.Jobs.lumberjack = {

	BlipInfos = {
		Sprite = 237,
		Color = 4
	},

	Vehicles = {

		Truck = {
			Spawner = 1,
			Hash = 'phantom',
			Trailer = 'trailers',
			HasCaution = true
		}

	},

	Zones = {

		CloakRoom = {
			Pos = vector3(1200.63, -1276.87, 34.38),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U('lj_locker_room'),
			Type = 'cloakroom',
			Hint = _U('cloak_change')
		},

		Wood = {
			Pos = vector3(-534.32, 5373.79, 69.50),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U('lj_mapblip'),
			Type = 'work',
			Item = {
				{
					name = _U('lj_wood'),
					db_name = 'wood',
					time = 3,
					max = 20,
					add = 1,
					remove = 1,
					requires = 'nothing',
					requires_name = 'Nothing',
					drop = 100
				}
			},
			Hint = _U('lj_pickup')
		},

		CuttedWood = {
			Pos = vector3(-552.21, 5326.90, 72.59),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U('lj_woodcutting'),
			Type = 'work',
			Item = {
				{
					name = _U('lj_cutwood'),
					db_name = 'cutted_wood',
					time = 5,
					max = 20,
					add = 1,
					remove = 1,
					requires = 'wood',
					requires_name = _U('lj_wood'),
					drop = 100
				}
			},
			Hint = _U('lj_cutwood_button')
		},

		Planks = {
			Pos = vector3(-501.38, 5280.53, 79.61),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U('lj_board'),
			Type = 'work',
			Item = {
				{
					name = _U('lj_planks'),
					db_name = 'packaged_plank',
					time = 4,
					max = 100,
					add = 5,
					remove = 1,
					requires = 'cutted_wood',
					requires_name = _U('lj_cutwood'),
					drop = 100
				}
			},
			Hint = _U('lj_pick_boards')
		},

		VehicleSpawner = {
			Pos = vector3(1191.96, -1261.77, 34.17),
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
			Pos = vector3(1194.62, -1286.95, 34.12),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Marker = -1,
			Blip = false,
			Name = _U('service_vh'),
			Type = 'vehspawnpt',
			Spawner = 1,
			Heading = 264.40
		},

		VehicleDeletePoint = {
			Pos = vector3(1216.89, -1229.23, 34.40),
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
			Pos = vector3(1201.35, -1327.51, 34.22),
			Color = {r = 204, g = 204, b = 0},
			Size = {x = 5.0, y = 5.0, z = 3.0},
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
					requires = 'packaged_plank',
					requires_name = _U('lj_planks'),
					drop = 100
				}
			},
			Hint = _U('lj_deliver_button')
		}

	}
}
