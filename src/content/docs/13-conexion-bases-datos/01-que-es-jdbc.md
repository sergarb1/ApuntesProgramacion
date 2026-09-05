---
title: "01 · Qué es JDBC"
description: "JDBC, el USB de las bases de datos: Java habla con SQLite, MySQL o PostgreSQL gracias a un controlador. Y la dependencia Maven que lo enciende todo 🗄️🔌"
---

<p><small>JDBC, el USB de las bases de datos: Java habla con SQLite, MySQL o PostgreSQL gracias a un controlador. Y la dependencia Maven que lo enciende todo 🗄️🔌</small></p>

> 🗺️ **Estás en:** 🗄️ **U13 · Conexión a BD con JDBC** → 01 · Qué es JDBC

---

## 📬 La idea en una frase

> **JDBC (Java Database Connectivity) es el traductor universal entre tu código Java y cualquier base de datos que tenga un controlador: da igual SQLite, MySQL o PostgreSQL, el código que escribes es casi el mismo.**

En la U12 aprendiste a guardar datos en ficheros: listas planas, texto plano, archivos sueltos. Pero un fichero no sabe responder a «dame todos los alumnos mayores de 18». Para eso están las **bases de datos relacionales**: tablas, filas, columnas y consultas. Y para que Java pueda hablar con ellas existe JDBC, un conjunto de interfaces del paquete `java.sql`. Bienvenido al punto donde tu programa empieza a tener memoria de largo plazo.

---

## 🔌 JDBC: el USB de las bases de datos

Piensa en JDBC como el puerto USB: da igual qué enchufes (SQLite, MySQL, PostgreSQL, Oracle...), la clavija es la misma. Cada base de datos aporta su **controlador** (en inglés, *driver*): un `.jar` que sabe traducir las llamadas genéricas de JDBC al dialecto de esa base de datos en concreto.

```
Tu programa Java  ──JDBC──▶  Controlador  ──▶  Base de datos
   (java.sql)      (genérico)   (el enchufe)     (SQLite, MySQL...)
```

La regla de oro: si cambias de base de datos y usaste SQL estándar, solo cambias el **controlador** y la **URL de conexión**. El resto del código ni se entera. Esa es la magia de JDBC.

> 💡 **Consejo:** el paquete `java.sql` contiene las interfaces clave: `Connection`, `Statement`, `PreparedStatement` y `ResultSet`. Este punto las presenta; los siguientes las desmontan una a una.

---

## 🗄️ SQLite: la base de datos de entrenamiento

Para aprender no necesitas montar un servidor ni abrir puertos. **SQLite** es una base de datos que vive en un **único archivo local**: sin servidor, sin usuario, sin contraseña. Si el archivo no existe, SQLite lo crea solo la primera vez que te conectas. Perfecta para practicar, y de paso es la que usan montones de aplicaciones reales.

> 📝 **Nota:** en el curso usamos SQLite porque no necesita instalación. Todo lo que aprendes aquí (CRUD, PreparedStatement, transacciones) funciona igual en MySQL o PostgreSQL cambiando el controlador y la URL.

---

## 📦 La dependencia Maven

Para usar el controlador de SQLite en un proyecto Maven, añades esta dependencia al `pom.xml`:

```xml
<dependency>
    <groupId>org.xerial</groupId>
    <artifactId>sqlite-jdbc</artifactId>
    <version>3.45.1.0</version>
</dependency>
```

Cuando Maven la descarga, el controlador queda en tu *classpath* y Java lo encuentra solo. Desde Java 6 no necesitas ni escribir `Class.forName(...)` para cargarlo: JDBC 4.0 se auto-descubre. Si ves `Class.forName()` en tutoriales antiguos, es que ese tutorial se escribió cuando se hacía a mano. No pasa nada si lo pones; tampoco pasa nada si no lo pones.

> ⚠️ **Advertencia:** si Maven no encuentra la clase `org.sqlite.JDBC` al ejecutar, el 99% de las veces es que la dependencia no está en el `pom.xml` o no se ha descargado. Primero revisa eso, y después tu código.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué significa JDBC y en qué paquete vive?
2. ¿Qué papel juega el controlador (driver)?
3. ¿Por qué SQLite es ideal para aprender?
4. ¿Qué tienes que cambiar si pasas de SQLite a MySQL?

<details>
<summary>🔄 Respuestas</summary>

1. **Java Database Connectivity**, un conjunto de interfaces en el paquete `java.sql`.
2. Traduce las llamadas genéricas de JDBC al dialecto de una base de datos concreta. Es el enchufe.
3. Porque no necesita servidor: vive en un único archivo local que se crea solo.
4. Solo el controlador (la dependencia) y la URL de conexión. El código SQL estándar se queda igual.

</details>

---

## ✅ Resumen en 3 frases

1. **JDBC** es el puente estándar de Java hacia cualquier base de datos con controlador: interfaces en `java.sql` que no cambian aunque cambie la base de datos.
2. Cada base de datos (SQLite, MySQL, PostgreSQL...) aporta su **controlador**, que traduce las llamadas genéricas a su dialecto.
3. Usamos **SQLite** porque es un único archivo sin servidor, y en Maven se añade con una dependencia de una línea.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | JDBC | Java Database Connectivity: el puente Java ↔ base de datos |
> | Controlador (driver) | El enchufe específico para cada base de datos |
> | `java.sql` | El paquete con las interfaces de JDBC |
> | SQLite | Base de datos en un único archivo, sin servidor |
> | Dependencia Maven | La línea en el `pom.xml` que trae el controlador |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/13-conexion-bases-datos) · **Anterior:** — · **Siguiente:** [02 · Conexión a SQLite: los 5 pasos y Connection](/ApuntesProgramacion/13-conexion-bases-datos/02-conexion)