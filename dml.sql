use taller1;

insert into categoria_cliente (tipo) values
('Residencial'),
('Empresarial'),
('Premium'),
('Frecuente'),
('Nuevo');

insert into clientes (nombre1, nombre2, apellido1, apellido2, telefono, direccion, correo, fecha_inicio, fecha_fin, id_categoria_cliente) values 
('Juan', 'Carlos', 'Fernández', 'López', '912345678', 'Av. Principal 123', 'juan.fernandez@movistar.com', '2022-01-10', '2024-12-12', 1),
('María', 'Isabel', 'Rodríguez', 'Martínez', '912345679', 'Calle Secundaria 45', 'maria.rodriguez@movistar.com', '2021-03-15', NULL, 2),
('Pedro', 'Antonio', 'Hernández', 'Gómez', '912345680', 'Av. Industrial 789', 'pedro.hernandez@movistar.com', '2023-06-20', NULL, 3),
('Ana', 'Lucía', 'Sánchez', 'Vargas', '912345681', 'Calle Comercio 101', 'ana.sanchez@movistar.com', '2022-12-01', NULL, 4),
('Carlos', 'Andrés', 'Torres', 'Jiménez', '912345682', 'Av. Empresarial 555', 'carlos.torres@movistar.com', '2024-05-25', NULL, 5);


insert into bonificaciones (fecha_inicio, fecha_fin, porcentaje) values
('2024-01-01', '2024-06-30', 5),
('2024-02-01', '2024-07-31', 10),
('2024-03-01', '2024-08-31', 15),
('2024-04-01', '2024-09-30', 20),
('2024-05-01', '2024-10-31', 25);

insert into empleados (nombre1, nombre2, apellido1, apellido2, telefono, correo, direccion) values
('Luis', 'Fernando', 'Martínez', 'Rojas', '911223344', 'luis.martinez@movistar.com', 'Sucursal Norte'),
('Claudia', 'Beatriz', 'Pérez', 'Castro', '911223345', 'claudia.perez@movistar.com', 'Sucursal Sur'),
('Andrés', 'Miguel', 'Ramírez', 'López', '911223346', 'andres.ramirez@movistar.com', 'Sucursal Este'),
('Laura', 'Mariana', 'Gómez', 'Morales', '911223347', 'laura.gomez@movistar.com', 'Sucursal Oeste'),
('Fernando', 'José', 'Díaz', 'Cruz', '911223348', 'fernando.diaz@movistar.com', 'Sucursal Central');



insert into proveedores (nombre1, nombre2, apellido1, apellido2, direccion, correo, telefono) values
('Telecom', NULL, 'Services', NULL, 'Av. Tecnológica 100', 'telecom@proveedor.com', '900123456'),
('Electro', NULL, 'Distribuciones', NULL, 'Calle Digital 200', 'electro@proveedor.com', '900123457'),
('Tech', 'Global', 'S.A.', NULL, 'Av. Innovación 300', 'techglobal@proveedor.com', '900123458'),
('Net', NULL, 'Solutions', NULL, 'Calle Redes 400', 'netsolutions@proveedor.com', '900123459'),
('Data', 'Central', 'Systems', NULL, 'Av. Infraestructura 500', 'datacentral@proveedor.com', '900123460');

insert into compras (nombre, cantidad, tipo, fecha, precio, id_proveedor) values
('Router Wi-Fi', 50, 'Equipos', '2024-01-10', 3000, 1),
('Antenas 5G', 100, 'Infraestructura', '2024-02-15', 10000, 2),
('Cables de Fibra Óptica', 200, 'Suministros', '2024-03-05', 5000, 3),
('Módems 4G', 75, 'Equipos', '2024-04-20', 4500, 4),
('Software de Gestión', 1, 'Licencias', '2024-05-25', 20000, 5);

insert into servicios (nombre, precio, tipo, id_compra) values
('Internet Hogar', 50, 'Residencial', 1),
('Telefonía Móvil', 30, 'Residencial', 2),
('Redes Corporativas', 100, 'Empresarial', 3),
('Gestión en la Nube', 150, 'Empresarial', 4),
('Consultoría Técnica', 200, 'Premium', 5);

insert into metodo_de_pago (tipo, total) values
('Efectivo', 1000),
('Tarjeta de Crédito', 2000),
('Transferencia Bancaria', 3000),
('PayPal', 1500),
('Débito Automático', 2500);

insert into ventas (fecha, cantidad, total_pagado, id_bonificacion, id_servicio, id_cliente, id_empleado, id_metodo_de_pago) values
('2024-06-10', 1, 45, 1, 1, 1, 1, 1),
('2024-06-15', 3, 90, 2, 2, 2, 2, 2),
('2024-07-10', 1, 45, 1, 1, 1, 1, 1),
('2024-06-20', 5, 425, 3, 3, 3, 3, 3),
('2024-06-25', 10, 1200, 4, 4, 4, 4, 4),
('2024-06-30', 2, 300, 5, 5, 5, 5, 5);

insert into informes (fecha, caracteristicas, id_venta) values
('2024-06-11', 'Venta Completa', 1),
('2024-06-16', 'Cliente satisfecho', 2),
('2024-06-21', 'Bonificación aplicada', 3),
('2024-06-26', 'Pago exitoso', 4),
('2024-07-01', 'Venta Premium', 5);


insert into historial_usuarios (id_cliente, id_informes) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
