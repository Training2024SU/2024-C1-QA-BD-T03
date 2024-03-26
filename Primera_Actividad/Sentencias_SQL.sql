CREATE TABLE cliente (
    cedula INTEGER PRIMARY KEY
    nombre VARCHAR(50),
    email VARCHAR(50),
    CantidadDeLibrosComprados INTEGER,

);

CREATE libro (
    ISBN INTEGER PRIMARY KEY
    titulo VARCHAR(50),
    numeroDePaginas INTEGER,
    cantidadDeCopias INTEGER,
    FOREIGN KEY (id_autor) REFERENCES Sale(autor)
    FOREIGN KEY (editorial_nombre) REFERENCES editorial(Nombre)
    FOREIGN KEY (libro_auto) REFERENCES libro_auto(libro_autor_ISBN_libro)

);

CREATE autor (
    id SERIAL PRIMARY KEY
    nombre VARCHAR(50),
    fechaDeNacimiento DATE,
    librosEnExistencia INTEGER,
    nacionalidad VARCHAR(50),
    FOREIGN KEY (libro_autor_ISBN_libro) REFERENCES libro_auto(libro_auto_ISBN_libro)

);

CREATE TABLE compra (
    consecutivo INTEGER PRIMARY KEY
    FOREIGN KEY (cliente_cedula) REFERENCES cliente(cedula)
    FOREIGN KEY (libro_ISBN) REFERENCES libro(ISBN)
);

CREATE TABLE editorial (
    Nombre VARCHAR(50) PRIMARY KEY
    cantidadDeLibros INTEGER,
    FOREIGN KEY (libro_ISBN) REFERENCES libro(ISBN)
);

CREATE TABLE libro_autor (
    PRIMARY KEY(libro_ISBN)
    FOREIGN KEY (libro_ISBN) REFERENCES libro(ISBN)
    FOREIGN KEY (autor_id) REFERENCES autor(id)
);

CREATE TABLE NumeroDeTelefono (
    NumeroDeTelefono INTEGER,
    PRIMARY KEY(cedula_cliente),
    FOREIGN KEY (cedula_cliente) REFERENCES cliente(cedula)
);