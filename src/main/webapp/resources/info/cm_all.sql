
-- -----------------------------------------------------
-- Table `mydb`.`conference`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`conference` ;

CREATE TABLE IF NOT EXISTS `mydb`.`conference` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(220) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  UNIQUE INDEX `title_UNIQUE` (`title` ASC) VISIBLE,
  INDEX `fk_conference_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_conference_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`report` ;

CREATE TABLE IF NOT EXISTS `mydb`.`report` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(220) NULL,
  `date_time` DATETIME NULL,
  `status` VARCHAR(220) NULL DEFAULT 'Initial',
  `conference_id` INT NOT NULL,
  `speaker_id` INT NOT NULL,
  `moderator_id` INT NOT NULL,
  PRIMARY KEY (`id`, `conference_id`, `speaker_id`, `moderator_id`),
  INDEX `fk_report_conference1_idx` (`conference_id` ASC) VISIBLE,
  INDEX `fk_report_user1_idx` (`speaker_id` ASC) VISIBLE,
  INDEX `fk_report_user2_idx` (`moderator_id` ASC) VISIBLE,
  CONSTRAINT `fk_report_conference1`
    FOREIGN KEY (`conference_id`)
    REFERENCES `mydb`.`conference` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_user1`
    FOREIGN KEY (`speaker_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_user2`
    FOREIGN KEY (`moderator_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`role_has_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`role_has_user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`role_has_user` (
  `role_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`),
  INDEX `fk_role_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_role_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_reports`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user_reports` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user_reports` (
  `report_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `attended` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`report_id`, `user_id`),
  INDEX `fk_report_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_report_has_user_report1_idx` (`report_id` ASC) VISIBLE,
  CONSTRAINT `fk_report_has_user_report1`
    FOREIGN KEY (`report_id`)
    REFERENCES `mydb`.`report` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
