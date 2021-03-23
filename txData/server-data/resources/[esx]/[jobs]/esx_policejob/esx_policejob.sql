USE `sjs`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_police', 'police', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_police', 'police', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_police', 'police', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('police', 'police')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('police',0,'tamtama','Tamtama',2500,'{}','{}'),
	('police',1,'bripda','Bripda',2750,'{}','{}'),
	('police',2,'briptu','Briptu',3000,'{}','{}'),
	('police',3,'brigpol','Brigpol',3250,'{}','{}'),
	('police',4,'bripka','Bripka',3500,'{}','{}'),
	('police',5,'aipda','Aipda',3750,'{}','{}'),
	('police',6,'aiptu','Aiptu',4000,'{}','{}'),
	('police',7,'ipda','Ipda',4250,'{}','{}'),
	('police',8,'iptu','Iptu',4500,'{}','{}'),
	('police',9,'akp','Akp',4750,'{}','{}'),
	('police',10,'kompol','Kompol',5000,'{}','{}'),
	('police',11,'akbp','Akbp',5250,'{}','{}'),
	('police',12,'brigjen','Brigjen',5500,'{}','{}'),
	('police',13,'irjen','Irjen',5750,'{}','{}'),
	('police',14,'komjen','Komjen',6000,'{}','{}'),
	('police',15,'jendral','Jendral',7000,'{}','{}')
	;

CREATE TABLE `fine_types` (
	`id` int NOT NULL AUTO_INCREMENT,
	`label` varchar(255) DEFAULT NULL,
	`amount` int DEFAULT NULL,
	`category` int DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `fine_types` (label, amount, category) VALUES
	('Bermain Klakson',3000,0),
	('Lawan Arah',4000,0),
	('Memutar Balik Tidak Pada Tempatnya',2500,0),
	('Mengemudi Off-Road Tidak sesuai mobilnya',1500,0),
	('Melanggar Peraturan Lalu Lintas',10000,0),
	('Berhenti Tidak Pada Tempatnya',3500,0),
	('Parkir Sembarangan',10000,0),
	('Belok Tidak Menggunakan Sein',2000,0),
	('Surat Kendaraan Tidak Lengkap',15000,0),
	('Melebihi Batas Garis Penyebrangan Lampu Merah',3000,0),
	('Mengendarai Dalam Keadaan Mabuk',4000,0),
	('mengendarai kendaraan curian',10000,0),
	('tidak memiliki sim',15000,0),
	('Tabrak Lari',10000,0),
	('melebihi batas kecepatan',2500,0),
	('merokok sembarangan',4500,0),
	('berkelahi',3000,0),
	('berkata kasar',1000,0),
	('menghina orang lain',19000,0),
	('memberikan ancaman terhadap warga sipil',20000,0),
	('tidak menghargai petugas',25000,1),
	('mengancam petugas',25000,1),
	('membetikan informasi palsu',10000,1),
	('upaya korupsi',8000,1),
	('menembak asal-asalan dengan senjata biasa',10000,1),
	('menembak asal-asalan dengan senjata berat',20000,1),
	('tidak memiliki lisensi senjata',15000,1),
	('kepemilkan senjata ilegal',80000,1),
	('memiliki barang ilegal',80000,1),
	('melakukan pencurian',50000,1),
	('niat menjual obat-obatan ilegal',25000,2),
	('pemrosesan obat-obatan ilegal',25000,2),
	('kepemilikan obat-obatan ilegal',25000,2),
	('menculik warga sipil',70000,2),
	('menculik pekerja negara',100000,2),
	('perampokan toko',80000,2),
	('perampokan bank',150000,2),
	('penyerangan terhadap warga sipil',50000,2),
	('Penyerangan terhadap pekerja negara',70000,2),
	('pembunuhan berencana terhadap warga sipil',100000,2),
	('pembunuhan berencana terhadap pekerja negara',130000,2),
	('membunuh warga sipil',80000,2),
	('membunuh pekerja negara',100000,2),
	('pembunuhan tidak sengaja',60000,2),
	('penipuan',15000,3)
;
