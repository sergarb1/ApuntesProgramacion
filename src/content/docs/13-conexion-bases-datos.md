---
title: "U13 — Conexión a Bases de Datos con JDBC"
description: "Java aprende a hablar con las bases de datos: JDBC, SQLite, Connection, Statement, PreparedStatement, el patrón DAO y transacciones. Todo con humor y sin perder la conexión 🗄️"
emoji: 🗄️
---

<p><small>Java aprende a hablar con las bases de datos: JDBC, SQLite, Connection, Statement, PreparedStatement, el patrón DAO y transacciones. Todo con humor y sin perder la conexión 🗄️</small></p>

> 🗺️ **El mapa del paquete:** 🚪 Bienvenida → ☕ U01 → 🔤 U02 → 🔀 U03 → 🅿️ U04 → 🧩 U05 → ⚡ U06 → 🏗️ U07 → 🔒 U08 → 🧬 U09 → 📚 U10 → 🗺️ U11 → 📁 U12 → **🗄️ AQUÍ ESTÁS (U13)** → 🌐 U14

---

En la U12 cerraste el trato con los **ficheros**: guardar y leer información en el disco. Hoy subimos de nivel. Esa información deja de vivir en un archivo suelto y pasa a una **base de datos relacional**, con sus tablas, sus claves y sus reglas. Y Java, por supuesto, va a hablar con ella. La herramienta se llama **JDBC** (Java Database Connectivity) y es el puente oficial entre tu código y cualquier base de datos con controlador.

Esta unidad tiene tres grandes actos:

- **Conectar y consultar:** qué es JDBC, cómo se monta la dependencia de **SQLite** en Maven y el ritual de los 5 pasos para abrir una conexión (`Connection`), lanzar consultas (`Statement`) y leer los resultados (`ResultSet`).
- **El CRUD seguro:** insertar, leer, actualizar y borrar con **`PreparedStatement`**, la vacuna contra la **SQL injection** (pregúntale a Bobby Tables), y el **patrón DAO** para que el SQL no se cuele en tu lógica de negocio.
- **La integridad:** **transacciones** con `commit` y `rollback` para operaciones de todo-o-nada, y un decálogo de buenas prácticas para que tu conexión no sea una fuga de recursos.

Por el camino conocerás a `SQLException`, la excepción checked que te va a acompañar en cada paso, y entenderás por qué `executeQuery()` y `executeUpdate()` son como la puerta de embarque y la del maletero: cada operación tiene la suya.

Esta unidad se lee como un **libro de 9 capítulos**: los 8 primeros puntos son teoría en progresión y el 9º es un aterrizaje práctico para machacar todo lo aprendido.

---

## 🎯 Objetivo de la unidad

Al terminar, serás capaz de:

- Explicar **qué es JDBC** y por qué sirve para cualquier base de datos con controlador.
- Configurar la dependencia de **SQLite** en Maven y conectar tu programa con `DriverManager.getConnection()`.
- Ejecutar consultas con **`Statement`** y leer los resultados con **`ResultSet`** usando `next()` y los `getXxx("columna")`.
- Aplicar el **CRUD completo** (INSERT, SELECT, UPDATE, DELETE) con `executeQuery()` y `executeUpdate()`.
- Usar **`PreparedStatement`** con placeholders `?` y evitar la **SQL injection** sin excusas.
- Aplicar el **patrón DAO** (interfaz + implementación) para separar el SQL de la lógica de negocio.
- Gestionar **transacciones** con `commit()`, `rollback()` y savepoints para operaciones atómicas.
- Escribir código JDBC siguiendo el **decálogo de buenas prácticas**: `try-with-resources`, filas afectadas y `WHERE` siempre.

---

## 🗺️ Mapa de la unidad

| Punto | Qué aprenderás | Dificultad |
|---|---|---|
| [01 · Qué es JDBC](/ApuntesProgramacion/13-conexion-bases-datos/01-que-es-jdbc) | JDBC, SQLite y la dependencia Maven que lo pone todo en marcha | Todos |
| [02 · Conexión a SQLite](/ApuntesProgramacion/13-conexion-bases-datos/02-conexion) | Los 5 pasos del ritual y la interfaz `Connection` | Todos |
| [03 · Statement y ResultSet](/ApuntesProgramacion/13-conexion-bases-datos/03-statement-resultset) | Ejecutar consultas y procesar filas con `next()` y `getXxx` | Todos |
| [04 · CRUD completo](/ApuntesProgramacion/13-conexion-bases-datos/04-crud) | Insertar, leer, actualizar y borrar con `executeQuery` y `executeUpdate` | Todos |
| [05 · PreparedStatement y SQL injection](/ApuntesProgramacion/13-conexion-bases-datos/05-preparedstatement) | Placeholders `?`, `setXxx` y la historia de Bobby Tables | Todos |
| [06 · El patrón DAO](/ApuntesProgramacion/13-conexion-bases-datos/06-pattern-dao) | Interfaz + implementación: el SQL no pisa tu lógica de negocio | Todos |
| [07 · Transacciones](/ApuntesProgramacion/13-conexion-bases-datos/07-transacciones) | `commit`, `rollback` y savepoints: todo o nada | Todos |
| [08 · Buenas prácticas](/ApuntesProgramacion/13-conexion-bases-datos/08-buenas-practicas) | El decálogo del JDBC: recursos, filas afectadas y `WHERE` siempre | Todos |
| [09 · Repaso interactivo](/ApuntesProgramacion/13-conexion-bases-datos/09-repaso-interactivo) | Sé el Código, Fireside, Laboratorio, Crucigrama y más | Todos |

> 📖 **Flujo de lectura:** los 8 primeros puntos son teoría en progresión. El 9º es el aterrizaje práctico: léelo justo después del 8º y antes de abrir los boletines.

---

## 📝 Boletines de la unidad

> Practica con los pares del curso: empieza siempre por el resuelto para ver el estilo y luego intenta el por-resolver.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/boletines/boletin-u13-inicial-resuelto" class="elink">✅ Inicial resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u13-inicial" class="elink">🟢 Inicial por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u13-avanzado-resuelto" class="elink">💪 Avanzado resuelto</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u13-avanzado" class="elink">⭐ Avanzado por resolver</a>
  <a href="/ApuntesProgramacion/boletines/boletin-u13-extras" class="elink">🔥 Extras</a>
</div>

---

## ✅ Criterios de evaluación cubiertos (RA9)

**RA9: Gestiona información almacenada en bases de datos relacionales manteniendo la integridad y la consistencia de los datos.**

| CE | Criterio | Dónde se cubre |
|---|---|---|
| RA9 a) | Se han identificado las características y métodos de acceso a sistemas gestores de bases de datos relacionales. | ✅ Puntos 1 y 2 |
| RA9 b) | Se han programado conexiones con bases de datos. | ✅ Punto 2 |
| RA9 c) | Se ha escrito código para almacenar información en bases de datos. | ✅ Puntos 4 y 5 |
| RA9 d) | Se han creado programas para recuperar y mostrar información almacenada en bases de datos. | ✅ Puntos 3 y 4 |
| RA9 e) | Se han efectuado borrados y modificaciones sobre la información almacenada. | ✅ Punto 4 |
| RA9 f) | Se han creado aplicaciones que ejecuten consultas sobre bases de datos. | ✅ Puntos 3, 5 y 9 |
| RA9 g) | Se han creado aplicaciones para posibilitar la gestión de información presente en bases de datos relacionales. | ✅ Puntos 6 y 9 |

> 📌 Esta unidad cubre la **RA9** completa. El camino hasta aquí: **U03** te enseñó las excepciones (y `SQLException` es checked, te va a perseguir), **U07/U08** te dieron las clases e interfaces con las que montar los POJOs y el DAO, y la **U12** te dejó el `try-with-resources` listo para cerrar conexiones. Todo el material anterior cobra sentido ahora: es hora de que tus objetos duerman en una base de datos.

---

## 🚪 ¿Por dónde empiezo?

- ¿Vienes de la U12 (ficheros) y quieres lo esencial? → Arranca en el [punto 1](/ApuntesProgramacion/13-conexion-bases-datos/01-que-es-jdbc) y el [punto 2](/ApuntesProgramacion/13-conexion-bases-datos/02-conexion): conectar es el 90% de la batalla.
- ¿Ya conectas y quieres manejar datos? → Ve directo al [punto 4](/ApuntesProgramacion/13-conexion-bases-datos/04-crud) (el CRUD) y al [punto 5](/ApuntesProgramacion/13-conexion-bases-datos/05-preparedstatement) (hacerlo sin que te hackeen).
- ¿Solo vienes a por los trucos? → Salta al [punto 5](/ApuntesProgramacion/13-conexion-bases-datos/05-preparedstatement) (la SQL injection) y al [punto 8](/ApuntesProgramacion/13-conexion-bases-datos/08-buenas-practicas) (el decálogo).
- ¿Vienes a repasar? → Haz el [Repaso interactivo](/ApuntesProgramacion/13-conexion-bases-datos/09-repaso-interactivo) y después los [boletines](/ApuntesProgramacion/boletines/boletin-u13-inicial).

**📍 Primer punto:** [01 · Qué es JDBC](/ApuntesProgramacion/13-conexion-bases-datos/01-que-es-jdbc)  
**⏭️ Al acabar la unidad, continúa en [U14 · Servir y Consumir APIs con Web](/ApuntesProgramacion/14-apis-web).**