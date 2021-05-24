Config               = {}

Config.RestrictLicenseShopAcces = true
Config.DrawDistance  = 100
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 0, g = 128, b = 255 }
Config.Type          = 1

Config.Locale        = 'en'

Config.AllowedJobs = {
	Mafia4 = {name = 'mafia', grade = 4},
	Biker4 = {name = 'biker', grade = 4},
	Gang4 = {name = 'gang', grade = 4},
	Cartel4 = {name = 'cartel', grade = 4},
	Theb4 = {name = 'theb', grade = 4}
}

Config.Zones = {

	BlackWeashop = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(2567.67, 294.15, 108.73)
		}
	}
}

Config.RealWeapons = {

	{name = 'WEAPON_NIGHTSTICK', 			bone = 58271, x = -0.20, y = 0.1,  z = -0.10, xRot = -55.0,  yRot = 90.00, zRot = 5.0, category = 'melee', 		model = 'w_me_nightstick'},
	{name = 'WEAPON_HAMMER', 				bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 265.0, zRot = 0.0, category = 'melee', 		model = 'prop_tool_hammer'},
	{name = 'WEAPON_BAT', 				bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 265.0, zRot = 0.0, 		category = 'melee', 		model = 'w_me_bat'},
	{name = 'WEAPON_KNIFE', 				bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 265.0, zRot = 0.0, 		category = 'melee', 		model = 'prop_w_me_knife_01'},
	{name = 'WEAPON_GOLFCLUB', 			bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 265.0, zRot = 0.0, category = 'melee', 		model = 'w_me_gclub'},
	{name = 'WEAPON_HATCHET', 				bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 265.0, zRot = 0.0, category = 'melee', 		model = 'w_me_hatchet'},
	{name = 'WEAPON_MACHETE', 				bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 265.0, zRot = 0.0, 		category = 'melee', 		model = 'prop_ld_w_me_machette'},

	{name = 'WEAPON_PISTOL', 			bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_pistol'},
	{name = 'WEAPON_COMBATPISTOL', 		bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_combatpistol'},
	{name = 'WEAPON_APPISTOL', 			bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_appistol'},
	{name = 'WEAPON_PISTOL50', 			bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_pistol50'},
	{name = 'WEAPON_VINTAGEPISTOL', 	bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_vintage_pistol'},
	{name = 'WEAPON_HEAVYPISTOL', 		bone = 51826, x = -0.01, y = 0.10, z = 0.07,  xRot = -115.0, yRot = 0.0,  zRot = 0.0, category = 'handguns', 	model = 'w_pi_heavypistol'},
	{name = 'WEAPON_SNSPISTOL', 		bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = 'w_pi_sns_pistol'},
	{name = 'WEAPON_FLAREGUN', 			bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = 'w_pi_flaregun'},
	{name = 'WEAPON_MARKSMANPISTOL', 	bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = ''},
	{name = 'WEAPON_REVOLVER', 			bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = ''},
	{name = 'WEAPON_STUNGUN', 			bone = 58271, x = -0.01, y = 0.1,  z = -0.07, xRot = -55.0,  yRot = 0.10, zRot = 0.0, category = 'handguns', 	model = 'w_pi_stungun'},

	{name = 'WEAPON_SMGMk2', 			bone = 24818, x = 0.10,    y = -0.15, 	z = 0.0,     xRot = 10.0, yRot = 50.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_smgmk2'},
	{name = 'WEAPON_SMG', 				bone = 24818, x = 0.10,    y = -0.15, 	z = 0.0,     xRot = 10.0, yRot = 50.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_smg'},
	{name = 'WEAPON_MG', 				bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_mg_mg'},
	{name = 'WEAPON_COMBATMG', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_mg_combatmg'},
	{name = 'WEAPON_GUSENBERG', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_gusenberg'},
	{name = 'WEAPON_COMBATPDW', 		bone = 24818, x = 0.10,    y = -0.15, 	z = 0.0,     xRot = 10.0, yRot = 50.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_pdw'},
	{name = 'WEAPON_ASSAULTSMG', 		bone = 24818, x = 0.10,    y = -0.15, 	z = 0.0,     xRot = 10.0, yRot = 50.0, zRot = 0.0, category = 'machine', 	model = 'w_sb_assaultsmg'},
	{name = 'WEAPON_MINISMG', 			bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'machine', 	model = 'wb_sb_minismg'},

	{name = 'WEAPON_ASSAULTRIFLE', 		bone = 24818, x = 0.10,    y = -0.15, 	z = 0.0,     xRot = 10.0, yRot = 50.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_assaultrifle'},
	{name = 'WEAPON_CARBINERIFLE', 		bone = 24818, x = 0.15,    y = -0.15, 	z = 0.0,     xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_carbinerifle'},
	{name = 'WEAPON_CARBINERIFLE_Mk2', 	bone = 24818, x = 0.15,    y = -0.15, 	z = 0.0,     xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_carbineriflemk2'},
	{name = 'WEAPON_ADVANCEDRIFLE', 	bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_advancedrifle'},
	{name = 'WEAPON_SPECIALCARBINE', 	bone = 24818, x = 0.10, y = -0.15,     z = 0.0,     xRot = 0.0, yRot = 50.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_specialcarbine'},
	{name = 'WEAPON_BULLPUPRIFLE', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_bullpuprifle'},
	{name = 'WEAPON_COMPACTRIFLE', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'assault', 	model = 'wr_ar_compact'},
	{name = 'WEAPON_SPECIALCARBINE_Mk2', bone = 24818, x = 0.10, y = -0.15,     z = 0.0,     xRot = 0.0, yRot = 50.0, zRot = 0.0, category = 'assault', 	model = 'w_ar_specialcarbinemk2'},


	{name = 'WEAPON_PUMPSHOTGUN', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_pumpshotgun'},
	{name = 'WEAPON_BULLPUPSHOTGUN', 	bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_bullpupshotgun'},
	{name = 'WEAPON_ASSAULTSHOTGUN', 	bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_assaultshotgun'},
	{name = 'WEAPON_MUSKET', 			bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'shotgun', 	model = 'w_ar_musket'},
	{name = 'WEAPON_HEAVYSHOTGUN', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 225.0, zRot = 0.0, category = 'shotgun', 	model = 'w_sg_heavyshotgun'},

	{name = 'WEAPON_SNIPERRIFLE', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_sniperrifle'},
	{name = 'WEAPON_HEAVYSNIPER', 		bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_heavysniper'},
	{name = 'WEAPON_MARKSMANRIFLE', 	bone = 24818, x = 0.1, y = -0.15, z = 0.0, xRot = 0.0, yRot = 135.0, zRot = 0.0, category = 'sniper', 	model = 'w_sr_marksmanrifle'},

	{name = 'WEAPON_FIREEXTINGUISHER', 	bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_am_fire_exting'},
	{name = 'WEAPON_PETROLCAN', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'thrown', 	model = 'w_am_jerrycan'},

	{name = 'WEAPON_HANDCUFFS', 		bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0, category = 'others', 	model = ''}
}
