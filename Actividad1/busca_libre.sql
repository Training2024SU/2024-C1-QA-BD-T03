
CREATE DATABASE Busca_libre;


USE Busca_libre;

CREATE TABLE libreria (
    id VARCHAR(20),
	telefono VARCHAR(10) not null,
    nombre VARCHAR(50) not null,
    direccion VARCHAR(60) not null,
    PRIMARY KEY (id)
);

CREATE TABLE inventario (
     id VARCHAR(20),
	capacidad int not null,
    id_libreria VARCHAR(20) not null,
    PRIMARY KEY (id),
    FOREIGN KEY (id_libreria) REFERENCES libreria(id)
);

CREATE TABLE editorial (
	nombre VARCHAR(40) not null,
	telefono varchar(10) not null,
    PRIMARY KEY (nombre)
);

CREATE TABLE libro (
	isbn VARCHAR(20),
	num_pag int not null,
    titulo varchar(60) not null,
    fecha_publicacion date not null,
    id_editorial varchar(40) not null,
    PRIMARY KEY (isbn),
    FOREIGN KEY ( id_editorial) REFERENCES editorial(nombre)
);

CREATE TABLE autor (
	codigo VARCHAR(20),
	nombre varchar(50) not null,
    fecha_nacimiento date not null,
    PRIMARY KEY (codigo)
);

CREATE TABLE libro_autor (
	id_libro VARCHAR(20),
	id_autor varchar(20),
    PRIMARY KEY (id_libro,id_autor),
    FOREIGN KEY (id_libro) REFERENCES libro(isbn),
    FOREIGN KEY (id_autor) REFERENCES autor(codigo)
);

CREATE TABLE cliente (
	documento VARCHAR(20),
	nombre varchar(50) not null,
    email VARCHAR(40) not null,
	direccion varchar(30) not null,
    PRIMARY KEY (documento)
);

CREATE TABLE compra (
	id VARCHAR(20),
	fecha date not null,
    hora time not null,
	doc_cliente varchar(12) not null,
    total float not null,
    PRIMARY KEY (id),
    FOREIGN KEY (doc_cliente) REFERENCES cliente(documento)
);

CREATE TABLE copia (
	id VARCHAR(10),
	id_libro varchar(20),
    id_compra varchar(20) ,
    id_inventario varchar(20) not null,
    precio float not null,
	titulo varchar(60) not null,
    PRIMARY KEY (id,id_libro),
    FOREIGN KEY (id_libro) REFERENCES libro(isbn),
    FOREIGN KEY (id_compra) REFERENCES compra(id),
     FOREIGN KEY (id_inventario) REFERENCES inventario(id)
);








