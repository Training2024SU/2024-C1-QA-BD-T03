CREATE database libreria;
use libreria;

CREATE TABLE editorial (
    Nombre_editorial VARCHAR(30) PRIMARY KEY,
    ciudad VARCHAR(20) not null
);

CREATE TABLE libro (
    ISBN varchar(13) PRIMARY KEY,
    titulo VARCHAR(80),
    Numero_paginas VARCHAR(5),
    Nombre_editorial VARCHAR(30),
    FOREIGN KEY (Nombre_editorial) REFERENCES editorial(Nombre_editorial)
);

CREATE TABLE autor (
    Codigo_autor VARCHAR(15) PRIMARY KEY,
    Nacionalidad VARCHAR(50),
    Fecha_de_nacimiento VARCHAR(35)
);

CREATE TABLE cliente (
    Cedula INTEGER PRIMARY KEY,
    Nombre VARCHAR(80),
    E_mail VARCHAR(60)
);

CREATE TABLE telefono_cliente (
    NumeroDeTelefono INTEGER,
    cedula_cliente INTEGER,
    PRIMARY KEY(cedula_cliente),
    FOREIGN KEY (cedula_cliente) REFERENCES cliente(Cedula)
);

CREATE TABLE autorLibro (
    ISBN varchar(13),
    Codigo_autor VARCHAR(15),
    FOREIGN KEY (ISBN) REFERENCES libro(ISBN),
    FOREIGN KEY (Codigo_autor) REFERENCES autor(Codigo_autor)
);

CREATE TABLE compra_libro (
    ISBN varchar(13),
    cedula_cliente INTEGER,
    FOREIGN KEY (ISBN) REFERENCES libro(ISBN),
    FOREIGN KEY (cedula_cliente) REFERENCES cliente(Cedula)
);
