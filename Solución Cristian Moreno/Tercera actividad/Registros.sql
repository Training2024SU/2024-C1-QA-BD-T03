INSERT INTO `luis`.`autor` (`Id_autor`, `Nombre`, `Apellido1`, `Apellido2`, `Fecha_nacimiento`) VALUES
(1, 'Juan', 'García', 'Pérez', '1980-05-10 00:00:00'),
(2, 'María', 'Martínez', 'López', '1975-09-20 00:00:00'),
(3, 'Carlos', 'Hernández', 'Ruiz', '1992-03-15 00:00:00');

INSERT INTO `luis`.`cliente` (`Id_cliente`, `Nombre`, `Apellido1`, `Apellido2`) VALUES
('CL001', 'Ana', 'Rodríguez', 'Gómez'),
('CL002', 'Pedro', 'Fernández', 'García'),
('CL003', 'Laura', 'Sánchez', 'Martínez');

INSERT INTO `luis`.`editorial` (`Nombre`) VALUES
('Editorial A'),
('Editorial B'),
('Editorial C');

INSERT INTO `luis`.`libro` (`ISBN`, `Titulo`, `Num_paginas`, `Nombre_editorial`) VALUES
('ISBN001', 'El libro de Juan', 200, 'Editorial A'),
('ISBN002', 'Historias de María', 150, 'Editorial B'),
('ISBN003', 'Aventuras de Carlos', 180, 'Editorial C');

INSERT INTO `luis`.`compra` (`ISBN`, `Id_cliente`, `Fecha`) VALUES
('ISBN001', 'CL001', '2024-03-28 12:00:00'),
('ISBN002', 'CL002', '2024-03-27 10:30:00'),
('ISBN003', 'CL003', '2024-03-26 09:15:00');

INSERT INTO `luis`.`escribir_libro` (`ISBN`, `Id_autor`) VALUES
('ISBN001', 1),
('ISBN002', 2),
('ISBN003', 3);

INSERT INTO `luis`.`Nacionalidad` (`Id_nacionalidad`, `País`) VALUES
('NAC001', 'España'),
('NAC002', 'Estados Unidos'),
('NAC003', 'Francia');

INSERT INTO `luis`.`Nacionalidad autor` (`autor_Id_autor`, `Nacionalidad_Id_nacionalidad`) VALUES
(1, 'NAC001'),
(2, 'NAC002'),
(3, 'NAC003');