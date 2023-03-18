Config = {}
Config.Locale = 'id'

Config.MenuAlign = 'top-left'
Config.DrawDistance = 2

Config.UseCommand = false -- Will allow players to do /getproperties instead of having to log out & back in to see Private Garages.
Config.ParkVehicles = false -- true = Automatically Park all Vehicles in Garage on Server/Script Restart | false = Opposite of true but players will have to go to Pound to get their Vehicle Back.
Config.KickPossibleCheaters = true -- true = Kick Player that tries to Cheat Garage by changing Vehicle Hash/Plate.
Config.UseCustomKickMessage = false -- true = Sets Custom Kick Message for those that try to Cheat. Note: "Config.KickPossibleCheaters" must be true.

Config.GiveSocietyMoney = false -- true = Gives money to society_mechanic. Note: REQUIRES esx_mechanicjob.
Config.ShowVehicleLocation = true -- true = Will show Location of Vehicles in the Garage Menus.
Config.ShowSpacers = true -- true = Shows Spacers in Menus.

Config.PointMarker = {Type = 21, r = 0, g = 255, b = 0, x = 0.45, y = 0.45, z = 0.45} -- Green Color / Standard Size Circle.
Config.DeleteMarker = {Type = 1, r = 255, g = 0, b = 0, x = 3.45, y = 3.45, z = 1.45} -- Red Color / Big Size Circle.
Config.PoundMarker = {Type = 1, r = 255, g = 0, b = 0, x = 3.45, y = 3.45, z = 1.45} -- Blue Color / Standard Size Circle.
Config.JPoundMarker = {Type = 1, r = 255, g = 0, b = 0, x = 3.45, y = 3.45, z = 1.45} -- Red Color / Standard Size Circle.

Config.GarageBlip = {Sprite = 290, Color = 38, Display = 2, Scale = 0.75} -- Public Garage Blip.
Config.PGarageBlip = {Sprite = 290, Color = 53, Display = 2, Scale = 0.75} -- Private Garage Blip.
Config.PoundBlip = {Sprite = 67, Color = 64, Display = 2, Scale = 0.75} -- Pound Blip.
Config.JGarageBlip = {Sprite = 290, Color = 49, Display = 2, Scale = 0.75} -- Job Garage Blip.
Config.JPoundBlip = {Sprite = 67, Color = 49, Display = 2, Scale = 0.75} -- Job Pound Blip.

Config.SeparateGarage = true
Config.LegacyFuel = true

Config.UsePoundTimer = false -- true = Uses Pound Timer
Config.PoundWait = 5 -- How many Minutes someone must wait before Opening Pound Menu Again.

Config.UseJPoundTimer = false -- true = Uses Job Pound Timer
Config.JPoundWait = 2.5 -- How many Minutes someone must wait before Opening Job Pound Menu Again.

Config.UseDamageMult = false -- true = Costs more to Store a Broken/Damaged Vehicle.
Config.DamageMult = 5 -- Higher Number = Higher Repair Price.

Config.UsingAdvancedVehicleShop = false -- Set to true if using esx_advancedvehicleshop

Config.UseAmbulanceGarages = false -- true = Allows use of Ambulance Garages.
Config.UseAmbulancePounds = true -- true = Allows use of Ambulance Pounds.
Config.UseAmbulanceBlips = true -- true = Use Ambulance Blips.
Config.AmbulancePoundPrice = 1000 -- How much it Costs to get Vehicle from Ambulance Pound.

Config.UsePoliceGarages = false -- true = Allows use of Police Garages.
Config.UsePolicePounds = true -- true = Allows use of Police Pounds.
Config.UsePoliceBlips = true -- true = Use Police Blips.
Config.PolicePoundPrice = 1000 -- How much it Costs to get Vehicle from Police Pound.

Config.UseAircraftGarages = true -- true = Allows use of Aircraft Garages.
Config.UseAircraftBlips = true -- true = Use Aircraft Blips.
Config.AircraftPoundPrice = 1000 -- How much it Costs to get Vehicle from Aircraft Pound.

Config.UseBoatGarages = true -- true = Allows use of Boat Garages.
Config.UseBoatBlips = true -- true = Use Boat Blips.
Config.BoatPoundPrice = 1000 -- How much it Costs to get Vehicle from Boat Pound.

Config.UseCarGarages = true -- true = Allows use of Car Garages.
Config.UseCarBlips = true-- true = Use Car Blips.
Config.CarPoundPrice = 1000 -- How much it Costs to get Vehicle from Car Pound.

Config.UsePrivateCarGarages = true -- true = Allows use of Private Car Garages.

-- Marker = Enter Location | Spawner = Spawn Location | Spawner2 = Job Aircraft Spawn Location | Deleter = Delete Location
-- Deleter2 = Job Aircraft Delete Location | Heading = Spawn Heading | Heading2 = Job Aircraft Spawn Heading

-- Start of Ambulance
Config.AmbulanceGarages = {
	Los_Santos = {
		Marker = vector3(302.95, -1453.5, 28.97),
		Spawner = vector3(300.33, -1431.91, 29.8),
		Spawner2 = vector3(313.36, -1465.17, 46.51),
		Deleter = vector3(300.33, -1431.91, 28.8),
		Deleter2 = vector3(313.36, -1465.17, 45.51),
		Heading = 226.71,
		Heading2 = 318.34
	}
}

Config.AmbulancePounds = {
	Los_Santos = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}
-- End of Ambulance

-- Start of Police
Config.PoliceGarages = {
	Los_Santos = {
		Marker = vector3(425.41, -1003.43, 29.71),
		Spawner = vector3(434.28, -1015.8, 28.83),
		Spawner2 = vector3(449.21, -981.35, 43.69),
		Deleter = vector3(462.95, -1014.56, 27.07),
		Deleter2 = vector3(449.21, -981.35, 42.69),
		Heading = 90.46,
		Heading2 = 184.53
	}
}

Config.PolicePounds = {
	Los_Santos = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}
-- End of Police

-- Start of Aircrafts
Config.AircraftGarages = {
	Los_Santos_Airport = {
		Marker = vector3(-1617.14, -3145.52, 12.99),
		Spawner = vector3(-1657.99, -3134.38, 12.99),
		Deleter = vector3(-1642.12, -3144.25, 12.99),
		Heading = 330.11
	},
	Sandy_Shores_Airport = {
		Marker = vector3(1723.84, 3288.29, 40.16),
		Spawner = vector3(1710.85, 3259.06, 40.69),
		Deleter = vector3(1714.45, 3246.75, 40.07),
		Heading = 104.66
	},
	Grapeseed_Airport = {
		Marker = vector3(2152.83, 4797.03, 40.19),
		Spawner = vector3(2122.72, 4804.85, 40.78),
		Deleter = vector3(2082.36, 4806.06, 40.07),
		Heading = 115.04
	}
}

Config.AircraftPounds = {
	Los_Santos_Airport = {
		Marker = vector3(-1243.0, -3391.92, 12.94),
		Spawner = vector3(-1272.27, -3382.46, 12.94),
		Heading = 330.25
	}
}
-- End of Aircrafts

-- Start of Boats
Config.BoatGarages = {
	Los_Santos_Dock = {
		Marker = vector3(-735.87, -1325.08, 0.6),
		Spawner = vector3(-718.87, -1320.18, -0.47),
		Deleter = vector3(-731.15, -1334.71, -0.47),
		Heading = 45.0
	},
	Sandy_Shores_Dock = {
		Marker = vector3(1333.2, 4269.92, 30.5),
		Spawner = vector3(1334.61, 4264.68, 29.86),
		Deleter = vector3(1323.73, 4269.94, 29.86),
		Heading = 87.0
	},
	Paleto_Bay_Dock = {
		Marker = vector3(-283.74, 6629.51, 7.3),
		Spawner = vector3(-290.46, 6622.72, -0.47),
		Deleter = vector3(-304.66, 6607.36, -0.47),
		Heading = 52.0
	}
}

Config.BoatPounds = {
	Los_Santos_Dock = {
		Marker = vector3(-738.67, -1400.43, 5.0),
		Spawner = vector3(-738.33, -1381.51, 0.12),
		Heading = 137.85
	}
	--[[Sandy_Shores_Dock = {
		Marker = vector3(1299.36, 4217.93, 32.91),
		Spawner = vector3(1294.35, 4226.31, 29.86),
		Heading = 345.0
	},
	Paleto_Bay_Dock = {
		Marker = vector3(-270.2, 6642.43, 6.36),
		Spawner = vector3(-290.38, 6638.54, -0.47),
		Heading = 130.0
	}]]--
}
-- End of Boats

-- Start of Cars
Config.CarGarages = {
	Garasi_Kota = {
		---789.75 29.55
		---472.1 -786.98 29.55 174.74
		Marker = vector3(216.25,-811.06,30.79),
		Spawner = vector3(233.02,-793.36,30.57),
		Deleter = vector3(217.09,-787.66,29.81),
		Heading = 159.24
	},
	Garasi_SandyShores = {
		Marker = vector3(1698.15, 3595.93, 35.54),
		Spawner = vector3(1706.04, 3598.46, 35.43),
		Deleter = vector3(1696.02, 3608.25, 35.36),
		Heading = 206.54
	},
	Paleto_Bay = {
		Marker = vector3(105.36, 6613.59, 32.40),
		Spawner = vector3(128.78, 6622.99, 32.78),
		Deleter = vector3(126.36, 6608.41, 32.86),
		Heading = 315.01
	}
}

Config.CarPounds = {
	Los_Santos = {
		Marker = vector3(408.61, -1625.47, 30.29),
		Spawner = vector3(405.64, -1643.4, 30.61),
		Heading = 229.54
	},
	Sandy_Shores = {
		Marker = vector3(1651.38, 3804.84, 38.65),
		Spawner = vector3(1627.84, 3788.45, 34.77),
		Heading = 308.53
	},
	Paleto_Bay = {
		Marker = vector3(-234.82, 6198.65, 30.94),
		Spawner = vector3(-230.08, 6190.24, 30.49),
		Heading = 140.24
	}
}
-- End of Cars

-- Start of Private Cars
Config.PrivateCarGarages = {
	-- Maze Bank Building Garages
	MazeBankBuilding_Main = {
		Private = "MazeBankBuilding",
		Marker = vector3(-76.44,-796.34,44.23),
		Spawner = vector3(-54.64,-783.39,43.45),
		Deleter = vector3(-59.69,-774.58,43.59),
		Heading = 229.04
	},
	MazeBankBuilding_OldSpiceWarm = {
		Private = "OldSpiceWarm",
		Marker = vector3(-76.44,-796.34,44.23),
		Spawner = vector3(-54.64,-783.39,43.45),
		Deleter = vector3(-59.69,-774.58,43.59),
		Heading = 229.04
	},
	MazeBankBuilding_OldSpiceClassical = {
		Private = "OldSpiceClassical",
		Marker = vector3(-76.44,-796.34,44.23),
		Spawner = vector3(-54.64,-783.39,43.45),
		Deleter = vector3(-59.69,-774.58,43.59),
		Heading = 229.04
	},
	MazeBankBuilding_OldSpiceVintage = {
		Private = "OldSpiceVintage",
		Marker = vector3(-76.44,-796.34,44.23),
		Spawner = vector3(-54.64,-783.39,43.45),
		Deleter = vector3(-59.69,-774.58,43.59),
		Heading = 229.04
	},
	MazeBankBuilding_ExecutiveRich = {
		Private = "ExecutiveRich",
		Marker = vector3(-76.44,-796.34,44.23),
		Spawner = vector3(-54.64,-783.39,43.45),
		Deleter = vector3(-59.69,-774.58,43.59),
		Heading = 229.04
	},
	MazeBankBuilding_ExecutiveCool = {
		Private = "ExecutiveCool",
		Marker = vector3(-76.44,-796.34,44.23),
		Spawner = vector3(-54.64,-783.39,43.45),
		Deleter = vector3(-59.69,-774.58,43.59),
		Heading = 229.04
	},
	MazeBankBuilding_ExecutiveContrast = {
		Private = "ExecutiveContrast",
		Marker = vector3(-76.44,-796.34,44.23),
		Spawner = vector3(-54.64,-783.39,43.45),
		Deleter = vector3(-59.69,-774.58,43.59),
		Heading = 229.04
	},
	MazeBankBuilding_PowerBrokerIce = {
		Private = "PowerBrokerIce",
		Marker = vector3(-76.44,-796.34,44.23),
		Spawner = vector3(-54.64,-783.39,43.45),
		Deleter = vector3(-59.69,-774.58,43.59),
		Heading = 229.04
	},
	MazeBankBuilding_PowerBrokerConservative = {
		Private = "PowerBrokerConservative",
		Marker = vector3(-76.44,-796.34,44.23),
		Spawner = vector3(-54.64,-783.39,43.45),
		Deleter = vector3(-59.69,-774.58,43.59),
		Heading = 229.04
	},
	MazeBankBuilding_PowerBrokerPolished = {
		Private = "PowerBrokerPolished",
		Marker = vector3(-76.44,-796.34,44.23),
		Spawner = vector3(-54.64,-783.39,43.45),
		Deleter = vector3(-59.69,-774.58,43.59),
		Heading = 229.04
	},
	-- End of Maze Bank Building Garages
	-- Start of Lom Bank Garages
	LomBank_Main = {
		Private = "LomBank",
		Marker = vector3(-1545.17,-566.24,25.85),
		Spawner = vector3(-1544.12,-563.29,25.04),
		Deleter = vector3(-1549.47,-565.19,25.04),
		Heading = 34.63
	},
	LomBank_LBOldSpiceWarm = {
		Private = "LBOldSpiceWarm",
		Marker = vector3(-1545.17,-566.24,25.85),
		Spawner = vector3(-1544.12,-563.29,25.04),
		Deleter = vector3(-1549.47,-565.19,25.04),
		Heading = 34.63
	},
	LomBank_LBOldSpiceClassical = {
		Private = "LBOldSpiceClassical",
		Marker = vector3(-1545.17,-566.24,25.85),
		Spawner = vector3(-1544.12,-563.29,25.04),
		Deleter = vector3(-1549.47,-565.19,25.04),
		Heading = 34.63
	},
	LomBank_LBOldSpiceVintage = {
		Private = "LBOldSpiceVintage",
		Marker = vector3(-1545.17,-566.24,25.85),
		Spawner = vector3(-1544.12,-563.29,25.04),
		Deleter = vector3(-1549.47,-565.19,25.04),
		Heading = 34.63
	},
	LomBank_LBExecutiveRich = {
		Private = "LBExecutiveRich",
		Marker = vector3(-1545.17,-566.24,25.85),
		Spawner = vector3(-1544.12,-563.29,25.04),
		Deleter = vector3(-1549.47,-565.19,25.04),
		Heading = 34.63
	},
	LomBank_LBExecutiveCool = {
		Private = "LBExecutiveCool",
		Marker = vector3(-1545.17,-566.24,25.85),
		Spawner = vector3(-1544.12,-563.29,25.04),
		Deleter = vector3(-1549.47,-565.19,25.04),
		Heading = 34.63
	},
	LomBank_LBExecutiveContrast = {
		Private = "LBExecutiveContrast",
		Marker = vector3(-1545.17,-566.24,25.85),
		Spawner = vector3(-1544.12,-563.29,25.04),
		Deleter = vector3(-1549.47,-565.19,25.04),
		Heading = 34.63
	},
	LomBank_LBPowerBrokerIce = {
		Private = "LBPowerBrokerIce",
		Marker = vector3(-1545.17,-566.24,25.85),
		Spawner = vector3(-1544.12,-563.29,25.04),
		Deleter = vector3(-1549.47,-565.19,25.04),
		Heading = 34.63
	},
	LomBank_LBPowerBrokerConservative = {
		Private = "LBPowerBrokerConservative",
		Marker = vector3(-1545.17,-566.24,25.85),
		Spawner = vector3(-1544.12,-563.29,25.04),
		Deleter = vector3(-1549.47,-565.19,25.04),
		Heading = 34.63
	},
	LomBank_LBPowerBrokerPolished = {
		Private = "LBPowerBrokerPolished",
		Marker = vector3(-1545.17,-566.24,25.85),
		Spawner = vector3(-1544.12,-563.29,25.04),
		Deleter = vector3(-1549.47,-565.19,25.04),
		Heading = 34.63
	},
	-- End of Lom Bank Garages
	-- Start of Maze Bank West Garages
	MazeBankWest_Main = {
		Private = "MazeBankWest",
		Marker = vector3(-1368.14,-468.01,31.6),
		Spawner = vector3(-1371.34,-471.34,30.93),
		Deleter = vector3(-1384.47,-478.15,30.93),
		Heading = 98.91
	},
	MazeBankWest_MBWOldSpiceWarm = {
		Private = "MBWOldSpiceWarm",
		Marker = vector3(-1368.14,-468.01,31.6),
		Spawner = vector3(-1371.34,-471.34,30.93),
		Deleter = vector3(-1384.47,-478.15,30.93),
		Heading = 98.91
	},
	MazeBankWest_MBWOldSpiceClassical = {
		Private = "MBWOldSpiceClassical",
		Marker = vector3(-1368.14,-468.01,31.6),
		Spawner = vector3(-1371.34,-471.34,30.93),
		Deleter = vector3(-1384.47,-478.15,30.93),
		Heading = 98.91
	},
	MazeBankWest_MBWOldSpiceVintage = {
		Private = "MBWOldSpiceVintage",
		Marker = vector3(-1368.14,-468.01,31.6),
		Spawner = vector3(-1371.34,-471.34,30.93),
		Deleter = vector3(-1384.47,-478.15,30.93),
		Heading = 98.91
	},
	MazeBankWest_MBWExecutiveRich = {
		Private = "MBWExecutiveRich",
		Marker = vector3(-1368.14,-468.01,31.6),
		Spawner = vector3(-1371.34,-471.34,30.93),
		Deleter = vector3(-1384.47,-478.15,30.93),
		Heading = 98.91
	},
	MazeBankWest_MBWExecutiveCool = {
		Private = "MBWExecutiveCool",
		Marker = vector3(-1368.14,-468.01,31.6),
		Spawner = vector3(-1371.34,-471.34,30.93),
		Deleter = vector3(-1384.47,-478.15,30.93),
		Heading = 98.91
	},
	MazeBankWest_MBWExecutiveContrast = {
		Private = "MBWExecutiveContrast",
		Marker = vector3(-1368.14,-468.01,31.6),
		Spawner = vector3(-1371.34,-471.34,30.93),
		Deleter = vector3(-1384.47,-478.15,30.93),
		Heading = 98.91
	},
	MazeBankWest_MBWPowerBrokerIce = {
		Private = "MBWPowerBrokerIce",
		Marker = vector3(-1368.14,-468.01,31.6),
		Spawner = vector3(-1371.34,-471.34,30.93),
		Deleter = vector3(-1384.47,-478.15,30.93),
		Heading = 98.91
	},
	MazeBankWest_MBWPowerBrokerConvservative = {
		Private = "MBWPowerBrokerConvservative",
		Marker = vector3(-1368.14,-468.01,31.6),
		Spawner = vector3(-1371.34,-471.34,30.93),
		Deleter = vector3(-1384.47,-478.15,30.93),
		Heading = 98.91
	},
	MazeBankWest_MBWPowerBrokerPolished = {
		Private = "MBWPowerBrokerPolished",
		Marker = vector3(-1368.14,-468.01,31.6),
		Spawner = vector3(-1371.34,-471.34,30.93),
		Deleter = vector3(-1384.47,-478.15,30.93),
		Heading = 98.91
	},
	-- End of Maze Bank West Garages
	-- Start of Intergrity Way Garages
	IntegrityWay_Main = {
		Private = "IntegrityWay",
		Marker = vector3(-31.89,-619.15,35.24),
		Spawner = vector3(-38.65,-620.06,34.41),
		Deleter = vector3(-26.61,-624.38,34.83),
		Heading = 250.89
	},
	IntegrityWay_IntegrityWay28 = {
		Private = "IntegrityWay28",
		Marker = vector3(-31.89,-619.15,35.24),
		Spawner = vector3(-38.65,-620.06,34.41),
		Deleter = vector3(-26.61,-624.38,34.83),
		Heading = 250.89
	},
	IntegrityWay_IntegrityWay30 = {
		Private = "IntegrityWay30",
		Marker = vector3(-31.89,-619.15,35.24),
		Spawner = vector3(-38.65,-620.06,34.41),
		Deleter = vector3(-26.61,-624.38,34.83),
		Heading = 250.89
	},
	-- End of Intergrity Way Garages
	-- Start of Dell Perro Heights Garages
	DellPerroHeights_Main = {
		Private = "DellPerroHeights",
		Marker = vector3(-1459.63,-506.03,32.08),
		Spawner = vector3(-1467.13,-505.29,32.14),
		Deleter = vector3(-1457.29,-500.92,31.48),
		Heading = 32.55
	},
	DellPerroHeights_DellPerroHeightst4 = {
		Private = "DellPerroHeightst4",
		Marker = vector3(-1459.63,-506.03,32.08),
		Spawner = vector3(-1467.13,-505.29,32.14),
		Deleter = vector3(-1457.29,-500.92,31.48),
		Heading = 32.55
	},
	DellPerroHeights_DellPerroHeightst7 = {
		Private = "DellPerroHeightst7",
		Marker = vector3(-1459.63,-506.03,32.08),
		Spawner = vector3(-1467.13,-505.29,32.14),
		Deleter = vector3(-1457.29,-500.92,31.48),
		Heading = 32.55
	},
	-- End of Dell Perro Heights Garages
	-- Start of Milton Drive Garages
	MiltonDrive_Main = {
		Private = "MiltonDrive",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Modern1Apartment = {
		Private = "Modern1Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Modern2Apartment = {
		Private = "Modern2Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Modern3Apartment = {
		Private = "Modern3Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Mody1Apartment = {
		Private = "Mody1Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Mody2Apartment = {
		Private = "Mody2Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Mody3Apartment = {
		Private = "Mody3Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Vibrant1Apartment = {
		Private = "Vibrant1Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Vibrant2Apartment = {
		Private = "Vibrant2Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Vibrant3Apartment = {
		Private = "Vibrant3Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Sharp1Apartment = {
		Private = "Sharp1Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Sharp2Apartment = {
		Private = "Sharp2Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Sharp3Apartment = {
		Private = "Sharp3Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Monochrome1Apartment = {
		Private = "Monochrome1Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Monochrome2Apartment = {
		Private = "Monochrome2Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Monochrome3Apartment = {
		Private = "Monochrome3Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Seductive1Apartment = {
		Private = "Seductive1Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Seductive2Apartment = {
		Private = "Seductive2Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Seductive3Apartment = {
		Private = "Seductive3Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Regal1Apartment = {
		Private = "Regal1Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Regal2Apartment = {
		Private = "Regal2Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Regal3Apartment = {
		Private = "Regal3Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Aqua1Apartment = {
		Private = "Aqua1Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Aqua2Apartment = {
		Private = "Aqua2Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	MiltonDrive_Aqua3Apartment = {
		Private = "Aqua3Apartment",
		Marker = vector3(-795.95,331.83,85.7),
		Spawner = vector3(-800.49, 333.47, 84.5),
		Deleter = vector3(-791.75, 333.47, 84.5),
		Heading = 180.494
	},
	-- End of Milton Drive Garages
	-- Start of Single Garages
	RichardMajesticApt2_Main = {
		Private = "RichardMajesticApt2",
		Marker = vector3(-886.12,-350.33,34.68),
		Spawner = vector3(-888.89,-337.07,33.87),
		Deleter = vector3(-895.31,-345.01,33.87),
		Heading = 207.25
	},
	WildOatsDrive_Main = {
		Private = "WildOatsDrive",
		Marker = vector3(-178.65,503.45,136.85),
		Spawner = vector3(-189.95,501.57,133.78),
		Deleter = vector3(-188.37,501.83,133.89),
		Heading = 348.54
	},
	WhispymoundDrive_Main = {
		Private = "WhispymoundDrive",
		Marker = vector3(123.65,565.75,184.04),
		Spawner = vector3(131.12,567.75,182.87),
		Deleter = vector3(131.47,567.43,182.93),
		Heading = 17.43
	},
	NorthConkerAvenue2044_Main = {
		Private = "NorthConkerAvenue2044",
		Marker = vector3(348.18,443.01,147.7),
		Spawner = vector3(353.06,438.52,146.05),
		Deleter = vector3(353.91,436.25,146.16),
		Heading = 296.43
	},
	NorthConkerAvenue2045_Main = {
		Private = "NorthConkerAvenue2045",
		Marker = vector3(370.69,490.76,145.11),
		Spawner = vector3(388.69,431.09,142.93),
		Deleter = vector3(391.15,430.14,143.04),
		Heading = 331.02
	},
	HillcrestAvenue2862_Main = {
		Private = "HillcrestAvenue2862",
		Marker = vector3(-688.71,597.57,143.64),
		Spawner = vector3(-684.1,603.16,143.0),
		Deleter = vector3(-684.1,603.16,143.0),
		Heading = 27.35
	},
	HillcrestAvenue2868_Main = {
		Private = "HillcrestAvenue2868",
		Marker = vector3(-752.37,622.28,142.35),
		Spawner = vector3(-753.61,627.74,141.93),
		Deleter = vector3(-753.61,627.74,141.93),
		Heading = 294.56
	},
	--SAMPE SINI
	HillcrestAvenue2874_Main = {
		Private = "HillcrestAvenue2874",
		Marker = vector3(-859.01, 695.95, 147.93),
		Spawner = vector3(-863.68, 698.72, 147.05),
		Deleter = vector3(-855.66, 698.77, 147.81),
		Heading = 341.77
	},
	MadWayneThunder_Main = {
		Private = "MadWayneThunder",
		Marker = vector3(-1290.95, 454.52, 96.66),
		Spawner = vector3(-1297.62, 459.28, 96.48),
		Deleter = vector3(-1298.09, 468.95, 96.0),
		Heading = 285.652
	},
	TinselTowersApt12_Main = {
		Private = "TinselTowersApt12",
		Marker = vector3(-616.74, 56.38, 42.73),
		Spawner = vector3(-620.59, 60.10, 42.73),
		Deleter = vector3(-621.13, 52.69, 42.73),
		Heading = 109.316
	},
	-- End of Single Garages
	-- Start of VENT Custom Garages
	MedEndApartment1_Main = {
		Private = "MedEndApartment1",
		Marker = vector3(240.23, 3102.84, 41.49),
		Spawner = vector3(233.58, 3094.29, 41.49),
		Deleter = vector3(237.52, 3112.63, 41.39),
		Heading = 93.91
	},
	MedEndApartment2_Main = {
		Private = "MedEndApartment2",
		Marker = vector3(246.08, 3174.63, 41.72),
		Spawner = vector3(234.15, 3164.37, 41.54),
		Deleter = vector3(240.72, 3165.53, 41.65),
		Heading = 102.03
	},
	MedEndApartment3_Main = {
		Private = "MedEndApartment3",
		Marker = vector3(984.92, 2668.95, 39.06),
		Spawner = vector3(993.96, 2672.68, 39.06),
		Deleter = vector3(994.04, 2662.1, 39.13),
		Heading = 0.61
	},
	MedEndApartment4_Main = {
		Private = "MedEndApartment4",
		Marker = vector3(196.49, 3027.48, 42.89),
		Spawner = vector3(203.1, 3039.47, 42.08),
		Deleter = vector3(192.24, 3037.95, 42.89),
		Heading = 271.3
	},
	MedEndApartment5_Main = {
		Private = "MedEndApartment5",
		Marker = vector3(1724.49, 4638.13, 42.31),
		Spawner = vector3(1723.98, 4630.19, 42.23),
		Deleter = vector3(1733.66, 4635.08, 42.24),
		Heading = 117.88
	},
	MedEndApartment6_Main = {
		Private = "MedEndApartment6",
		Marker = vector3(1670.76, 4740.99, 41.08),
		Spawner = vector3(1673.47, 4756.51, 40.91),
		Deleter = vector3(1668.46, 4750.83, 40.88),
		Heading = 12.82
	},
	MedEndApartment7_Main = {
		Private = "MedEndApartment7",
		Marker = vector3(15.24, 6573.38, 31.72),
		Spawner = vector3(16.77, 6581.68, 31.42),
		Deleter = vector3(10.45, 6588.04, 31.47),
		Heading = 222.6
	},
	MedEndApartment8_Main = {
		Private = "MedEndApartment8",
		Marker = vector3(-374.73, 6187.06, 30.54),
		Spawner = vector3(-377.97, 6183.73, 30.49),
		Deleter = vector3(-383.31, 6188.85, 30.49),
		Heading = 223.71
	},
	MedEndApartment9_Main = {
		Private = "MedEndApartment9",
		Marker = vector3(-24.6, 6605.99, 30.45),
		Spawner = vector3(-16.0, 6607.74, 30.18),
		Deleter = vector3(-9.36, 6598.86, 30.47),
		Heading = 35.31
	},
	MedEndApartment10_Main = {
		Private = "MedEndApartment10",
		Marker = vector3(-365.18, 6323.95, 28.9),
		Spawner = vector3(-359.49, 6327.41, 28.83),
		Deleter = vector3(-353.47, 6334.57, 28.83),
		Heading = 218.58
	}
	-- End of VENT Custom Garages
}
-- End of Private Cars
