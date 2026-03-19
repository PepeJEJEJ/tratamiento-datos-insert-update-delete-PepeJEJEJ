-- Crea un usuario que SOLO puede conectarse desde el propio servidor
CREATE USER 'usuario_prueba'@'localhost' IDENTIFIED BY '123456';
-- Crea un usuario que puede conectarse desde cualquier IP
CREATE USER 'usuario_prueba'@'%' IDENTIFIED BY '123456';
-- Crea un usuario usando el host por defecto (equivalente a '%')
CREATE USER 'usuario_prueba' IDENTIFIED BY '123456';

-- Dar permisos
GRANT ALL PRIVILEGES ON *.* TO 'usuario_prueba'@'%' WITH GRANT OPTION;
-- Quitar permisos
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'usuario_prueba'@'%';
-- Recargar privilegios
FLUSH PRIVILEGES;


use GESTION_CENTRO;

create index idx_nombre_asignatura on Asignaturas(nombre_asig);

select * from vista_profesores_seguridad;

-- El usuario solo puede conectarse desde el propio servidor
CREATE USER 'carlos_user'@'localhost' IDENTIFIED BY '123456';
-- El usuario puede conectarse desde cualquier IP
CREATE USER 'daniel_user'@'%' IDENTIFIED BY '123456';
-- MySQL asume '%' como host por defecto
CREATE USER 'celia_user'@'localhost' IDENTIFIED BY '123456';


Grant select on gestion_centro.* to 'carlos_user'@'localhost';
grant select, insert on gestion_centro.asignaturas to 'daniel_user'@'%';
