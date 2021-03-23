USE `es_extended`;



INSERT INTO `addon_account` (name, label, shared) VALUES
  ('vault_black_money', 'Money Vault', 0),
  ('society_police_black_money', 'Police Black Money', 1) ------------------[untuk black money coba contoh yang poilisi biar bekerja ke all job ]
  ('society_mafia_black_money', 'mafia Black Money', 1) ------------------[untuk black money coba contoh yang poilisi biar bekerja ke all job ]
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('vault', 'Vault', 0) 
;

INSERT INTO `datastore` (name, label, shared) VALUES
  ('vault', 'Vault', 0)
;