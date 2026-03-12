drop database if exists TIENDA;
Create database TIENDA;
use TIENDA;
-- MODO SEGURO ON/OFF
SET SQL_SAFE_UPDATES = 0;

Create table FABRICANTES(
	clave_fabricante int,
    nombre varchar(30)
);

Create table ARTICULOS (
	clave_articulo INT AUTO_INCREMENT Primary key,-- ACA SE PONE SOLO, NO SE PONE EN EL INSERT INTO
	nombre	VARCHAR(50),
	precio	DECIMAL(8,2),
	clave_fabricante INT,
	existencias	INT
);
-- PK
alter table FABRICANTES add constraint pk_FABRICANTES primary key(clave_fabricante);
-- FK
alter table ARTICULOS add constraint fk_articulo_fab
foreign key(clave_fabricante) references fabricantes(clave_fabricante);
-- Insertar datos
INSERT INTO FABRICANTES (clave_fabricante, nombre) VALUES
(1, 'Logitech'),
(2, 'Seagate'),
(3, 'HP'),
(4, 'SanDisk'),
(5, 'Kingston'),
(6, 'Toshiba'),
(7, 'Samsung'),
(8, 'LG'),
(9, 'Sony'),
(10, 'TP-Link');


INSERT INTO ARTICULOS (nombre, precio, clave_fabricante, existencias) VALUES
('Teclado inalámbrico', 25.99, 1, 40),
('Disco duro 1TB', 49.95, 2, 35),
('Ratón óptico', 15.50, 3, 60),
('Memoria USB 64GB', 12.99, 4, 80),
('Memoria RAM 16GB DDR4', 69.90, 5, 25),
('Disco duro extraíble 250GB', 39.99, 6, 20),
('Memoria USB 128GB', 18.75, 7, 50),
('DVD-ROM', 29.95, 8, 15),
('CD-ROM', 19.50, 9, 10),
('Tarjeta de red Gigabit', 22.00, 10, 30);

-- Modificar
update articulos set nombre='hd extraible 250 gb' where nombre='Disco duro extraible 250GB';
select * from articulos;

update articulos set existencias=existencias+5 where nombre='Memoria Ram';

-- BORRAR
DELETE FROM articulos where nombre='CD-ROM';

-- Alterar

-- Eliminar la clave foránea existente
ALTER TABLE articulos DROP FOREIGN KEY fk_articulo_fab;

-- Volver a crear la clave foránea con ON DELETE SET NULL
ALTER TABLE articulos ADD CONSTRAINT fk_articulo_fab
FOREIGN KEY (clave_fabricante) REFERENCES fabricantes(clave_fabricante)
ON DELETE SET NULL;

-- MAS INSERTAR
INSERT INTO ARTICULOS (nombre, precio, clave_fabricante, existencias) VALUES
('Altavoces', 120.00, 2, 9),
('Webcam', 89.90, 3, 15),
('SSD 1 Tb', 199.99, 5, 40);

-- ACTUALIZAR/MODIFICAR
UPDATE ARTICULOS
SET existencias = existencias - 20
WHERE clave_fabricante = 3;

UPDATE ARTICULOS
SET precio = precio * 0.90;

UPDATE ARTICULOS
SET precio = precio - 10
WHERE precio >= 200;

UPDATE ARTICULOS
SET clave_fabricante = 1
WHERE nombre = 'DVD Rom';

UPDATE ARTICULOS
SET existencias = 0
WHERE precio < 20;

-- ELIMINAR
DELETE FROM ARTICULOS
WHERE existencias < 10;

DELETE FROM ARTICULOS
WHERE clave_fabricante = 4;

DELETE FROM FABRICANTES
WHERE clave_fabricante = 5;

-- ALTERAR E INSERTAR
UPDATE ARTICULOS
SET clave_fabricante = 99
WHERE clave_articulo = 1;

INSERT INTO ARTICULOS (nombre, precio, clave_fabricante, existencias)
VALUES ('Prueba fabricante inexistente', 10.00, 99, 5);

DELETE FROM FABRICANTES
WHERE clave_fabricante = 3;

-- MOSTRAR TODO
SELECT * FROM FABRICANTES;
SELECT * FROM ARTICULOS;
