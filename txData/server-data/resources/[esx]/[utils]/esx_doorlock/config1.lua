Config = {}
Config.Locale = 'en'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_door01',
				objYaw = -90.0,
				objCoords = vector3(434.7, -980.6, 30.8)
			},

			{
				objName = 'v_ilev_ph_door002',
				objYaw = -90.0,
				objCoords = vector3(434.7, -983.2, 30.8)
			}
		}
	},

	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objYaw = 90.0,
		objCoords  = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objYaw = 90.0,
		objCoords  = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = 90.0,
		objCoords  = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = -90.0,
		objCoords  = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objYaw = -180.0,
		objCoords  = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 180.0,
				objCoords = vector3(443.9, -989.0, 30.6)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 0.0,
				objCoords = vector3(445.3, -988.7, 30.6)
			}
		}
	},


	-- {
	-- 	objName = 'phxlsmc_doorframe_double',
	-- 	objYaw = 0.0,
	-- 	objCoords  = vector3(345.92, -568.83, 28.79),
	-- 	textCoords = vector3(345.92, -568.83, 28.30),
	-- 	authorizedJobs = { 'ambulance' },
	-- 	locked = true
	-- },

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 0.0,
		objCoords  = vector3(463.8, -992.6, 24.9),
		textCoords = vector3(463.3, -992.6, 25.1),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = -90.0,
		objCoords  = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 0.0,
		objCoords  = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		textCoords = vector3(443.05, -993.17, 30.69),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor006',
				objYaw = -90.0,
				objCoords = vector3(443.52, -993.88, 30.69)
			},

			{
				objName = 'v_ilev_ph_gendoor006',
				objYaw = 90.0,
				objCoords = vector3(443.42, -992.42, 30.69)
			}
		}
	},

	{
		textCoords = vector3(446.13, -986.5, 26.67),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = -270.0,
				objCoords = vector3(446.62, -985.79, 26.67)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 270.0,
				objCoords = vector3(446.6, -987.07, 26.67)
			}
		}
	},

	{
		textCoords = vector3(439.15, -979.55, 26.67),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor003',
				objYaw = 180.0,
				objCoords = vector3(439.15, -980.02, 26.67)
			}
		}
	},

	{
		textCoords = vector3(480.06, -998.21, 24.91),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_gtdoor',
				objYaw = -180.0,
				objCoords = vector3(480.06, -998.21, 24.91)
			}
		}
	},

	{
		textCoords = vector3(477.12, -998.28, 24.91),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_gtdoor',
				objYaw = -180.0,
				objCoords = vector3(477.12, -998.28, 24.91)
			}
		}
	},

	{
		textCoords = vector3(474.21, -998.32, 24.91),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_gtdoor',
				objYaw = -180.0,
				objCoords = vector3(474.21, -998.32, 24.91)
			}
		}
	},

	{
		textCoords = vector3(471.42, -998.35, 24.91),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_gtdoor',
				objYaw = -180.0,
				objCoords = vector3(471.42, -998.35, 24.91)
			}
		}
	},

	{
		textCoords = vector3(468.46, -998.36, 24.91),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_gtdoor',
				objYaw = -180.0,
				objCoords = vector3(468.46, -998.36, 24.91)
			}
		}
	},

	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = vector3(467.56, -1003.99, 24.91),
		textCoords = vector3(467.56, -1003.99, 24.91),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 0.2
	},


	--
	-- Mission Row Back
	--
	{
		textCoords = vector3(465.13, -990.01, 24.91),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 90.0,
				objCoords = vector3(465.11, -989.45, 24.91)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = -90.0,
				objCoords = vector3(465.11, -990.79, 24.91)
			}
		}
	},

	{
		textCoords = vector3(452.1, -984.43, 26.67),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 180.0,
				objCoords = vector3(451.57, -984.34, 26.67)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 0.0,
				objCoords = vector3(452.8, -984.38, 26.67)
			}
		}
	},

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 0.0,
				objCoords  = vector3(467.3, -1014.4, 26.5)
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = 180.0,
				objCoords  = vector3(469.9, -1014.4, 26.5)
			}
		}
	},

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objYaw = 90.0,
		objCoords  = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objName = 'v_ilev_shrfdoor',
		objYaw = 30.0,
		objCoords  = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = { 'police' },
		locked = false
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_shrf2door',
				objYaw = -45.0,
				objCoords  = vector3(-443.1, 6015.6, 31.7),
			},

			{
				objName = 'v_ilev_shrf2door',
				objYaw = 135.0,
				objCoords  = vector3(-443.9, 6016.6, 31.7)
			}
		}
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	--{
	--	objName = 'v_ilev_ra_door4l',
	--	objCoords  = vector3(1395.92000, 1142.90400, 114.79020),
	--	textCoords = vector3(1396.39, 1141.78, 114.33),
	--	authorizedJobs = { 'police' },
	--	locked = false,
	--	distance = 12,
	--	size = 2
	--},
	
	-- Entrance Gate (Mission Row mod) https://www.gta5-mods.com/maps/mission-row-pd-ymap-fivem-v1
	{
		objName = 'prop_gate_airport_01',
		objCoords  = vector3(414.1908, -1020.388, 28.22055),
		textCoords = vector3(414.55, -1024.15, 29.21),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	},

-- Asosiasi Fisherman
{
	objName = 'v_ilev_mm_doorson',
	objCoords  = vector3(-806.13, 173.65, 76.74),
	textCoords = vector3(-806.13, 173.65, 76.74),
	authorizedJobs = { 'mafia' },
	locked = true,
	distance = 14,
	size = 0.2
},

-- Asosiasi Butcher
{
	objName = 'v_ilev_trev_doorfront',
	objCoords  = vector3(-1149.97, -1521.77, 10.63),
	textCoords = vector3(-1149.97, -1521.77, 10.63),
	authorizedJobs = { 'cartel' },
	locked = true,
	distance = 14,
	size = 0.2
},

-- Bank Principal
	{
		objName = 'hei_v_ilev_bk_gate2_pris',
		objCoords  = vector3(261.99899291992, 221.50576782227, 106.68346405029),
		textCoords = vector3(261.99899291992, 221.50576782227, 107.68346405029),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'hei_v_ilev_bk_gate2_pris',
		objCoords  = vector3(256.93, 220.48, 106.29),
		textCoords = vector3(256.93, 220.48, 106.29),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

-- Ruang Oplas
	{
		textCoords = vector3(348.84, -587.55, 43.28),
		authorizedJobs = { 'ambulance' },
		locked = true,
		distance = 2.5,
		size = 0.5,
		doors = {
			{
				objName = 'gabz_pillbox_doubledoor_l',
				objYaw = -20.0,
				objCoords = vector3(348.81, -587.1, 43.28)
			},

			{
				objName = 'gabz_pillbox_doubledoor_r',
				objYaw = -20.0,
				objCoords = vector3(3481, -587.58, 43.28)
			}
		}
	},

-- Receptionist
	{
		objName = 'gabz_pillbox_singledoor',
		objCoords  = vector3(313.7, -596.24, 43.28),
		textCoords = vector3(313.7, -596.24, 43.28),
		authorizedJobs = { 'ambulance' },
		locked = true,
		distance = 2.5,
		size = 0.5
	},

-- Staff
	{
		objName = 'gabz_pillbox_singledoor',
		objCoords  = vector3(308.58, -597.04, 43.28),
		textCoords = vector3(308.58, -597.04, 43.28),
		authorizedJobs = { 'ambulance' },
		locked = true,
		distance = 2.5,
		size = 0.5
	},

-- Laboratory
	{
		objName = 'gabz_pillbox_singledoor',
		objCoords  = vector3(307.66, -570.27, 43.28),
		textCoords = vector3(307.66, -570.27, 43.28),
		authorizedJobs = { 'ambulance' },
		locked = true,
		distance = 2.5,
		size = 0.5
	},

	{
		objName = 'v_ilev_ra_door2',
		objCoords  = vector3(-629.02, 229.51, 81.81),
		textCoords = vector3(-629.17, 229.51, 81.88),
		authorizedJobs = { 'pedagang' },
		locked = true,
		distance = 2.5,
		size = 0.5
	},
	
}