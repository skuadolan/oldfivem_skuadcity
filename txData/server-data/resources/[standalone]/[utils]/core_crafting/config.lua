Config = {}
Config.BlipText = 'Crafting'
Config.UseLimitSystem = false    -- Enable if your esx uses limit system
CraftingStopWithDistance = true  -- Crafting will stop when not near workbench
Config.ExperiancePerCraft = 5    -- The amount of experiance added per craft (100 Experiance is 1 level)
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
Config.MarkerType = 1
Config.MarkerSize = { x = 1.1, y = 1.1, z = 0.9 }
Config.MarkerColor = { r = 102, g = 102, b = 204, a = 255 }
Config.Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access
	{ coords = vector3(101.26113891602, 6615.810546875, 31.58126831054), jobs = {},             blip = true,  recipes = {}, radius = 3.0 },
	{ coords = vector3(1723.213, 3323.815, 41.20947),                    jobs = {},             blip = true,  recipes = {}, radius = 3.0 },
	{ coords = vector3(-556.8132, -1702.431, 19.08569),                  jobs = {},             blip = true,  recipes = {}, radius = 3.0 },
	{ coords = vector3(-323.2352, -129.6659, 39.0022),                   jobs = { 'mechanic' }, blip = false, recipes = {}, radius = 3.0 },
	{ coords = vector3(459.8637, -981.0461, 30.67834),                   jobs = { 'police' },   blip = false, recipes = {}, radius = 3.0 },
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
Config.Recipes = {
	-- LUMBERJACK JOBS START
	['papper'] = {
		Level = 0,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['packaged_plank'] = 1,
		},
	},
	['kertas_bungkus'] = {
		Level = 1,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 15,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['papper'] = 2,
			['plastik'] = 2,
		}
	},
	['rubber'] = {
		Level = 0,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 2,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['getah_karet'] = 1
		}
	},
	['plastik'] = {
		Level = 1,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 3,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 15,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['rubber'] = 1,
		},
	},
	['glue'] = {
		Level = 1,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 15,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['getah_karet'] = 1
		}
	},
	['botol'] = {
		Level = 2,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 2,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['glue'] = 1,
			['plastik'] = 1,
			['rubber'] = 1,
		}
	},
	['hands_glove'] = {
		Level = 3,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 30,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['glue'] = 1,
			['rubber'] = 3,
			['fabric'] = 3,
		}
	},
	['alumunium'] = {
		Level = 4,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 2,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 40,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['iron'] = 1,
			['copper'] = 2,
			['rubber'] = 2,
			['glue'] = 1,
		}
	},
	['carbon_fiber'] = {
		Level = 5,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 50,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['iron'] = 3,
			['copper'] = 2,
			['rubber'] = 2,
			['glue'] = 2,
			['alumunium'] = 5,
		}
	},
	-- LUMBERJACK JOBS END

	-- MECHACNIC JOB START
	['kanebo'] = {
		Level = 0,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = { 'mechanic' }, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 2,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['rubber'] = 3,
			['fabric'] = 2,
		},
	},
	['oil'] = {
		Level = 0,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = { 'mechanic' }, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 2,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['essence'] = 3,
		},
	},
	['screwdriver'] = {
		Level = 1,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = { 'mechanic' }, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 15,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['iron'] = 5,
			['rubber'] = 5,
		},
	},
	['workshop_key'] = {
		Level = 1,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = { 'mechanic' }, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 15,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['iron'] = 5,
		},
	},
	['carotool'] = {
		Level = 2,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = { 'mechanic' }, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['screwdriver'] = 5,
			['workshop_key'] = 5,
		},
	},
	['fixkit'] = {
		Level = 3,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = { 'mechanic' }, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 30,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['carotool'] = 10,
		},
	},
	-- MECHACNIC JOB END

	-- TAILOR JOB START
	['cotton'] = {
		Level = 0,          -- From what level this item will be craftable
		Category = 'medical', -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10,        -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['wool'] = 10,
		},
	},
	-- TAILOR JOB END

	-- AMBULANCE JOB START
	['gauze'] = {
		Level = 0,          -- From what level this item will be craftable
		Category = 'medical', -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = { 'ambulance' }, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10,        -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['fabric'] = 10,
		},
	},
	['alcohol'] = {
		Level = 0,          -- From what level this item will be craftable
		Category = 'medical', -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10,        -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['weed'] = 5,
		},
	},
	['betadine'] = {
		Level = 1,          -- From what level this item will be craftable
		Category = 'medical', -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = { 'ambulance' }, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10,        -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['alcohol'] = 5,
		},
	},
	['bandage'] = {
		Level = 2,          -- From what level this item will be craftable
		Category = 'medical', -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = { 'ambulance' }, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10,        -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['gauze'] = 10,
			['cotton'] = 10,
			['betadine'] = 2,
			['alcohol'] = 2,
		},
	},
	['sterile_gloves'] = {
		Level = 3,          -- From what level this item will be craftable
		Category = 'medical', -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = { 'ambulance' }, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 30,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['glue'] = 1,
			['rubber'] = 3,
			['fabric'] = 3,
			['alcohol'] = 2,
		},
	},
	['sterile_gloves'] = {
		Level = 3,          -- From what level this item will be craftable
		Category = 'medical', -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = { 'ambulance' }, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 30,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['hands_glove'] = 1,
			['alcohol'] = 2,
		}
	},
	['medikit'] = {
		Level = 4,          -- From what level this item will be craftable
		Category = 'medical', -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = { 'ambulance' }, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 40,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['sterile_gloves'] = 1,
			['alcohol'] = 1,
			['bandage'] = 1,
			['gauze'] = 1,
			['betadine'] = 1,
			['antibiotics'] = 1,
		}
	},
	-- AMBULANCE JOB END

	-- MINER JOB START
	['charcoal'] = {
		Level = 0,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10,        -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['washed_stone'] = 5,
		},
	},
	['sulfur'] = {
		Level = 0,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['washed_stone'] = 5,
		},
	},
	['potassium_nitrate'] = {
		Level = 0,          -- From what level this item will be craftable
		Category = 'misc',  -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['charcoal'] = 5,
			['sulfur'] = 5,
		},
	},
	-- MINER JOB END

	-- POLICE JOB START
	['driver'] = {
		Level = 0,          -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10,        -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['papper'] = 5,
			['plastik'] = 5,
		}
	},
	['bullet_casing'] = {
		Level = 0,          -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10,        -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['iron'] = 5,
		}
	},
	['gunpowder'] = {
		Level = 1,          -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10,        -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 15,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['charcoal'] = 10,
			['sulfur'] = 5,
			['potassium_nitrate'] = 5,
		}
	},
	['bullet'] = {
		Level = 2,          -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10,        -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['selongsong'] = 10,
			['gunpowder'] = 10
		}
	},
	['bullet_box'] = {
		Level = 3,          -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false,      -- Specify if this is a gun so it will be added to the loadout
		Jobs = {},          -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {},     -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1,         -- The amount that will be crafted
		SuccessRate = 100,  -- 100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 30,          -- Time in seconds it takes to craft this item
		Ingredients = {     -- Ingredients needed to craft this item
			['bullet'] = 10,
			['iron'] = 10
		}
	},
	-- POLICE JOB END
}

function SendTextMessage(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0, 1)

	--EXAMPLE USED IN VIDEO
	--exports['mythic_notify']:SendAlert('inform', msg)
end
