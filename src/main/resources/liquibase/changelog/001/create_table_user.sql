
-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(220) NULL,
  `lastname` VARCHAR(220) NULL,
  `username` VARCHAR(220) NOT NULL,
  `password` VARCHAR(220) NULL,
  `rating_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`, `rating_id`, `role_id`),
  INDEX `fk_user_user_rating1_idx` (`rating_id` ASC),
  INDEX `fk_user_role1_idx` (`role_id` ASC),
  UNIQUE INDEX `email_UNIQUE` (`username` ASC),
  CONSTRAINT `fk_user_user_rating1`
    FOREIGN KEY (`rating_id`)
    REFERENCES `rating` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
