Config.Jobs.reporter = {

	BlipInfos = {
		Sprite = 184,
		Color = 1
	},

	Vehicles = {

		Truck = {
			Spawner = 1,
			Hash = 'rumpo',
			Trailer = 'none',
			HasCaution = true
		}

	},

	Zones = {

		VehicleSpawner = {
			Pos = vector3(-141.41, -620.80, 167.82),
			Size = {x = 2.0, y = 2.0, z = 0.2},
			Color = {r = 204, g = 204, b = 0},
			Marker = 1,
			Blip = true,
			Name = _U('reporter_name'),
			Type = 'vehspawner',
			Spawner = 1,
			Hint = _U('reporter_garage'),
			Caution = 2000
		},

		VehicleSpawnPoint = {
			Pos = vector3(-149.32, -592.17, 31.42),
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Marker = -1,
			Blip = false,
			Name = _U('service_vh'),
			Type = 'vehspawnpt',
			Spawner = 1,
			Heading = 200.1
		},

		VehicleDeletePoint = {
			Pos = vector3(-144.22, -577.02, 31.42),
			Size = {x = 5.0, y = 5.0, z = 0.2},
			Color = {r = 255, g = 0, b = 0},
			Marker = 1,
			Blip = false,
			Name = _U('return_vh'),
			Type = 'vehdelete',
			Hint = _U('return_vh_button'),
			Spawner = 1,
			Caution = 2000,
			GPS = 0,
			Teleport = vector3(-139.09, -620.74, 167.82)
		}

	}
}
