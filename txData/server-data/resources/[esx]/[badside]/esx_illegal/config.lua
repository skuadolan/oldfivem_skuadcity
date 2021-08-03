Config = {}

Config.Locale = 'en'
Config.PoliceLimit = 0

--Options

Config.EnableMapsBlimps = false -- Enables the blips on the map.
Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.
Config.ChemicalsLicenseEnabled = true --Will Enable or Disable the need for a Chemicals License.
Config.MoneyWashLicenseEnabled = true --Will Enable or Disable the need for a MoneyWash License.
Config.RestrictLicenseShopAcces = true --Will Restrict the access to the license shop to players with a specific job and grade.

--The time it takes to process one item
Config.Delays = {
	WeedProcessing = 400 * 4,
	CokeProcessing = 400 * 4,
	HeroinProcessing = 400 * 4,
	FarmProcess = 400 * 4,
}

--Drug Dealer item Prices
Config.DrugDealerItems = {
	psianida = 1450,
	pmicin = 1350,
	pkecubung = 1250,
	rice = 20,
}

--License Shop Item Prices
Config.Licenses = {
	moneywash = 2000000,
	chemicalslisence = 2000000,
}

--Items that are included in the Chemicals Convertion menu
Config.ChemicalsConvertionItems = {
	hydrochloric_acid = 0,
	sodium_hydroxide = 0,
	sulfuric_acid = 0,
	lsa = 0,
}

--Jobs and job grades that are allowed to access the license shop.
--Only needed when RestrictLicenseShopAcces is set to true
Config.AllowedJobs = {
	Mafia4 = {name = 'mafia', grade = 4},
	Biker4 = {name = 'biker', grade = 4},
	Gang4 = {name = 'gang', grade = 4},
	Cartel4 = {name = 'cartel', grade = 4},
	Theb4 = {name = 'theb', grade = 4},
	Unemployed = {name = 'unemployed', grade = 0}
}

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 2000000}
}

--Drug Zones
Config.CircleZones = {
	--Weed
	WeedField = {coords = vector3(301.53, 4306.44, 46.35), blimpcoords = vector3(301.53, 4306.44, 46.35), name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 0, enabled = true},
	WeedProcessing = {coords = vector3(245.09, 370.49, 105.74), blimpcoords = vector3(592.03, -3280.48, 6.07), name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 0.0, enabled = true},
	
	--meth
	MethProcessing = {coords = vector3(1007.27, -3197.93, -38.99), blimpcoords = vector3(1454.66, -1651.75, 68.00), name = _U('blip_methprocessing'), color = 5, sprite = 51, radius = 0.0, enabled = true},
	HydrochloricAcidFarm = {coords = vector3(2724.12, 1583.03, 24.5), blimpcoords = vector3(2724.12, 1583.03, 24.5), name = _U('blip_HydrochloricAcidFarm'), color = 5, sprite = 51, radius = 0.0, enabled = true},
	SulfuricAcidFarm = {coords = vector3(3333.34, 5160.22, 18.31), blimpcoords = vector3(3333.34, 5160.22, 18.31), name = _U('blip_SulfuricAcidFarm'), color = 5, sprite = 51, radius = 0.0, enabled = true},
	SodiumHydroxideFarm = {coords = vector3(3617.04, 3738.73, 28.69), blimpcoords = vector3(3617.04, 3738.73, 28.69), name = _U('blip_SodiumHydroxideFarm'), color = 5, sprite = 51, radius = 0.0, enabled = true},
	
	--Chemicals
	ChemicalsField = {coords = vector3(817.46, -3192.84, 5.9), blimpcoords = vector3(817.46, -3192.84, 5.9), name = _U('blip_ChemicalsFarm'), color = 3, sprite = 499, radius = 0.0, enabled = true},
	ChemicalsConvertionMenu = {coords = vector3(3718.8, 4533.45, 21.67), blimpcoords = vector3(3718.8, 4533.45, 21.67), name = _U('blip_ChemicalsProcessing'), color = 3, sprite = 499, radius = 0.0, enabled = true},
	
	--Coke
	CokeField = {coords = vector3(2275.86, 4953.18, 41.25), blimpcoords = vector3(2275.86, 4953.18, 41.25), name = _U('blip_CokeFarm'), color = 4, sprite = 501, radius = 0.0, enabled = true},
	CokeProcessing = {coords = vector3(177.78, 2228.98, 90.05), blimpcoords = vector3(177.78, 2228.98, 90.05), name = _U('blip_Cokeprocessing'),color = 4, sprite = 501, radius = 0.0, enabled = true},
	
	--LSD
	lsdProcessing = {coords = vector3(91.26, 3749.31, 40.77), blimpcoords = vector3(91.26, 3749.31, 40.77), name = _U('blip_lsdprocessing'),color = 12, sprite = 364, radius = 0.0, enabled = true},
	thionylchlorideProcessing = {coords = vector3(1903.98, 4922.70, 48.16), blimpcoords = vector3(1903.98, 4922.70, 48.16), name = _U('blip_thionylchlorideprocessing'),color = 12, sprite = 364, radius = 0.0, enabled = true},
	
	--Heroin
	HeroinField = {coords = vector3(284.81, -2429.83, 8.04), blimpcoords = vector3(284.81, -2429.83, 8.04), name = _U('blip_heroinfield'), color = 7, sprite = 497, radius = 0, enabled = true},
	HeroinProcessing = {coords = vector3(2766.44, 1551.52, 24.5), blimpcoords = vector3(2766.44, 1551.52, 24.5), name = _U('blip_heroinprocessing'), color = 7, sprite = 497, radius = 0.0, enabled = true},

	--License
	--LicenseShop = {coords = vector3(707.17, -962.5, 30.4), blimpcoords = vector3(707.17, -962.5, 30.4), name = _U('blip_licenseshop'),color = 9, sprite = 498, radius = 0.0, enabled = true},

	--DrugDealer
	DrugDealer = {coords = vector3(146.72, -609.02, 18.68), blimpcoords = vector3(146.72, -609.02, 18.68), name = _U('blip_drugdealer'), color = 6, sprite = 378, radius = 0.0, enabled = true},
	
	--MoneyWash
	MoneyWash = {coords = vector3(-1001.61, 4847.44, 275.01), blimpcoords = vector3(1119.87, -3195.44, -39.40), name = _U('blip_moneywash'), color = 1, sprite = 500, radius = 0.0, enabled = true},