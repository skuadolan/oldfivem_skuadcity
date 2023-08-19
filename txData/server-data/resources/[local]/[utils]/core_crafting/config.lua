Config = {

BlipSprite = 237,
BlipColor = 26,
BlipText = 'Crafting',

UseLimitSystem = false, -- Enable if your esx uses limit system

CraftingStopWithDistance = true, -- Crafting will stop when not near workbench

ExperiancePerCraft = 1, -- The amount of experiance added per craft (100 Experiance is 1 level)

HideWhenCantCraft = false, -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job

Categories = {

['misc'] = {
	Label = 'MISC',
	Image = 'fishingrod',
	Jobs = {}
},
['weapons'] = {
	Label = 'WEAPONS',
	Image = 'WEAPON_APPISTOL',
	Jobs = {'police'}
},
['medical'] = {
	Label = 'MEDICAL',
	Image = 'bandage',
	Jobs = {'ambulance'}
}


},

PermanentItems = { -- Items that dont get removed when crafting
},

Recipes = { -- Enter Item name and then the speed value! The higher the value the more torque
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
		['cotton'] = 5,
		['febric'] = 3, -- item name and count, adding items that dont exist in database will crash the script
		['betadine'] = 1
	}
}, 
['medikit'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'medical', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {'ambulance'}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, -- 100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['cotton'] = 5,
		['febric'] = 3, -- item name and count, adding items that dont exist in database will crash the script
		['betadine'] = 2,
		['medalcohol'] = 1,
		['antibiotics'] = 1
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
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['copper'] = 5, -- item name and count, adding items that dont exist in database will crash the script
		['wood'] = 3,
		['iron'] = 5
	}
}, 
--Police Craft
['WEAPON_PISTOL'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = true, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {'police'}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['copper'] = 5, -- item name and count, adding items that dont exist in database will crash the script
		['wood'] = 3,
		['iron'] = 5
	}
}, 
--All Create
['fishingrod'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'misc', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['fiber'] = 2, -- item name and count, adding items that dont exist in database will crash the script
		['string'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['glue'] = 5, -- item name and count, adding items that dont exist in database will crash the script
		['alumunium'] = 3, -- item name and count, adding items that dont exist in database will crash the script
		
	}
},
['glue'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'misc', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['rubber'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		
	}
},

},

Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access

		{coords = vector3(101.26113891602,6615.810546875,31.58126831054), jobs = {}, blip = true, recipes = {}, radius = 3.0 },
		{coords = vector3(1723.213, 3323.815, 41.20947), jobs = {}, blip = true, recipes = {}, radius = 3.0 },
		{coords = vector3(-556.8132, -1702.431, 19.08569), jobs = {}, blip = true, recipes = {}, radius = 3.0 },
		{coords = vector3(-323.2352, -129.6659, 39.0022), jobs = {'mechanic'}, blip = false, recipes = {}, radius = 3.0 },
		{coords = vector3(459.8637, -981.0461, 30.67834), jobs = {'police'}, blip = false, recipes = {}, radius = 3.0 },

},
 

Text = {

    ['not_enough_ingredients'] = 'Bahan - bahan tidak cukup',
    ['you_cant_hold_item'] = 'Tidak dapat membawa barang lagi',
    ['item_crafted'] = 'Barnag terbuat!',
    ['wrong_job'] = 'Tidak dapat membuka meja crafting!',
    ['workbench_hologram'] = '[~b~E~w~] Workbench',
    ['wrong_usage'] = 'Perintah salah!',
    ['inv_limit_exceed'] = 'Tas penuh!',
    ['crafting_failed'] = 'Gagal membuat barang!'

}

}

Config.MarkerType =  1
Config.MarkerSize = {x = 1.1, y = 1.1, z = 0.9}
Config.MarkerColor = {r = 102, g = 102, b = 204, a = 255}


function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        --exports['mythic_notify']:SendAlert('inform', msg)

end
