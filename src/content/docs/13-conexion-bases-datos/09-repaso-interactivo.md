---
title: "09 · Repaso interactivo: domina el JDBC"
description: "El cierre práctico de la unidad, con una inyección SQL que va a doler, un UPDATE sin WHERE que va a arder y una conexión que nadie cerró 😈🗄️"
---

<p><small>El cierre práctico de la unidad, con una inyección SQL que va a doler, un UPDATE sin WHERE que va a arder y una conexión que nadie cerró 😈🗄️</small></p>

> 🗺️ **Estás en:** 🗄️ **U13 · Conexión a BD con JDBC** → 09 · Repaso interactivo

---

## 📬 La idea en una frase

> **En este punto no aprendemos nada nuevo: lo convertimos todo en práctica. Y, como siempre, algo no va a funcionar.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaban de darte este programa para ejecutar:*

```java
import java.sql.*;

public class Misterio {
    public static void main(String[] args) {
        String url = "jdbc:sqlite:instituto.db";

        try (Connection con = DriverManager.getConnection(url);
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM alumnos")) {

            if (rs.next()) {
                System.out.println("Total: " + rs.getInt(1));
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

**¿Qué imprimes por pantalla? Elige sabiamente:**

1. **`Total: 0`** → `COUNT(*)` siempre devuelve 0 si hay algún alumno. ❌
2. **`Total: <número de alumnos>`** → `COUNT(*)` devuelve una sola fila con una columna, y `rs.getInt(1)` la lee por índice. ✅
3. **Una excepción** → `getInt(1)` no existe porque las columnas empiezan en 0. ❌

> <details>
> <summary>🔄 Solución</summary>
>
> La opción **2**. `SELECT COUNT(*)` devuelve **una sola fila con una columna** sin nombre fijo, así que se accede por índice `rs.getInt(1)` (las columnas del `ResultSet` empiezan en 1, no en 0). Si la tabla tiene 25 alumnos, imprime `Total: 25`. Un `ResultSet` con una fila sigue necesitando su `rs.next()`: el cursor siempre empieza antes de la primera fila.
>
> </details>

---

## 🔥 Fireside Chat: Statement vs PreparedStatement

> *Dos formas de ejecutar SQL se encuentran frente a la máquina de café.*

**Statement:** — Yo soy el de toda la vida. `stmt.executeQuery("SELECT * FROM usuarios")`. Directo, sin vueltas. Para una consulta fija soy perfecto.

**PreparedStatement:** — Sí, pero cuando llega un dato del usuario y concatenas, se te enciende el piloto de la inyección. Yo separo el SQL de los datos con `?` y los `setXxx`. Seguridad de serie.

**Statement:** — ¿Y si solo ejecuto una consulta una vez? ¿Para qué voy a preparar nada?

**PreparedStatement:** — Además yo cacheo el plan de ejecución. Si ejecutas la misma consulta con distintos parámetros, soy más rápido. Y en Java casi siempre haces eso: la misma consulta, mil valores distintos.

**Statement:** — Vale... pero yo sirvo para el DDL: `CREATE TABLE`, `ALTER`...

**PreparedStatement:** — Cierto. Para DDL, Statement. Para DML (SELECT, INSERT, UPDATE, DELETE), yo. ¿Trato?

**Statement:** — Trato.

> La lección: **DDL → Statement. DML → PreparedStatement.** Y jamás concatenes datos de usuario en un SQL, digas lo que digas.

---

## 🕵️ ¿Quién soy?

Adivina qué concepto de la unidad soy:

1. **Soy el traductor universal entre Java y cualquier base de datos con controlador.**
2. **Soy la tubería que `DriverManager.getConnection()` te devuelve y que cierras con `try-with-resources`.**
3. **Soy la tabla virtual que se recorre con `next()` y se lee con `getXxx("columna")`.**
4. **Soy el mensajero seguro que separa el SQL de los datos con `?`.**
5. **Soy el patrón que encapsula todo el SQL detrás de una interfaz.**
6. **Soy la operación que hace que varias sentencias se confirmen juntas... o ninguna.**

<details>
<summary>🔄 Respuestas</summary>

1. **JDBC** — `java.sql`, el puente hacia SQLite, MySQL, PostgreSQL...
2. **`Connection`** — se obtiene con `DriverManager.getConnection()` y se cierra siempre.
3. **`ResultSet`** — `while (rs.next())` + `rs.getInt("id")`, `rs.getString("nombre")`...
4. **`PreparedStatement`** — placeholders `?` y `setString(1, ...)`, `setInt(2, ...)`...
5. **DAO** — `ContactoDAO` (interfaz) + `ContactoDAOImpl` (implementación).
6. **Transacción** — `setAutoCommit(false)`, `commit()` o `rollback()`.

</details>

---

## 🤬 CONRAD VS EL MUNDO: "El JDBC que no se cierra"

> *CONRAD, nuestro compilador cascarrabias, opina sobre los clásicos del novato.*

**CONRAD:** — ¡OTRA VEZ! Llega un alumno y me dice: *CONRAD, mi programa funciona pero a la segunda vez se queja de "Too many connections"*. ¡AY, MADRE MÍA! Es que está abriendo `Connection` a lo loco y **no la cierra nunca**. Cada `getConnection()` sin su `try-with-resources` es una tubería goteando. El servidor tiene un límite de conexiones, y tú las estás agotando todas. ¡`try-with-resources`! ¿Tanto cuesta?

*Y luego está el del `UPDATE` sin `WHERE`.* Me enseña un código que actualiza "un" contacto y resulta que **los ha puesto a todos** con el mismo teléfono. ¿Y el `WHERE id = ?`? ¡Se le olvidó! En `UPDATE` y `DELETE`, si no hay `WHERE`, es que querías arrasar la tabla entera.

*Y el rey del drama:* usa `executeQuery()` para un `INSERT` y se lleva una `SQLException`. ¡Pues claro! `executeQuery()` es para SELECT; para INSERT/UPDATE/DELETE está `executeUpdate()`. Cada cosa en su sitio. Como el tenedor y el microondas, que te lo dije en el punto 3.

*Y el último, el del silencio:* captura la excepción y... **no hace nada**. `catch (Exception e) {}` vacío. La luz del "check engine" encendida y él tan feliz. ¡Escribe `e.getMessage()`! Es gratis y te dice exactamente qué ha pasado.

**La lección:** antes de acusar a la base de datos de "odiarte", repasa el trío sagrado de la unidad: **¿he cerrado la conexión? ¿hay `WHERE` en mi UPDATE/DELETE? ¿estoy usando el método de ejecución correcto?** El 90% de los errores de esta unidad se arreglan con esas tres preguntas. La base de datos no te odia: te está pasando las respuestas del examen.

---

## 🎮 El juego de las decisiones

Elige la respuesta correcta para cada decisión (respuestas al final):

1. Quieres buscar alumnos por un nombre que teclea el usuario. ¿Qué usas?
   - a) `Statement` con concatenación   b) `PreparedStatement` con `?`
2. `executeUpdate()` en un `UPDATE` que no encuentra filas... ¿qué devuelve?
   - a) `0`   b) una `SQLException`
3. ¿Qué método abre una transacción?
   - a) `con.setAutoCommit(false)`   b) `con.beginTransaction()`
4. `rs.next()` en un `ResultSet` vacío devuelve...
   - a) `false`   b) `null`
5. Para el DDL (`CREATE TABLE`), ¿qué se usa con más sentido?
   - a) `Statement`   b) `PreparedStatement`

<details>
<summary>🔄 Soluciones</summary>

1. **b)** — Jamás concatenes datos de usuario en SQL. `PreparedStatement` con placeholders.
2. **a)** — Devuelve `0`: no encontró filas, pero no es un error. Por eso se comprueba `> 0`.
3. **a)** — `setAutoCommit(false)` desactiva el auto-commit; el resto es `commit()`/`rollback()`.
4. **a)** — `next()` devuelve `false` cuando no quedan filas, no `null` ni excepción.
5. **a)** — Para DDL un `Statement` simple vale; `PreparedStatement` es para DML con datos.

</details>

---

## ⚡ Laboratorio de tortura: el CRUD que sangra

> **Duración estimada:** 30 minutos
> **Herramienta:** tu IDE, el driver de SQLite y un archivo nuevo

**El escenario:** te pasan este gestor de contactos con SQLite. Te dicen que tiene **3 errores** que impiden que compile y 1 error de lógica que hace que el resultado sea incorrecto... pero, ¿y si te lo dicen mal? Tu tarea: hacer que compile, que ejecute y que **toda** la salida sea correcta, contando tú los errores reales.

```java
import java.sql.*;

public class GestorContactos {
    private static final String URL = "jdbc:sqlite:contactos.db";

    public static void main(String[] args) {
        crearTabla();
        insertar("Ana", "666111222");
        insertar("Luis", "666333444");
        listar();
    }

    static void crearTabla() {
        String sql = "CREATE TABLE IF NOT EXISTS contactos (id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, telefono TEXT)";
        try (Connection con = DriverManager.getConnection(URL);
             Statement stmt = con.createStatement()) {
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }

    static void insertar(String nombre, String telefono) {
        String sql = "INSERT INTO contactos (nombre, telefono) VALUES ('" + nombre + "', '" + telefono + "')";
        try (Connection con = DriverManager.getConnection(URL);
             Statement stmt = con.createStatement()) {
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }

    static void listar() {
        String sql = "SELECT * FROM contactos"
        try (Connection con = DriverManager.getConnection(URL);
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                System.out.println(rs.getInt("id") + " - " + rs.getString("nombre"));
            }
        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

**Fallo intencionado:** el número de errores del enunciado está mal a propósito: si buscas el "tercer error de compilación" y el "error de lógica", te vuelves loco. La trampa es tu confianza en el enunciado.

**Tu tarea:** conseguir que compile, que ejecute y que **toda** la salida sea correcta. Si el resultado no cuadra, diagnostica.

**Pistas para cuando te frustres (no antes):**

1. ¿Compila? *no → busca puntos y comas.*
   <details><summary>¿Y si sigo atascado?</summary>Fíjate en la línea `String sql = "SELECT * FROM contactos"` de `listar()`: le falta el `;` al final.</details>
2. ¿Compila ya? *no → busca más cosas raras.*
   <details><summary>¿Y si sigo atascado?</summary>Mira los `Statement` de `insertar()`: está concatenando el SQL con datos del programa. Compila, pero es una bomba de relojería.</details>
3. ¿Crees que hay un error de lógica que cambia la salida? *Vuelve a leer con calma y no te fíes del enunciado.*
   <details><summary>Solución final</summary>

**Errores de compilación:**

1. Falta el `;` al final de `String sql = "SELECT * FROM contactos"` en `listar()`.

**El "error de lógica"**: no existe como tal. La lógica de crear tabla, insertar y listar es correcta y la salida sería `1 - Ana` y `2 - Luis`. Ese era el fallo intencionado: el enunciado dice "3 errores de compilación y 1 de lógica", pero solo hay una falta de `;`. El error "oculto" era tu confianza en el enunciado.

**El problema real que no se ve al ejecutar**: `insertar()` concatena el SQL con los valores, lo que es **SQL injection** en estado puro (punto 5). El programa "funciona" porque los datos son de confianza, pero si `nombre` viniera del usuario, un `Ana'; DROP TABLE contactos; --` se cargaría la tabla. La corrección profesional es `PreparedStatement`:

```java
static void insertar(String nombre, String telefono) {
    String sql = "INSERT INTO contactos (nombre, telefono) VALUES (?, ?)";
    try (Connection con = DriverManager.getConnection(URL);
         PreparedStatement pstmt = con.prepareStatement(sql)) {
        pstmt.setString(1, nombre);
        pstmt.setString(2, telefono);
        pstmt.executeUpdate();
    } catch (SQLException e) {
        System.err.println("Error: " + e.getMessage());
    }
}
```

Salida correcta con el código arreglado:

```
1 - Ana
2 - Luis
```

La lección real: **lee el código, no el enunciado.** Un bug puede ser que te digan "hay 3 errores" y solo haya 1: si buscas los otros dos, te vuelves loco. Y el error más peligroso es el que no da error: la SQL injection se ve con ojos de arquitecto, no con el compilador. Cuenta, verifica y confía en lo que ves, no en la leyenda.

</details>

---

## 🏆 Logros de esta unidad

| Logro | Cómo conseguirlo |
|---|---|
| 🏅 **El Conectador** | Abrir y cerrar una `Connection` con `try-with-resources` sin que se escape ni una |
| 🏅 **El Mensajero Seguro** | Usar `PreparedStatement` para una consulta con datos de usuario, sin concatenar nada |
| 🏅 **El Cazador de Tablas** | Detectar SQL injection en código ajeno y explicar por qué es peligrosa |
| 🏅 **El Arquitecto DAO** | Encapsular el CRUD en una interfaz + implementación y usarlo desde un `main` limpio |
| 🏅 **El Banquero** | Montar una transferencia atómica con `commit()` y `rollback()` que nunca deja los datos a medias |

---

## 🧠 Atrévete a pensar

1. **Sin ejecutar:** ¿qué imprime este programa si la tabla `alumnos` tiene 3 filas?

```java
String sql = "SELECT nombre FROM alumnos WHERE edad > ?";
try (Connection con = DriverManager.getConnection(url);
     PreparedStatement pstmt = con.prepareStatement(sql)) {
    pstmt.setInt(1, 18);
    try (ResultSet rs = pstmt.executeQuery()) {
        while (rs.next()) {
            System.out.print(rs.getString("nombre") + " ");
        }
    }
}
```

2. **El detective del ResultSet:** un método devuelve un `ResultSet` al `main` y luego cierra la conexión. ¿Qué pasa cuando el `main` intenta recorrerlo?
3. **El consultor de precios:** tienes una tabla `productos(precio)` y quieres actualizar un precio concreto. ¿Qué dos cosas son imprescindibles en el `UPDATE`?
4. **Verdadero o falso:** "un `PreparedStatement` permite usar `?` tanto para valores como para el nombre de la tabla".

<details>
<summary>💡 Soluciones</summary>

1. **Los nombres** de los alumnos mayores de 18, separados por espacio. El `?` se rellena con `setInt(1, 18)` y el bucle imprime cada `nombre`.
2. **El `ResultSet` muere.** Está ligado a su conexión: al cerrarla, deja de ser válido y lanza una `SQLException` al recorrerlo. Por eso los métodos devuelven `List<Alumno>` y no `ResultSet`.
3. **`WHERE id = ?`** (o el filtro que identifique el producto) y **comprobar las filas afectadas** con `executeUpdate() > 0`. Sin `WHERE`, actualizas todos los precios.
4. **Falso.** Los `?` solo valen para **valores**, nunca para identificadores (tabla, columna). Esos se eligen en el código.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Método que avanza a la siguiente fila de un ResultSet (4 letras)
3. Excepción checked que acompaña a todo JDBC (13 letras)
5. Método que confirma una transacción (6 letras)
6. Patrón que encapsula el acceso a datos (3 letras)

Vertical:
2. El puente entre Java y la base de datos (4 letras)
4. Objeto Java que representa una fila de la tabla (4 letras)
```

<details>
<summary>📝 Soluciones</summary>

**Horizontal:** 1. NEXT · 3. SQLEXCEPTION · 5. COMMIT · 6. DAO
**Vertical:** 2. JDBC · 4. POJO

</details>

---

## 💬 Preguntas de entrevista de trabajo

> Preguntas reales que te harían para programador Java junior.

1. **"Explícame, como si yo fuera tu abuela, qué es JDBC."**
2. **"¿Cuál es la diferencia entre `Statement` y `PreparedStatement`?"**
3. **"¿Qué es la SQL injection y cómo la evitas?"**
4. **"¿Qué pasa si no cierras una `Connection`?"**
5. **"¿Qué es el patrón DAO y por qué se usa?"**
6. **"¿Qué son `commit` y `rollback` y cuándo los usas?"**

---

## 🤷 No hay preguntas tontas

> ❓ **¿Es necesario `Class.forName()` para cargar el controlador?**

No. Desde Java 6, los controladores JDBC 4.0 se auto-descubren si están en el classpath. Lo verás en tutoriales antiguos, y no pasa nada si lo pones: solo es código que ya no hace falta.

---

> ❓ **¿`Statement` se usa todavía?**

Está zombi. Si ves un `Statement` en código real (que no sea una consulta literal o DDL), es bandera roja. Para cualquier consulta con datos variables: `PreparedStatement`, siempre.

---

> ❓ **¿Puedo compartir una `Connection` entre varios hilos?**

Técnicamente sí, prácticamente no. `Connection` no es *thread-safe*. En aplicaciones con hilos se usa un pool de conexiones (HikariCP) y cada hilo pide la suya.

---

> ❓ **¿DAO y Repository son lo mismo?**

Casi. El DAO está pegado a la base de datos (INSERT, SELECT). El Repository es más de dominio (guardar, buscar). En proyectos pequeños se usan como sinónimos; en los grandes conviven.

---

## 🎬 Poscréditos

La programadora termina su gestor de biblioteca: un `LibroDAO` con su `PreparedStatement` en cada método, una transacción con `commit` y `rollback` para los préstamos y un `config.properties` guardando la URL. Todo funciona. Hasta que la directora le pide que los préstamos se consulten desde el móvil.

Se acerca CONRAD, el compilador cascarrabias, con su taza humeante.

**CONRAD:** — ¿Has visto? Tienes los datos en SQLite y solo los lees desde Java en la misma máquina. Para consultarlos desde un móvil necesitas que tu programa **exponga** esa información por la red: una API. Alguien le pide datos a tu servidor con una petición HTTP, y tu servidor responde con JSON.

**Programadora:** — ¿O sea que en vez de conectarme yo a la base de datos desde cada cliente, el cliente me habla a mí por la red?

**CONRAD:** — *asiente* Exacto. Tu programa Java se convierte en el intermediario: recibe peticiones, consulta la base de datos con el JDBC que acabas de dominar, y devuelve los datos. Primero serviste datos desde la base; ahora los servirás por la web.

**PROXIMAMENTE EN U14:** Servir y Consumir APIs con Web. El momento en que tu programa Java se pone un uniforme de camarero: recibe peticiones HTTP y sirve datos en JSON. 🌐

---

📚 [Volver al índice de la unidad](/ApuntesProgramacion/13-conexion-bases-datos) · **Anterior:** [08 · Buenas prácticas](/ApuntesProgramacion/13-conexion-bases-datos/08-buenas-practicas) · **Siguiente:** **[U14 · Servir y Consumir APIs con Web](/ApuntesProgramacion/14-apis-web)**