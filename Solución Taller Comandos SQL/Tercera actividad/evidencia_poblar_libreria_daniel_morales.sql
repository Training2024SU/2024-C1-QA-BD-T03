poblar_libreria_actividad2.sql

INSERT INTO editorial (nombre, direccion, ciudad, pais, telefono) 
VALUES ('Universe', 'Carrera 102 43 12', 'Bogota', 'Colombia', '34543343334');

INSERT INTO autor (Codigo, Nombre, Nacionalidad, Fecha_nacimiento) 
VALUES ('2', 'Stephen King', 'Estadounidense', '1947-09-21');

INSERT INTO libro (ISBN, Titulo, Numero_paginas, Editorial_nombre, precio) 
VALUES ('978-0670813025', 'IT', '1138', 'Planeta', '258000');

INSERT INTO libro (ISBN, Titulo, Numero_paginas, Editorial_nombre, precio) 
VALUES ('978-0198709701', 'Crimen y Castigo', '576', 'Universe', '80813');

INSERT INTO libro_autor (ISBN_Libro, Codigo_autor) 
VALUES ('978-0198709701', '1');

INSERT INTO libro_autor (ISBN_Libro, Codigo_autor) 
VALUES ('978-0670813025', '2');

INSERT INTO cliente (ID, Nombre) 
VALUES ('1077234567', 'Pepito Perez Gonzalez');

INSERT INTO cliente (ID, Nombre) 
VALUES ('1017321456', 'Lola Lopez');

INSERT INTO compra (ID, ID_cliente, ISBN_libro, Fecha_compra, Cantidad) 
VALUES ('123', '1077234567', '978-0198709701', '2024-02-26 15:00:00', '1');

INSERT INTO compra (ID, ID_cliente, ISBN_libro, Fecha_compra, Cantidad) 
VALUES ('234', '1017321456', '978-0670813025', '2024-03-26 15:45:15', '1');