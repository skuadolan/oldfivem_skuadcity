Config = {}

Config.Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

Config.Locale = 'en'
Config.IncludeCash = false -- Include cash in inventory?
Config.IncludeWeapons = true -- Include weapons in inventory?
Config.IncludeAccounts = false -- Include accounts (bank, black money, ...)?
Config.ExcludeAccountsList = {"bank"} -- List of accounts names to exclude from inventory
--Config.OpenControl = 288 -- Key for opening inventory. Edit html/js/config.js to change key for closing it.

-- List of item names that will close ui when used
Config.CloseUiItems = {"phone", "radio", "bandage", "medikit", "karung", "bulletproof", "blowpipe", "carotool"}

Config.ShopBlipID = 52
Config.LiquorBlipID = 93
Config.YouToolBlipID = 402
Config.PrisonShopBlipID = 52
Config.WeaponShopBlipID = 110

Config.ShopLength = 14
Config.LiquorLength = 10
Config.YouToolLength = 2
Config.PrisonShopLength = 2

Config.MarkerSize = {x = 0.6, y = 0.6, z = 0.5}
Config.MarkerColor = {r = 0, g = 128, b = 255}
Config.Color = 2
Config.WeaponColor = 1

Config.WeaponLiscence = {x = 12.47, y = -1105.5, z = 29.8}
Config.LicensePrice = 5000

Config.Shops = {
    RegularShop = {
        Locations = {
			{x = 373.875,   y = 325.896,  z = 103.566},
			{x = 2557.458,  y = 382.282,  z = 108.622},
			{x = -3038.939, y = 585.954,  z = 7.908},
			{x = -3241.927, y = 1001.462, z = 12.830},
			{x = 547.431,   y = 2671.710, z = 42.156},
			{x = 1961.464,  y = 3740.672, z = 32.343},
			{x = 2678.916,  y = 3280.671, z = 55.241},
            {x = 1729.216,  y = 6414.131, z = 35.037},
            {x = -48.519,   y = -1757.514, z = 29.421},
			{x = 1163.373,  y = -323.801,  z = 69.205},
			{x = -707.501,  y = -914.260,  z = 19.215},
			{x = -1820.523, y = 792.518,   z = 138.118},
            {x = 1698.388,  y = 4924.404,  z = 42.063},
            {x = 25.723,   y = -1346.966, z = 29.497}, 
            {x = 1135.808,  y = -982.281,  z = 46.415},
            {x = -1222.915, y = -906.983,  z = 12.326},
            {x = -1487.553, y = -379.107,  z = 40.163},
            {x = 1392.562,  y = 3604.684,  z = 34.980},
            {x = -2968.243, y = 390.910,   z = 15.043},
            {x = 1166.024,  y = 2708.930,  z = 38.157}
        },
        Items = {
            {name = 'bread'},
            {name = 'chocolate'},
            {name = 'sandwich'},
            {name = 'hamburger'},
            {name = 'cupcake'},
            {name = 'chips'},
            {name = 'water'},
            {name = 'cocacola'},
            {name = 'icetea'},
            {name = 'milk'},
            {name = 'cigarett'},
            {name = 'fishingrod'},
            {name = 'turtlebait'},
            {name = 'fishbait'}, 
            {name = 'radio'},
            {name = 'phone'}
        }
    },

    RobsLiquor = {
		Locations = {
			{x = -1393.409, y = -606.624,  z = 30.319},
            {x=126.73763275146,y=-1282.6915283203,z=29.277181625366},
            {x=-560.17193603516,y=286.7942199707,z=82.176429748535}
        },
        Items = {
            {name = 'beer'},
            {name = 'wine'},
            {name = 'vodka'},
            {name = 'tequila'},
            {name = 'whisky'}
        }
	},

    YouTool = {
        Locations = {
        },
        Items = {
        }
    },

    WeaponShop = {
        Locations = {
            { x = -662.180, y = -934.961, z = 21.829 },
            { x = 810.25, y = -2157.60, z = 29.62 },
            { x = 1693.44, y = 3760.16, z = 34.71 },
            { x = -330.24, y = 6083.88, z = 31.45 },
            { x = 252.63, y = -50.00, z = 69.94 },
            { x = 22.09, y = -1107.28, z = 29.80 },
            { x = 2567.69, y = 294.38, z = 108.73 },
            { x = -1117.58, y = 2698.61, z = 18.55 },
            { x = 842.44, y = -1033.42, z = 28.19 },
        },
        Weapons = {
            {name = 'WEAPON_PISTOL'},
            {name = 'WEAPON_BAT'},
            {name = 'WEAPON_MACHETE'},
            {name = 'WEAPON_POOLCUE'},
            {name = 'WEAPON_KNIFE'},
            {name = 'WEAPON_GOLFCLUB'},
            {name = 'WEAPON_CROWBAR'},
            {name = 'WEAPON_HAMMER'},
            {name = 'WEAPON_HATCHET'}
        },
        Ammo = {
            
        },
        Items = {

        }
    },
}

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 24000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 5

Config.localWeight = {
}