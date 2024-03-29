
INSERT INTO libreria.editorial (Nombre, Correo_electronico, Direccion, Ciudad, Pais)
VALUES ('Laguna Libros', 'lagunalibros@correo.com', 'Calle 43 18 A 05', 'Bogota', 'Colombia');

INSERT INTO libreria.editorial (Nombre, Correo_electronico, Direccion, Ciudad, Pais) 
VALUES ('Gato Malo', 'gatomalo@correo.com', 'Calle 7 1 84', 'Cali', 'Colombia');

INSERT INTO libreria.cliente (DNI, Nombres, Apellidos, Correo_electronico) 
VALUES ('32567876', 'Leidy Laura', 'Martinez Restrepo', 'leidyl@correo.com');

INSERT INTO libreria.cliente (DNI, Nombres, Apellidos, Correo_electronico) 
VALUES ('107854322', 'Maria', 'Palomeque Cordoba', 'mariapalomeque@correo.com');

INSERT INTO libreria.autor (Codigo, Nombres, Apellidos, Nacionalidad, Fecha_nacimiento) 
VALUES ('9', 'Edgar Allan', 'Poe', 'Estadounidense', '1809-01-19');

INSERT INTO libreria.autor (Codigo, Nombres, Apellidos, Nacionalidad, Fecha_nacimiento) 
VALUES ('8', 'Gabriela', 'Mistral', 'Chilena', '1889-04-08');

INSERT INTO libreria.libro (ISBN, Nombre_editorial, Titulo, Fecha_publicacion, Numero_paginas, Precio) 
VALUES ('9788418008160', 'Laguna Libros', 'El cuervo', '1845-01-29', '72', '42799');

INSERT INTO libreria.libro (ISBN, Nombre_editorial, Titulo, Fecha_publicacion, Numero_paginas, Precio) 
VALUES ('9781015462274', 'Gato Malo ', 'Desolación', '1922-04-23', '282', '111150');

INSERT INTO libreria.autor_x_libro (ID_autor_libro, Codigo_autor, ISBN, Rol) 
VALUES ('COD-001', '9', '9788418008160', 'Autor Principal');

INSERT INTO libreria.autor_x_libro (ID_autor_libro, Codigo_autor, ISBN, Rol) 
VALUES ('COD-002', '8', '9781015462274', 'Autor Principal');

INSERT INTO libreria.compra_libros (ID_compra, DNI_cliente, Codigo_ISBN, Fecha_compra, Cantidad, Precio_unitario) 
VALUES ('ORDEN-100', '32567876', '9788418008160', '2024-04-22', '1', '89765');

INSERT INTO libreria.compra_libros (ID_compra, DNI_cliente, Codigo_ISBN, Fecha_compra, Cantidad, Precio_unitario) 
VALUES ('ORDEN-101', '107854322', '9781015462274', '2024-04-23', '1', '120400');

INSERT INTO libreria.telefono_cliente (DNI_cliente, numero) 
VALUES ('32567876', '3207654322');

INSERT INTO libreria.telefono_cliente (DNI_cliente, numero) 
VALUES ('107854322', '3234567898');

INSERT INTO libreria.telefono_editorial (Nombre_editorial, Numero) 
VALUES ('Laguna Libros', '604567876');

INSERT INTO libreria.telefono_editorial (Nombre_editorial, Numero) 
VALUES ('Gato Malo ', '3224556788');

