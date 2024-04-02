-- Se registra en la tabla Cliente
INSERT INTO Clientes (`ID cliente`,Nombre,Edad,Email,Telefono) VALUES 
(001,'Julio',26, 'vasquezju@gmail.com',31598784), 
(002,'Andrea',39, 'andrea@gmail.com',54654887);

-- Se registra en la tabla Autor
INSERT INTO Autor (`ID autor`,Nombre,`Fecha Nacimiento`, Nacionalidad,ISBN) VALUES 
('10658475','Jorge','1990-07-11', 'Peruano',007),
('10658476','Juan','1978-09-26', 'Colombiano',008);

-- Se registra en la tabla Categoria
INSERT INTO Categoria (`ID categoria`,`Nombre categoria`,descripcion,`Edad sugerida`) VALUES 
(123,'Drama','El romance y la vida',05), 
(222,'Accion','El movimiento y adrenalina',18);

-- Se registra en la tabla Editorial
INSERT INTO editorial (`Nombre editorial`,`ISBN editorial`,Cantidad) VALUES
('Editorial X',001,20), ('Editorial Y',002,30);

-- Se registra en la tabla Libro
INSERT INTO Libro (ISBN,Nombre,`Nombre editorial`,`numero paginas`,valor,`Fecha publicacion`,`ID categoria libro`) VALUES 
(007,'Los ricos lloran','editorial X',150,250000,'2023-05-30',123), 
(008,'nosotros ganamos','editorial Y',360,140000,'2022-03-21',222);

-- Se registra en la tabla autoria
INSERT INTO autoria (`ISBN autorias`, `ID autores`) VALUES 
(007,10658475), 
(008,10658476);

-- Se registra en la tabla compra
INSERT INTO compra (`ID compra`,`ID cliente compra`,`ISBN cliente`,Cantidad,valor) VALUES 
(02111,001,007,2,300000), 
(02112,002,008,5,250000);

-- Se registra en la tabla Nacionalidad
INSERT INTO nacionalidad (`ID autor`, `Nacionalidad`) VALUES 
(10658475,'peruano'), 
(10658476,'colombiano');

-- Se registra en la tabla telefono-cliente
INSERT INTO `telefono-cliente` (`ID-cliente`,telefono) VALUES 
(001,10658475), 
(002,10658476);