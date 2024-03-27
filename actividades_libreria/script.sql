-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS libreria_buscalibre_;

-- Seleccionar la base de datos
USE libreria_buscalibre_;

-- Crear la tabla Cliente
CREATE TABLE IF NOT EXISTS Cliente (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL
);

-- Crear la tabla Editorial
CREATE TABLE IF NOT EXISTS Editorial (
    Nombre VARCHAR(255) PRIMARY KEY
);

-- Crear la tabla Libro
CREATE TABLE IF NOT EXISTS Libro (
    ISBN VARCHAR(20) PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Numero_Paginas INT,
    Editorial_Nombre VARCHAR(255),
    FOREIGN KEY (Editorial_Nombre) REFERENCES Editorial(Nombre)
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
    Fecha_Compra DATE,
    ID_Cliente INT,
    ISBN_Libro VARCHAR(20),
    Cantidad INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID),
    FOREIGN KEY (ISBN_Libro) REFERENCES Libro(ISBN)
);

-- Crear la tabla Libro_Autor para representar la relación N, M entre Libro y Autor
CREATE TABLE IF NOT EXISTS Libro_Autor (
    ISBN_Libro VARCHAR(20),
    Codigo_Autor INT,
    PRIMARY KEY (ISBN_Libro, Codigo_Autor),
    FOREIGN KEY (ISBN_Libro) REFERENCES Libro(ISBN),
    FOREIGN KEY (Codigo_Autor) REFERENCES Autor(Codigo)
);

