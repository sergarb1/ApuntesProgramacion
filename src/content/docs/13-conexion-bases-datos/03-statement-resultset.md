---
title: "03 · Statement y ResultSet: consultar datos"
description: "Lanza consultas con Statement, procesa filas con ResultSet y decide entre executeQuery y executeUpdate sin meter un tenedor en el microondas 🗄️📊"
---

<p><small>Lanza consultas con Statement, procesa filas con ResultSet y decide entre executeQuery y executeUpdate sin meter un tenedor en el microondas 🗄️📊</small></p>

> 🗺️ **Estás en:** 🗄️ **U13 · Conexión a BD con JDBC** → 03 · Statement y ResultSet

---

## 📬 La idea en una frase

> **Con `Statement` envías la consulta y con `ResultSet` recibes las filas: `rs.next()` avanza a la siguiente fila (empezando antes de la primera) y `rs.getInt("id")` / `rs.getString("nombre")` leen cada columna.**

Ya tienes la tubería (`Connection`). Ahora toca lo divertido: **preguntarle** a la base de datos. El mensajero que lleva tu pregunta se llama `Statement`, y la respuesta llega en un `ResultSet`, que es como una tabla virtual con las filas que han coincidido. Vamos a ver cómo se lanza una consulta y cómo se procesa fila a fila.

---

## 📤 Statement: el mensajero

`Statement` es la forma más directa de ejecutar una consulta. La creas a partir de la conexión y le pasas el SQL como un String:

```java
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM alumnos");
```

`executeQuery()` es el método para **SELECT**: devuelve un `ResultSet` con las filas que han coincidido. Si la consulta no devuelve nada, no es un error: te da un `ResultSet` vacío, y `rs.next()` devolverá `false` directamente.

> ⚠️ **Advertencia:** no uses `executeQuery()` para un INSERT, UPDATE o DELETE. Eso lanza una `SQLException`. `executeQuery()` es solo para consultas que devuelven datos (SELECT); para las demás está `executeUpdate()`. Cada cosa en su sitio, como el tenedor y el microondas.

---

## 📊 ResultSet: la tabla virtual

`ResultSet` es la respuesta de la base de datos: un conjunto de filas. La clave es que el cursor empieza **antes de la primera fila**, y `next()` lo avanza a la siguiente. Cuando no quedan más filas, `next()` devuelve `false`.

```java
while (rs.next()) {
    System.out.println(rs.getInt("id") + ": " + rs.getString("nombre"));
}
```

El patrón es siempre el mismo: `while (rs.next())` para recorrer todas las filas, y dentro, `rs.getXxx("nombre_columna")` para leer cada campo. El `getXxx` depende del tipo: `getInt`, `getString`, `getDouble`, `getBoolean`, `getDate`...

| Tipo en SQLite | Método de lectura |
|---|---|
| INTEGER | `getInt("columna")` |
| TEXT | `getString("columna")` |
| REAL | `getDouble("columna")` |
| BOOLEAN (0/1) | `getBoolean("columna")` |

> 💡 **Consejo:** también puedes usar el índice de columna en lugar del nombre: `rs.getString(1)` es la primera columna, `rs.getString(2)` la segunda... El nombre es más legible y no se rompe si reordenas las columnas. Usa nombres.

---

## ⚖️ executeQuery vs executeUpdate

Dos métodos, dos misiones. Esta tabla te salva en los exámenes:

| Método | Para qué | Devuelve |
|---|---|---|
| `executeQuery()` | SELECT | `ResultSet` (las filas) |
| `executeUpdate()` | INSERT, UPDATE, DELETE | `int` (filas afectadas) |

Regla mnemotécnica: si esperas **datos de vuelta** (filas con columnas), `executeQuery()`. Si solo quieres saber **cuántas filas se han modificado**, `executeUpdate()`. Mezclarlos da `SQLException`: es como meter el tenedor en el microondas, no hay vuelta atrás.

---

## 🧼 El programa completo

Todo junto, con `try-with-resources` para que no se escape ningún recurso:

```java
String url = "jdbc:sqlite:instituto.db";
String sql = "SELECT id, nombre FROM alumnos";

try (Connection con = DriverManager.getConnection(url);
     Statement stmt = con.createStatement();
     ResultSet rs = stmt.executeQuery(sql)) {

    while (rs.next()) {
        System.out.printf("%d: %s%n", rs.getInt("id"), rs.getString("nombre"));
    }

} catch (SQLException e) {
    System.err.println("Error BD: " + e.getMessage());
}
```

Fíjate en el orden de apertura: Connection → Statement → ResultSet. Con `try-with-resources` se cierran en orden inverso y no tienes que preocuparte. Si la consulta es fija y no tiene parámetros variables, un `Statement` sencillo es suficiente. Cuando haya datos del usuario de por medio... eso es cosa del punto 5.

> 💡 **Consejo:** `Statement` sirve para consultas literalmente fijas. Para el 90% de tus consultas reales (con parámetros que cambian) usarás `PreparedStatement`. Lo verás muy pronto, no te enamores del `Statement` todavía.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Dónde empieza el cursor de un `ResultSet` antes de llamar a `next()`?
2. ¿Qué método usarías para un `UPDATE` y qué devuelve?
3. ¿Qué pasa si `executeQuery()` no encuentra ninguna fila?
4. ¿Cómo lees un valor entero de una columna llamada `edad`?

<details>
<summary>🔄 Respuestas</summary>

1. **Antes de la primera fila.** Por eso el bucle es `while (rs.next())`.
2. `executeUpdate()` — devuelve un `int` con las filas afectadas.
3. No es un error: te da un `ResultSet` vacío y `next()` devuelve `false` a la primera.
4. `rs.getInt("edad")`.

</details>

---

## ✅ Resumen en 3 frases

1. `Statement` envía la consulta con `executeQuery()` (SELECT) y devuelve un `ResultSet`, una **tabla virtual** que se recorre con `while (rs.next())`.
2. Cada fila se lee con `rs.getXxx("columna")`, y el cursor empieza **antes** de la primera fila, de ahí el `next()` del bucle.
3. `executeUpdate()` (para INSERT/UPDATE/DELETE) devuelve las **filas afectadas**, y usar `executeQuery()` para esas operaciones lanza `SQLException`.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `Statement` | El mensajero que ejecuta una consulta fija |
> | `ResultSet` | La tabla virtual con las filas devueltas |
> | `next()` | Avanza a la siguiente fila (empieza antes de la primera) |
> | `executeQuery()` | Para SELECT: devuelve `ResultSet` |
> | `executeUpdate()` | Para INSERT/UPDATE/DELETE: devuelve filas afectadas |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/13-conexion-bases-datos) · **Anterior:** [02 · Conexión a SQLite](/ApuntesProgramacion/13-conexion-bases-datos/02-conexion) · **Siguiente:** [04 · CRUD completo](/ApuntesProgramacion/13-conexion-bases-datos/04-crud)