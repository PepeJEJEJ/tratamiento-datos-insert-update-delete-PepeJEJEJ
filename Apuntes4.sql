/* ============================
   EJERCICIO 1 – ÍNDICE
   ============================ */
CREATE INDEX idx_nombre_asig
ON ASIGNATURAS(nombre_asig);

SELECT * FROM ASIGNATURAS
WHERE nombre_asig = 'Sistemas Informáticos';


/* ============================
   EJERCICIO 2 – VISTA ASIG + PROF
   ============================ */
CREATE VIEW vista_asig_prof AS
SELECT a.nombre_asig, p.nombre AS nombre_profesor
FROM ASIGNATURAS a
JOIN PROFESORES p ON a.id_profesor = p.id_profesor;

SELECT * FROM vista_asig_prof;


/* ============================
   EJERCICIO 3 – VISTA SEGURA
   ============================ */
CREATE VIEW vista_profesores_segura AS
SELECT id_profesor, nombre, email
FROM PROFESORES;

SELECT * FROM vista_profesores_segura;


/* ============================
   EJERCICIO 4 – CREACIÓN DE USUARIOS
   ============================ */
CREATE USER 'carlos_user'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'daniel_user'@'%' IDENTIFIED BY '1234';
CREATE USER 'celia_user'@'localhost' IDENTIFIED BY '1234';


/* ============================
   EJERCICIO 5 – PERMISOS
   ============================ */
GRANT SELECT ON GESTION_CENTRO.* 
TO 'carlos_user'@'localhost';

GRANT SELECT, INSERT ON GESTION_CENTRO.ASIGNATURAS 
TO 'daniel_user'@'%';

GRANT SELECT, UPDATE ON GESTION_CENTRO.ASIGNATURAS 
TO 'celia_user'@'localhost';


/* ============================
   EJERCICIO 7 – SEGURIDAD CON VISTAS
   ============================ */
REVOKE ALL PRIVILEGES ON GESTION_CENTRO.PROFESORES
FROM 'carlos_user'@'localhost';

GRANT SELECT ON GESTION_CENTRO.vista_profesores_segura
TO 'carlos_user'@'localhost';


/* ============================
   EJERCICIO 8 – REVOCAR PERMISOS
   ============================ */
REVOKE INSERT ON GESTION_CENTRO.ASIGNATURAS
FROM 'daniel_user'@'%';
