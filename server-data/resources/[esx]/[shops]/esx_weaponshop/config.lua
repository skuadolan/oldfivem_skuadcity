Config               = {}

Config.DrawDistance  = 100
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 0, g = 128, b = 255 }
Config.Type          = 1

Config.Locale        = 'en'

Config.LicenseEnable = true -- only turn this on if you are using esx_license
Config.LicensePrice  = 1000000

Config.Zones = {

	GunShop = {
		Legal = true,
		Items = {},
		Locations = {
			vector3(-664.66, -935.21, 20.8),
			vector3(812.83, -2157.4, 28.6),
			vector3(1691.56, 3757.68, 33.7),
			vector3(-332.19, 6081.88, 30.4),
			vector3(252.99, -47.47, 68.9),
			vector3(19.18, -1106.24, 28.8),
			vector3(2570.55, 294.42, 107.7),
			vector3(-1119.63, 2696.74, 17.5),
			vector3(845.1, -1033.45, 27.1)
		}
	},

	BlackWeashop = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(-1305.62, -391.61, 35.6)
		}
	}

}
