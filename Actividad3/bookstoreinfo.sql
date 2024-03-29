INSERT INTO Editorial VALUES
	('La editorial', 'Estados Unidos', 2000, '123 Main St, New York', 'laeditorial@correo.com', '+1-900-193-1233'),
    ('Los libritos', 'Colombia', 1920, 'Cra 20 #20 calle 2', 'loslibritos@correo.com', '+57 3216450197');

INSERT INTO Libro VALUES
	(7878454122478, 'Indigno de ser humano', 220, 50000, 1967, 'Slice of life', 'La historia narra...', 'La editorial'),
    (1354878555512, 'Lord of the misteryes', 4200, 60000, 1987, 'Fantasía', 'Un mundo de fantasía....', 'Los libritos');

INSERT INTO Autor VALUES
	(01, 'Dazai', 'Ozamu', 'Japonesa', '1927-03-06'),
    (02, 'Sepia', 'cutlefish', 'Japonesa', '1949-01-12');
       
-- Relacionar autores con libros
INSERT INTO Autor_Libro VALUES
	(01, 7878454122478),
    (02, 1354878555512);
    
INSERT INTO Cliente VALUES
	(01, 'Edier', 'David', '1986-06-18', 'edier@example.com', '3006450189', 'calle 122 - 09'),
    (02, 'Diego', 'Gale', '2000-09-20', 'diego@example.com', '3604785214', 'Avenida trasversal #50');
    
INSERT INTO Compra VALUES
	(01, '2024-03-25', 50000, 01),
    (02, '2024-03-26', 120000, 02);
    
autor-- Relacionar commpras con libros
INSERT INTO Compra_Libro VALUES
	(01, 7878454122478, 1),
    (02, 1354878555512, 2);