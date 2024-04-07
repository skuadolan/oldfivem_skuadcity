Config                 = {}
Config.DrawDistance    = 2.0
Config.Locale          = 'en'

Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = false

Config.carModel = 'zentorno'
Config.motorModel = 'bati'
Config.carMoney = 5000
Config.motorMoney = 10000
Config.getMoney = 25000

Config.Zones = {

	Starterpack = {
		Pos   = vector3(-129.9429, -642.1583, 167.8132),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		markerColor = {r = 255, g = 153, b = 0},
		Color = 60,
		Type = 605,
		Scale = 0.75,
		Marker  = 1
	},

	VehicleSpawnPoint = {
		Pos   = {
			{Coords = vector3(-138.211, -586.6813, 31.99268), Radius = 3.0},
			{Coords = vector3(-139.556, -590.7033, 31.99268), Radius = 3.0},
			{Coords = vector3(-141.178, -594.6198, 31.99268), Radius = 3.0},
			{Coords = vector3(-142.4835, -598.5099, 31.99268), Radius = 3.0},
			{Coords = vector3(-143.8549, -602.5055, 31.99268), Radius = 3.0},
			{Coords = vector3(-145.1209, -606.3297, 31.99268), Radius = 3.0},
			{Coords = vector3(-146.5846, -610.5626, 31.99268), Radius = 3.0},
		},
		Heading = 68.03149,
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1
	}

}