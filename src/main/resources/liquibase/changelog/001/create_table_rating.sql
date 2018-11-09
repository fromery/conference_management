
-- -----------------------------------------------------
-- Table `rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating` ;

CREATE TABLE IF NOT EXISTS `rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `stars` INT NULL DEFAULT 0,
  `quantity_users` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;