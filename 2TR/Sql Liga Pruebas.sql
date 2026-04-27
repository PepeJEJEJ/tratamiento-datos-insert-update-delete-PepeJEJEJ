USE `liga`;

/*1. Muestra el nombre de cada jugador junto con el nombre del equipo en el que juega.*/
select j.nombre, e.nombre from jugador j inner join equipo e on j.id_jugador = e.id_equipo;

/*2. Lista todos los equipos y, si no tienen jugadores, que aparezcan igualmente con valores NULL en las columnas de jugador.*/
select * from jugador j left join equipo e on e.id_equipo = j.id_jugador;

/*3. Muestra todos los jugadores y, si no tienen equipo asignado, que aparezcan igualmente con valores NULL en las columnas de equipo.*/
select * from equipo e right join jugador j on j.id_jugador = e.id_equipo;

/*4. Queremos ver todos los equipos y todos los jugadores, coincidan o no.*/
select * from equipo e join jugador j;

/*5. Genera todas las combinaciones posibles entre equipos y árbitros de los partidos.*/
select * from partido p cross join equipo e on p.arbitro;

/*6. Muestra el nombre del equipo local, el nombre del equipo visitante y el resultado de cada partido.*/
select e.nombre, p.resultado from equipo e inner join partido p on j.id_equipo = partido; -- NO POR NO SER UNO EN CONCRETO

/*7. Haz una consulta que devuelva el nombre del equipo y el nombre de los jugadores usando NATURAL JOIN.*/
select e.nombre, j.nombre from equipo e natural join jugador j;

/*8. Muestra los jugadores cuyo salario sea mayor que el salario medio de todos los jugadores de la liga.*/
select id_jugador, nombre, apellido, posicion, id_capitan, fecha_alta, salario, equipo, altura
from jugador
where salario > avg(salario);

/*9. Lista cada equipo junto con el número de jugadores que tiene.*/
select e.nombre, count(j.id_jugador) from equipo e left join jugador j on j.equipo = e.id_equipo group by e.id_equipo, e.nombre order by e.id_equipo;

/*10. Muestra los equipos cuyo salario medio de jugadores sea superior al salario medio global de la liga.*/
select e.nombre, avg(j.salario) from equipo e join jugador j on j.equipo = e.id_equipo 
group by e.id_equipo, e.nombre having avg(j.salario) > (select avg(salario) from jugador);

-- PT2:
Select * from equipo;
Select * from partido;
Select * from jugador;

# 1. Muestra el nombre de cada jugador junto con el nombre del equipo en el que juega.
select j.nombre, e.nombre from jugador j right join equipo e on j.id_jugador = e.id_equipo;
# 2. Lista todos los equipos y, si no tienen jugadores, que aparezcan igualmente con valores NULL en las columnas de jugador.
select * from jugador j left join equipo e on e.id_equipo = j.id_jugador;
# 3. Muestra todos los jugadores y, si no tienen equipo asignado, que aparezcan igualmente con valores NULL en las columnas de equipo.
select *, e.nombre as equipo_asignado from jugador j left join equipo e on j.id_jugador = e.id_equipo;
# 4. Obtén el nombre del equipo local, el nombre del equipo visitante y el resultado de cada partido.
select loc.nombre, vis.nombre, p.resultado from partido p 
left join equipo loc on p.local=loc.id_equipo 
left join equipo vis on p.visitante=vis.id_equipo;
# 5. Muestra el nombre de los jugadores y el nombre de su equipo, pero solo de aquellos que tengan un salario mayor de 100000.
select j.nombre, e.nombre, j.salario from jugador j, equipo e where j.salario > 100000;
# 6. Lista todos los partidos junto con el nombre del equipo local y visitante, aunque alguno de los equipos no exista en la tabla equipo.
select loc.nombre, vis.nombre, p.resultado from partido p 
join equipo loc on p.local=loc.id_equipo
join equipo vis on p.visitante=vis.id_equipo;
# 7. Muestra el nombre de cada equipo y el número de jugadores que tiene.
select e.nombre, count(j.id_jugador) from equipo e 
left join jugador j on j.equipo = e.id_equipo group by e.id_equipo, e.nombre;
# 8. Obtén el nombre de los jugadores y el nombre de su equipo, ordenados por el nombre del equipo.
select j.nombre, e.nombre from jugador j left join equipo e on j.equipo = e.id_equipo order by e.nombre;
# 9. Muestra todos los equipos y, si tienen jugadores, lista también sus nombres y apellidos.
select * from jugador j left join equipo e on j.equipo = e.id_equipo order by j.nombre & j.apellido;
# 10. Muestra el nombre de los equipos que han jugado como locales en algún partido, junto con el resultado de ese partido.
select loc.nombre as equipo_local, p.resultado from partido p 
left join equipo loc on p.local=loc.id_equipo;

-- MUESTRA TODOS LOS ENUNCIADOS que has fallado anteriormente
select j.id_jugador, j.nombre as jugador, j.apellido, j.posicion, j.salario, j.fecha_alta, j.altura,
       e.id_equipo, e.nombre as equipo, e.ciudad, e.web, e.puntos,
       p.id_partido, p.resultado, p.fecha, p.arbitro,
       loc.nombre as equipo_local, vis.nombre as equipo_visitante
from jugador j
left join equipo e on j.equipo = e.id_equipo
left join partido p on p.local = e.id_equipo or p.visitante = e.id_equipo
left join equipo loc on p.local = loc.id_equipo
left join equipo vis on p.visitante = vis.id_equipo;

-- Muestra el nombre y apellido de cada jugador junto con el nombre de su equipo.
select j.nombre, j.apellido, e.nombre as equipo_nombre from jugador j inner join equipo e on j.id_jugador = e.id_equipo;
-- Lista todos los equipos y los jugadores que pertenecen a ellos, aunque algún equipo no tenga jugadores.
select * from jugador j left join equipo e on j.id_jugador = e.id_equipo;
-- Obtén los jugadores cuyo salario sea mayor que el de Felipe Reyes.
select distinct * from jugador j, equipo e where j.salario > 'Felipe Reyes';
-- Devuelve los equipos que han jugado tanto como locales como visitantes en la tabla de partidos.
select loc.nombre as equipo_local, vis.nombre as equipo_visitante from partido p 
left join equipo loc on p.local=loc.id_equipo
left join equipo vis on p.visitante=vis.id_equipo;
-- Muestra los equipos cuyo salario medio de jugadores sea mayor que el salario medio global de la liga.
select id_equipo, nombre, ciudad, web, puntos from equipo e where j.equipo > avg(j.salario);
-- Lista todas las combinaciones posibles de equipos y árbitros registrados en los partidos.
select * from jugador cross join partido;

-- SFASKOSAKFL

Select * from equipo;
Select * from partido;
Select * from jugador;

-- 1. Muestra el nombre de cada jugador junto al nombre de su equipo usando INNER JOIN
select j.nombre, e.nombre from jugador j inner join equipo e where e.id_equipo=j.equipo;
-- 2. Obtén todas las combinaciones posibles entre jugadores y equipos usando CROSS JOIN
select * from jugador cross join equipo;
-- 3. Lista todos los jugadores aunque no tengan equipo asignado usando LEFT JOIN
select * from jugador j left join equipo e on e.id_equipo=j.equipo;
-- 4. Lista todos los equipos aunque no tengan jugadores usando RIGHT JOIN
select * from equipo e right join jugador j on e.id_equipo=j.equipo;
-- 5. Muestra jugadores y equipos, incluyendo los que no coinciden en ninguna tabla usando FULL OUTER JOIN
select * from equipo join jugador on equipo.id_equipo = jugador.id_jugador;
-- 6. Encuentra los jugadores cuyo salario sea mayor que el de ‘Navarro’ mediante una subconsulta escalar
select * from jugador where salario > (select salario from jugador where nombre = 'Navarro');
-- 7. Selecciona los jugadores cuyo salario sea mayor que todos los salarios del equipo ‘Real Madrid’ usando ALL
select j.nombre, e.nombre, j.salario from jugador j, equipo e where j.salario > 'Real Madrid';
-- 8. Selecciona los jugadores cuyo salario sea mayor que alguno de los salarios del equipo ‘Valencia’ usando ANY/SOME
select * from jugador where salario > (select salario from jugador where equipo = 'Valencia');
-- 9. Muestra los nombres de los equipos que han jugado algún partido usando EXISTS
select loc.nombre as equipo_local, vis.nombre as equipo_visitante from partido p 
left join equipo loc on p.local=loc.id_equipo
left join equipo vis on p.visitante=vis.id_equipo;

Select * from equipo;
Select * from partido;
Select * from jugador;

-- 1. Muestra el nombre de cada jugador junto con el nombre del equipo al que pertenece.
select j.*, e.nombre as pertenencia from jugador j inner join equipo e on j.equipo=e.id_equipo;

-- 2. Muestra los datos combinados de jugadores y equipos usando NATURAL JOIN.
select * from equipo join jugador;

-- 3. Genera todas las combinaciones posibles entre equipos y árbitros registrados en la tabla partido.
select * from equipo cross join partido;

-- 4. Muestra todos los equipos y, si tienen jugadores, los nombres de esos jugadores; si no tienen jugadores, deben aparecer igualmente.
select e.*, j.nombre from equipo e left join jugador j on j.equipo=e.id_equipo;

-- 5. Muestra todos los jugadores y, si existe, el nombre del equipo al que pertenecen; si algún jugador no tiene equipo, debe aparecer igualmente.
select j.*, e.nombre as pertenencia from jugador j right join equipo e on j.equipo=e.id_equipo;

-- 6. Muestra los jugadores cuyo salario es mayor que el salario medio de todos los jugadores de la liga.
select * from jugador where salario > (select avg(salario) as SalProm from jugador);

-- 7. Muestra los jugadores que pertenecen a equipos que hayan jugado al menos un partido como locales.
select * from jugador where equipo in (select local from partido);
    
-- 8. Muestra los equipos que han jugado al menos un partido como visitantes.
select * from equipo where jugador in (select visitante from partido);

-- 9. Muestra los equipos que no han jugado ningún partido como locales.
select * from jugador where equipo not in (select local from partido);

-- 10. Muestra los equipos cuyo salario medio de jugadores es superior al salario medio global de la liga.
select * from equipo where j.salario > (select avg(salario) from jugador j);
