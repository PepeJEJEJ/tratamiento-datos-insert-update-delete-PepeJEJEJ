USE `universidad`;

select * from persona ;
select * from asignatura ;
select * from profesor ;
select * from departamento ;
select * from grado ;
select * from curso_escolar;
select * from alumno_se_matricula_asignatura;

-- Obtén el nombre y apellidos de la alumna más joven registrada en la tabla persona.
Select * from persona where fecha_nacimiento = (select min(fecha_nacimiento) where sexo='M' and tipo='alumno');

-- Muestra el nombre y apellidos de los profesores que no tienen asignaturas asignadas.
Select p.*, a.id_profesor as asignatura_asignada from persona p, asignatura a 
left join profesor pr on pr.id_profesor = a.id_profesor where pr.id_profesor is null and p.tipo='profesor';

-- Lista el nombre de cada asignatura junto con el número de alumnos matriculados en ella.
select count(mat.id_alumno) as matriculaos, a.nombre from alumno_se_matricula_asignatura mat join asignatura a on mat.id_asignatura = a.id group by id_asignatura;

-- Muestra el nombre de las asignaturas y el nombre del grado al que pertenecen, pero solo aquellas que tengan más de 6 créditos.
select a.nombre,g.nombre from asignatura a join grado g on g.id = a.id_grado where creditos>6;

-- Obtén el nombre completo del profesor y el nombre del departamento al que pertenece.
select p.nombre, p.apellido1, p.apellido2, d.nombre from persona p 
left join profesor pr on p.id=pr.id_profesor
left join departamento d on d.id=pr.id_departamento;

-- Muestra los grados que no tienen ninguna asignatura asociada. 6. FALLO DE ALIAS (left join era de grado en vez de las de asignatur<a)
Select g.*, a.id_grado as asignatura_asociada from grado g
left join asignatura a on a.id_grado = g.id where a.id is null;

-- Obtén el nombre y apellidos de cada alumno junto con el nombre de las asignaturas en las que está matriculado.
Select p.nombre,p.apellido1,p.apellido2,a.nombre from persona p, asignatura a join alumno_se_matricula_asignatura mat on mat.id_alumno=a.id_grado;

-- Repasar mejor estas:

-- Profesores y número de asignaturas impartidas
select p.nombre, p.apellido1, p.apellido2, count(a.id) as n_asignaturas from profesor pr 
left join persona p on pr.id_profesor = p.id 
left join asignatura a on a.id_profesor = pr.id_profesor 
group by p.nombre, p.apellido1, p.apellido2, pr.id_profesor;

-- Asignaturas (y su grado correspondiente) y profesor responsable
select a.nombre as asignatura, g.nombre as grado, p.nombre, p.apellido1, p.apellido2 from asignatura a 
join grado g on a.id_grado = g.id 
left join profesor pr on a.id_profesor = pr.id_profesor 
left join persona p on pr.id_profesor = p.id;

-- Alumnos matriculados en un curso escolar concreto
select p.nombre, p.apellido1, p.apellido2 from alumno_se_matricula_asignatura m 
join persona p on m.id_alumno = p.id 
join curso_escolar c on m.id_curso_escolar = c.id
where c.anyo_inicio = 2018 and c.anyo_fin = 2019;
