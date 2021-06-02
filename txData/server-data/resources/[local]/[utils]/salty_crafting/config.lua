Config = {}

-- Ammo given by default to crafted weapons
Config.WeaponAmmo = 42

Config.Recipes = {
	-- Can be a normal ESX item

	["betadine"] = { 
		{item = "air_putih", quantity = 1 },
		{item = "sianida", quantity = 1 }
	},

	["bandage"] = { 
		{item = "fabric", quantity = 12 },
		{item = "betadine", quantity = 2 }
	},

	["bubuk_arang"] = { 
		{item = "coal", quantity = 1 },
	},

	["gunpowder"] = { 
		{item = "bubuk_arang", quantity = 2 },
	},

	["bullet_casing"] = { 
		{item = "stainless_steel", quantity = 4 },
		{item = "iron", quantity = 2 },
	},

	["bullet"] = { 
		{item = "gunpowder", quantity = 1 },
		{item = "bullet_casing", quantity = 1 },
		{item = "iron", quantity = 2 },
	},

	["clip"] = { 
		{item = "bullet", quantity = 10 },
		{item = "iron", quantity = 4 },
	},

	["blowpipe"] = { 
		{item = "gazbottle", quantity = 1 },
		{item = "iron", quantity = 2 },
	},

	["fixkit"] = { 
		{item = "fixtool", quantity = 4 },
		{item = "carotool", quantity = 2 },
		{item = "battery", quantity = 1 },
	},

	["stainless_steel"] = { 
		{item = "iron", quantity = 1 },
		{item = "copper", quantity = 1 }
	},

	["SmallArmor"] = { 
		{item = "leather", quantity = 6 },
		{item = "bandage", quantity = 4 },
		{item = "stainless_steel", quantity = 2 },
	},

	["MedArmor"] = { 
		{item = "leather", quantity = 8 },
		{item = "bandage", quantity = 6 },
		{item = "stainless_steel", quantity = 4 },
	},

	["HeavyArmor"] = { 
		{item = "leather", quantity = 10 },
		{item = "bandage", quantity = 8 },
		{item = "stainless_steel", quantity = 6 },
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
