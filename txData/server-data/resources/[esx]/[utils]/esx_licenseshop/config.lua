Config = {}
Config.Locale = 'en'

Config.DrawDistance = 2

Config.MarkerInfo = {Type = 27, r = 102, g = 102, b = 204, x = 2.0, y = 2.0, z = 1.0}
Config.BlipLicenseShop = {Sprite = 408, Color = 0, Display = 2, Scale = 1.0}

Config.UseBlips = false -- true = Use License Shop Blips
--Config.RequireDMV = true -- If true then it will require players to have Drivers Permit to buy other Licenses | false does the Opposite.
--Config.AdvancedVehicleShop = false -- Set to true if using esx_advancedvehicleshop
--Config.AdvancedWeaponShop = false -- Set to true if using esx_advancedweaponshop
Config.DMVSchool = true -- Set to true if using esx_dmvschool
Config.SellDMV = true -- Set to true if Config.RequireDMV = false & you want players to be able to buy Drivers Permit
--Config.Drugs = false -- Set to true if using esx_drugs
--Config.WeaponShop = false -- Set to true if using esx_weaponshop

Config.Prices = {
	Commercial = 10000,
	Drivers = 17500,
	DriversP = 15000,
	Motorcycle = 12500
}

--1391.2 30.59

Config.Zones = {
	LicenseShops = {
		Coords = {
			vector3(218.4, -1391.2, 29.59)
		}
	}
}
