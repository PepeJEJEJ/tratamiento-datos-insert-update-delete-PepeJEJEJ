-- Tablas:
Drop database if exists Empresa;
create database Empresa;
use Empresa;

CREATE TABLE sucursales (
    cod_sucursal INT PRIMARY KEY,
    nombre_sucursal VARCHAR(50)
);

CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(50),
    salario DECIMAL(10,2),
    departamento VARCHAR(50),
    cod_sucursal INT,
    FOREIGN KEY (cod_sucursal) REFERENCES sucursales(cod_sucursal)
);

CREATE TABLE tareas (
    id_tarea INT PRIMARY KEY,
    descripcion VARCHAR(100)
);

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE almacen (
    id_almacen INT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE almacen1 (
    id_producto INT
);

CREATE TABLE almacen2 (
    id_producto INT
);

-- Datos:

INSERT INTO sucursales VALUES
(1, 'Centro'),
(2, 'Norte'),
(3, 'Sur');

INSERT INTO empleados VALUES
(1, 'Martina', 2000, 'Ventas', 1),
(2, 'Carlos', 1800, 'Ventas', 1),
(3, 'Lucía', 2500, 'Marketing', 2),
(4, 'Pedro', 1500, 'Marketing', 2),
(5, 'Alberto', 2100, 'Ventas',NULL);
INSERT INTO tareas VALUES
(1, 'Revisar inventario'),
(2, 'Atender clientes');

INSERT INTO productos VALUES
(1, 'Teclado'),
(2, 'Ratón'),
(3, 'Monitor');

INSERT INTO almacen VALUES
(1, 1, 50),
(2, 3, 20);

INSERT INTO clientes VALUES
(1, 'Carlos'),
(2, 'Ana'),
(3, 'Lucía');

INSERT INTO almacen1 VALUES (1), (2), (3);
INSERT INTO almacen2 VALUES (2), (3);

-- SQLs:

SELECT e.nombre, s.nombre_sucursal
FROM empleados e
INNER JOIN sucursales s
ON e.cod_sucursal = s.cod_sucursal;

SELECT nombre, nombre_sucursal
FROM empleados
NATURAL JOIN sucursales;

SELECT *
FROM tareas
CROSS JOIN empleados;

SELECT e.nombre, s.nombre_sucursal
FROM empleados e
LEFT JOIN sucursales s
ON e.cod_sucursal = s.cod_sucursal;

SELECT e.nombre, s.nombre_sucursal
FROM empleados e
RIGHT JOIN sucursales s
ON e.cod_sucursal = s.cod_sucursal;

SELECT *
FROM empleados
JOIN sucursales
ON empleados.cod_sucursal = sucursales.cod_sucursal;

SELECT *
FROM empleados
WHERE salario >
(
    SELECT salario
    FROM empleados
    WHERE nombre = 'Martina'
);

SELECT nombre
FROM productos p
WHERE EXISTS (
    SELECT *
    FROM almacen a
    WHERE a.id_producto = p.id_producto
);

SELECT departamento
FROM empleados
GROUP BY departamento
HAVING AVG(salario) >
    (SELECT AVG(salario) FROM empleados);
    
SELECT nombre FROM empleados
UNION
SELECT nombre FROM clientes;

/*SELECT id_producto FROM almacen1
INTERSECT
SELECT id_producto FROM almacen2;

SELECT id_producto FROM almacen1
MINUS
SELECT id_producto FROM almacen2;*/

SELECT nombre FROM empleados
UNION
SELECT nombre FROM clientes
ORDER BY nombre;