Config = {}
Config.BlipText = 'Crafting'
Config.UseLimitSystem = false -- Enable if your esx uses limit system
CraftingStopWithDistance = true -- Crafting will stop when not near workbench
Config.ExperiancePerCraft = 1 -- The amount of experiance added per craft (100 Experiance is 1 level)
Config.HideWhenCantCraft = false -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job
Config.Categories = {
	['misc'] = {
		Label = 'MISC',
		Image = 'fishingrod',
		Jobs = {}
	},
	['weapons'] = {
		Label = 'WEAPONS',
		Image = 'WEAPON_APPISTOL',
		Jobs = {}
	},
	['medical'] = {
		Label = 'MEDICAL',
		Image = 'bandage',
		Jobs = {}
	}
}
Config.PermanentItems = { -- Items that dont get removed when crafting
}
Config.BlipSprite = 237
Config.BlipColor = 26
Config.MarkerType =  1
Config.MarkerSize = {x = 1.1, y = 1.1, z = 0.9}
Config.MarkerColor = {r = 102, g = 102, b = 204, a = 255}
Config.Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access
	{coords = vector3(101.26113891602,6615.810546875,31.58126831054), jobs = {}, blip = true, recipes = {}, radius = 3.0 },
	{coords = vector3(1723.213, 3323.815, 41.20947), jobs = {}, blip = true, recipes = {}, radius = 3.0 },
	{coords = vector3(-556.8132, -1702.431, 19.08569), jobs = {}, blip = true, recipes = {}, radius = 3.0 },
	{coords = vector3(-323.2352, -129.6659, 39.0022), jobs = {'mechanic'}, blip = false, recipes = {}, radius = 3.0 },
	{coords = vector3(459.8637, -981.0461, 30.67834), jobs = {'police'}, blip = false, recipes = {}, radius = 3.0 },
}
Config.Text = {
	['not_enough_ingredients'] = 'Bahan - bahan tidak cukup',
	['you_cant_hold_item'] = 'Tidak dapat membawa barang lagi',
	['item_crafted'] = 'Barnag terbuat!',
	['wrong_job'] = 'Tidak dapat membuka meja crafting!',
	['workbench_hologram'] = '[~b~E~w~] Workbench',
	['wrong_usage'] = 'Perintah salah!',
	['inv_limit_exceed'] = 'Tas penuh!',
	['crafting_failed'] = 'Gagal membuat barang!'
}
Config.Recipes = { -- Enter Item name and then the speed value! The higher the value the more torque
	--Police Craft
	['sim'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {'police'}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['plastic'] = 1,
			['papper'] = 1
		}
	},
	['selongsong'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {'police'}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 2, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['iron'] = 1
		}
	},
	['gunpowder'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {'police'}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 3, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['bubuk_arang'] = 1,
			['blerang'] = 1,
			['kalium'] = 1
		}
	},
	['ammo'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {'police'}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 2, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['selongsong'] = 2,
			['bubuk_mesiu'] = 5
		}
	},
	['magasin'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {'police'}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['ammo'] = 20,
			['iron'] = 5
		}
	},
	--Ambulance Craft
	['bandage'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'medical', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {'ambulance'}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 2, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['fabric'] = 5,
			['betadine'] = 1,
			['cotton'] = 3
		}
	},
	['medikit'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'medical', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {'ambulance'}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 3, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['bandage'] = 5,
			['fabric'] = 3,
			['alcohol'] = 1,
			['antibiotik'] = 1,
			['cotton'] = 7
		}
	},
	--Mechanic Craft
	['kanebo'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['kain'] = 1,			
			['water'] = 1			
		}
	},
	['kunci_bengkel'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['iron'] = 1		
		}
	},
	['obeng'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['iron'] = 1,	
			['plastic'] = 2
		}
	},
	['perkakas'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['obeng'] = 1,	
			['kunci_bengkel'] = 2
		}
	},
	['oli'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['petrol'] = 1
		}
	},
	['fixkit'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['oli'] = 1,
			['perkakas'] = 1,
			['accu'] = 1
		}
	},
	--EVERYONE CAN CREATE
	['bubuk_arang'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['coal'] = 1
		}
	},
	['blerang'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['coal'] = 1
		}
	},
	['cotton'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['wool'] = 1
		}
	},
	['plastic'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['rubber'] = 1
		}
	},
	['fried_chicken'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 12, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['packaged_chicken'] = 1
		}
	},
	['rice'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['rice_seed'] = 12
		}
	},
	['rice_chicken'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['fried_chicken'] = 1,
			['rice'] = 1,
			['bungkus'] = 1
		}
	},
	['onigiri'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['seaweed'] = 1,
			['rice'] = 1,
			['fish'] = 1,
			['mayones'] = 1
		}
	},
	['sasimi'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['fish'] = 1
		}
	},
	['sushi'] = {
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5, -- The amount that will be crafted
		SuccessRate = 100, -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['rice'] = 1,
			['vegetable'] = 1,
			['fish'] = 1
		}
	},
}

function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        --exports['mythic_notify']:SendAlert('inform', msg)

end
