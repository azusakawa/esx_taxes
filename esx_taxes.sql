INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_irs','國稅局',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_irs','國稅局',1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('irs', '國稅局', 1);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('irs', 3, 'director', '局長', 1450, '{}', '{}'),
('irs', 2, 'chief', '處長', 1450, '{}', '{}'),
('irs', 1, 'leader', '組長', 1450, '{}', '{}'),
('irs', 0, 'member', '組員', 1450, '{}', '{}');