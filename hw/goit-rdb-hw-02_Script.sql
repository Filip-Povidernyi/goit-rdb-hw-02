-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rdb-hw-02
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rdb-hw-02
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rdb-hw-02` DEFAULT CHARACTER SET utf8 ;
USE `rdb-hw-02` ;

-- -----------------------------------------------------
-- Table `rdb-hw-02`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdb-hw-02`.`client` (
  `id` INT NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rdb-hw-02`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdb-hw-02`.`order` (
  `id` INT NOT NULL,
  `oder_number` INT NULL,
  `oder_date` DATE NULL,
  `id_client` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `oder-client_idx` (`id_client` ASC) VISIBLE,
  CONSTRAINT `oder-client`
    FOREIGN KEY (`id_client`)
    REFERENCES `rdb-hw-02`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rdb-hw-02`.`oder_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rdb-hw-02`.`oder_details` (
  `id` INT NOT NULL,
  `oder_number` INT NULL,
  `equipment` VARCHAR(45) NULL,
  `quantity` INT NULL,
  `id_oder` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `oder_details-oder_idx` (`id_oder` ASC) VISIBLE,
  CONSTRAINT `oder_details-oder`
    FOREIGN KEY (`id_oder`)
    REFERENCES `rdb-hw-02`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
