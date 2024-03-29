
-- Crear base de datos llamada "Libreria"

CREATE DATABASE libreria;

-- Crear tabla libro
CREATE TABLE `libro` (
  `ISBN` varchar(45) NOT NULL,
  `Nombre-editorial` varchar(45) NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  `Fecha-publicacion` date NOT NULL,
  `Numero-paginas` int NOT NULL,
  `Precio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `Nombre_idx` (`Nombre-editorial`),
  CONSTRAINT `Nombre` FOREIGN KEY (`Nombre-editorial`) REFERENCES `editorial` (`Nombre`)
);

-- Crear tabla autor
CREATE TABLE `autor` (
  `Codigo` varchar(45) NOT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Nacionalidad` varchar(45) NOT NULL,
  `Fecha-nacimiento` date NOT NULL,
  PRIMARY KEY (`Codigo`)
);

-- Crear tabla autor-x-libro
CREATE TABLE `autor-x-libro` (
  `ID-autor-libro` varchar(45) NOT NULL,
  `Codigo` varchar(45) NOT NULL,
  `ISBN` varchar(45) NOT NULL,
  `Rol` varchar(45) NOT NULL,
  PRIMARY KEY (`ID-autor-libro`),
  KEY `Codigo-autor_idx` (`Codigo`),
  KEY `ISBN_idx` (`ISBN`),
  CONSTRAINT `Codigo` FOREIGN KEY (`Codigo`) REFERENCES `autor` (`Codigo`),
  CONSTRAINT `ISBN` FOREIGN KEY (`ISBN`) REFERENCES `libro` (`ISBN`)
); 

-- Crear tabla editorial
CREATE TABLE `editorial` (
  `Nombre` varchar(45) NOT NULL,
  `Correo-electronico` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Pais` varchar(45) NOT NULL,
  PRIMARY KEY (`Nombre`)
);

-- Crear tabla teléfono editorial
CREATE TABLE `telefono-editorial` (
  `Nombre-editorial` varchar(45) NOT NULL,
  `Numero` varchar(20) NOT NULL,
  PRIMARY KEY (`Nombre-editorial`),
  CONSTRAINT `Nombre-editorial` FOREIGN KEY (`Nombre-editorial`) REFERENCES `editorial` (`Nombre`)
);

-- Crear tabla cliente
CREATE TABLE `cliente` (
  `DNI` varchar(45) NOT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Correo-electronico` varchar(45) NOT NULL,
  PRIMARY KEY (`DNI`)
);

-- Crear tabla teléfono cliente
CREATE TABLE `telefono-cliente` (
  `DNI-cliente` varchar(45) NOT NULL,
  `Numero` varchar(45) NOT NULL,
  PRIMARY KEY (`DNI-cliente`),
  CONSTRAINT `DNI-cliente` FOREIGN KEY (`DNI-cliente`) REFERENCES `cliente` (`DNI`)
);

-- Crear tabla compra-libros
CREATE TABLE `compra-libros` (
  `ID-compra` int NOT NULL,
  `DNI` varchar(45) NOT NULL,
  `Codigo-ISBN` varchar(45) NOT NULL,
  `Fecha-compra` datetime(6) NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio-unitario` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID-compra`),
  KEY `DNI_idx` (`DNI`),
  KEY `Codigo-ISBN_idx` (`Codigo-ISBN`),
  CONSTRAINT `Codigo-ISBN` FOREIGN KEY (`Codigo-ISBN`) REFERENCES `libro` (`ISBN`),
  CONSTRAINT `DNI` FOREIGN KEY (`DNI`) REFERENCES `cliente` (`DNI`)
);

