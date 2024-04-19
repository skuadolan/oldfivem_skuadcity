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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.addon_account: ~10 rows (approximately)
REPLACE INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Tabungan Bank', 0),
	('caution', 'Peringatan', 0),
	('property_black_money', 'Uang Kotor', 0),
	('society_ambulance', 'EMS', 1),
	('society_banker', 'Bank', 1),
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
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.addon_account_data: ~7 rows (approximately)
REPLACE INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(10, 'society_cardealer', 0, NULL),
	(11, 'society_police', 0, NULL),
	(12, 'society_ambulance', 0, NULL),
	(13, 'society_mechanic', 0, NULL),
	(14, 'society_taxi', 0, NULL),
	(15, 'society_banker', 0, NULL),
	(16, 'society_realestateagent', 0, NULL);

-- Dumping structure for table skuadcity.addon_inventory
DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.addon_inventory_items: ~0 rows (approximately)

-- Dumping structure for table skuadcity.banking
DROP TABLE IF EXISTS `banking`;
CREATE TABLE IF NOT EXISTS `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table skuadcity.banking: ~0 rows (approximately)

-- Dumping structure for table skuadcity.billing
DROP TABLE IF EXISTS `billing`;
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.billing: ~0 rows (approximately)

-- Dumping structure for table skuadcity.cardealer_vehicles
DROP TABLE IF EXISTS `cardealer_vehicles`;
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.cardealer_vehicles: ~0 rows (approximately)

-- Dumping structure for table skuadcity.datastore
DROP TABLE IF EXISTS `datastore`;
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

-- Dumping structure for table skuadcity.datastore_data
DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.datastore_data: ~5 rows (approximately)
REPLACE INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_police', NULL, '{}'),
	(2, 'society_ambulance', NULL, '{}'),
	(3, 'society_mechanic', NULL, '{}'),
	(4, 'society_taxi', NULL, '{}'),
	(5, 'property', NULL, '{}');

-- Dumping structure for table skuadcity.fine_types
DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.fine_types: ~52 rows (approximately)
REPLACE INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(53, 'Bermain Klakson', 30, 0),
	(54, 'Melintasi Garis Secara Ilegal', 40, 0),
	(55, 'Mengemudi di sisi jalan yang salah', 250, 0),
	(56, 'Putar Balik Ilegal', 250, 0),
	(57, 'Mengemudi di Luar Jalan Raya Secara Ilegal', 170, 0),
	(58, 'Menolak Perintah yang Sah', 30, 0),
	(59, 'Menghentikan Kendaraan Secara Ilegal', 150, 0),
	(60, 'Parkir Ilegal', 70, 0),
	(61, 'Gagal berbelok ke kanan', 70, 0),
	(62, 'Kegagalan untuk mematuhi Informasi Kendaraan', 90, 0),
	(63, 'Gagal berhenti di Rambu Berhenti', 105, 0),
	(64, 'Gagal berhenti di Lampu Merah', 130, 0),
	(65, 'Mendahului Ilegal', 100, 0),
	(66, 'Mengemudikan Kendaraan Ilegal', 100, 0),
	(67, 'Mengemudi tanpa Surat Izin Mengemudi', 1500, 0),
	(68, 'Tabrak Lari', 800, 0),
	(69, 'Melebihi Kecepatan Lebih dari 50 kmph', 90, 0),
	(70, 'Melebihi Kecepatan Lebih dari 90 kmph', 120, 0),
	(71, 'Melebihi Kecepatan Lebih dari 100 kmph', 180, 0),
	(72, 'Melebihi Kecepatan Lebih dari 120 kmph', 300, 0),
	(73, 'Menghambat arus lalu lintas', 110, 1),
	(74, 'Meracuni Warga Sipil', 90, 1),
	(75, 'Perilaku tidak tertib', 90, 1),
	(76, 'Menghalangi Keadilan (f Justice)', 130, 1),
	(77, 'Penghinaan terhadap Warga Sipil', 75, 1),
	(78, 'Tidak menghormati seorang LEO', 110, 1),
	(79, 'Ancaman Verbal terhadap Sipil', 90, 1),
	(80, 'Ancaman Verbal terhadap LEO', 150, 1),
	(81, 'Memberikan Informasi Palsu', 250, 1),
	(82, 'Percobaan Korupsi', 1500, 1),
	(83, 'Mengacung-acungkan senjata di dalam batas kota', 120, 2),
	(84, 'Mengacungkan Senjata Mematikan di Batas Kota', 300, 2),
	(85, 'Tidak Memiliki Izin Kepemilikan Senjata Api', 600, 2),
	(86, 'Kepemilikan Senjata Ilegal', 700, 2),
	(87, 'Kepemilikan Alat Pencurian', 300, 2),
	(88, 'Grand Theft Auto', 1800, 2),
	(89, 'Berniat Menjual/Mengedarkan Zat Ilegal', 1500, 2),
	(90, 'Pembuatan Zat Ilegal', 1500, 2),
	(91, 'Kepemilikan Zat Terlarang', 650, 2),
	(92, 'Penculikan seorang warga sipil', 1500, 2),
	(93, 'Penculikan seorang LEO', 2000, 2),
	(94, 'Perampokan', 650, 2),
	(95, 'Perampokan Bersenjata di Sebuah Toko', 650, 2),
	(96, 'Perampokan Bersenjata di Bank', 1500, 2),
	(97, 'Penyerangan terhadap Warga Sipil', 2000, 3),
	(98, 'Penyerangan seorang LEO', 2500, 3),
	(99, 'Percobaan Pembunuhan Terhadap Warga Sipil', 3000, 3),
	(100, 'Percobaan Pembunuhan terhadap seorang LEO', 5000, 3),
	(101, 'Pembunuhan Warga Sipil', 10000, 3),
	(102, 'Pembunuhan seorang LEO', 30000, 3),
	(103, 'Pembunuhan tidak disengaja', 1800, 3),
	(104, 'Penipuan', 2000, 2);

-- Dumping structure for table skuadcity.items
DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.items: ~79 rows (approximately)
REPLACE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('accu', 'Batre Aki', 1, 0, 1),
	('alcohol', 'Alkohol', 0, 0, 0),
	('alive_chicken', 'Ayam hidup', 1, 0, 1),
	('alumunium', 'Alumunium', 0, 0, 0),
	('antibiotics', 'Antibiotik', 0, 0, 0),
	('bait', 'Cacing', 1, 0, 1),
	('bandage', 'Perban', 2, 0, 1),
	('betadine', 'Obat Betadine', 1, 0, 1),
	('blackmoney', 'Uang Kotor', 1, 0, 1),
	('black_money', 'Uang Kotor', 1, 0, 1),
	('blowpipe', 'Alat Las', 2, 0, 1),
	('botol', 'Botol', 0, 0, 0),
	('bread', 'Roti', 1, 0, 1),
	('bubuk_arang', 'Bubuk Arang', 1, 0, 1),
	('bullet', 'Peluru', 1, 0, 1),
	('bullet_box', 'Kotak Peluru', 0, 0, 0),
	('bullet_casing', 'Slongsong Peluru', 1, 0, 1),
	('cannabis', 'Ganja Kotor', 3, 0, 1),
	('carbon_fiber', 'Carbon Fiber', 0, 0, 0),
	('carokit', 'Dempul Mobil', 3, 0, 1),
	('carotool', 'Peralatan', 2, 0, 1),
	('charcoal', 'Arang', 0, 0, 0),
	('clip', 'Ammo', 1, 0, 1),
	('clothe', 'Kain Kasar', 1, 0, 1),
	('coal', 'Batu Bara', 1, 0, 1),
	('copper', 'Tembaga', 1, 0, 1),
	('cotton', 'Kapas', 0, 0, 0),
	('cutted_wood', 'Potong kayu', 1, 0, 1),
	('diamond', 'Berlian', 1, 0, 1),
	('driver', 'SIM', 1, 0, 1),
	('essence', 'Gas', 1, 0, 1),
	('fabric', 'Kain Halus', 1, 0, 1),
	('fish', 'Ikan', 1, 0, 1),
	('fishbait', 'Ikan Palsu', 1, 0, 1),
	('fishingrod', 'Joran Pancing', 1, 0, 1),
	('fixkit', 'Peralatan Perbaikan', 3, 0, 1),
	('fixtool', 'Perkakas Perbaikan', 2, 0, 1),
	('gauze', 'Kain Kasa', 0, 0, 0),
	('gazbottle', 'Botol Gas', 2, 0, 1),
	('getah_karet', 'Getah Karet', 0, 0, 0),
	('glue', 'Lem', 0, 0, 0),
	('gold', 'Emas', 1, 0, 1),
	('gps', 'Peta', 1, 0, 1),
	('gunpowder', 'Bubuk Misiu', 1, 0, 1),
	('hands_glove', 'Sarung Tangan', 0, 0, 0),
	('iron', 'Besi', 1, 0, 1),
	('kanebo', 'Kanebo', 0, 0, 0),
	('kertas_bungkus', 'Kertas Bungkus', 0, 0, 0),
	('ktp', 'KTP', 1, 0, 1),
	('marijuana', 'Ganja Steril', 2, 0, 1),
	('meat', 'Daging Mentah', 1, 0, 1),
	('medikit', 'Kotak P3K', 2, 0, 1),
	('meth_processing', 'Lisensi Farmasi', 1, 0, 1),
	('money', 'Uang', 1, 0, 1),
	('oil', 'Oli', 0, 0, 0),
	('packaged_chicken', 'Fillet ayam', 1, 0, 1),
	('packaged_plank', 'Paket Kayu', 1, 0, 1),
	('papper', 'Kertas', 0, 0, 0),
	('petrol', 'Minyak', 1, 0, 1),
	('petrol_raffin', 'Minyak olahan', 1, 0, 1),
	('phone', 'Handphone', 1, 0, 1),
	('plastik', 'Plastik', 0, 0, 0),
	('potassium_nitrate', 'Kalium Nitrat', 0, 0, 0),
	('radio', 'Radio', 1, 0, 1),
	('rubber', 'Karet', 0, 0, 0),
	('screwdriver', 'Obeng', 0, 0, 0),
	('slaughtered_chicken', 'Ayam potong', 1, 0, 1),
	('stainless_steel', 'Stainless Steel', 1, 0, 1),
	('sterile_gloves', 'Sarung Tangan Steril', 0, 0, 0),
	('stone', 'Batu', 1, 0, 1),
	('sulfur', 'Belerang', 0, 0, 0),
	('tuna', 'Tuna', 1, 0, 1),
	('washed_stone', 'Batu Bersih', 1, 0, 1),
	('water', 'Air', 1, 0, 1),
	('weapon', 'Lisensi Senjata', 1, 0, 1),
	('weed_processing', 'Lisensi Narkoba', 1, 0, 1),
	('wood', 'Kayu', 1, 0, 1),
	('wool', 'Wol', 1, 0, 1),
	('workshop_key', 'Kunci Bengkel', 0, 0, 0);

-- Dumping structure for table skuadcity.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.jobs: ~20 rows (approximately)
REPLACE INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 1),
	('banker', 'Banker', 1),
	('cardealer', 'Cardealer', 1),
	('fisherman', 'Nelayan', 0),
	('fueler', 'Penambang Minyak', 0),
	('lumberjack', 'Tukang Kayu', 0),
	('mechanic', 'Mekanik', 1),
	('miner', 'Penambang Batu', 0),
	('offambulance', 'Off EMS', 1),
	('offbanker', 'Off Banker', 1),
	('offcardealer', 'Off Cardealer', 1),
	('offmechanic', 'Off Mekanik', 1),
	('offpedagang', 'Off Pedagang', 1),
	('offpolice', 'Off Polisi', 1),
	('offtaxi', 'Taksi', 1),
	('police', 'Polisi', 1),
	('slaughterer', 'Tukang Ayam', 0),
	('tailor', 'Penjahit', 0),
	('taxi', 'Taksi', 1),
	('unemployed', 'Warga', 0);

-- Dumping structure for table skuadcity.job_grades
DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.job_grades: ~90 rows (approximately)
REPLACE INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(41, 'unemployed', 0, 'unemployed', 'Pengangguran', 1000, '{}', '{}'),
	(42, 'banker', 0, 'advisor', 'Advisor', 250, '{}', '{}'),
	(43, 'banker', 1, 'banker', 'Banker', 300, '{}', '{}'),
	(44, 'banker', 2, 'business_banker', 'Investment banker', 450, '{}', '{}'),
	(45, 'banker', 3, 'trader', 'Trader', 570, '{}', '{}'),
	(46, 'banker', 4, 'boss', 'Boss', 650, '{}', '{}'),
	(47, 'cardealer', 0, 'recruit', 'Recruit', 250, '{}', '{}'),
	(48, 'cardealer', 1, 'novice', 'Novice', 300, '{}', '{}'),
	(49, 'cardealer', 2, 'wakil_boss', 'Experienced', 450, '{}', '{}'),
	(50, 'cardealer', 3, 'boss', 'Boss', 570, '{}', '{}'),
	(51, 'ambulance', 0, 'asisten_perawat', 'Asisten Perawat', 250, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(52, 'ambulance', 1, 'perawat', 'Perawat', 300, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":42,"torso_2":0,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":85,"face":19,"decals_1":57,"torso_1":249,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(53, 'ambulance', 2, 'asisten_doctor', 'Asisten Dokter', 450, '{"tshirt_2":3,"hair_color_1":5,"glasses_2":3,"shoes":42,"torso_2":1,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":63,"helmet_1":8,"helmet_2":0,"arms":86,"face":19,"decals_1":57,"torso_1":140,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(54, 'ambulance', 3, 'chief_doctor', 'Dokter', 570, '{}', '{}'),
	(55, 'ambulance', 4, 'wakil_boss', 'Wakil Direktur', 650, '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes":65,"shoes_2":3,"chain_2":3,"chain_2":3,"torso_2":1,"hair_color_2":0,"pants_1":52,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":34,"helmet_1":8,"helmet_2":0,"arms":86,"face":19,"decals_1":57,"torso_1":101,"hair_2":0,"skin":34,"pants_2":0}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(56, 'ambulance', 5, 'boss', 'Direktur', 735, '{"tshirt_1":34,"tshirt_2":4,"torso_1":101,"torso_2":2,"decals_1":57,"decals_2":0,"arms":93,"pants_1":83,"pants_2":0,"shoes_1":32,"shoes_2":7,"chain_1":92,"chain_2":1}', '{}'),
	(57, 'mechanic', 0, 'recrue', 'Magang', 250, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":71,"torso_2":0,"hair_color_2":0,"pants_1":39,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":53,"face":19,"decals_1":0,"torso_1":66,"hair_2":0,"skin":34,"pants_2":0}', '{}'),
	(58, 'mechanic', 1, 'novice', 'Amatir', 300, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":71,"torso_2":1,"hair_color_2":0,"pants_1":39,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":53,"face":19,"decals_1":0,"torso_1":66,"hair_2":0,"skin":34,"pants_2":1}', '{}'),
	(59, 'mechanic', 2, 'experimente', 'Ahli', 450, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":71,"torso_2":2,"hair_color_2":0,"pants_1":39,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":53,"face":19,"decals_1":0,"torso_1":66,"hair_2":0,"skin":34,"pants_2":2}', '{}'),
	(60, 'mechanic', 3, 'wakil_boss', 'Wakil Bos', 570, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":48,"torso_2":15,"hair_color_2":0,"pants_1":91,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":31,"face":19,"decals_1":0,"torso_1":248,"hair_2":0,"skin":34,"pants_2":0}', '{}'),
	(61, 'mechanic', 4, 'boss', 'Bos', 650, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":48,"torso_2":15,"hair_color_2":0,"pants_1":91,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":31,"face":19,"decals_1":0,"torso_1":248,"hair_2":0,"skin":34,"pants_2":0}', '{}'),
	(62, 'taxi', 0, 'recrue', 'Recrue', 250, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(63, 'taxi', 1, 'novice', 'Novice', 300, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(64, 'taxi', 2, 'experimente', 'Experimente', 450, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(65, 'taxi', 3, 'wakil_boss', 'Uber', 570, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(66, 'taxi', 4, 'boss', 'Patron', 650, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(67, 'police', 0, 'tamtama', 'Tamtama', 250, '{}', '{}'),
	(68, 'police', 1, 'bripda', 'Bripda', 300, '{}', '{}'),
	(69, 'police', 2, 'briptu', 'Briptu', 450, '{}', '{}'),
	(70, 'police', 3, 'brigpol', 'Brigpol', 570, '{}', '{}'),
	(71, 'police', 4, 'bripka', 'Bripka', 650, '{}', '{}'),
	(72, 'police', 5, 'aipda', 'Aipda', 710, '{}', '{}'),
	(73, 'police', 6, 'aiptu', 'Aiptu', 775, '{}', '{}'),
	(74, 'police', 7, 'ipda', 'Ipda', 810, '{}', '{}'),
	(75, 'police', 8, 'iptu', 'Iptu', 845, '{}', '{}'),
	(76, 'police', 9, 'akp', 'Akp', 890, '{}', '{}'),
	(77, 'police', 10, 'kompol', 'Kompol', 935, '{}', '{}'),
	(78, 'police', 11, 'akbp', 'Akbp', 985, '{}', '{}'),
	(79, 'police', 12, 'brigjen', 'Brigjen', 1010, '{}', '{}'),
	(80, 'police', 13, 'irjen', 'Irjen', 1075, '{}', '{}'),
	(81, 'police', 14, 'wakil_boss', 'Komjen', 1135, '{}', '{}'),
	(82, 'police', 15, 'boss', 'Jendral', 1195, '{}', '{}'),
	(83, 'lumberjack', 0, 'employee', 'Amatir', 300, '{"tshirt_1":15, "torso_1":61, "arms":27, "pants_1":9, "shoes_1":12, "helmet_1":20}', '{}'),
	(84, 'fisherman', 0, 'employee', 'Amatir', 300, '{"tshirt_1":15, "torso_1":9, "arms":30, "pants_1": 15, "shoes_1":16, "helmet_1":20}', '{}'),
	(85, 'fueler', 0, 'employee', 'Amatir', 300, '{"tshirt_1":15, "torso_1":44, "torso_2":3, "arms":30, "pants_1": 15, "shoes_1":12, "shoes_2":6, "helmet_1":20}', '{}'),
	(86, 'tailor', 0, 'employee', 'Employee', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(87, 'miner', 0, 'employee', 'Amatir', 300, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(88, 'slaughterer', 0, 'employee', 'Amatir', 300, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(89, 'reporter', 1, 'employee', 'Amatir', 300, '{}', '{}'),
	(90, 'offcardealer', 0, 'recruit', 'Recruit', 0, '{}', '{}'),
	(91, 'offcardealer', 1, 'novice', 'Novice', 0, '{}', '{}'),
	(92, 'offcardealer', 2, 'wakil_boss', 'Experienced', 0, '{}', '{}'),
	(93, 'offcardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(94, 'offambulance', 0, 'asisten_perawat', 'Asisten Perawat', 0, '{}', '{}'),
	(95, 'offambulance', 1, 'perawat', 'Perawat', 0, '{}', '{}'),
	(96, 'offambulance', 2, 'asisten_doctor', 'Asisten Dokter', 0, '{}', '{}'),
	(97, 'offambulance', 3, 'chief_doctor', 'Dokter', 0, '{}', '{}'),
	(98, 'offambulance', 4, 'wakil_boss', 'Wakil Direktur', 0, '{}', '{}'),
	(99, 'offambulance', 5, 'boss', 'Direktur', 0, '{}', '{}'),
	(100, 'offmechanic', 0, 'recrue', 'Magang', 0, '{}', '{}'),
	(101, 'offmechanic', 1, 'novice', 'Amatir', 0, '{}', '{}'),
	(102, 'offmechanic', 2, 'experimente', 'Ahli', 0, '{}', '{}'),
	(103, 'offmechanic', 3, 'wakil_boss', 'Wakil Bos', 0, '{}', '{}'),
	(104, 'offmechanic', 4, 'boss', 'Bos', 0, '{}', '{}'),
	(105, 'offtaxi', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(106, 'offtaxi', 1, 'novice', 'Novice', 0, '{}', '{}'),
	(107, 'offtaxi', 2, 'experimente', 'Experimente', 0, '{}', '{}'),
	(108, 'offtaxi', 3, 'wakil_boss', 'Uber', 0, '{}', '{}'),
	(109, 'offtaxi', 4, 'boss', 'Patron', 0, '{}', '{}'),
	(110, 'offpolice', 0, 'tamtama', 'Tamtama', 0, '{}', '{}'),
	(111, 'offpolice', 1, 'bripda', 'Bripda', 0, '{}', '{}'),
	(112, 'offpolice', 2, 'briptu', 'Briptu', 0, '{}', '{}'),
	(113, 'offpolice', 3, 'brigpol', 'Brigpol', 0, '{}', '{}'),
	(114, 'offpolice', 4, 'bripka', 'Bripka', 0, '{}', '{}'),
	(115, 'offpolice', 5, 'aipda', 'Aipda', 0, '{}', '{}'),
	(116, 'offpolice', 6, 'aiptu', 'Aiptu', 0, '{}', '{}'),
	(117, 'offpolice', 7, 'ipda', 'Ipda', 0, '{}', '{}'),
	(118, 'offpolice', 8, 'iptu', 'Iptu', 0, '{}', '{}'),
	(119, 'offpolice', 9, 'akp', 'Akp', 0, '{}', '{}'),
	(120, 'offpolice', 10, 'kompol', 'Kompol', 0, '{}', '{}'),
	(121, 'offpolice', 11, 'akbp', 'Akbp', 0, '{}', '{}'),
	(122, 'offpolice', 12, 'brigjen', 'Brigjen', 0, '{}', '{}'),
	(123, 'offpolice', 13, 'irjen', 'Irjen', 0, '{}', '{}'),
	(124, 'offpolice', 14, 'wakil_boss', 'Komjen', 0, '{}', '{}'),
	(125, 'offpolice', 15, 'boss', 'Jendral', 0, '{}', '{}'),
	(126, 'offbanker', 0, 'advisor', 'Advisor', 0, '{}', '{}'),
	(127, 'offbanker', 1, 'banker', 'Banker', 0, '{}', '{}'),
	(128, 'offbanker', 2, 'business_banker', 'Investment banker', 0, '{}', '{}'),
	(129, 'offbanker', 3, 'trader', 'Trader', 0, '{}', '{}'),
	(130, 'offbanker', 4, 'boss', 'Boss', 0, '{}', '{}');

-- Dumping structure for table skuadcity.licenses
DROP TABLE IF EXISTS `licenses`;
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.licenses: ~8 rows (approximately)
REPLACE INTO `licenses` (`type`, `label`) VALUES
	('boat', 'SIM Kapal'),
	('dmv', 'Surat Ujian SIM'),
	('drive', 'SIM Mobil'),
	('drive_bike', 'SIM Motor'),
	('drive_truck', 'SIM Truk'),
	('meth_processing', 'Lisensi Obat'),
	('weapon', 'Lisensi Senjata'),
	('weed_processing', 'Lisensi Narkoba');

-- Dumping structure for table skuadcity.multicharacter_slots
DROP TABLE IF EXISTS `multicharacter_slots`;
CREATE TABLE IF NOT EXISTS `multicharacter_slots` (
  `identifier` varchar(46) NOT NULL,
  `slots` int(11) NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `slots` (`slots`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.multicharacter_slots: ~0 rows (approximately)

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
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  `mileage` float DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.owned_vehicles: ~0 rows (approximately)

-- Dumping structure for table skuadcity.rented_vehicles
DROP TABLE IF EXISTS `rented_vehicles`;
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `identifier` varchar(46) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.society_moneywash: ~0 rows (approximately)

-- Dumping structure for table skuadcity.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` longtext DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `phone_number` varchar(20) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `starterpack` int(1) NOT NULL DEFAULT 0,
  `rp_xp` int(11) NOT NULL DEFAULT 0,
  `rp_rank` int(11) NOT NULL DEFAULT 0,
  `crafting_level` int(11) NOT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.users: ~0 rows (approximately)

-- Dumping structure for table skuadcity.user_licenses
DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.user_licenses: ~0 rows (approximately)

-- Dumping structure for table skuadcity.vehicles
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.vehicle_sold: ~0 rows (approximately)

-- Dumping structure for table skuadcity.whitelist
DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(46) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table skuadcity.whitelist: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
