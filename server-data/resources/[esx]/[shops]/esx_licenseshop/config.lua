Config = {}
Config.Locale = 'en'

Config.DrawDistance = 10

Config.MarkerInfo = {Type = 1, r = 102, g = 102, b = 204, x = 2.0, y = 2.0, z = 1.0}
Config.BlipLicenseShop = {Sprite = 408, Color = 0, Display = 2, Scale = 1.0}

Config.UseBlips = true -- true = Use License Shop Blips
Config.RequireDMV = false -- If true then it will require players to have Drivers Permit to buy other Licenses | false does the Opposite.
Config.AdvancedVehicleShop = true -- Set to true if using esx_advancedvehicleshop
Config.AdvancedWeaponShop = true -- Set to true if using esx_advancedweaponshop
Config.DMVSchool = true -- Set to true if using esx_dmvschool
Config.SellDMV = true -- Set to true if Config.RequireDMV = false & you want players to be able to buy Drivers Permit
Config.Drugs = true -- Set to true if using esx_drugs
Config.WeaponShop = true -- Set to true if using esx_weaponshop

Config.Prices = {
	Aircraft = 100000,
	Boating = 50000,
	Melee = 10000,
	Handgun = 10000,
	SMG = 1000000,
	Shotgun = 500000,
	Assault = 2500000,
	LMG = 1000000,
	Sniper = 1500000,
	Commercial = 300000,
	Drivers = 150000,
	DriversP = 75000,
	Motorcycle = 225000,
	Weed = 75000,
	Weapon = 1000000
}

Config.Zones = {
	LicenseShops = {
		Coords = {
			vector3(241.0, -1378.9, 32.7),
			vector3(438.68, -980.16, 29.69)
		}
	}
}
