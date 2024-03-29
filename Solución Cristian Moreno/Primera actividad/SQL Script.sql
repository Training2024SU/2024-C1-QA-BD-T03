
CREATE SCHEMA IF NOT EXISTS `libreríaDb` DEFAULT CHARACTER SET utf8 ;
USE `libreríaDb` ;


CREATE TABLE IF NOT EXISTS `libreríaDb`.`Clientes` (
  `Cédula` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Primer_Apellido` VARCHAR(45) NULL,
  `Segundo_Apellido` VARCHAR(45) NULL,
  `Fecha_Nacimiento` DATE NULL,
  PRIMARY KEY (`Cédula`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `libreríaDb`.`Compras` (
  `Id` INT NOT NULL,
  `Fecha` DATE NULL,
  `Precio` DECIMAL(6,2) NULL,
  `Total` DECIMAL(10,4) NULL,
  `Cliente_Cédula` INT NOT NULL,
  PRIMARY KEY (`Id`, `Cliente_Cédula`),
  INDEX `fk_Compras_Clientes1_idx` (`Cliente_Cédula` ASC) VISIBLE,
  CONSTRAINT `fk_Compras_Clientes1`
    FOREIGN KEY (`Cliente_Cédula`)
    REFERENCES `libreríaDb`.`Clientes` (`Cédula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `libreríaDb`.`Nacionalidades` (
  `Id` INT NOT NULL,
  `País` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `libreríaDb`.`Autores` (
  `Id` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Primer_Apellido` VARCHAR(45) NULL,
  `Segundo_Apellido` VARCHAR(45) NULL,
  `Fecha_Nacimiento` DATE NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `libreríaDb`.`Nacionalidades x Autor` (
  `Nacionalidad_Id` INT NOT NULL,
  `Autor_Id` INT NOT NULL,
  PRIMARY KEY (`Nacionalidad_Id`, `Autor_Id`),
  INDEX `fk_Nacionalidades x Autor_Autores1_idx` (`Autor_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Nacionalidades x Autor_Nacionalidades1`
    FOREIGN KEY (`Nacionalidad_Id`)
    REFERENCES `libreríaDb`.`Nacionalidades` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nacionalidades x Autor_Autores1`
    FOREIGN KEY (`Autor_Id`)
    REFERENCES `libreríaDb`.`Autores` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `libreríaDb`.`Editoriales` (
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `libreríaDb`.`Libros` (
  `ISBN` INT NOT NULL,
  `Título` VARCHAR(60) NULL,
  `Número_Páginas` INT NULL,
  `Editorial_Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `fk_Libros_Editoriales1_idx` (`Editorial_Nombre` ASC) VISIBLE,
  CONSTRAINT `fk_Libros_Editoriales1`
    FOREIGN KEY (`Editorial_Nombre`)
    REFERENCES `libreríaDb`.`Editoriales` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `libreríaDb`.`Libros x Autor` (
  `Autor_Id` INT NOT NULL,
  `Libros_ISBN` INT NOT NULL,
  PRIMARY KEY (`Autor_Id`, `Libros_ISBN`),
  INDEX `fk_Libros x Autor_Libros1_idx` (`Libros_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_Libros x Autor_Autores1`
    FOREIGN KEY (`Autor_Id`)
    REFERENCES `libreríaDb`.`Autores` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Libros x Autor_Libros1`
    FOREIGN KEY (`Libros_ISBN`)
    REFERENCES `libreríaDb`.`Libros` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `libreríaDb`.`Inventarios` (
  `Id` INT NOT NULL,
  `Cantidad` INT NULL,
  `Libros_ISBN` INT NOT NULL,
  PRIMARY KEY (`Id`, `Libros_ISBN`),
  INDEX `fk_Inventarios_Libros1_idx` (`Libros_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_Inventarios_Libros1`
    FOREIGN KEY (`Libros_ISBN`)
    REFERENCES `libreríaDb`.`Libros` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `libreríaDb`.`Géneros` (
  `Id` INT NOT NULL,
  `Género` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `libreríaDb`.`Géneros x Libro` (
  `Géneros_Id` INT NOT NULL,
  `Libro_ISBN` INT NOT NULL,
  PRIMARY KEY (`Géneros_Id`, `Libro_ISBN`),
  INDEX `fk_Géneros x Libro_Libros1_idx` (`Libro_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_Géneros x Libro_Géneros1`
    FOREIGN KEY (`Géneros_Id`)
    REFERENCES `libreríaDb`.`Géneros` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Géneros x Libro_Libros1`
    FOREIGN KEY (`Libro_ISBN`)
    REFERENCES `libreríaDb`.`Libros` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `libreríaDb`.`Libros en compra` (
  `Cantidad` INT NULL,
  `Subtotal` DECIMAL(6,2) NULL,
  `Libro_ISBN` INT NOT NULL,
  `Compra_Id` INT NOT NULL,
  PRIMARY KEY (`Libro_ISBN`, `Compra_Id`),
  INDEX `fk_Libros en compra_Compras1_idx` (`Compra_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Libros en compra_Libros1`
    FOREIGN KEY (`Libro_ISBN`)
    REFERENCES `libreríaDb`.`Libros` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Libros en compra_Compras1`
    FOREIGN KEY (`Compra_Id`)
    REFERENCES `libreríaDb`.`Compras` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

