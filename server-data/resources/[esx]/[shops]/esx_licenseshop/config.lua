Config = {}
Config.Locale = 'en'

Config.DrawDistance = 10

Config.MarkerInfo = {Type = 1, r = 102, g = 102, b = 204, x = 2.0, y = 2.0, z = 1.0}
Config.BlipLicenseShop = {Sprite = 408, Color = 0, Display = 2, Scale = 1.0}

Config.UseBlips = false -- true = Use License Shop Blips
Config.RequireDMV = false -- If true then it will require players to have Drivers Permit to buy other Licenses | false does the Opposite.
Config.AdvancedVehicleShop = true -- Set to true if using esx_advancedvehicleshop
Config.AdvancedWeaponShop = true -- Set to true if using esx_advancedweaponshop
Config.DMVSchool = true -- Set to true if using esx_dmvschool
Config.SellDMV = true -- Set to true if Config.RequireDMV = false & you want players to be able to buy Drivers Permit
Config.Drugs = true -- Set to true if using esx_drugs
Config.WeaponShop = true -- Set to true if using esx_weaponshop

Config.Prices = {
	Aircraft = 1000000,
	Boating = 750000,
	Melee = 1000000,
	Handgun = 1750000,
	SMG = 1500000,
	Shotgun = 2750000,
	Assault = 4500000,
	LMG = 7500000,
	Sniper = 15000000,
	Commercial = 4500000,
	Drivers = 1500000,
	DriversP = 1000000,
	Motorcycle = 1500000,
	Weed = 10000000,
	Weapon = 10000000
}

Config.Zones = {
	LicenseShops = {
		Coords = {
			vector3(-2166.4, 5197.22, 16.06)
		}
	}
}
