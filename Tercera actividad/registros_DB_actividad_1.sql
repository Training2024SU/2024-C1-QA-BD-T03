insert into libreria.editorial() values ("Editorial 1","Medellin");
insert into libreria.editorial() values ("Editorial 2","Buenos aires");

insert into libreria.cliente() values (1234567,"juan@gmail.com","Juan Garcia");
insert into libreria.cliente() values (1234568,"carlos@gmail.com","Carlos Ospina");
insert into libreria.cliente() values (1234569,"Laura@gmail.com","Laura Sanchez");

insert into libreria.telefono_cliente() values (55555,1234569);
insert into libreria.telefono_cliente() values (78456,1234568);

insert into libreria.libro() values ("123456789102A","Cronica de una muerte anunciada",128,"Editorial 1");
insert into libreria.libro() values ("123456789102B","Habitos atómicos",96,"Editorial 2");

insert into libreria.compra_libro() values ("123456789102A",1234569);
insert into libreria.compra_libro() values ("123456789102B",1234567);

insert into libreria.autor() values ("23AR48","Argentina","23/10/1984");
insert into libreria.autor() values ("23CO49","Colombia","06/03/1927");

insert into libreria.autorlibro() values ("123456789102A","23CO49");
insert into libreria.autorlibro() values ("123456789102B","23AR48");


