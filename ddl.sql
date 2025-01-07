create database taller1;
use taller1;
-- drop database taller1;
create table categoria_cliente(
id_categoria_cliente int auto_increment primary key,
tipo varchar(50)
);

create table clientes(
id_cliente int auto_increment primary key,
nombre1 varchar(50),
nombre2 varchar(50),
apellido1 varchar(50),
apellido2 varchar(50),
telefono varchar(50),
direccion varchar(50),
correo varchar(50),
fecha_inicio date,
fecha_fin date,
id_categoria_cliente int,
foreign key(id_categoria_cliente) references categoria_cliente(id_categoria_cliente)
);

create table bonificaciones(
id_bonificacion int auto_increment primary key,
fecha_inicio date,
fecha_fin date, 
porcentaje int
);

create table empleados(
id_empleado int auto_increment primary key,
nombre1 varchar(50),
nombre2 varchar(50),
apellido1 varchar(50),
apellido2 varchar(50),
telefono varchar(50),
correo varchar(50),
direccion varchar(50)
);

create table proveedores(
id_proveedor int auto_increment primary key,
nombre1 varchar(50),
nombre2 varchar(50),
apellido1 varchar(50),
apellido2 varchar(50),
direccion varchar(50),
correo varchar(50),
telefono varchar(50)

);

create table compras(
id_compra int auto_increment primary key,
nombre varchar(50),
cantidad int,
tipo varchar(50),
fecha date,
precio int,
id_proveedor int,
foreign key(id_proveedor) references proveedores(id_proveedor)
);

create table servicios(
id_servicio int auto_increment primary key,
nombre varchar(50),
precio int,
tipo varchar(50),
id_compra int,
foreign key(id_compra)references compras(id_compra)
);

create table metodo_de_pago(
id_metodo_de_pago int auto_increment primary key,
tipo varchar(50),
total int
);


create table ventas(
id_venta int auto_increment primary key,
fecha date,
cantidad int,
total_pagado int,
id_bonificacion int,
foreign key(id_bonificacion)references bonificaciones(id_bonificacion),
id_servicio int,
foreign key(id_servicio) references servicios(id_servicio),
id_cliente int,
foreign key(id_cliente) references clientes(id_cliente),
id_empleado int,
foreign key(id_empleado)references empleados(id_empleado),
id_metodo_de_pago int,
foreign key(id_metodo_de_pago) references metodo_de_pago(id_metodo_de_pago)
);

create table informes(
id_informes int auto_increment primary key,
fecha date,
caracteristicas varchar(50),
id_venta int,
foreign key(id_venta) references ventas (id_venta)
);

create table historial_usuarios(
id_historial_usuarios int auto_increment primary key,
id_cliente int,
foreign key(id_cliente)references clientes (id_cliente),
id_informes int,
foreign key(id_informes) references informes (id_informes)
);