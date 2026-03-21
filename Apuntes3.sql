/* ============================================================
   0. LIMPIEZA PREVIA (evita errores si ya existen usuarios)
   ============================================================ */

DROP USER IF EXISTS 'usuario_prueba'@'localhost';
DROP USER IF EXISTS 'usuario_prueba'@'%';
DROP USER IF EXISTS 'carlos_user'@'localhost';
DROP USER IF EXISTS 'daniel_user'@'%';
DROP USER IF EXISTS 'celia_user'@'localhost';


/* ============================================================
   1. CREACIÓN DE USUARIOS DE PRUEBA
   ============================================================ */

-- Usuario que SOLO puede conectarse desde localhost
CREATE USER 'usuario_prueba'@'localhost' IDENTIFIED BY '123456';

-- Usuario que puede conectarse desde cualquier IP
CREATE USER 'usuario_prueba'@'%' IDENTIFIED BY '123456';


/* ============================================================
   2. GESTIÓN DE PERMISOS (GRANT / REVOKE)
   ============================================================ */

-- Dar permisos completos al usuario remoto
GRANT ALL PRIVILEGES ON *.* TO 'usuario_prueba'@'%' WITH GRANT OPTION;

-- Quitar permisos
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'usuario_prueba'@'%';

-- Recargar privilegios
FLUSH PRIVILEGES;


/* ============================================================
   3. SELECCIÓN DE BASE DE DATOS
   ============================================================ */

USE gestion_centro;


/* ============================================================
   4. ÍNDICES
   ============================================================ */

-- Crear índice para acelerar búsquedas por nombre_asig
CREATE INDEX idx_nombre_asignatura ON asignaturas(nombre_asig);


/* ============================================================
   5. CONSULTAS DE PRUEBA
   ============================================================ */

SELECT * FROM vista_profesores_seguridad;


/* ============================================================
   6. CREACIÓN DE USUARIOS REALES
   ============================================================ */

-- Carlos: solo localhost
CREATE USER 'carlos_user'@'localhost' IDENTIFIED BY '123456';

-- Daniel: desde cualquier IP
CREATE USER 'daniel_user'@'%' IDENTIFIED BY '123456';

-- Celia: solo localhost
CREATE USER 'celia_user'@'localhost' IDENTIFIED BY '123456';


/* ============================================================
   7. ASIGNACIÓN DE PERMISOS ESPECÍFICOS
   ============================================================ */

-- Carlos: solo lectura en toda la BD
GRANT SELECT ON gestion_centro.* TO 'carlos_user'@'localhost';

-- Daniel: lectura e inserción en asignaturas
GRANT SELECT, INSERT ON gestion_centro.asignaturas TO 'daniel_user'@'%';

-- Celia: permisos completos SOLO en la tabla profesores
GRANT SELECT, INSERT, UPDATE, DELETE ON gestion_centro.profesores
TO 'celia_user'@'localhost';


/* ============================================================
   8. OPCIONAL: CREACIÓN DE ROLES (MySQL 8+)
   ============================================================ */

CREATE ROLE IF NOT EXISTS rol_lectura;
CREATE ROLE IF NOT EXISTS rol_editor;

GRANT SELECT ON gestion_centro.* TO rol_lectura;
GRANT SELECT, INSERT, UPDATE ON gestion_centro.* TO rol_editor;

-- Asignar roles
GRANT rol_lectura TO 'carlos_user'@'localhost';
GRANT rol_editor TO 'daniel_user'@'%';


/* ============================================================
   9. APLICAR ROLES
   ============================================================ */

SET DEFAULT ROLE ALL TO 'carlos_user'@'localhost';
SET DEFAULT ROLE ALL TO 'daniel_user'@'%';


/* ============================================================
   10. VERIFICACIÓN DE PRIVILEGIOS
   ============================================================ */

SHOW GRANTS FOR 'carlos_user'@'localhost';
SHOW GRANTS FOR 'daniel_user'@'%';
SHOW GRANTS FOR 'celia_user'@'localhost';
