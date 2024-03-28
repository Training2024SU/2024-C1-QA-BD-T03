USE bookstore_andre;

INSERT INTO Autores  VALUES 
    (1, 'Gabriel', 'García Márquez', 'Colombiana', '1927-03-06'),
    (2, 'Haruki', 'Murakami', 'Japonesa', '1949-01-12');

INSERT INTO Clientes  VALUES 
    ('1234567890', 'Juan', 'Pérez', 'juan.perez@example.com'),
    ('2345678901', 'María', 'González', 'maria.gonzalez@example.com');

INSERT INTO Editoriales  VALUES 
    ('Penguin Random House', 'info@penguinrandomhouse.com', 'Estados Unidos', 'Nueva York', '123 Main St', '10001'),
    ('Vintage Books', 'info@vintagebooks.com', 'Reino Unido', 'Londres', '456 High St', 'SW1A 1AA');

INSERT INTO Libros  VALUES 
    (9780140275410, 'Cien años de soledad', 20000, '1967-05-30', 432, 'Penguin Random House'),
    (9780099448822, 'Tokio Blues', 18000, '1987-09-12', 298, 'Vintage Books');

-- Agregar campos multivaluados
INSERT INTO Editorial_Telefonos  VALUES 
    ('Penguin Random House', '+1-800-123-4567'),
    ('Vintage Books', '+44-20-1234-5678');

INSERT INTO Cliente_Telefonos  VALUES 
    ('1234567890', '1234567890'),
    ('2345678901', '9876543210');

-- Relacionar autores con libros
INSERT INTO Autores_Libros  VALUES 
    ('1_9780140275410', 1, 9780140275410, 'Autor Principal'),
    ('2_9780099448822', 2, 9780099448822, 'Autor Principal');

-- Relacionar compras de libros por clientes 
INSERT INTO Clientes_Libros  VALUES 
    ('1234567890_9780140275410', '1234567890', 9780140275410, '2024-03-25', 20000, 1),
    ('2345678901_9780099448822', '2345678901', 9780099448822, '2024-03-26', 18000, 1);
