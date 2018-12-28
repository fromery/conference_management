-- MySQL Script generated by MySQL Workbench
-- Fri Dec 28 17:12:50 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`permission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(220) NOT NULL DEFAULT 'null',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `type_UNIQUE` (`type` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(220) NOT NULL,
  `lastname` VARCHAR(220) NOT NULL,
  `username` VARCHAR(220) NOT NULL,
  `password` VARCHAR(220) NOT NULL,
  `email` VARCHAR(220) NOT NULL,
  `role` VARCHAR(220) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantity_stars` INT NOT NULL DEFAULT 0,
  `quantity_users` INT NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_rating_user1_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `rating` (`quantity_stars`, `quantity_users`, `user_id`)
VALUES("0", "0", "3");

-- -----------------------------------------------------
-- Table `mydb`.`conference`
-- -----------------------------------------------------
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
