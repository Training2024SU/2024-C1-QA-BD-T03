-- Insertar registros en la tabla Editorial
INSERT INTO Editorial (Nombre) VALUES ('Editorial A'), ('Editorial B');

-- Insertar registros en la tabla Cliente
INSERT INTO Cliente (Nombre, Fecha_nacimiento) VALUES ('Juan', '1990-01-01'), ('María', '1985-05-15');

-- Insertar registros en la tabla Inventario
INSERT INTO Inventario () VALUES (), ();

-- Insertar registros en la tabla Libro
INSERT INTO Libro (ISBN, Titulo, nPaginas, NombreEditorial, IdInventario) VALUES 
('1234567890', 'Libro 1', 200, 'Editorial A', 1),
('0987654321', 'Libro 2', 300, 'Editorial B', 2);

-- Insertar registros en la tabla Autor
INSERT INTO Autor (Nombre, Apellidos, Fecha_Nacimiento, Nacionalidad) VALUES 
('Autor 1', 'Apellidos 1', '1980-03-10', 'Nacionalidad 1'),
('Autor 2', 'Apellidos 2', '1975-08-20', 'Nacionalidad 2');

-- Insertar registros en la tabla AutorLibro
INSERT INTO AutorLibro (ISBNLibro, IdAutor) VALUES 
('1234567890', 1), ('0987654321', 2);

-- Insertar registros en la tabla ClienteLibro
INSERT INTO ClienteLibro (CedulaCliente, ISBNLibro) VALUES 
(1, '1234567890'), (2, '0987654321');

-- Insertar registros en la tabla Genero
INSERT INTO Genero (Genero) VALUES ('Género 1'), ('Género 2');

-- Insertar registros en la tabla LibroGenero
INSERT INTO LibroGenero (IdGenero, ISBNLibro) VALUES 
(1, '1234567890'), (2, '0987654321');
