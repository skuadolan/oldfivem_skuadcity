-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for skuadcity
DROP DATABASE IF EXISTS `skuadcity`;
CREATE DATABASE IF NOT EXISTS `skuadcity` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `skuadcity`;

-- Dumping structure for table skuadcity.accounts
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `name` varchar(255) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `money` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.accounts: ~0 rows (approximately)

-- Dumping structure for table skuadcity.addon_account
DROP TABLE IF EXISTS `addon_account`;
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.addon_account: ~10 rows (approximately)
REPLACE INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Tabungan Bank', 0),
	('caution', 'Perhatian', 0),
	('property_black_money', 'Uang Kotor', 0),
	('society_ambulance', 'EMS', 1),
	('society_banker', 'Banker', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_mechanic', 'Mekanik', 1),
	('society_police', 'Polisi', 1),
	('society_realestateagent', 'Agen Properti', 1),
	('society_taxi', 'Taksi', 1);

-- Dumping structure for table skuadcity.addon_account_data
DROP TABLE IF EXISTS `addon_account_data`;
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.addon_account_data: ~7 rows (approximately)
REPLACE INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 0, NULL),
	(2, 'society_police', 0, NULL),
	(3, 'society_ambulance', 0, NULL),
	(4, 'society_mechanic', 0, NULL),
	(5, 'society_taxi', 0, NULL),
	(6, 'society_banker', 0, NULL),
	(7, 'society_realestateagent', 0, NULL);

-- Dumping structure for table skuadcity.addon_inventory
DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.addon_inventory: ~6 rows (approximately)
REPLACE INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('property', 'Properti', 0),
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_mechanic', 'Mekanik', 1),
	('society_police', 'Polisi', 1),
	('society_taxi', 'Taksi', 1);

-- Dumping structure for table skuadcity.addon_inventory_items
DROP TABLE IF EXISTS `addon_inventory_items`;
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.addon_inventory_items: ~0 rows (approximately)

-- Dumping structure for table skuadcity.billing
DROP TABLE IF EXISTS `billing`;
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(60) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.billing: ~0 rows (approximately)

-- Dumping structure for table skuadcity.cardealer_vehicles
DROP TABLE IF EXISTS `cardealer_vehicles`;
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.cardealer_vehicles: ~0 rows (approximately)

-- Dumping structure for table skuadcity.datastore
DROP TABLE IF EXISTS `datastore`;
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.datastore: ~9 rows (approximately)
REPLACE INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Properti', 0),
	('society_ambulance', 'EMS', 1),
	('society_mechanic', 'Mekanik', 1),
	('society_police', 'Polisi', 1),
	('society_taxi', 'Taksi', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);

-- Dumping structure for table skuadcity.datastores
DROP TABLE IF EXISTS `datastores`;
CREATE TABLE IF NOT EXISTS `datastores` (
  `name` varchar(255) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.datastores: ~0 rows (approximately)

-- Dumping structure for table skuadcity.datastore_data
DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.datastore_data: ~4 rows (approximately)
REPLACE INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_police', NULL, '{}'),
	(2, 'society_ambulance', NULL, '{}'),
	(3, 'society_mechanic', NULL, '{}'),
	(4, 'society_taxi', NULL, '{}');

-- Dumping structure for table skuadcity.dpkeybinds
DROP TABLE IF EXISTS `dpkeybinds`;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table skuadcity.dpkeybinds: ~0 rows (approximately)

-- Dumping structure for table skuadcity.fine_types
DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.fine_types: ~45 rows (approximately)
REPLACE INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Bermain Klakson', 300, 0),
	(2, 'Berlawan Arah', 400, 0),
	(3, 'Memutar Balik Tidak Pada Tempatnya', 250, 0),
	(4, 'Pengemudi Off-Road Tidak sesuai mobilnya', 150, 0),
	(5, 'Pelanggar Peraturan Lalu Lintas', 100, 0),
	(6, 'Berhenti Tidak Pada Tempatnya', 350, 0),
	(7, 'Parkir Sembarangan', 100, 0),
	(8, 'Belok Tidak Menggunakan Sein', 200, 0),
	(9, 'Surat Kendaraan Tidak Lengkap', 150, 0),
	(10, 'Melebihi Batas Garis Penyebrangan Lampu Merah', 300, 0),
	(11, 'Mengendarai Dalam Keadaan Mabuk', 400, 0),
	(12, 'Mengendarai kendaraan curian', 1000, 0),
	(13, 'Tidak memiliki sim', 150, 0),
	(14, 'Tabrak Lari', 1000, 0),
	(15, 'Melebihi batas kecepatan', 250, 0),
	(16, 'Merokok sembarangan', 450, 0),
	(17, 'Berkelahi', 300, 0),
	(18, 'Berkata kasar', 100, 0),
	(19, 'menghina orang lain', 1900, 0),
	(20, 'memberikan ancaman terhadap warga sipil', 2000, 0),
	(21, 'tidak menghargai petugas', 2500, 1),
	(22, 'mengancam petugas', 2500, 1),
	(23, 'membetikan informasi palsu', 1000, 1),
	(24, 'upaya korupsi', 800, 1),
	(25, 'menembak asal-asalan dengan senjata biasa', 1000, 1),
	(26, 'menembak asal-asalan dengan senjata berat', 2000, 1),
	(27, 'tidak memiliki lisensi senjata', 1500, 1),
	(28, 'kepemilkan senjata ilegal', 8000, 1),
	(29, 'memiliki barang ilegal', 8000, 1),
	(30, 'melakukan pencurian', 5000, 1),
	(31, 'niat menjual obat-obatan ilegal', 2500, 2),
	(32, 'pemrosesan obat-obatan ilegal', 2500, 2),
	(33, 'kepemilikan obat-obatan ilegal', 2500, 2),
	(34, 'menculik warga sipil', 7000, 2),
	(35, 'menculik pekerja negara', 10000, 2),
	(36, 'perampokan toko', 8000, 2),
	(37, 'perampokan bank', 15000, 2),
	(38, 'penyerangan terhadap warga sipil', 5000, 2),
	(39, 'Penyerangan terhadap pekerja negara', 7000, 2),
	(40, 'pembunuhan berencana terhadap warga sipil', 10000, 2),
	(41, 'pembunuhan berencana terhadap pekerja negara', 13000, 2),
	(42, 'membunuh warga sipil', 8000, 2),
	(43, 'membunuh pekerja negara', 10000, 2),
	(44, 'pembunuhan tidak sengaja', 6000, 2),
	(45, 'penipuan', 1500, 3);

-- Dumping structure for table skuadcity.glovebox_inventory
DROP TABLE IF EXISTS `glovebox_inventory`;
CREATE TABLE IF NOT EXISTS `glovebox_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table skuadcity.glovebox_inventory: ~0 rows (approximately)

-- Dumping structure for table skuadcity.h_impounded_vehicles
DROP TABLE IF EXISTS `h_impounded_vehicles`;
CREATE TABLE IF NOT EXISTS `h_impounded_vehicles` (
  `plate` varchar(12) NOT NULL,
  `officer` varchar(255) DEFAULT NULL,
  `mechanic` varchar(255) DEFAULT NULL,
  `releasedate` varchar(25) DEFAULT NULL,
  `fee` double NOT NULL,
  `reason` text NOT NULL,
  `notes` text DEFAULT NULL,
  `vehicle` text NOT NULL,
  `identifier` varchar(30) NOT NULL,
  `hold_o` tinyint(1) DEFAULT 0,
  `hold_m` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table skuadcity.h_impounded_vehicles: ~0 rows (approximately)

-- Dumping structure for table skuadcity.inventories
DROP TABLE IF EXISTS `inventories`;
CREATE TABLE IF NOT EXISTS `inventories` (
  `name` varchar(255) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `items` longtext DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.inventories: ~0 rows (approximately)

-- Dumping structure for table skuadcity.items
DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(64) NOT NULL,
  `label` varchar(64) NOT NULL,
  `weight` int(11) NOT NULL,
  `rare` int(11) NOT NULL,
  `can_remove` int(11) NOT NULL,
  `limit` int(11) DEFAULT 10,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.items: ~56 rows (approximately)
REPLACE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `limit`, `price`) VALUES
	('accu', 'Batre Aki', 1, 0, 1, 10, 100),
	('alive_chicken', 'Ayam Hidup', 1, 0, 1, 20, 0),
	('bait', 'Cacing', 1, 0, 1, 30, 100),
	('bandage', 'Perban', 1, 0, 1, 10, 0),
	('betadine', 'Obat Betadine', 1, 0, 1, 25, 100),
	('black_money', 'Uang Kotor', 1, 0, 1, 1, 0),
	('blackmoney', 'Uang Kotor', 1, 0, 1, 1, 0),
	('blowpipe', 'Las', 1, 0, 1, 5, 100),
	('bread', 'Roti', 1, 0, 1, 45, 100),
	('bubuk_arang', 'Bubuk Arang', 1, 0, 1, 30, 0),
	('bullet', 'Peluru', 1, 0, 1, 25, 0),
	('bullet_casing', 'Slongsong Peluru', 1, 0, 1, 30, 100),
	('carokit', 'Dempul Mobil', 1, 0, 1, 5, 100),
	('carotool', 'Perkakas', 1, 0, 1, 30, 100),
	('clip', 'Ammo', 1, 0, 1, 10, 0),
	('clothe', 'Baju', 1, 0, 1, 40, 0),
	('coal', 'Batu Bara', 1, 0, 1, 25, 100),
	('copper', 'Tembaga', 1, 0, 1, 56, 0),
	('cutted_wood', 'Kayu Potong', 1, 0, 1, 20, 0),
	('diamond', 'Berlian', 1, 0, 1, 50, 0),
	('driver', 'Lisensi Supir', 1, 0, 1, 50, 0),
	('fabric', 'Kain', 1, 0, 1, 80, 0),
	('fish', 'Ikan', 1, 0, 1, 30, 0),
	('fishbait', 'Ikan Palsu', 1, 0, 1, 30, 100),
	('fishingrod', 'Joran Pancing', 1, 0, 1, 5, 100),
	('fixkit', 'Alat Perbaikan', 1, 0, 1, 10, 100),
	('fixtool', 'Peralatan Perbaikan', 1, 0, 1, 25, 0),
	('gazbottle', 'Botol Gas', 1, 0, 1, 10, 0),
	('gold', 'Emas', 1, 0, 1, 21, 0),
	('gps', 'Peta', 1, 0, 1, 5, 100),
	('gunpowder', 'Bubuk Misiu', 1, 0, 1, 30, 100),
	('HeavyArmor', 'Heavy Body Armor', 1, 0, 1, 5, 0),
	('iron', 'Besi', 1, 0, 1, 42, 0),
	('ktp', 'KTP', 1, 0, 1, 1, NULL),
	('meat', 'Daging Mentah', 1, 0, 1, 25, 0),
	('medikit', 'Kotak P3K', 1, 0, 1, 10, 0),
	('meth_processing', 'Lisensi Farmasi', 1, 0, 1, 1, NULL),
	('money', 'Uang', 1, 0, 1, 1, 0),
	('packaged_chicken', 'Ayam Siap Jual', 1, 0, 1, 100, 0),
	('packaged_plank', 'Papan', 1, 0, 1, 100, 0),
	('petrol', 'Minyak Mentah', 1, 0, 1, 24, 0),
	('petrol_raffin', 'Minyak Bersih', 1, 0, 1, 24, 0),
	('phone', 'Handphone', 1, 0, -1, 5, 100),
	('radio', 'Radio', 1, 0, -1, 5, 100),
	('repairkit', 'Alat - alat', 1, 0, 1, 10, 100),
	('slaughtered_chicken', 'Ayam Potong', 1, 0, 1, 20, 0),
	('stainless_steel', 'Stainless Steel', 1, 0, 1, 30, 100),
	('stone', 'Batu', 1, 0, 1, 7, 0),
	('tuna', 'Tuna', 1, 0, 1, 30, 0),
	('washed_stone', 'Batu Bersih', 1, 0, 1, 7, 0),
	('water', 'Air Mineral', 1, 0, 1, 45, 100),
	('weapon', 'Lisensi Senjata', 1, 0, 1, 1, 0),
	('weed_processing', 'Lisensi Narkoba', 1, 0, 1, 1, NULL),
	('wood', 'Kayu', 1, 0, 1, 20, 0),
	('wool', 'Benang Rajut', 1, 0, 1, 40, 0),
	('zetony', 'Coin', 0, 0, 1, 1, 0);

-- Dumping structure for table skuadcity.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(64) NOT NULL,
  `label` varchar(64) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.jobs: ~29 rows (approximately)
REPLACE INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 1),
	('banker', 'Banker', 1),
	('biker', 'Biker', 1),
	('cardealer', 'Cardealer', 1),
	('cartel', 'Cartel', 1),
	('fisherman', 'Nelayan', 0),
	('fueler', 'Tukang Minyak', 0),
	('gang', 'Gangster', 1),
	('garbage', 'Tukang Sampah', 1),
	('gopostal', 'Tukang Pos', 1),
	('lumberjack', 'Tukang Kayu', 0),
	('mafia', 'Mafia', 1),
	('mechanic', 'Mekanik', 1),
	('miner', 'Penambang', 0),
	('offambulance', 'Off EMS', 1),
	('offbanker', 'Off Banker', 1),
	('offcardealer', 'Off Cardealer', 1),
	('offmechanic', 'Off Mekanik', 1),
	('offpedagang', 'Off Pedagang', 1),
	('offpolice', 'Off Polisi', 1),
	('offtaxi', 'Taksi', 1),
	('pedagang', 'Pedagang', 1),
	('police', 'Polisi', 1),
	('reporter', 'Reporter', 1),
	('slaughterer', 'Tukang Ayam', 0),
	('tailor', 'Penjahit', 0),
	('taxi', 'Taksi', 1),
	('theb', 'The B', 1),
	('unemployed', 'Warga', 0);

-- Dumping structure for table skuadcity.job_grades
DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(32) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `label` varchar(64) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_name` (`job_name`),
  KEY `grade` (`grade`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.job_grades: ~123 rows (approximately)
REPLACE INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Pengangguran', 1000, '{}', '{}'),
	(2, 'banker', 0, 'advisor', 'Advisor', 250, '{}', '{}'),
	(3, 'banker', 1, 'banker', 'Banker', 300, '{}', '{}'),
	(4, 'banker', 2, 'business_banker', 'Investment banker', 450, '{}', '{}'),
	(5, 'banker', 3, 'trader', 'Trader', 570, '{}', '{}'),
	(6, 'banker', 4, 'boss', 'Boss', 650, '{}', '{}'),
	(7, 'cardealer', 0, 'recruit', 'Recruit', 250, '{}', '{}'),
	(8, 'cardealer', 1, 'novice', 'Novice', 300, '{}', '{}'),
	(9, 'cardealer', 2, 'wakil_boss', 'Experienced', 450, '{}', '{}'),
	(10, 'cardealer', 3, 'boss', 'Boss', 570, '{}', '{}'),
	(11, 'ambulance', 0, 'asisten_perawat', 'Asisten Perawat', 250, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(12, 'ambulance', 1, 'perawat', 'Perawat', 300, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":42,"torso_2":0,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":85,"face":19,"decals_1":57,"torso_1":249,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(13, 'ambulance', 2, 'asisten_doctor', 'Asisten Dokter', 450, '{"tshirt_2":3,"hair_color_1":5,"glasses_2":3,"shoes":42,"torso_2":1,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":63,"helmet_1":8,"helmet_2":0,"arms":86,"face":19,"decals_1":57,"torso_1":140,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(14, 'ambulance', 3, 'chief_doctor', 'Dokter', 570, '{}', '{}'),
	(15, 'ambulance', 4, 'wakil_boss', 'Wakil Direktur', 650, '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes":65,"shoes_2":3,"chain_2":3,"chain_2":3,"torso_2":1,"hair_color_2":0,"pants_1":52,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":34,"helmet_1":8,"helmet_2":0,"arms":86,"face":19,"decals_1":57,"torso_1":101,"hair_2":0,"skin":34,"pants_2":0}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(16, 'ambulance', 5, 'boss', 'Direktur', 735, '{"tshirt_1":34,"tshirt_2":4,"torso_1":101,"torso_2":2,"decals_1":57,"decals_2":0,"arms":93,"pants_1":83,"pants_2":0,"shoes_1":32,"shoes_2":7,"chain_1":92,"chain_2":1}', '{}'),
	(17, 'mechanic', 0, 'recrue', 'Magang', 250, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":71,"torso_2":0,"hair_color_2":0,"pants_1":39,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":53,"face":19,"decals_1":0,"torso_1":66,"hair_2":0,"skin":34,"pants_2":0}', '{}'),
	(18, 'mechanic', 1, 'novice', 'Amatir', 300, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":71,"torso_2":1,"hair_color_2":0,"pants_1":39,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":53,"face":19,"decals_1":0,"torso_1":66,"hair_2":0,"skin":34,"pants_2":1}', '{}'),
	(19, 'mechanic', 2, 'experimente', 'Ahli', 450, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":71,"torso_2":2,"hair_color_2":0,"pants_1":39,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":53,"face":19,"decals_1":0,"torso_1":66,"hair_2":0,"skin":34,"pants_2":2}', '{}'),
	(20, 'mechanic', 3, 'wakil_boss', 'Wakil Bos', 570, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":48,"torso_2":15,"hair_color_2":0,"pants_1":91,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":31,"face":19,"decals_1":0,"torso_1":248,"hair_2":0,"skin":34,"pants_2":0}', '{}'),
	(21, 'mechanic', 4, 'boss', 'Bos', 650, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":48,"torso_2":15,"hair_color_2":0,"pants_1":91,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":31,"face":19,"decals_1":0,"torso_1":248,"hair_2":0,"skin":34,"pants_2":0}', '{}'),
	(22, 'taxi', 0, 'recrue', 'Recrue', 250, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(23, 'taxi', 1, 'novice', 'Novice', 300, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(24, 'taxi', 2, 'experimente', 'Experimente', 450, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(25, 'taxi', 3, 'wakil_boss', 'Uber', 570, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(26, 'taxi', 4, 'boss', 'Patron', 650, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(27, 'pedagang', 0, 'karyawan', 'Karyawan', 250, '{}', '{}'),
	(28, 'pedagang', 1, 'wakil_boss', 'Manajer', 300, '{}', '{}'),
	(29, 'pedagang', 2, 'boss', 'Bos', 450, '{}', '{}'),
	(30, 'police', 0, 'tamtama', 'Tamtama', 250, '{}', '{}'),
	(31, 'police', 1, 'bripda', 'Bripda', 300, '{}', '{}'),
	(32, 'police', 2, 'briptu', 'Briptu', 450, '{}', '{}'),
	(33, 'police', 3, 'brigpol', 'Brigpol', 570, '{}', '{}'),
	(34, 'police', 4, 'bripka', 'Bripka', 650, '{}', '{}'),
	(35, 'police', 5, 'aipda', 'Aipda', 710, '{}', '{}'),
	(36, 'police', 6, 'aiptu', 'Aiptu', 775, '{}', '{}'),
	(37, 'police', 7, 'ipda', 'Ipda', 810, '{}', '{}'),
	(38, 'police', 8, 'iptu', 'Iptu', 845, '{}', '{}'),
	(39, 'police', 9, 'akp', 'Akp', 890, '{}', '{}'),
	(40, 'police', 10, 'kompol', 'Kompol', 935, '{}', '{}'),
	(41, 'police', 11, 'akbp', 'Akbp', 985, '{}', '{}'),
	(42, 'police', 12, 'brigjen', 'Brigjen', 1010, '{}', '{}'),
	(43, 'police', 13, 'irjen', 'Irjen', 1075, '{}', '{}'),
	(44, 'police', 14, 'wakil_boss', 'Komjen', 1135, '{}', '{}'),
	(45, 'police', 15, 'boss', 'Jendral', 1195, '{}', '{}'),
	(46, 'biker', 0, 'recruit', 'Anggota', 250, '{}', '{}'),
	(47, 'biker', 1, 'officer', 'Bodyguard', 300, '{}', '{}'),
	(48, 'biker', 2, 'sergeant', 'Penasihat', 450, '{}', '{}'),
	(49, 'biker', 3, 'wakil_boss', 'Wakil Ketua', 570, '{}', '{}'),
	(50, 'biker', 4, 'boss', 'Ketua', 650, '{}', '{}'),
	(51, 'cartel', 0, 'recruit', 'Anggota', 250, '{}', '{}'),
	(52, 'cartel', 1, 'officer', 'Bodyguard', 300, '{}', '{}'),
	(53, 'cartel', 2, 'sergeant', 'Penasihat', 450, '{}', '{}'),
	(54, 'cartel', 3, 'wakil_boss', 'Wakil Ketua', 570, '{}', '{}'),
	(55, 'cartel', 4, 'boss', 'Ketua', 650, '{}', '{}'),
	(56, 'gang', 0, 'recruit', 'Anggota', 250, '{}', '{}'),
	(57, 'gang', 1, 'officer', 'Bodyguard', 300, '{}', '{}'),
	(58, 'gang', 2, 'sergeant', 'Penasihat', 450, '{}', '{}'),
	(59, 'gang', 3, 'wakil_boss', 'Wakil Ketua', 570, '{}', '{}'),
	(60, 'gang', 4, 'boss', 'Ketua', 650, '{}', '{}'),
	(61, 'mafia', 0, 'recruit', 'Anggota', 250, '{}', '{}'),
	(62, 'mafia', 1, 'officer', 'Bodyguard', 300, '{}', '{}'),
	(63, 'mafia', 2, 'sergeant', 'Penasihat', 450, '{}', '{}'),
	(64, 'mafia', 3, 'wakil_boss', 'Wakil Ketua', 570, '{}', '{}'),
	(65, 'mafia', 4, 'boss', 'Ketua', 650, '{}', '{}'),
	(66, 'theb', 0, 'recruit', 'magang', 250, '{}', '{}'),
	(67, 'theb', 1, 'officer', 'anggota', 300, '{}', '{}'),
	(68, 'theb', 2, 'sergeant', 'bodyguard', 450, '{}', '{}'),
	(69, 'theb', 3, 'wakil_boss', 'wakil ketua', 570, '{}', '{}'),
	(70, 'theb', 4, 'boss', 'ketua', 250, '{}', '{}'),
	(71, 'lumberjack', 0, 'employee', 'Amatir', 300, '{"tshirt_1":15, "torso_1":61, "arms":27, "pants_1":9, "shoes_1":12, "helmet_1":20}', '{}'),
	(72, 'fisherman', 0, 'employee', 'Amatir', 300, '{"tshirt_1":15, "torso_1":9, "arms":30, "pants_1": 15, "shoes_1":16, "helmet_1":20}', '{}'),
	(73, 'fueler', 0, 'employee', 'Amatir', 300, '{"tshirt_1":15, "torso_1":44, "torso_2":3, "arms":30, "pants_1": 15, "shoes_1":12, "shoes_2":6, "helmet_1":20}', '{}'),
	(74, 'tailor', 0, 'employee', 'Amatir', 300, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(75, 'miner', 0, 'employee', 'Amatir', 300, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(76, 'slaughterer', 0, 'employee', 'Amatir', 300, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(77, 'reporter', 1, 'employee', 'Amatir', 300, '{}', '{}'),
	(78, 'offcardealer', 0, 'recruit', 'Recruit', 0, '{}', '{}'),
	(79, 'offcardealer', 1, 'novice', 'Novice', 0, '{}', '{}'),
	(80, 'offcardealer', 2, 'wakil_boss', 'Experienced', 0, '{}', '{}'),
	(81, 'offcardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(82, 'offambulance', 0, 'asisten_perawat', 'Asisten Perawat', 0, '{}', '{}'),
	(83, 'offambulance', 1, 'perawat', 'Perawat', 0, '{}', '{}'),
	(84, 'offambulance', 2, 'asisten_doctor', 'Asisten Dokter', 0, '{}', '{}'),
	(85, 'offambulance', 3, 'chief_doctor', 'Dokter', 0, '{}', '{}'),
	(86, 'offambulance', 4, 'wakil_boss', 'Wakil Direktur', 0, '{}', '{}'),
	(87, 'offambulance', 5, 'boss', 'Direktur', 0, '{}', '{}'),
	(88, 'offmechanic', 0, 'recrue', 'Magang', 0, '{}', '{}'),
	(89, 'offmechanic', 1, 'novice', 'Amatir', 0, '{}', '{}'),
	(90, 'offmechanic', 2, 'experimente', 'Ahli', 0, '{}', '{}'),
	(91, 'offmechanic', 3, 'wakil_boss', 'Wakil Bos', 0, '{}', '{}'),
	(92, 'offmechanic', 4, 'boss', 'Bos', 0, '{}', '{}'),
	(93, 'offtaxi', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(94, 'offtaxi', 1, 'novice', 'Novice', 0, '{}', '{}'),
	(95, 'offtaxi', 2, 'experimente', 'Experimente', 0, '{}', '{}'),
	(96, 'offtaxi', 3, 'wakil_boss', 'Uber', 0, '{}', '{}'),
	(97, 'offtaxi', 4, 'boss', 'Patron', 0, '{}', '{}'),
	(98, 'offpedagang', 0, 'karyawan', 'Karyawan', 0, '{}', '{}'),
	(99, 'offpedagang', 1, 'wakil_boss', 'Manajer', 0, '{}', '{}'),
	(100, 'offpedagang', 2, 'boss', 'Bos', 0, '{}', '{}'),
	(101, 'offpolice', 0, 'tamtama', 'Tamtama', 0, '{}', '{}'),
	(102, 'offpolice', 1, 'bripda', 'Bripda', 0, '{}', '{}'),
	(103, 'offpolice', 2, 'briptu', 'Briptu', 0, '{}', '{}'),
	(104, 'offpolice', 3, 'brigpol', 'Brigpol', 0, '{}', '{}'),
	(105, 'offpolice', 4, 'bripka', 'Bripka', 0, '{}', '{}'),
	(106, 'offpolice', 5, 'aipda', 'Aipda', 0, '{}', '{}'),
	(107, 'offpolice', 6, 'aiptu', 'Aiptu', 0, '{}', '{}'),
	(108, 'offpolice', 7, 'ipda', 'Ipda', 0, '{}', '{}'),
	(109, 'offpolice', 8, 'iptu', 'Iptu', 0, '{}', '{}'),
	(110, 'offpolice', 9, 'akp', 'Akp', 0, '{}', '{}'),
	(111, 'offpolice', 10, 'kompol', 'Kompol', 0, '{}', '{}'),
	(112, 'offpolice', 11, 'akbp', 'Akbp', 0, '{}', '{}'),
	(113, 'offpolice', 12, 'brigjen', 'Brigjen', 0, '{}', '{}'),
	(114, 'offpolice', 13, 'irjen', 'Irjen', 0, '{}', '{}'),
	(115, 'offpolice', 14, 'wakil_boss', 'Komjen', 0, '{}', '{}'),
	(116, 'offpolice', 15, 'boss', 'Jendral', 0, '{}', '{}'),
	(117, 'offbanker', 0, 'advisor', 'Advisor', 0, '{}', '{}'),
	(118, 'offbanker', 1, 'banker', 'Banker', 0, '{}', '{}'),
	(119, 'offbanker', 2, 'business_banker', 'Investment banker', 0, '{}', '{}'),
	(120, 'offbanker', 3, 'trader', 'Trader', 0, '{}', '{}'),
	(121, 'offbanker', 4, 'boss', 'Boss', 0, '{}', '{}'),
	(122, 'gopostal', 0, 'employee', 'Tukang Pos', 300, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(123, 'garbage', 0, 'employee', 'Tukang Sampah', 300, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}');

-- Dumping structure for table skuadcity.licenses
DROP TABLE IF EXISTS `licenses`;
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.licenses: ~8 rows (approximately)
REPLACE INTO `licenses` (`type`, `label`) VALUES
	('boat', 'SIM Kapal'),
	('dmv', 'Ujian SIM'),
	('drive', 'SIM Mobil'),
	('drive_bike', 'SIM Motor'),
	('drive_truck', 'SIM Truk'),
	('meth_processing', 'Lisensi Obat'),
	('weapon', 'Lisensi Senjata'),
	('weed_processing', 'Lisensi Narkoba');

-- Dumping structure for table skuadcity.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) DEFAULT NULL,
  `last` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.migrations: ~2 rows (approximately)
REPLACE INTO `migrations` (`id`, `module`, `last`) VALUES
	(1, 'skin', 0),
	(2, 'society', 0);

-- Dumping structure for table skuadcity.owned_properties
DROP TABLE IF EXISTS `owned_properties`;
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.owned_properties: ~0 rows (approximately)

-- Dumping structure for table skuadcity.owned_shops
DROP TABLE IF EXISTS `owned_shops`;
CREATE TABLE IF NOT EXISTS `owned_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `store_label` varchar(255) DEFAULT NULL,
  `items` varchar(255) DEFAULT NULL,
  `balance_saves` int(11) DEFAULT 0,
  `zone` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.owned_shops: ~0 rows (approximately)

-- Dumping structure for table skuadcity.owned_vehicles
DROP TABLE IF EXISTS `owned_vehicles`;
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(40) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) NOT NULL DEFAULT 'civ',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `garage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.owned_vehicles: ~0 rows (approximately)

-- Dumping structure for table skuadcity.phone_app_chat
DROP TABLE IF EXISTS `phone_app_chat`;
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.phone_app_chat: ~0 rows (approximately)

-- Dumping structure for table skuadcity.phone_calls
DROP TABLE IF EXISTS `phone_calls`;
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.phone_calls: ~0 rows (approximately)

-- Dumping structure for table skuadcity.phone_messages
DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.phone_messages: 0 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for table skuadcity.phone_users_contacts
DROP TABLE IF EXISTS `phone_users_contacts`;
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.phone_users_contacts: 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Dumping structure for table skuadcity.properties
DROP TABLE IF EXISTS `properties`;
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.properties: ~121 rows (approximately)
REPLACE INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{"y":564.89,"z":182.959,"x":119.384}', '{"x":117.347,"y":559.506,"z":183.304}', '{"y":557.032,"z":183.301,"x":118.037}', '{"y":567.798,"z":182.131,"x":119.249}', '[]', NULL, 1, 1, 0, '{"x":118.748,"y":566.573,"z":175.697}', 150000),
	(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{"x":372.796,"y":428.327,"z":144.685}', '{"x":373.548,"y":422.982,"z":144.907}', '{"y":420.075,"z":145.904,"x":372.161}', '{"x":372.454,"y":432.886,"z":143.443}', '[]', NULL, 1, 1, 0, '{"x":377.349,"y":429.422,"z":137.3}', 150000),
	(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{"y":-379.165,"z":37.961,"x":-936.363}', '{"y":-365.476,"z":113.274,"x":-913.097}', '{"y":-367.637,"z":113.274,"x":-918.022}', '{"y":-382.023,"z":37.961,"x":-943.626}', '[]', NULL, 1, 1, 0, '{"x":-927.554,"y":-377.744,"z":112.674}', 170000),
	(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{"y":440.8,"z":146.702,"x":346.964}', '{"y":437.456,"z":148.394,"x":341.683}', '{"y":435.626,"z":148.394,"x":339.595}', '{"x":350.535,"y":443.329,"z":145.764}', '[]', NULL, 1, 1, 0, '{"x":337.726,"y":436.985,"z":140.77}', 150000),
	(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{"y":502.696,"z":136.421,"x":-176.003}', '{"y":497.817,"z":136.653,"x":-174.349}', '{"y":495.069,"z":136.666,"x":-173.331}', '{"y":506.412,"z":135.0664,"x":-177.927}', '[]', NULL, 1, 1, 0, '{"x":-174.725,"y":493.095,"z":129.043}', 150000),
	(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{"y":596.58,"z":142.641,"x":-686.554}', '{"y":591.988,"z":144.392,"x":-681.728}', '{"y":590.608,"z":144.392,"x":-680.124}', '{"y":599.019,"z":142.059,"x":-689.492}', '[]', NULL, 1, 1, 0, '{"x":-680.46,"y":588.6,"z":136.769}', 150000),
	(7, 'LowEndApartment', 'Appartement de base', '{"y":-1078.735,"z":28.4031,"x":292.528}', '{"y":-1007.152,"z":-102.002,"x":265.845}', '{"y":-1002.802,"z":-100.008,"x":265.307}', '{"y":-1078.669,"z":28.401,"x":296.738}', '[]', NULL, 1, 1, 0, '{"x":265.916,"y":-999.38,"z":-100.008}', 56200),
	(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{"y":454.955,"z":96.462,"x":-1294.433}', '{"x":-1289.917,"y":449.541,"z":96.902}', '{"y":446.322,"z":96.899,"x":-1289.642}', '{"y":455.453,"z":96.517,"x":-1298.851}', '[]', NULL, 1, 1, 0, '{"x":-1287.306,"y":455.901,"z":89.294}', 150000),
	(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{"x":-853.346,"y":696.678,"z":147.782}', '{"y":690.875,"z":151.86,"x":-859.961}', '{"y":688.361,"z":151.857,"x":-859.395}', '{"y":701.628,"z":147.773,"x":-855.007}', '[]', NULL, 1, 1, 0, '{"x":-858.543,"y":697.514,"z":144.253}', 150000),
	(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{"y":620.494,"z":141.588,"x":-752.82}', '{"y":618.62,"z":143.153,"x":-759.317}', '{"y":617.629,"z":143.153,"x":-760.789}', '{"y":621.281,"z":141.254,"x":-750.919}', '[]', NULL, 1, 1, 0, '{"x":-762.504,"y":618.992,"z":135.53}', 150000),
	(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{"y":37.025,"z":42.58,"x":-618.299}', '{"y":58.898,"z":97.2,"x":-603.301}', '{"y":58.941,"z":97.2,"x":-608.741}', '{"y":30.603,"z":42.524,"x":-620.017}', '[]', NULL, 1, 1, 0, '{"x":-622.173,"y":54.585,"z":96.599}', 170000),
	(12, 'MiltonDrive', 'Milton Drive', '{"x":-775.17,"y":312.01,"z":84.658}', NULL, NULL, '{"x":-775.346,"y":306.776,"z":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
	(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_01_a"]', 'MiltonDrive', 1, 1, 0, '{"x":-766.661,"y":327.672,"z":210.396}', 130000),
	(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_01_c"]', 'MiltonDrive', 1, 1, 0, '{"x":-795.735,"y":326.757,"z":186.313}', 130000),
	(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_01_b"]', 'MiltonDrive', 1, 1, 0, '{"x":-765.386,"y":330.782,"z":195.08}', 130000),
	(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_02_a"]', 'MiltonDrive', 1, 1, 0, '{"x":-766.615,"y":327.878,"z":210.396}', 130000),
	(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_02_c"]', 'MiltonDrive', 1, 1, 0, '{"x":-795.297,"y":327.092,"z":186.313}', 130000),
	(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_02_b"]', 'MiltonDrive', 1, 1, 0, '{"x":-765.303,"y":330.932,"z":195.085}', 130000),
	(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_03_a"]', 'MiltonDrive', 1, 1, 0, '{"x":-765.885,"y":327.641,"z":210.396}', 130000),
	(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_03_c"]', 'MiltonDrive', 1, 1, 0, '{"x":-795.607,"y":327.344,"z":186.313}', 130000),
	(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_03_b"]', 'MiltonDrive', 1, 1, 0, '{"x":-765.525,"y":330.851,"z":195.085}', 130000),
	(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_04_a"]', 'MiltonDrive', 1, 1, 0, '{"x":-766.527,"y":327.89,"z":210.396}', 130000),
	(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_04_c"]', 'MiltonDrive', 1, 1, 0, '{"x":-795.642,"y":326.497,"z":186.313}', 130000),
	(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_04_b"]', 'MiltonDrive', 1, 1, 0, '{"x":-765.503,"y":331.318,"z":195.085}', 130000),
	(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_05_a"]', 'MiltonDrive', 1, 1, 0, '{"x":-766.289,"y":328.086,"z":210.396}', 130000),
	(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_05_c"]', 'MiltonDrive', 1, 1, 0, '{"x":-795.692,"y":326.762,"z":186.313}', 130000),
	(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_05_b"]', 'MiltonDrive', 1, 1, 0, '{"x":-765.094,"y":330.976,"z":195.085}', 130000),
	(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_06_a"]', 'MiltonDrive', 1, 1, 0, '{"x":-766.263,"y":328.104,"z":210.396}', 130000),
	(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_06_c"]', 'MiltonDrive', 1, 1, 0, '{"x":-795.655,"y":326.611,"z":186.313}', 130000),
	(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_06_b"]', 'MiltonDrive', 1, 1, 0, '{"x":-765.3,"y":331.414,"z":195.085}', 130000),
	(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_07_a"]', 'MiltonDrive', 1, 1, 0, '{"x":-765.956,"y":328.257,"z":210.396}', 130000),
	(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_07_c"]', 'MiltonDrive', 1, 1, 0, '{"x":-795.545,"y":326.659,"z":186.313}', 130000),
	(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_07_b"]', 'MiltonDrive', 1, 1, 0, '{"x":-765.087,"y":331.429,"z":195.123}', 130000),
	(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_08_a"]', 'MiltonDrive', 1, 1, 0, '{"x":-766.187,"y":328.47,"z":210.396}', 130000),
	(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_08_c"]', 'MiltonDrive', 1, 1, 0, '{"x":-795.658,"y":326.563,"z":186.313}', 130000),
	(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_08_b"]', 'MiltonDrive', 1, 1, 0, '{"x":-765.287,"y":331.084,"z":195.086}', 130000),
	(37, 'IntegrityWay', '4 Integrity Way', '{"x":-47.804,"y":-585.867,"z":36.956}', NULL, NULL, '{"x":-54.178,"y":-583.762,"z":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
	(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{"x":-31.409,"y":-594.927,"z":79.03}', '{"x":-26.098,"y":-596.909,"z":79.03}', NULL, '[]', 'IntegrityWay', 1, 1, 0, '{"x":-11.923,"y":-597.083,"z":78.43}', 170000),
	(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{"x":-17.702,"y":-588.524,"z":89.114}', '{"x":-16.21,"y":-582.569,"z":89.114}', NULL, '[]', 'IntegrityWay', 1, 1, 0, '{"x":-26.327,"y":-588.384,"z":89.123}', 170000),
	(40, 'DellPerroHeights', 'Dell Perro Heights', '{"x":-1447.06,"y":-538.28,"z":33.74}', NULL, NULL, '{"x":-1440.022,"y":-548.696,"z":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
	(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{"x":-1452.125,"y":-540.591,"z":73.044}', '{"x":-1455.435,"y":-535.79,"z":73.044}', NULL, '[]', 'DellPerroHeights', 1, 1, 0, '{"x":-1467.058,"y":-527.571,"z":72.443}', 170000),
	(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{"x":-1451.562,"y":-523.535,"z":55.928}', '{"x":-1456.02,"y":-519.209,"z":55.929}', NULL, '[]', 'DellPerroHeights', 1, 1, 0, '{"x":-1457.026,"y":-530.219,"z":55.937}', 170000),
	(43, 'MazeBankBuilding', 'Maze Bank Building', '{"x":-79.18,"y":-795.92,"z":43.35}', NULL, NULL, '{"x":-72.50,"y":-786.92,"z":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
	(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01a"]', 'MazeBankBuilding', 1, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 500000),
	(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01b"]', 'MazeBankBuilding', 1, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 500000),
	(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01c"]', 'MazeBankBuilding', 1, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 500000),
	(47, 'ExecutiveRich', 'Executive Rich', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02b"]', 'MazeBankBuilding', 1, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 500000),
	(48, 'ExecutiveCool', 'Executive Cool', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02c"]', 'MazeBankBuilding', 1, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 500000),
	(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02a"]', 'MazeBankBuilding', 1, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 500000),
	(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03a"]', 'MazeBankBuilding', 1, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 500000),
	(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03b"]', 'MazeBankBuilding', 1, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 500000),
	(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03c"]', 'MazeBankBuilding', 1, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 500000),
	(53, 'LomBank', 'Lom Bank', '{"x":-1581.36,"y":-558.23,"z":34.07}', NULL, NULL, '{"x":-1583.60,"y":-555.12,"z":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
	(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01a"]', 'LomBank', 1, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 350000),
	(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01b"]', 'LomBank', 1, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 350000),
	(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01c"]', 'LomBank', 1, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 350000),
	(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02b"]', 'LomBank', 1, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 350000),
	(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02c"]', 'LomBank', 1, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 350000),
	(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02a"]', 'LomBank', 1, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 350000),
	(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03a"]', 'LomBank', 1, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 350000),
	(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03b"]', 'LomBank', 1, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 350000),
	(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03c"]', 'LomBank', 1, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 350000),
	(63, 'MazeBankWest', 'Maze Bank West', '{"x":-1379.58,"y":-499.63,"z":32.22}', NULL, NULL, '{"x":-1378.95,"y":-502.82,"z":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
	(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01a"]', 'MazeBankWest', 1, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 270000),
	(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01b"]', 'MazeBankWest', 1, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 270000),
	(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01c"]', 'MazeBankWest', 1, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 270000),
	(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02b"]', 'MazeBankWest', 1, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 270000),
	(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02c"]', 'MazeBankWest', 1, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 270000),
	(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02a"]', 'MazeBankWest', 1, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 270000),
	(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03a"]', 'MazeBankWest', 1, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 270000),
	(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03b"]', 'MazeBankWest', 1, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 270000),
	(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03c"]', 'MazeBankWest', 1, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 270000),
	(73, 'MedEndApartment1', 'Medium Apartment 1', '{"y":3107.56,"z":41.49,"x":240.6}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":3100.77,"z":41.49,"x":240.21}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 50000),
	(74, 'MedEndApartment2', 'Medium Apartment 2', '{"y":3169.1,"z":41.81,"x":246.7}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":3163.97,"z":41.82,"x":245.83}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 50000),
	(75, 'MedEndApartment3', 'Medium Apartment 3', '{"y":2667.22,"z":39.06,"x":980.38}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":2668.77,"z":39.06,"x":986.38}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 50000),
	(76, 'MedEndApartment4', 'Medium Apartment 4', '{"y":3031.08,"z":42.89,"x":195.85}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":3031.39,"z":42.27,"x":200.68}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 50000),
	(77, 'MedEndApartment5', 'Medium Apartment 5', '{"y":4642.17,"z":42.88,"x":1724.43}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":4637.34,"z":42.31,"x":1724.27}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 50000),
	(78, 'MedEndApartment6', 'Medium Apartment 6', '{"y":4739.73,"z":40.99,"x":1664.98}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":4740.93,"z":41.08,"x":1670.92}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 50000),
	(79, 'MedEndApartment7', 'Medium Apartment 7', '{"y":6577.19,"z":31.74,"x":12.57}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6572.61,"z":31.72,"x":16.93}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 50000),
	(80, 'MedEndApartment8', 'Medium Apartment 8', '{"y":6190.84,"z":30.73,"x":-374.31}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6186.58,"z":30.52,"x":-372.65}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 50000),
	(81, 'MedEndApartment9', 'Medium Apartment 9', '{"y":6597.56,"z":30.86,"x":-27.06}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6601.55,"z":30.44,"x":-30.55}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 50000),
	(82, 'MedEndApartment10', 'Medium Apartment 10', '{"y":6340.1,"z":28.84,"x":-367.33}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6336.97,"z":28.84,"x":-371.3}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 50000),
	(83, 'Motel', 'Motel Pinckage', '{"y":-209.4857,"z":53.07178,"x":326.1099}', NULL, NULL, '{"y":-209.4857,"z":53.07178,"x":326.1099}', '[]', NULL, 0, 0, 0, NULL, 0),
	(84, 'MotelPinckage1', 'Room', '{"x":312.8461, "y":-218.8517, "z":54.2217}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":312.8461, "y":-218.8517, "z":54.2217}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(85, 'MotelPinckage2', 'Room', '{"x":310.7988, "y":-218.1135, "z":54.2217}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":310.7988, "y":-218.1135, "z":54.2217}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(86, 'MotelPinckage3', 'Room', '{"x":307.2478, "y":-216.6887, "z":54.2217}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":307.2478, "y":-216.6887, "z":54.2217}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(87, 'MotelPinckage4', 'Room', '{"x":307.4836, "y":-213.2668, "z":54.2217}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":307.4836, "y":-213.2668, "z":54.2217}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(88, 'MotelPinckage5a', 'Room', '{"x":309.5486, "y":-207.9482, "z":54.2217}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":309.5486, "y":-207.9482, "z":54.2217}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(89, 'MotelPinckage5b', 'Room', '{"x":311.2804, "y":-203.4071, "z":54.2217}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":311.2804, "y":-203.4071, "z":54.2217}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(90, 'MotelPinckage6', 'Room', '{"x":313.2985, "y":-198.0486, "z":54.2217}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":313.2985, "y":-198.0486, "z":54.2217}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(91, 'MotelPinckage7', 'Room', '{"x":315.6986, "y":-194.7650, "z":54.2217}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":315.6986, "y":-194.7650, "z":54.2217}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(92, 'MotelPinckage8a', 'Room', '{"x":319.3502, "y":-196.1419, "z":54.2217}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":319.3502, "y":-196.1419, "z":54.2217}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(93, 'MotelPinckage8b', 'Room', '{"x":321.4276, "y":-196.9552, "z":54.2217}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":321.4276, "y":-196.9552, "z":54.2217}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(94, 'MotelPinckage11', 'Room', '{"x":312.8461, "y":-218.8517, "z":58.0192}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":312.8461, "y":-218.8517, "z":58.0192}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(95, 'MotelPinckage12', 'Room', '{"x":310.7988, "y":-218.1135, "z":58.0192}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":310.7988, "y":-218.1135, "z":58.0192}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(96, 'MotelPinckage13', 'Room', '{"x":307.2478, "y":-216.6887, "z":58.0192}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":307.2478, "y":-216.6887, "z":58.0192}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(97, 'MotelPinckage14', 'Room', '{"x":307.4836, "y":-213.2668, "z":58.0192}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":307.4836, "y":-213.2668, "z":58.0192}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(98, 'MotelPinckage15', 'Room', '{"x":309.5486, "y":-207.9482, "z":58.0192}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":309.5486, "y":-207.9482, "z":58.0192}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(99, 'MotelPinckage16', 'Room', '{"x":311.2804, "y":-203.4071, "z":58.0192}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":311.2804, "y":-203.4071, "z":58.0192}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(100, 'MotelPinckage17', 'Room', '{"x":313.2985, "y":-198.0486, "z":58.0192}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":313.2985, "y":-198.0486, "z":58.0192}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(101, 'MotelPinckage18', 'Room', '{"x":315.6986, "y":-194.7650, "z":58.0192}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":315.6986, "y":-194.7650, "z":58.0192}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(102, 'MotelPinckage19', 'Room', '{"x":319.3502, "y":-196.1419, "z":58.0192}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":319.3502, "y":-196.1419, "z":58.0192}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(103, 'MotelPinckage20', 'Room', '{"x":321.4276, "y":-196.9552, "z":58.0192}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":321.4276, "y":-196.9552, "z":58.0192}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(104, 'MotelPinckage21', 'Room', '{"x":329.4300, "y":-225.0200, "z":54.2200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":329.4300, "y":-225.0200, "z":54.2200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(105, 'MotelPinckage22', 'Room', '{"x":331.4400, "y":-225.9700, "z":54.2200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":331.4400, "y":-225.9700, "z":54.2200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(106, 'MotelPinckage23', 'Room', '{"x":334.9700, "y":-227.3600, "z":54.2200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":334.9700, "y":-227.3600, "z":54.2200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(107, 'MotelPinckage24', 'Room', '{"x":337.0900, "y":-224.8100, "z":54.2200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":337.0900, "y":-224.8100, "z":54.2200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(108, 'MotelPinckage25', 'Room', '{"x":339.2100, "y":-219.4500, "z":54.2200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":339.2100, "y":-219.4500, "z":54.2200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(109, 'MotelPinckage26', 'Room', '{"x":340.8000, "y":-214.8900, "z":54.2200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":340.8000, "y":-214.8900, "z":54.2200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(110, 'MotelPinckage27', 'Room', '{"x":342.8800, "y":-209.6000, "z":54.2200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":342.8800, "y":-209.6000, "z":54.2200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(111, 'MotelPinckage28', 'Room', '{"x":344.5900, "y":-205.0100, "z":54.2200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":344.5900, "y":-205.0100, "z":54.2200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(112, 'MotelPinckage29', 'Room', '{"x":346.8100, "y":-199.7300, "z":54.2200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":346.8100, "y":-199.7300, "z":54.2200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(113, 'MotelPinckage30', 'Room', '{"x":329.4300, "y":-225.0200, "z":58.0200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":329.4300, "y":-225.0200, "z":58.0200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(114, 'MotelPinckage31', 'Room', '{"x":331.4400, "y":-225.9700, "z":58.0200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":331.4400, "y":-225.9700, "z":58.0200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(115, 'MotelPinckage32', 'Room', '{"x":334.9700, "y":-227.3600, "z":58.0200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":334.9700, "y":-227.3600, "z":58.0200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(116, 'MotelPinckage33', 'Room', '{"x":337.0900, "y":-224.8100, "z":58.0200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":337.0900, "y":-224.8100, "z":58.0200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(117, 'MotelPinckage34', 'Room', '{"x":339.2100, "y":-219.4500, "z":58.0200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":339.2100, "y":-219.4500, "z":58.0200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(118, 'MotelPinckage35', 'Room', '{"x":340.8000, "y":-214.8900, "z":58.0200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":340.8000, "y":-214.8900, "z":58.0200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(119, 'MotelPinckage36', 'Room', '{"x":342.8800, "y":-209.6000, "z":58.0200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":342.8800, "y":-209.6000, "z":58.0200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(120, 'MotelPinckage37', 'Room', '{"x":344.5900, "y":-205.0100, "z":58.0200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":344.5900, "y":-205.0100, "z":58.0200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000),
	(121, 'MotelPinckage39', 'Room', '{"x":346.8100, "y":-199.7300, "z":58.0200}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x": 151.5297,"y": -1007.13, "z": -100.0088}', '{"x":346.8100, "y":-199.7300, "z":58.0200}', '[]', NULL, 1, 1, 1, '{"x":151.5297,"y":-1003.253,"z":-100.008}', 1000);

-- Dumping structure for table skuadcity.rented_vehicles
DROP TABLE IF EXISTS `rented_vehicles`;
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.rented_vehicles: ~0 rows (approximately)

-- Dumping structure for table skuadcity.sec_jobs
DROP TABLE IF EXISTS `sec_jobs`;
CREATE TABLE IF NOT EXISTS `sec_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `firstJob` varchar(50) DEFAULT NULL,
  `firstJobLabel` varchar(50) DEFAULT NULL,
  `firstGrade` int(11) DEFAULT 0,
  `secJob` varchar(50) DEFAULT NULL,
  `secJobLabel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.sec_jobs: ~0 rows (approximately)

-- Dumping structure for table skuadcity.shops
DROP TABLE IF EXISTS `shops`;
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `inventory` varchar(255) DEFAULT NULL,
  `price_items` varchar(255) DEFAULT NULL,
  `bank_saves` int(11) DEFAULT NULL,
  `store_label` varchar(255) NOT NULL DEFAULT '0',
  `store_location` varchar(255) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT 0,
  `expired` varchar(255) DEFAULT NULL,
  `isSales` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.shops: ~8 rows (approximately)
REPLACE INTO `shops` (`id`, `owner`, `inventory`, `price_items`, `bank_saves`, `store_label`, `store_location`, `price`, `expired`, `isSales`) VALUES
	(1, '{"identifier":"steam:","name":"Pemerintah"}', '', '', 0, 'TwentyFourSeven 1', '{"x":373.8, "y":325.8, "z":102.5}', 50000, '', 0),
	(2, '{"identifier":"steam:","name":"Pemerintah"}', '', NULL, 0, 'TwentyFourSeven 2', '{"x":2557.4, "y":382.2, "z":107.6}', 50000, NULL, 0),
	(3, '{"identifier":"steam:","name":"Pemerintah"}', '', NULL, 0, 'TwentyFourSeven 3', '{"x":-3038.9, "y":585.9, "z":6.9}', 50000, NULL, 0),
	(4, '{"identifier":"steam:","name":"Pemerintah"}', '', NULL, 0, 'TwentyFourSeven 4', '{"x":-3241.9, "y":1001.4, "z":11.8}', 50000, NULL, 0),
	(5, '{"identifier":"steam:","name":"Pemerintah"}', '', NULL, 0, 'TwentyFourSeven 5', '{"x":547.4, "y":2671.7, "z":41.1}', 50000, NULL, 0),
	(6, '{"identifier":"steam:","name":"Pemerintah"}', '', NULL, 0, 'TwentyFourSeven 6', '{"x":1961.4, "y":3740.6, "z":31.3}', 50000, NULL, 0),
	(7, '{"identifier":"steam:","name":"Pemerintah"}', '', NULL, 0, 'TwentyFourSeven 7', '{"x":2678.9, "y":3280.6, "z":54.2}', 50000, NULL, 0),
	(8, '{"identifier":"steam:","name":"Pemerintah"}', '', NULL, 0, 'TwentyFourSeven 8', '{"x":1729.2, "y":6414.1, "z":34.0}', 50000, NULL, 0);

-- Dumping structure for table skuadcity.society_moneywash
DROP TABLE IF EXISTS `society_moneywash`;
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.society_moneywash: ~0 rows (approximately)

-- Dumping structure for table skuadcity.trunk_inventory
DROP TABLE IF EXISTS `trunk_inventory`;
CREATE TABLE IF NOT EXISTS `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.trunk_inventory: ~0 rows (approximately)

-- Dumping structure for table skuadcity.twitter_accounts
DROP TABLE IF EXISTS `twitter_accounts`;
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.twitter_accounts: ~0 rows (approximately)

-- Dumping structure for table skuadcity.twitter_likes
DROP TABLE IF EXISTS `twitter_likes`;
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table skuadcity.twitter_likes: ~0 rows (approximately)

-- Dumping structure for table skuadcity.twitter_tweets
DROP TABLE IF EXISTS `twitter_tweets`;
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) DEFAULT NULL,
  `message` varchar(256) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.twitter_tweets: ~0 rows (approximately)

-- Dumping structure for table skuadcity.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(40) NOT NULL,
  `name` longtext DEFAULT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(64) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(32) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `crafting_level` int(11) NOT NULL,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `is_dead` tinyint(1) DEFAULT 0,
  `is_male` int(11) DEFAULT 1,
  `accessories` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `last_property` varchar(255) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `starterpack` int(1) NOT NULL DEFAULT 0,
  `rp_xp` int(11) NOT NULL DEFAULT 0,
  `rp_rank` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `index_users_phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.users: ~0 rows (approximately)

-- Dumping structure for table skuadcity.user_contacts
DROP TABLE IF EXISTS `user_contacts`;
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_contacts_identifier_name_number` (`identifier`,`name`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.user_contacts: ~0 rows (approximately)

-- Dumping structure for table skuadcity.user_documents
DROP TABLE IF EXISTS `user_documents`;
CREATE TABLE IF NOT EXISTS `user_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(45) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.user_documents: ~0 rows (approximately)

-- Dumping structure for table skuadcity.user_licenses
DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  `expired` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.user_licenses: ~0 rows (approximately)

-- Dumping structure for table skuadcity.user_parkings
DROP TABLE IF EXISTS `user_parkings`;
CREATE TABLE IF NOT EXISTS `user_parkings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.user_parkings: ~0 rows (approximately)

-- Dumping structure for table skuadcity.vehicles
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.vehicles: ~11 rows (approximately)
REPLACE INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Asea', 'asea', 5500, 'sedans'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('F620', 'f620', 40000, 'coupes'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Z190', 'z190', 90000, 'sportsclassics');

-- Dumping structure for table skuadcity.vehicle_categories
DROP TABLE IF EXISTS `vehicle_categories`;
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.vehicle_categories: ~11 rows (approximately)
REPLACE INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupés'),
	('motorcycles', 'Motor'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');

-- Dumping structure for table skuadcity.vehicle_sold
DROP TABLE IF EXISTS `vehicle_sold`;
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.vehicle_sold: ~0 rows (approximately)

-- Dumping structure for table skuadcity.weashops
DROP TABLE IF EXISTS `weashops`;
CREATE TABLE IF NOT EXISTS `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table skuadcity.weashops: ~40 rows (approximately)
REPLACE INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
	(1, 'GunShop', 'WEAPON_PISTOL', 300),
	(2, 'BlackWeashop', 'WEAPON_PISTOL', 500),
	(3, 'GunShop', 'WEAPON_FLASHLIGHT', 60),
	(4, 'BlackWeashop', 'WEAPON_FLASHLIGHT', 70),
	(5, 'GunShop', 'WEAPON_MACHETE', 90),
	(6, 'BlackWeashop', 'WEAPON_MACHETE', 110),
	(7, 'GunShop', 'WEAPON_NIGHTSTICK', 150),
	(8, 'BlackWeashop', 'WEAPON_NIGHTSTICK', 150),
	(9, 'GunShop', 'WEAPON_BAT', 100),
	(10, 'BlackWeashop', 'WEAPON_BAT', 100),
	(11, 'GunShop', 'WEAPON_STUNGUN', 50),
	(12, 'BlackWeashop', 'WEAPON_STUNGUN', 50),
	(13, 'GunShop', 'WEAPON_MICROSMG', 1400),
	(14, 'BlackWeashop', 'WEAPON_MICROSMG', 1700),
	(15, 'GunShop', 'WEAPON_PUMPSHOTGUN', 3400),
	(16, 'BlackWeashop', 'WEAPON_PUMPSHOTGUN', 3500),
	(17, 'GunShop', 'WEAPON_ASSAULTRIFLE', 10000),
	(18, 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', 11000),
	(19, 'GunShop', 'WEAPON_SPECIALCARBINE', 15000),
	(20, 'BlackWeashop', 'WEAPON_SPECIALCARBINE', 16500),
	(21, 'GunShop', 'WEAPON_SNIPERRIFLE', 22000),
	(22, 'BlackWeashop', 'WEAPON_SNIPERRIFLE', 24000),
	(23, 'GunShop', 'WEAPON_FIREWORK', 18000),
	(24, 'BlackWeashop', 'WEAPON_FIREWORK', 20000),
	(25, 'GunShop', 'WEAPON_GRENADE', 500),
	(26, 'BlackWeashop', 'WEAPON_GRENADE', 650),
	(27, 'GunShop', 'WEAPON_BZGAS', 200),
	(28, 'BlackWeashop', 'WEAPON_BZGAS', 350),
	(29, 'GunShop', 'WEAPON_FIREEXTINGUISHER', 100),
	(30, 'BlackWeashop', 'WEAPON_FIREEXTINGUISHER', 100),
	(31, 'GunShop', 'WEAPON_BALL', 50),
	(32, 'BlackWeashop', 'WEAPON_BALL', 50),
	(33, 'GunShop', 'WEAPON_SMOKEGRENADE', 100),
	(34, 'BlackWeashop', 'WEAPON_SMOKEGRENADE', 100),
	(35, 'BlackWeashop', 'WEAPON_APPISTOL', 1100),
	(36, 'BlackWeashop', 'WEAPON_CARBINERIFLE', 12000),
	(37, 'BlackWeashop', 'WEAPON_HEAVYSNIPER', 30000),
	(38, 'BlackWeashop', 'WEAPON_MINIGUN', 45000),
	(39, 'BlackWeashop', 'WEAPON_RAILGUN', 50000),
	(40, 'BlackWeashop', 'WEAPON_STICKYBOMB', 500);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
