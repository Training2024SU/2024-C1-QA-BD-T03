-- Poblar la tabla Country
INSERT INTO `Country` (`idPais`, `Nombre`) VALUES
(1, 'Estados Unidos'),
(2, 'Reino Unido');

-- Poblar la tabla Autor
INSERT INTO `Autor` (`IdAutor`, `Nombres`, `Apellidos`, `IdPais`, `FechaNacimiento`) VALUES
(1, 'John', 'Smith', 1, '1980-05-15'),
(2, 'Emily', 'Johnson', 2, '1975-10-22');

-- Poblar la tabla Editorial
INSERT INTO `Editorial` (`IdEditorial`, `Nombre`) VALUES
(1, 'Penguin Books'),
(2, 'Random House');

-- Poblar la tabla Libro
INSERT INTO `Libro` (`ISBN`, `Titulo`, `NumeroPaginas`, `IdEditorial`) VALUES
(123456789, 'The Great Gatsby', 250, 1),
(987654321, 'Harry Potter and the Philosopher''s Stone', 320, 2);

-- Poblar la tabla Escritura
INSERT INTO `Escritura` (`ISBNLibro`, `IdAutor`) VALUES
(123456789, 1),
(987654321, 2);

-- Poblar la tabla Cliente
INSERT INTO `Cliente` (`IdCliente`, `Nombre`) VALUES
(1, 'Maria Perez'),
(2, 'Juan Garcia');

-- Poblar la tabla CompraLibroCliente
INSERT INTO `CompraLibroCliente` (`IdCompra`, `ISBNLibro`, `IdCliente`, `Fecha`, `Precio`) VALUES
(1, 123456789, 1, '2024-03-29', 25.99),
(2, 987654321, 2, '2024-03-28', 19.99);
