return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	["accu"] = {
		label = "Batre Aki",
		weight = 1,
		stack = true,
		close = true,
	},

	["alcohol"] = {
		label = "Alkohol",
		weight = 0,
		stack = true,
		close = true,
	},

	["alive_chicken"] = {
		label = "Ayam Hidup",
		weight = 1,
		stack = true,
		close = true,
	},

	["alumunium"] = {
		label = "Alumunium",
		weight = 0,
		stack = true,
		close = true,
	},

	["antibiotics"] = {
		label = "Antibiotik",
		weight = 0,
		stack = true,
		close = true,
	},

	["bait"] = {
		label = "Cacing",
		weight = 1,
		stack = true,
		close = true,
	},

	["betadine"] = {
		label = "Obat Betadine",
		weight = 1,
		stack = true,
		close = true,
	},

	["blackmoney"] = {
		label = "Uang Kotor",
		weight = 1,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Las",
		weight = 1,
		stack = true,
		close = true,
	},

	["botol"] = {
		label = "Botol",
		weight = 0,
		stack = true,
		close = true,
	},

	["bread"] = {
		label = "Roti",
		weight = 1,
		stack = true,
		close = true,
	},

	["bubuk_arang"] = {
		label = "Bubuk Arang",
		weight = 1,
		stack = true,
		close = true,
	},

	["bullet"] = {
		label = "Peluru",
		weight = 1,
		stack = true,
		close = true,
	},

	["bullet_box"] = {
		label = "Kotak Peluru",
		weight = 0,
		stack = true,
		close = true,
	},

	["bullet_casing"] = {
		label = "Slongsong Peluru",
		weight = 1,
		stack = true,
		close = true,
	},

	["carbon_fiber"] = {
		label = "Carbon Fiber",
		weight = 0,
		stack = true,
		close = true,
	},

	["carokit"] = {
		label = "Dempul Mobil",
		weight = 1,
		stack = true,
		close = true,
	},

	["carotool"] = {
		label = "Perkakas",
		weight = 1,
		stack = true,
		close = true,
	},

	["charcoal"] = {
		label = "Arang",
		weight = 0,
		stack = true,
		close = true,
	},

	["clip"] = {
		label = "Ammo",
		weight = 1,
		stack = true,
		close = true,
	},

	["clothe"] = {
		label = "Baju",
		weight = 1,
		stack = true,
		close = true,
	},

	["coal"] = {
		label = "Batu Bara",
		weight = 1,
		stack = true,
		close = true,
	},

	["copper"] = {
		label = "Tembaga",
		weight = 1,
		stack = true,
		close = true,
	},

	["cotton"] = {
		label = "Kapas",
		weight = 0,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Kayu Potong",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Berlian",
		weight = 1,
		stack = true,
		close = true,
	},

	["driver"] = {
		label = "SIM",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Kain",
		weight = 1,
		stack = true,
		close = true,
	},

	["fish"] = {
		label = "Ikan",
		weight = 1,
		stack = true,
		close = true,
	},

	["fishbait"] = {
		label = "Ikan Palsu",
		weight = 1,
		stack = true,
		close = true,
	},

	["fishingrod"] = {
		label = "Joran Pancing",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixkit"] = {
		label = "Alat Perbaikan",
		weight = 1,
		stack = true,
		close = true,
	},

	["fixtool"] = {
		label = "Peralatan Perbaikan",
		weight = 1,
		stack = true,
		close = true,
	},

	["gauze"] = {
		label = "Kain Kasa",
		weight = 0,
		stack = true,
		close = true,
	},

	["gazbottle"] = {
		label = "Botol Gas",
		weight = 1,
		stack = true,
		close = true,
	},

	["getah_karet"] = {
		label = "Getah Karet",
		weight = 0,
		stack = true,
		close = true,
	},

	["glue"] = {
		label = "Lem",
		weight = 0,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Emas",
		weight = 1,
		stack = true,
		close = true,
	},

	["gps"] = {
		label = "Peta",
		weight = 1,
		stack = true,
		close = true,
	},

	["gunpowder"] = {
		label = "Bubuk Misiu",
		weight = 1,
		stack = true,
		close = true,
	},

	["hands_glove"] = {
		label = "Sarung Tangan",
		weight = 0,
		stack = true,
		close = true,
	},

	["HeavyArmor"] = {
		label = "Heavy Body Armor",
		weight = 1,
		stack = true,
		close = true,
	},

	["iron"] = {
		label = "Besi",
		weight = 1,
		stack = true,
		close = true,
	},

	["kanebo"] = {
		label = "Kanebo",
		weight = 0,
		stack = true,
		close = true,
	},

	["kertas_bungkus"] = {
		label = "Kertas Bungkus",
		weight = 0,
		stack = true,
		close = true,
	},

	["ktp"] = {
		label = "KTP",
		weight = 1,
		stack = true,
		close = true,
	},

	["meat"] = {
		label = "Daging Mentah",
		weight = 1,
		stack = true,
		close = true,
	},

	["medikit"] = {
		label = "Kotak P3K",
		weight = 1,
		stack = true,
		close = true,
	},

	["meth_processing"] = {
		label = "Lisensi Farmasi",
		weight = 1,
		stack = true,
		close = true,
	},

	["oil"] = {
		label = "Oli",
		weight = 0,
		stack = true,
		close = true,
	},

	["packaged_chicken"] = {
		label = "Ayam Siap Jual",
		weight = 1,
		stack = true,
		close = true,
	},

	["packaged_plank"] = {
		label = "Papan Kayu",
		weight = 1,
		stack = true,
		close = true,
	},

	["papper"] = {
		label = "Kertas",
		weight = 0,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Minyak Mentah",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol_raffin"] = {
		label = "Minyak Bersih",
		weight = 1,
		stack = true,
		close = true,
	},

	["plastik"] = {
		label = "Plastik",
		weight = 0,
		stack = true,
		close = true,
	},

	["potassium_nitrate"] = {
		label = "Kalium Nitrat",
		weight = 0,
		stack = true,
		close = true,
	},

	["repairkit"] = {
		label = "Alat - alat",
		weight = 1,
		stack = true,
		close = true,
	},

	["rubber"] = {
		label = "Karet",
		weight = 0,
		stack = true,
		close = true,
	},

	["screwdriver"] = {
		label = "Obeng",
		weight = 0,
		stack = true,
		close = true,
	},

	["selongsong"] = {
		label = "Selongsong",
		weight = 0,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "Ayam Potong",
		weight = 1,
		stack = true,
		close = true,
	},

	["stainless_steel"] = {
		label = "Stainless Steel",
		weight = 1,
		stack = true,
		close = true,
	},

	["sterile_gloves"] = {
		label = "Sarung Tangan Steril",
		weight = 0,
		stack = true,
		close = true,
	},

	["stone"] = {
		label = "Batu",
		weight = 1,
		stack = true,
		close = true,
	},

	["sulfur"] = {
		label = "Belerang",
		weight = 0,
		stack = true,
		close = true,
	},

	["tuna"] = {
		label = "Tuna",
		weight = 1,
		stack = true,
		close = true,
	},

	["washed_stone"] = {
		label = "Batu Bersih",
		weight = 1,
		stack = true,
		close = true,
	},

	["weapon"] = {
		label = "Lisensi Senjata",
		weight = 1,
		stack = true,
		close = true,
	},

	["weed_processing"] = {
		label = "Lisensi Narkoba",
		weight = 1,
		stack = true,
		close = true,
	},

	["wood"] = {
		label = "Kayu",
		weight = 1,
		stack = true,
		close = true,
	},

	["wool"] = {
		label = "Benang Rajut",
		weight = 1,
		stack = true,
		close = true,
	},

	["workshop_key"] = {
		label = "Kunci Bengkel",
		weight = 0,
		stack = true,
		close = true,
	},

	["zetony"] = {
		label = "Coin",
		weight = 0,
		stack = true,
		close = true,
	},

	["essence"] = {
		label = "Gas",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
	},
}