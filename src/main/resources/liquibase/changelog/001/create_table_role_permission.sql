
-- -----------------------------------------------------
-- Table `role_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role_permission` ;

CREATE TABLE IF NOT EXISTS `role_permission` (
  `role_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  INDEX `fk_role_has_permission_permission1_idx` (`permission_id` ASC),
  INDEX `fk_role_has_permission_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_role_has_permission_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_has_permission_permission1`
    FOREIGN KEY (`permission_id`)
    REFERENCES `permission` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;