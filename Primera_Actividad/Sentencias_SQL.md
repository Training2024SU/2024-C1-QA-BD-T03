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
    FOREIGN KEY (Manuscrito_ISBN_libro) REFERENCES manuscrito(Manuscrito_ISBN_libro)

);

CREATE autor (
    AutorId SERIAL PRIMARY KEY
    nombre VARCHAR(50),
    fechaDeNacimiento DATE,
    librosEnExistencia INTEGER,
    nacionalidad VARCHAR(50),
    FOREIGN KEY (manuscrito_ISBN_libros) REFERENCES manuscrito()
    FOREIGN KEY (Manuscrito_ISBN_libro) REFERENCES manuscrito(Manuscrito_ISBN_libro)

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

CREATE TABLE manuscrito (
    FechaDePublicacion DATE,
    PRIMARY KEY(libro_ISBN)
    FOREIGN KEY (libro_ISBN) REFERENCES libro(ISBN)
);

CREATE TABLE NumeroDeTelefono (
    NumeroDeTelefono INTEGER,
    PRIMARY KEY(cedula_cliente),
    FOREIGN KEY (cedula_cliente) REFERENCES cliente(cedula)
);