
-- Crear esquema llamada "Libreria"
CREATE SCHEMA IF NOT EXISTS `libreria_busca_libre`;
USE  `libreria_busca_libre`

-- Crear tabla libro
CREATE TABLE IF NOT EXISTS `libro` (
  `ISBN` varchar(45) NOT NULL,
  `Nombre_editorial` varchar(45) NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  `Fecha_publicacion` date NOT NULL,
  `Numero_paginas` int NOT NULL,
  `Precio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `Nombre_idx` (`Nombre_editorial`),
  CONSTRAINT `Nombre` 
  FOREIGN KEY (`Nombre_editorial`) 
  REFERENCES `editorial` (`Nombre`)
);

-- Crear tabla autor
CREATE TABLE IF NOT EXISTS `autor` (
  `Codigo` varchar(45) NOT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Nacionalidad` varchar(45) NOT NULL,
  `Fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`Codigo`)
);

-- Crear tabla autor-x-libro
CREATE TABLE IF NOT EXISTS `autor_x_libro` (
  `ID-autor-libro` varchar(45) NOT NULL,
  `Codigo` varchar(45) NOT NULL,
  `ISBN` varchar(45) NOT NULL,
  `Rol` varchar(45) NOT NULL,
  PRIMARY KEY (`ID-autor_libro`),
  KEY `Codigo-autor_idx` (`Codigo`),
  KEY `ISBN_idx` (`ISBN`),
  CONSTRAINT `Codigo` 
  FOREIGN KEY (`Codigo`) 
  REFERENCES `autor` (`Codigo`),
  CONSTRAINT `ISBN` 
  FOREIGN KEY (`ISBN`) 
  REFERENCES `libro` (`ISBN`)
); 

-- Crear tabla editorial
CREATE TABLE IF NOT EXISTS `editorial` (
  `Nombre` varchar(45) NOT NULL,
  `Correo_electronico` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Pais` varchar(45) NOT NULL,
  PRIMARY KEY (`Nombre`)
);

-- Crear tabla teléfono editorial
CREATE TABLE IF NOT EXISTS `telefono_editorial` (
  `Nombre_editorial` varchar(45) NOT NULL,
  `Numero` varchar(20) NOT NULL,
  PRIMARY KEY (`Nombre_editorial`),
  CONSTRAINT `Nombre_editorial` 
  FOREIGN KEY (`Nombre_editorial`) 
  REFERENCES `editorial` (`Nombre`)
);

-- Crear tabla cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `DNI` varchar(45) NOT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Correo_electronico` varchar(45) NOT NULL,
  PRIMARY KEY (`DNI`)
);

-- Crear tabla teléfono cliente
CREATE TABLE IF NOT EXISTS `telefono_cliente` (
  `DNI_cliente` varchar(45) NOT NULL,
  `Numero` varchar(45) NOT NULL,
  PRIMARY KEY (`DNI_cliente`),
  CONSTRAINT `DNI_cliente` 
  FOREIGN KEY (`DNI_cliente`) 
  REFERENCES `cliente` (`DNI`)
);

-- Crear tabla compra-libros
CREATE TABLE IF NOT EXISTS `compra_libros` (
  `ID-compra` int NOT NULL,
  `DNI` varchar(45) NOT NULL,
  `Codigo_ISBN` varchar(45) NOT NULL,
  `Fecha_compra` datetime(6) NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio_unitario` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID_compra`),
  KEY `DNI_idx` (`DNI`),
  KEY `Codigo_ISBN_idx` (`Codigo_ISBN`),
  CONSTRAINT `Codigo_ISBN` 
  FOREIGN KEY (`Codigo_ISBN`) 
  REFERENCES `libro` (`ISBN`),
  CONSTRAINT `DNI` 
  FOREIGN KEY (`DNI`) 
  REFERENCES `cliente` (`DNI`)
);

