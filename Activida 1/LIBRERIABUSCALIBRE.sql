-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS libreria_buscalibre;

-- Seleccionar la base de datos
USE libreria_buscalibre;

-- Crear la tabla Cliente
CREATE TABLE IF NOT EXISTS Cliente (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Direccion VARCHAR(255),
    Telefono VARCHAR(100),
    Codigo INT
);

-- Crear la tabla Editorial
CREATE TABLE IF NOT EXISTS Editorial (
    Nombre VARCHAR(255) PRIMARY KEY,
    Direccion VARCHAR(255),
    Ciudad VARCHAR(255),
    Pais VARCHAR(255),
    Telefono VARCHAR(100)
);

-- Crear la tabla Libro
CREATE TABLE IF NOT EXISTS Libro (
    ISBN VARCHAR(100) PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Numero_Paginas INT,
    Nombre_Editorial VARCHAR(255),
    FOREIGN KEY (Nombre_Editorial) REFERENCES Editorial(Nombre)
);

-- Crear la tabla Autor
CREATE TABLE IF NOT EXISTS Autor (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Nacionalidad VARCHAR(100),
    Fecha_Nacimiento DATE
);

-- Crear la tabla Compra
CREATE TABLE IF NOT EXISTS Compra (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FechaCompra DATE,
    Id_cliente INT,
    ISBN VARCHAR(255),
    Cantidad INT,
    FOREIGN KEY (Id_cliente) REFERENCES Cliente(ID),
    FOREIGN KEY (ISBN) REFERENCES Libro(ISBN)
);

-- Crear la tabla Libro_Autor para representar la relación N, M entre Libro y Autor
CREATE TABLE IF NOT EXISTS Libro_Autor (
    Libro_ISBN VARCHAR(255),
    Codigo_autor INT,
    PRIMARY KEY (Libro_ISBN, Codigo_autor),
    FOREIGN KEY (Libro_ISBN) REFERENCES Libro(ISBN),
    FOREIGN KEY (Codigo_autor) REFERENCES Autor(Codigo)
);
