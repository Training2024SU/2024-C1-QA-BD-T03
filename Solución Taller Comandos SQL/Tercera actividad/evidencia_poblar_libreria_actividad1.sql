--Instrucciones SQL para poblar la libreria 


-- Poblado en la tabla 'editorial'
INSERT INTO libreria.editorial (Nombre, Correo_electronico, Direccion, Ciudad, Pais)
VALUES 
  ('Laguna Libros', 'lagunalibros@correo.com', 'Calle 43 18 A 05', 'Bogotá', 'Colombia'),
  ('Gato Malo', 'gatomalo@correo.com', 'Calle 7 1 84', 'Cali', 'Colombia');

-- Poblado en la tabla 'cliente'
INSERT INTO libreria.cliente (DNI, Nombres, Apellidos, Correo_electronico) 
VALUES 
  ('32567876', 'Leidy Laura', 'Martinez Restrepo', 'leidyl@correo.com'),
  ('107854322', 'Maria', 'Palomeque Cordoba', 'mariapalomeque@correo.com');

-- Poblado en la tabla 'autor'
INSERT INTO libreria.autor (Codigo, Nombres, Apellidos, Nacionalidad, Fecha_nacimiento) 
VALUES 
  ('9', 'Edgar Allan', 'Poe', 'Estadounidense', '1809-01-19'),
  ('8', 'Gabriela', 'Mistral', 'Chilena', '1889-04-08');

-- Poblado en la tabla 'libro'
INSERT INTO libreria.libro (ISBN, Nombre_editorial, Titulo, Fecha_publicacion, Numero_paginas, Precio) 
VALUES 
  ('9788418008160', 'Laguna Libros', 'El cuervo', '1845-01-29', '72', '42799'),
  ('9781015462274', 'Gato Malo', 'Desolación', '1922-04-23', '282', '111150');

-- Poblado en la tabla 'autor_x_libro'
INSERT INTO libreria.autor_x_libro (ID_autor_libro, Codigo_autor, ISBN, Rol) 
VALUES 
  ('COD-001', '9', '9788418008160', 'Autor Principal'),
  ('COD-002', '8', '9781015462274', 'Autor Principal');

-- Poblado en la tabla 'compra_libros'
INSERT INTO libreria.compra_libros (ID_compra, DNI_cliente, Codigo_ISBN, Fecha_compra, Cantidad, Precio_unitario) 
VALUES 
  ('ORDEN-100', '32567876', '9788418008160', '2024-04-22', '1', '89765'),
  ('ORDEN-101', '107854322', '9781015462274', '2024-04-23', '1', '120400');

-- Poblado en la tabla 'telefono_cliente'
INSERT INTO libreria.telefono_cliente (DNI_cliente, numero) 
VALUES 
  ('32567876', '3207654322'),
  ('107854322', '3234567898');

-- Poblado en la tabla 'telefono_editorial'
INSERT INTO libreria.telefono_editorial (Nombre_editorial, Numero) 
VALUES 
  ('Laguna Libros', '604567876'),
  ('Gato Malo', '3224556788');
