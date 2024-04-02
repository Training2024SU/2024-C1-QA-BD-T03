-- MySQL Script generated by MySQL Workbench
-- Sat Mar 30 16:54:54 2024
-- Model: Busca-Libre    Version: 1.0

-- Se diseña el modelo relacional de una libreria llamada Busca-libre.

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema libreria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema libreria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `libreria` DEFAULT CHARACTER SET utf8 ;
USE `libreria` ;

-- -----------------------------------------------------
-- Table `libreria`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`CATEGORIA` (
  `ID categoria` VARCHAR(20) NOT NULL,
  `Nombre categoria` VARCHAR(20) NOT NULL,
  `Edad sugerida` INT NOT NULL,
  PRIMARY KEY (`ID categoria`),
  UNIQUE INDEX `ID categoria_UNIQUE` (`ID categoria` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`EDITORIAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`EDITORIAL` (
  `Nombre editorial` VARCHAR(20) NOT NULL,
  `Cantidad` INT NOT NULL,
  PRIMARY KEY (`Nombre editorial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`LIBRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`LIBRO` (
  `ISBN` VARCHAR(20) NOT NULL,
  `Titulo` VARCHAR(40) NOT NULL,
  `Descripcion` VARCHAR(200) NULL,
  `Paginas` INT NOT NULL,
  `Precio` INT NOT NULL,
  `Fecha de publicacion` DATE NOT NULL,
  `ID editorial` VARCHAR(20) NOT NULL,
  `ID categoria` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `fk_idcategoria_idx` (`ID categoria` ASC) VISIBLE,
  INDEX `fk_Nombreeditorial_idx` (`ID editorial` ASC) VISIBLE,
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_idcategorialibro`
    FOREIGN KEY (`ID categoria`)
    REFERENCES `libreria`.`CATEGORIA` (`ID categoria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Nombreeditorial`
    FOREIGN KEY (`ID editorial`)
    REFERENCES `libreria`.`EDITORIAL` (`Nombre editorial`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`AUTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`AUTOR` (
  `ID autor` VARCHAR(20) NOT NULL,
  `Nombre` VARCHAR(30) NOT NULL,
  `Fecha nacimiento` DATE NOT NULL,
  `Nacionalidad` VARCHAR(20) NOT NULL,
  `ISBN` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`AUTORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`AUTORIA` (
  `ISBN autoria` VARCHAR(20) NOT NULL,
  `ID autor` VARCHAR(20) NOT NULL,
  INDEX `fk_ISBN_idx` (`ISBN autoria` ASC) VISIBLE,
  INDEX `fk_IDautor_idx` (`ID autor` ASC) VISIBLE,
  CONSTRAINT `fk_ISBNautoria`
    FOREIGN KEY (`ISBN autoria`)
    REFERENCES `libreria`.`LIBRO` (`ISBN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_IDautor`
    FOREIGN KEY (`ID autor`)
    REFERENCES `libreria`.`AUTOR` (`ID autor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`CLIENTE` (
  `ID cliente` VARCHAR(20) NOT NULL,
  `Nombre` VARCHAR(40) NOT NULL,
  `Email` VARCHAR(30) NOT NULL,
  `Direccion` VARCHAR(50) NULL,
  `Fecha de nacimiento` DATE NOT NULL,
  PRIMARY KEY (`ID cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`INVENTARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`INVENTARIO` (
  `ISBN` VARCHAR(20) NOT NULL,
  `Cantidad` INT NOT NULL,
  PRIMARY KEY (`ISBN`),
  CONSTRAINT `fk-libro`
    FOREIGN KEY (`ISBN`)
    REFERENCES `libreria`.`LIBRO` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`FACTURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`FACTURA` (
  `ID factura` VARCHAR(20) NOT NULL,
  `ID cliente factura` VARCHAR(20) NOT NULL,
  `ID libro` VARCHAR(20) NOT NULL,
  `Cantidad` INT NOT NULL,
  PRIMARY KEY (`ID factura`),
  INDEX `fk_IDcliente_idx` (`ID cliente factura` ASC) VISIBLE,
  UNIQUE INDEX `ID compra_UNIQUE` (`ID factura` ASC) VISIBLE,
  INDEX `fk_ID-libro_idx` (`ID libro` ASC) VISIBLE,
  CONSTRAINT `fk_IDclientecompra`
    FOREIGN KEY (`ID cliente factura`)
    REFERENCES `libreria`.`CLIENTE` (`ID cliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ID-libro`
    FOREIGN KEY (`ID libro`)
    REFERENCES `libreria`.`INVENTARIO` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria`.`TELEFONO-CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria`.`TELEFONO-CLIENTE` (
  `ID cliente` VARCHAR(20) NOT NULL,
  `Telefono` VARCHAR(20) NOT NULL,
  INDEX `ID cliente_idx` (`ID cliente` ASC) VISIBLE,
  CONSTRAINT `ID cliente`
    FOREIGN KEY (`ID cliente`)
    REFERENCES `libreria`.`CLIENTE` (`ID cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
