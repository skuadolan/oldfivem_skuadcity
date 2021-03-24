USE `es_extended`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_biker', 'biker', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_biker', 'biker', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_biker', 'biker', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('biker', 'biker')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('biker',0,'recruit','magang',3000,'{}','{}'),
	('biker',1,'officer','anggota',3500,'{}','{}'),
	('biker',2,'sergeant','bodyguard',4000,'{}','{}'),
	('biker',3,'lieutenant','wakil ketua',4500,'{}','{}'),
	('biker',4,'boss','ketua',5000,'{}','{}')
;

CREATE TABLE `fine_types_biker` (
	`id` int NOT NULL AUTO_INCREMENT,
	`label` varchar(255) DEFAULT NULL,
	`amount` int DEFAULT NULL,
	`category` int DEFAULT NULL,

	PRIMARY KEY (`id`)
);
