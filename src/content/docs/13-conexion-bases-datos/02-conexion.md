---
title: "02 · Conexión a SQLite: los 5 pasos y Connection"
description: "El ritual de los 5 pasos para conectar Java con SQLite y la interfaz Connection, la tubería por la que viajan tus consultas 🗄️🔗"
---

<p><small>El ritual de los 5 pasos para conectar Java con SQLite y la interfaz Connection, la tubería por la que viajan tus consultas 🗄️🔗</small></p>

> 🗺️ **Estás en:** 🗄️ **U13 · Conexión a BD con JDBC** → 02 · Conexión a SQLite

---

## 📬 La idea en una frase

> **Conectarse a SQLite es un ritual de 5 pasos: `DriverManager.getConnection("jdbc:sqlite:instituto.db")` te devuelve una `Connection`, y esa tubería es la que usará todo el resto del código.**

Si el punto 1 era conocer a JDBC de lejos, aquí te acercas a saludar. Abrir una conexión es lo primero que hace cualquier programa con base de datos, y también lo que más veces olvidamos cerrar. Vamos a montar el ritual completo y a entender qué es exactamente ese objeto `Connection` que vas a usar en cada ejercicio de la unidad.

---

## 🪜 Los 5 pasos (y el bonus no opcional)

Todo programa JDBC sigue esta escalera:

1. **Cargar el controlador** — desde Java 6, automático. Solo te acuerdas de que existe cuando lees código antiguo.
2. **Establecer la conexión** — `DriverManager.getConnection(url)` te devuelve una `Connection`.
3. **Crear un Statement** — `con.createStatement()` (o `con.prepareStatement(sql)`, lo verás en el punto 4).
4. **Ejecutar la consulta** — `executeQuery()` para SELECT, `executeUpdate()` para INSERT/UPDATE/DELETE.
5. **Procesar los resultados** — recorrer el `ResultSet` con `next()`.

Y el **bonus no opcional**: cerrar todo. En Java moderno, `try-with-resources` lo hace solo (lo viste en la U12 con los ficheros, aquí es exactamente la misma idea). Un recurso que no se cierra es una fuga: en un servidor, cada conexión abierta consume memoria y hay un límite. Llega el siguiente `getConnection()` y... "Too many connections".

> 💡 **Consejo:** memoriza los 5 pasos en orden. El paso 4 y el 5 se repiten en cada consulta que escribas el resto de tu vida. Y el bonus de cerrar... que no se te olvide jamás.

---

## 🔗 Connection: la tubería

`Connection` es la interfaz que representa la conexión abierta con la base de datos. Es la tubería por la que viajan tus consultas. Para SQLite, que no tiene usuario ni contraseña, la URL es simplemente la ruta de un archivo:

```java
String url = "jdbc:sqlite:instituto.db";
Connection con = DriverManager.getConnection(url);
```

> 📝 **Nota:** si el archivo `instituto.db` no existe, SQLite lo crea automáticamente. No tienes que montar la base de datos a mano antes de conectar: la primera vez que la uses, ya estará ahí.

El famoso protocolo "jdbc:sqlite:" es la URL estándar: `jdbc` es el protocolo, `sqlite` es el subprotocolo (qué base de datos) y el resto es el destino (para MySQL sería algo como `jdbc:mysql://localhost:3306/instituto`).

### SQLException, la que te va a perseguir

`DriverManager.getConnection(...)` lanza **`SQLException`**, una excepción *checked*: el compilador te obliga a capturarla o declararla. Aprendiste las excepciones en la U03; aquí vas a convivir con esta a diario. Lo correcto no es tragártela en silencio, sino mostrar qué ha pasado:

```java
try {
    Connection con = DriverManager.getConnection(url);
    System.out.println("¡Conectado a SQLite!");
} catch (SQLException e) {
    System.err.println("Error de conexión: " + e.getMessage());
    System.err.println("Código de error: " + e.getErrorCode());
    System.err.println("Estado SQL: " + e.getSQLState());
}
```

> ⚠️ **Advertencia:** nunca hagas `catch (Exception e) {}` y te quedes tan pancho. Eso es tapar la luz del "check engine" con esparadrapo: el error sigue ahí, solo que ya nadie lo ve. Captura `SQLException`, y si quieres saber más, usa `getErrorCode()` y `getSQLState()`.

---

## 🧼 La conexión completa con try-with-resources

El patrón que usarás en toda la unidad. Abre la conexión, haz lo que tengas que hacer y déjate de historias:

```java
String url = "jdbc:sqlite:instituto.db";

try (Connection con = DriverManager.getConnection(url)) {
    System.out.println("Conectado. Base de datos lista.");

    // aquí irían las consultas (Statement, ResultSet...)

} catch (SQLException e) {
    System.err.println("Error BD: " + e.getMessage());
}
// la Connection se cierra sola al salir del try
```

`try-with-resources` cierra los recursos en **orden inverso** al de apertura. Si abres `Connection`, `Statement` y `ResultSet`, se cierran ResultSet → Statement → Connection. Solo y sin que tengas que pensar. Es mágico, y es la forma correcta.

> 💡 **Consejo:** no compartas una `Connection` entre hilos (lo verás más adelante): no es *thread-safe*. Si algún día necesitas varias conexiones a la vez, usa un pool de conexiones como HikariCP. Para este curso, una conexión por operación con `try-with-resources` es más que suficiente.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué devuelve `DriverManager.getConnection(url)`?
2. ¿Qué hace SQLite si el archivo de la base de datos no existe?
3. ¿Qué excepción lanza `getConnection()` y por qué no puedes ignorarla?
4. ¿En qué orden se cierran los recursos con `try-with-resources`?

<details>
<summary>🔄 Respuestas</summary>

1. Una **`Connection`**, la tubería hacia la base de datos.
2. Lo crea automáticamente. No tienes que montar la base de datos a mano.
3. **`SQLException`**, una checked que el compilador te obliga a manejar.
4. En orden inverso al de apertura: ResultSet → Statement → Connection.

</details>

---

## ✅ Resumen en 3 frases

1. Conectarse a SQLite es un **ritual de 5 pasos** cuyo corazón es `DriverManager.getConnection("jdbc:sqlite:instituto.db")`.
2. `Connection` es la **tubería** por la que viajan tus consultas; si no la cierras, se queda abierta y agota los recursos del servidor.
3. `getConnection()` lanza **`SQLException`** (checked), y la forma correcta de trabajar es envolverlo todo en **`try-with-resources`** para que se cierre solo.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `DriverManager` | La clase que reparte conexiones (`getConnection`) |
> | `Connection` | La tubería abierta hacia la base de datos |
> | URL JDBC | `jdbc:sqlite:archivo.db` — protocolo, subprotocolo y destino |
> | `SQLException` | La checked que te acompaña en todo JDBC |
> | `try-with-resources` | Cierre automático de recursos, orden inverso |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/13-conexion-bases-datos) · **Anterior:** [01 · Qué es JDBC](/ApuntesProgramacion/13-conexion-bases-datos/01-que-es-jdbc) · **Siguiente:** [03 · Statement y ResultSet: consultar datos](/ApuntesProgramacion/13-conexion-bases-datos/03-statement-resultset)