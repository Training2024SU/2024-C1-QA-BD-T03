CREATE SCHEMA `libreria_andres`;

USE libreria_andres;

CREATE TABLE editorial (
    nombre_editorial VARCHAR (100) PRIMARY KEY,
    pais  VARCHAR(30) NOT NULL,
    direccion VARCHAR(150) NOT NULL
 );

CREATE TABLE libro (
    ISBN INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    numero_paginas INT NOT NULL,
    nombre_editorial VARCHAR(100) NOT NULL,
    FOREIGN KEY (nombre_editorial) REFERENCES editorial(nombre_editorial)
);

CREATE TABLE nacionalidad (
    id_nacionalidad VARCHAR(20) PRIMARY KEY,
    nombre_nacionalidad VARCHAR(50) NOT NULL
);

CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_autor VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_nacionalidad VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_nacionalidad) REFERENCES nacionalidad(id_nacionalidad)
);

CREATE TABLE escribir_libro (
    id_autor INT NOT NULL,
    ISBN INT NOT NULL,
    PRIMARY KEY (id_autor, ISBN),
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor),
    FOREIGN KEY (ISBN) REFERENCES libro(ISBN)
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    direccion VARCHAR(150) NOT NULL
);

CREATE TABLE telefono_cliente (
    id_cliente INT NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_cliente, telefono),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE compra_libro (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    ISBN INT NOT NULL,
    fecha_compra DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (ISBN) REFERENCES libro(ISBN)
);
