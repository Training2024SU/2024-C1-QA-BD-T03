

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


CREATE SCHEMA IF NOT EXISTS `luis` DEFAULT CHARACTER SET utf8mb3 ;
USE `luis` ;

-- -----------------------------------------------------
-- Table `luis`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luis`.`autor` (
  `Id_autor` INT NOT NULL,
  `Nombre` VARCHAR(50) NULL DEFAULT NULL,
  `Apellido1` VARCHAR(50) NULL,
  `Apellido2` VARCHAR(50) NULL,
  `Fecha_nacimiento` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`Id_autor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `luis`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luis`.`cliente` (
  `Id_cliente` VARCHAR(15) NOT NULL,
  `Nombre` VARCHAR(50) NULL DEFAULT NULL,
  `Apellido1` VARCHAR(50) NULL,
  `Apellido2` VARCHAR(50) NULL,
  PRIMARY KEY (`Id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `luis`.`editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luis`.`editorial` (
  `Nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `luis`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luis`.`libro` (
  `ISBN` VARCHAR(15) NOT NULL,
  `Titulo` VARCHAR(50) NULL DEFAULT NULL,
  `Num_paginas` INT NULL DEFAULT NULL,
  `Nombre_editorial` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `Nombre_editorial` (`Nombre_editorial` ASC) VISIBLE,
  CONSTRAINT `libro_ibfk_1`
    FOREIGN KEY (`Nombre_editorial`)
    REFERENCES `luis`.`editorial` (`Nombre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `luis`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luis`.`compra` (
  `ISBN` VARCHAR(15) NOT NULL,
  `Id_cliente` VARCHAR(15) NOT NULL,
  `Fecha` TIMESTAMP NULL DEFAULT NULL,
  INDEX `ISBN` (`ISBN` ASC) VISIBLE,
  INDEX `Id_cliente` (`Id_cliente` ASC) VISIBLE,
  PRIMARY KEY (`ISBN`, `Id_cliente`),
  CONSTRAINT `compra_ibfk_1`
    FOREIGN KEY (`ISBN`)
    REFERENCES `luis`.`libro` (`ISBN`),
  CONSTRAINT `compra_ibfk_2`
    FOREIGN KEY (`Id_cliente`)
    REFERENCES `luis`.`cliente` (`Id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `luis`.`escribir_libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luis`.`escribir_libro` (
  `ISBN` VARCHAR(15) NOT NULL,
  `Id_autor` INT NOT NULL,
  INDEX `ISBN` (`ISBN` ASC) VISIBLE,
  INDEX `Id_autor` (`Id_autor` ASC) VISIBLE,
  PRIMARY KEY (`ISBN`, `Id_autor`),
  CONSTRAINT `escribir_libro_ibfk_1`
    FOREIGN KEY (`ISBN`)
    REFERENCES `luis`.`libro` (`ISBN`),
  CONSTRAINT `escribir_libro_ibfk_2`
    FOREIGN KEY (`Id_autor`)
    REFERENCES `luis`.`autor` (`Id_autor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `luis`.`Nacionalidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luis`.`Nacionalidad` (
  `Id_nacionalidad` VARCHAR(50) NOT NULL,
  `País` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Id_nacionalidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `luis`.`Nacionalidad autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `luis`.`Nacionalidad autor` (
  `autor_Id_autor` INT NOT NULL,
  `Nacionalidad_Id_nacionalidad` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`autor_Id_autor`, `Nacionalidad_Id_nacionalidad`),
  INDEX `fk_Nacionalidad autor_autor1_idx` (`autor_Id_autor` ASC) VISIBLE,
  INDEX `fk_Nacionalidad autor_Nacionalidad1_idx` (`Nacionalidad_Id_nacionalidad` ASC) VISIBLE,
  CONSTRAINT `fk_Nacionalidad autor_autor1`
    FOREIGN KEY (`autor_Id_autor`)
    REFERENCES `luis`.`autor` (`Id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nacionalidad autor_Nacionalidad1`
    FOREIGN KEY (`Nacionalidad_Id_nacionalidad`)
    REFERENCES `luis`.`Nacionalidad` (`Id_nacionalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
