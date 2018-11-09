
-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role` ;

CREATE TABLE IF NOT EXISTS `role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(220) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC))
ENGINE = InnoDB;