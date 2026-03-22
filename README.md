[github.com](https://github.com/PepeJEJEJ/tratamiento-datos-insert-update-delete-PepeJEJEJ/edit/main/README.md)
# 12 Creacion, Lectura, Modificacion y Borrado de Tablas
---

```markdown
# 📘 Tratamiento de Datos en SQL  
### INSERT · UPDATE · DELETE · Integridad referencial · Diccionario de datos

Este documento resume las operaciones fundamentales de manipulación de datos (DML) en SQL, junto con conceptos clave como integridad referencial y consultas al diccionario de datos.

---

# 1️⃣ Introducción

El tratamiento de datos en SQL se basa en tres operaciones principales:

- **INSERT** → Añadir registros  
- **UPDATE** → Modificar registros  
- **DELETE** → Eliminar registros  

Además, se estudian:

- Integridad referencial  
- Diccionario de datos  
- Extensiones avanzadas del lenguaje SQL  

---

# 2️⃣ Inserción de registros (INSERT)

### ✔️ Sintaxis básica

```sql
INSERT INTO tabla (col1, col2, ...)
VALUES (valor1, valor2, ...);
```

- Se pueden omitir columnas si se insertan todas en orden.
- Los campos no especificados toman **NULL** si está permitido.

### ✔️ Inserción mediante subconsulta

```sql
INSERT INTO empleados
SELECT id, nombre, fecha
FROM demandantes
WHERE estudios = 'ASIR';
```

---

# 3️⃣ Modificación de registros (UPDATE)

### ✔️ Sintaxis

```sql
UPDATE tabla
SET columna = valor, columna2 = valor2
WHERE condición;
```

> La cláusula **WHERE** es opcional, pero necesaria para evitar modificar todos los registros.

### ✔️ Ejemplo de modificación directa

```sql
UPDATE empleados
SET nombre = INITCAP(nombre), localidad = 'Madrid'
WHERE fecha_nac >= '01/12/1980';
```

### ✔️ Ejemplo con subconsulta

```sql
UPDATE empleados
SET salario = salario * 1.15
WHERE id_seccion = (
    SELECT id_seccion FROM secciones
    WHERE nom_seccion = 'Productivo'
);
```

---

# 4️⃣ Eliminación de registros (DELETE)

### ✔️ Sintaxis

```sql
DELETE FROM tabla
WHERE condición;
```

### ✔️ Ejemplos

```sql
DELETE empleados
WHERE localidad = 'Madrid';

DELETE empleados
WHERE fecha_nac < '01/01/1980'
AND localidad = 'C.Real';
```

### ✔️ Eliminación mediante subconsulta

```sql
DELETE empleados
WHERE id_empleado IN (
    SELECT id_empleado FROM operarios
);
```

---

# 5️⃣ Integridad referencial

La integridad referencial garantiza que las relaciones entre tablas se mantengan coherentes.

### ✔️ Inserción

- No se puede insertar una clave foránea que no exista en la tabla padre.

### ✔️ Modificación

Cambiar claves primarias o foráneas debe respetar las reglas:

- **RESTRICT**
- **CASCADE**
- **SET NULL**
- **SET DEFAULT**

### ✔️ Eliminación

Ejemplo al borrar un cliente con pedidos:

| Acción      | Resultado |
|-------------|-----------|
| RESTRICT    | No permite borrar |
| CASCADE     | Borra pedidos asociados |
| SET NULL    | Pone la FK a NULL |
| SET DEFAULT | Asigna valor por defecto |

---

# 6️⃣ Consultas al diccionario de datos (Oracle)

Oracle proporciona vistas para consultar metadatos de la base de datos.

### ✔️ Vistas importantes

- `USER_TABLES`, `USER_TAB_COLUMNS`
- `ALL_TABLES`, `ALL_TAB_COLUMNS`
- `DBA_TABLES`, `DBA_TAB_COLUMNS`

### ✔️ Consultar tablas del usuario

```sql
SELECT * FROM user_tables;
```

### ✔️ Consultar columnas de tablas

```sql
SELECT t.table_name, c.column_name, c.data_type
FROM user_tables t
JOIN user_tab_columns c
ON t.table_name = c.table_name;
```

# 13 Gestión de Usuarios, Permisos, Vistas e Índices en MySQL

## 1. 👤 Usuarios en MySQL

Un usuario en MySQL se define con la sintaxis:

```
'usuario'@'host'
```

### 📌 Significado

| Elemento | Significado |
|---------|-------------|
| **usuario** | Nombre del usuario |
| **localhost** | Solo puede conectarse desde el mismo equipo |
| **%** | Puede conectarse desde cualquier equipo |
| **IP (ej: 192.168.1.10)** | Solo desde esa dirección |

### 📌 Ejemplo

```sql
CREATE USER 'carlos_user'@'localhost' IDENTIFIED BY '1234';
```

---

## 2. 🔐 Permisos (privilegios)

Los permisos indican qué puede hacer un usuario.

| Permiso | Función |
|---------|---------|
| **SELECT** | Consultar datos |
| **INSERT** | Insertar datos |
| **CREATE** | Crear tablas |
| **READ** | Leer tablas |
| **UPDATE** | Modificar datos |
| **DELETE** | Eliminar datos |
| **DROP** | Eliminar tablas |
| **ALTER** | Modificar tablas |
| **INDEX** | Crear índices |

---

## 3. 🔄 Comandos de control

| Comando | Función |
|---------|---------|
| **GRANT** | Asigna permisos |
| **REVOKE** | Elimina permisos |

### 📌 Ejemplo

```sql
GRANT SELECT ON bd.tabla TO 'usuario'@'localhost';
```

---

## 4. 👁️ Vistas

Una vista es una consulta almacenada que se puede usar como si fuera una tabla.

### ⭐ Ventajas

- Simplifica consultas  
- Oculta datos sensibles  
- Mejora la seguridad  

---

## 5. ⚡ Índices

Un índice es una estructura que permite acceder a los datos más rápido.

### 🔍 Sin índice
- Se recorre toda la tabla

### 🚀 Con índice
- Se accede directamente al dato

---
