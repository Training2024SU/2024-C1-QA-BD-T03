-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema library_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema library_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `library_DB` DEFAULT CHARACTER SET utf8 ;
USE `library_DB` ;

-- -----------------------------------------------------
-- Table `library_DB`.`Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `library_DB`.`Country` ;

CREATE TABLE IF NOT EXISTS `library_DB`.`Country` (
  `idPais` INT NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library_DB`.`Autor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `library_DB`.`Autor` ;

CREATE TABLE IF NOT EXISTS `library_DB`.`Autor` (
  `IdAutor` INT NOT NULL,
  `Nombres` VARCHAR(100) NOT NULL,
  `Apellidos` VARCHAR(100) NOT NULL,
  `IdPais` INT NOT NULL,
  `FechaNacimiento` DATE NOT NULL,
  PRIMARY KEY (`IdAutor`),
  CONSTRAINT `IdPais`
    FOREIGN KEY (`IdPais`)
    REFERENCES `library_DB`.`Country` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `IdPais_idx` ON `library_DB`.`Autor` (`IdPais` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `library_DB`.`Editorial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `library_DB`.`Editorial` ;

CREATE TABLE IF NOT EXISTS `library_DB`.`Editorial` (
  `IdEditorial` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdEditorial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library_DB`.`Libro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `library_DB`.`Libro` ;

CREATE TABLE IF NOT EXISTS `library_DB`.`Libro` (
  `ISBN` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(120) NOT NULL,
  `NumeroPaginas` INT NOT NULL,
  `IdEditorial` INT NOT NULL,
  PRIMARY KEY (`ISBN`),
  CONSTRAINT `IdEditorial`
    FOREIGN KEY (`IdEditorial`)
    REFERENCES `library_DB`.`Editorial` (`IdEditorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `IdEditorial_idx` ON `library_DB`.`Libro` (`IdEditorial` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `library_DB`.`Escritura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `library_DB`.`Escritura` ;

CREATE TABLE IF NOT EXISTS `library_DB`.`Escritura` (
  `ISBNLibro` INT NOT NULL,
  `IdAutor` INT NOT NULL,
  PRIMARY KEY (`IdAutor`, `ISBNLibro`),
  CONSTRAINT `ISBNLibro`
    FOREIGN KEY (`ISBNLibro`)
    REFERENCES `library_DB`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdAutor`
    FOREIGN KEY (`IdAutor`)
    REFERENCES `library_DB`.`Autor` (`IdAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `ISBNLibro_idx` ON `library_DB`.`Escritura` (`ISBNLibro` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `library_DB`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `library_DB`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `library_DB`.`Cliente` (
  `IdCliente` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`IdCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library_DB`.`CompraLibroCliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `library_DB`.`CompraLibroCliente` ;

CREATE TABLE IF NOT EXISTS `library_DB`.`CompraLibroCliente` (
  `IdCompra` INT NOT NULL AUTO_INCREMENT,
  `ISBNLibro` INT NOT NULL,
  `IdCliente` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  `Precio` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`IdCompra`),
  CONSTRAINT `ISBNLibro`
    FOREIGN KEY (`ISBNLibro`)
    REFERENCES `library_DB`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdCliente`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `library_DB`.`Cliente` (`IdCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `ISBNLibro_idx` ON `library_DB`.`CompraLibroCliente` (`ISBNLibro` ASC) VISIBLE;

CREATE INDEX `IdCliente_idx` ON `library_DB`.`CompraLibroCliente` (`IdCliente` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
