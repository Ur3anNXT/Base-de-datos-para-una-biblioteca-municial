/*Aqui es donde conmenzamos a crear nuestra base de datos*/
create database biblioteca;

/*En esta linea le diremos queuse nuestro motor de base de datos la base de datos biblioteca que sera donde almacenare los datos de la misma*/
use biblioteca;

/*El orden que sigo en este script es el de crear primero las tablas que no contienen foreign key y por ultimo las que tienen foreign key, nose podrian crear antes estas ultimas ya que nos daria error al no encontrar esas primary key en nuestra base ed datos*/

/*Aqui comienzo con la creacion de la tabla autor */
create table t_autor(
id int auto_increment not null,
nombre varchar(24),
apellido varchar(24),
primary key(id));
/*Aqui comienzo con la insercion de datos*/
insert into t_autor(nombre,apellido) values('Brandon','Sanderson');
insert into t_autor(nombre,apellido) values('John Ronald Reuel','Tolkien');
insert into t_autor(nombre,apellido) values('Ken','Follet');
insert into t_autor(nombre,apellido) values('Christopher','Paolini');

/*Aqui comienzo con la creacion de la tabla  trabajador*/
create table t_trabajador(
id int auto_increment not null,
nombre varchar(24),
apellido varchar(24),
dni varchar(10),
especialidad varchar(24),
primary key(id));
/*Aqui comienzo con la insercion de datos*/
insert into t_trabajador(nombre,apellido,dni,especialidad) values('Raul','Gonzalez','77872395F','Admnistracion');
insert into t_trabajador(nombre,apellido,dni,especialidad) values('Pepe','Martin','123456793G','Limpieza');
insert into t_trabajador(nombre,apellido,dni,especialidad) values('Eugenio','Romero','786542178R','Bibliotecario');
insert into t_trabajador(nombre,apellido,dni,especialidad) values('Javier','Bazques','32467518F','Administracion');
insert into t_trabajador(nombre,apellido,dni,especialidad) values('Carlos','Rodriguez','12345678A','Administracion');


/*Aqui comienzo con la creacion de la tabla editorial*/
create table t_editorial(
id int auto_increment not null,
nombre varchar(24),
primary key(id));
/*Aqui comienzo con la insercion de datos*/
insert into t_editorial(nombre) values('Roca editorial');
insert into t_editorial(nombre) values('Plaza & Junes');
insert into t_editorial(nombre) values('S.A ediciones');
insert into t_editorial(nombre) values('harpercollis Pub');
insert into t_editorial(nombre) values('Marca');
insert into t_editorial(nombre) values('ElMundo');
insert into t_editorial(nombre) values('ElPais');

/*Aqui creo la siguiente tabla*/
create table t_editorial_periodico(
id int auto_increment not null,
nombre varchar(24),
primary key(id));
/*Aqui inserto datos*/
insert into t_editorial_periodico(nombre) values('Marca');
insert into t_editorial_periodico(nombre) values('Elmundo');
insert into t_editorial_periodico(nombre) values('ElPais');

/*Aqui comienzo con la creacion de la tabla usuario*/
create table t_usuario(
id int auto_increment not null,
nombre varchar(24),
apellido varchar(24),
dni varchar(9),
fecha_admision date,
primary key(id));
/*Aqui comienzo con la insercion de datos*/
insert into t_usuario(nombre,apellido,dni,fecha_admision) values('Manuel','Lagos','45612378P','2010-04-23');
insert into t_usuario(nombre,apellido,dni,fecha_admision) values('Eugenio','Martinez','98756432F','2008-01-01');
insert into t_usuario(nombre,apellido,dni,fecha_admision) values('Paula','Fernandez','75643291G','2020-01-12');
insert into t_usuario(nombre,apellido,dni,fecha_admision) values('Rocio','Jurado','12345679P','2019-02-04');

/*Aqui comienzo con la creacion de la tabla libro*/
create table t_libro(
id int auto_increment not null,
nombre varchar(24),
tipo varchar(24),
id_autor int not null,
id_editorial int not null,
primary key(id),
foreign key (id_autor) references t_autor(id),
foreign key (id_editorial) references t_editorial(id));
/*Aqui comienzo con la insercion de datos*/
insert into t_libro(nombre,tipo,id_autor,id_editorial) values('Aleacion de ley','fantasia',1,3);
insert into t_libro(nombre,tipo,id_autor,id_editorial) values('Los pilares de la tierra','historia','3','2');
insert into t_libro(nombre,tipo,id_autor,id_editorial) values('El Silmarallion','Fantasia','2','4');
insert into t_libro(nombre,tipo,id_autor,id_editorial) values('El imperio final','Fantasia','1','3');
insert into t_libro(nombre,tipo,id_autor,id_editorial) values('Legado','Fantasia','4','1');

/*Aqui comienzo con la creacion de la tabla periodico*/
create table t_periodico(
id int auto_increment not null,
nombre varchar(24),
editorial int not null,
primary key(id),
foreign key (editorial) references t_editorial_periodico(id));
/*Aqui comienzo con la insercion de datos*/
insert into t_periodico(nombre,editorial) values('Marca','1');
insert into t_periodico(nombre,editorial) values('Elmundo','2');
insert into t_periodico(nombre,editorial) values('ElPais','3');

/*Aqui comienzo con la creacion de la tabla prestamo*/
create table t_prestamo(
id int auto_increment not null,
usuario int not null,
libro int not null,
fecha_devolucion date,
primary key(id),
foreign key (usuario) references t_usuario(id),
foreign key (libro) references t_libro(id));
insert into t_prestamo(usuario, libro, fecha_devolucion) values('1','1','2020-03-03');
insert into t_prestamo(usuario, libro, fecha_devolucion) values('2','3','2020-12-02');
insert into t_prestamo(usuario, libro, fecha_devolucion) values('3','2','2020-04-28');

