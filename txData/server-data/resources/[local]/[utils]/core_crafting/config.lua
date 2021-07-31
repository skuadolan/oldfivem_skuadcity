-- MORE SCRIPTS AT 5MSCRIPTS.COM
-- FIVEM ESX 100% FREE SCRIPTS

Config = {

	BlipSprite = 643,
	BlipColor = 1,
	BlipText = '',
	
	UseLimitSystem = false, -- Enable if your esx uses limit system
	
	CraftingStopWithDistance = false, -- Crafting will stop when not near workbench
	
	ExperiancePerCraft = 0, -- The amount of experiance added per craft (100 Experiance is 1 level)
	
	HideWhenCantCraft = false, -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job
	
	Categories = {
	
	['misc'] = {
		Label = 'PERALATAN',
		Image = 'fishingrod',
		Jobs = {}
	},
	['weapons'] = {
		Label = 'SENJATA',
		Image = 'WEAPON_APPISTOL',
		Jobs = {}
	},
	['medical'] = {
		Label = 'OBAT',
		Image = 'bandage',
		Jobs = {}
	}
	
	
	},
	
	PermanentItems = { -- Items that dont get removed when crafting
		['wrench'] = true
	},
	
	Recipes = { -- Enter Item name and then the speed value! The higher the value the more torque
	
	
		--MEDIC
		['betadine'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'medical', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 10, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['air_putih'] = 1, -- item name and count, adding items that dont exist in database will crash the script
				['sianida'] = 1
			}
		}, 
	
		['bandage'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'medical', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 10, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['fabric'] = 12, -- item name and count, adding items that dont exist in database will crash the script
				['betadine'] = 2
			}
		}, 
	
	
	
		--MISC
		['bubuk_arang'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 3, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['coal'] = 1 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
		['gunpowder'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 3, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['bubuk_arang'] = 2 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
		['bullet_casing'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 3, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 2,
				['stainless_steel'] = 4 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
		['bullet'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 3, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['gunpowder'] = 1,
				['bullet_casing'] = 1,
				['iron'] = 2 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
		['clip'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 3, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['bullet'] = 10,
				['iron'] = 4-- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
		['blowpipe'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 3, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['gazbottle'] = 1,
				['iron'] = 2-- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
		['fixkit'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 3, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['fixtool'] = 4,
				['carotool'] = 2,
				['accu'] = 1-- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
		['stainless_steel'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 3, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 1,
				['copper'] = 1-- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
		['HeavyArmor'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'misc', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 3, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['leather'] = 10,
				['bandage'] = 8,
				['stainless_steel'] = 6-- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
	
	
		--WEAPON
		['WEAPON_APPISTOL'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'weapons', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['clip'] = 1, -- item name and count, adding items that dont exist in database will crash the script
				['iron'] = 10,
				['copper'] = 5
			}
		}, 
	},
	
	Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access
	
			{coords = vector3(101.4726, 6616.194, 32.43078), jobs = {}, blip = true, recipes = {}, radius = 3.0 }
	
	},
	
	Text = {
	
		['not_enough_ingredients'] = 'You dont have enough ingredients',
		['you_cant_hold_item'] = 'You cant hold the item',
		['item_crafted'] = 'Item crafted!',
		['wrong_job'] = 'You cant open this workbench',
		['workbench_hologram'] = '[~b~E~w~] Workbench',
		['wrong_usage'] = 'Wrong usage of command',
		['inv_limit_exceed'] = 'Inventory limit exceeded! Clean up before you lose more',
		['crafting_failed'] = 'You failed to craft the item!'
	
	}
	
	}
	
	
	
	function SendTextMessage(msg)
	
			SetNotificationTextEntry('STRING')
			AddTextComponentString(msg)
			DrawNotification(0,1)
	
			--EXAMPLE USED IN VIDEO
			--exports['mythic_notify']:SendAlert('inform', msg)
	
	end
	