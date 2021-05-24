Config = {}

-- Ammo given by default to crafted weapons
Config.WeaponAmmo = 42

Config.Recipes = {
	-- Can be a normal ESX item
	["beer"] = { 
		{item = "air_putih", quantity = 1 },
		{item = "pmicin", quantity = 1 },
	},

	["bandage"] = { 
		{item = "fabric", quantity = 12 },
	},

	["gunpowder"] = { 
		{item = "cutted_wood", quantity = 8 },
		{item = "iron", quantity = 4 },
	},

	["clip"] = { 
		{item = "gunpowder", quantity = 8 },
		{item = "iron", quantity = 12 },
	},

	["blowpipe"] = { 
		{item = "gazbottle", quantity = 4 },
		{item = "iron", quantity = 8 },
	},
}

-- Enable a shop to access the crafting menu
Config.Shop = {
	useShop = true,
	shopCoordinates = { x=962.5, y=-1585.5, z=29.6 },
	shopName = "Crafting Station",
	shopBlipID = 446,
	zoneSize = { x = 2.5, y = 2.5, z = 1.5 },
	zoneColor = { r = 255, g = 0, b = 0, a = 100 }
}

-- Enable crafting menu through a keyboard shortcut
Config.Keyboard = {
	useKeyboard = false,
	keyCode = 303
}
