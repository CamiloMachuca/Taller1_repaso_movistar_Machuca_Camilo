# Taller1_repaso_movistar_Machuca_Camilo
El proyecto movistar tiene como objetivo diseñar y desarrollar un sistema de base de datos integral que permita a Movistar gestionar de manera eficiente sus servicios, mejorar la fidelización de clientes y optimizar la toma de decisiones estratégicas mediante el análisis de datos. Este sistema incluirá módulos específicos para la gestión de usuarios, servicios, reportes y bonificaciones, asegurando una solución robusta y escalable.


## Funcionalidades Implementadas:
1. **Gestión de Servicios**: La empresa tiene una plataforma centralizada que permita registrar y gestionar eficientemente los diferentes servicios que ofrece, como Internet de Fibra Óptica, planes pospago, prepago, entre otros. 

2. **Análisis de Datos**: Permite tener un sistema de registro adecuado que recopila y análisa datos sobre el comportamiento de los usuarios y las tendencias de consumo. La empresa no puede identificar patrones de uso de servicios, preferencias de los clientes o áreas geográficas con mayor demanda, 

3. **Personalización de Servicios**: Registra datos de usuario para ofrecer servicios y promociones personalizadas.

4. **Gestión de la Fidelización de Clientes**: Permite identificar y seguimiento de clientes leales basados en la duración de su relación con la empresa.

5. **Generación de Informes**: Registra datos sobre la cantidad de productos/servicios ofrecidos por la empresa.


## Requisitos del sistema
Para ejecutar este proyecto, se necesita tener el siguiente sofware:

1. **MySQL** versión 8.0.
2. **MySQL Workbench** para ejecutar los scripts sql.


## Instalación y configuración
1. Abre MySQL Worbench 
2. conectate a tu servidor MySQL.
3. Ejecute el archivo ddl.sql para crear la estructura de la base de datos.
4. Ejecute el archivo dml.sql para realizar las inserciones de datos.
5. Ejecute el archivo dql_select.sql para realizar las cunsultas.
6. Ejecute el archivo dql_procedimientos.sql para realizar los procedimientos almacenados.
7. Ejecute el archivo dql_funciones.sql para realizar las funciones.
8. Ejecute el archivo dql_triggers.sql para realizar los triggers.
9. Ejecute el archivo dql_eventos.sql para realizar los eventos.

## Estructura de la base de Datos
La base de datos esta conformada por varias tablas interconectadas para facilitar el control y la gestión de la empresa movistar. A continuacion se muestra un resumen de las tablas o entidades y sus propositos:

* **Clientes**: Registra los clientes que tiene actualmente.

* **categoria_cliente**: Almacena la categoria en que se encuentran los clientes.

* **bonificaciones**: Realiza bonificaciones a los clientes leales a la empresa.

* **empleados**: Registra los empleados que tiene actualmente la empresa.

* **proveedores**: Registra los proveedores que trabajan con la empresa. 

* **compras**: Almacena las compras realizadas por la empresa a los proveedores.


## Ejemplos de consultas

* **consulta 1** : mostrar todos los clientes junto con la categoria a la que pertenecen.

```sql

select c.nombre1, c.nombre2, c.apellido1, c.apellido2, categoria_cliente.tipo from clientes c inner join categoria_cliente 
on c.id_categoria_cliente = categoria_cliente.id_categoria_cliente;

```

* **consulta 2**: mostrar la cantidad de clientes que hay por categoria.
```sql
 
select cc.tipo, count(*) as cantidad from clientes c
inner join categoria_cliente cc on c.id_categoria_cliente = cc.id_categoria_cliente 
group by cc.tipo;

```
* **consulta 3**: listar los clientes que tienen servicios premium.
```sql

select distinct * from clientes inner join ventas on clientes.id_cliente= ventas.id_cliente
inner join servicios on ventas.id_servicio = servicios.id_servicio
where servicios.tipo = 'Premium';
```

## Procedimientos, Funciones, Triggers y Eventos

### Procedimientos:

* **nuevo_cliente**:procedimiento para registrar un nuevo cliente.
```sql
delimiter //
create procedure nuevo_cliente(in nombre1 varchar(50), in nombre2 varchar(50),in apellido1 varchar(50), in apellido2 varchar(50),in telefono varchar(50), in direccion varchar(50), correo varchar(50), in fecha_inicio date, in fecha_fin date, in id_categoria_cliente int)
begin 
insert into clientes (nombre1, nombre2, apellido1, apellido2, telefono, direccion, correo, fecha_inicio, fecha_fin, id_categoria_cliente )
values (nombre1, nombre2, apellido1, apellido2, telefono, direccion, correo, fecha_inicio, fecha_fin, id_categoria_cliente );
end //
delimiter ;
call nuevo_cliente('camilo', 'Andres', 'vega', 'rodrigues','1234444432', 'kdx223', 'camiloandres@gmail.com', '2024-01-10', '2025-12-12', 2);
select * from clientes;
```

* **informacion_cliente**: procedimiento para obtener la informacion de un cliente por su id
```sql

delimiter //
create procedure informacion_cliente(in id int)
begin 
select * from clientes where id_cliente= id;
end // 
delimiter ;
call informacion_cliente(2);

```

## Funciones:

* **cliente_categoria**: obtener la categoria de un cliente en especifico
```sql

delimiter //
 create function cliente_categoria(id int)
 returns varchar(50)
 deterministic
 begin 
 return (select tipo from categoria_cliente cc inner join clientes c 
 on cc.id_categoria_cliente = c.id_categoria_cliente where c.id_cliente= id);
 end //
 delimiter ;
 select cliente_categoria(2);


```

* **cliente_con_mayor_ventas**:funcion para obtener el cliente que a realizados mas compras de los servicios
```sql


 delimiter //
 create function cliente_con_mayor_ventas()
 returns int 
 deterministic
 begin 
 return (select id_cliente from ventas v group by id_cliente order by count(id_venta) desc limit 1);
 end //
 delimiter ;
 select cliente_con_mayor_ventas() as id_cliente;

```

## Triggers: 
* **venta_realizada**: trigger para registrar una venta realizada
```sql

delimiter //
create trigger venta_realizada 
after insert on ventas
for each row
begin 
insert into informes (fecha, caracteristicas, id_venta)
values (now(), concat('venta registrada', new.id_venta), new.id_venta);
end //
delimiter ;

```
* **venta_cantidad_negativa**:trigger para prevenir una venta con cantidad negativa

```sql

delimiter //
create trigger venta_cantidad_negativa
before insert on ventas
for each row
begin
if new.cantidad <= 0 then 
signal sqlstate '45000' set message_text = 'La cantidad de la venta es incorrecta ';
end if ;
end //
delimiter ;

```

## Contribuciones
Este proyecto fue desarrollado por Camilo Machuca Vega como proyecto repaso MySQL