use taller1;
-- 1. procedimiento para registrar un nuevo cliente
delimiter //
create procedure nuevo_cliente(in nombre1 varchar(50), in nombre2 varchar(50),in apellido1 varchar(50), in apellido2 varchar(50),in telefono varchar(50), in direccion varchar(50), correo varchar(50), in fecha_inicio date, in fecha_fin date, in id_categoria_cliente int)
begin 
insert into clientes (nombre1, nombre2, apellido1, apellido2, telefono, direccion, correo, fecha_inicio, fecha_fin, id_categoria_cliente )
values (nombre1, nombre2, apellido1, apellido2, telefono, direccion, correo, fecha_inicio, fecha_fin, id_categoria_cliente );
end //
delimiter ;
call nuevo_cliente('camilo', 'Andres', 'vega', 'rodrigues','1234444432', 'kdx223', 'camiloandres@gmail.com', '2024-01-10', '2025-12-12', 2);
select * from clientes;

-- 2. procedimiento para obtener la informacion de un cliente por su id

delimiter //
create procedure informacion_cliente(in id int)
begin 
select * from clientes where id_cliente= id;
end // 
delimiter ;
call informacion_cliente(2);

-- 3. procedimiento para eliminar un cliente por su id 
delimiter //
create procedure eliminar_cliente(in id int)
begin 
delete from clientes where id_cliente= id;
end // 
delimiter ;
call eliminar_cliente(23);

-- 4. procedimiento para añadir un nuevo empleado 
delimiter //
create procedure nuevo_empleado(in nombre1 varchar(50), in nombre2 varchar(50),in apellido1 varchar(50), in apellido2 varchar(50),in telefono varchar(50), correo varchar(50),in direccion varchar(50))
begin 
insert into empleados (nombre1, nombre2, apellido1, apellido2, telefono,correo, direccion )
values (nombre1, nombre2, apellido1, apellido2, telefono,correo, direccion );
end //
delimiter ;
call nuevo_empleado('camilo', 'Andres', 'vega', 'rodrigues','1234444432', 'camiloandres@gmail.com','kdx223' );
select * from empleados;

-- 3. procedimiento para eliminar un empleado por su id 
delimiter //
create procedure eliminar_empleado(in id int)
begin 
delete from empleados where id_empleado= id;
end // 
delimiter ;
call eliminar_empleado(22);

-- 4. procedimiento para obtener la informacion de un empleado por su id
delimiter //
create procedure informacion_empleado(in id int)
begin 
select * from empleados where id_empleado= id;
end // 
delimiter ;
call informacion_empleado(2);

-- 5. procedimiento para registrar una nueva venta 
delimiter // 
create procedure nueva_venta(in fecha date,
in cantidad int,
in total_pagado int,
in id_bonificacion int,
in id_servicio int,
in id_cliente int,
in id_empleado int,
in id_metodo_de_pago int)
begin 
insert into ventas (fecha, cantidad, total_pagado, id_bonificacion, id_servicio, id_cliente, id_empleado, id_metodo_de_pago)
values (fecha, cantidad, total_pagado, id_bonificacion, id_servicio, id_cliente, id_empleado, id_metodo_de_pago);
end //
delimiter ;

call nueva_venta('2025-06-30',2, 20000,1,3,2,3,1);


-- 6. procedimiento para ver la informacion de una venta 
delimiter //
create procedure informacion_venta(in id int)
begin 
select * from ventas where id_venta=id;
end //
delimiter ;
call informacion_venta(2);

-- 7. procedimiento para añadir un nuevo servicio
delimiter // 
create procedure nuevo_servicio(in nombre varchar(50),
in precio int,
in tipo varchar(50),
in id_compra int)
begin 
insert into servicios (nombre, precio, tipo, id_compra)
values  (nombre, precio, tipo, id_compra);
end //
delimiter ; 

call nuevo_servicio('satelital', 30000, 'Empresarial', 2);
select * from servicios;

-- 8. procedimiento para actualizar el precio de un servicio
delimiter //
create procedure actualizar_precio_servicio(in idd int, in nuevo_precio int)
begin 
update servicios
set precio= nuevo_precio
where id_servicio= idd; 
end //
delimiter ;
call actualizar_precio_servicio(2,40000)

-- 9. procedimiento para añadir una nueva bonificacion 
delimiter //
create procedure nueva_bonificacion(in fecha_inicio date, in fecha_fin date, in porcentaje int)
begin 
insert into bonificaciones(fecha_inicio, fecha_fin, porcentaje)
values (fecha_inicio, fecha_fin, porcentaje);
end // 
delimiter ;

call nueva_bonificacion('2025-06-30', '2025-09-30', 40);

-- 10. procedimiento para eliminar una bonificacion
delimiter //
create procedure eliminar_bonificacion(in idd int )
begin 
delete from bonificaciones where id_bonificacion= idd;
end // 
delimiter ;

call eliminar_bonificacion(20);



