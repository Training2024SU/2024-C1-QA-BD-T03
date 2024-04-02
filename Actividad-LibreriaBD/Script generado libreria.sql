-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Libreria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Libreria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Libreria` DEFAULT CHARACTER SET utf8 ;
USE `Libreria` ;

-- -----------------------------------------------------
-- Table `Libreria`.`Autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Autores` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `nacionalidad` VARCHAR(45) NULL,
  `fecha_nacimiento` DATE NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Editoriales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Editoriales` (
  `nombre_editorial` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`nombre_editorial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Libros` (
  `ISBN` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(75) NULL,
  `numero_paginas` INT NULL,
  `nombre_editorial` VARCHAR(75) NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `nombre_editorial_idx` (`nombre_editorial` ASC) VISIBLE,
  CONSTRAINT `nombre_editorial`
    FOREIGN KEY (`nombre_editorial`)
    REFERENCES `Libreria`.`Editoriales` (`nombre_editorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Escritura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Escritura` (
  `idEscritura` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT NOT NULL,
  `ISBN` VARCHAR(45) NULL,
  PRIMARY KEY (`idEscritura`),
  INDEX `codigo_idx` (`codigo` ASC) VISIBLE,
  INDEX `ISBN_idx` (`ISBN` ASC) VISIBLE,
  CONSTRAINT `codigo`
    FOREIGN KEY (`codigo`)
    REFERENCES `Libreria`.`Autores` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ISBN`
    FOREIGN KEY (`ISBN`)
    REFERENCES `Libreria`.`Libros` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Ventas` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `ISBN_Libro` VARCHAR(45) NULL,
  `id_cliente` INT NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `Libreria`.`Clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ISBN_Libro`
    FOREIGN KEY (`ISBN_Libro`)
    REFERENCES `Libreria`.`Libros` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Telefono_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Telefono_clientes` (
  `id_clientes` INT NULL,
  `telefono` VARCHAR(45) NULL,
  CONSTRAINT `id_clientes`
    FOREIGN KEY (`id_clientes`)
    REFERENCES `Libreria`.`Clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
