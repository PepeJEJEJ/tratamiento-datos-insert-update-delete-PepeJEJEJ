USE FORMULA1;
-- Jose A.
-- 1. Indice
create index piloto_edad on pilotos(edad);

explain select * from pilotos where edad=25;

-- 2. Vista
create or replace view piloto_escuderia as 
select p.nombre_piloto, e.nombre_escuderia -- PUDE HABER HECHO UN 'AS' PERO YA HE ALTERAO LA TABLA ASI QUE...
from ESCUDERIAS e, PILOTOS p;

select * from piloto_escuderia;

-- 3. Vista segura
create or replace view vista_segura as 
select id_piloto, nombre_piloto, edad
from PILOTOS;

select * from vista_segura;

-- 4. Creacion de Usuarios
create user 'ana_user'@'localhost' identified by '123';
create user 'mario_user'@'%' identified by '123';

-- 5. Garantizar Permisos
grant select on * to 'ana_user'@'localhost';
grant select, update on PILOTOS to 'mario_user'@'%';

flush privileges;

-- USUARIOS:
-- Ana
USE FORMULA1;

select * from ESCUDERIAS;

INSERT INTO PILOTOS VALUES
(1, 'Nigel Mansell', 29, 1200000, 1);

-- Mario
USE FORMULA1;

select * from PILOTOS;

delete from PILOTOS;