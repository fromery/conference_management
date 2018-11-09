
-- -----------------------------------------------------
-- Table `permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `permission` ;

CREATE TABLE IF NOT EXISTS `permission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(220) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `type_UNIQUE` (`type` ASC))
ENGINE = InnoDB;