--Instrucciones SQL para poblar la libreria_daniel_morales

-- Poblado en la tabla 'editorial'
INSERT INTO editorial (nombre, direccion, ciudad, pais, telefono) 
VALUES ('Universe', 'Carrera 102 43 12', 'Bogotá', 'Colombia', '34543343334');

-- Poblado en la tabla 'autor'
INSERT INTO autor (Codigo, Nombre, Nacionalidad, Fecha_nacimiento) 
VALUES ('2', 'Stephen King', 'Estadounidense', '1947-09-21');

-- Poblado en la tabla 'libro'
INSERT INTO libro (ISBN, Titulo, Numero_paginas, Editorial_nombre, precio) 
VALUES 
  ('978-0670813025', 'IT', '1138', 'Planeta', '258000'),
  ('978-0198709701', 'Crimen y Castigo', '576', 'Universe', '80813');

-- Poblado en la tabla 'libro_autor'
INSERT INTO libro_autor (ISBN_Libro, Codigo_autor) 
VALUES 
  ('978-0198709701', '1'),
  ('978-0670813025', '2');

-- Poblado en la tabla 'cliente'
INSERT INTO cliente (ID, Nombre) 
VALUES 
  ('1077234567', 'Pepito Perez Gonzalez'),
  ('1017321456', 'Lola Lopez');

-- Poblado en la tabla 'compra'
INSERT INTO compra (ID, ID_cliente, ISBN_libro, Fecha_compra, Cantidad) 
VALUES 
  ('123', '1077234567', '978-0198709701', '2024-02-26 15:00:00', '1'),
  ('234', '1017321456', '978-0670813025', '2024-03-26 15:45:15', '1');
