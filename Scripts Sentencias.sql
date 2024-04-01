CREATE SCHEMA `busca_libre`;

USE busca_libre;

CREATE TABLE editorial (
    nombre_editorial VARCHAR (100) PRIMARY KEY,
    direccion VARCHAR(150) NOT NULL,
    email  VARCHAR(150) NOT NULL
);

CREATE TABLE telefono_editorial (
    nombre_editorial VARCHAR(100),
    telefono VARCHAR(20),
    PRIMARY KEY (nombre_editorial, telefono),
    FOREIGN KEY (nombre_editorial) REFERENCES editorial(nombre_editorial)
);

CREATE TABLE libro (
    ISBN VARCHAR(40) PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    anio_publicacion YEAR NOT NULL,
    numero_paginas INT NOT NULL,
    nombre_editorial VARCHAR(100) NOT NULL,
    valor INT NOT NULL,
    FOREIGN KEY (nombre_editorial) REFERENCES editorial(nombre_editorial)
);

CREATE TABLE categoria_literaria (
    id_categoria_literaria VARCHAR(20) PRIMARY KEY,
    nombre_categoria VARCHAR(30) NOT NULL
);

ALTER TABLE libro
ADD COLUMN id_categoria_literaria VARCHAR(20),
ADD FOREIGN KEY (id_categoria_literaria) REFERENCES categoria_literaria(id_categoria_literaria);

CREATE TABLE nacionalidad (
    id_nacionalidad VARCHAR(30) PRIMARY KEY,
    nombre_nacionalidad VARCHAR(30) NOT NULL
);

CREATE TABLE autor (
    codigo_autor VARCHAR(20) PRIMARY KEY,
    nombre_autor VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    edad INT NOT NULL,
    id_nacionalidad VARCHAR(30) NOT NULL,
    FOREIGN KEY (id_nacionalidad) REFERENCES nacionalidad(id_nacionalidad)
);

CREATE TABLE libro_autor (
    codigo_autor VARCHAR(20) NOT NULL,
    ISBN VARCHAR(40) NOT NULL,
    PRIMARY KEY (codigo_autor, ISBN),
    FOREIGN KEY (codigo_autor) REFERENCES autor(codigo_autor),
    FOREIGN KEY (ISBN) REFERENCES libro(ISBN)
);

CREATE TABLE cliente (
    id_cliente VARCHAR(20) PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL
);

CREATE TABLE telefono_cliente (
    id_cliente VARCHAR(20),
    telefono VARCHAR(20),
    PRIMARY KEY (id_cliente, telefono),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente VARCHAR(20) NOT NULL,
    ISBN VARCHAR(40) NOT NULL,
    fecha_compra DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (ISBN) REFERENCES libro(ISBN)
);






