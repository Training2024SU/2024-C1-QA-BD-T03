# Borrar base de datos
# drop database bookstore;

# Crear base de datos
create database if not exists bookstore;

use bookstore;

# Crear tablas sin referencias
CREATE TABLE IF NOT EXISTS Autores (
    Codigo INT NOT NULL PRIMARY KEY,
    Nombres VARCHAR(50) not null,
    Apellidos VARCHAR(50),
    Nacionalidad VARCHAR(40),
    FechaNacimiento DATE
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Clientes (
    ID INT NOT NULL PRIMARY KEY,
    Nombres VARCHAR(50) not null,
    Apellidos VARCHAR(50),
    FechaNacimiento DATE,
    Correo varchar(100),
    Telefono varchar(20),
    Direccion varchar(100)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Editoriales (
    Nombre VARCHAR(50) NOT NULL PRIMARY KEY,
    Pais VARCHAR(40),
    AnioFundacion INT,
    Direccion VARCHAR(100),
    Correo VARCHAR(100),
    Telefono VARCHAR(20)
)  ENGINE=INNODB;

# Crear tablas con llave foranea
CREATE TABLE IF NOT EXISTS Libros (
    ISBN BIGINT NOT NULL PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    NumeroPaginas BIGINT,
    Precio INT,
    Anio INT,
    Genero VARCHAR(30),
    Sinopsis VARCHAR(255),
    EditorialNombre VARCHAR(50) NOT NULL,
    FOREIGN KEY (EditorialNombre)
        REFERENCES Editoriales (Nombre)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Compras (
    ID INT NOT NULL PRIMARY KEY,
    FechaCompra DATE,
    PrecioTotal BIGINT,
    ClienteID INT not null,
    FOREIGN KEY (ClienteID)
        REFERENCES Clientes (ID)
)  ENGINE=INNODB;

# Crear tablas intermedias de relaciones muchos a muchos
CREATE TABLE IF NOT EXISTS Autores_Libros (
    AutorCodigo INT NOT NULL,
    LibroISBN BIGINT NOT NULL,
    PRIMARY KEY (AutorCodigo , LibroISBN),
    FOREIGN KEY (AutorCodigo)
        REFERENCES Autores (Codigo),
    FOREIGN KEY (LibroISBN)
        REFERENCES Libros (ISBN)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Compras_Libros (
    CompraID INT NOT NULL,
    LibroISBN BIGINT NOT NULL,
    Cantidad INT,
    PRIMARY KEY (CompraID , LibroISBN),
    FOREIGN KEY (CompraID)
        REFERENCES Compras (ID),
    FOREIGN KEY (LibroISBN)
        REFERENCES Libros (ISBN)
)  ENGINE=INNODB;