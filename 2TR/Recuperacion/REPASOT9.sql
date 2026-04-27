USE `liga`;
-- Obtener los datos de los jugadores del equipo 3 ordenados por su apellido
select * from jugador where equipo=3 order by apellido;
-- Jugadores que sean escolta o alero
select * from jugador where posicion='alero' or 'escolta';
-- Jugadores con salarios entre 60.000 y 100.000
select * from jugador where salario between 60000 and 100000;
-- Obtener los datos de los jugadores que sean pívot ordenados por su identificador
select * from jugador where posicion='pivot' order by id_jugador;
-- Seleccionar los datos de los jugadores que midan más de dos metros y ganen al menos 50.000 euros
select * from jugador where altura>2.00 and salario>=50000;
-- Seleccionar el nombre de los jugadores que jueguen como pívot y ganen más de 100.000 euros
select nombre from jugador where posicion='pivot' and salario>100000;
-- Seleccionar el nombre de los jugadores de los equipos 1 y 2 que jueguen como base
select nombre from jugador where posicion='base' and equipo=1 or equipo=2;
-- Seleccionar los datos de jugadores de los equipos 1 y 2 que ganen más de 80.000 euros al mes
select nombre from jugador where equipo=1 or equipo=2 and salario>80000;
-- Listar las posiciones diferentes que pueden ocupar los jugadores en la liga
select distinct posicion from jugador;
-- Mostrar todos los datos de los 5 jugadores más altos
select * from jugador order by altura asc limit 5;
-- Calcular en una columna llamada SALARIO NETO ANUAL el sueldo neto de cada jugador (IRPF 18%, queda 82%)
select nombre, salario, salario * 18 as SALARIO_NETO_ANUAL from jugador;
-- Seleccionar los datos de los jugadores cuyo salario neto anual sea al menos 70.000 euros
select nombre, salario, salario * 18 as SALARIO_NETO_ANUAL from jugador where salario*18 >=70000;
-- Jugadores sin posición asignada (NULL)
select * from jugador where posicion is null;
-- Partidos jugados antes de 2012
select * from partido where fecha < '2012-01-01';
-- Jugadores que midan más de 1.90 y cobren más de 100.000
select * from jugador where altura>1.90 and salario>100000;
-- 📝 SEGUNDA RELACIÓN – Consultas de agregación y agrupación
-- Calcular el salario medio de todos los jugadores
select avg(salario) as salario_medio from jugador;
-- Mostrar el id del equipo y la suma de las alturas de sus jugadores cuando esta suma supere los 5 metros
select equipo, sum(altura) from jugador where altura>5.00;
-- Calcular cuántos jugadores miden más de dos metros
select count(altura) from jugador where altura>2;
-- Mostrar para cada equipo cuántos jugadores están asignados a cada posición
select equipo, posicion, count(*) as cantidad from jugador group by equipo, posicion;
-- Mostrar el id del equipo y el salario total de cada equipo, pero solo para los equipos que tengan más de 4 jugadores registrados
select equipo, sum(salario) as salario_total from jugador group by equipo having count(*)>4;
-- Calcular cuántas ciudades distintas tienen equipos registrados
select count(distinct ciudad) as ciudades_registradas from equipo;
-- Mostrar para cada equipo el salario más alto, el más bajo y la diferencia entre ambos
select equipo,max(salario),min(salario),max(salario)-min(salario) from jugador group by equipo;
-- Seleccionar el salario medio de cada equipo, pero únicamente para los equipos cuya media sea superior a 100000
select equipo, avg(salario) as salario_medio from jugador group by equipo having avg(salario)>100000;
-- Número de jugadores por equipo
select equipo, count(nombre) from jugador group by equipo;
-- Altura media por equipo
select equipo, avg(altura) from jugador group by equipo;
-- Salario total por equipo
select equipo, sum(salario) from jugador group by equipo;
-- Equipos con una altura media superior a 2 metros
select equipo, avg(altura) from jugador where altura>2 group by equipo;
-- El jugador más alto por equipo (altura máxima)
select equipo, max(altura) from jugador group by equipo;
-- Tercera Parte
-- 1. Mostrar los datos de los partidos jugados en el mes de febrero.
select * from partido where extract(month from fecha)=2;
-- 2. Mostrar el nombre y apellido de cada jugador en una sola columna llamada “Nombre Completo”, en MAYÚSCULAS.
select upper(concat(nombre,"-",apellido)) AS nombre_completo from jugador;
-- 3. Mostrar los enlaces de las webs de los equipos que NO contengan “www”.
select web from equipo where web not like '%www%';
-- 4. Mostrar los datos de los equipos cuya web incluya la palabra “basket”.
select * from equipo where web like '%basket%';
-- 5. Mostrar los enlaces de las webs de los equipos pero sin “http://”.
select replace(web, 'http://', '') as web_no_http from equipo;
-- 6. Consulta que devuelva esta frase:
-- “El jugador con nombre y apellidos: Juan Carlos Navarro juega en la posición: escolta”.
select 'El jugador con nombre y apellidos: Juan Carlos Navarro juega en la posición: escolta' as mensaje;
-- 7. Datos de los equipos cuyo nombre tenga 12 caracteres o menos.
select * from equipo where length(nombre)<=12;
-- 8. Datos de los jugadores que fueron dados de alta en 2008 o 2011.
select * from jugador where extract(year from fecha_alta) in (2008, 2011);
-- 9. Mostrar un listado de las páginas web de los equipos pero cambiando “http://” por “https://”.
select replace(web, 'http://', 'https://') as web_segura from equipo;
-- 10. Mostrar el nombre del jugador y su nombre invertido.
select nombre, reverse(nombre) as erbmon from jugador;
-- 11. Mostrar el nombre de los equipos rellenado por la izquierda hasta 20 caracteres con ‘*’.
select lpad(nombre, 20, '*') as relleno from equipo;
-- 12. Mostrar el apellido de los jugadores y sus 3 primeras letras.
select apellido, substring(apellido, 1, 3) as iniciales from jugador;
-- 13. Mostrar la posición en la que aparece la letra ‘a’ en el nombre del equipo.
select nombre, position('a' in nombre) as posicion_a from equipo;
-- 14. Mostrar el nombre del jugador y un campo que indique:
-- “Veterano” si fue dado de alta antes de 2010
-- “Moderno” si fue dado de alta a partir de 2010
-- (usar CASE)
select nombre, case when extract(year from fecha_alta) < 
2010 then 'Veterano' else 'Moderno' end as categoria from jugador;
-- Mostrar los jugadores cuyo apellido termina en “ez”.
select * from jugador where apellido like '%ez';
-- Mostrar los equipos ordenados por la longitud de su nombre.
select nombre, length(nombre) as longitud from equipo order by longitud;
-- Mostrar el nombre del jugador completamente en minúsculas.
select lower(nombre) as nombre from jugador;
-- Mostrar el nombre del jugador y las 2 primeras letras de su apellido.
select nombre, substring(apellido, 1, 2) as iniciales from jugador;
-- Mostrar el nombre del jugador y el año en el que fue dado de alta
select nombre, extract(year from fecha_alta) as anno_alta from jugador;
-- Mostrar nombre y apellido en una sola columna separados por un guion.
select concat(nombre,"-",apellido) as Nombre_y_Apellido from jugador;