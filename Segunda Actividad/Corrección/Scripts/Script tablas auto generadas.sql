-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Libreria_CM-JC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Libreria_CM-JC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Libreria_CM-JC` DEFAULT CHARACTER SET utf8 ;
USE `Libreria_CM-JC` ;

-- -----------------------------------------------------
-- Table `Libreria_CM-JC`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria_CM-JC`.`Cliente` (
  `Cedula` VARCHAR(12) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fecha_nacimiento` DATE NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria_CM-JC`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria_CM-JC`.`Compra` (
  `IdCompra` VARCHAR(12) NOT NULL,
  `Total` FLOAT NULL,
  `Fecha` DATE NULL,
  `Cedula Cliente` VARCHAR(12) NULL,
  PRIMARY KEY (`IdCompra`),
  INDEX `Cedula Cliente_idx` (`Cedula Cliente` ASC) VISIBLE,
  CONSTRAINT `Cedula Cliente`
    FOREIGN KEY (`Cedula Cliente`)
    REFERENCES `Libreria_CM-JC`.`Cliente` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria_CM-JC`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria_CM-JC`.`Autor` (
  `IdAutor` VARCHAR(12) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Fecha_nacimiento` DATE NULL,
  PRIMARY KEY (`IdAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria_CM-JC`.`Editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria_CM-JC`.`Editorial` (
  `Nombre_editorial` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Nombre_editorial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria_CM-JC`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria_CM-JC`.`Libro` (
  `ISBN` VARCHAR(12) NOT NULL,
  `Titulo` VARCHAR(45) NULL,
  `nPaginas` VARCHAR(45) NULL,
  `Cantidad` INT NULL,
  `Precio` FLOAT NULL,
  `Nombre_editorial` VARCHAR(50) NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `Nombre editorial_idx` (`Nombre_editorial` ASC) VISIBLE,
  CONSTRAINT `Nombre editorial`
    FOREIGN KEY (`Nombre_editorial`)
    REFERENCES `Libreria_CM-JC`.`Editorial` (`Nombre_editorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria_CM-JC`.`Libro_autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria_CM-JC`.`Libro_autor` (
  `ISBN_libro` VARCHAR(12) NOT NULL,
  `IdAutor` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`ISBN_libro`, `IdAutor`),
  INDEX `Id autor_idx` (`IdAutor` ASC) VISIBLE,
  CONSTRAINT `ISBN Libro`
    FOREIGN KEY (`ISBN_libro`)
    REFERENCES `Libreria_CM-JC`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id autor`
    FOREIGN KEY (`IdAutor`)
    REFERENCES `Libreria_CM-JC`.`Autor` (`IdAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria_CM-JC`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria_CM-JC`.`Genero` (
  `IdGenero` VARCHAR(12) NOT NULL,
  `Genero` VARCHAR(45) NULL,
  PRIMARY KEY (`IdGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria_CM-JC`.`Genero_libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria_CM-JC`.`Genero_libro` (
  `ISBN_Libro` VARCHAR(12) NOT NULL,
  `IdGenero` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`ISBN_Libro`, `IdGenero`),
  INDEX `Id Genero_idx` (`IdGenero` ASC) VISIBLE,
  CONSTRAINT `ISBN Libro`
    FOREIGN KEY (`ISBN_Libro`)
    REFERENCES `Libreria_CM-JC`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id Genero`
    FOREIGN KEY (`IdGenero`)
    REFERENCES `Libreria_CM-JC`.`Genero` (`IdGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria_CM-JC`.`Compra_libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria_CM-JC`.`Compra_libro` (
  `IdCompra` VARCHAR(12) NOT NULL,
  `ISBN_Libro` VARCHAR(12) NOT NULL,
  `Cantidad` INT NULL,
  `Total` FLOAT NULL,
  PRIMARY KEY (`IdCompra`, `ISBN_Libro`),
  INDEX `ISBN libro_idx` (`ISBN_Libro` ASC) VISIBLE,
  CONSTRAINT `Id compra`
    FOREIGN KEY (`IdCompra`)
    REFERENCES `Libreria_CM-JC`.`Compra` (`IdCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ISBN libro`
    FOREIGN KEY (`ISBN_Libro`)
    REFERENCES `Libreria_CM-JC`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria_CM-JC`.`Alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria_CM-JC`.`Alquiler` (
  `idAlquiler` VARCHAR(12) NOT NULL,
  `FechaAlquiler` DATE NULL,
  `DiasAlquiler` INT NULL,
  `PlazoMaximo` DATE NULL,
  `CedulaCliente` VARCHAR(12) NULL,
  PRIMARY KEY (`idAlquiler`),
  INDEX `FK_ClienteCedula_idx` (`CedulaCliente` ASC) VISIBLE,
  CONSTRAINT `FK_ClienteCedula`
    FOREIGN KEY (`CedulaCliente`)
    REFERENCES `Libreria_CM-JC`.`Cliente` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria_CM-JC`.`Alquiler_libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria_CM-JC`.`Alquiler_libro` (
  `ISBNLibro` VARCHAR(12) NOT NULL,
  `IdAlquiler` VARCHAR(12) NOT NULL,
  `Cantidad` INT NULL,
  `Total` FLOAT NULL,
  PRIMARY KEY (`ISBNLibro`, `IdAlquiler`),
  INDEX `FK_Alquiler_idx` (`IdAlquiler` ASC) VISIBLE,
  CONSTRAINT `FK_Alquiler`
    FOREIGN KEY (`IdAlquiler`)
    REFERENCES `Libreria_CM-JC`.`Alquiler` (`idAlquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_libroISBN`
    FOREIGN KEY (`ISBNLibro`)
    REFERENCES `Libreria_CM-JC`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria_CM-JC`.`Resena_libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria_CM-JC`.`Resena_libro` (
  `CedulaPersona` VARCHAR(12) NOT NULL,
  `ISBNLibro` VARCHAR(12) NOT NULL,
  `Resena` FLOAT NULL,
  PRIMARY KEY (`CedulaPersona`, `ISBNLibro`),
  INDEX `FK_LibroISBN_idx` (`ISBNLibro` ASC) VISIBLE,
  CONSTRAINT `FK_LibroISBNF`
    FOREIGN KEY (`ISBNLibro`)
    REFERENCES `Libreria_CM-JC`.`Libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ClienteCedulaF`
    FOREIGN KEY (`CedulaPersona`)
    REFERENCES `Libreria_CM-JC`.`Cliente` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Libreria_CM-JC` ;

-- -----------------------------------------------------
-- Placeholder table for view `Libreria_CM-JC`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria_CM-JC`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `Libreria_CM-JC`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Libreria_CM-JC`.`view1`;
USE `Libreria_CM-JC`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
