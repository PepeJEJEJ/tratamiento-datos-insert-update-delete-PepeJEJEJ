USE liga;
-- Datos del jugador más alto de la liga.
select * from jugador where (select max(altura) from jugador);
-- Datos de todos los jugadores que pertenecen al Caja Laboral.
select j.* from jugador j join equipo e on j.id_jugador = e.id_equipo where e.nombre = 'Caja Laboral';
-- Suma de las alturas de los jugadores que sean del CAI Zaragoza o del Real Madrid.
select sum(j.altura) as suma_alturas 
from jugador j join equipo e 
on j.equipo = e.id_equipo
where e.nombre = 'CAI Zaragoza' or 'Real Madrid';
-- Datos de los jugadores que miden más que todos los jugadores del Caja Laboral.
select * from jugador
where altura > (select max(altura) from jugador where equipo=4);
-- Datos de los jugadores mejor pagado y peor pagado de la liga.
select * from jugador where salario = (select max(salario) from jugador) or salario = (select min(salario) from jugador);
-- Datos del jugador más antiguo, es decir, el que lleva más tiempo dado de alta en un equipo.
select id_jugador, nombre, apellido, posicion, id_capitan, min(fecha_alta), salario, equipo, altura from jugador where fecha_alta;
-- Datos de los equipos que tienen más de tres jugadores registrados.
select e.id_equipo, e.nombre, count(j.id_jugador) as total_jugadores
from equipo e
join jugador j on e.id_equipo = j.equipo
group by e.id_equipo
having count(j.id_jugador) > 3;
-- Mostrar el nombre del jugador, el nombre del equipo al que pertenece y su posición.
select j.nombre, e.nombre ,j.posicion from jugador j join equipo e on j.equipo=e.id_equipo;
-- Mostrar el nombre de cada equipo y el nombre de su capitán o capitanes.
select distinct e.nombre, j.nombre
from equipo e join jugador j 
where j.equipo=e.id_equipo and j.id_jugador = j.id_capitan;
-- Datos de los equipos y el número de partidos que han jugado como locales.
select e.nombre, count(*) as partidos_local
from equipo e
join partido p on e.id_equipo = p.local
group by e.nombre;
-- Datos de los jugadores cuyos equipos hayan jugado al menos tres partidos como visitantes.
select j.*
from jugador j
where j.equipo in (
    select p.visitante
    from partido p
    group by p.visitante
    having count(*) >= 3
);
-- Datos de los equipos y el salario máximo de sus jugadores.
select e.nombre, max(j.salario) as salario_maximo
from equipo e
left join jugador j on e.id_equipo = j.equipo
group by e.nombre;
-- Datos de los equipos que hayan jugado algún partido contra el Valencia en casa.
select e.*
from equipo e
join partido p on e.id_equipo = p.visitante where p.local = 3;
-- Datos de los jugadores de equipos que hayan jugado algún partido contra el Valencia en casa.
select j.* from jugador j join equipo e on j.equipo=e.id_equipo 
where e.id_equipo in (select e.id_equipo from equipo e
join partido p on e.id_equipo = p.visitante where p.local = 3);
-- Datos de los equipos que no tienen ningún jugador registrado.
select e.* from equipo e left join jugador j on j.equipo=e.id_equipo
where j.equipo is null;
-- Mostrar el salario medio de los jugadores de cada equipo.
select e.nombre, avg(j.salario) as salario_medio
from equipo e
join jugador j on e.id_equipo = j.equipo
group by e.nombre;
-- Datos de los jugadores que cobran más que la media salarial de su equipo.
select j.*
from jugador j
where j.salario > (
    select avg(j2.salario)
    from jugador j2
    where j2.equipo = j.equipo
);