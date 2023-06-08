Config.Jobs.tailor = {

	BlipInfos = {
		Sprite = 366,
		Color = 4
	},

	Vehicles = {

		Truck = {
			Spawner = 1,
			Hash = 'youga2',
			Trailer = 'none',
			HasCaution = true
		}

	},

	Zones = {

		CloakRoom = {
			Pos = vector3(706.73, -960.90, 29.39),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U('dd_dress_locker'),
			Type = 'cloakroom',
			Hint = _U('cloak_change'),
			GPS = vector3(740.80, -970.06, 23.46)
		},

		Wool = {
			Pos = vector3(1978.92, 5171.70, 46.63),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U('dd_wool'),
			Type = 'work',
			Item = {
				{
					name = _U('dd_wool'),
					db_name = 'wool',
					time = 3,
					max = 40,
					add = 1,
					remove = 1,
					requires = 'nothing',
					requires_name = 'Nothing',
					drop = 100
				}
			},
			Hint = _U('dd_pickup'),
			GPS = vector3(715.95, -959.63, 29.39)
		},

		Fabric = {
			Pos = vector3(715.95, -959.63, 29.39),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U('dd_fabric'),
			Type = 'work',
			Item = {
				{
					name = _U('dd_fabric'),
					db_name = 'fabric',
					time = 5,
					max = 80,
					add = 2,
					remove = 1,
					requires = 'wool',
					requires_name = _U('dd_wool'),
					drop = 100
				}
			},
			Hint = _U('dd_makefabric'),
			GPS = vector3(712.92, -970.58, 29.39)
		},

		Clothe = {
			Pos = vector3(712.92, -970.58, 29.39),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U('dd_clothing'),
			Type = 'work',
			Item = {
				{
					name = _U('dd_clothing'),
					db_name = 'clothe',
					time = 4,
					max = 40,
					add = 1,
					remove = 2,
					requires = 'fabric',
					requires_name = _U('dd_fabric'),
					drop = 100
				}
			},
			Hint = _U('dd_makeclothing'),
			GPS = vector3(429.59, -807.34, 28.49)
		},

		VehicleSpawner = {
			Pos = vector3(740.80, -970.06, 23.46),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U('spawn_veh'),
			Type = 'vehspawner',
			Spawner = 1,
			Hint = _U('spawn_veh_button'),
			Caution = 2000,
			GPS = vector3(1978.92, 5171.70, 46.63)
		},

		VehicleSpawnPoint = {
			Pos = vector3(747.31, -966.23, 23.70),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Marker = -1,
			Blip = false,
			Name = _U('service_vh'),
			Type = 'vehspawnpt',
			Spawner = 1,
			Heading = 270.1,
			GPS = 0
		},

		VehicleDeletePoint = {
			Pos = vector3(693.79, -963.01, 22.82),
			Size = {x = 3.0, y = 3.0, z = 1.0},
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
			Pos = vector3(429.59, -807.34, 28.49),
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
					requires = 'clothe',
					requires_name = _U('dd_clothing'),
					drop = 100
				}
			},
			Hint = _U('dd_deliver_clothes'),
			GPS = vector3(1978.92, 5171.70, 46.63)
		}
	}
}
