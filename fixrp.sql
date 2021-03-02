-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for skuadcity
CREATE DATABASE IF NOT EXISTS `skuadcity` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `skuadcity`;

-- Dumping structure for table skuadcity.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.addon_account: ~12 rows (approximately)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Bank Savings', 0),
	('caution', 'Caution', 0),
	('property_black_money', 'Argent Sale Property', 0),
	('society_ambulance', 'Ambulance', 1),
	('society_banker', 'Banker', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_mafia', 'Mafia', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_realestateagent', 'Agent', 1),
	('society_rebel', 'Rebel', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumping structure for table skuadcity.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.addon_account_data: ~9 rows (approximately)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` (`account_name`, `money`, `owner`) VALUES
	('society_cardealer', 0, NULL),
	('society_police', 0, NULL),
	('society_ambulance', 0, NULL),
	('society_mechanic', 0, NULL),
	('society_taxi', 0, NULL),
	('society_realestateagent', 0, NULL),
	('society_banker', 0, NULL),
	('society_mafia', 0, NULL),
	('society_rebel', 0, NULL);
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumping structure for table skuadcity.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.addon_inventory: ~8 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_mafia', 'Mafia', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_rebel', 'Rebel', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumping structure for table skuadcity.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.addon_inventory_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumping structure for table skuadcity.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `sender` varchar(40) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.billing: ~0 rows (approximately)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumping structure for table skuadcity.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.cardealer_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumping structure for table skuadcity.car_parking
CREATE TABLE IF NOT EXISTS `car_parking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` bigint(20) NOT NULL,
  `parking` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table skuadcity.car_parking: ~0 rows (approximately)
/*!40000 ALTER TABLE `car_parking` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_parking` ENABLE KEYS */;

-- Dumping structure for table skuadcity.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_bin NOT NULL DEFAULT 'M',
  `height` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.characters: ~0 rows (approximately)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumping structure for table skuadcity.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.datastore: ~7 rows (approximately)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_mafia', 'Mafia', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_rebel', 'Rebel', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumping structure for table skuadcity.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.datastore_data: ~6 rows (approximately)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT INTO `datastore_data` ( `name`, `owner`, `data`) VALUES
	('society_police', NULL, '{}'),
	('society_ambulance', NULL, '{}'),
	('society_mechanic', NULL, '{}'),
	('society_taxi', NULL, '{}'),
	('society_mafia', NULL, '{}'),
	('society_rebel', NULL, '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumping structure for table skuadcity.dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.dpkeybinds: ~0 rows (approximately)
/*!40000 ALTER TABLE `dpkeybinds` DISABLE KEYS */;
/*!40000 ALTER TABLE `dpkeybinds` ENABLE KEYS */;

-- Dumping structure for table skuadcity.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.fine_types: ~52 rows (approximately)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`label`, `amount`, `category`) VALUES
	('Misuse of a horn', 30, 0),
	('Illegally Crossing a continuous Line', 40, 0),
	('Driving on the wrong side of the road', 250, 0),
	('Illegal U-Turn', 250, 0),
	('Illegally Driving Off-road', 170, 0),
	('Refusing a Lawful Command', 30, 0),
	('Illegally Stopping a Vehicle', 150, 0),
	('Illegal Parking', 70, 0),
	('Failing to Yield to the right', 70, 0),
	('Failure to comply with Vehicle Information', 90, 0),
	('Failing to stop at a Stop Sign ', 105, 0),
	('Failing to stop at a Red Light', 130, 0),
	('Illegal Passing', 100, 0),
	('Driving an illegal Vehicle', 100, 0),
	('Driving without a License', 1500, 0),
	('Hit and Run', 800, 0),
	('Exceeding Speeds Over < 5 mph', 90, 0),
	('Exceeding Speeds Over 5-15 mph', 120, 0),
	('Exceeding Speeds Over 15-30 mph', 180, 0),
	('Exceeding Speeds Over > 30 mph', 300, 0),
	('Impeding traffic flow', 110, 1),
	('Public Intoxication', 90, 1),
	('Disorderly conduct', 90, 1),
	('Obstruction of Justice', 130, 1),
	('Insults towards Civilans', 75, 1),
	('Disrespecting of an LEO', 110, 1),
	('Verbal Threat towards a Civilan', 90, 1),
	('Verbal Threat towards an LEO', 150, 1),
	('Providing False Information', 250, 1),
	('Attempt of Corruption', 1500, 1),
	('Brandishing a weapon in city Limits', 120, 2),
	('Brandishing a Lethal Weapon in city Limits', 300, 2),
	('No Firearms License', 600, 2),
	('Possession of an Illegal Weapon', 700, 2),
	('Possession of Burglary Tools', 300, 2),
	('Grand Theft Auto', 1800, 2),
	('Intent to Sell/Distrube of an illegal Substance', 1500, 2),
	('Frabrication of an Illegal Substance', 1500, 2),
	('Possession of an Illegal Substance ', 650, 2),
	('Kidnapping of a Civilan', 1500, 2),
	('Kidnapping of an LEO', 2000, 2),
	('Robbery', 650, 2),
	('Armed Robbery of a Store', 650, 2),
	('Armed Robbery of a Bank', 1500, 2),
	('Assault on a Civilian', 2000, 3),
	('Assault of an LEO', 2500, 3),
	('Attempt of Murder of a Civilian', 3000, 3),
	('Attempt of Murder of an LEO', 5000, 3),
	('Murder of a Civilian', 10000, 3),
	('Murder of an LEO', 30000, 3),
	('Involuntary manslaughter', 1800, 3),
	('Fraud', 2000, 2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table skuadcity.fine_types_mafia
CREATE TABLE IF NOT EXISTS `fine_types_mafia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Dumping data for table skuadcity.fine_types_mafia: ~7 rows (approximately)
/*!40000 ALTER TABLE `fine_types_mafia` DISABLE KEYS */;
INSERT INTO `fine_types_mafia` (`label`, `amount`, `category`) VALUES
	('Raket', 3000, 0),
	('Raket', 5000, 0),
	('Raket', 10000, 1),
	('Raket', 20000, 1),
	('Raket', 50000, 2),
	('Raket', 150000, 3),
	('Raket', 350000, 3);
/*!40000 ALTER TABLE `fine_types_mafia` ENABLE KEYS */;

-- Dumping structure for table skuadcity.fine_types_rebel
CREATE TABLE IF NOT EXISTS `fine_types_rebel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Dumping data for table skuadcity.fine_types_rebel: ~7 rows (approximately)
/*!40000 ALTER TABLE `fine_types_rebel` DISABLE KEYS */;
INSERT INTO `fine_types_rebel` (`label`, `amount`, `category`) VALUES
	('Raket', 3000, 0),
	('Raket', 5000, 0),
	('Raket', 10000, 1),
	('Raket', 20000, 1),
	('Raket', 50000, 2),
	('Raket', 150000, 3),
	('Raket', 350000, 3);
/*!40000 ALTER TABLE `fine_types_rebel` ENABLE KEYS */;

-- Dumping structure for table skuadcity.glovebox_inventory
CREATE TABLE IF NOT EXISTS `glovebox_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table skuadcity.glovebox_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `glovebox_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `glovebox_inventory` ENABLE KEYS */;

-- Dumping structure for table skuadcity.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `limit` int(11) NOT NULL DEFAULT 30,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.items: ~46 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`) VALUES
	('HeavyArmor', 'Heavy Body Armor', 1, 3, 0, 1),
	('MedArmor', 'Medium Body Armor', 1, 3, 0, 1),
	('SmallArmor', 'Light Body Armor', 1, 3, 0, 1),
	('alive_chicken', 'Live Chicken', 5, 100, 0, 1),
	('arAmmo', 'Assault Rifle Ammo Box', 1, 5, 0, 1),
	('bandage', 'Bandage', 2, 30, 0, 1),
	('beer', 'Beer', 1, 25, 0, 1),
	('blowpipe', 'Torches', 2, 10, 0, 1),
	('bread', 'Bread', 1, 30, 0, 1),
	('cannabis', 'Cannabis', 3, 99, 0, 1),
	('carokit', 'Body Kit', 3, 10, 0, 1),
	('carotool', 'Bodywork Tools', 2, 10, 0, 1),
	('clothe', 'Cloth', 1, 100, 0, 1),
	('copper', 'Copper', 1, 100, 0, 1),
	('cutted_wood', 'Cut Wood', 1, 100, 0, 1),
	('diamond', 'Diamond', 1, 100, 0, 1),
	('essence', 'Gasoline', 1, 100, 0, 1),
	('fabric', 'Tissue', 1, 100, 0, 1),
	('fish', 'Fish', 1, 100, 0, 1),
	('fixkit', 'Repair Kit', 3, 10, 0, 1),
	('fixtool', 'Repair Tools', 2, 10, 0, 1),
	('flashlight', 'Lampe', 1, -1, 0, 1),
	('gazbottle', 'Gas Cylinder', 2, 25, 0, 1),
	('gold', 'Gold', 1, 100, 0, 1),
	('grip', 'Poignée', 1, -1, 0, 1),
	('iron', 'Iron', 1, 100, 0, 1),
	('marijuana', 'Marijuana', 5, 100, 0, 1),
	('medikit', 'Medikit', 2, 25, 0, 1),
	('mgAmmo', 'Maching Gun Ammo Box', 1, 5, 0, 1),
	('pAmmo', 'Pistol Ammo Box', 1, 5, 0, 1),
	('packaged_chicken', 'Chicken in a Tray', 1, 100, 0, 1),
	('packaged_plank', 'Pack of Boards', 1, 100, 0, 1),
	('parkingcard', 'Parking Card', 1, -1, 0, 1),
	('petrol', 'Oil', 1, 100, 0, 1),
	('petrol_raffin', 'Refined Petroleum', 1, 100, 0, 1),
	('phone', 'Phone', 2, 5, 0, 1),
	('radio', 'Radio', 2, 5, 1, 1),
	('sgAmmo', 'Shotgun Ammo Box', 1, 5, 0, 1),
	('silencieux', 'Silencieux', 1, -1, 0, 1),
	('slaughtered_chicken', 'Slaughtered Chicken', 1, 100, 0, 1),
	('stone', 'Stone', 1, 100, 0, 1),
	('washed_stone', 'Washed Stone', 1, 100, 0, 1),
	('water', 'Water', 1, 40, 0, 1),
	('wood', 'Wood', 1, 100, 0, 1),
	('wool', 'Wool', 1, 100, 0, 1),
	('yusuf', 'Skin de luxe', 1, -1, 0, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table skuadcity.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.jobs: ~25 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 0),
	('banker', 'Banker', 0),
	('cardealer', 'Cardealer', 0),
	('fisherman', 'Fisherman', 0),
	('fueler', 'Refiner', 0),
	('gopostal', 'Correios', 0),
	('lumberjack', 'Lumberjack', 0),
	('mafia', 'Mafia', 1),
	('mechanic', 'Mechanic', 0),
	('miner', 'Miner', 0),
	('offambulance', 'Off-Duty', 1),
	('offmechanic', 'Off-Duty', 1),
	('offpolice', 'Off-Duty', 1),
	('police', 'LSPD', 0),
	('ranger', 'Park Ranger', 0),
	('realestateagent', 'Agent', 0),
	('rebel', 'Rebel', 1),
	('reporter', 'Journalist', 0),
	('slaughterer', 'Feller', 0),
	('tailor', 'Dressmaker', 0),
	('taxi', 'Taxi', 0),
	('textil', 'Couturier', 0),
	('traffic', 'Traffic Officer', 0),
	('trucker', 'Trucker', 0),
	('unemployed', 'Unemployed', 0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table skuadcity.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.job_grades: ~70 rows (approximately)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	('ambulance', 0, 'ambulance', 'Jr. EMT', 25000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	('ambulance', 1, 'doctor', 'EMT', 35000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	('ambulance', 2, 'chief_doctor', 'Sr. EMT', 45000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	('ambulance', 3, 'boss', 'EMT Supervisor', 75000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	('police', 0, 'recruit', 'Recruit', 15000, '{}', '{}'),
	('police', 1, 'officer', 'Officier', 25000, '{}', '{}'),
	('police', 2, 'sergeant', 'Sergent', 35000, '{}', '{}'),
	('police', 3, 'lieutenant', 'Lieutenant', 45000, '{}', '{}'),
	('police', 4, 'boss', 'Commandant', 75000, '{}', '{}'),
	('taxi', 0, 'recrue', 'Recrue', 15000, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi', 1, 'novice', 'Novice', 25000, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi', 2, 'experimente', 'Experienced', 35000, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi', 3, 'uber', 'Uber Cabby', 45000, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi', 4, 'boss', 'Lead Cabby', 75000, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('mechanic', 0, 'recrue', 'Recrue', 15000, '{}', '{}'),
	('mechanic', 1, 'novice', 'Novice', 25000, '{}', '{}'),
	('mechanic', 2, 'experimente', 'Experienced', 35000, '{}', '{}'),
	('mechanic', 3, 'chief', 'Leader', 45000, '{}', '{}'),
	('mechanic', 4, 'boss', 'Boss', 75000, '{}', '{}'),
	('lumberjack', 0, 'employee', 'employee', 30000, '{}', '{}'),
	('fisherman', 0, 'employee', 'employee', 30000, '{}', '{}'),
	('fueler', 0, 'employee', 'employee', 30000, '{}', '{}'),
	('reporter', 0, 'employee', 'employee', 30000, '{}', '{}'),
	('tailor', 0, 'employee', 'employee', 30000, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	('miner', 0, 'employee', 'employee', 30000, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	('slaughterer', 0, 'employee', 'employee', 30000, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	('banker', 0, 'advisor', 'Advisor', 15000, '{}', '{}'),
	('banker', 1, 'banker', 'Banker', 25000, '{}', '{}'),
	('banker', 2, 'business_banker', 'Business Banker', 35000, '{}', '{}'),
	('banker', 3, 'trader', 'Trader', 45000, '{}', '{}'),
	('banker', 4, 'boss', 'Boss', 75000, '{}', '{}'),
	('realestateagent', 0, 'location', 'Location', 25000, '{}', '{}'),
	('realestateagent', 1, 'vendeur', 'Vendeur', 35000, '{}', '{}'),
	('realestateagent', 2, 'gestion', 'Management', 45000, '{}', '{}'),
	('realestateagent', 3, 'boss', 'Boss', 75000, '{}', '{}'),
	('unemployed', 0, 'unemployed', 'Unemployed', 30000, '{}', '{}'),
	('cardealer', 0, 'recruit', 'Recruit', 25000, '{}', '{}'),
	('cardealer', 1, 'novice', 'Novice', 35000, '{}', '{}'),
	('cardealer', 2, 'experienced', 'Experienced', 45000, '{}', '{}'),
	('cardealer', 3, 'boss', 'Boss', 75000, '{}', '{}'),
	('trucker', 0, 'employee', 'Employee', 30000, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	('offpolice', 0, 'recruit', 'Recruit', 0, '{}', '{}'),
	('offpolice', 1, 'officer', 'Officer', 0, '{}', '{}'),
	('offpolice', 2, 'sergeant', 'Sergeant', 0, '{}', '{}'),
	('offpolice', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
	('offpolice', 4, 'boss', 'Boss', 0, '{}', '{}'),
	('offambulance', 0, 'ambulance', 'Ambulance', 0, '{}', '{}'),
	('offambulance', 1, 'doctor', 'Doctor', 0, '{}', '{}'),
	('offambulance', 2, 'chief_doctor', 'Chef', 0, '{}', '{}'),
	('offambulance', 3, 'boss', 'Boss', 0, '{}', '{}'),
	('offmechanic', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	('offmechanic', 1, 'novice', 'Novice', 0, '{}', '{}'),
	('offmechanic', 2, 'experimente', 'Experienced', 0, '{}', '{}'),
	('offmechanic', 3, 'chief', 'Leader', 0, '{}', '{}'),
	('offmechanic', 4, 'boss', 'Boss', 0, '{}', '{}'),
	('traffic', 0, 'employee', 'Valores', 30000, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	('rebel', 0, 'soldato', 'Ptite-Frappe', 25000, '{}', '{}'),
	('rebel', 1, 'capo', 'Capo', 35000, '{}', '{}'),
	('rebel', 2, 'consigliere', 'Consigliere', 45000, '{}', '{}'),
	('rebel', 3, 'boss', 'Parain', 75000, '{}', '{}'),
	('mafia', 0, 'soldato', 'Ptite-Frappe', 25000, '{}', '{}'),
	('mafia', 1, 'capo', 'Capo', 35000, '{}', '{}'),
	('mafia', 2, 'consigliere', 'Consigliere', 45000, '{}', '{}'),
	('mafia', 3, 'boss', 'Parain', 75000, '{}', '{}'),
	('ranger', 0, 'employee', 'Valores', 30000, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	('mafia', 0, 'soldato', 'Ptite-Frappe', 25000, '{}', '{}'),
	('mafia', 1, 'capo', 'Capo', 35000, '{}', '{}'),
	('mafia', 2, 'consigliere', 'Consigliere', 45000, '{}', '{}'),
	('mafia', 3, 'boss', 'Parain', 75000, '{}', '{}'),
	('gopostal', 0, 'employee', 'Sedex', 30000, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumping structure for table skuadcity.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.licenses: ~15 rows (approximately)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('aircraft', 'Aircraft License'),
	('boat', 'Boat License'),
	('boating', 'Boating License'),
	('dmv', 'Traffic Laws'),
	('drive', 'Driver\'s license'),
	('drive_bike', 'Motorcycle Licence'),
	('drive_truck', 'Truck License'),
	('weapon_assault', 'Assault Rifle License'),
	('weapon_handgun', 'Handgun License'),
	('weapon_lmg', 'LMG License'),
	('weapon_melee', 'Melee License'),
	('weapon_shotgun', 'Shotgun License'),
	('weapon_smg', 'SMG License'),
	('weapon_sniper', 'Sniper Rifle License'),
	('weed_processing', 'Weed Processing License');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumping structure for table skuadcity.loginlauncher_users
CREATE TABLE IF NOT EXISTS `loginlauncher_users` (
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) DEFAULT 'DefaultPass',
  `externalip` varchar(50) DEFAULT NULL,
  `IsAdmin` bit(1) DEFAULT b'0',
  `IsAllowed` bit(1) DEFAULT b'0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table skuadcity.loginlauncher_users: ~2 rows (approximately)
/*!40000 ALTER TABLE `loginlauncher_users` DISABLE KEYS */;
INSERT INTO `loginlauncher_users` (`username`, `password`, `externalip`, `IsAdmin`, `IsAllowed`) VALUES
	('admin', '__skuad021', '127.0.0.1', b'1', b'0'),
	('user', 'user', '37.142.32.108', b'0', b'0');
/*!40000 ALTER TABLE `loginlauncher_users` ENABLE KEYS */;

-- Dumping structure for table skuadcity.owned_properties
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.owned_properties: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_properties` ENABLE KEYS */;

-- Dumping structure for table skuadcity.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'civ',
  `category` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL DEFAULT 'Unknown',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.owned_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumping structure for table skuadcity.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table skuadcity.phone_app_chat: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Dumping structure for table skuadcity.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table skuadcity.phone_calls: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Dumping structure for table skuadcity.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table skuadcity.phone_messages: 0 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for table skuadcity.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table skuadcity.phone_users_contacts: 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Dumping structure for table skuadcity.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `entering` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `exit` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `inside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `outside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ipls` varchar(255) COLLATE utf8mb4_bin DEFAULT '[]',
  `gateway` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.properties: ~82 rows (approximately)
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{"y":564.89,"z":182.959,"x":119.384}', '{"x":117.347,"y":559.506,"z":183.304}', '{"y":557.032,"z":183.301,"x":118.037}', '{"y":567.798,"z":182.131,"x":119.249}', '[]', NULL, 1, 1, 0, '{"x":118.748,"y":566.573,"z":175.697}', 1500000),
	(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{"x":372.796,"y":428.327,"z":144.685}', '{"x":373.548,"y":422.982,"z":144.907},', '{"y":420.075,"z":145.904,"x":372.161}', '{"x":372.454,"y":432.886,"z":143.443}', '[]', NULL, 1, 1, 0, '{"x":377.349,"y":429.422,"z":137.3}', 1500000),
	(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{"y":-379.165,"z":37.961,"x":-936.363}', '{"y":-365.476,"z":113.274,"x":-913.097}', '{"y":-367.637,"z":113.274,"x":-918.022}', '{"y":-382.023,"z":37.961,"x":-943.626}', '[]', NULL, 1, 1, 0, '{"x":-927.554,"y":-377.744,"z":112.674}', 1700000),
	(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{"y":440.8,"z":146.702,"x":346.964}', '{"y":437.456,"z":148.394,"x":341.683}', '{"y":435.626,"z":148.394,"x":339.595}', '{"x":350.535,"y":443.329,"z":145.764}', '[]', NULL, 1, 1, 0, '{"x":337.726,"y":436.985,"z":140.77}', 1500000),
	(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{"y":502.696,"z":136.421,"x":-176.003}', '{"y":497.817,"z":136.653,"x":-174.349}', '{"y":495.069,"z":136.666,"x":-173.331}', '{"y":506.412,"z":135.0664,"x":-177.927}', '[]', NULL, 1, 1, 0, '{"x":-174.725,"y":493.095,"z":129.043}', 1500000),
	(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{"y":596.58,"z":142.641,"x":-686.554}', '{"y":591.988,"z":144.392,"x":-681.728}', '{"y":590.608,"z":144.392,"x":-680.124}', '{"y":599.019,"z":142.059,"x":-689.492}', '[]', NULL, 1, 1, 0, '{"x":-680.46,"y":588.6,"z":136.769}', 1500000),
	(7, 'LowEndApartment', 'Appartement de base', '{"y":-1078.735,"z":28.4031,"x":292.528}', '{"y":-1007.152,"z":-102.002,"x":265.845}', '{"y":-1002.802,"z":-100.008,"x":265.307}', '{"y":-1078.669,"z":28.401,"x":296.738}', '[]', NULL, 1, 1, 0, '{"x":265.916,"y":-999.38,"z":-100.008}', 562500),
	(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{"y":454.955,"z":96.462,"x":-1294.433}', '{"x":-1289.917,"y":449.541,"z":96.902}', '{"y":446.322,"z":96.899,"x":-1289.642}', '{"y":455.453,"z":96.517,"x":-1298.851}', '[]', NULL, 1, 1, 0, '{"x":-1287.306,"y":455.901,"z":89.294}', 1500000),
	(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{"x":-853.346,"y":696.678,"z":147.782}', '{"y":690.875,"z":151.86,"x":-859.961}', '{"y":688.361,"z":151.857,"x":-859.395}', '{"y":701.628,"z":147.773,"x":-855.007}', '[]', NULL, 1, 1, 0, '{"x":-858.543,"y":697.514,"z":144.253}', 1500000),
	(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{"y":620.494,"z":141.588,"x":-752.82}', '{"y":618.62,"z":143.153,"x":-759.317}', '{"y":617.629,"z":143.153,"x":-760.789}', '{"y":621.281,"z":141.254,"x":-750.919}', '[]', NULL, 1, 1, 0, '{"x":-762.504,"y":618.992,"z":135.53}', 1500000),
	(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{"y":37.025,"z":42.58,"x":-618.299}', '{"y":58.898,"z":97.2,"x":-603.301}', '{"y":58.941,"z":97.2,"x":-608.741}', '{"y":30.603,"z":42.524,"x":-620.017}', '[]', NULL, 1, 1, 0, '{"x":-622.173,"y":54.585,"z":96.599}', 1700000),
	(12, 'MiltonDrive', 'Milton Drive', '{"x":-775.17,"y":312.01,"z":84.658}', NULL, NULL, '{"x":-775.346,"y":306.776,"z":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
	(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_01_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.661,"y":327.672,"z":210.396}', 1300000),
	(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_01_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.735,"y":326.757,"z":186.313}', 1300000),
	(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_01_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.386,"y":330.782,"z":195.08}', 1300000),
	(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_02_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.615,"y":327.878,"z":210.396}', 1300000),
	(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_02_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.297,"y":327.092,"z":186.313}', 1300000),
	(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_02_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.303,"y":330.932,"z":195.085}', 1300000),
	(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_03_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.885,"y":327.641,"z":210.396}', 1300000),
	(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_03_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.607,"y":327.344,"z":186.313}', 1300000),
	(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_03_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.525,"y":330.851,"z":195.085}', 1300000),
	(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_04_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.527,"y":327.89,"z":210.396}', 1300000),
	(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_04_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.642,"y":326.497,"z":186.313}', 1300000),
	(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_04_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.503,"y":331.318,"z":195.085}', 1300000),
	(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_05_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.289,"y":328.086,"z":210.396}', 1300000),
	(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_05_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.692,"y":326.762,"z":186.313}', 1300000),
	(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_05_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.094,"y":330.976,"z":195.085}', 1300000),
	(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_06_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.263,"y":328.104,"z":210.396}', 1300000),
	(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_06_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.655,"y":326.611,"z":186.313}', 1300000),
	(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_06_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.3,"y":331.414,"z":195.085}', 1300000),
	(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_07_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.956,"y":328.257,"z":210.396}', 1300000),
	(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_07_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.545,"y":326.659,"z":186.313}', 1300000),
	(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_07_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.087,"y":331.429,"z":195.123}', 1300000),
	(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_08_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.187,"y":328.47,"z":210.396}', 1300000),
	(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_08_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.658,"y":326.563,"z":186.313}', 1300000),
	(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_08_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.287,"y":331.084,"z":195.086}', 1300000),
	(37, 'IntegrityWay', '4 Integrity Way', '{"x":-47.804,"y":-585.867,"z":36.956}', NULL, NULL, '{"x":-54.178,"y":-583.762,"z":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
	(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{"x":-31.409,"y":-594.927,"z":79.03}', '{"x":-26.098,"y":-596.909,"z":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-11.923,"y":-597.083,"z":78.43}', 1700000),
	(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{"x":-17.702,"y":-588.524,"z":89.114}', '{"x":-16.21,"y":-582.569,"z":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-26.327,"y":-588.384,"z":89.123}', 1700000),
	(40, 'DellPerroHeights', 'Dell Perro Heights', '{"x":-1447.06,"y":-538.28,"z":33.74}', NULL, NULL, '{"x":-1440.022,"y":-548.696,"z":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
	(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{"x":-1452.125,"y":-540.591,"z":73.044}', '{"x":-1455.435,"y":-535.79,"z":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1467.058,"y":-527.571,"z":72.443}', 1700000),
	(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{"x":-1451.562,"y":-523.535,"z":55.928}', '{"x":-1456.02,"y":-519.209,"z":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1457.026,"y":-530.219,"z":55.937}', 1700000),
	(43, 'MazeBankBuilding', 'Maze Bank Building', '{"x":-79.18,"y":-795.92,"z":43.35}', NULL, NULL, '{"x":-72.50,"y":-786.92,"z":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
	(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(47, 'ExecutiveRich', 'Executive Rich', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(48, 'ExecutiveCool', 'Executive Cool', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(53, 'LomBank', 'Lom Bank', '{"x":-1581.36,"y":-558.23,"z":34.07}', NULL, NULL, '{"x":-1583.60,"y":-555.12,"z":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
	(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(63, 'MazeBankWest', 'Maze Bank West', '{"x":-1379.58,"y":-499.63,"z":32.22}', NULL, NULL, '{"x":-1378.95,"y":-502.82,"z":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
	(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(73, 'MedEndApartment1', 'Medium Apartment 1', '{"y":3107.56,"z":41.49,"x":240.6}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":3100.77,"z":41.49,"x":240.21}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
	(74, 'MedEndApartment2', 'Medium Apartment 2', '{"y":3169.1,"z":41.81,"x":246.7}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":3163.97,"z":41.82,"x":245.83}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
	(75, 'MedEndApartment3', 'Medium Apartment 3', '{"y":2667.22,"z":39.06,"x":980.38}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":2668.77,"z":39.06,"x":986.38}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
	(76, 'MedEndApartment4', 'Medium Apartment 4', '{"y":3031.08,"z":42.89,"x":195.85}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":3031.39,"z":42.27,"x":200.68}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
	(77, 'MedEndApartment5', 'Medium Apartment 5', '{"y":4642.17,"z":42.88,"x":1724.43}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":4637.34,"z":42.31,"x":1724.27}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
	(78, 'MedEndApartment6', 'Medium Apartment 6', '{"y":4739.73,"z":40.99,"x":1664.98}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":4740.93,"z":41.08,"x":1670.92}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
	(79, 'MedEndApartment7', 'Medium Apartment 7', '{"y":6577.19,"z":31.74,"x":12.57}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6572.61,"z":31.72,"x":16.93}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
	(80, 'MedEndApartment8', 'Medium Apartment 8', '{"y":6190.84,"z":30.73,"x":-374.31}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6186.58,"z":30.52,"x":-372.65}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
	(81, 'MedEndApartment9', 'Medium Apartment 9', '{"y":6597.56,"z":30.86,"x":-27.06}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6601.55,"z":30.44,"x":-30.55}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
	(82, 'MedEndApartment10', 'Medium Apartment 10', '{"y":6340.1,"z":28.84,"x":-367.33}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6336.97,"z":28.84,"x":-371.3}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;

-- Dumping structure for table skuadcity.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.rented_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumping structure for table skuadcity.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table skuadcity.shops: ~15 rows (approximately)
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
	(1, 'TwentyFourSeven', 'beer', 45),
	(2, 'TwentyFourSeven', 'bread', 30),
	(3, 'TwentyFourSeven', 'water', 15),
	(4, 'TwentyFourSeven', 'phone', 1000),
	(5, 'TwentyFourSeven', 'radio', 300),
	(6, 'RobsLiquor', 'beer', 45),
	(7, 'RobsLiquor', 'bread', 30),
	(8, 'RobsLiquor', 'water', 15),
	(9, 'RobsLiquor', 'phone', 1000),
	(10, 'RobsLiquor', 'radio', 300),
	(11, 'LTDgasoline', 'beer', 45),
	(12, 'LTDgasoline', 'bread', 30),
	(13, 'LTDgasoline', 'water', 15),
	(14, 'LTDgasoline', 'phone', 1000),
	(15, 'LTDgasoline', 'radio', 300);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Dumping structure for table skuadcity.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.society_moneywash: ~0 rows (approximately)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumping structure for table skuadcity.trunk_inventory
CREATE TABLE IF NOT EXISTS `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table skuadcity.trunk_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `trunk_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `trunk_inventory` ENABLE KEYS */;

-- Dumping structure for table skuadcity.twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.twitter_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_accounts` ENABLE KEYS */;

-- Dumping structure for table skuadcity.twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.twitter_likes: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_likes` ENABLE KEYS */;

-- Dumping structure for table skuadcity.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.twitter_tweets: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

-- Dumping structure for table skuadcity.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `bank` int(11) DEFAULT NULL,
  `accounts` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT 'user',
  `permission_level` int(11) DEFAULT NULL,
  `inventory` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(20) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_bin DEFAULT '{"x":-256.43,"y":-981.82,"z":31.2,"heading":205.8}',
  `is_dead` tinyint(1) DEFAULT 0,
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastname` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateofbirth` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `phone_number` char(12) COLLATE utf8mb4_bin DEFAULT '0',
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `index_users_phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table skuadcity.user_contacts
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_contacts_identifier_name_number` (`identifier`,`name`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.user_contacts: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contacts` ENABLE KEYS */;

-- Dumping structure for table skuadcity.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.user_licenses: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumping structure for table skuadcity.user_parkings
CREATE TABLE IF NOT EXISTS `user_parkings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table skuadcity.user_parkings: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_parkings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_parkings` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.vehicles: ~240 rows (approximately)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.vehicle_categories: ~11 rows (approximately)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupés'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table skuadcity.vehicle_sold: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_aircrafts
CREATE TABLE IF NOT EXISTS `vs_aircrafts` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_aircrafts: ~27 rows (approximately)
/*!40000 ALTER TABLE `vs_aircrafts` DISABLE KEYS */;
INSERT INTO `vs_aircrafts` (`name`, `model`, `price`, `category`) VALUES
	('Alpha Z1', 'alphaz1', 112100000, 'planes'),
	('Besra', 'besra', 100000000, 'planes'),
	('Buzzard', 'buzzard2', 50000000, 'helis'),
	('Cuban 800', 'cuban800', 24000000, 'planes'),
	('Dodo', 'dodo', 50000000, 'planes'),
	('Duster', 'duster', 175000000, 'planes'),
	('Frogger', 'frogger', 80000000, 'helis'),
	('Havok', 'havok', 25000000, 'helis'),
	('Howard NX25', 'howard', 97500000, 'planes'),
	('Luxor', 'luxor', 150000000, 'planes'),
	('Luxor Deluxe ', 'luxor2', 175000000, 'planes'),
	('Mammatus', 'mammatus', 30000000, 'planes'),
	('Maverick', 'maverick', 75000000, 'helis'),
	('Ultra Light', 'microlight', 50000000, 'planes'),
	('Nimbus', 'nimbus', 90000000, 'planes'),
	('Rogue', 'rogue', 10000000, 'planes'),
	('Sea Breeze', 'seabreeze', 85000000, 'planes'),
	('Sea Sparrow', 'seasparrow', 81500000, 'helis'),
	('Shamal', 'shamal', 11500000, 'planes'),
	('Mallard', 'stunt', 25000000, 'planes'),
	('SuperVolito', 'supervolito', 100000000, 'helis'),
	('SuperVolito Carbon', 'supervolito2', 125000000, 'helis'),
	('Swift', 'swift', 100000000, 'helis'),
	('Swift Deluxe', 'swift2', 125000000, 'helis'),
	('Velum', 'velum2', 45000000, 'planes'),
	('Vestra', 'vestra', 95000000, 'planes'),
	('Volatus', 'volatus', 125000000, 'helis');
/*!40000 ALTER TABLE `vs_aircrafts` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_aircraft_categories
CREATE TABLE IF NOT EXISTS `vs_aircraft_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_aircraft_categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `vs_aircraft_categories` DISABLE KEYS */;
INSERT INTO `vs_aircraft_categories` (`name`, `label`) VALUES
	('helis', 'Helicopters'),
	('planes', 'Planes');
/*!40000 ALTER TABLE `vs_aircraft_categories` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_ambulance
CREATE TABLE IF NOT EXISTS `vs_ambulance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_ambulance: ~9 rows (approximately)
/*!40000 ALTER TABLE `vs_ambulance` DISABLE KEYS */;
INSERT INTO `vs_ambulance` (`id`, `name`, `model`, `price`, `category`) VALUES
	(1, 'Ambulance', 'ambulance', 500, 'ambulance'),
	(2, 'Fire Truck', 'firetruk', 750, 'ambulance'),
	(3, 'Ambulance', 'ambulance', 500, 'doctor'),
	(4, 'Fire Truck', 'firetruk', 750, 'doctor'),
	(5, 'Ambulance', 'ambulance', 500, 'chief_doctor'),
	(6, 'Fire Truck', 'firetruk', 750, 'chief_doctor'),
	(7, 'Ambulance', 'ambulance', 500, 'boss'),
	(8, 'Fire Truck', 'firetruk', 750, 'boss'),
	(9, 'Maverick', 'polmav', 1000, 'boss');
/*!40000 ALTER TABLE `vs_ambulance` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_ambulance_categories
CREATE TABLE IF NOT EXISTS `vs_ambulance_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_ambulance_categories: ~4 rows (approximately)
/*!40000 ALTER TABLE `vs_ambulance_categories` DISABLE KEYS */;
INSERT INTO `vs_ambulance_categories` (`name`, `label`) VALUES
	('ambulance', 'Jr. EMT'),
	('boss', 'EMT Supervisor'),
	('chief_doctor', 'Sr. EMT'),
	('doctor', 'EMT');
/*!40000 ALTER TABLE `vs_ambulance_categories` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_boats
CREATE TABLE IF NOT EXISTS `vs_boats` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_boats: ~16 rows (approximately)
/*!40000 ALTER TABLE `vs_boats` DISABLE KEYS */;
INSERT INTO `vs_boats` (`name`, `model`, `price`, `category`) VALUES
	('Dinghy 4Seat', 'dinghy', 25000, 'boats'),
	('Dinghy 2Seat', 'dinghy2', 20000, 'boats'),
	('Dinghy Yacht', 'dinghy4', 25000, 'boats'),
	('Jetmax', 'jetmax', 30000, 'boats'),
	('Marquis', 'marquis', 45000, 'boats'),
	('Seashark', 'seashark', 10000, 'boats'),
	('Seashark Yacht', 'seashark3', 10000, 'boats'),
	('Speeder', 'speeder', 40000, 'boats'),
	('Squalo', 'squalo', 32000, 'boats'),
	('Submarine', 'submersible', 29000, 'subs'),
	('Kraken', 'submersible2', 31000, 'subs'),
	('Suntrap', 'suntrap', 34000, 'boats'),
	('Toro', 'toro', 38000, 'boats'),
	('Toro Yacht', 'toro2', 38000, 'boats'),
	('Tropic', 'tropic', 27000, 'boats'),
	('Tropic Yacht', 'tropic2', 27000, 'boats');
/*!40000 ALTER TABLE `vs_boats` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_boat_categories
CREATE TABLE IF NOT EXISTS `vs_boat_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_boat_categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `vs_boat_categories` DISABLE KEYS */;
INSERT INTO `vs_boat_categories` (`name`, `label`) VALUES
	('boats', 'Boats'),
	('subs', 'Submersibles');
/*!40000 ALTER TABLE `vs_boat_categories` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_cars
CREATE TABLE IF NOT EXISTS `vs_cars` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(100) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_cars: ~272 rows (approximately)
/*!40000 ALTER TABLE `vs_cars` DISABLE KEYS */;
INSERT INTO `vs_cars` (`name`, `model`, `price`, `category`) VALUES
	('Nissan Skyline GT-R34 1999', '2f2fgtr34', 2147483647, 'donate'),
	('Mitsubishi Lancer Evolution VII 2002', '2f2fmle7', 2147483647, 'donate'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Adder', 'adder', 900000, 'supers'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'supers'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'supers'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroads'),
	('Bifta', 'bifta', 12000, 'offroads'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscles'),
	('Blazer', 'blazer', 6500, 'offroads'),
	('Blazer Sport', 'blazer4', 8500, 'offroads'),
	('blazer5', 'blazer5', 1755600, 'offroads'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMW M5 F90', 'bmci', 5730000, 'importcars'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroads'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscles'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscles'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'supers'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Mercedes-Benz C63', 'c63coupe', 4352000, 'importcars'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'supers'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscles'),
	('Chino Luxe', 'chino2', 19000, 'muscles'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscles'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'supers'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deviant', 'deviant', 2145000, 'importcars'),
	('Diablous S2', 'diablous2', 1354000, 'importmotorcycles'),
	('Dominator', 'dominator', 35000, 'muscles'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroads'),
	('Dukes', 'dukes', 28000, 'muscles'),
	('Dune Buggy', 'dune', 8000, 'offroads'),
	('Elegy', 'elegy', 750000, 'importcars'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity S2', 'entity2', 4421000, 'importcars'),
	('Entity XF', 'entityxf', 425000, 'supers'),
	('Lotus Espirit', 'esprit02', 3245000, 'importcars'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscles'),
	('Faction Rider', 'faction2', 30000, 'muscles'),
	('Faction XL', 'faction3', 40000, 'muscles'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('FCR S2', 'fcr2', 1421000, 'importmotorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('Flash GT', 'flashgt', 1354000, 'importcars'),
	('FMJ', 'fmj', 185000, 'supers'),
	('Mitsubishi Lancer Evolution VII 2002', 'fnflan', 2147483647, 'donate'),
	('Mitsubishi Eclipse GSX 1995', 'fnfmits', 2147483647, 'donate'),
	('Toyota Supra MK IV 1994', 'fnfmk4', 2147483647, 'donate'),
	('Mazda RX-7 VeilSide 1994', 'fnfrx7', 2147483647, 'donate'),
	('Mazda RX-7 1994', 'fnfrx7dom', 2147483647, 'donate'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscles'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroads'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscles'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscles'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscles'),
	('Infernus', 'infernus', 180000, 'supers'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Issi S3', 'issi3', 3458000, 'importcars'),
	('Itali GTB S2', 'italigtb2', 3230000, 'importcars'),
	('Itali GTO', 'italigto', 3320000, 'importcars'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Jester S3', 'jester3', 750000, 'importcars'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroads'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'supers'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Ford Mustang Mach 1', 'mach1', 2245000, 'importcars'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroads'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nero S2', 'nero2', 2421000, 'importcars'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscles'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'supers'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('penetrator', 'penetrator', 1421000, 'importcars'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'supers'),
	('Phoenix', 'phoenix', 12500, 'muscles'),
	('Picador', 'picador', 18000, 'muscles'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'supers'),
	('Radius', 'radi', 29000, 'suvs'),
	('Raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'supers'),
	('Rebel', 'rebel2', 35000, 'offroads'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('Riata', 'riata', 380000, 'offroads'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscles'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscles'),
	('Sabre GT', 'sabregt2', 25000, 'muscles'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroads'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'supers'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Schlagen', 'schlagen', 2325000, 'importcars'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'supers'),
	('Shotaro Concept', 'shotaro', 7800000, 'importmotorcycles'),
	('Lamborghini Sian 2012', 'sian', 2147483647, 'donate'),
	('Nissan Silvia 1997', 'silvias15', 2147483647, 'donate'),
	('Slam Van', 'slamvan3', 11500, 'muscles'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Specter S2', 'specter2', 2354000, 'importcars'),
	('Stafford', 'stafford', 2675000, 'importcars'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'supers'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'supers'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Taipan', 'taipan', 4675000, 'importcars'),
	('Tampa', 'tampa', 16000, 'muscles'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Tempesta', 'tempesta', 1730000, 'importcars'),
	('Tezeract', 'tezeract', 4458000, 'importcars'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroads'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroads'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'supers'),
	('Tyrant', 'tyrant', 7780000, 'importcars'),
	('Tyrus', 'tyrus', 600000, 'supers'),
	('Vacca', 'vacca', 120000, 'supers'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Vagner', 'vagner', 3421000, 'importcars'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscles'),
	('Virgo', 'virgo', 14000, 'muscles'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'supers'),
	('Voltic', 'voltic', 90000, 'supers'),
	('Voltic 2', 'voltic2', 3830400, 'supers'),
	('Voodoo', 'voodoo', 7200, 'muscles'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XA21', 'xa21', 3354000, 'importcars'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscles'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'supers'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');
/*!40000 ALTER TABLE `vs_cars` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_car_categories
CREATE TABLE IF NOT EXISTS `vs_car_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_car_categories: ~14 rows (approximately)
/*!40000 ALTER TABLE `vs_car_categories` DISABLE KEYS */;
INSERT INTO `vs_car_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupes'),
	('donate', 'Donate'),
	('importcars', 'Import Cars'),
	('importmotorcycles', 'Import Motorcycles'),
	('motorcycles', 'Motorcycles'),
	('muscles', 'Muscles'),
	('offroads', 'Off-Roads'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('supers', 'Supers'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `vs_car_categories` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_mecano
CREATE TABLE IF NOT EXISTS `vs_mecano` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_mecano: ~10 rows (approximately)
/*!40000 ALTER TABLE `vs_mecano` DISABLE KEYS */;
INSERT INTO `vs_mecano` (`id`, `name`, `model`, `price`, `category`) VALUES
	(1, 'Flatbed', 'flatbed', 500, 'recrue'),
	(2, 'Tow Truck', 'towtruck2', 750, 'recrue'),
	(3, 'Flatbed', 'flatbed', 500, 'novice'),
	(4, 'Tow Truck', 'towtruck2', 750, 'novice'),
	(5, 'Flatbed', 'flatbed', 500, 'experimente'),
	(6, 'Tow Truck', 'towtruck2', 750, 'experimente'),
	(7, 'Flatbed', 'flatbed', 500, 'chief'),
	(8, 'Tow Truck', 'towtruck2', 750, 'chief'),
	(9, 'Flatbed', 'flatbed', 500, 'boss'),
	(10, 'Tow Truck', 'towtruck2', 750, 'boss');
/*!40000 ALTER TABLE `vs_mecano` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_mecano_categories
CREATE TABLE IF NOT EXISTS `vs_mecano_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_mecano_categories: ~5 rows (approximately)
/*!40000 ALTER TABLE `vs_mecano_categories` DISABLE KEYS */;
INSERT INTO `vs_mecano_categories` (`name`, `label`) VALUES
	('boss', 'Boss'),
	('chief', 'Chief'),
	('experimente', 'Experienced'),
	('novice', 'Novice'),
	('recrue', 'Recruit');
/*!40000 ALTER TABLE `vs_mecano_categories` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_police
CREATE TABLE IF NOT EXISTS `vs_police` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_police: ~12 rows (approximately)
/*!40000 ALTER TABLE `vs_police` DISABLE KEYS */;
INSERT INTO `vs_police` (`id`, `name`, `model`, `price`, `category`) VALUES
	(1, 'Police Cruiser', 'police', 500, 'recruit'),
	(2, 'Police Cruiser', 'police2', 750, 'recruit'),
	(3, 'Police Cruiser', 'police', 500, 'officer'),
	(4, 'Police Cruiser', 'police2', 750, 'officer'),
	(5, 'Police Cruiser', 'police', 500, 'sergeant'),
	(6, 'Police Cruiser', 'police2', 750, 'sergeant'),
	(7, 'Police Cruiser', 'police', 500, 'lieutenant'),
	(8, 'Police Cruiser', 'police2', 750, 'lieutenant'),
	(9, 'Police Cruiser', 'police', 500, 'boss'),
	(10, 'Police Cruiser', 'police2', 750, 'boss'),
	(11, 'Maverick', 'polmav', 1000, 'boss'),
	(12, 'PJR', 'pjr', 1000, 'officer');
/*!40000 ALTER TABLE `vs_police` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_police_categories
CREATE TABLE IF NOT EXISTS `vs_police_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_police_categories: ~5 rows (approximately)
/*!40000 ALTER TABLE `vs_police_categories` DISABLE KEYS */;
INSERT INTO `vs_police_categories` (`name`, `label`) VALUES
	('boss', 'Chief'),
	('lieutenant', 'Lieutenant'),
	('officer', 'Officer'),
	('recruit', 'Recruit'),
	('sergeant', 'Sergeant');
/*!40000 ALTER TABLE `vs_police_categories` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_trucks
CREATE TABLE IF NOT EXISTS `vs_trucks` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_trucks: ~28 rows (approximately)
/*!40000 ALTER TABLE `vs_trucks` DISABLE KEYS */;
INSERT INTO `vs_trucks` (`name`, `model`, `price`, `category`) VALUES
	('Airport Bus', 'airbus', 50000, 'trans'),
	('Benson', 'benson', 55000, 'box'),
	('Biff', 'biff', 30000, 'other'),
	('Boxville 1', 'boxville', 45000, 'box'),
	('Boxville 2', 'boxville2', 45000, 'box'),
	('Boxville 3', 'boxville3', 45000, 'box'),
	('Boxville 4', 'boxville4', 45000, 'box'),
	('Dozer', 'bulldozer', 20000, 'other'),
	('Bus', 'bus', 50000, 'trans'),
	('Dashound', 'coach', 50000, 'trans'),
	('Hauler', 'hauler', 100000, 'haul'),
	('Mixer 1', 'mixer', 30000, 'other'),
	('Mixer 2', 'mixer2', 30000, 'other'),
	('Mule 1', 'mule', 40000, 'box'),
	('Mule 2', 'mule2', 40000, 'box'),
	('Mule 3', 'mule3', 40000, 'box'),
	('Packer', 'packer', 100000, 'haul'),
	('Festival Bus', 'pbus2', 125000, 'trans'),
	('Phantom', 'phantom', 105000, 'haul'),
	('Phantom Custom', 'phantom3', 110000, 'haul'),
	('Pounder', 'pounder', 55000, 'box'),
	('Rental Bus', 'rentalbus', 35000, 'trans'),
	('Rubble', 'rubble', 30000, 'other'),
	('Scrap Truck', 'scrap', 10000, 'other'),
	('Tipper 1', 'tiptruck', 30000, 'other'),
	('Tipper 2', 'tiptruck2', 30000, 'other'),
	('Tour Bus', 'tourbus', 35000, 'trans'),
	('Field Master', 'tractor2', 15000, 'other');
/*!40000 ALTER TABLE `vs_trucks` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_truck_categories
CREATE TABLE IF NOT EXISTS `vs_truck_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_truck_categories: ~4 rows (approximately)
/*!40000 ALTER TABLE `vs_truck_categories` DISABLE KEYS */;
INSERT INTO `vs_truck_categories` (`name`, `label`) VALUES
	('box', 'Boxed Trucks'),
	('haul', 'Haulers'),
	('other', 'Other Trucks'),
	('trans', 'Transport Trucks');
/*!40000 ALTER TABLE `vs_truck_categories` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_vipboats
CREATE TABLE IF NOT EXISTS `vs_vipboats` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_vipboats: ~0 rows (approximately)
/*!40000 ALTER TABLE `vs_vipboats` DISABLE KEYS */;
INSERT INTO `vs_vipboats` (`name`, `model`, `price`, `category`) VALUES
	('Tropic Yacht', 'tropic2', 27000, 'boats');
/*!40000 ALTER TABLE `vs_vipboats` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_vipboat_categories
CREATE TABLE IF NOT EXISTS `vs_vipboat_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_vipboat_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `vs_vipboat_categories` DISABLE KEYS */;
INSERT INTO `vs_vipboat_categories` (`name`, `label`) VALUES
	('boats', 'Boats');
/*!40000 ALTER TABLE `vs_vipboat_categories` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_vips
CREATE TABLE IF NOT EXISTS `vs_vips` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_vips: ~3 rows (approximately)
/*!40000 ALTER TABLE `vs_vips` DISABLE KEYS */;
INSERT INTO `vs_vips` (`name`, `model`, `price`, `category`) VALUES
	('Deluxo', 'deluxo', 2147483647, 'donate'),
	('Lamborghini Sian 2012', 'sian', 2147483647, 'donate'),
	('Nissan Skyline R34 GT-R 2004', 'skyline', 2147483647, 'donate');
/*!40000 ALTER TABLE `vs_vips` ENABLE KEYS */;

-- Dumping structure for table skuadcity.vs_vip_categories
CREATE TABLE IF NOT EXISTS `vs_vip_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.vs_vip_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `vs_vip_categories` DISABLE KEYS */;
INSERT INTO `vs_vip_categories` (`name`, `label`) VALUES
	('donate', 'Donasi');
/*!40000 ALTER TABLE `vs_vip_categories` ENABLE KEYS */;

-- Dumping structure for table skuadcity.weaponshops
CREATE TABLE IF NOT EXISTS `weaponshops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.weaponshops: ~20 rows (approximately)
/*!40000 ALTER TABLE `weaponshops` DISABLE KEYS */;
INSERT INTO `weaponshops` (`id`, `zone`, `item`, `price`, `category`) VALUES
	(1, 'BlackWeashop', 'WEAPON_GRENADE', 65000, 'melee'),
	(2, 'BlackShop', 'WEAPON_BZGAS', 50000, 'melee'),
	(3, 'BlackShop', 'WEAPON_SMOKEGRENADE', 50000, 'melee'),
	(4, 'BlackShop', 'WEAPON_MOLOTOV', 15000, 'melee'),
	(5, 'BlackWeashop', 'WEAPON_FIREEXTINGUISHER', 10000, 'melee'),
	(6, 'BlackWeashop', 'WEAPON_STICKYBOMB', 50000, 'melee'),
	(7, 'BlackShop', 'WEAPON_SNSPISTOL', 45000, 'handgun'),
	(8, 'BlackShop', 'WEAPON_VINTAGEPISTOL', 90000, 'handgun'),
	(9, 'BlackShop', 'WEAPON_PISTOL', 105000, 'handgun'),
	(10, 'BlackShop', 'WEAPON_MICROSMG', 270000, 'smg'),
	(11, 'BlackShop', 'WEAPON_MINISMG', 240000, 'smg'),
	(12, 'BlackShop', 'WEAPON_SMG', 480000, 'smg'),
	(13, 'BlackShop', 'WEAPON_PUMPSHOTGUN', 105000, 'shotgun'),
	(14, 'BlackShop', 'WEAPON_SAWNOFFSHOTGUN', 150000, 'shotgun'),
	(15, 'BlackShop', 'WEAPON_DBSHOTGUN', 135000, 'shotgun'),
	(16, 'BlackShop', 'WEAPON_ASSAULTRIFLE', 360000, 'assault'),
	(17, 'BlackShop', 'WEAPON_CARBINERIFLE', 720000, 'assault'),
	(18, 'BlackWeashop', 'WEAPON_FIREWORK', 2000000, 'lmg'),
	(19, 'BlackWeashop', 'WEAPON_MINIGUN', 4500000, 'lmg'),
	(20, 'BlackWeashop', 'WEAPON_RAILGUN', 5000000, 'lmg');
/*!40000 ALTER TABLE `weaponshops` ENABLE KEYS */;

-- Dumping structure for table skuadcity.weashops
CREATE TABLE IF NOT EXISTS `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- Dumping data for table skuadcity.weashops: ~58 rows (approximately)
/*!40000 ALTER TABLE `weashops` DISABLE KEYS */;
INSERT INTO `weashops` (`id`, `zone`, `item`, `price`, `category`) VALUES
	(1, 'GunShop', 'GADGET_PARACHUTE', 80000, 'melee'),
	(2, 'GunShop', 'WEAPON_FLASHLIGHT', 2500, 'melee'),
	(3, 'GunShop', 'WEAPON_MACHETE', 2000, 'melee'),
	(4, 'GunShop', 'WEAPON_BAT', 2000, 'melee'),
	(5, 'GunShop', 'WEAPON_NIGHTSTICK', 1500, 'melee'),
	(6, 'GunShop', 'WEAPON_KNIFE', 3000, 'melee'),
	(7, 'GunShop', 'WEAPON_HAMMER', 500, 'melee'),
	(8, 'GunShop', 'WEAPON_GOLFCLUB', 4000, 'melee'),
	(9, 'GunShop', 'WEAPON_CROWBAR', 1500, 'melee'),
	(10, 'GunShop', 'WEAPON_DAGGER', 1500, 'melee'),
	(11, 'GunShop', 'WEAPON_KNUCKLE', 2500, 'melee'),
	(12, 'GunShop', 'WEAPON_HATCHET', 2000, 'melee'),
	(13, 'GunShop', 'WEAPON_SWITCHBLADE', 2500, 'melee'),
	(14, 'GunShop', 'WEAPON_POOLCUE', 1000, 'melee'),
	(15, 'GunShop', 'WEAPON_WRENCH', 4000, 'melee'),
	(16, 'GunShop', 'WEAPON_BOTTLE', 1000, 'melee'),
	(17, 'GunShop', 'WEAPON_BATTLEAXE', 12500, 'melee'),
	(18, 'GunShop', 'WEAPON_GRENADE', 50000, 'melee'),
	(19, 'GunShop', 'WEAPON_BALL', 2500, 'melee'),
	(20, 'GunShop', 'WEAPON_SNOWBALL', 2500, 'melee'),
	(21, 'GunShop', 'WEAPON_BZGAS', 25000, 'melee'),
	(22, 'GunShop', 'WEAPON_SMOKEGRENADE', 25000, 'melee'),
	(23, 'GunShop', 'WEAPON_FLARE', 10000, 'melee'),
	(24, 'GunShop', 'WEAPON_FIREEXTINGUISHER', 10000, 'melee'),
	(25, 'GunShop', 'WEAPON_FLAREGUN', 50000, 'handgun'),
	(26, 'GunShop', 'WEAPON_STUNGUN', 50000, 'handgun'),
	(27, 'GunShop', 'WEAPON_SNSPISTOL', 15000, 'handgun'),
	(28, 'GunShop', 'WEAPON_VINTAGEPISTOL', 30000, 'handgun'),
	(29, 'GunShop', 'WEAPON_PISTOL', 35000, 'handgun'),
	(30, 'GunShop', 'WEAPON_COMBATPISTOL', 40000, 'handgun'),
	(31, 'GunShop', 'WEAPON_PISTOL50', 150000, 'handgun'),
	(32, 'GunShop', 'WEAPON_HEAVYPISTOL', 55000, 'handgun'),
	(33, 'GunShop', 'WEAPON_REVOLVER', 130000, 'handgun'),
	(34, 'GunShop', 'WEAPON_APPISTOL', 270000, 'handgun'),
	(35, 'GunShop', 'WEAPON_MICROSMG', 90000, 'smg'),
	(36, 'GunShop', 'WEAPON_MINISMG', 80000, 'smg'),
	(37, 'GunShop', 'WEAPON_SMG', 160000, 'smg'),
	(38, 'GunShop', 'WEAPON_MACHINEPISTOL', 130000, 'smg'),
	(39, 'GunShop', 'WEAPON_ASSAULTSMG', 140000, 'smg'),
	(40, 'GunShop', 'WEAPON_COMBATPDW', 150000, 'smg'),
	(41, 'GunShop', 'WEAPON_PUMPSHOTGUN', 35000, 'shotgun'),
	(42, 'GunShop', 'WEAPON_SAWNOFFSHOTGUN', 50000, 'shotgun'),
	(43, 'GunShop', 'WEAPON_DBSHOTGUN', 45000, 'shotgun'),
	(44, 'GunShop', 'WEAPON_HEAVYSHOTGUN', 100000, 'shotgun'),
	(45, 'GunShop', 'WEAPON_ASSAULTSHOTGUN', 110000, 'shotgun'),
	(46, 'GunShop', 'WEAPON_MUSKET', 22500, 'assault'),
	(47, 'GunShop', 'WEAPON_ASSAULTRIFLE', 120000, 'assault'),
	(48, 'GunShop', 'WEAPON_CARBINERIFLE', 240000, 'assault'),
	(49, 'GunShop', 'WEAPON_BULLPUPRIFLE', 120000, 'assault'),
	(50, 'GunShop', 'WEAPON_SPECIALCARBINE', 520000, 'assault'),
	(51, 'GunShop', 'WEAPON_COMPACTRIFLE', 75000, 'assault'),
	(52, 'GunShop', 'WEAPON_ADVANCEDRIFLE', 200000, 'assault'),
	(53, 'GunShop', 'WEAPON_GUSENBERG', 428000, 'lmg'),
	(54, 'GunShop', 'WEAPON_MG', 825000, 'lmg'),
	(55, 'GunShop', 'WEAPON_COMBATMG', 139500, 'lmg'),
	(56, 'GunShop', 'WEAPON_SNIPERRIFLE', 200000, 'sniper'),
	(57, 'GunShop', 'WEAPON_MARKSMANRIFLE', 380000, 'sniper'),
	(58, 'GunShop', 'WEAPON_HEAVYSNIPER', 990000, 'sniper');
/*!40000 ALTER TABLE `weashops` ENABLE KEYS */;

-- Dumping structure for table skuadcity.whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.whitelist: ~0 rows (approximately)
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
