-- Crear base de datos llamada "libreria_daniel_morales"
CREATE DATABASE libreria_daniel_morales;

-- Crear tabla Cliente
CREATE TABLE `cliente` (
  `ID` varchar(30) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
);

-- Crear tabla Libro
CREATE TABLE `libro` (
  `ISBN` varchar(20) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Numero_paginas` int NOT NULL,
  `Editorial_nombre` varchar(255) NOT NULL,
  `Precio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `Editorial_nombre_idx` (`Editorial_nombre`),
  CONSTRAINT `Editorial_nombre` FOREIGN KEY (`Editorial_nombre`) REFERENCES `editorial` (`Nombre`)
);

-- Crear tabla Compra
CREATE TABLE `compra` (
  `ID` int NOT NULL,
  `ID_cliente` varchar(30) NOT NULL,
  `ISBN_libro` varchar(20) NOT NULL,
  `Fecha_compra` datetime(6) NOT NULL,
  `Cantidad` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_cliente_idx` (`ID_cliente`),
  KEY `ISBN_idx` (`ISBN_libro`),
  CONSTRAINT `ID` FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID`),
  CONSTRAINT `ISBN` FOREIGN KEY (`ISBN_libro`) REFERENCES `libro` (`ISBN`)
);

-- Crear tabla Autor
CREATE TABLE `autor` (
  `Codigo` int NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Nacionalidad` varchar(200) NOT NULL,
  `Fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`Codigo`)
);

-- Crear tabla Libro_Autor
CREATE TABLE `libro_autor` (
  `ISBN_Libro` varchar(255) NOT NULL,
  `Codigo_autor` int NOT NULL,
  PRIMARY KEY (`ISBN_Libro`),
  KEY `Codigo_autor_idx` (`Codigo_autor`),
  CONSTRAINT `Codigo_autor` FOREIGN KEY (`Codigo_autor`) REFERENCES `autor` (`Codigo`),
  CONSTRAINT `ISBN_libro` FOREIGN KEY (`ISBN_Libro`) REFERENCES `libro` (`ISBN`)
);

-- Crear tabla Editorial
CREATE TABLE `editorial` (
  `Nombre` varchar(255) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Ciudad` varchar(255) NOT NULL,
  `Pais` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`Nombre`)
);