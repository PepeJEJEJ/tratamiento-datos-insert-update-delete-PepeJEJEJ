[github.com](https://github.com/PepeJEJEJ/tratamiento-datos-insert-update-delete-PepeJEJEJ/edit/main/README.md)

---

# 📘 Gestión de Usuarios, Permisos, Vistas e Índices en MySQL

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
