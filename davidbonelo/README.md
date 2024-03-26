# Solución Taller #3 Comandos SQL

## Primera actividad:

### Entidades y sus atributos

1. **Editorial:**
   - Nombre (Llave)
   - País
   - Año_Fundación
   - Dirección
   - Correo
   - Teléfono
2. **Autor:**
   - Código (Llave)
   - Nombre_Completo (Compuesto de: Nombres, Apellidos)
   - Nacionalidad
   - Fecha_Nacimiento
3. **Libro:**
   - ISBN (Llave)
   - Título
   - Número_Páginas
   - Precio
   - Año
   - Género
   - Sinopsis
4. **Cliente:**
   - ID (Llave)
   - Nombre_Completo (Compuesto de: Nombres, Apellidos)
   - Fecha_Nacimiento
   - Edad (Derivado)
   - Correo
   - Teléfono
   - Dirección
5. **Compra:**
   - ID (Llave)
   - Fecha_Compra
   - ISBN_Libro
   - ID_Cliente
   - Cantidad
   - Precio_Total

### Relaciones, cardinalidad y participación

#### Muchos a Muchos

- Un libro puede **ser escrito por muchos** autores y un autor puede **escribir muchos** libros. Un libro **debe ser escrito mínimo por un** autor, y un autor **debe haber escrito** almenos un libro.
- Una compra puede **contener muchos** libros y un libro puede **ser vendido en varias** compras. Una compra **debe contener al menos un** libro, mientras que un libro puede **no estar contenido en ninguna** compra.

#### Uno a Muchos

- Una editorial puede **publicar muchos** libros y un libro puede **ser publicado por solo una** editorial. Una editorial **puede no haber publicado** libros que la librería tenga, y un libro **debe ser publicado por una** editorial.
- Un cliente puede **realizar muchas** compras, pero una compra puede **ser realizada por un solo** cliente. Un cliente **tiene que haber realizado una** compra y una compra **debe ser realizada por un** cliente.

### Modelo Entidad-Relación

[MER_Librería.dia](./MER_Librería.dia)
![MER](./MER_Librería.png)

### Modelo Relacional

[MR_Librería.dia](./MR_Librería.dia)
![MR](./MR_Librería.png)

### Diagrama en Workbench

![DW](./ModeloWorkbench_Libreria.png)
[Diagrama .mwb](./ModeloWorkbench_Libreria.mwb)
