create database bookstore;

use bookstore;

CREATE TABLE IF NOT EXISTS Autor (
    Codigo INT NOT NULL PRIMARY KEY,
    Nombres VARCHAR(50) not null,
    Apellidos VARCHAR(50),
    Nacionalidad VARCHAR(40),
    FechaNacimiento DATE
) ;

CREATE TABLE IF NOT EXISTS Cliente (
    ID INT NOT NULL PRIMARY KEY,
    Nombres VARCHAR(50) not null,
    Apellidos VARCHAR(50),
    FechaNacimiento DATE,
    Correo varchar(100),
    Telefono varchar(20),
    Direccion varchar(100)
);

CREATE TABLE IF NOT EXISTS Editorial (
    Nombre VARCHAR(50) NOT NULL PRIMARY KEY,
    Pais VARCHAR(40),
    AnioFundacion INT,
    Direccion VARCHAR(100),
    Correo VARCHAR(100),
    Telefono VARCHAR(20)
)  ;

# Crear tablas con llave foranea
CREATE TABLE IF NOT EXISTS Libro (
    ISBN BIGINT NOT NULL PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    NumeroPaginas BIGINT,
    Precio INT,
    Anio INT,
    Genero VARCHAR(30),
    Sinopsis VARCHAR(255),
    EditorialNombre VARCHAR(50) NOT NULL,
    FOREIGN KEY (EditorialNombre)
        REFERENCES Editorial (Nombre)
) ;

CREATE TABLE IF NOT EXISTS Compra (
    ID INT NOT NULL PRIMARY KEY,
    FechaCompra DATE,
    PrecioTotal BIGINT,
    ClienteID INT not null,
    FOREIGN KEY (ClienteID)
        REFERENCES Cliente (ID)
) ;

# Crear tablas intermedias de relaciones muchos a muchos
CREATE TABLE IF NOT EXISTS Autor_Libro (
    AutorCodigo INT NOT NULL,
    LibroISBN BIGINT NOT NULL,
    PRIMARY KEY (AutorCodigo , LibroISBN),
    FOREIGN KEY (AutorCodigo)
        REFERENCES Autor (Codigo),
    FOREIGN KEY (LibroISBN)
        REFERENCES Libro (ISBN)
);

CREATE TABLE IF NOT EXISTS Compra_Libro (
    CompraID INT NOT NULL,
    LibroISBN BIGINT NOT NULL,
    Cantidad INT,
    PRIMARY KEY (CompraID , LibroISBN),
    FOREIGN KEY (CompraID)
        REFERENCES Compra (ID),
    FOREIGN KEY (LibroISBN)
        REFERENCES Libro (ISBN)
);