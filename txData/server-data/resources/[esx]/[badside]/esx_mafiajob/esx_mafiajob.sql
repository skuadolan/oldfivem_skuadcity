USE `es_extended`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mafia', 'mafia', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_mafia', 'mafia', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mafia', 'mafia', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('mafia', 'mafia')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mafia',0,'recruit','magang',3000,'{}','{}'),
	('mafia',1,'officer','anggota',3500,'{}','{}'),
	('mafia',2,'sergeant','bodyguard',4000,'{}','{}'),
	('mafia',3,'lieutenant','wakil ketua',4500,'{}','{}'),
	('mafia',4,'boss','ketua',5000,'{}','{}')
;

CREATE TABLE `fine_types_mafia` (
	`id` int NOT NULL AUTO_INCREMENT,
	`label` varchar(255) DEFAULT NULL,
	`amount` int DEFAULT NULL,
	`category` int DEFAULT NULL,

	PRIMARY KEY (`id`)
);
