use taller1;


-- 1. obtener la categoria de un cliente en especifico
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
 
 
 -- 2. funcion para obtener el cliente que a realizados mas compras de los servicios
 delimiter //
 create function cliente_con_mayor_ventas()
 returns int 
 deterministic
 begin 
 return (select id_cliente from ventas v group by id_cliente order by count(id_venta) desc limit 1);
 end //
 delimiter ;
 select cliente_con_mayor_ventas() as id_cliente;


 -- 3. funcion para obtener el gasto total de un cliente en especifico
 delimiter // 
 create function  gasto_total(id_clientee int)
 returns int
 deterministic
 begin 
 return (select sum(total_pagado) from ventas v where id_cliente= id_clientee);
 end // 
 delimiter ;
 select gasto_total(4);
 
 -- 4. funcion para obtener el empleado con mas ventas realizadas
 delimiter //
 create function empleado_mas_ventas()
 returns int
 deterministic
 begin 
 return (select id_empleado from ventas group by id_empleado 
 order by count(id_venta) desc limit 1);
 end //
 delimiter ;
 
 select empleado_mas_ventas() as id_empleado;
 
 -- 5. funcion para calcular el numero de ventas realizadas por cada empleado
 delimiter //
 create function ventas_totales(empleadoId int)
 returns int 
 deterministic
 begin 
 return (select count(*) from ventas where id_empleado= empleadoId);
 end //
 delimiter ;
 select ventas_totales(1);
 
 -- 6. funcion para obtener el correo de un empleado en especifico
 delimiter // 
 create function empleado_correo (Id int)
 returns varchar(50)
 deterministic
 begin 
 return (select correo from empleados where id_empleado= Id);
 end // 
 delimiter ;
 select empleado_correo(4);
 
-- 7. funcion para calcular el ingreso total generado por un empleado
delimiter //
create function ingresos_empleado(id int)
returns int
deterministic
begin
return (select sum(total_pagado) from ventas where id_empleado= id);
end // 
delimiter ;
select ingresos_empleado(5);

-- 8. funcion para obtener el numero de telefono de un empleado 
delimiter //
create function telefono_empleado (id int)
returns varchar(50)
deterministic
begin 
return (select telefono from empleados where id_empleado= id);
end //
delimiter ;
select telefono_empleado(5);

-- 9. funcion para calcular el promedio de los servicios
delimiter //
create function promedio_servicio()
returns decimal(10,2)
deterministic
begin 
return (select avg(precio) from servicios);
end // 
delimiter ;

select promedio_servicio();

-- 10. funcion para conocer el servicio mas vendido 
delimiter //
create function servicio_mas_vendido()
returns varchar(50)
deterministic
begin 
return (select nombre from servicios s inner join ventas v on s.id_servicio= s.id_servicio
group by s.id_servicio order by count(v.id_venta) desc limit 1);
end // 
delimiter ;
select servicio_mas_vendido();

 -- 11. funcion para obtener el telefono de un empleado en especifico
 delimiter // 
 create function empleado_telefono (Id int)
 returns varchar(50)
 deterministic
 begin 
 return (select telefono from empleados where id_empleado= Id);
 end // 
 delimiter ;
 select empleado_telefono(4);
 
 -- 12. funcion para saber el ingreso total de un servicio en especifico 
 delimiter //
 create function ingresos_servicio (id int)
 returns int
 deterministic
 begin
 return (select sum(total_pagado) from ventas where id_servicio=id);
 end //
 delimiter ;
 select ingresos_servicio(1);
 
 -- 13. funcion para saber el tipo de un servicio por medio del id
 delimiter //
 create function tipo_servicio(idServicio int)
 returns varchar(50)
 deterministic
 begin 
 return (select tipo from servicios where id_servicio = idServicio);
 end //
 delimiter ;
 select tipo_servicio(2);
 
 
 -- 14. funcion para conocer el total de servicios vendidos
 delimiter //
 create function Total_servicios_vendidos ()
 returns int 
 deterministic
 begin 
 return (select count(*) from ventas);
 end //
 delimiter ;
 select total_servicios_vendidos();
 
 -- 15. funcion para saber el porcentaje de bonificacion por medio del id
 delimiter // 
 create function porcentaje_bonificacion (id_bonificacionn int)
 returns int 
 deterministic
 begin 
 return (select porcentaje from bonificaciones where id_bonificacion = id_bonificacionn);
 end // 
 delimiter ;
 
-- drop function porcentaje_bonificacion;
 select porcentaje_bonificacion(2);
 
 -- 16. function para saber cual es la bonificacion mas alta 
 delimiter //
 create function bonificacion_mas_alta()
 returns int 
 deterministic
 begin
 return (select max(porcentaje) from bonificaciones);
 end //
 delimiter ;
 select bonificacion_mas_alta();
 
 
 -- 17. funcion para calcular el gasto realizado a un proveedor en especifico
 delimiter // 
 create function gasto_por_proveedor(id int)
 returns int 
 deterministic
 begin
 return (select sum(precio) from compras where id_proveedor= id);
 end // 
 delimiter ;
 select gasto_por_proveedor(2);
 
 -- 18. funcion para clacular el total de gasto en compras 
  delimiter // 
 create function gasto_compras()
 returns int 
 deterministic
 begin
 return (select sum(precio) from compras);
 end // 
 delimiter ;
 select gasto_compras();
 
 -- 19. funcion para saber la cantidad de proveedores activos con compras realizadas
 delimiter //
 create function proveedores_activos()
 returns int
 deterministic
 begin 
 return (select count(id_proveedor) from compras);
 end //
 delimiter ;
 select proveedores_activos()
 
 -- 20. funcion para calcular el total de ingresos por el tipo de servicio
 delimiter //
 create function Total_ingresos_por_servicio(tipo_servicio varchar(50))
 returns int
 deterministic
 begin 
 declare total_ingresos int;
 set total_ingresos = (select sum(v.total_pagado) from ventas v inner join servicios s on v.id_servicio= s.id_servicio where s.tipo= tipo_servicio);
 return total_ingresos;
 end // 
 delimiter ;
 select Total_ingresos_por_servicio('Empresarial');

