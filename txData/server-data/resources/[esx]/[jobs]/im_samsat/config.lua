Config 					= {}

Config.Impound 			= {
	Name = "MissionRow",
	RetrieveLocation = { X = 369.56, Y = -1607.55, Z = 29.29 },
	StoreLocation = { X = 377.33, Y = -1630.58, Z = 28.15 },
	SpawnLocations = {
		{ x = 393.04, y = -1628.32, z = 28.86 , h = 51.02 },
		{ x = 395.12, y = -1626.07, z = 28.86 , h = 50.37 },
		{ x = 396.94, y = -1623.8, z = 28.86 , h = 50.48 },
	},
	AdminTerminalLocations = {
		{ x = 383.29, y = -1612.55, z = 29.29 }
	}
}

Config.Rules = {
	maxWeeks		= 5,
	maxDays			= 6,
	maxHours		= 24,

	minFee			= 1000,
	maxFee 			= 1000000,

	minReasonLength	= 10,
}

--------------------------------------------------------------------------------
----------------------- SERVERS WITHOUT ESX_MIGRATE ----------------------------
---------------- This could work, it also could not work... --------------------
--------------------------------------------------------------------------------
-- Should be true if you still have an owned_vehicles table without plate column.
Config.NoPlateColumn = false
-- Only change when NoPlateColumn is true, menu's will take longer to show but otherwise you might not have any data.
-- Try increments of 250
Config.WaitTime = 250
