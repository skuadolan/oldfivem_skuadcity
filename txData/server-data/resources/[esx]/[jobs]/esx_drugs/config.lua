Config = {}

Config.Locale = 'en'

Config.Delays = {
	WeedProcessing = 60000 * 1 
}

Config.DrugDealerItems = {
	marijuana = 50
}

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 15000}
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	WeedField = {coords = vector3(2220.72, 5582.52, 53.81), name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 100.0},
	WeedProcessing = {coords = vector3(2329.02, 2571.29, 46.68), name = _U('blip_weedprocessing'), color = 25, sprite = 496},

	DrugDealer = {coords = vector3(-1172.02, -1571.98, 4.66), name = _U('blip_drugdealer'), color = 6, sprite = 378},
}

Config.Marker = {
	Distance = 2.0,
	Color = {r=60,g=230,b=60,a=255},
	Size = vector3(1.5,1.5,1.0),
	Type = 1,
}
