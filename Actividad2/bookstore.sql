create database bookstore;

use bookstore;

CREATE TABLE IF NOT EXISTS Autor (
    Codigo varchar(20) PRIMARY KEY,
    Nombre VARCHAR(50) not null,
    Apellido VARCHAR(50),
    Nacionalidad VARCHAR(40),
    FechaNacimiento DATE
) ;

CREATE TABLE IF NOT EXISTS Cliente (
    ID varchar(20) PRIMARY KEY,
    Nombre VARCHAR(50) not null,
    Apellido VARCHAR(50),
    FechaNacimiento DATE,
    Correo varchar(100),
    Telefono varchar(20),
    Direccion varchar(100)
);

CREATE TABLE IF NOT EXISTS Editorial (
    Nombre VARCHAR(50) NOT NULL PRIMARY KEY,
    Pais VARCHAR(40),
    AnioFundacion Date,
    Direccion VARCHAR(100),
    Correo VARCHAR(100),
    Telefono VARCHAR(20)
)  ;

# Crear tablas con llave foranea
CREATE TABLE IF NOT EXISTS Libro (
    ISBN varchar(20) PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    NumeroPaginas BIGINT,
    Anio Date,
    Genero VARCHAR(30),
    Sinopsis VARCHAR(255),
    EditorialNombre VARCHAR(50) NOT NULL,
    FOREIGN KEY (EditorialNombre)
        REFERENCES Editorial (Nombre)
) ;

CREATE TABLE IF NOT EXISTS Compra (
    ID varchar(20) PRIMARY KEY,
    FechaCompra DATE,
    PrecioTotal double,
    ClienteID varchar(20),
    FOREIGN KEY (ClienteID)
        REFERENCES Cliente (ID)
) ;

CREATE TABLE IF NOT EXISTS Autor_Libro (
    AutorCodigo varchar(20),
    LibroISBN varchar(20),
    PRIMARY KEY (AutorCodigo , LibroISBN),
    FOREIGN KEY (AutorCodigo)
        REFERENCES Autor (Codigo),
    FOREIGN KEY (LibroISBN)
        REFERENCES Libro (ISBN)
);


CREATE TABLE IF NOT EXISTS Copia (
    ID varchar(20),
    Libro_id varchar(20),
    Id_compra varchar(20),
    precio double,
    PRIMARY KEY ( Libro_id  , ID),
    FOREIGN KEY (Libro_id)
        REFERENCES Libro (ISBN),
    FOREIGN KEY (Id_compra)
        REFERENCES Compra (ID)
);

