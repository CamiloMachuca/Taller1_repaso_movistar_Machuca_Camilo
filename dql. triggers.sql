use taller1; 


-- 1. trigger para registrar una venta realizada
delimiter //
create trigger venta_realizada 
after insert on ventas
for each row
begin 
insert into informes (fecha, caracteristicas, id_venta)
values (now(), concat('venta registrada', new.id_venta), new.id_venta);
end //
delimiter ;


-- 2. trigger para prevenir una venta con cantidad negativa
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

-- 3.trigger para registrar un nuevo servicio 
delimiter //
create trigger nuevo_servicio
after insert on servicios
for each row
begin 
insert into informes (fecha, caracteristicas, id_venta)
values (now(), concat('servicio creado', new.nombre), null);
end //
delimiter ;

-- 4. trigger para prevenir nombre duplicados en servicios
delimiter // 
create trigger nombre_duplicado_servicio
before insert on servicios
for each row
begin
if exists (select 1 from servicios where nombre = new.nombre) then 
signal sqlstate '45000' set message_text = 'El nombre del servicio ya a sido usado';
end if ;
end //
delimiter ;

-- 5. trigger para realizar un informe de los nuevos empleados
delimiter //
 create trigger informe_nuevo_empleado
 after insert on empleados
 for each row
 begin 
 insert into informes (fecha, caracteristicas, id_venta)
 values (now(), concat('Nuevo empleado registrado', new.nombre1, '', new.nombre2), null);
 end // 
 delimiter ;
