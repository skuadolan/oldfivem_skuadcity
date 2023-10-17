Config = {}
Config.Locale = 'id'
Config.IncludeCash = false -- Include cash in inventory?
Config.IncludeWeapons = true -- Include weapons in inventory?
Config.IncludeAccounts = true -- Include accounts (bank, black money, ...)?
Config.ExcludeAccountsList = {"bank", "cash"} -- List of accounts names to exclude from inventory
Config.OpenControl = 288 --f1 -- Key for opening inventory. Edit html/js/config.js to change key for closing it.

-- List of item names that will close ui when used
Config.CloseUiItems = {"bandage","beer","blowpipe","bread","carotool","gazbottle","medikit","phone","water"}

Config.Throwables = {
    WEAPON_MOLOTOV = 615608432,
    WEAPON_GRENADE = -1813897027,
    WEAPON_STICKYBOMB = 741814745,
    WEAPON_PROXMINE = -1420407917,
    WEAPON_SMOKEGRENADE = -37975472,
    WEAPON_PIPEBOMB = -1169823560,
    WEAPON_FLARE = 1233104067,
    WEAPON_SNOWBALL = 126349499
}

Config.MarkerSize = {x = 1.1, y = 1.1, z = 0.9}
Config.MarkerType =  29
Config.MarkerColor = {r = 102, g = 102, b = 204, a = 255}

Config.FuelCan = 883325847

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

Config.priceItemPedagang = 250 --sementara

Config.Shops = {
    RegularShop = {
        Locations = {
            vector3(2751.152, 3471.283, 55.70032),
            vector3(-56.84835, 6523.978, 31.48718),
            vector3(-3042.712, 79.54286, 12.81763),
            vector3(-1605.732, -1000.945, 13.00293),
            vector3(52.12748, -1737.231, 29.39783)
			--[[vector3(373.8, 325.8, 102.5),
			vector3(2557.4, 382.2, 107.6),
			vector3(-3038.9, 585.9, 6.9),
			vector3(-3241.9, 1001.4, 11.8),
			vector3(547.4, 2671.7, 41.1),
			vector3(1961.4, 3740.6, 31.3),
			vector3(2678.9, 3280.6, 54.2),
			vector3(1729.2, 6414.1, 34.0),
            vector3(1135.8, -982.2, 45.4),
			vector3(-1222.9, -906.9, 11.3),
			vector3(-1487.5, -379.1, 39.1),
			vector3(-2968.2, 390.9, 14.0),
			vector3(1166.0, 2708.9, 37.1),
			vector3(1392.5, 3604.6,  33.9),
			vector3(-559.9, 287.0, 81.1),
            vector3(-48.5,  -1757.5, 28.4),
			vector3(1163.3, -323.8, 68.2),
			vector3(-707.5, -914.2, 18.2),
			vector3(-1820.5, 792.5, 137.1),
			vector3(1698.3, 4924.4, 41.0),
            vector3(26.25,-1347.68,29.5),]]
        },
        Items = {
            {name = 'water'},
            {name = 'bread'},
            {name = 'phone'},
        }
    },

    Ambulance = {
		Locations = {
            --vector3(311.72, -562.65, 43.28)
        },
        Items = {
        }
    },
    
    Pedagang = {
		Locations = {
            --vector3(-629.28, 223.93, 81.88)
        },
        Items = {
        }
    },

    YouTool = {
        Locations = {
            --vector3(2751.0, 3471.74,  55.7)
        },
        Items = {
        }
    },

    Mech = {
        Locations = {
            --vector3(-310.8, -137.55, 39.01)
        },
        Items = {
        }
    },

    RobsLiquor = {
		Locations = {
            --[[vector3(127.8,  -1284.7, 28.2), --StripClub
			vector3(-1393.4, -606.6, 29.3), --Tequila la]]
        },
        Items = {
        }
    },

    WeaponShop = {
        Locations = {
            --vector3(1272.85, -1711.89,54.77), --blackmarket
        },
        Items = {
        },
    },

    Police = {
		Locations = {
            
        },
        Items = {

        }
    },

    PrisonShop = {
        Locations = {

        },
        Items = {
        }
    },

    Bahama = {
        Locations = {
        },
        Items = {
        }
    },

    Tequi = {
        Locations = {
        },
        Items = {
        }
    },

    Yellow = {
		Locations = {
        },
        Items = {
        }
    },
    
    Noblip = {
        Locations = {

        },
        Items = {
        }
    },

    PrisonShop = {
        Locations = {

        },
        Items = {

        }
    },
}

