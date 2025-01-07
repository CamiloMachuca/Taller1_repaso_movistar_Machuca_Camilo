use taller1;

-- 1.mostrar todos los clientes junto con la categoria a la que pertenecen 
select c.nombre1, c.nombre2, c.apellido1, c.apellido2, categoria_cliente.tipo from clientes c inner join categoria_cliente 
on c.id_categoria_cliente = categoria_cliente.id_categoria_cliente;

-- 2.mostrar los clientes que terminaron su contrato 
select * from clientes where month(fecha_fin) = month(curdate()) and year(fecha_fin) = year(curdate());

-- 3. mostrar la cantidad de clientes que hay por categoria
select cc.tipo, count(*) as cantidad from clientes c
inner join categoria_cliente cc on c.id_categoria_cliente = cc.id_categoria_cliente 
group by cc.tipo;

-- 4. listar los clientes que tienen servicios premium
select distinct * from clientes inner join ventas on clientes.id_cliente= ventas.id_cliente
inner join servicios on ventas.id_servicio = servicios.id_servicio
where servicios.tipo = 'Premium';

-- 5. mostrar los clientes que tengan mas de dos servicios contratados
select c.nombre1, c.nombre2, apellido1, apellido2, count(v.id_servicio) as 'servicios' from clientes c inner join ventas v on c.id_cliente = v.id_cliente 
group by c.id_cliente having servicios>2;

-- 6. listar los clientes que tengan una bonificacion mayor al 15%
select c.nombre1, c.nombre2, c.apellido1, c.apellido2, b.porcentaje from clientes c 
inner join ventas v on c.id_cliente = v.id_cliente 
inner join bonificaciones b on v.id_bonificacion = b.id_bonificacion
where b.porcentaje > 15;

-- 7. listar los clientes que se encuentran activos
select * from clientes where fecha_fin is null;

-- 8 obtener los 3 clientes mas recientes
select * from clientes order by fecha_inicio desc limit 3;


-- 9. listar los clientes que utilizaron el metodo de pago Paypal

select * from clientes c inner join ventas v on c.id_cliente = v.id_cliente 
inner join metodo_de_pago on v.id_metodo_de_pago = metodo_de_pago.id_metodo_de_pago
where metodo_de_pago.tipo = 'PayPal';

-- 10. listar todos los servicios disponibles
select * from servicios;


-- 11. obtener servicios mas vendidos
select s.nombre, count(v.id_servicio) as 'cantidad_vendida' from servicios s 
inner join ventas v on s.id_servicio = v.id_servicio group by s.nombre order by cantidad_vendida desc;


-- 12. listar los servicios que tengan un precio mayor a 100
select * from servicios where precio>100;

-- 13. listar los servicios que pertenecen a la categoria empresarial

select * from servicios where tipo= 'empresarial';

-- 14. listar los servicios de un proveedor en especifico
select * from servicios s inner join compras c on s.id_compra = c.id_compra 
inner join proveedores p on c.id_proveedor = p.id_proveedor where p.id_proveedor = 2;


-- 15. listar los 3 servicios mas caros
select * from servicios order by precio desc limit 3;

-- 16.listar los servicios cuyo precio este entre 50 y 100
select * from servicios where precio between 50 and 100;

-- 17.listar los servicios adquiridos en los ultimos 5 meses

select * from servicios s inner join ventas v
on s.id_servicio = v.id_servicio where v.fecha >= date_add(curdate(), interval -6 month);

-- 18. cantidad de servicios vendidos por tipo
select tipo, count(*) as cantidad from servicios s
inner join ventas v on s.id_servicio = v.id_servicio group by tipo;

-- 19. listar los empleados que se encuentran en la empresa

select * from empleados;


-- 20. listar los empleados que an realizado mas de 3 ventas 
select e.nombre1, e.nombre2, e.apellido1, e.apellido2, count(v.id_venta) as 'total_ventas' 
from empleados e inner join ventas v on e.id_empleado = v.id_empleado group by e.id_empleado
having total_ventas >3; 


-- 21. listar los empleados que esten asignados a servicios premium
select * from empleados e inner join ventas v on e.id_empleado = v.id_empleado
inner join servicios s on v.id_servicio = s.id_servicio where s.tipo= 'Premium';


-- 22. listar los empleados que no han realizado ninguna venta
select * from empleados where id_empleado not in (select id_empleado from ventas);

-- 23. cantidad de ventas realizadas por cada empleado 
select e.nombre1, e.nombre2, e.apellido1, e.apellido2, count(v.id_venta) as total_ventas 
from empleados e inner join ventas v on e.id_empleado = v.id_empleado group by 1,2,3,4;

-- 24. listar los empleados que esten asociados a mas de 2 clientes diferentes
select e.nombre1, e.nombre2, e.apellido1, e.apellido2, count(v.id_cliente) as 'total_clientes' 
from empleados e inner join ventas v on e.id_empleado = v.id_empleado group by 1,2,3,4
having total_clientes >2;

-- 25. obtener el empleado que a realizado mas ventas 
select e.nombre1, e.nombre2, e.apellido1, e.apellido2, count(v.id_venta) as 'total_ventas' 
from empleados e inner join ventas v on e.id_empleado = v.id_empleado group by 1,2,3,4 order by total_ventas desc limit 1;

-- 26.listar los empleados que realizaron ventas con una bonificacion mayor a 10%
select distinct * from empleados e inner join ventas v on e.id_empleado = v.id_empleado 
inner join bonificaciones b on v.id_bonificacion = b.id_bonificacion 
where b.porcentaje >10;

-- 27. cual fue la venta que resivio la mayor bonificacion 
select distinct * from empleados e inner join ventas v on e.id_empleado = v.id_empleado 
inner join bonificaciones b on v.id_bonificacion = b.id_bonificacion order by b.porcentaje desc limit 1;

-- 28. mostrar el empleado que mas ventas realizo
select e.nombre1, e.nombre2, e.apellido1, e.apellido2, count(v.id_venta) as 'total_ventas' 
from empleados e inner join ventas v on e.id_empleado = v.id_empleado group by e.id_empleado
order by total_ventas desc limit 1;

-- 29. listar todas las ventas realizadas 
select * from ventas; 

-- 30. calcular el total de ventas realizadas en un mes en especifico
select sum(total_pagado) as total_ventas from ventas v
where month(fecha) = 06;

-- 31. mostrar las ventas realizadas de un cliente en especifico
select  * from ventas v inner join clientes c on v.id_cliente = c.id_cliente where c.nombre1
= 'Juan';

-- 32. listar las ventas realizadas por un empleado especifico
select * from ventas v inner join empleados e on v.id_empleado = e.id_empleado
where e.nombre1 = 'Luis';

-- 33. mostrar la venta mas grande realizada 
select * from ventas order by total_pagado desc limit 1;

-- 34. listar las ventas realizadas por dia 
select fecha, count(id_venta) as total_ventas from ventas group by fecha ;

-- 35.listar los empleados que realizaron ventas con una bonificacion mayor a 15%
select * from empleados e inner join ventas v on e.id_empleado = v.id_empleado 
inner join bonificaciones b on v.id_bonificacion = b.id_bonificacion 
where b.porcentaje >15;

-- 36. listar las ventas que tengan una bonificacion mayor o igual a 20%
select * from ventas v inner join bonificaciones b on v.id_bonificacion = b.id_bonificacion
where b.porcentaje >= 20;

-- 37. calcular el total pagado por cliente
select c.nombre1, c.nombre2, c.apellido1, c.apellido2, sum(v.total_pagado) as total_pagado
from ventas v inner join clientes c on v.id_cliente = c.id_cliente group by c.id_cliente;

-- 38. listar las ventas asociadas a servicios de tipo residencial
select * from ventas v inner join servicios s on v.id_servicio = s.id_servicio 
where s.tipo = 'Residencial';

-- 39. listar las ventas asociadas a servicios de tipo Empresarial
select * from ventas v inner join servicios s on v.id_servicio = s.id_servicio 
where s.tipo = 'Empresarial';

-- 40. listar las ventas que se realizaron con metodos de pago tarjeta de credito
select * from ventas v inner join metodo_de_pago mdp on v.id_metodo_de_pago = mdp.id_metodo_de_pago
where mdp.tipo = 'Tarjeta de credito';

-- 41. cantidad de ventas realizadas por cada categoria
select  cc.tipo, count(v.id_venta) as total_ventas from ventas v
inner join clientes c on v.id_cliente = c.id_cliente inner join categoria_cliente cc 
on c.id_categoria_cliente = cc.id_categoria_cliente group by cc.tipo;

-- 41 promedio de ventas realizadas por empleado
select e.nombre1, e.nombre2, e.apellido1, e.apellido2, avg(v.total_pagado) as promedio 
from ventas v inner join empleados e on v.id_empleado = e.id_empleado
group by e.id_empleado;

-- 42. mostrar los proveedores registrados
select * from proveedores;

-- 43. nuevos usuarios o clientes
select * from clientes where year(fecha_inicio)= year(curdate());

-- 44. cantidad de compras realizadas a cada  proveedor 
select p.nombre1, count(c.id_compra) as total_compras from proveedores p
inner join compras c on p.id_proveedor = c.id_proveedor group by p.id_proveedor;

-- 45.listar las compras realizadas este mes 
select * from compras where month(fecha)= month(curdate());

-- 46. Listar las compras con un precio mayor a 1000
select * from compras where precio > 1000;

-- 47. listar las compras que tengan un precio mayor a 1000 y menor a 5000
select * from compras where precio between 1000 and 5000;

-- 48. mostrar los informes 
select * from informes;

-- 49. listar los informes realizados este año
select * from informes where year(fecha)= year(curdate());

-- 50. mostrar los historiales de los usuarios
select * from historial_usuarios;

-- 51. buscar el historial de un cliente en especifico
select * from historial_usuarios hs inner join clientes c 
on hs.id_cliente = c.id_cliente where c.id_cliente= 1;

-- 52. listar el  cliente que tenga mas ventas realizadas
select c.nombre1, c.apellido1, count(v.id_venta) as 'total_ventas'
from clientes c inner join ventas v on c.id_cliente = v.id_cliente
group by c.id_cliente order by total_ventas desc limit 1;

-- 53. listar los clientes que terminaron su contrato 
select * from clientes where fecha_fin is not null;

-- 54. cuales fueron los empleados que realizaron una venta con bonificacion

select e.nombre1, e.apellido1 from empleados e inner join ventas v
on e.id_empleado = v.id_empleado where v.id_bonificacion is not  null;

-- 55. cantidad de servicios ofrecidos por tipo 
select tipo, count(id_servicio) as total_servicios from servicios s group by tipo;

-- 56 servicio mas vendido
select s.nombre, count(v.id_venta) as 'total_ventas' from servicios s inner join ventas v
on s.id_servicio = v.id_servicio group by s.id_servicio order by total_ventas desc limit 1;

