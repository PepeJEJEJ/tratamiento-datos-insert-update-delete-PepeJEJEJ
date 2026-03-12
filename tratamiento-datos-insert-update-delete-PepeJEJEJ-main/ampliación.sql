-- 1. Crear la base de datos
drop database if exists EMPRESA;
Create database EMPRESA;
use EMPRESA;

-- 2. Crear las tablas
-- Crea la tabla DEPARTAMENTOS con la siguiente estructura:
Create table DEPARTAMENTOS(
	id_departamento int Primary key,
    nombre varchar(40),
    ciudad varchar(40)
);

-- Crea la tabla EMPLEADOS con la siguiente estructura:
Create table EMPLEADOS(
	id_empleado	INT AUTO_INCREMENT Primary key,
	nombre	VARCHAR(50),
	salario	DECIMAL(8,2),
	id_departamento	INT
);
-- 3. Crear restricciones
alter table EMPLEADOS add constraint fk_empleados_departamentos
foreign key(id_departamento) references DEPARTAMENTOS(id_departamento);

-- 4. Mostrar información de la base de datos
SHOW TABLES; -- ESTO MUESTRA LAS TABLAS DE LA BD
DESCRIBE EMPLEADOS; -- Muestra la estructura de una tabla

-- 5. Insertar datos
INSERT INTO DEPARTAMENTOS (id_departamento, nombre, ciudad) VALUES
(1,'Ventas','Madrid'),
(2,'Informática','Sevilla'),
(3,'Recursos Humanos','Valencia'),
(4,'Administración','Bilbao');

INSERT INTO EMPLEADOS (nombre, salario) VALUES
('Ana Gómez', 1850.00),
('Luis Pérez', 2100.00),
('Marta Ruiz', 1700.00),
('Carlos Sanz', 2200.00),
('Elena Martín', 1950.00),
('Pablo Díaz', 1800.00),
('Laura Gil', 1750.00);

-- 6. Realizar inserciones
INSERT INTO EMPLEADOS (nombre, salario, id_departamento) VALUES
('Sonia López', 2150.00, 2),
('Mario Torres', 2150.00, 1);
-- ('Nuria Vega', 1900.00, 8) <- Esto es una trampa pq no existe el Dpto.

-- 7. Realizar modificaciones
update EMPLEADOS set salario=1900.00 where nombre='Ana Gómez';
update EMPLEADOS set salario=salario+100 where id_departamento=2;
update DEPARTAMENTOS set nombre='Málaga' where ciudad='Bilbao';
update EMPLEADOS set id_departamento = 3 where nombre = 'Marta Ruiz';
update EMPLEADOS set salario=salario + 50 
where id_departamento=(
    select id_departamento
    from DEPARTAMENTOS
    where ciudad='Madrid'
);
update EMPLEADOS set salario=salario - 100
where id_departamento=(
    select id_departamento
    from DEPARTAMENTOS
    where nombre='Ventas'
);
update EMPLEADOS set id_departamento=9 where nombre='Laura Gil'; -- <--NO HAY DPTO 9

-- 8. Realizar borrados
delete from EMPLEADOS where nombre='Pablo Díaz';
delete from EMPLEADOS where salario<1800;
delete from DEPARTAMENTOS where nombre='Ventas';
delete from DEPARTAMENTOS where nombre='Informática';
delete from EMPLEADOS
where id_departamento=(
    select id_departamento
    from DEPARTAMENTOS
    where nombre='Recursos Humanos'
);
delete from DEPARTAMENTOS where nombre = 'Recursos Humanos';
delete from EMPLEADOS
where id_departamento = (
    select id_departamento
    from DEPARTAMENTOS
    where ciudad = 'Málaga'
);
delete from DEPARTAMENTOS where nombre = 'Administración';

-- 9. Comprobar la integridad referencial
INSERT INTO EMPLEADOS (nombre, salario, id_departamento) VALUES
('Adam Hilt', 2150.00, 6); -- <--NO EXISTE DPTO 6

update EMPLEADOS set id_departamento = 6 where nombre = 'Laura Gil';-- <--NO EXISTE DPTO 6

delete from DEPARTAMENTOS where nombre = 'Ventas';-- <--TIENE EMPLEADOS QUE DEPENDEN DE VENTAS (ID 1)

-- 10. Consultas de comprobación
select * from DEPARTAMENTOS;
select * from EMPLEADOS;
select  e.nombre AS empleado, e.salario, d.nombre AS departamento from EMPLEADOS e join DEPARTAMENTOS d on e.id_departamento = d.id_departamento;
select d.* from DEPARTAMENTOS d left join EMPLEADOS e on d.id_departamento = e.id_departamento where e.id_empleado is null;
