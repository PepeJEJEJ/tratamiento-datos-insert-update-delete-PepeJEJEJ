use GESTION_CENTRO;

/* ============================================================
   1. CREACIÓN DE USUARIOS
   ============================================================ */

-- Usuario que SOLO puede conectarse desde el propio servidor
CREATE USER 'usuario_prueba'@'localhost' IDENTIFIED BY '123456';

-- Usuario que puede conectarse desde cualquier IP
CREATE USER 'usuario_prueba'@'%' IDENTIFIED BY '123456';

-- Usuario usando el host por defecto (equivalente a '%')
CREATE USER 'usuario_prueba' IDENTIFIED BY '123456';


/* ============================================================
   2. GESTIÓN DE PERMISOS (GRANT / REVOKE)
   ============================================================ */

-- Dar permisos completos
GRANT ALL PRIVILEGES ON *.* TO 'usuario_prueba'@'%' WITH GRANT OPTION;

-- Quitar permisos
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'usuario_prueba'@'%';

-- Recargar privilegios
FLUSH PRIVILEGES;


/* ============================================================
   3. SELECCIÓN DE BASE DE DATOS
   ============================================================ */

USE GESTION_CENTRO;


/* ============================================================
   4. ÍNDICES
   ============================================================ */

-- Crear índice para acelerar búsquedas por nombre_asig
CREATE INDEX idx_nombre_asignatura ON Asignaturas(nombre_asig);


/* ============================================================
   5. CONSULTAS
   ============================================================ */

SELECT * FROM vista_profesores_seguridad;


/* ============================================================
   6. CREACIÓN DE USUARIOS REALES
   ============================================================ */

-- Carlos: solo localhost
CREATE USER 'carlos_user'@'localhost' IDENTIFIED BY '123456';

-- Daniel: desde cualquier IP
CREATE USER 'daniel_user'@'%' IDENTIFIED BY '123456';

-- Celia: aquí usas localhost (tal como lo escribiste)
CREATE USER 'celia_user'@'localhost' IDENTIFIED BY '123456';


/* ============================================================
   7. ASIGNACIÓN DE PERMISOS ESPECÍFICOS
   ============================================================ */

-- Permisos para Carlos (solo lectura)
GRANT SELECT ON gestion_centro.* TO 'carlos_user'@'localhost';

-- Permisos para Daniel (lectura e inserción en asignaturas)
GRANT SELECT, INSERT ON gestion_centro.asignaturas TO 'daniel_user'@'%';
