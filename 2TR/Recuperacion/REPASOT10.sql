USE TiendaTecnologia;
-- Listado con todos los productos, mostrando para cada uno el id_fab, el id_producto, la descripción y el precio.
select id_fab,id_producto,descripcion,precio from productos;
-- Listado de todos los pedidos realizados por el cliente 2, extrayendo toda la información.
select * from pedidos where id_cliente=2;
-- Consultar todos los datos de los productos de más de 100 €.
select * from productos where precio >=100;
-- Listado de clientes de Madrid o Barcelona.
select * from clientes where Ciudad='Barcelona' or Ciudad='Madrid';
-- Obtener el precio medio de los productos del fabricante con id_fab = '1'.
select avg(precio) from productos where id_fab=1;
-- Consultar la fecha del pedido más antiguo.
select min(Fecha_pedido) from pedidos;
-- Consultar los diferentes paises que existen en los fabricantes (sin repetir)
select distinct pais from fabricantes;
-- Obtén los pedidos realizados entre el 1 de enero de 2024 y el 5 de febrero de 2024.
select * from pedidos where Fecha_pedido between '2024-01-01' and '2024-02-05';
-- Muestra una lista de los clientes con su nombre completo (direccion + ciudad) concatenados en un solo campo.
select concat(Nombre,direccion,ciudad) as direccion_completa from clientes;
-- Muestra cuantos fabricantes hay en cada país.
select pais, count(pais) from fabricantes group by pais;
-- Muestra en otra columna llamada precio_con_iva todos los datos de los productos, sumando el IVA del 21%.
select *,round(precio*1.21,2) as precio_con_iva from productos;
-- Producto más caro.
select Id_producto, Id_fab, Id_categoria, Descripcion, max(precio), Existencias, Fecha_creacion from productos;
-- Cliente con más pedidos.
select c.id_cliente,c.nombre,count(*) as pedidos from clientes c 
join pedidos p on c.id_cliente=p.id_cliente group by c.id_cliente,c.nombre order by total_pedidos desc limit 1;
-- Mostrar los productos ordenados por precio de mayor a menor.
select * from productos order by precio desc;
-- Mostrar los clientes ordenados por ciudad alfabéticamente.
select * from clientes order by ciudad asc;
-- Mostrar solo los 5 productos más baratos.
select * from productos order by precio asc limit 5;
-- Mostrar cuántos productos hay por fabricante.
select id_fab,count(*) as total_productos from productos group by id_fab;
-- Mostrar solo los fabricantes que tengan más de 1 producto.
select id_fab,count(*) as total_productos from productos group by id_fab having count(*)>1;
-- Mostrar clientes cuyo nombre empiece por 'A'.
select * from clientes where nombre like 'A%';
-- Mostrar productos cuyo nombre contenga la palabra 'Portátil'.
select * from productos where descripcion like '%Portátil%';
-- Convertir nombres de clientes a mayúsculas.
select upper(nombre) from clientes;
-- Convertir descripciones de productos a minúsculas.
select Id_producto, Id_fab, Id_categoria, lower(descripcion), Precio, Existencias, Fecha_creacion from productos;
-- Nombre + dirección en mayúsculas en una columna llamada "Nombre_Completo".
select id_cliente,upper(concat(nombre,' - ',direccion)) as nombre_completo from clientes;
-- Cambiar el formato de los nombres de productos para que comiencen con 'Producto:' seguido de su descripción. Alias: Producto_Descripcion.
select concat('Producto: ',descripcion) as producto_descripcion,id_producto,precio from productos;
-- Extraer las tres primeras letras del nombre de cada país de fabricantes.
select pais,substring(pais,1,3) as prefijo from fabricantes;
-- Reemplazar 'Calle' por 'Avda.' en las direcciones de cliente.
select id_cliente,nombre,replace(direccion,'Calle','Avda.') as direccion_modificada from clientes;
-- Calcular cuántos días han pasado desde cada pedido hasta hoy (función SYSDATE).
select n_pedido,fecha_pedido,datediff(sysdate(),fecha_pedido) as dias_transcurridos from pedidos;
-- Obtener la última fecha del mes en que se realizó cada pedido (función LAST_DAY).
select n_pedido,fecha_pedido,last_day(fecha_pedido) as ultimo_dia_mes from pedidos;
-- Asignar un estado personalizado a los pedidos dependiendo de su estado actual: 'Finalizado', 'Anulado' o 'En Gestión' (CASE).
select n_pedido,estado,case when estado='Completado' then 'Finalizado' when estado='Cancelado' then 'Anulado' else 'En Gestión' end as estado_personalizado from pedidos;
-- Obtener los pedidos realizados en 2023.
select * from pedidos where year(fecha_pedido)=2023;
-- Elevar el precio de cada producto al cuadrado.
select id_producto,precio,pow(precio,2) as precio_cuadrado from productos;
-- Redondear el precio de cada producto a 1 decimal.
select descripcion, round(precio, 1) as precio_redondeado
from producto;

-- Extraer el año de las fechas de pedido.
select id_pedido, extract(year from fecha_pedido) as anio
from pedido;

-- Calcular cuántos pedidos se hicieron en un año específico (por ejemplo, 2024).
select count(*) as total_pedidos
from pedido
where extract(year from fecha_pedido) = 2024;

-- Invertir el nombre de los clientes.
select reverse(nombre) as nombre_invertido
from cliente;

-- Mostrar la longitud de cada nombre de cliente.
select nombre, length(nombre) as longitud
from cliente;

-- Mostrar solo los 4 primeros caracteres del nombre del cliente.
select substr(nombre, 1, 4) as primeros_4
from cliente;

-- Mostrar 'CARO' para productos >= 500 o 'BARATO' según el precio.
select descripcion, case when precio >= 500 then 'CARO' else 'BARATO' end as categoria
from producto;

-- Cantidad total de productos vendidos por cada producto.
select id_producto, sum(cantidad) as total_vendido from pedido
group by id_producto;

-- Número de clientes por cada ciudad (mostrar solo ciudades con más de un cliente).
select ciudad, count(*) as total_clientes from cliente
group by ciudad having count(*) > 1;