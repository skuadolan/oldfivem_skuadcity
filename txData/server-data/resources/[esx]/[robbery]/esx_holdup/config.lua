Config = {}
Config.Locale = 'en'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 3
Config.TimerBeforeNewRob    = 1800 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["WARUNG_01"] = {
		position = { x = 379.64, y = 332.17, z = 103.57 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (01)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_02"] = {
		position = { x = 2550.04, y = 386.84, z = 108.62 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (02)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_03"] = {
		position = { x = -3047.91, y = 587.88, z = 7.91 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (03)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_04"] = {
		position = { x = -3249.38, y = 1006.42, z = 12.83 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (04)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_05"] = {
		position = { x = 544.39, y = 2662.98, z = 42.16 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (05)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_06"] = {
		position = { x = 1960.05, y = 3749.04, z = 32.34 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (06)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_07"] = {
		position = { x = 2673.18, y = 3287.13, z = 55.24 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (07)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_08"] = {
		position = { x = 1735.48, y = 6420.04, z = 35.04 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (08)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_09"] = {
		position = { x = 29.26, y = -1339.66, z = 29.5 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (09)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_10"] = {
		position = { x = 1126.88, y = -980.38, z = 45.42 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (10)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_11"] = {
		position = { x = -1220.76, y = -915.91, z = 11.33 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (11)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_12"] = {
		position = { x = -1479.09, y = -375.32, z = 39.16 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (12)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_13"] = {
		position = { x = -2959.66, y = 387.33, z = 14.04 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (13)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_14"] = {
		position = { x = 1168.98, y = 2717.8, z = 37.16 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (14)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_15"] = {
		position = { x = 1395.06, y = 3613.72, z = 34.98 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (15)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_16"] = {
		position = { x = -43.25, y = -1748.6, z = 29.42 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (16)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_17"] = {
		position = { x = 1159.66, y = -313.98, z = 69.21 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (17)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_18"] = {
		position = { x = -709.72, y = -904.09, z = 19.22 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (18)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_19"] = {
		position = { x = -1829.19, y = 798.81, z = 138.19 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (19)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["WARUNG_20"] = {
		position = { x = 1707.93, y = 4920.41, z = 42.06 },
		reward = math.random(350000, 400000),
		nameOfStore = "WARUNG LOJAS (20)",
		secondsRemaining = 290, -- seconds
		lastRobbed = 0
	},
	["FLEECA_01"] = {
		position = { x = 147.04908752441, y = -1044.9448242188, z = 29.36802482605 },
		reward = math.random(750000,850000),
		nameOfStore = "BANK FLEECA (01)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	  
	["FLEECA_02"] = {
		position = { x = -1212.1, y = -335.84, z = 37.79 },
		reward = math.random(750000,850000),
		nameOfStore = "BANK FLEECA (02)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	   
	["FLEECA_03"] = {
		position = { x = -2957.54, y = 481.0, z = 15.71 },
		reward = math.random(750000,850000),
		nameOfStore = "BANK FLEECA (03)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	  
	["FLEECA_04"] = {
		position = { x = -105.32, y = 6472.51, z = 31.63 },
		reward = math.random(750000,850000),
		nameOfStore = "BANK FLEECA (04)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["FLECA_06"] = {
		position = { x = -353.84, y = -54.28, z = 49.04 },
		reward = math.random(750000,850000),
		nameOfStore = "BANK FLEECA (06)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["FLECA_05"] = {
		position = { x = 311.13, y = -283.14, z = 54.17 },
		reward = math.random(750000,850000),
		nameOfStore = "BANK FLEECA (05)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	  
	["FLECA_08"] = {
		position = { x = 1176.36, y = 2711.82, z = 38.09 },
		reward = math.random(750000,850000),
		nameOfStore = "BANK FLEECA (08)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["PrincipalBank"] = {
		position = { x = 254.98, y = 225.95, z = 101.88 },
		reward = math.random(1150000,1500000),
		nameOfStore = "BANK BESAR",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	}


}
