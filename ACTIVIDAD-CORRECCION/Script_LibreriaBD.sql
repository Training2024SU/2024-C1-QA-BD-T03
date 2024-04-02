-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LibreriaBuscaLibreBD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LibreriaBuscaLibreBD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LibreriaBuscaLibreBD` DEFAULT CHARACTER SET utf8 ;
USE `LibreriaBuscaLibreBD` ;

-- -----------------------------------------------------
-- Table `LibreriaBuscaLibreBD`.`Editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibreBD`.`Editorial` (
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibreBD`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibreBD`.`Libro` (
  `ISBN` VARCHAR(20) NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `numero_paginas` INT NULL,
  `fecha_publicacion` DATE NULL,
  `nombre_editorial` VARCHAR(45) NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `nombre_editorial_idx` (`nombre_editorial` ASC) VISIBLE,
  CONSTRAINT `nombre_editorial`
    FOREIGN KEY (`nombre_editorial`)
    REFERENCES `LibreriaBuscaLibreBD`.`Editorial` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibreBD`.`Telefono_editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono_editorial` (
  `nombre_editorial_fk` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  INDEX `nombre_editorialFK_idx` (`nombre_editorial_fk` ASC) VISIBLE,
  CONSTRAINT `nombre_editorialFK`
    FOREIGN KEY (`nombre_editorial_fk`)
    REFERENCES `LibreriaBuscaLibreBD`.`Editorial` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibreBD`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibreBD`.`Cliente` (
  `id_cliente` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibreBD`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibreBD`.`Compra` (
  `id_compra` INT NOT NULL AUTO_INCREMENT,
  `ISBNLibro` VARCHAR(45) NULL,
  `idCliente` VARCHAR(45) NULL,
  `fecha_compra` DATE NULL,
  `cantidad` INT NULL,
  PRIMARY KEY (`id_compra`),
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `ISBN_FK_idx` (`ISBNLibro` ASC) VISIBLE,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ISBN_FK`
    FOREIGN KEY (`ISBNLibro`)
    REFERENCES `LibreriaBuscaLibreBD`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibreBD`.`Telefono_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibreBD`.`Telefono_cliente` (
  `idTelefono_cliente` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idTelefono_cliente`),
  CONSTRAINT `id_cleinte_telefono`
    FOREIGN KEY (`idTelefono_cliente`)
    REFERENCES `LibreriaBuscaLibreBD`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibreBD`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibreBD`.`Autor` (
  `Codigo` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Fecha_nacimiento` DATE NULL,
  `Nacionalidad` VARCHAR(45) NULL,
  PRIMARY KEY (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibreBD`.`Libro_autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibreBD`.`Libro_autor` (
  `Codigo_autor` VARCHAR(40) NOT NULL,
  `ISBN_Libro` VARCHAR(45) NOT NULL,
  INDEX `codigo_autor_fk_idx` (`Codigo_autor` ASC) VISIBLE,
  INDEX `ISBN_Libro_fk_idx` (`ISBN_Libro` ASC) VISIBLE,
  CONSTRAINT `codigo_autor_fk`
    FOREIGN KEY (`Codigo_autor`)
    REFERENCES `mydb`.`Autor` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ISBN_Libro_fk`
    FOREIGN KEY (`ISBN_Libro`)
    REFERENCES `LibreriaBuscaLibreBD`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
