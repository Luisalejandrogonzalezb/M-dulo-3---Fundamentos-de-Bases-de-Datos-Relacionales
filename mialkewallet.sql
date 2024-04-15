-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema baseluis
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema baseluis
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `baseluis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `baseluis` ;

-- -----------------------------------------------------
-- Table `baseluis`.`moneda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `baseluis`.`moneda` (
  `currency_id` INT NOT NULL,
  `currency_name` VARCHAR(50) NULL DEFAULT NULL,
  `currency_symbol` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`currency_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `baseluis`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `baseluis`.`usuario` (
  `User_id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `correo_electronico` VARCHAR(45) NULL DEFAULT NULL,
  `contraseña` VARCHAR(45) NULL DEFAULT NULL,
  `saldo` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`User_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `baseluis`.`transaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `baseluis`.`transaccion` (
  `transaction_id` INT NOT NULL,
  `sender_user_id` INT NULL DEFAULT NULL,
  `receiver_user_id` INT NULL DEFAULT NULL,
  `importe` DECIMAL(10,2) NULL DEFAULT NULL,
  `transaction_date` TIMESTAMP NULL DEFAULT NULL,
  `currency_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `sender_user_id` (`sender_user_id` ASC) VISIBLE,
  INDEX `receiver_user_id` (`receiver_user_id` ASC) VISIBLE,
  INDEX `currency_id` (`currency_id` ASC) VISIBLE,
  CONSTRAINT `transaccion_ibfk_1`
    FOREIGN KEY (`sender_user_id`)
    REFERENCES `baseluis`.`usuario` (`User_id`),
  CONSTRAINT `transaccion_ibfk_2`
    FOREIGN KEY (`receiver_user_id`)
    REFERENCES `baseluis`.`usuario` (`User_id`),
  CONSTRAINT `transaccion_ibfk_3`
    FOREIGN KEY (`currency_id`)
    REFERENCES `baseluis`.`moneda` (`currency_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
