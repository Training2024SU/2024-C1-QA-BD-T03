INSERT INTO libreriabuscalibrebd.autor VALUES 
('A1','Gabriel Garcia Marquez','1997-03-27','Colombia'),
('A2','Ernesto Sabato','1911-06-18','Argentina')
;

INSERT INTO libreriabuscalibrebd.cliente VALUES 
('C1','Hernan Pastrana Rocha','hernan.68@gmail.com','Calle 36 # 40-18 centro'),
('C2','Daniela Sandobal Hernandez','dani.s@gmail.com','Manzana 34 lote 18')
;

INSERT INTO libreriabuscalibrebd.libro VALUES 
('9709854685','Cien años de soledad','187','1967-06-05','Sudamericana de Buenos Aires'),
('9805947345','El tunel','145','1980-11-16','Seix Barral')
;

INSERT INTO libreriabuscalibrebd.editorial VALUES 
('Sudamericana de Buenos Aires'),
('Seix Barral')
;

INSERT INTO libreriabuscalibrebd.compra VALUES 
('1','9709854685','C1','2024-01-23','2'),
('2','9805947345','C2','2024-03-19','1')
;

INSERT INTO libreriabuscalibrebd.libro_autor VALUES
('A1','9709854685'),
('A2','9805947345');

INSERT INTO libreriabuscalibrebd.telefono_cliente VALUES
('C1','3124578965'),
('C2','3004573298');

INSERT INTO libreriabuscalibrebd.telefono_editorial VALUES
('Sudamericana de Buenos Aires','01800546798'),
('Seix Barral','5298858484');
