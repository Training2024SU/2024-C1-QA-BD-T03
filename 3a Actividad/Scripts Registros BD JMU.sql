USE busca_libre;

-- Insertar registros en la tabla editorial
INSERT INTO editorial (nombre_editorial, direccion, email)
VALUES ('Grupo Editorial Norma', 'Av El Dorado 90-10 Bogotá', 'info@editorialnorma.com'),
       ('Editorial Aguilar', 'Crra 11A #98-50 Of 501 Bogotá', 'info@editorialaguilar.com');

-- Insertar registros en la tabla telefono_editorial
INSERT INTO telefono_editorial (nombre_editorial, telefono)
VALUES ('Grupo Editorial Norma', '123-456-7890'),
       ('Editorial Aguilar', '987-654-3210');
       
-- Insertar registros en la tabla categoria_literaria
INSERT INTO categoria_literaria (id_categoria_literaria, nombre_categoria)
VALUES ('CL001', 'Crecimiento Personal'),
       ('CL002', 'Finanzas');

-- Insertar registros en la tabla libro
INSERT INTO libro (ISBN, titulo, anio_publicacion, numero_paginas, nombre_editorial, valor, id_categoria_literaria)
VALUES ('978-0141922326', 'Exceso de Equipaje', 1949, 328, 'Grupo Editorial Norma', 75000, 'CL001'),
       ('978-0061120084', 'Mujer Millonaria', 1960, 281, 'Editorial Aguilar', 70000, 'CL002');

-- Insertar registros en la tabla nacionalidad
INSERT INTO nacionalidad (id_nacionalidad, nombre_nacionalidad)
VALUES ('NAC001', 'Estadounidense'),
       ('NAC002', 'Indú');

-- Insertar registros en la tabla autor
INSERT INTO autor (codigo_autor, nombre_autor, fecha_nacimiento, edad, id_nacionalidad)
VALUES ('AUT001', 'Judith Sills', '1903-06-25', 46, 'NAC002'),
       ('AUT002', 'Kim Kiyosaki', '1926-04-28', 97, 'NAC001');

-- Insertar registros en la tabla libro_autor
INSERT INTO libro_autor (codigo_autor, ISBN)
VALUES ('AUT001', '978-0141922326'),
       ('AUT002', '978-0061120084');

-- Insertar registros en la tabla cliente
INSERT INTO cliente (id_cliente, nombre_completo, email)
VALUES ('CLI001', 'Juan Pérez', 'juanperez@yahoo.com'),
       ('CLI002', 'María Gómez', 'mariag@gmail.com');

-- Insertar registros en la tabla telefono_cliente
INSERT INTO telefono_cliente (id_cliente, telefono)
VALUES ('CLI001', '319-123-4567'),
       ('CLI002', '315-987-6543');

-- Insertar registros en la tabla compra
INSERT INTO compra (id_cliente, ISBN, fecha_compra)
VALUES ('CLI001', '978-0141922326', '2024-03-27'),
       ('CLI002', '978-0061120084', '2024-03-20');