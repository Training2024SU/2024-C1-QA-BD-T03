-- Poblar tabla Cliente
INSERT INTO Cliente (Cedula, Nombre, Fecha_nacimiento) VALUES 
('1234567890', 'Juan Perez', '1990-05-15'),
('9876543210', 'Maria Rodriguez', '1985-10-20'),
('4567890123', 'Carlos Garcia', '1988-03-25');

-- Poblar tabla Compra
INSERT INTO Compra (IdCompra, Total, Fecha, Cedula_Cliente) VALUES 
('COMP001', 150.50, '2024-04-01', '1234567890'),
('COMP002', 75.25, '2024-04-02', '9876543210'),
('COMP003', 200.00, '2024-04-03', '4567890123');

-- Poblar tabla Autor
INSERT INTO Autor (IdAutor, Nombre, Fecha_nacimiento) VALUES 
('AUT001', 'Gabriel Garcia Marquez', '1927-03-06'),
('AUT002', 'Mario Vargas Llosa', '1936-03-28'),
('AUT003', 'Isabel Allende', '1942-08-02');

-- Poblar tabla Editorial
INSERT INTO Editorial (Nombre_editorial) VALUES 
('Alfaguara'),
('Planeta'),
('Santillana');

-- Poblar tabla Libro
INSERT INTO Libro (ISBN, Titulo, nPaginas, Cantidad, Precio, Nombre_editorial) VALUES 
('978-0307474727', 'Cien años de soledad', '432', 100, 15.99, 'Alfaguara'),
('978-8408028665', 'La casa de los espíritus', '432', 80, 12.50, 'Planeta'),
('978-8466332507', 'Conversación en la Catedral', '640', 120, 18.75, 'Santillana');

-- Poblar tabla Libro_autor
INSERT INTO Libro_autor (ISBN_libro, IdAutor) VALUES 
('978-0307474727', 'AUT001'),
('978-8408028665', 'AUT003'),
('978-8466332507', 'AUT002');

-- Poblar tabla Genero
INSERT INTO Genero (IdGenero, Genero) VALUES 
('GEN001', 'Realismo mágico'),
('GEN002', 'Novela histórica'),
('GEN003', 'Novela política');

-- Poblar tabla Genero_libro
INSERT INTO Genero_libro (ISBN_Libro, IdGenero) VALUES 
('978-0307474727', 'GEN001'),
('978-8408028665', 'GEN001'),
('978-8466332507', 'GEN002');

-- Poblar tabla Compra_libro
INSERT INTO Compra_libro (IdCompra, ISBN_Libro, Cantidad, Total) VALUES 
('COMP001', '978-0307474727', 2, 31.98),
('COMP002', '978-8408028665', 1, 12.50),
('COMP003', '978-8466332507', 3, 56.25);

-- Poblar tabla Alquiler
INSERT INTO Alquiler (idAlquiler, FechaAlquiler, DiasAlquiler, PlazoMaximo, CedulaCliente) VALUES 
('ALQ001', '2024-04-01', 7, '2024-04-08', '1234567890'),
('ALQ002', '2024-04-02', 5, '2024-04-07', '9876543210'),
('ALQ003', '2024-04-03', 3, '2024-04-06', '4567890123');

-- Poblar tabla Alquiler_libro
INSERT INTO Alquiler_libro (ISBNLibro, IdAlquiler, Cantidad, Total) VALUES 
('978-0307474727', 'ALQ001', 1, 15.99),
('978-8408028665', 'ALQ002', 2, 25.00),
('978-8466332507', 'ALQ003', 1, 18.75);

-- Poblar tabla Resena_libro
INSERT INTO Resena_libro (CedulaPersona, ISBNLibro, Resena) VALUES 
('1234567890', '978-0307474727', 4.5),
('9876543210', '978-8408028665', 3.8),
('4567890123', '978-8466332507', 4.2);
