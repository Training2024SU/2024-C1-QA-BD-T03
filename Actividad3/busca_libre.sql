-- Insertar datos en la tabla libreria
INSERT INTO libreria (id, telefono, nombre, direccion) VALUES 
('LIB001', '1234567890', 'Librería Central', 'Calle Principal #123'),
('LIB002', '0987654321', 'Librería del Pueblo', 'Avenida Libertad #456');

-- Insertar datos en la tabla inventario
INSERT INTO inventario (id, capacidad, id_libreria) VALUES 
('INV001', 3000, 'LIB001'),
('INV002', 2500, 'LIB002');

-- Insertar datos en la tabla editorial
INSERT INTO editorial (nombre, telefono) VALUES 
('Editorial ABC', '1112223333'),
('Editorial XYZ', '4445556666');

-- Insertar datos en la tabla libro
INSERT INTO libro (isbn, num_pag, titulo, fecha_publicacion, id_editorial) VALUES 
('ISBN001', 200, 'El Libro de Prueba', '2023-05-15', 'Editorial ABC'),
('ISBN002', 300, 'Otra Obra', '2022-10-20', 'Editorial XYZ');

-- Insertar datos en la tabla autor
INSERT INTO autor (codigo, nombre, fecha_nacimiento) VALUES 
('AUT001', 'Juan Pérez', '1980-02-10'),
('AUT002', 'María García', '1995-08-25');

-- Insertar datos en la tabla libro_autor
INSERT INTO libro_autor (id_libro, id_autor) VALUES 
('ISBN001', 'AUT001'),
('ISBN002', 'AUT002');

-- Insertar datos en la tabla cliente
INSERT INTO cliente (documento, nombre, email, direccion) VALUES 
('DOC001', 'Carlos López', 'carlos@email.com', 'Calle 1 #456'),
('DOC002', 'Ana Martínez', 'ana@email.com', 'Avenida 2 #789');

-- Insertar datos en la tabla compra
INSERT INTO compra (id, fecha, hora, doc_cliente, total) VALUES 
('COMP001', '2024-03-28', '12:30:00', 'DOC001', 25.00),
('COMP002', '2024-03-29', '15:45:00', 'DOC002', 35.50);

-- Insertar datos en la tabla copia
INSERT INTO copia (id, id_libro, id_compra, id_inventario, precio, titulo) VALUES 
('CP001', 'ISBN001', 'COMP001', 'INV001', 25.00, 'El Libro de Prueba'),
('CP002', 'ISBN002', 'COMP002', 'INV002', 35.50, 'Otra Obra');