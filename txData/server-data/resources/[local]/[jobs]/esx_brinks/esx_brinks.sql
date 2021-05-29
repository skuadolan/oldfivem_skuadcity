CREATE TABLE IF NOT EXISTS `weekly_run` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `start_date` int(11) NOT NULL,
  `harvest` int(11) NOT NULL,
  `sell` int(11) NOT NULL,
  `malus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `weekly_run` (`company`, `start_date`, `harvest`, `sell`, `malus`) VALUES
	('police', 0, 0, 0, 0)
;
