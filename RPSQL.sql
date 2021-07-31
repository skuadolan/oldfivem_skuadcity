-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.9-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for fixall
CREATE DATABASE IF NOT EXISTS `fixall` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fixall`;

-- Dumping structure for table fixall.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.addon_account: ~20 rows (approximately)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('caution', 'Caution', 0),
	('motels_bed_black_money', 'Motels Black Money Bed', 0),
	('motels_black_money', 'Motels Black Money ', 0),
	('property_black_money', 'Argent Sale Propriété', 0),
	('society_ambulance', 'Ambulance', 1),
	('society_biker', 'Biker', 1),
	('society_biker_black_money', 'BIKER BLACK MONEY', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_cartel', 'Cartel', 1),
	('society_cartel_black_money', 'CARTEL BLACK MONEY', 1),
	('society_gang', 'Gangster', 1),
	('society_gang_black_money', 'GANG BLACK MONEY', 1),
	('society_mafia', 'Mafia', 1),
	('society_mafia_black_money', 'MAFIA BLACK MONEY', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_pedagang', 'Pedagang', 1),
	('society_police', 'Police', 1),
	('society_police_black_money', 'POLICE BLACK MONEY', 1),
	('society_taxi', 'Taxi', 1),
	('society_theb', 'theb', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumping structure for table fixall.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.addon_account_data: ~21 rows (approximately)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_ambulance', 0, NULL),
	(2, 'society_biker', 0, NULL),
	(3, 'society_cardealer', 0, NULL),
	(4, 'society_cartel', 0, NULL),
	(5, 'society_gang', 0, NULL),
	(6, 'society_mafia', 0, NULL),
	(7, 'society_mechanic', 0, NULL),
	(8, 'society_pedagang', 0, NULL),
	(9, 'society_police', 0, NULL),
	(10, 'society_theb', 0, NULL),
	(11, 'police_black_money', 0, NULL),
	(12, 'society_biker_black_money', 0, NULL),
	(13, 'society_cartel_black_money', 0, NULL),
	(14, 'society_gang_black_money', 0, NULL),
	(15, 'society_mafia_black_money', 0, NULL),
	(16, 'society_police_black_money', 0, NULL),
	(17, 'society_taxi', 0, NULL),
	(18, 'caution', 0, 'steam:110000134a401f0'),
	(19, 'motels_bed_black_money', 0, 'steam:110000134a401f0'),
	(20, 'property_black_money', 0, 'steam:110000134a401f0'),
	(21, 'motels_black_money', 0, 'steam:110000134a401f0');
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumping structure for table fixall.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.addon_inventory: ~15 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('motels', 'Motels Inventory', 0),
	('motels_bed', 'Motels Bed Inventory', 0),
	('property', 'Properti', 0),
	('society_ambulance', 'Ambulance', 1),
	('society_biker', 'Biker', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_cartel', 'Cartel', 1),
	('society_gang', 'Gangster', 1),
	('society_mafia', 'Mafia', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_pedagang', 'Pedagang', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('society_theb', 'theb', 1),
	('vault', 'Vault', 0);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumping structure for table fixall.addon_inventory_items
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

-- Dumping data for table fixall.addon_inventory_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumping structure for table fixall.billing
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

-- Dumping data for table fixall.billing: ~0 rows (approximately)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumping structure for table fixall.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.cardealer_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumping structure for table fixall.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.datastore: ~0 rows (approximately)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumping structure for table fixall.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.datastore_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumping structure for table fixall.data_treasure
CREATE TABLE IF NOT EXISTS `data_treasure` (
  `theWinner` varchar(50) DEFAULT NULL,
  `status_treasure` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.data_treasure: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_treasure` DISABLE KEYS */;
INSERT INTO `data_treasure` (`theWinner`, `status_treasure`) VALUES
	('Adam Ball', 0);
/*!40000 ALTER TABLE `data_treasure` ENABLE KEYS */;

-- Dumping structure for table fixall.dpkeybinds
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

-- Dumping data for table fixall.dpkeybinds: ~0 rows (approximately)
/*!40000 ALTER TABLE `dpkeybinds` DISABLE KEYS */;
/*!40000 ALTER TABLE `dpkeybinds` ENABLE KEYS */;

-- Dumping structure for table fixall.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.fine_types: ~45 rows (approximately)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Bermain Klakson', 3000, 0),
	(2, 'Lawan Arah', 4000, 0),
	(3, 'Memutar Balik Tidak Pada Tempatnya', 2500, 0),
	(4, 'Mengemudi Off-Road Tidak sesuai mobilnya', 1500, 0),
	(5, 'Melanggar Peraturan Lalu Lintas', 10000, 0),
	(6, 'Berhenti Tidak Pada Tempatnya', 3500, 0),
	(7, 'Parkir Sembarangan', 10000, 0),
	(8, 'Belok Tidak Menggunakan Sein', 2000, 0),
	(9, 'Surat Kendaraan Tidak Lengkap', 15000, 0),
	(10, 'Melebihi Batas Garis Penyebrangan Lampu Merah', 3000, 0),
	(11, 'Mengendarai Dalam Keadaan Mabuk', 4000, 0),
	(12, 'mengendarai kendaraan curian', 10000, 0),
	(13, 'tidak memiliki sim', 15000, 0),
	(14, 'Tabrak Lari', 10000, 0),
	(15, 'melebihi batas kecepatan', 2500, 0),
	(16, 'merokok sembarangan', 4500, 0),
	(17, 'berkelahi', 3000, 0),
	(18, 'berkata kasar', 1000, 0),
	(19, 'menghina orang lain', 19000, 0),
	(20, 'memberikan ancaman terhadap warga sipil', 20000, 0),
	(21, 'tidak menghargai petugas', 25000, 1),
	(22, 'mengancam petugas', 25000, 1),
	(23, 'membetikan informasi palsu', 10000, 1),
	(24, 'upaya korupsi', 8000, 1),
	(25, 'menembak asal-asalan dengan senjata biasa', 10000, 1),
	(26, 'menembak asal-asalan dengan senjata berat', 20000, 1),
	(27, 'tidak memiliki lisensi senjata', 15000, 1),
	(28, 'kepemilkan senjata ilegal', 80000, 1),
	(29, 'memiliki barang ilegal', 80000, 1),
	(30, 'melakukan pencurian', 50000, 1),
	(31, 'niat menjual obat-obatan ilegal', 25000, 2),
	(32, 'pemrosesan obat-obatan ilegal', 25000, 2),
	(33, 'kepemilikan obat-obatan ilegal', 25000, 2),
	(34, 'menculik warga sipil', 70000, 2),
	(35, 'menculik pekerja negara', 100000, 2),
	(36, 'perampokan toko', 80000, 2),
	(37, 'perampokan bank', 150000, 2),
	(38, 'penyerangan terhadap warga sipil', 50000, 2),
	(39, 'Penyerangan terhadap pekerja negara', 70000, 2),
	(40, 'pembunuhan berencana terhadap warga sipil', 100000, 2),
	(41, 'pembunuhan berencana terhadap pekerja negara', 130000, 2),
	(42, 'membunuh warga sipil', 80000, 2),
	(43, 'membunuh pekerja negara', 100000, 2),
	(44, 'pembunuhan tidak sengaja', 60000, 2),
	(45, 'penipuan', 15000, 3);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table fixall.glovebox_inventory
CREATE TABLE IF NOT EXISTS `glovebox_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.glovebox_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `glovebox_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `glovebox_inventory` ENABLE KEYS */;

-- Dumping structure for table fixall.h_impounded_vehicles
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.h_impounded_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `h_impounded_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `h_impounded_vehicles` ENABLE KEYS */;

-- Dumping structure for table fixall.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` float NOT NULL DEFAULT 1,
  `limit` int(11) NOT NULL DEFAULT 10,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.items: ~83 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
	('accu', 'Batre Accu', 1, 10, 0, 1, 75),
	('air_putih', 'Air Mineral', 1, 45, 0, 1, 25),
	('alive_chicken', 'Ayam Hidup', 1, 20, 0, 1, 0),
	('bait', 'Cacing', 1, 30, 0, 1, 5),
	('bandage', 'Perban', 1, 10, 0, 1, 50),
	('beer', 'Bir', 1, 5, 0, 1, 30),
	('betadine', 'Obat Betadine', 1, 25, 0, 1, 30),
	('blackmoney', 'Uang Kotor', 1, 1, 0, 1, 0),
	('black_money', 'Uang Kotor', 1, 1, 0, 1, 0),
	('blowpipe', 'Las', 1, 5, 0, 1, 75),
	('bubuk_arang', 'Bubuk Arang', 1, 30, 0, 1, 45),
	('bullet', 'Peluru', 1, 25, 0, 1, 100),
	('bullet_casing', 'Slongsong Peluru', 1, 30, 0, 1, 75),
	('carokit', 'Dempul Mobil', 1, 5, 0, 1, 50),
	('carotool', 'Perkakas', 1, 30, 0, 1, 45),
	('champagne', 'Champagne', 1, 5, 0, 1, 30),
	('chemicalslisence', 'Lisensi Farmasi', 1, 1, 0, 1, 3000),
	('clip', 'Ammo', 1, 10, 0, 1, 1000),
	('clothe', 'Baju', 1, 40, 0, 1, 0),
	('coal', 'Batu Bara', 1, 25, 0, 1, 0),
	('coklat', 'Coklat', 1, 45, 0, 1, 30),
	('copper', 'Tembaga', 1, 56, 0, 1, 0),
	('cutted_wood', 'Kayu Potong', 1, 20, 0, 1, 0),
	('diamond', 'Berlian', 1, 50, 0, 1, 0),
	('fabric', 'Kain', 1, 80, 0, 1, 0),
	('fish', 'Ikan', 1, 30, 0, 1, 0),
	('fishbait', 'Ikan Palsu', 1, 30, 0, 1, 15),
	('fishingrod', 'Fishing rod', 2, 5, 0, 1, 10),
	('fixkit', 'Alat Perbaikan', 1, 10, 0, 1, 45),
	('fixtool', 'Peralatan Perbaikan', 1, 25, 0, 1, 45),
	('gazbottle', 'Botol Gas', 1, 10, 0, 1, 45),
	('gold', 'Emas', 1, 21, 0, 1, 0),
	('gps', 'Peta', 1, 5, 0, 1, 30),
	('gunpowder', 'Bubuk Misiu', 1, 30, 0, 1, 45),
	('gym_membership', 'Kartu Mambership GYM', 1, 1, 0, 1, 0),
	('hamburger', 'Hamburger', 1, 45, 0, 1, 35),
	('HeavyArmor', 'Heavy Body Armor', 1, 5, 0, 1, 4000),
	('iron', 'Besi', 1, 42, 0, 1, 0),
	('kecubung', 'Kecubung', 1, 90, 0, 1, 0),
	('kertas', 'Kertas', 1, 25, 0, 1, 3),
	('kopi', 'Kopi', 1, 45, 0, 1, 27),
	('leather', 'Kulit Hewan', 1, 30, 0, 1, 0),
	('lisensi_senjata', 'Lisensi Senjata', 1, 1, 0, 1, 1000),
	('makaroni', 'Makaroni', 1, 45, 0, 1, 27),
	('meat', 'Daging Mentah', 1, 25, 0, 1, 0),
	('medikit', 'Kotak P3K', 1, 10, 0, 1, 25),
	('micin', 'Micin', 1, 90, 0, 1, 0),
	('money', 'Uang', 1, 1, 0, 1, 0),
	('moneywash', 'Lisensi Cuci Uang', 1, 1, 0, 1, 2000),
	('nasi_bungkus', 'Nasi Bungkus', 1, 45, 0, 1, 30),
	('nasi_goreng', 'Nasi Goreng', 1, 45, 0, 1, 30),
	('nori', 'Nori', 1, 25, 0, 1, 5),
	('orang_tua', 'Orang Tua', 1, 10, 0, 1, 30),
	('packaged_chicken', 'Ayam Siap Jual', 1, 100, 0, 1, 0),
	('packaged_plank', 'Papan', 1, 100, 0, 1, 0),
	('petrol', 'Minyak Mentah', 1, 24, 0, 1, 0),
	('petrol_raffin', 'Minyak Bersih', 1, 24, 0, 1, 0),
	('phone', 'Handphone', 1, 5, 0, -1, 30),
	('pkecubung', 'Paket Kecubung', 1, 30, 0, 1, 0),
	('pmicin', 'Paket Micin', 1, 30, 0, 1, 0),
	('psianida', 'Paket Sianida', 1, 90, 0, 1, 0),
	('radio', 'Radio', 1, 5, 0, -1, 75),
	('repairkit', 'Peralatan ', 1, 10, 0, 1, 45),
	('rice', 'Nasi', 1, 25, 0, 1, 5),
	('roti', 'Roti', 1, 45, 0, 1, 25),
	('seaweed', 'Rumput Laut', 1, 30, 0, 1, 0),
	('sianida', 'Sianida', 1, 90, 0, 1, 0),
	('siomay', 'Siomay', 1, 45, 0, 1, 25),
	('slaughtered_chicken', 'Ayam Potong', 1, 20, 0, 1, 0),
	('stainless_steel', 'Stainless Steel', 1, 30, 0, 1, 75),
	('stone', 'Batu', 1, 7, 0, 1, 0),
	('susu', 'Susu', 1, 45, 0, 1, 30),
	('teh', 'Teh', 1, 45, 0, 1, 25),
	('tehkotak', 'Teh Kotak', 1, 45, 0, 1, 30),
	('tuna', 'Tuna', 1, 30, 0, 1, 0),
	('vegetables', 'Sayuran', 1, 10, 0, 1, 7),
	('vodka', 'Vodka', 1, 10, 0, 1, 45),
	('washed_stone', 'Batu Bersih', 1, 7, 0, 1, 0),
	('whiskey', 'Whiskey', 1, 10, 0, 1, 45),
	('wine', 'Wine', 1, 10, 0, 1, 45),
	('wood', 'Kayu', 1, 20, 0, 1, 0),
	('wool', 'Kain', 1, 40, 0, 1, 0),
	('zetony', 'Chips', 0, 1, 0, 1, 0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table fixall.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.jobs: ~27 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 1),
	('biker', 'Biker', 1),
	('cardealer', 'Cardealer', 1),
	('cartel', 'Cartel', 1),
	('fisherman', 'Nelayan', 0),
	('fueler', 'Tukang Minyak', 0),
	('gang', 'Gangster', 1),
	('garbage', 'Tukang Sampah', 0),
	('gopostal', 'Tukang Pos', 0),
	('lumberjack', 'Tukang Kayu', 0),
	('mafia', 'Mafia', 1),
	('mechanic', 'Mekanik', 1),
	('miner', 'Penambang', 0),
	('offambulance', 'Off EMS', 1),
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
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table fixall.job_grades
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.job_grades: ~113 rows (approximately)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Pengangguran', 1500, '{}', '{}'),
	(2, 'cardealer', 0, 'recruit', 'Recruit', 2500, '{}', '{}'),
	(3, 'cardealer', 1, 'novice', 'Novice', 5000, '{}', '{}'),
	(4, 'cardealer', 2, 'wakil_boss', 'Experienced', 7500, '{}', '{}'),
	(5, 'cardealer', 3, 'boss', 'Boss', 10000, '{}', '{}'),
	(6, 'ambulance', 0, 'asisten_perawat', 'Asisten Perawat', 3000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(7, 'ambulance', 1, 'perawat', 'Perawat', 6000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":42,"torso_2":0,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":85,"face":19,"decals_1":57,"torso_1":249,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(8, 'ambulance', 2, 'asisten_doctor', 'Asisten Dokter', 9000, '{"tshirt_2":3,"hair_color_1":5,"glasses_2":3,"shoes":42,"torso_2":1,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":63,"helmet_1":8,"helmet_2":0,"arms":86,"face":19,"decals_1":57,"torso_1":140,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(9, 'ambulance', 3, 'chief_doctor', 'Dokter', 12000, '{}', '{}'),
	(10, 'ambulance', 4, 'wakil_boss', 'Wakil Direktur', 15000, '{"tshirt_2":1,"hair_color_1":5,"glasses_2":3,"shoes":65,"shoes_2":3,"chain_2":3,"chain_2":3,"torso_2":1,"hair_color_2":0,"pants_1":52,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":34,"helmet_1":8,"helmet_2":0,"arms":86,"face":19,"decals_1":57,"torso_1":101,"hair_2":0,"skin":34,"pants_2":0}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(11, 'ambulance', 5, 'boss', 'Direktur', 18000, '{"tshirt_1":34,"tshirt_2":4,"torso_1":101,"torso_2":2,"decals_1":57,"decals_2":0,"arms":93,"pants_1":83,"pants_2":0,"shoes_1":32,"shoes_2":7,"chain_1":92,"chain_2":1}', '{}'),
	(12, 'mechanic', 0, 'recrue', 'Magang', 8000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":71,"torso_2":0,"hair_color_2":0,"pants_1":39,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":53,"face":19,"decals_1":0,"torso_1":66,"hair_2":0,"skin":34,"pants_2":0}', '{}'),
	(13, 'mechanic', 1, 'novice', 'Amatir', 7000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":71,"torso_2":1,"hair_color_2":0,"pants_1":39,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":53,"face":19,"decals_1":0,"torso_1":66,"hair_2":0,"skin":34,"pants_2":1}', '{}'),
	(14, 'mechanic', 2, 'experimente', 'Ahli', 8000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":71,"torso_2":2,"hair_color_2":0,"pants_1":39,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":53,"face":19,"decals_1":0,"torso_1":66,"hair_2":0,"skin":34,"pants_2":2}', '{}'),
	(15, 'mechanic', 3, 'wakil_boss', 'Wakil Bos', 9000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":48,"torso_2":15,"hair_color_2":0,"pants_1":91,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":31,"face":19,"decals_1":0,"torso_1":248,"hair_2":0,"skin":34,"pants_2":0}', '{}'),
	(16, 'mechanic', 4, 'boss', 'Bos', 10000, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":1,"shoes":48,"torso_2":15,"hair_color_2":0,"pants_1":91,"glasses_1":5,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":-1,"helmet_2":0,"arms":31,"face":19,"decals_1":0,"torso_1":248,"hair_2":0,"skin":34,"pants_2":0}', '{}'),
	(17, 'taxi', 0, 'recrue', 'Recrue', 3000, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(18, 'taxi', 1, 'novice', 'Novice', 6000, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(19, 'taxi', 2, 'experimente', 'Experimente', 9000, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(20, 'taxi', 3, 'wakil_boss', 'Uber', 12000, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(21, 'taxi', 4, 'boss', 'Patron', 15000, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(22, 'pedagang', 0, 'karyawan', 'Karyawan', 4500, '{}', '{}'),
	(23, 'pedagang', 1, 'wakil_boss', 'Manajer', 7500, '{}', '{}'),
	(24, 'pedagang', 2, 'boss', 'Bos', 10000, '{}', '{}'),
	(25, 'police', 0, 'tamtama', 'Tamtama', 5000, '{}', '{}'),
	(26, 'police', 1, 'bripda', 'Bripda', 6000, '{}', '{}'),
	(27, 'police', 2, 'briptu', 'Briptu', 7000, '{}', '{}'),
	(28, 'police', 3, 'brigpol', 'Brigpol', 8000, '{}', '{}'),
	(29, 'police', 4, 'bripka', 'Bripka', 9000, '{}', '{}'),
	(30, 'police', 5, 'aipda', 'Aipda', 10000, '{}', '{}'),
	(31, 'police', 6, 'aiptu', 'Aiptu', 11000, '{}', '{}'),
	(32, 'police', 7, 'ipda', 'Ipda', 12000, '{}', '{}'),
	(33, 'police', 8, 'iptu', 'Iptu', 13000, '{}', '{}'),
	(34, 'police', 9, 'akp', 'Akp', 14000, '{}', '{}'),
	(35, 'police', 10, 'kompol', 'Kompol', 15000, '{}', '{}'),
	(36, 'police', 11, 'akbp', 'Akbp', 16000, '{}', '{}'),
	(37, 'police', 12, 'brigjen', 'Brigjen', 17000, '{}', '{}'),
	(38, 'police', 13, 'irjen', 'Irjen', 18000, '{}', '{}'),
	(39, 'police', 14, 'wakil_boss', 'Komjen', 19000, '{}', '{}'),
	(40, 'police', 15, 'boss', 'Jendral', 20000, '{}', '{}'),
	(41, 'biker', 0, 'recruit', 'Anggota', 1500, '{}', '{}'),
	(42, 'biker', 1, 'officer', 'Bodyguard', 1500, '{}', '{}'),
	(43, 'biker', 2, 'sergeant', 'Penasihat', 1500, '{}', '{}'),
	(44, 'biker', 3, 'wakil_boss', 'Wakil Ketua', 1500, '{}', '{}'),
	(45, 'biker', 4, 'boss', 'Ketua', 1500, '{}', '{}'),
	(46, 'cartel', 0, 'recruit', 'Anggota', 1500, '{}', '{}'),
	(47, 'cartel', 1, 'officer', 'Bodyguard', 1500, '{}', '{}'),
	(48, 'cartel', 2, 'sergeant', 'Penasihat', 1500, '{}', '{}'),
	(49, 'cartel', 3, 'wakil_boss', 'Wakil Ketua', 1500, '{}', '{}'),
	(50, 'cartel', 4, 'boss', 'Ketua', 1500, '{}', '{}'),
	(51, 'gang', 0, 'recruit', 'Anggota', 1500, '{}', '{}'),
	(52, 'gang', 1, 'officer', 'Bodyguard', 1500, '{}', '{}'),
	(53, 'gang', 2, 'sergeant', 'Penasihat', 1500, '{}', '{}'),
	(54, 'gang', 3, 'wakil_boss', 'Wakil Ketua', 1500, '{}', '{}'),
	(55, 'gang', 4, 'boss', 'Ketua', 1500, '{}', '{}'),
	(56, 'mafia', 0, 'recruit', 'Anggota', 1500, '{}', '{}'),
	(57, 'mafia', 1, 'officer', 'Bodyguard', 1500, '{}', '{}'),
	(58, 'mafia', 2, 'sergeant', 'Penasihat', 1500, '{}', '{}'),
	(59, 'mafia', 3, 'wakil_boss', 'Wakil Ketua', 1500, '{}', '{}'),
	(60, 'mafia', 4, 'boss', 'Ketua', 1500, '{}', '{}'),
	(61, 'theb', 0, 'recruit', 'magang', 1500, '{}', '{}'),
	(62, 'theb', 1, 'officer', 'anggota', 1500, '{}', '{}'),
	(63, 'theb', 2, 'sergeant', 'bodyguard', 1500, '{}', '{}'),
	(64, 'theb', 3, 'wakil_boss', 'wakil ketua', 1500, '{}', '{}'),
	(65, 'theb', 4, 'boss', 'ketua', 1500, '{}', '{}'),
	(66, 'lumberjack', 0, 'employee', 'Amatir', 3000, '{"tshirt_1":15, "torso_1":61, "arms":27, "pants_1":9, "shoes_1":12, "helmet_1":20}', '{}'),
	(67, 'fisherman', 0, 'employee', 'Amatir', 3000, '{"tshirt_1":15, "torso_1":9, "arms":30, "pants_1": 15, "shoes_1":16, "helmet_1":20}', '{}'),
	(68, 'fueler', 0, 'employee', 'Amatir', 3000, '{"tshirt_1":15, "torso_1":44, "torso_2":3, "arms":30, "pants_1": 15, "shoes_1":12, "shoes_2":6, "helmet_1":20}', '{}'),
	(69, 'tailor', 0, 'employee', 'Amatir', 3000, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(70, 'miner', 0, 'employee', 'Amatir', 3000, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(71, 'slaughterer', 0, 'employee', 'Amatir', 3000, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(72, 'reporter', 1, 'employee', 'Amatir', 3000, '{}', '{}'),
	(73, 'offcardealer', 0, 'recruit', 'Recruit', 2500, '{}', '{}'),
	(74, 'offcardealer', 1, 'novice', 'Novice', 5000, '{}', '{}'),
	(75, 'offcardealer', 2, 'wakil_boss', 'Experienced', 7500, '{}', '{}'),
	(76, 'offcardealer', 3, 'boss', 'Boss', 10000, '{}', '{}'),
	(77, 'offambulance', 0, 'asisten_perawat', 'Asisten Perawat', 3000, '{}', '{}'),
	(78, 'offambulance', 1, 'perawat', 'Perawat', 6000, '{}', '{}'),
	(79, 'offambulance', 2, 'asisten_doctor', 'Asisten Dokter', 9000, '{}', '{}'),
	(80, 'offambulance', 3, 'chief_doctor', 'Dokter', 12000, '{}', '{}'),
	(81, 'offambulance', 4, 'wakil_boss', 'Wakil Direktur', 15000, '{}', '{}'),
	(82, 'offambulance', 5, 'boss', 'Direktur', 18000, '{}', '{}'),
	(83, 'offmechanic', 0, 'recrue', 'Magang', 8000, '{}', '{}'),
	(84, 'offmechanic', 1, 'novice', 'Amatir', 7000, '{}', '{}'),
	(85, 'offmechanic', 2, 'experimente', 'Ahli', 8000, '{}', '{}'),
	(86, 'offmechanic', 3, 'wakil_boss', 'Wakil Bos', 9000, '{}', '{}'),
	(87, 'offmechanic', 4, 'boss', 'Bos', 10000, '{}', '{}'),
	(88, 'offtaxi', 0, 'recrue', 'Recrue', 3000, '{}', '{}'),
	(89, 'offtaxi', 1, 'novice', 'Novice', 6000, '{}', '{}'),
	(90, 'offtaxi', 2, 'experimente', 'Experimente', 9000, '{}', '{}'),
	(91, 'offtaxi', 3, 'wakil_boss', 'Uber', 12000, '{}', '{}'),
	(92, 'offtaxi', 4, 'boss', 'Patron', 15000, '{}', '{}'),
	(93, 'offpedagang', 0, 'karyawan', 'Karyawan', 4500, '{}', '{}'),
	(94, 'offpedagang', 1, 'wakil_boss', 'Manajer', 7500, '{}', '{}'),
	(95, 'offpedagang', 2, 'boss', 'Bos', 10000, '{}', '{}'),
	(96, 'offpolice', 0, 'tamtama', 'Tamtama', 5000, '{}', '{}'),
	(97, 'offpolice', 1, 'bripda', 'Bripda', 6000, '{}', '{}'),
	(98, 'offpolice', 2, 'briptu', 'Briptu', 7000, '{}', '{}'),
	(99, 'offpolice', 3, 'brigpol', 'Brigpol', 8000, '{}', '{}'),
	(100, 'offpolice', 4, 'bripka', 'Bripka', 9000, '{}', '{}'),
	(101, 'offpolice', 5, 'aipda', 'Aipda', 10000, '{}', '{}'),
	(102, 'offpolice', 6, 'aiptu', 'Aiptu', 11000, '{}', '{}'),
	(103, 'offpolice', 7, 'ipda', 'Ipda', 12000, '{}', '{}'),
	(104, 'offpolice', 8, 'iptu', 'Iptu', 13000, '{}', '{}'),
	(105, 'offpolice', 9, 'akp', 'Akp', 14000, '{}', '{}'),
	(106, 'offpolice', 10, 'kompol', 'Kompol', 15000, '{}', '{}'),
	(107, 'offpolice', 11, 'akbp', 'Akbp', 16000, '{}', '{}'),
	(108, 'offpolice', 12, 'brigjen', 'Brigjen', 17000, '{}', '{}'),
	(109, 'offpolice', 13, 'irjen', 'Irjen', 18000, '{}', '{}'),
	(110, 'offpolice', 14, 'wakil_boss', 'Komjen', 19000, '{}', '{}'),
	(111, 'offpolice', 15, 'boss', 'Jendral', 20000, '{}', '{}'),
	(112, 'gopostal', 0, 'employee', 'Employee', 3000, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(113, 'garbage', 0, 'employee', 'Employee', 3000, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumping structure for table fixall.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.licenses: ~5 rows (approximately)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('dmv', 'Ujian Sim'),
	('drive', 'Sim Mobil'),
	('drive_bike', 'Sim Motor'),
	('drive_truck', 'Sim Truck'),
	('weapon', 'Lisensi Senjata');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumping structure for table fixall.owned_properties
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.owned_properties: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_properties` ENABLE KEYS */;

-- Dumping structure for table fixall.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(40) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) NOT NULL DEFAULT 'civ',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `garage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.owned_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumping structure for table fixall.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table fixall.phone_app_chat: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Dumping structure for table fixall.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table fixall.phone_calls: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Dumping structure for table fixall.phone_messages
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

-- Dumping data for table fixall.phone_messages: 0 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for table fixall.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table fixall.phone_users_contacts: 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Dumping structure for table fixall.playermotels
CREATE TABLE IF NOT EXISTS `playermotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL,
  `zone` varchar(50) NOT NULL,
  `door` longtext NOT NULL,
  `inventory` longtext NOT NULL,
  `weapons` longtext NOT NULL,
  `dirtymoney` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.playermotels: ~0 rows (approximately)
/*!40000 ALTER TABLE `playermotels` DISABLE KEYS */;
/*!40000 ALTER TABLE `playermotels` ENABLE KEYS */;

-- Dumping structure for table fixall.playermotels_homeinventory
CREATE TABLE IF NOT EXISTS `playermotels_homeinventory` (
  `owner` varchar(50) NOT NULL,
  `inventory` longtext NOT NULL,
  `weapons` longtext NOT NULL,
  `dirtymoney` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.playermotels_homeinventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `playermotels_homeinventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `playermotels_homeinventory` ENABLE KEYS */;

-- Dumping structure for table fixall.properties
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.properties: ~82 rows (approximately)
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

-- Dumping structure for table fixall.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.rented_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumping structure for table fixall.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table fixall.shops: ~0 rows (approximately)
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Dumping structure for table fixall.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.society_moneywash: ~0 rows (approximately)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumping structure for table fixall.trunk_inventory
CREATE TABLE IF NOT EXISTS `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.trunk_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `trunk_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `trunk_inventory` ENABLE KEYS */;

-- Dumping structure for table fixall.twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table fixall.twitter_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_accounts` ENABLE KEYS */;

-- Dumping structure for table fixall.twitter_likes
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

-- Dumping data for table fixall.twitter_likes: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_likes` ENABLE KEYS */;

-- Dumping structure for table fixall.twitter_tweets
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

-- Dumping data for table fixall.twitter_tweets: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

-- Dumping structure for table fixall.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(40) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `crafting_level` int(11) NOT NULL DEFAULT 0,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `is_dead` tinyint(1) DEFAULT 0,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `last_property` varchar(255) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `last_motel` varchar(50) DEFAULT NULL,
  `last_motel_room` varchar(50) DEFAULT NULL,
  `starterpack` int(1) DEFAULT 0,
  `treasure` int(1) DEFAULT 0,
  `zetony` varchar(50) DEFAULT '0',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `crafting_level`, `position`, `is_dead`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `tattoos`, `last_property`, `phone_number`, `jail`, `last_motel`, `last_motel_room`, `starterpack`, `treasure`, `zetony`) VALUES
	('steam:110000134a401f0', '{"bank":116500,"black_money":0,"money":100000}', 'admin', '{"gps":1,"clip":1}', 'unemployed', 0, '{"WEAPON_MARKSMANRIFLE":{"ammo":49},"WEAPON_REVOLVER":{"ammo":45}}', 0, '{"heading":29.4,"y":-593.9,"z":74.2,"x":351.4}', 0, 'Dian', 'Nugroho', '2000-07-11', 'm', 172, '{"shoes_2":0,"sun_1":0,"mask_1":0,"hair_color_1":0,"bproof_2":0,"nose_2":0,"tshirt_1":0,"mom":21,"lipstick_4":0,"skin_md_weight":50,"makeup_4":0,"chest_2":0,"chin_3":0,"nose_6":0,"nose_1":0,"eyebrows_5":0,"nose_5":0,"bags_2":0,"ears_2":0,"lip_thickness":0,"complexion_2":0,"bodyb_2":0,"arms":0,"cheeks_3":0,"bags_1":0,"dad":0,"nose_4":0,"blush_3":0,"chin_2":0,"eyebrows_6":0,"torso_2":0,"pants_1":0,"complexion_1":0,"face_md_weight":50,"helmet_1":-1,"chest_3":0,"beard_4":0,"sex":0,"neck_thickness":0,"pants_2":0,"makeup_1":0,"shoes_1":0,"bracelets_2":0,"hair_color_2":0,"hair_2":0,"bodyb_4":0,"makeup_2":0,"beard_2":0,"age_1":0,"glasses_2":0,"chin_1":0,"decals_1":0,"eyebrows_3":0,"eyebrows_2":0,"cheeks_1":0,"eye_squint":0,"moles_2":0,"cheeks_2":0,"blush_1":0,"eyebrows_1":0,"arms_2":0,"bodyb_1":-1,"helmet_2":0,"makeup_3":0,"mask_2":0,"watches_1":-1,"blemishes_1":0,"jaw_1":0,"nose_3":0,"moles_1":0,"tshirt_2":0,"beard_3":0,"lipstick_2":0,"bodyb_3":-1,"chain_2":0,"ears_1":-1,"chest_1":0,"glasses_1":0,"eye_color":0,"jaw_2":0,"decals_2":0,"blemishes_2":0,"chain_1":0,"age_2":0,"torso_1":0,"beard_1":0,"blush_2":0,"bracelets_1":-1,"chin_4":0,"lipstick_1":0,"watches_2":0,"bproof_1":0,"eyebrows_4":0,"sun_2":0,"hair_1":0,"lipstick_3":0}', '[{"val":365850,"name":"hunger","percent":36.585},{"val":308200,"name":"thirst","percent":30.81999999999999},{"val":0,"name":"drunk","percent":0.0}]', NULL, NULL, '130-6607', 0, NULL, NULL, 0, 0, '0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table fixall.user_documents
CREATE TABLE IF NOT EXISTS `user_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(45) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.user_documents: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_documents` ENABLE KEYS */;

-- Dumping structure for table fixall.user_levels
CREATE TABLE IF NOT EXISTS `user_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `crafting` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.user_levels: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_levels` ENABLE KEYS */;

-- Dumping structure for table fixall.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.user_licenses: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumping structure for table fixall.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.vehicles: ~226 rows (approximately)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 6570, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 195500, 'super'),
	('Avarus', 'avarus', 9567, 'motorcycles'),
	('Bagger', 'bagger', 8895, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 8180, 'motorcycles'),
	('Bati 801RR', 'bati2', 9879, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 4970, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('Blista', 'blista', 4200, 'compacts'),
	('BMX (velo)', 'bmx', 225, 'bike'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 4450, 'compacts'),
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
	('Carbon RS', 'carbonrs', 9765, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 11245, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 7145, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 6970, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 114500, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 245, 'bike'),
	('Cyclone', 'cyclone', 189000, 'super'),
	('Daemon', 'daemon', 7790, 'motorcycles'),
	('Daemon High', 'daemon2', 8907, 'motorcycles'),
	('Defiler', 'defiler', 7586, 'motorcycles'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 10678, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Dubsta 6x6', 'dubsta3', 20000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 3590, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 2340, 'motorcycles'),
	('Exemplar', 'exemplar', 4760, 'coupes'),
	('F620', 'f620', 6230, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1500, 'motorcycles'),
	('Vespa', 'faggio2', 1980, 'motorcycles'),
	('Felon', 'felon', 6450, 'coupes'),
	('Felon GT', 'felon2', 7125, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 130, 'bike'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 9334, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 78500, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 10864, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 11634, 'motorcycles'),
	('Hermes', 'hermes', 35000, 'muscle'),
	('Hexer', 'hexer', 8345, 'motorcycles'),
	('Hotknife', 'hotknife', 25000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 25000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 10234, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 3800, 'compacts'),
	('Jackal', 'jackal', 5730, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 65000, 'vans'),
	('Kamacho', 'kamacho', 45000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 3876, 'motorcycles'),
	('Nightblade', 'nightblade', 10975, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oracle XS', 'oracle2', 5320, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 3475, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 142000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 4530, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12642, 'muscle'),
	('Picador', 'picador', 2147483647, 'workvehicles'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 3000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 250000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 137500, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 88500, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 61500, 'sportsclassics'),
	('Revolter', 'revolter', 161000, 'sports'),
	('riata', 'riata', 80000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 5327, 'motorcycles'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 2890, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 3450, 'motorcycles'),
	('Sanctus', 'sanctus', 10532, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 99000, 'sportsclassics'),
	('SC 1', 'sc1', 603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 175, 'bike'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 4980, 'coupes'),
	('Sentinel XS', 'sentinel2', 5950, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Slam Van', 'slamvan3', 12456, 'muscle'),
	('Sovereign', 'sovereign', 9987, 'motorcycles'),
	('Stinger', 'stinger', 8000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 30000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Taksi', 'taxi', 2147483647, 'workvehicles'),
	('Thrust', 'thrust', 10343, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 100, 'bike'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 5586, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 13363, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 87500, 'sportsclassics'),
	('Visione', 'visione', 225000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voodoo', 'voodoo', 11853, 'muscle'),
	('Vortex', 'vortex', 7446, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 7340, 'coupes'),
	('Windsor Drop', 'windsor2', 7580, 'coupes'),
	('Woflsbane', 'wolfsbane', 6690, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 85000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 90000, 'sportsclassics'),
	('Zentorno', 'zentorno', 150000, 'super'),
	('Zion', 'zion', 5670, 'coupes'),
	('Zion Cabrio', 'zion2', 6680, 'coupes'),
	('Zombie', 'zombiea', 6970, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 8567, 'motorcycles'),
	('Z-Type', 'ztype', 22000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for table fixall.vehicles_import
CREATE TABLE IF NOT EXISTS `vehicles_import` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.vehicles_import: ~17 rows (approximately)
/*!40000 ALTER TABLE `vehicles_import` DISABLE KEYS */;
INSERT INTO `vehicles_import` (`name`, `model`, `price`, `category`) VALUES
	('2017 Lamborghini Aventador S', '18performante', 734500, 'racecars'),
	('Nissan Skyline R-34', '2f2fgtr34', 2147483647, 'donasi'),
	('Mitsubishi Lancer Evolution VII 2002', '2f2fmle7', 2147483647, 'donasi'),
	('Mitsubishi Lancer Evolution VII 2002', 'fnflan', 2147483647, 'donasi'),
	('Mitsubishi Eclipse GSX 1995', 'fnfmits', 2147483647, 'donasi'),
	('Toyota Supra MK IV 1994', 'fnfmk4', 2147483647, 'donasi'),
	('Mazda RX-7 VeilSide 1994', 'fnfrx7', 2147483647, 'donasi'),
	('Mazda RX-7 1994', 'fnfrx7dom', 2147483647, 'donasi'),
	('BMW GS', 'gs1', 2147483647, 'donasi'),
	('BMW I8', 'i8', 2147483647, 'donasi'),
	('Neon', 'neon', 123450, 'importcars'),
	('Ninja H2R', 'nh2r', 2147483647, 'donasi'),
	('Ford Raptor 2017', 'raptor2017', 2147483647, 'donasi'),
	('1970 Dodge Charger', 'rt70', 2147483647, 'donasi'),
	('Nissan Silvia 1997', 'silvias15', 2147483647, 'donasi'),
	('BMW GSX', 'sxr', 234057, 'importmotorcycles'),
	('Kawasaki ZX10R', 'zx10r', 534600, 'racemotorcycles');
/*!40000 ALTER TABLE `vehicles_import` ENABLE KEYS */;

-- Dumping structure for table fixall.vehicles_import_temp
CREATE TABLE IF NOT EXISTS `vehicles_import_temp` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.vehicles_import_temp: ~81 rows (approximately)
/*!40000 ALTER TABLE `vehicles_import_temp` DISABLE KEYS */;
INSERT INTO `vehicles_import_temp` (`name`, `model`, `price`, `category`) VALUES
	('Dodge 16 Challanger', '16challenger', 465000, 'importcars'),
	('Dodge 16 Charger', '16charger', 785000, 'importcars'),
	('2017 Lamborghini Aventador S', '18performante', 712000, 'racecars'),
	('2020 Chevrolet Camaro SS', '2020ss', 565400, 'importcars'),
	('Nissan Skyline R-34', '2f2fgtr34', 2147483647, 'donasi'),
	('Mitsubishi Lancer Evolution VII 2002', '2f2fmle7', 2147483647, 'donasi'),
	('Nissan 350 ZDK', '350zdk', 800000, 'racecars'),
	('Nissan 370Z', '370z', 895400, 'importcars'),
	('Toyota Land Cruiser', 'baller3', 456500, 'importcars'),
	('BMW M5 F90', 'bmci', 730000, 'importcars'),
	('2019 BMW Z4 M40i', 'bmwz4', 456800, 'importcars'),
	('Mercedes-Benz C63', 'c63coupe', 352000, 'importcars'),
	('Mitshubishi Pajero', 'cavalcade', 467800, 'importcars'),
	('2018 Honda CB500F', 'cb500f', 320000, 'importmotorcycles'),
	('Deviant', 'deviant', 145000, 'importcars'),
	('Diablous S2', 'diablous2', 354000, 'importmotorcycles'),
	('2014 KTM Super Duke R', 'duker', 465700, 'importmotorcycles'),
	('Spoon Sports Honda Civic SIR', 'eg6', 325600, 'importcars'),
	('Elegy', 'elegy', 750000, 'importcars'),
	('Entity S2', 'entity2', 421000, 'importcars'),
	('Lotus Espirit', 'esprit02', 245000, 'importcars'),
	('Ferrari 430S', 'f430s', 456000, 'importcars'),
	('FCR S2', 'fcr2', 421000, 'importmotorcycles'),
	('1978 Toyota FJ40 Land Cruiser', 'fj40', 234500, 'importcars'),
	('Honda Civic', 'fk8', 216000, 'importcars'),
	('Flash GT', 'flashgt', 354000, 'importcars'),
	('Mitsubishi Lancer Evolution VII 2002', 'fnflan', 2147483647, 'donasi'),
	('Mitsubishi Eclipse GSX 1995', 'fnfmits', 2147483647, 'donasi'),
	('Toyota Supra MK IV 1994', 'fnfmk4', 2147483647, 'donasi'),
	('Mazda RX-7 VeilSide 1994', 'fnfrx7', 2147483647, 'donasi'),
	('Mazda RX-7 1994', 'fnfrx7dom', 2147483647, 'donasi'),
	('BMW GS', 'gs1', 2147483647, 'donasi'),
	('GX Raptor', 'gxraptor', 546000, 'importcars'),
	('1952 Hudson Hornet', 'hudhorc', 987500, 'importcars'),
	('BMW I8', 'i8', 2147483647, 'donasi'),
	('Issi S3', 'issi3', 458000, 'importcars'),
	('Itali GTB S2', 'italigtb2', 230000, 'importcars'),
	('Itali GTO', 'italigto', 320000, 'importcars'),
	('2012 Jeep Wrangler', 'jeep2012', 345700, 'importcars'),
	('Jester S3', 'jester3', 750000, 'importcars'),
	('BMW M3 E36 1997', 'm3e36', 366400, 'importcars'),
	('BMW M4', 'm4f82', 458600, 'importcars'),
	('Ford Mustang Mach 1', 'mach1', 245000, 'importcars'),
	('Nissan R32', 'majsr', 365400, 'importcars'),
	('BMW M8', 'mansm8', 365800, 'importcars'),
	('Neon', 'neon', 125400, 'importcars'),
	('Nero S2', 'nero2', 421000, 'racecars'),
	('Ninja H2R', 'nh2r', 2147483647, 'donasi'),
	('Nissan Titan 2017', 'nissantitan17', 356700, 'importcars'),
	('Yamaha NMAX 155', 'nmax155', 354600, 'importmotorcycles'),
	('Penetrator', 'penetrator', 421000, 'importcars'),
	('Yamaha R1', 'r1', 354500, 'importmotorcycles'),
	('Nissan R34', 'r34', 654000, 'importcars'),
	('Nissan R35', 'r35', 645000, 'importcars'),
	('Yamaha R6', 'r6', 654100, 'importmotorcycles'),
	('2013 Audi R8', 'r8ppi', 354600, 'importcars'),
	('Ford Raptor 2017', 'raptor2017', 2147483647, 'donasi'),
	('Audi RS7', 'rs7', 543000, 'importcars'),
	('1970 Dodge Charger', 'rt70', 2147483647, 'donasi'),
	('Maxwell Saltflat 600', 'saltflat', 326500, 'importmotorcycles'),
	('Schlagen', 'schlagen', 765400, 'importcars'),
	('Shotaro Concept', 'shotaro', 800000, 'racemotorcycles'),
	('Lamborghini Sian 2012', 'sian', 768000, 'racecars'),
	('Nissan Silvia 1997', 'silvias15', 2147483647, 'donasi'),
	('Nissan Skyline', 'skyline', 986000, 'racecars'),
	('Specter S2', 'specter2', 254000, 'importcars'),
	('Stafford', 'stafford', 675000, 'importcars'),
	('2016 Subaru WRX STI', 'sultan', 235640, 'importcars'),
	('Toyota Supra 2019', 'supra19', 654800, 'importcars'),
	('BMW GSX', 'sxr', 354500, 'importmotorcycles'),
	('T20', 't20', 354600, 'importcars'),
	('Taipan', 'taipan', 675000, 'importcars'),
	('Tempesta', 'tempesta', 730000, 'importcars'),
	('Tezeract', 'tezeract', 458000, 'racecars'),
	('RAM TRX', 'trx', 654700, 'importcars'),
	('Tyrant', 'tyrant', 780000, 'importcars'),
	('Urus', 'urus', 754600, 'importcars'),
	('Vagner', 'vagner', 421000, 'importcars'),
	('Wildtrak', 'wildtrak', 685400, 'importcars'),
	('XA21', 'xa21', 354000, 'importcars'),
	('Kawasaki ZX10R', 'zx10r', 980000, 'racemotorcycles');
/*!40000 ALTER TABLE `vehicles_import_temp` ENABLE KEYS */;

-- Dumping structure for table fixall.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.vehicle_categories: ~13 rows (approximately)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('bike', 'Sepeda'),
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
	('vans', 'Vans'),
	('workvehicles', 'Kendaraan Dinas');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumping structure for table fixall.vehicle_import_categories
CREATE TABLE IF NOT EXISTS `vehicle_import_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.vehicle_import_categories: ~5 rows (approximately)
/*!40000 ALTER TABLE `vehicle_import_categories` DISABLE KEYS */;
INSERT INTO `vehicle_import_categories` (`name`, `label`) VALUES
	('donasi', 'Donasi'),
	('importcars', 'Mobil Import'),
	('importmotorcycles', 'Motor Import'),
	('racecars', 'Mobil Balap'),
	('racemotorcycles', 'Motor Balap');
/*!40000 ALTER TABLE `vehicle_import_categories` ENABLE KEYS */;

-- Dumping structure for table fixall.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.vehicle_sold: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Dumping structure for table fixall.weashops
CREATE TABLE IF NOT EXISTS `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- Dumping data for table fixall.weashops: ~12 rows (approximately)
/*!40000 ALTER TABLE `weashops` DISABLE KEYS */;
INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
	(1, 'GunShop', 'WEAPON_PISTOL', 100000),
	(2, 'BlackWeashop', 'WEAPON_VINTAGEPISTOL', 130000),
	(3, 'GunShop', 'WEAPON_FLASHLIGHT', 30000),
	(4, 'BlackWeashop', 'WEAPON_MINISMG', 250000),
	(9, 'GunShop', 'WEAPON_BAT', 35000),
	(19, 'GunShop', 'WEAPON_FIREEXTINGUISHER', 15000),
	(23, 'BlackWeashop', 'WEAPON_MICROSMG', 350000),
	(26, 'BlackWeashop', 'WEAPON_PISTOL50', 120000),
	(29, 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', 500000),
	(33, 'BlackWeashop', 'WEAPON_CARBINERIFLE', 750000),
	(34, 'BlackWeashop', 'WEAPON_HEAVYSNIPER', 900000),
	(35, 'BlackWeashop', 'WEAPON_MACHINEPISTOL', 150000);
/*!40000 ALTER TABLE `weashops` ENABLE KEYS */;

-- Dumping structure for table fixall.yellow_tweets
CREATE TABLE IF NOT EXISTS `yellow_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fixall.yellow_tweets: ~0 rows (approximately)
/*!40000 ALTER TABLE `yellow_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `yellow_tweets` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
