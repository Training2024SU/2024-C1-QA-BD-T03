-- Se registra en la tabla Cliente
INSERT INTO Cliente (`ID cliente`,Nombre,Email,Direccion,`Fecha de nacimiento`) VALUES 
('ddf001','Julio', 'vasquezjulie@gmail.com','Calle 3Nbis','1997-04-15'), 
('ddf002','Andrea', 'andrea@gmail.com','Cra 4 #26-38','1985-08-30');

-- Se registra en la tabla Autor
INSERT INTO Autor (`ID autor`,Nombre,`Fecha Nacimiento`, Nacionalidad,ISBN) VALUES 
('10658475','Jorge','1990-07-11', 'Peruano','ISBN1'),
('10658476','Juan','1978-09-26', 'Colombiano','ISBN2');

-- Se registra en la tabla Categoria
INSERT INTO Categoria (`ID categoria`,`Nombre categoria`,`Edad sugerida`) VALUES 
('Drama','Drama',05), 
('Accion','Accion',18);

-- Se registra en la tabla Editorial
INSERT INTO editorial (`Nombre editorial`,Cantidad) VALUES ('Editorial X',20), ('Editorial Y',30);

-- Se registra en la tabla Libro
INSERT INTO Libro (ISBN,titulo,descripcion,paginas,precio,`Fecha de publicacion`,`ID editorial`,`ID categoria`) VALUES 
('ISBN1','Los ricos lloran','Los ricos tambien lloran',150,250000,'2023-05-30','Editorial X','Drama'), 
('ISBN2','nosotros ganamos','podemos ganar siempre',360,140000,'2022-03-21','Editorial Y','Accion');

-- Se registra en la tabla Inventario
INSERT INTO inventario (ISBN,Cantidad) VALUES 
('ISBN1',33), 
('ISBN2',41);

-- Se registra en la tabla autoria
INSERT INTO autoria (`ISBN autoria`, `ID autor`) VALUES 
('ISBN1','10658475'), 
('ISBN2','10658476');

-- Se registra en la tabla Factura
INSERT INTO Factura (`ID factura`,`ID cliente factura`,`ID libro`,Cantidad) VALUES 
('12345','ddf001','ISBN1',2), 
('12344','ddf002','ISBN2',5);

INSERT INTO `Telefono-cliente` (`ID cliente`, `Telefono`) VALUES 
('ddf001','1023456789'), 
('ddf001','1023456780');
