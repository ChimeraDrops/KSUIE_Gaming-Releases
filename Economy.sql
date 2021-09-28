CREATE TABLE `economy` (
	`identifier` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`multiplier` DOUBLE NULL DEFAULT NULL,
	`factor` INT(11) NULL DEFAULT NULL
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;