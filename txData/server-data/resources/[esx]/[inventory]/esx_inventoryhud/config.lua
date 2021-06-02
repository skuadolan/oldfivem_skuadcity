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

Config.priceItemPedagang = 250 --sementara

Config.Map = {
    {name="Lounge",color=27, id=93, pos=vector3(-629.28, 223.93, 81.88)},
    {name="",color=1, id=52, pos=vector3(2751.0, 3471.74,  55.7)},
    {name="",color=1, id=643, pos=vector3(962.5,-1585.5,29.6)},
}

Config.Shops = {
    RegularShop = {
        Locations = {
			vector3(373.8, 325.8, 102.5),
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
			vector3(127.8,  -1284.7, 28.2), --StripClub
			vector3(-1393.4, -606.6, 29.3), --Tequila la
			vector3(-559.9, 287.0, 81.1),
            vector3(-48.5,  -1757.5, 28.4),
			vector3(1163.3, -323.8, 68.2),
			vector3(-707.5, -914.2, 18.2),
			vector3(-1820.5, 792.5, 137.1),
			vector3(1698.3, 4924.4, 41.0),
        },
        Items = {
            {name = 'air_putih'},
            {name = 'coklat'},
            {name = 'tehkotak'},
            {name = 'makaroni'},
            {name = 'phone'},
            {name = 'radio'},
            {name = 'beer'},
            {name = 'whiskey'},
            {name = 'vodka'},
            {name = 'champagne'},
            {name = 'wine'},
        }
    },

    Ambulance = {
		Locations = {
            vector3(311.72, -562.65, 43.28)
        },
        Items = {
            {name = 'bandage'},
            {name = 'medikit'},
        }
    },
    
    Pedagang = {
		Locations = {
            vector3(-629.28, 223.93, 81.88)
        },
        Items = {
            {name = 'kopi'},
            {name = 'teh'},
            {name = 'siomay'},
            {name = 'roti'},
            {name = 'nasi_bungkus'},
            {name = 'nasi_goreng'},
            {name = 'phone'},
            {name = 'radio'},
            {name = 'susu'},
            {name = 'tehkotak'}
        }
    },

    YouTool = {
        Locations = {
            vector3(2751.0, 3471.74,  55.7)
        },
        Items = {
            {name = 'kertas'},
            {name = 'gunpowder'},
            {name = 'betadine'},
            {name = 'fixtool'},
            {name = 'carotool'},
            {name = 'gazbottle'},
            {name = 'battery'},
            {name = 'bullet_casing'},
            {name = 'bullet'}
        }
    },

    Mech = {
        Locations = {
            vector3(-310.8, -137.55, 39.01)
        },
        Items = {
            {name = 'fixkit'},
            {name = 'carokit'},
            {name = 'blowpipe'}
        }
    },

    RobsLiquor = {
		Locations = {
        },
        Items = {
        }
    },

    WeaponShop = {
        Locations = {
            vector3(1272.85, -1711.89,54.77), --blackmarket
        },
        Items = {
            {name = 'moneywash'},
            {name = 'chemicalslisence'},
            {name = 'lisensi_senjata'},
            {name = 'clip'},
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

