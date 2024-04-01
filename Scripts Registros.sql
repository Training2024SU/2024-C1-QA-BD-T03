-- Insertar registros en la tabla 'editorial'
INSERT INTO editorial (nombre_editorial, pais, direccion)
VALUES ('Grupo Editorial Norma', 'Colombia', 'Av El Dorado 90-10 Bogotá'),
       ('Editorial Aguilar', 'Colombia', 'Crra 11A #98-50 Of 501 Bogotá');

-- Insertar registros en la tabla 'libro'
INSERT INTO libro (titulo, numero_paginas, nombre_editorial)
VALUES ('Exceso de Equipaje', 308, 'Grupo Editorial Norma'),
       ('Mujer Millonaria', 319, 'Editorial Aguilar');

-- Insertar registros en la tabla 'nacionalidad'
INSERT INTO nacionalidad (id_nacionalidad, nombre_nacionalidad)
VALUES ('NAC1', 'Colombiana'),
       ('NAC2', 'Estadounidense');

-- Insertar registros en la tabla 'autor'
INSERT INTO autor (nombre_autor, fecha_nacimiento, id_nacionalidad)
VALUES ('Judith Sills', '1980-06-01', 'NAC2'),
       ('Kim Kiyosaki', '1965-05-15', 'NAC2');

-- Insertar registros en la tabla 'escribir_libro'
INSERT INTO escribir_libro (id_autor, ISBN)
VALUES (1, 1),
       (2, 2);

-- Insertar registros en la tabla 'cliente'
INSERT INTO cliente (nombre_cliente, edad, direccion)
VALUES ('Janet Marulanda', 47, 'Calle 50 #20-30'),
       ('Ramon Jimenez', 25, 'Av 6 #4-65');

-- Insertar registros en la tabla 'telefono_cliente'
INSERT INTO telefono_cliente (id_cliente, telefono)
VALUES (1, '3102222222'),
       (2, '3015555555');

-- Insertar registros en la tabla 'compra_libro'
INSERT INTO compra_libro (id_cliente, ISBN, fecha_compra)
VALUES (1, 1, '2024-03-27'),
       (2, 2, '2024-03-26');