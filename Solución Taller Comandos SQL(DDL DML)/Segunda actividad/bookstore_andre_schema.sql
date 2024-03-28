# Borrar base de datos
# DROP DATABASE bookstore_andre;

# Crear base de datos
CREATE DATABASE IF NOT EXISTS bookstore_andre;

USE bookstore_andre;

# Crear tablas sin referencias
CREATE TABLE IF NOT EXISTS Autores (
    codigo INT NOT NULL PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50),
    nacionalidad VARCHAR(40),
    fecha_nacimiento DATE
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Clientes (
    dni varchar(30) NOT NULL PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50),
    email VARCHAR(100)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Editoriales (
    nombre VARCHAR(50) NOT NULL PRIMARY KEY,
    email VARCHAR(100),
    pais VARCHAR(40),
    ciudad VARCHAR(40),
    direccion VARCHAR(100),
    zip_code VARCHAR(20)
)  ENGINE=INNODB;

# Crear tablas de atributos multivaluados
CREATE TABLE IF NOT EXISTS Editorial_Telefonos (
    nombre_editorial VARCHAR(50) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    FOREIGN KEY (nombre_editorial)
        REFERENCES Editoriales (nombre),
    PRIMARY KEY (nombre_editorial , numero)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Cliente_Telefonos (
    dni_cliente varchar(30) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    FOREIGN KEY (dni_cliente)
        REFERENCES Clientes (dni),
    PRIMARY KEY (dni_cliente , numero)
)  ENGINE=INNODB;

# Crear tablas con llave foranea
CREATE TABLE IF NOT EXISTS Libros (
    isbn BIGINT NOT NULL PRIMARY KEY, # ISBN son 13 digitos numericos
    titulo VARCHAR(255) NOT NULL,
    Precio INT,
    Fecha_Publicacion DATE,
    numero_paginas BIGINT,
    nombre_editorial VARCHAR(50) NOT NULL,
    FOREIGN KEY (nombre_editorial)
        REFERENCES Editoriales (Nombre)
)  ENGINE=INNODB;

# Crear tablas intermedias de relaciones muchos a muchos
CREATE TABLE IF NOT EXISTS Autores_Libros (
    id_autor_libro Varchar(32) NOT NULL PRIMARY KEY, # concatenado de las llaves de autor y libro
    codigo_autor INT NOT NULL,
    isbn_libro BIGINT NOT NULL,
    rol varchar(32),
    FOREIGN KEY (codigo_autor)
        REFERENCES Autores (codigo),
    FOREIGN KEY (isbn_libro)
        REFERENCES Libros (isbn)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Clientes_Libros (
    id_compra VARCHAR(41) NOT NULL PRIMARY KEY, # concatenado de las llaves de cliente y libro
    dni_cliente varchar(30) NOT NULL,
    isbn_libro BIGINT NOT NULL,
    fecha_compra date,
    precio_unidad int,
    cantidad INT,
    FOREIGN KEY (dni_cliente)
        REFERENCES Clientes (dni),
    FOREIGN KEY (isbn_libro)
        REFERENCES Libros (isbn)
)  ENGINE=INNODB;