USE universidad;

-- Obtener la alumna con mayor edad.
select id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, min(fecha_nacimiento), sexo, tipo from persona where tipo='alumno';
-- Mostrar los datos de la asignatura cuyo id sea el mayor.
select max(id), nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado from asignatura;
-- Mostrar el nombre de la asignatura y el nombre de su grado asociado.
select a.nombre, g.nombre from asignatura a join grado g on g.id=a.id_grado;
-- Mostrar el nombre de todas las asignaturas, el nombre de su grado, 
-- y el nombre y apellidos del profesor que las imparte.
select a.nombre as asignatura,
       g.nombre as grado,
       p.nombre as profesor_nombre,
       p.apellido1,
       p.apellido2
from asignatura a
join grado g on a.id_grado = g.id
left join persona p on a.id_profesor = p.id;
-- Mostrar el nombre y apellidos de los profesores junto con el nombre de su departamento.
select distinct p.nombre, p.apellido1, p.apellido2, d.nombre
from asignatura a
join departamento d on a.id_grado = d.id
left join persona p on a.id_profesor = p.id;
-- Obtener el número de asignaturas que imparte cada profesor, mostrando su nombre y apellidos.
select p.nombre, p.apellido1, p.apellido2, count(a.id) as num_asignaturas
from profesor pr
join persona p on pr.id_profesor = p.id
left join asignatura a on a.id_profesor = pr.id_profesor
group by p.nombre, p.apellido1, p.apellido2;
-- Mostrar los datos de todos los grados, tengan o no asignaturas asociadas.
select g.* from grado g
left join asignatura a on g.id = a.id_grado;
-- Mostrar los datos de todas las asignaturas, tengan o no profesor asignado.
select a.* from asignatura a
left join profesor p on a.id = p.id_profesor;
-- Datos de los profesores que imparten alguna asignatura.
select a.* from asignatura a
left join profesor p on a.id = p.id_profesor where p.id_profesor is not null;
-- Cantidad de créditos que imparte cada profesor según su nif.
select p.nif, p.nombre, sum(a.creditos) as creditos_totales from profesor pr
join persona p on pr.id_profesor = p.id
left join asignatura a on a.id_profesor = pr.id_profesor
group by p.nif, p.nombre, p.apellido1, p.apellido2;
-- Mostrar datos de las asignaturas que tienen más créditos que todas las demás.
select * from asignatura where creditos = (select max(creditos) from asignatura);
-- Mostrar datos de las asignaturas con menos créditos.
select * from asignatura where creditos = (select min(creditos) from asignatura);
-- Muestra por cada grado la suma de sus créditos.
select g.nombre, sum(a.creditos) as total_creditos from grado g
left join asignatura a on g.id = a.id_grado group by g.nombre;
-- Asignaturas que pertenecen al mismo grado que “Bases de Datos”.
select a.* from asignatura a join grado g on g.id = a.id_grado where a.id_grado=4;
-- Nombre de las asignaturas que no son las que menos créditos tienen.
select nombre from asignatura where creditos > (select min(creditos) from asignatura);
-- Nombre de las asignaturas que no son las que más créditos tienen.
select nombre from asignatura where creditos < (select max(creditos) from asignatura);