INSERT INTO `libreríaDb`.`Clientes` (`Cédula`, `Nombre`, `Primer_Apellido`, `Segundo_Apellido`, `Fecha_Nacimiento`) VALUES
(1001, 'Juan', 'Pérez', 'Gómez', '1990-05-15'),
(1002, 'María', 'García', 'Martínez', '1985-10-20'),
(1003, 'Carlos', 'López', 'Fernández', '1998-02-28');

INSERT INTO `libreríaDb`.`Compras` (`Id`, `Fecha`, `Precio`, `Total`, `Cliente_Cédula`) VALUES
(1, '2024-03-28', 25.00, 100.00, 1001),
(2, '2024-03-27', 30.50, 122.00, 1002),
(3, '2024-03-26', 15.75, 63.00, 1003);

INSERT INTO `libreríaDb`.`Nacionalidades` (`Id`, `País`) VALUES
(1, 'España'),
(2, 'Estados Unidos'),
(3, 'Francia');

INSERT INTO `libreríaDb`.`Autores` (`Id`, `Nombre`, `Primer_Apellido`, `Segundo_Apellido`, `Fecha_Nacimiento`) VALUES
(101, 'Pedro', 'Martínez', 'Rodríguez', '1970-08-10'),
(102, 'Ana', 'Fernández', 'López', '1982-04-25'),
(103, 'Luis', 'Gómez', 'Hernández', '1995-11-15');

INSERT INTO `libreríaDb`.`Nacionalidades x Autor` (`Nacionalidad_Id`, `Autor_Id`) VALUES
(1, 101),
(2, 102),
(3, 103);

INSERT INTO `libreríaDb`.`Editoriales` (`Nombre`) VALUES
('Editorial X'),
('Editorial Y'),
('Editorial Z');

INSERT INTO `libreríaDb`.`Libros` (`ISBN`, `Título`, `Número_Páginas`, `Editorial_Nombre`) VALUES
(987654321, 'Libro 1', 150, 'Editorial X'),
(876543210, 'Libro 2', 200, 'Editorial Y'),
(765432109, 'Libro 3', 180, 'Editorial Z');

INSERT INTO `libreríaDb`.`Libros x Autor` (`Autor_Id`, `Libros_ISBN`) VALUES
(101, 987654321),
(102, 876543210),
(103, 765432109);

INSERT INTO `libreríaDb`.`Inventarios` (`Id`, `Cantidad`, `Libro_ISBN`) VALUES
(1, 50, 987654321),
(2, 30, 876543210),
(3, 40, 765432109);

INSERT INTO `libreríaDb`.`Géneros` (`Id`, `Género`) VALUES
(1, 'Ficción'),
(2, 'Drama'),
(3, 'Aventura');

INSERT INTO `libreríaDb`.`Géneros x Libro` (`Géneros_Id`, `Libro_ISBN`) VALUES
(1, 987654321),
(2, 876543210),
(3, 765432109);

INSERT INTO `libreríaDb`.`Libros en compra` (`Cantidad`, `Subtotal`, `Libro_ISBN`, `Compra_Id`) VALUES
(2, 50.00, 987654321, 1),
(1, 30.50, 876543210, 2),
(3, 47.25, 765432109, 3);
