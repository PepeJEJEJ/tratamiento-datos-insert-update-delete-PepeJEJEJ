use Empresa;

/*empleados (id_empleado, nombre, salario, cod_sucursal)
sucursales (cod_sucursal, nombre_sucursal, ciudad)

Obtener el nombre de cada empleado junto con el nombre de la sucursal en la que trabaja.
Mostrar todos los empleados cuyo salario sea mayor que el salario de la empleada llamada Martina.
Listar todas las sucursales y, en caso de que no tengan empleados asignados, mostrar igualmente la sucursal con valores NULL en las columnas de empleados.
Calcular el salario medio por departamento y mostrar aquellos departamentos cuyo salario medio sea superior al salario medio global de la empresa.
Obtener el conjunto de nombres que aparecen tanto en la tabla empleados como en la tabla clientes, sin duplicados.*/

select e.nombre, s.nombre_sucursal from empleados e inner join sucursales s on e.cod_sucursal = s.cod_sucursal;
select * from empleados where salario > (select nombre from empleados where nombre='Martina');
select e.nombre, s.nombre_sucursal from empleados e left join sucursales s on e.cod_sucursal = s.cod_sucursal;
select departamento from empleados group by departamento having avg(salario) > (select avg(salario) from empleados);
select nombre from empleados union select nombre from clientes order by nombre;

/*Con las tablas:
empleados (id_empleado, nombre, salario, cod_sucursal)
sucursales (cod_sucursal, nombre_sucursal)
Realiza estas consultas:
Mostrar el nombre de cada empleado y el nombre de su sucursal.
Listar los empleados con salario mayor de 2000.
Mostrar todas las sucursales, incluso las que no tienen empleados.*/

select nombre, nombre_sucursal from empleados natural join sucursales;

select * from empleados where salario = (select salario from empleados where salario > 2000);

select * from sucursales;