Config = {}
Config.Locale = 'en'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = {'police', 'offpolice'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_door01'), objHeading = 270.0, objCoords = vector3(434.7, -980.6, 30.8)},
			{objHash = GetHashKey('v_ilev_ph_door002'), objHeading = 270.0, objCoords = vector3(434.7, -983.2, 30.8)}
		}
	},

	-- To locker room & roof
	{
		objHash = GetHashKey('v_ilev_ph_gendoor004'),
		objHeading = 90.0,
		objCoords = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Rooftop
	{
		objHash = GetHashKey('v_ilev_gtdoor02'),
		objHeading = 90.0,
		objCoords = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Hallway to roof
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 90.0,
		objCoords = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Armory
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 270.0,
		objCoords = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Captain Office
	{
		objHash = GetHashKey('v_ilev_ph_gendoor002'),
		objHeading = 180.0,
		objCoords = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 180.0, objCoords = vector3(443.9, -989.0, 30.6)},
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 0.0, objCoords = vector3(445.3, -988.7, 30.6)}
		}
	},

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 0.0,
		objCoords = vector3(463.8, -992.6, 24.9),
		textCoords = vector3(463.3, -992.6, 25.1),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 1
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 270.0,
		objCoords = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 2
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 3
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 4
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = -90.0,
		objCoords  = vector3(471.26,-994.47,24.94),
		textCoords = vector3(471.26,-994.47,24.94),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 5
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = -90.0,
		objCoords  = vector3(471.21,-998.38,24.92),
		textCoords = vector3(471.21,-998.38,24.92),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 6
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords  = vector3(471.32,-1002.08,24.91),
		textCoords = vector3(471.32,-1002.08,24.91),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Police front gate
	{
		objHash = GetHashKey('prop_Gate_military_01'),
		objHeading = -90.0,
		objCoords  = vector3(419.01,-1021.28,29.02),
		textCoords = vector3(419.01,-1021.28,29.02),
		authorizedJobs = {'police', 'offpolice'},
		locked = false,
		maxDistance = 1.25
	},

	-- To Back
	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 0.0, objCoords  = vector3(467.3, -1014.4, 26.5)},
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 180.0, objCoords  = vector3(469.9, -1014.4, 26.5)}
		}
	},

	-- Back Gate
	{
		objHash = GetHashKey('hei_prop_station_gate'),
		objHeading = 90.0,
		objCoords = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objHash = GetHashKey('v_ilev_shrfdoor'),
		objHeading = 30.0,
		objCoords = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = false,
		maxDistance = 1.25
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 315.0, objCoords  = vector3(-443.1, 6015.6, 31.7)},
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 135.0, objCoords  = vector3(-443.9, 6016.6, 31.7)}
		}
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	--PINTU OPERASI PILLBOX EMS

	-- Pillbox Medical Center
	{
		textCoords = vector3(348.56, -587.38, 44.28),
		authorizedJobs = { 'ambulance', 'offambulance'},
		maxDistance = 2.0,
		size = 2,
		doors = {
			{
				objHash = GetHashKey('gabz_pillbox_doubledoor_l'),
				objHeading = 250.0,
				objCoords  = vector3(349.134, -586.8831, 43.28402)
			},

			{
				objHash = GetHashKey('gabz_pillbox_doubledoor_r'),
				objHeading = -110.0,
				objCoords  = vector3(348.6142, -588.1655, 43.28402)
			}
		}
	},

	{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objCoords = vector3(308.5733, -597.5756, 43.28403),
		textCoords = vector3(308.5733, -597.5756, 43.28403),
		authorizedJobs = { 'ambulance', 'offambulance'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objCoords = vector3(340.1134, -586.6057, 44.28398),
		textCoords = vector3(340.1134, -586.6057, 44.28398),
		authorizedJobs = { 'ambulance', 'offambulance'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objCoords = vector3(360.9867, -589.8188, 44.28403),
		textCoords = vector3(360.9867, -589.8188, 44.28403),
		authorizedJobs = { 'ambulance', 'offambulance'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	{
		textCoords = vector3(313.35, -571.63, 44.29),
		authorizedJobs = { 'ambulance', 'offambulance'},
		maxDistance = 2.0,
		size = 2,
		doors = {
			{
				objHash = GetHashKey('gabz_pillbox_doubledoor_l'),
				objHeading = -20.0,
				objCoords  = vector3(312.7201, -571.6296, 43.28402)
			},

			{
				objHash = GetHashKey('gabz_pillbox_doubledoor_r'),
				objHeading = -20.0,
				objCoords  = vector3(313.8816, -571.9534, 43.28402)
			}
		}
	},

	{
		textCoords = vector3(326.55, -579.42, 43.28),
		authorizedJobs = { 'ambulance', 'offambulance'},
		maxDistance = 2.0,
		size = 2,
		doors = {
			{
				objHash = GetHashKey('gabz_pillbox_doubledoor_l'),
				objHeading = 250.0,
				objCoords  = vector3(326.54, -578.91, 43.28402)
			},

			{
				objHash = GetHashKey('gabz_pillbox_doubledoor_r'),
				objHeading = 250.0,
				objCoords  = vector3(326.54, -580.04, 43.28402)
			}
		}
	},

	{
		textCoords = vector3(325.55, -589.02, 43.28),
		authorizedJobs = { 'ambulance', 'offambulance'},
		maxDistance = 2.0,
		size = 2,
		doors = {
			{
				objHash = GetHashKey('gabz_pillbox_doubledoor_l'),
				objHeading = -20.0,
				objCoords  = vector3(324.91, -589.02, 43.28)
			},

			{
				objHash = GetHashKey('gabz_pillbox_doubledoor_r'),
				objHeading = -20.0,
				objCoords  = vector3(326.16, -589.02, 43.28)
			}
		}
	},

	{
		textCoords = vector3(319.2, -573.24, 44.29),
		authorizedJobs = { 'ambulance', 'offambulance'},
		maxDistance = 2.0,
		size = 2,
		doors = {
			{
				objHash = GetHashKey('gabz_pillbox_doubledoor_l'),
				objHeading = -20.0,
				objCoords  = vector3(318.4946, -573.7322, 43.28399)
			},

			{
				objHash = GetHashKey('gabz_pillbox_doubledoor_r'),
				objHeading = -20.0,
				objCoords  = vector3(319.6151, -574.2166, 43.28405)
			}
		}
	},

	{
		textCoords = vector3(324.44, -575.64, 44.29),
		authorizedJobs = { 'ambulance', 'offambulance'},
		maxDistance = 2.0,
		size = 2,
		locked = true,
		doors = {
			{
				objHash = GetHashKey('gabz_pillbox_doubledoor_l'),
				objHeading = -20.0,
				objCoords  = vector3(323.8446, -575.741, 43.284)
			},

			{
				objHash = GetHashKey('gabz_pillbox_doubledoor_r'),
				objHeading = -20.0,
				objCoords  = vector3(325.0642, -576.1204, 43.284)
			}
		}
	},

	
}