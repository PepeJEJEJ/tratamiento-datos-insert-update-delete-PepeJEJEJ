USE `universidad`;

select * from persona ;
select * from asignatura ;
select * from profesor ;
select * from departamento ;
select * from grado ;
select * from curso_escolar;
select * from alumno_se_matricula_asignatura;

-- Muestra el nombre de cada alumno junto con el nombre de la asignatura en la que está matriculado.
select p.*,a.nombre as asignatura from persona p join asignatura a where p.tipo='alumno';

-- Obtén el listado de profesores y las asignaturas que imparten.
select p.*,a.nombre as asignatura from persona p join asignatura a on p.id = a.id_profesor where p.tipo='profesor' ;

-- Genera todas las combinaciones posibles entre alumnos y asignaturas (producto cartesiano).
select p.*,a.* from persona p cross join asignatura a where p.tipo='alumno';

-- Lista todos los alumnos y las asignaturas en las que están matriculados. 
-- Si un alumno no tiene matrícula, debe aparecer igualmente con NULL en la asignatura.
select p.nombre as alumno, a.nombre as asignatura from persona p
left join alumno_se_matricula_asignatura m on p.id = m.id_alumno
left join asignatura a on m.id_asignatura = a.id
where p.tipo = 'alumno';

