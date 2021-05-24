Config                        = {}
Config.DrawDistance           = 10.0
Config.Locale                 = 'en'

local seconde = 1000
local minute = 60 * seconde

Config.Fridge = {
	ngoreng = 200,
	nbungkus = 200,
	tehmanis = 200,
	batagor = 350,
	coca = 350,
	kopi = 350,
	salad = 300,
	mshake = 450,
	tahubulat = 750,
	radio = 5000,
	phone = 2500,
	fixtool = 2500,
	contract = 2500,
} -- maxquantity


Config.Zones = {
	Actions = {
		Pos   = {x = -634.56,  y = 226.4,  z = 81.88},
		Size  = {x = 1.5, y = 1.5, z = 0.4},
		Color = {r = 102, g = 102, b = 204},
		Type  = 23
	},
	VehicleSpawnPoint = {
		Pos   = {x = -618.0,  y = 253.08,  z = 80.6},
		Size  = {x = 3.0, y = 3.0, z = 0.4},
		Type  = -1
	},
	VehicleDeleter = {
		Pos   = {x = -641.88,  y = 243.64,  z = 80.52},
		Size  = {x = 3.0, y = 3.0, z = 0.4},
		Color = {r = 255, g = 0, b = 0},
		Type  = 23
	}
}