-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema libreria_cr
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema libreria_cr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `libreria_cr` DEFAULT CHARACTER SET utf8 ;
USE `libreria_cr` ;

-- -----------------------------------------------------
-- Table `libreria_cr`.`Editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_cr`.`Editorial` (
  `Nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria_cr`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_cr`.`Cliente` (
  `Cedula` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Fecha_nacimiento` DATE NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria_cr`.`Inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_cr`.`Inventario` (
  `IdInventario` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`IdInventario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria_cr`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_cr`.`Libro` (
  `ISBN` VARCHAR(20) NOT NULL,
  `Titulo` VARCHAR(45) NOT NULL,
  `nPaginas` INT NULL,
  `NombreEditorial` VARCHAR(45) NULL,
  `IdInventario` INT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `FK_inventario_idx` (`IdInventario` ASC) VISIBLE,
  INDEX `FK_editorial_idx` (`NombreEditorial` ASC) VISIBLE,
  CONSTRAINT `FK_inventario`
    FOREIGN KEY (`IdInventario`)
    REFERENCES `libreria_cr`.`Inventario` (`IdInventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_editorial`
    FOREIGN KEY (`NombreEditorial`)
    REFERENCES `libreria_cr`.`Editorial` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria_cr`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_cr`.`Autor` (
  `IdAutor` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Fecha_Nacimiento` DATE NOT NULL,
  `Nacionalidad` VARCHAR(45) NULL,
  PRIMARY KEY (`IdAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria_cr`.`AutorLibro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_cr`.`AutorLibro` (
  `ISBNLibro` VARCHAR(20) NOT NULL,
  `IdAutor` INT NOT NULL,
  PRIMARY KEY (`ISBNLibro`, `IdAutor`),
  INDEX `FK_autor_idx` (`IdAutor` ASC) VISIBLE,
  CONSTRAINT `FK_libro`
    FOREIGN KEY (`ISBNLibro`)
    REFERENCES `libreria_cr`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_autor`
    FOREIGN KEY (`IdAutor`)
    REFERENCES `libreria_cr`.`Autor` (`IdAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria_cr`.`ClienteLibro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_cr`.`ClienteLibro` (
  `IdCompra` INT NOT NULL AUTO_INCREMENT,
  `CedulaCliente` INT NOT NULL,
  `ISBNLibro` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`IdCompra`),
  INDEX `FK_Cliente_idx` (`CedulaCliente` ASC) VISIBLE,
  INDEX `FK_libro_idx` (`ISBNLibro` ASC) VISIBLE,
  CONSTRAINT `FK_Cliente`
    FOREIGN KEY (`CedulaCliente`)
    REFERENCES `libreria_cr`.`Cliente` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_libro`
    FOREIGN KEY (`ISBNLibro`)
    REFERENCES `libreria_cr`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria_cr`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_cr`.`Genero` (
  `IdGenero` INT NOT NULL AUTO_INCREMENT,
  `Genero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `libreria_cr`.`LibroGenero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreria_cr`.`LibroGenero` (
  `IdGenero` INT NOT NULL,
  `ISBNLibro` VARCHAR(20) NULL,
  PRIMARY KEY (`IdGenero`),
  INDEX `FK_libro_idx` (`ISBNLibro` ASC) VISIBLE,
  CONSTRAINT `FK_libro`
    FOREIGN KEY (`ISBNLibro`)
    REFERENCES `libreria_cr`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_genero`
    FOREIGN KEY (`IdGenero`)
    REFERENCES `libreria_cr`.`Genero` (`IdGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
