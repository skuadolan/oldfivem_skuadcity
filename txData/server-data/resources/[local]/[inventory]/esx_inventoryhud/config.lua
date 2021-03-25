Config = {}
Config.Locale = 'en'
Config.IncludeCash = false -- Include cash in inventory?
Config.IncludeWeapons = true -- Include weapons in inventory?
Config.IncludeAccounts = true -- Include accounts (bank, black money, ...)?
Config.ExcludeAccountsList = {"bank", "cash"} -- List of accounts names to exclude from inventory
Config.OpenControl = 289 -- Key for opening inventory. Edit html/js/config.js to change key for closing it.

-- List of item names that will close ui when used
Config.CloseUiItems = {"headbag", "fishingrod", "tunerlaptop", "binoculars", "gps", "joint", "cigarette", "cigar", "fixkit", "rollingpaper", "cocaine", "meth", "radio"}

Config.ShopBlipID = 52
Config.LiquorBlipID = 52
Config.YouToolBlipID = 402
Config.BahamaBlipID = 93
Config.PrisonShopBlipID = 52
Config.WeedStoreBlipID = 140
Config.WeaponShopBlipID = 110

Config.ShopLength = 14
Config.LiquorLength = 10
Config.YouToolLength = 2
Config.PrisonShopLength = 2

Config.Color = 2
Config.ColorBahama = 27
Config.WeaponColor = 1

Config.WeaponLiscence = {x = 12.47, y = -1105.5, z = 29.8}
Config.LicensePrice = 1000000

--[[Config.Map = {
    {name="Lounge",color=27, id=93,x = -629.28, y = 223.93, z = 81.88},
    {name="Warung",color=2, id=52,x =373.875, y =325.896, z =100.319},
	{name="Warung",color=2, id=52,x =2557.458, y =382.282, z =100.319},
	{name="Warung",color=2, id=52,x =-3038.939, y =585.954, z =6.908},
	{name="Warung",color=2, id=52,x =-3241.927, y =1001.462, z =11.830},
    {name="Warung",color=2, id=52,x =547.431, y =2671.710, z =41.156},
	{name="Warung",color=2, id=52,x =1961.464, y =3740.672, z =31.343},
	{name="Warung",color=2, id=52,x =2678.916, y =3280.671, z =54.241},
	{name="Warung",color=2, id=52,x =1729.216, y =6414.131, z =34.037},
	{name="Warung",color=2, id=52,x =26.17, y =-1347.33, z =28.5},
    {name="Warung",color=2, id=52,x =1135.808, y =-982.281, z =45.415},
	{name="Warung",color=2, id=52,x =-1222.915, y =-906.983, z =11.326},
	{name="Warung",color=2, id=52,x =-1487.553, y =-379.107, z =39.163},
	{name="Bandara Kota",color=39, id=307,x =-1037.38, y =-2737.68, z =20.17},
	{name="Warung",color=2, id=52,x =-2968.243, y =390.910, z =14.043},
    {name="Warung",color=2, id=52,x =1166.024, y =2708.930, z =37.157},
	{name="Warung",color=2, id=52,x =1392.562, y =3604.648, z =33.980},
    --{name="Warung",color=2, id=52,x =-160.33, y =6322.71, z =30.6},
	{name="Warung",color=2, id=52,x =-48.519, y =-1757.514, z =28.421},
	{name="Warung",color=2, id=52,x =1163.373, y =-323.801, z =68.205},
	{name="Warung",color=2, id=52,x =-707.501, y =-914.260, z =18.215},
	{name="Warung",color=2, id=52,x =-1820.523, y =792.518, z =137.118},
	{name="Warung",color=2, id=52,x =1698.388, y =4924.404, z =41.063}
}]]

--[[Config.Shops = {
    RegularShop = {
        Locations = {
			{x = 373.875,   y = 325.896,  	z = 102.566},

            {x = 2557.458,  y = 382.282,  	z = 107.622},

            {x = -3038.939, y = 585.954,  	z = 6.908},

            {x = -3241.927, y = 1001.462, 	z = 11.830},

            {x = 547.431,   y = 2671.710, 	z = 41.156},

            {x = 1961.464,  y = 3740.672, 	z = 31.343},

            {x = 2678.916,  y = 3280.671, 	z = 54.241},

            {x = 1729.216,  y = 6414.131, 	z = 34.037},

            {x = 1135.808,  y = -982.281,  	z = 45.415},

            {x = -1222.915, y = -906.983,  	z = 11.326},

            {x = -1487.553, y = -379.107,  	z = 39.163},

            {x = -2968.243, y = 390.910,   	z = 14.043},

            {x = 1166.024,  y = 2708.930,  	z = 37.157},

            {x = 1392.562,  y = 3604.684,  	z = 33.980},

            {x = -48.519,   y = -1757.514, 	z = 28.421},

            {x = 1163.373,  y = -323.801,  	z = 68.205},

            {x = -707.501,  y = -914.260,  	z = 18.215},

            {x = -1820.523, y = 792.518,   	z = 137.118},

            {x = 26.17, 	y = -1347.33,   z = 28.5},

            {x = -2540.95,  y = 2314.05,  	z = 32.41},

            {x = 1698.388,  y = 4924.404,  	z = 41.063},

            {x = -160.33,  	y = 6322.71,  	z = 30.6},

            {x = -253.56, y = -979.32,    z = 31.22}, -- bandara    
        },
        Items = {
            {name = 'air_putih'},
            {name = 'coklat'}
        }
    },

    RobsLiquor = {
		Locations = {
            {x = 1985.27, y = 3050.6, z = 47.22},
            {x = -450.42, y = 281.22,   z = 77.52},

            {x = -1577.93, y = -3014.85,   z = -80.01},

            {x = -1586.7, y = -3012.44,   z = -77.0},

         {x = -429.59, y = 268.26,   z = 82.02},

         {x = 1420.48, y = 3558.65,   z = 35.71},
        },
        Items = {
            {name = 'air_putih'},
            {name = 'coklat'},
            {name = 'greentea'},
            {name = 'gorengan'}
        }
    },

    Ambulance = {
		Locations = {

        },
        Items = {
            {name = 'bandage'},
            {name = 'medikit'}
        }
    },
    
    Pedagang = {
		Locations = {
            { x = -629.28, y = 223.93, z = 81.88 }
        },
        Items = {
            {name = 'kopi'},
            {name = 'teh'},
            {name = 'siomay'},
            {name = 'mie_pangsit'},
            {name = 'nasi_bungkus'},
            {name = 'nasi_goreng'},
            {name = 'phone'},
            {name = 'radio'},
            {name = 'materai'},
            {name = 'esbuah'}
        }
    },

    Police = {
		Locations = {
            { x = 461.14, y = -982.62, z = 30.69 }
        },
        Items = {

        }
    },

    Mech = {
        Locations = {
            ---323.140, y = -129.882, z = 37.999
            --X.-377.03 Y -121.5 Z 38.85
            { x = -377.03, y = -121.5, z = 38.85 },
            { x = 548.53, y = -188.69, z = 54.48 },
        },
        Items = {
            {name = 'fixkit'},
            {name = 'carokit'},
            {name = 'repairkit'},
            {name = 'tyrekit'}
        }
    },

    YouTool = {
        Locations = {
            {x = 311.72, y = -562.65, z = 43.28},
        },
        Items = {
            {name = 'bandage'},
            {name = 'medikit'}
        }
    },

    PrisonShop = {
        Locations = {

        },
        Items = {
            {name = 'air_putih'},
            {name = 'coklat'},
            {name = 'greentea'},
            {name = 'gorengan'}
        }
    },

    Bahama = {
        Locations = {
            {x = -1393.409, y = -606.624,  z = 29.319},
        },
        Items = {
            {name = 'air_putih'},
            {name = 'coklat'},
            {name = 'greentea'},
            {name = 'gorengan'}
        }
    },

    Tequi = {
        Locations = {
            {x = -560.2, y = 285.4,  z = 81.25},
        },
        Items = {
            {name = 'air_putih'},
            {name = 'coklat'},
            {name = 'greentea'},
            {name = 'gorengan'}
        }
    },

    Yellow = {
		Locations = {
            {x = 1985.81, y = 3053.84,  z = 46.80}
        },
        Items = {
            {name = 'air_putih'},
            {name = 'coklat'},
            {name = 'greentea'},
            {name = 'gorengan'}
        }
    },
    
    Noblip = {
        Locations = {
            {x = -1093.6,  y = -834.58, z = 22.25}            
        },
        Items = {
            {name = 'air_putih'},
            {name = 'coklat'},
            {name = 'greentea'},
            {name = 'gorengan'}
        }
    },

    PrisonShop = {
        Locations = {

        },
        Items = {

        }
    },

    WeaponShop = {
        Locations = {
            --{ x = -662.180, y = -934.961, z = 21.829 },
            --{ x = 810.25, y = -2157.60, z = 29.62 },
            --{ x = 1693.44, y = 3760.16, z = 34.71 },
            --{ x = -330.24, y = 6083.88, z = 31.45 },
            --{ x = 252.63, y = -50.00, z = 69.94 },
            --{ x = 22.09, y = -1107.28, z = 29.80 },
            --{ x = 2567.69, y = 294.38, z = 108.73 },
            --{ x = -1117.58, y = 2698.61, z = 18.55 },
            --{ x = 842.44, y = -1033.42, z = 28.19 },
        },
        Weapons = {
            {name = "WEAPON_KNIFE", ammo = 1},
            {name = "WEAPON_STUNGUN", ammo = 1},
            {name = "WEAPON_FLASHLIGHT", ammo = 1},
            {name = "WEEAPON_WRENCH", ammo = 1},
            {name = "GADGET_PARACHUTE", ammo = 1},
            {name = "WEAPON_FIREEXTINGUISHER", ammo = 100},
            {name = "WEAPON_MACHETE", ammo = 1},
            {name = "WEAPON_PISTOL", ammo = 50}
        },
        Ammo = {
            {name = "9mm_rounds", weaponhash = "WEAPON_PISTOL", ammo = 24}
        },
        Items = {

        }
    },
}]]

