CREATE DATABASE IF NOT EXISTS `es_extended`;
USE `es_extended`;

CREATE TABLE IF NOT EXISTS `owned_vehicles` (
	`owner` varchar(40) NOT NULL,
	`plate` varchar(12) NOT NULL,
	`vehicle` longtext,
	`type` varchar(20) NOT NULL DEFAULT 'car',
	`job` varchar(20) NOT NULL DEFAULT 'civ',
	`stored` tinyint(1) NOT NULL DEFAULT '0',
	
	PRIMARY KEY (`plate`)
);

CREATE TABLE IF NOT EXISTS `whitelist` (
	`identifier` varchar(40) NOT NULL,

	PRIMARY KEY (`identifier`)
);

CREATE TABLE IF NOT EXISTS `car_parking`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `time` bigint(20) NOT NULL,
  `parking` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;


CREATE TABLE IF NOT EXISTS `shops` (
	`id` int NOT NULL AUTO_INCREMENT,
	`store` varchar(100) NOT NULL,
	`item` varchar(100) NOT NULL,
	`price` int NOT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `billing` (
	`id` int NOT NULL AUTO_INCREMENT,
	`identifier` varchar(40) NOT NULL,
	`sender` varchar(40) NOT NULL,
	`target_type` varchar(50) NOT NULL,
	`target` varchar(40) NOT NULL,
	`label` varchar(255) NOT NULL,
	`amount` int NOT NULL,

	PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `licenses` (
	`type` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`type`)
);

CREATE TABLE IF NOT EXISTS `user_contacts` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(22) NOT NULL,
	`name` VARCHAR(100) NOT NULL,
	`number` INT(11) NOT NULL,

	PRIMARY KEY (`id`),
	INDEX `index_user_contacts_identifier_name_number` (`identifier`, `name`, `number`)
);


CREATE TABLE IF NOT EXISTS `user_licenses` (
	`id` int NOT NULL AUTO_INCREMENT,
	`type` varchar(60) NOT NULL,
	`owner` varchar(40) NOT NULL,

	PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `whitelist` (
	`identifier` varchar(70) NOT NULL,
	`last_connection` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`ban_reason` text,
	`ban_until` timestamp NULL DEFAULT NULL,
	`vip` int(11) NOT NULL DEFAULT '0',

	PRIMARY KEY (`identifier`)
);

CREATE TABLE IF NOT EXISTS `society_moneywash` (
	`id` int NOT NULL AUTO_INCREMENT,
	`identifier` varchar(60) NOT NULL,
	`society` varchar(60) NOT NULL,
	`amount` int NOT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `addon_inventory` (
	`name` VARCHAR(60) NOT NULL,
	`label` VARCHAR(100) NOT NULL,
	`shared` INT NOT NULL,

	PRIMARY KEY (`name`)
);

CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`inventory_name` VARCHAR(100) NOT NULL,
	`name` VARCHAR(100) NOT NULL,
	`count` INT NOT NULL,
	`owner` VARCHAR(40) DEFAULT NULL,

	PRIMARY KEY (`id`),
	INDEX `index_addon_inventory_items_inventory_name_name` (`inventory_name`, `name`),
	INDEX `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`, `name`, `owner`),
	INDEX `index_addon_inventory_inventory_name` (`inventory_name`)
);

CREATE TABLE IF NOT EXISTS `addon_account` (
	`name` VARCHAR(60) NOT NULL,
	`label` VARCHAR(100) NOT NULL,
	`shared` INT NOT NULL,

	PRIMARY KEY (`name`)
);

CREATE TABLE IF NOT EXISTS `addon_account_data` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`account_name` VARCHAR(100) DEFAULT NULL,
	`money` INT NOT NULL,
	`owner` VARCHAR(40) DEFAULT NULL,

	PRIMARY KEY (`id`),
	UNIQUE INDEX `index_addon_account_data_account_name_owner` (`account_name`, `owner`),
	INDEX `index_addon_account_data_account_name` (`account_name`)
);

CREATE TABLE IF NOT EXISTS `owned_properties` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,

  PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `datastore` (
	`name` VARCHAR(60) NOT NULL,
	`label` VARCHAR(100) NOT NULL,
	`shared` INT NOT NULL,

	PRIMARY KEY (`name`)
);

CREATE TABLE IF NOT EXISTS `datastore_data` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(60) NOT NULL,
	`owner` VARCHAR(40),
	`data` LONGTEXT,

	PRIMARY KEY (`id`),
	UNIQUE INDEX `index_datastore_data_name_owner` (`name`, `owner`),
	INDEX `index_datastore_data_name` (`name`)
);


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
);

CREATE TABLE IF NOT EXISTS `users` (
	`identifier` VARCHAR(60) NOT NULL,
	`license` VARCHAR(60) DEFAULT NULL,
	`accounts` LONGTEXT NULL DEFAULT NULL,
	`group` VARCHAR(50) NULL DEFAULT 'user',
	`inventory` LONGTEXT NULL DEFAULT NULL,
	`job` VARCHAR(20) NULL DEFAULT 'unemployed',
	`job_grade` INT NULL DEFAULT 0,
	`loadout` LONGTEXT NULL DEFAULT NULL,
	`position` VARCHAR(255) NULL DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',

	PRIMARY KEY (`identifier`)
);

CREATE TABLE IF NOT EXISTS `items` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`weight` INT NOT NULL DEFAULT 1,
	`limit` INT NOT NULL DEFAULT 10,	
	`rare` TINYINT NOT NULL DEFAULT 0,
	`can_remove` TINYINT NOT NULL DEFAULT 1,

	PRIMARY KEY (`name`)
);

CREATE TABLE IF NOT EXISTS `job_grades` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`job_name` VARCHAR(50) DEFAULT NULL,
	`grade` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`salary` INT NOT NULL,
	`skin_male` LONGTEXT NOT NULL,
	`skin_female` LONGTEXT NOT NULL,

	PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `jobs` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) DEFAULT NULL,

	PRIMARY KEY (`name`)
);


CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) NULL DEFAULT NULL,
  `keybind1` varchar(50) NULL DEFAULT "num4",
  `emote1` varchar(255) NULL DEFAULT "",
  `keybind2` varchar(50) NULL DEFAULT "num5",
  `emote2` varchar(255) NULL DEFAULT "",
  `keybind3` varchar(50) NULL DEFAULT "num6",
  `emote3` varchar(255) NULL DEFAULT "",
  `keybind4` varchar(50) NULL DEFAULT "num7",
  `emote4` varchar(255) NULL DEFAULT "",
  `keybind5` varchar(50) NULL DEFAULT "num8",
  `emote5` varchar(255) NULL DEFAULT "",
  `keybind6` varchar(50) NULL DEFAULT "num9",
  `emote6` varchar(255) NULL DEFAULT ""
) ENGINE=InnoDB COLLATE=latin1_swedish_ci;



INSERT INTO `jobs` VALUES ('unemployed','Unemployed');


INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_ambulance', 'Ambulance', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_ambulance', 'Ambulance', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_ambulance', 'Ambulance', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('ambulance',0,'ambulance','Ambulancier',25000,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
	('ambulance',1,'doctor','Medecin',35000,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
	('ambulance',2,'chief_doctor','Medecin-chef',45000,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
	('ambulance',3,'boss','Chirurgien',75000,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}')
;

INSERT INTO `jobs` (name, label) VALUES
	('ambulance','Ambulance')
;

INSERT INTO `items` (name, label, weight) VALUES
	('bandage','Bandage', 2),
	('medikit','Medikit', 2)
;

ALTER TABLE `users`
	ADD `is_dead` TINYINT(1) NULL DEFAULT '0'
;


INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('police', 'LSPD')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('police',0,'recruit','Recrue',15000,'{}','{}'),
	('police',1,'officer','Officier',25000,'{}','{}'),
	('police',2,'sergeant','Sergent',35000,'{}','{}'),
	('police',3,'lieutenant','Lieutenant',45000,'{}','{}'),
	('police',4,'boss','Commandant',75000,'{}','{}')
;

CREATE TABLE IF NOT EXISTS `fine_types` (
	`id` int NOT NULL AUTO_INCREMENT,
	`label` varchar(255) DEFAULT NULL,
	`amount` int DEFAULT NULL,
	`category` int DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `fine_types` (label, amount, category) VALUES
	('Usage abusif du klaxon',30,0),
	('Franchir une ligne continue',40,0),
	('Circulation à contresens',250,0),
	('Demi-tour non autorisé',250,0),
	('Circulation hors-route',170,0),
	('Non-respect des distances de sécurité',30,0),
	('Arrêt dangereux / interdit',150,0),
	('Stationnement gênant / interdit',70,0),
	('Non respect  de la priorité à droite',70,0),
	('Non-respect à un véhicule prioritaire',90,0),
	('Non-respect d\'un stop',105,0),
	('Non-respect d\'un feu rouge',130,0),
	('Dépassement dangereux',100,0),
	('Véhicule non en état',100,0),
	('Conduite sans permis',1500,0),
	('Délit de fuite',800,0),
	('Excès de vitesse < 5 kmh',90,0),
	('Excès de vitesse 5-15 kmh',120,0),
	('Excès de vitesse 15-30 kmh',180,0),
	('Excès de vitesse > 30 kmh',300,0),
	('Entrave de la circulation',110,1),
	('Dégradation de la voie publique',90,1),
	('Trouble à l\'ordre publique',90,1),
	('Entrave opération de police',130,1),
	('Insulte envers / entre civils',75,1),
	('Outrage à agent de police',110,1),
	('Menace verbale ou intimidation envers civil',90,1),
	('Menace verbale ou intimidation envers policier',150,1),
	('Manifestation illégale',250,1),
	('Tentative de corruption',1500,1),
	('Arme blanche sortie en ville',120,2),
	('Arme léthale sortie en ville',300,2),
	('Port d\'arme non autorisé (défaut de license)',600,2),
	('Port d\'arme illégal',700,2),
	('Pris en flag lockpick',300,2),
	('Vol de voiture',1800,2),
	('Vente de drogue',1500,2),
	('Fabriquation de drogue',1500,2),
	('Possession de drogue',650,2),
	('Prise d\'ôtage civil',1500,2),
	('Prise d\'ôtage agent de l\'état',2000,2),
	('Braquage particulier',650,2),
	('Braquage magasin',650,2),
	('Braquage de banque',1500,2),
	('Tir sur civil',2000,3),
	('Tir sur agent de l\'état',2500,3),
	('Tentative de meurtre sur civil',3000,3),
	('Tentative de meurtre sur agent de l\'état',5000,3),
	('Meurtre sur civil',10000,3),
	('Meurte sur agent de l\'état',30000,3),
	('Meurtre involontaire',1800,3),
	('Escroquerie à l\'entreprise',2000,2)
;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('aircraft','Aircraft License'),
	('boating','Boating License')
;

CREATE TABLE IF NOT EXISTS `owned_vehicles` (
	`owner` varchar(40) NOT NULL,
	`plate` varchar(12) NOT NULL,
	`vehicle` longtext,
	`type` VARCHAR(20) NOT NULL DEFAULT 'car',
	`job` VARCHAR(20) NOT NULL DEFAULT 'civ',
	`category` VARCHAR(50) DEFAULT NULL,
	`name` varchar(60) NOT NULL DEFAULT 'Unknown',
	`stored` TINYINT(1) NOT NULL DEFAULT '0',

	PRIMARY KEY (`plate`)
);

CREATE TABLE IF NOT EXISTS `vs_ambulance_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_ambulance_categories` (name, label) VALUES
	('ambulance','Jr. EMT'),
	('doctor','EMT'),
	('chief_doctor','Sr. EMT'),
	('boss','EMT Supervisor')
;

CREATE TABLE IF NOT EXISTS `vs_ambulance` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_ambulance` (id, name, model, price, category) VALUES
	(1,'Ambulance','ambulance',500,'ambulance'),
	(2,'Fire Truck','firetruk',750,'ambulance'),
	(3,'Ambulance','ambulance',500,'doctor'),
	(4,'Fire Truck','firetruk',750,'doctor'),
	(5,'Ambulance','ambulance',500,'chief_doctor'),
	(6,'Fire Truck','firetruk',750,'chief_doctor'),
	(7,'Ambulance','ambulance',500,'boss'),
	(8,'Fire Truck','firetruk',750,'boss'),
	(9,'Maverick','polmav',1000,'boss')
;

CREATE TABLE IF NOT EXISTS `vs_police_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_police_categories` (name, label) VALUES
	('recruit','Recruit'),
	('officer','Officer'),
	('sergeant','Sergeant'),
	('lieutenant','Lieutenant'),
	('boss','Chief')
;

CREATE TABLE IF NOT EXISTS `vs_police` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_police` (id, name, model, price, category) VALUES
	(1,'Police Cruiser','police',500,'recruit'),
	(2,'Police Cruiser','police2',750,'recruit'),
	(3,'Police Cruiser','police',500,'officer'),
	(4,'Police Cruiser','police2',750,'officer'),
	(5,'Police Cruiser','police',500,'sergeant'),
	(6,'Police Cruiser','police2',750,'sergeant'),
	(7,'Police Cruiser','police',500,'lieutenant'),
	(8,'Police Cruiser','police2',750,'lieutenant'),
	(9,'Police Cruiser','police',500,'boss'),
	(10,'Police Cruiser','police2',750,'boss'),
	(11,'Maverick','polmav',1000,'boss')
;

CREATE TABLE IF NOT EXISTS `vs_mecano_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_mecano_categories` (name, label) VALUES
	('recrue','Recruit'),
	('novice','Novice'),
	('experimente','Experienced'),
	('chief','Chief'),
	('boss','Boss')
;

CREATE TABLE IF NOT EXISTS `vs_mecano` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `vs_mecano` (id, name, model, price, category) VALUES
	(1,'Flatbed','flatbed',500,'recrue'),
	(2,'Tow Truck','towtruck2',750,'recrue'),
	(3,'Flatbed','flatbed',500,'novice'),
	(4,'Tow Truck','towtruck2',750,'novice'),
	(5,'Flatbed','flatbed',500,'experimente'),
	(6,'Tow Truck','towtruck2',750,'experimente'),
	(7,'Flatbed','flatbed',500,'chief'),
	(8,'Tow Truck','towtruck2',750,'chief'),
	(9,'Flatbed','flatbed',500,'boss'),
	(10,'Tow Truck','towtruck2',750,'boss')
;

CREATE TABLE IF NOT EXISTS `vs_aircraft_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_aircraft_categories` (name, label) VALUES
	('helis','Helicopters'),
	('planes','Planes')
;

CREATE TABLE IF NOT EXISTS `vs_aircrafts` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vs_aircrafts` (name, model, price, category) VALUES
	('Buzzard','buzzard2',500000,'helis'),
	('Frogger','frogger',800000,'helis'),
	('Havok','havok',250000,'helis'),
	('Maverick','maverick',750000,'helis'),
	('Sea Sparrow','seasparrow',815000,'helis'),
	('SuperVolito','supervolito',1000000,'helis'),
	('SuperVolito Carbon','supervolito2',1250000,'helis'),
	('Swift','swift',1000000,'helis'),
	('Swift Deluxe','swift2',1250000,'helis'),
	('Volatus','volatus',1250000,'helis'),
	('Alpha Z1','alphaz1',1121000,'planes'),
	('Besra','besra',1000000,'planes'),
	('Cuban 800','cuban800',240000,'planes'),
	('Dodo','dodo',500000,'planes'),
	('Duster','duster',175000,'planes'),
	('Howard NX25','howard',975000,'planes'),
	('Luxor','luxor',1500000,'planes'),
	('Luxor Deluxe ','luxor2',1750000,'planes'),
	('Mallard','stunt',250000,'planes'),
	('Mammatus','mammatus',300000,'planes'),
	('Nimbus','nimbus',900000,'planes'),
	('Rogue','rogue',1000000,'planes'),
	('Sea Breeze','seabreeze',850000,'planes'),
	('Shamal','shamal',1150000,'planes'),
	('Ultra Light','microlight',50000,'planes'),
	('Velum','velum2',450000,'planes'),
	('Vestra','vestra',950000,'planes')
;

CREATE TABLE IF NOT EXISTS `vs_boat_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_boat_categories` (name, label) VALUES
	('boats','Boats'),
	('subs','Submersibles')
;

CREATE TABLE IF NOT EXISTS `vs_boats` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vs_boats` (name, model, price, category) VALUES
	('Dinghy 4Seat','dinghy',25000,'boats'),
	('Dinghy 2Seat','dinghy2',20000,'boats'),
	('Dinghy Yacht','dinghy4',25000,'boats'),
	('Jetmax','jetmax',30000,'boats'),
	('Marquis','marquis',45000,'boats'),
	('Seashark','seashark',10000,'boats'),
	('Seashark Yacht','seashark3',10000,'boats'),
	('Speeder','speeder',40000,'boats'),
	('Squalo','squalo',32000,'boats'),
	('Suntrap','suntrap',34000,'boats'),
	('Toro','toro',38000,'boats'),
	('Toro Yacht','toro2',38000,'boats'),
	('Tropic','tropic',27000,'boats'),
	('Tropic Yacht','tropic2',27000,'boats'),
	('Kraken','submersible2',31000,'subs'),
	('Submarine','submersible',29000,'subs')
;

CREATE TABLE IF NOT EXISTS `vs_car_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_car_categories` (name, label) VALUES
	('compacts','Compacts'),
	('coupes','Coupes'),
	('sedans','Sedans'),
	('sports','Sports'),
	('sportsclassics','Sports Classics'),
	('supers','Supers'),
	('muscles','Muscles'),
	('offroads','Off-Roads'),
	('suvs','SUVs'),
	('vans','Vans'),
	('motorcycles','Motorcycles'),
	('importcars','Import Cars')
;

CREATE TABLE IF NOT EXISTS `vs_cars` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vs_cars` (name, model, price, category) VALUES
	('Blade','blade',15000,'muscles'),
	('Buccaneer','buccaneer',18000,'muscles'),
	('Buccaneer Rider','buccaneer2',24000,'muscles'),
	('Chino','chino',15000,'muscles'),
	('Chino Luxe','chino2',19000,'muscles'),
	('Coquette BlackFin','coquette3',55000,'muscles'),
	('Dominator','dominator',35000,'muscles'),
	('Dukes','dukes',28000,'muscles'),
	('Gauntlet','gauntlet',30000,'muscles'),
	('Hermes','hermes',535000,'muscles'),
	('Hotknife','hotknife',125000,'muscles'),
	('Hustler','hustler',625000,'muscles'),
	('Faction','faction',20000,'muscles'),
	('Faction Rider','faction2',30000,'muscles'),
	('Faction XL','faction3',40000,'muscles'),
	('Nightshade','nightshade',65000,'muscles'),
	('Phoenix','phoenix',12500,'muscles'),
	('Picador','picador',18000,'muscles'),
	('Ruiner 2','ruiner2',5745600,'muscles'),
	('Sabre Turbo','sabregt',20000,'muscles'),
	('Sabre GT','sabregt2',25000,'muscles'),
	('Slam Van','slamvan3',11500,'muscles'),
	('Tampa','tampa',16000,'muscles'),
	('Virgo','virgo',14000,'muscles'),
	('Vigero','vigero',12500,'muscles'),
	('Voodoo','voodoo',7200,'muscles'),
	('Yosemite','yosemite',485000,'muscles'),
	('Blista','blista',8000,'compacts'),
	('Brioso R/A','brioso',18000,'compacts'),
	('Issi','issi2',10000,'compacts'),
	('Panto','panto',10000,'compacts'),
	('Prairie','prairie',12000,'compacts'),
	('Bison','bison',45000,'vans'),
	('Bobcat XL','bobcatxl',32000,'vans'),
	('Burrito','burrito3',19000,'vans'),
	('Burrito','gburrito2',29000,'vans'),
	('Camper','camper',42000,'vans'),
	('Gang Burrito','gburrito',45000,'vans'),
	('Journey','journey',6500,'vans'),
	('Minivan','minivan',13000,'vans'),
	('Moonbeam','moonbeam',18000,'vans'),
	('Moonbeam Rider','moonbeam2',35000,'vans'),
	('Paradise','paradise',19000,'vans'),
	('Rumpo','rumpo',15000,'vans'),
	('Rumpo Trail','rumpo3',19500,'vans'),
	('Surfer','surfer',12000,'vans'),
	('Youga','youga',10800,'vans'),
	('Youga Luxuary','youga2',14500,'vans'),
	('Asea','asea',5500,'sedans'),
	('Cognoscenti','cognoscenti',55000,'sedans'),
	('Emperor','emperor',8500,'sedans'),
	('Fugitive','fugitive',12000,'sedans'),
	('Glendale','glendale',6500,'sedans'),
	('Intruder','intruder',7500,'sedans'),
	('Premier','premier',8000,'sedans'),
	('Primo Custom','primo2',14000,'sedans'),
	('Regina','regina',5000,'sedans'),
	('Schafter','schafter2',25000,'sedans'),
	('Stretch','stretch',90000,'sedans'),
	('Super Diamond','superd',130000,'sedans'),
	('Tailgater','tailgater',30000,'sedans'),
	('Warrener','warrener',4000,'sedans'),
	('Washington','washington',9000,'sedans'),
	('Baller','baller2',40000,'suvs'),
	('Baller Sport','baller3',60000,'suvs'),
	('Cavalcade','cavalcade2',55000,'suvs'),
	('Contender','contender',70000,'suvs'),
	('Dubsta','dubsta',45000,'suvs'),
	('Dubsta Luxuary','dubsta2',60000,'suvs'),
	('Fhantom','fq2',17000,'suvs'),
	('Grabger','granger',50000,'suvs'),
	('Gresley','gresley',47500,'suvs'),
	('Huntley S','huntley',40000,'suvs'),
	('Landstalker','landstalker',35000,'suvs'),
	('Mesa','mesa',16000,'suvs'),
	('Mesa Trail','mesa3',40000,'suvs'),
	('Patriot','patriot',55000,'suvs'),
	('Radius','radi',29000,'suvs'),
	('Rocoto','rocoto',45000,'suvs'),
	('Seminole','seminole',25000,'suvs'),
	('XLS','xls',32000,'suvs'),
	('Ardent','ardent',1150000,'sportsclassics'),
	('Btype','btype',62000,'sportsclassics'),
	('Btype Luxe','btype3',85000,'sportsclassics'),
	('Btype Hotroad','btype2',155000,'sportsclassics'),
	('Casco','casco',30000,'sportsclassics'),
	('Coquette Classic','coquette2',40000,'sportsclassics'),
	('Deluxo','deluxo',4721500,'sportsclassics'),
	('GT 500','gt500',785000,'sportsclassics'),
	('Manana','manana',12800,'sportsclassics'),
	('Monroe','monroe',55000,'sportsclassics'),
	('Pigalle','pigalle',20000,'sportsclassics'),
	('Rapid GT3','rapidgt3',885000,'sportsclassics'),
	('Retinue','retinue', 615000, 'sportsclassics'),
	('Savestra','savestra',990000,'sportsclassics'),
	('Stinger','stinger',80000,'sportsclassics'),
	('Stinger GT','stingergt',75000,'sportsclassics'),
	('Stirling GT','feltzer3',65000,'sportsclassics'),
	('Viseris','viseris',875000,'sportsclassics'),
	('Z190','z190',900000,'sportsclassics'),
	('Z-Type','ztype',220000,'sportsclassics'),
	('Bifta','bifta',12000,'offroads'),
	('Bf Injection','bfinjection',16000,'offroads'),
	('Blazer','blazer',6500,'offroads'),
	('Blazer Sport','blazer4',8500,'offroads'),
	('blazer5', 'blazer5', 1755600, 'offroads'),
	('Brawler','brawler',45000,'offroads'),
	('Bubsta 6x6','dubsta3',120000,'offroads'),
	('Dune Buggy','dune',8000,'offroads'),
	('Guardian','guardian',45000,'offroads'),
	('Kamacho', 'kamacho', 345000, 'offroads'),
	('Rebel','rebel2',35000,'offroads'),
	('Riata', 'riata', 380000, 'offroads'),
	('Sandking','sandking',55000,'offroads'),
	('The Liberator','monster',210000,'offroads'),
	('Trophy Truck','trophytruck',60000,'offroads'),
	('Trophy Truck Limited','trophytruck2',80000,'offroads'),
	('Cognoscenti Cabrio','cogcabrio',55000,'coupes'),
	('Exemplar','exemplar',32000,'coupes'),
	('F620','f620',40000,'coupes'),
	('Felon','felon',42000,'coupes'),
	('Felon GT','felon2',55000,'coupes'),
	('Jackal','jackal',38000,'coupes'),
	('Oracle XS','oracle2',35000,'coupes'),
	('Sentinel','sentinel',32000,'coupes'),
	('Sentinel XS','sentinel2',40000,'coupes'),
	('Windsor','windsor',95000,'coupes'),
	('Windsor Drop','windsor2',125000,'coupes'),
	('Zion','zion',36000,'coupes'),
	('Zion Cabrio','zion2',45000,'coupes'),
	('9F','ninef',65000,'sports'),
	('9F Cabrio','ninef2',80000,'sports'),
	('Alpha','alpha',60000,'sports'),
	('Banshee','banshee',70000,'sports'),
	('Bestia GTS','bestiagts',55000,'sports'),
	('Buffalo','buffalo',12000,'sports'),
	('Buffalo S','buffalo2',20000,'sports'),
	('Carbonizzare','carbonizzare',75000,'sports'),
	('Comet','comet2',65000,'sports'),
	('Comet 5','comet5',1145000,'sports'), 
	('Coquette','coquette',65000,'sports'),
	('Drift Tampa','tampa2',80000,'sports'),
	('Elegy','elegy2',38500,'sports'),
	('Feltzer','feltzer2',55000,'sports'),
	('Furore GT','furoregt',45000,'sports'),
	('Fusilade','fusilade',40000,'sports'),
	('Jester','jester',65000,'sports'),
	('Jester(Racecar)','jester2',135000,'sports'),
	('Khamelion','khamelion',38000,'sports'),
	('Kuruma','kuruma',30000,'sports'),
	('Lynx','lynx',40000,'sports'),
	('Mamba','mamba',70000,'sports'),
	('Massacro','massacro',65000,'sports'),
	('Massacro(Racecar)','massacro2',130000,'sports'),
	('Neon','neon',1500000,'sports'),
	('Omnis','omnis',35000,'sports'),
	('Pariah','pariah',1420000,'sports'),
	('Penumbra','penumbra',28000,'sports'),
	('Raiden','raiden',1375000,'sports'),
	('Rapid GT','rapidgt',35000,'sports'),
	('Rapid GT Convertible','rapidgt2',45000,'sports'),
	('Revolter','revolter',1610000,'sports'),
	('Schafter V12','schafter3',50000,'sports'),
	('Sentinel3','sentinel3',650000,'sports'),
	('Seven 70','seven70',39500,'sports'),
	('Streiter','streiter',500000,'sports'),
	('Stromberg','stromberg',3185350,'sports'),
	('Sultan','sultan',15000,'sports'),
	('Surano','surano',50000,'sports'),
	('Tropos','tropos',40000,'sports'),
	('Verlierer','verlierer2',70000,'sports'),
	('Adder','adder',900000,'supers'),
	('Autarch','autarch',1955000,'supers'),
	('Banshee 900R','banshee2',255000,'supers'),
	('Bullet','bullet',90000,'supers'),
	('Cheetah','cheetah',375000,'supers'),
	('Cyclone','cyclone',1890000,'supers'), 
	('Entity XF','entityxf',425000,'supers'),
	('ETR1','sheava',220000,'supers'),
	('FMJ','fmj',185000,'supers'),
	('Infernus','infernus',180000,'supers'),
	('Oppressor','oppressor',3524500,'supers'),
	('Osiris','osiris',160000,'supers'),
	('Pfister','pfister811',85000,'supers'),
	('RE-7B','le7b',325000,'supers'),
	('Reaper','reaper',150000,'supers'),
	('SC 1','sc1',1603000,'supers'),
	('Sultan RS','sultanrs',65000,'supers'),
	('T20','t20',300000,'supers'),
	('Turismo R','turismor',350000,'supers'),
	('Tyrus','tyrus',600000,'supers'),
	('Vacca','vacca',120000,'supers'),
	('Visione','visione',2250000,'supers'),
	('Voltic','voltic',90000,'supers'),
	('Voltic 2','voltic2',3830400,'supers'),
	('X80 Proto','prototipo',2500000,'supers'),
	('Zentorno','zentorno',1500000,'supers'),
	('Akuma','AKUMA',7500,'motorcycles'),
	('Avarus','avarus',18000,'motorcycles'),
	('Bagger','bagger',13500,'motorcycles'),
	('Bati 801','bati',12000,'motorcycles'),
	('Bati 801RR','bati2',19000,'motorcycles'),
	('BF400','bf400',6500,'motorcycles'),
	('BMX (velo)','bmx',160,'motorcycles'),
	('Carbon RS','carbonrs',18000,'motorcycles'),
	('Chimera','chimera',38000,'motorcycles'),
	('Cliffhanger','cliffhanger',9500,'motorcycles'),
	('Cruiser (velo)','cruiser',510,'motorcycles'),
	('Daemon','daemon',11500,'motorcycles'),
	('Daemon High','daemon2',13500,'motorcycles'),
	('Defiler','defiler',9800,'motorcycles'),
	('Double T','double',28000,'motorcycles'),
	('Enduro','enduro',5500,'motorcycles'),
	('Esskey','esskey',4200,'motorcycles'),
	('Faggio','faggio',1900,'motorcycles'),
	('Vespa','faggio2',2800,'motorcycles'),
	('Fixter (velo)','fixter',225,'motorcycles'),
	('Gargoyle','gargoyle',16500,'motorcycles'),
	('Hakuchou','hakuchou',31000,'motorcycles'),
	('Hakuchou Sport','hakuchou2',55000,'motorcycles'),
	('Hexer','hexer',12000,'motorcycles'),
	('Innovation','innovation',23500,'motorcycles'),
	('Manchez','manchez',5300,'motorcycles'),
	('Nemesis','nemesis',5800,'motorcycles'),
	('Nightblade','nightblade',35000,'motorcycles'),
	('PCJ-600','pcj',6200,'motorcycles'),
	('Ruffian','ruffian',6800,'motorcycles'),
	('Sanchez','sanchez',5300,'motorcycles'),
	('Sanchez Sport','sanchez2',5300,'motorcycles'),
	('Sanctus','sanctus',25000,'motorcycles'),
	('Scorcher (velo)','scorcher',280,'motorcycles'),
	('Sovereign','sovereign',22000,'motorcycles'),
	('Shotaro Concept','shotaro',320000,'motorcycles'),
	('Thrust','thrust',24000,'motorcycles'),
	('Tri bike (velo)','tribike3',520,'motorcycles'),
	('Vader','vader',7200,'motorcycles'),
	('Vortex','vortex',9800,'motorcycles'),
	('Woflsbane','wolfsbane',9000,'motorcycles'),
	('Zombie','zombiea',9500,'motorcycles'),
	('Zombie Luxuary','zombieb',12000,'motorcycles'),
	('BMW M5 F90','bmci',5730000,'importcars')
;

CREATE TABLE IF NOT EXISTS `vs_truck_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_truck_categories` (name, label) VALUES
	('haul','Haulers'),
	('box','Boxed Trucks'),
	('trans','Transport Trucks'),
	('other','Other Trucks')
;

CREATE TABLE IF NOT EXISTS `vs_trucks` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vs_trucks` (name, model, price, category) VALUES
	('Hauler','hauler',100000,'haul'),
	('Packer','packer',100000,'haul'),
	('Phantom','phantom',105000,'haul'),
	('Phantom Custom','phantom3',110000,'haul'),
	('Benson','benson',55000,'box'),
	('Boxville 1','boxville',45000,'box'),
	('Boxville 2','boxville2',45000,'box'),
	('Boxville 3','boxville3',45000,'box'),
	('Boxville 4','boxville4',45000,'box'),
	('Mule 1','mule',40000,'box'),
	('Mule 2','mule2',40000,'box'),
	('Mule 3','mule3',40000,'box'),
	('Pounder','pounder',55000,'box'),
	('Airport Bus','airbus',50000,'trans'),
	('Bus','bus',50000,'trans'),
	('Dashound','coach',50000,'trans'),
	('Festival Bus','pbus2',125000,'trans'),
	('Rental Bus','rentalbus',35000,'trans'),
	('Tour Bus','tourbus',35000,'trans'),
	('Biff','biff',30000,'other'),
	('Dozer','bulldozer',20000,'other'),
	('Field Master','tractor2',15000,'other'),
	('Mixer 1','mixer',30000,'other'),
	('Mixer 2','mixer2',30000,'other'),
	('Rubble','rubble',30000,'other'),
	('Scrap Truck','scrap',10000,'other'),
	('Tipper 1','tiptruck',30000,'other'),
	('Tipper 2','tiptruck2',30000,'other')
;

CREATE TABLE IF NOT EXISTS `vs_vip_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_vip_categories` (name, label) VALUES
	('motorcycles','Motos')
;

CREATE TABLE IF NOT EXISTS `vs_vips` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vs_vips` (name, model, price, category) VALUES
	('Shotaro','shotaro',30000,'motorcycles')
;

CREATE TABLE IF NOT EXISTS `vs_vipboat_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `vs_vipboat_categories` (name, label) VALUES
	('boats','Boats')
;

CREATE TABLE IF NOT EXISTS `vs_vipboats` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `vs_vipboats` (name, model, price, category) VALUES
	('Tropic Yacht','tropic2',27000,'boats')
;

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(100, 'MedEndApartment1', 'Medium Apartment 1', '{"y":3107.56,"z":41.49,"x":240.6}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":3100.77,"z":41.49,"x":240.21}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(101, 'MedEndApartment2', 'Medium Apartment 2', '{"y":3169.1,"z":41.81,"x":246.7}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":3163.97,"z":41.82,"x":245.83}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(102, 'MedEndApartment3', 'Medium Apartment 3', '{"y":2667.22,"z":39.06,"x":980.38}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":2668.77,"z":39.06,"x":986.38}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(103, 'MedEndApartment4', 'Medium Apartment 4', '{"y":3031.08,"z":42.89,"x":195.85}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":3031.39,"z":42.27,"x":200.68}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(104, 'MedEndApartment5', 'Medium Apartment 5', '{"y":4642.17,"z":42.88,"x":1724.43}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":4637.34,"z":42.31,"x":1724.27}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(105, 'MedEndApartment6', 'Medium Apartment 6', '{"y":4739.73,"z":40.99,"x":1664.98}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":4740.93,"z":41.08,"x":1670.92}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(106, 'MedEndApartment7', 'Medium Apartment 7', '{"y":6577.19,"z":31.74,"x":12.57}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6572.61,"z":31.72,"x":16.93}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(107, 'MedEndApartment8', 'Medium Apartment 8', '{"y":6190.84,"z":30.73,"x":-374.31}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6186.58,"z":30.52,"x":-372.65}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(108, 'MedEndApartment9', 'Medium Apartment 9', '{"y":6597.56,"z":30.86,"x":-27.06}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6601.55,"z":30.44,"x":-30.55}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000),
(109, 'MedEndApartment10', 'Medium Apartment 10', '{"y":6340.1,"z":28.84,"x":-367.33}', '{"y":-1012.27,"z":-100.2,"x":346.49}', '{"y":-1000.09,"z":-100.2,"x":347.06}', '{"y":6336.97,"z":28.84,"x":-371.3}', '[]', NULL, 1, 1, 0, '{"x":345.3,"y":-995.24,"z":-100.2}', 500000)
;

ALTER TABLE `users` ADD COLUMN `skin` LONGTEXT NULL DEFAULT NULL;
ALTER TABLE `users` ADD COLUMN `status` LONGTEXT NULL;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_taxi', 'Taxi', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_taxi', 'Taxi', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_taxi', 'Taxi', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('taxi', 'Taxi')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('taxi',0,'recrue','Recrue',1500,'{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi',1,'novice','Novice',3500,'{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi',2,'experimente','Experimente',4500,'{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi',3,'uber','Uber',7500,'{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	('taxi',4,'boss','Patron',15000,'{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}')
;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mechanic', 'Mécano', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mechanic', 'Mécano', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_mechanic', 'Mécano', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('mechanic', 'Mécano')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mechanic',0,'recrue','Recrue',15000,'{}','{}'),
	('mechanic',1,'novice','Novice',25000,'{}','{}'),
	('mechanic',2,'experimente','Experimente',35000,'{}','{}'),
	('mechanic',3,'chief',"Chef d\'équipe",45000,'{}','{}'),
	('mechanic',4,'boss','Patron',75000,'{}','{}')
;

INSERT INTO `items` (name, label, weight) VALUES
	('gazbottle', 'bouteille de gaz', 2),
	('fixtool', 'outils réparation', 2),
	('carotool', 'outils carosserie', 2),
	('blowpipe', 'Chalumeaux', 2),
	('fixkit', 'Kit réparation', 3),
	('carokit', 'Kit carosserie', 3)
;

CREATE TABLE IF NOT EXISTS `weaponshops` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`zone` varchar(255) NOT NULL,
	`item` varchar(255) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `licenses` (`type`, `label`) VALUES
	('weapon_melee', "Melee License"),
	('weapon_handgun', "Handgun License"),
	('weapon_smg', "SMG License"),
	('weapon_shotgun', "Shotgun License"),
	('weapon_assault', "Assault Rifle License"),
	('weapon_lmg', "LMG License"),
	('weapon_sniper', "Sniper Rifle License")
;

INSERT INTO `weaponshops` (`id`, `zone`, `item`, `price`, `category`) VALUES
	(1, 'GunShop', 'GADGET_PARACHUTE', 800, 'melee'),
	(2, 'GunShop', 'WEAPON_FLASHLIGHT', 25, 'melee'),
	(3, 'GunShop', 'WEAPON_MACHETE', 20, 'melee'),
	(4, 'GunShop', 'WEAPON_BAT', 20, 'melee'),
	(5, 'GunShop', 'WEAPON_NIGHTSTICK', 15, 'melee'),
	(6, 'GunShop', 'WEAPON_KNIFE', 30, 'melee'),
	(7, 'GunShop', 'WEAPON_HAMMER', 5, 'melee'),
	(8, 'GunShop', 'WEAPON_GOLFCLUB', 40, 'melee'),
	(9, 'GunShop', 'WEAPON_CROWBAR', 15, 'melee'),
	(10, 'GunShop', 'WEAPON_DAGGER', 15, 'melee'),
	(11, 'GunShop', 'WEAPON_KNUCKLE', 25, 'melee'),
	(12, 'GunShop', 'WEAPON_HATCHET', 20, 'melee'),
	(13, 'GunShop', 'WEAPON_SWITCHBLADE', 25, 'melee'),
	(14, 'GunShop', 'WEAPON_POOLCUE', 10, 'melee'),
	(15, 'GunShop', 'WEAPON_WRENCH', 40, 'melee'),
	(16, 'GunShop', 'WEAPON_BOTTLE', 10, 'melee'),
	(17, 'GunShop', 'WEAPON_BATTLEAXE', 125, 'melee'),
	(18, 'GunShop', 'WEAPON_FIREEXTINGUISHER', 100, 'melee'),
	(19, 'GunShop', 'WEAPON_BALL', 25, 'melee'),
	(20, 'GunShop', 'WEAPON_SNOWBALL', 25, 'melee'),
	(21, 'GunShop', 'WEAPON_BZGAS', 250, 'melee'),
	(22, 'BlackShop', 'WEAPON_BZGAS', 500, 'melee'),
	(23, 'GunShop', 'WEAPON_SMOKEGRENADE', 250, 'melee'),
	(24, 'BlackShop', 'WEAPON_SMOKEGRENADE', 500, 'melee'),
	(25, 'BlackShop', 'WEAPON_MOLOTOV', 150, 'melee'),
	(26, 'GunShop', 'WEAPON_FLARE', 100, 'melee'),
	(27, 'GunShop', 'WEAPON_FLAREGUN', 500, 'handgun'),
	(28, 'GunShop', 'WEAPON_STUNGUN', 500, 'handgun'),
	(29, 'GunShop', 'WEAPON_SNSPISTOL', 150, 'handgun'),
	(30, 'BlackShop', 'WEAPON_SNSPISTOL', 450, 'handgun'),
	(31, 'GunShop', 'WEAPON_VINTAGEPISTOL', 300, 'handgun'),
	(32, 'BlackShop', 'WEAPON_VINTAGEPISTOL', 900, 'handgun'),
	(33, 'GunShop', 'WEAPON_PISTOL', 350, 'handgun'),
	(34, 'BlackShop', 'WEAPON_PISTOL', 1050, 'handgun'),
	(35, 'GunShop', 'WEAPON_COMBATPISTOL', 400, 'handgun'),
	(36, 'GunShop', 'WEAPON_PISTOL50', 1500, 'handgun'),
	(37, 'GunShop', 'WEAPON_HEAVYPISTOL', 550, 'handgun'),
	(38, 'GunShop', 'WEAPON_REVOLVER', 1300, 'handgun'),
	(39, 'GunShop', 'WEAPON_APPISTOL', 2700, 'handgun'),
	(40, 'GunShop', 'WEAPON_MICROSMG', 900, 'smg'),
	(41, 'BlackShop', 'WEAPON_MICROSMG', 2700, 'smg'),
	(42, 'GunShop', 'WEAPON_MINISMG', 800, 'smg'),
	(43, 'BlackShop', 'WEAPON_MINISMG', 2400, 'smg'),
	(44, 'GunShop', 'WEAPON_SMG', 1600, 'smg'),
	(45, 'BlackShop', 'WEAPON_SMG', 4800, 'smg'),
	(46, 'GunShop', 'WEAPON_MACHINEPISTOL', 1300, 'smg'),
	(47, 'GunShop', 'WEAPON_ASSAULTSMG', 1400, 'smg'),
	(48, 'GunShop', 'WEAPON_COMBATPDW', 1500, 'smg'),
	(49, 'GunShop', 'WEAPON_PUMPSHOTGUN', 350, 'shotgun'),
	(50, 'BlackShop', 'WEAPON_PUMPSHOTGUN', 1050, 'shotgun'),
	(51, 'GunShop', 'WEAPON_SAWNOFFSHOTGUN', 500, 'shotgun'),
	(52, 'BlackShop', 'WEAPON_SAWNOFFSHOTGUN', 1500, 'shotgun'),
	(53, 'GunShop', 'WEAPON_DBSHOTGUN', 450, 'shotgun'),
	(54, 'BlackShop', 'WEAPON_DBSHOTGUN', 1350, 'shotgun'),
	(55, 'GunShop', 'WEAPON_HEAVYSHOTGUN', 1000, 'shotgun'),
	(56, 'GunShop', 'WEAPON_ASSAULTSHOTGUN', 1100, 'shotgun'),
	(57, 'GunShop', 'WEAPON_MUSKET', 225, 'assault'),
	(58, 'GunShop', 'WEAPON_ASSAULTRIFLE', 1200, 'assault'),
	(59, 'BlackShop', 'WEAPON_ASSAULTRIFLE', 3600, 'assault'),
	(60, 'GunShop', 'WEAPON_CARBINERIFLE', 2400, 'assault'),
	(61, 'BlackShop', 'WEAPON_CARBINERIFLE', 7200, 'assault'),
	(62, 'GunShop', 'WEAPON_BULLPUPRIFLE', 1200, 'assault'),
	(63, 'GunShop', 'WEAPON_SPECIALCARBINE', 5200, 'assault'),
	(64, 'GunShop', 'WEAPON_COMPACTRIFLE', 750, 'assault'),
	(65, 'GunShop', 'WEAPON_ADVANCEDRIFLE', 2000, 'assault'),
	(66, 'GunShop', 'WEAPON_GUSENBERG', 4280, 'lmg'),
	(67, 'GunShop', 'WEAPON_MG', 8250, 'lmg'),
	(68, 'GunShop', 'WEAPON_COMBATMG', 13950, 'lmg'),
	(69, 'GunShop', 'WEAPON_SNIPERRIFLE', 2000, 'sniper'),
	(70, 'GunShop', 'WEAPON_MARKSMANRIFLE', 3800, 'sniper'),
	(71, 'GunShop', 'WEAPON_HEAVYSNIPER', 9900, 'sniper')
;

ALTER TABLE `users`
  ADD COLUMN `last_property` VARCHAR(255) NULL
;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('property_black_money','Argent Sale Propriété',0)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('property','Propriété',0)
;

INSERT INTO `datastore` (name, label, shared) VALUES
  ('property','Propriété',0)
;


INSERT INTO `properties` VALUES
  (1,'WhispymoundDrive','2677 Whispymound Drive','{\"y\":564.89,\"z\":182.959,\"x\":119.384}','{\"x\":117.347,\"y\":559.506,\"z\":183.304}','{\"y\":557.032,\"z\":183.301,\"x\":118.037}','{\"y\":567.798,\"z\":182.131,\"x\":119.249}','[]',NULL,1,1,0,'{\"x\":118.748,\"y\":566.573,\"z\":175.697}',1500000),
  (2,'NorthConkerAvenue2045','2045 North Conker Avenue','{\"x\":372.796,\"y\":428.327,\"z\":144.685}','{\"x\":373.548,\"y\":422.982,\"z\":144.907},','{\"y\":420.075,\"z\":145.904,\"x\":372.161}','{\"x\":372.454,\"y\":432.886,\"z\":143.443}','[]',NULL,1,1,0,'{\"x\":377.349,\"y\":429.422,\"z\":137.3}',1500000),
  (3,'RichardMajesticApt2','Richard Majestic, Apt 2','{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}','{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}','{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}','{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}','[]',NULL,1,1,0,'{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}',1700000),
  (4,'NorthConkerAvenue2044','2044 North Conker Avenue','{\"y\":440.8,\"z\":146.702,\"x\":346.964}','{\"y\":437.456,\"z\":148.394,\"x\":341.683}','{\"y\":435.626,\"z\":148.394,\"x\":339.595}','{\"x\":350.535,\"y\":443.329,\"z\":145.764}','[]',NULL,1,1,0,'{\"x\":337.726,\"y\":436.985,\"z\":140.77}',1500000),
  (5,'WildOatsDrive','3655 Wild Oats Drive','{\"y\":502.696,\"z\":136.421,\"x\":-176.003}','{\"y\":497.817,\"z\":136.653,\"x\":-174.349}','{\"y\":495.069,\"z\":136.666,\"x\":-173.331}','{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}','[]',NULL,1,1,0,'{\"x\":-174.725,\"y\":493.095,\"z\":129.043}',1500000),
  (6,'HillcrestAvenue2862','2862 Hillcrest Avenue','{\"y\":596.58,\"z\":142.641,\"x\":-686.554}','{\"y\":591.988,\"z\":144.392,\"x\":-681.728}','{\"y\":590.608,\"z\":144.392,\"x\":-680.124}','{\"y\":599.019,\"z\":142.059,\"x\":-689.492}','[]',NULL,1,1,0,'{\"x\":-680.46,\"y\":588.6,\"z\":136.769}',1500000),
  (7,'LowEndApartment','Appartement de base','{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}','{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}','{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}','{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}','[]',NULL,1,1,0,'{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}',562500),
  (8,'MadWayneThunder','2113 Mad Wayne Thunder','{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}','{"x":-1289.917,"y":449.541,"z":96.902}','{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}','{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}','[]',NULL,1,1,0,'{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}',1500000),
  (9,'HillcrestAvenue2874','2874 Hillcrest Avenue','{\"x\":-853.346,\"y\":696.678,\"z\":147.782}','{\"y\":690.875,\"z\":151.86,\"x\":-859.961}','{\"y\":688.361,\"z\":151.857,\"x\":-859.395}','{\"y\":701.628,\"z\":147.773,\"x\":-855.007}','[]',NULL,1,1,0,'{\"x\":-858.543,\"y\":697.514,\"z\":144.253}',1500000),
  (10,'HillcrestAvenue2868','2868 Hillcrest Avenue','{\"y\":620.494,\"z\":141.588,\"x\":-752.82}','{\"y\":618.62,\"z\":143.153,\"x\":-759.317}','{\"y\":617.629,\"z\":143.153,\"x\":-760.789}','{\"y\":621.281,\"z\":141.254,\"x\":-750.919}','[]',NULL,1,1,0,'{\"x\":-762.504,\"y\":618.992,\"z\":135.53}',1500000),
  (11,'TinselTowersApt12','Tinsel Towers, Apt 42','{\"y\":37.025,\"z\":42.58,\"x\":-618.299}','{\"y\":58.898,\"z\":97.2,\"x\":-603.301}','{\"y\":58.941,\"z\":97.2,\"x\":-608.741}','{\"y\":30.603,\"z\":42.524,\"x\":-620.017}','[]',NULL,1,1,0,'{\"x\":-622.173,\"y\":54.585,\"z\":96.599}',1700000),
  (12,'MiltonDrive','Milton Drive','{\"x\":-775.17,\"y\":312.01,\"z\":84.658}',NULL,NULL,'{\"x\":-775.346,\"y\":306.776,\"z\":84.7}','[]',NULL,0,0,1,NULL,0),
  (13,'Modern1Apartment','Appartement Moderne 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_01_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.661,\"y\":327.672,\"z\":210.396}',1300000),
  (14,'Modern2Apartment','Appartement Moderne 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_01_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.735,\"y\":326.757,\"z\":186.313}',1300000),
  (15,'Modern3Apartment','Appartement Moderne 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_01_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.386,\"y\":330.782,\"z\":195.08}',1300000),
  (16,'Mody1Apartment','Appartement Mode 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_02_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.615,\"y\":327.878,\"z\":210.396}',1300000),
  (17,'Mody2Apartment','Appartement Mode 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_02_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.297,\"y\":327.092,\"z\":186.313}',1300000),
  (18,'Mody3Apartment','Appartement Mode 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_02_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.303,\"y\":330.932,\"z\":195.085}',1300000),
  (19,'Vibrant1Apartment','Appartement Vibrant 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_03_a\"]','MiltonDrive',0,1,0,'{\"x\":-765.885,\"y\":327.641,\"z\":210.396}',1300000),
  (20,'Vibrant2Apartment','Appartement Vibrant 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_03_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.607,\"y\":327.344,\"z\":186.313}',1300000),
  (21,'Vibrant3Apartment','Appartement Vibrant 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_03_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.525,\"y\":330.851,\"z\":195.085}',1300000),
  (22,'Sharp1Apartment','Appartement Persan 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_04_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.527,\"y\":327.89,\"z\":210.396}',1300000),
  (23,'Sharp2Apartment','Appartement Persan 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_04_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.642,\"y\":326.497,\"z\":186.313}',1300000),
  (24,'Sharp3Apartment','Appartement Persan 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_04_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.503,\"y\":331.318,\"z\":195.085}',1300000),
  (25,'Monochrome1Apartment','Appartement Monochrome 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_05_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.289,\"y\":328.086,\"z\":210.396}',1300000),
  (26,'Monochrome2Apartment','Appartement Monochrome 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_05_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.692,\"y\":326.762,\"z\":186.313}',1300000),
  (27,'Monochrome3Apartment','Appartement Monochrome 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_05_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.094,\"y\":330.976,\"z\":195.085}',1300000),
  (28,'Seductive1Apartment','Appartement Séduisant 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_06_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.263,\"y\":328.104,\"z\":210.396}',1300000),
  (29,'Seductive2Apartment','Appartement Séduisant 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_06_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.655,\"y\":326.611,\"z\":186.313}',1300000),
  (30,'Seductive3Apartment','Appartement Séduisant 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_06_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.3,\"y\":331.414,\"z\":195.085}',1300000),
  (31,'Regal1Apartment','Appartement Régal 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_07_a\"]','MiltonDrive',0,1,0,'{\"x\":-765.956,\"y\":328.257,\"z\":210.396}',1300000),
  (32,'Regal2Apartment','Appartement Régal 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_07_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.545,\"y\":326.659,\"z\":186.313}',1300000),
  (33,'Regal3Apartment','Appartement Régal 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_07_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.087,\"y\":331.429,\"z\":195.123}',1300000),
  (34,'Aqua1Apartment','Appartement Aqua 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_08_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.187,\"y\":328.47,\"z\":210.396}',1300000),
  (35,'Aqua2Apartment','Appartement Aqua 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_08_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.658,\"y\":326.563,\"z\":186.313}',1300000),
  (36,'Aqua3Apartment','Appartement Aqua 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_08_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.287,\"y\":331.084,\"z\":195.086}',1300000),
  (37,'IntegrityWay','4 Integrity Way','{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}',NULL,NULL,'{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}','[]',NULL,0,0,1,NULL,0),
  (38,'IntegrityWay28','4 Integrity Way - Apt 28',NULL,'{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}','{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}',NULL,'[]','IntegrityWay',0,1,0,'{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}',1700000),
  (39,'IntegrityWay30','4 Integrity Way - Apt 30',NULL,'{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}','{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}',NULL,'[]','IntegrityWay',0,1,0,'{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}',1700000),
  (40,'DellPerroHeights','Dell Perro Heights','{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}',NULL,NULL,'{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}','[]',NULL,0,0,1,NULL,0),
  (41,'DellPerroHeightst4','Dell Perro Heights - Apt 28',NULL,'{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}','{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}',NULL,'[]','DellPerroHeights',0,1,0,'{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}',1700000),
  (42,'DellPerroHeightst7','Dell Perro Heights - Apt 30',NULL,'{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}','{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}',NULL,'[]','DellPerroHeights',0,1,0,'{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}',1700000)
;

INSERT INTO `properties` VALUES
  (43, 'MazeBankBuilding', 'Maze Bank Building', '{\"x\":-79.18,\"y\":-795.92,\"z\":43.35}', NULL, NULL, '{\"x\":-72.50,\"y\":-786.92,\"z\":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
  (44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
  (45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
  (46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
  (47, 'ExecutiveRich', 'Executive Rich', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
  (48, 'ExecutiveCool', 'Executive Cool', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
  (49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
  (50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
  (51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
  (52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
  (53, 'LomBank', 'Lom Bank', '{\"x\":-1581.36,\"y\":-558.23,\"z\":34.07}', NULL, NULL, '{\"x\":-1583.60,\"y\":-555.12,\"z\":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
  (54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
  (55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
  (56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
  (57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
  (58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
  (59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
  (60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
  (61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
  (62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
  (63, 'MazeBankWest', 'Maze Bank West', '{\"x\":-1379.58,\"y\":-499.63,\"z\":32.22}', NULL, NULL, '{\"x\":-1378.95,\"y\":-502.82,\"z\":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
  (64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
  (65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
  (66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
  (67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
  (68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
  (69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
  (70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
  (71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
  (72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000)
;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('caution', 'Caution', 0)
;

INSERT INTO `jobs` (name, label) VALUES
	('slaughterer', 'Abatteur'),
	('fisherman', 'Pêcheur'),
	('miner', 'Mineur'),
	('lumberjack', 'Bûcheron'),
	('fueler', 'Raffineur'),
	('reporter', 'Journaliste'),
	('tailor', 'Couturier')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('lumberjack', 0, 'employee', 'Intérimaire', 15000, '{}', '{}'),
	('fisherman', 0, 'employee', 'Intérimaire', 15000, '{}', '{}'),
	('fueler', 0, 'employee', 'Intérimaire', 15000, '{}', '{}'),
	('reporter', 0, 'employee', 'Intérimaire', 15000, '{}', '{}'),
	('tailor',0,'employee','Intérimaire',15000,'{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}','{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
	('miner', 0, 'employee', 'Intérimaire', 15000, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	('slaughterer',0,'employee','Intérimaire',15000,'{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}','{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}')
;

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('alive_chicken', 'Poulet vivant', 1),
	('slaughtered_chicken', 'Poulet abattu', 1),
	('packaged_chicken', 'Poulet en barquette', 1),
	('fish', 'Poisson', 1),
	('stone', 'Pierre', 1),
	('washed_stone', 'Pierre Lavée', 1),
	('copper', 'Cuivre', 1),
	('iron', 'Fer', 1),
	('gold', 'Or', 1),
	('diamond', 'Diamant', 1),
	('wood', 'Bois', 1),
	('cutted_wood', 'Bois coupé', 1),
	('packaged_plank', 'Paquet de planches', 1),
	('petrol', 'Pétrole', 1),
	('petrol_raffin', 'Pétrole Raffiné', 1),
	('essence', 'Essence', 1),
	('wool', 'Laine', 1),
	('fabric', 'Tissu', 1),
	('clothe', 'Vêtement', 1)
;


INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('cannabis', 'Cannabis', 3, 0, 1),
	('marijuana', 'Marijuana', 2, 0, 1)
;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('weed_processing', 'Weed Processing License')
;


INSERT INTO `licenses` (`type`, `label`) VALUES
	('dmv', 'Code de la route'),
	('drive', 'Permis de conduire'),
	('drive_bike', 'Permis moto'),
	('drive_truck', 'Permis camion')
;

ALTER TABLE `users`
	ADD COLUMN `firstname` VARCHAR(16) NULL DEFAULT NULL,
	ADD COLUMN `lastname` VARCHAR(16) NULL DEFAULT NULL,
	ADD COLUMN `dateofbirth` VARCHAR(10) NULL DEFAULT NULL,
	ADD COLUMN `sex` VARCHAR(1) NULL DEFAULT NULL,
	ADD COLUMN `height` INT NULL DEFAULT NULL
;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('boat', 'Boat License')
;

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('beer', 'Beer', 1)
;

INSERT INTO `shops` (store, item, price) VALUES
	('TwentyFourSeven', 'beer', 45),
	('RobsLiquor', 'beer', 45),
	('LTDgasoline', 'beer', 45)
;

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('bread', 'Pain', 1),
	('water', 'Eau', 1)
;


INSERT INTO `shops` (store, item, price) VALUES
	('TwentyFourSeven','bread',30),
	('TwentyFourSeven','water',15),
	('RobsLiquor','bread',30),
	('RobsLiquor','water',15),
	('LTDgasoline','bread',30),
	('LTDgasoline','water',15)
;

ALTER TABLE `users`
	ADD COLUMN `phone_number` INT(11) NULL,
	ADD UNIQUE INDEX `index_users_phone_number` (`phone_number`);


ALTER TABLE jobs add whitelisted BOOLEAN NOT NULL DEFAULT FALSE;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_banker','Banque',1),
	('bank_savings','Livret Bleu',0)
;

INSERT INTO `jobs` (name, label) VALUES
	('banker','Banquier')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('banker',0,'advisor','Conseiller',15000,'{}','{}'),
	('banker',1,'banker','Banquier',25000,'{}','{}'),
	('banker',2,'business_banker',"Banquier d\'affaire",35000,'{}','{}'),
	('banker',3,'trader','Trader',45000,'{}','{}'),
	('banker',4,'boss','Patron',75000,'{}','{}')
;



INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_realestateagent','Agent immobilier',1)
;

INSERT INTO `jobs` (name, label) VALUES
	('realestateagent','Agent immobilier')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('realestateagent',0,'location','Location',25000,'{}','{}'),
	('realestateagent',1,'vendeur','Vendeur',35000,'{}','{}'),
	('realestateagent',2,'gestion','Gestion',45000,'{}','{}'),
	('realestateagent',3,'boss','Patron',75000,'{}','{}')
;


INSERT INTO `items`(`name`, `label`, `limit`) VALUES ('parkingcard', 'Parking Card', -1);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES ('unemployed',0,'unemployed','Unemployed', 10000,'{}','{}');