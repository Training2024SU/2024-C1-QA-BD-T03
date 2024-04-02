-- Llenar tabla Cliente
INSERT INTO `Cliente` (`Cedula`, `Nombre`, `Fecha_nacimiento`) VALUES
('1234567890', 'Juan Perez', '1990-01-01'),
('9876543210', 'Maria Lopez', '1985-05-10');

-- Llenar tabla Compra
INSERT INTO `Compra` (`IdCompra`, `Total`, `Fecha`, `Cedula_Cliente`) VALUES
('COMPRA1', 100.50, '2024-03-30', '1234567890'),
('COMPRA2', 75.25, '2024-03-29', '9876543210');

-- Llenar tabla Autor
INSERT INTO `Autor` (`IdAutor`, `Nombre`, `Fecha_nacimiento`) VALUES
('AUT1', 'Gabriel Garcia Marquez', '1927-03-06'),
('AUT2', 'Isabel Allende', '1942-08-02');

-- Llenar tabla Editorial
INSERT INTO `Editorial` (`Nombre_editorial`) VALUES
('Editorial XYZ'),
('Editorial ABC');

-- Llenar tabla Libro
INSERT INTO `Libro` (`ISBN`, `Titulo`, `nPaginas`, `Cantidad`, `Precio`, `Nombre_editorial`) VALUES
('ISBN1', 'Cien años de soledad', '500', 100, 20.99, 'Editorial XYZ'),
('ISBN2', 'La casa de los espíritus', '400', 80, 15.50, 'Editorial ABC');

-- Llenar tabla Libro_autor
INSERT INTO `Libro_autor` (`ISBN_libro`, `IdAutor`) VALUES
('ISBN1', 'AUT1'),
('ISBN2', 'AUT2');

-- Llenar tabla Genero
INSERT INTO `Genero` (`IdGenero`, `Genero`) VALUES
('GEN1', 'Ficción'),
('GEN2', 'Drama');

-- Llenar tabla Genero_libro
INSERT INTO `Genero_libro` (`ISBN_Libro`, `IdGenero`) VALUES
('ISBN1', 'GEN1'),
('ISBN2', 'GEN2');

-- Llenar tabla Compra_libro
INSERT INTO `Compra_libro` (`IdCompra`, `ISBN_Libro`, `Cantidad`, `Total`) VALUES
('COMPRA1', 'ISBN1', 2, 41.98),
('COMPRA2', 'ISBN2', 3, 46.50);
