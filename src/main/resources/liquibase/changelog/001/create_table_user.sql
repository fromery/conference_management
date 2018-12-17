
-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(220) NOT NULL,
  `lastname` VARCHAR(220) NOT NULL,
  `username` VARCHAR(220) NOT NULL,
  `password` VARCHAR(220) NOT NULL,
  `email` VARCHAR(220) NOT NULL,
  `role` VARCHAR(220) NOT NULL,
  `rating_id` INT NOT NULL,
  PRIMARY KEY (`id`, `rating_id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_user_rating1_idx` (`rating_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_rating1`
    FOREIGN KEY (`rating_id`)
    REFERENCES `rating` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;