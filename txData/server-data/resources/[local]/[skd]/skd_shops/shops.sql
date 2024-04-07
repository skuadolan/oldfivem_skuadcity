-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
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
CREATE DATABASE IF NOT EXISTS `skuadcity` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `skuadcity`;

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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
