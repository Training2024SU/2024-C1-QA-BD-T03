use bookstore;

INSERT INTO Editoriales VALUES
	('Penguin Random House', 'Estados Unidos', 1927, '123 Main St, New York', 'info@penguinrandomhouse.com', '+1-800-123-4567'),
    ('Vintage Books', 'Reino Unido', 1954, '456 High St, London', 'info@vintagebooks.com', '+44-20-1234-5678');

INSERT INTO Libros VALUES
	(9780140275410, 'Cien años de soledad', 432, 20000, 1967, 'Realismo mágico', 'La novela narra la historia de la familia Buendía en el ficticio pueblo de Macondo.', 'Penguin Random House'),
    (9780099448822, 'Tokio Blues', 298, 18000, 1987, 'Ficción contemporánea', 'La historia de un joven que recuerda su vida en la década de 1960 en Tokio.', 'Vintage Books');

INSERT INTO Autores VALUES
	(1, 'Gabriel', 'García Márquez', 'Colombiana', '1927-03-06'),
    (2, 'Haruki', 'Murakami', 'Japonesa', '1949-01-12');
       
-- Relacionar autores con libros
INSERT INTO Autores_Libros VALUES
	(1, 9780140275410),
    (2, 9780099448822);
    
INSERT INTO Clientes VALUES
	(1, 'Juan', 'Pérez', '1985-05-15', 'juan.perez@example.com', '123456789', 'Calle Principal 123'),
    (2, 'María', 'González', '1990-09-20', 'maria.gonzalez@example.com', '987654321', 'Avenida Central 456');
    
INSERT INTO Compras VALUES
	(1, '2024-03-25', 38000, 1),
    (2, '2024-03-26', 36000, 2);
    
-- Relacionar commpras con libros
INSERT INTO Compras_Libros VALUES
	(1, 9780140275410, 1),
    (2, 9780099448822, 2);
