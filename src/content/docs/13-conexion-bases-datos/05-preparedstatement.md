---
title: "05 · PreparedStatement y SQL injection"
description: "Concatena strings en SQL y Bobby Tables borrará tu tabla de alumnos. La vacuna se llama PreparedStatement y sus placeholders ? 🗄️💉"
---

<p><small>Concatena strings en SQL y Bobby Tables borrará tu tabla de alumnos. La vacuna se llama PreparedStatement y sus placeholders ? 🗄️💉</small></p>

> 🗺️ **Estás en:** 🗄️ **U13 · Conexión a BD con JDBC** → 05 · PreparedStatement y SQL injection

---

## 📬 La idea en una frase

> **Nunca construyas SQL concatenando strings con datos del usuario: es SQL injection. La vacuna es `PreparedStatement`, que separa el SQL de los datos con placeholders `?` y lo rellena de forma segura.**

En el punto 3 viste `Statement` y quedó claro que sirve para consultas fijas. Aquí llega el momento en el que te digo por qué, en cuanto hay **datos del usuario** de por medio, el `Statement` se convierte en una bomba de relojería. Y de paso conocerás a Bobby Tables, el niño más famoso de la historia de las bases de datos.

---

## 💣 Concatenar SQL: la bomba

Imagina una búsqueda de alumnos por nombre. La forma inocente (y fatal) de montarla:

```java
// PELIGRO: esto es una bomba
String sql = "SELECT * FROM alumnos WHERE nombre = '" + inputUsuario + "'";
```

Ahora, un "usuario" escribe esto en el campo de búsqueda:

```
Luis'; DROP TABLE alumnos; --
```

La consulta que se ejecuta acaba siendo:

```sql
SELECT * FROM alumnos WHERE nombre = 'Luis'; DROP TABLE alumnos; --'
```

Fíjate: cierra la comilla con `'`, termina la consulta con `;`, **borra la tabla** con `DROP TABLE alumnos`, y comenta el resto con `--`. Adiós, tabla de alumnos. Esto es **SQL Injection** y ocurre de verdad, en aplicaciones reales, cada día.

> ⚠️ **Advertencia:** NUNCA construyas SQL concatenando strings con datos del usuario. Es como dejar las llaves puestas en el coche con un cartel en la puerta que pone "PASE USTED".

### La historia de Bobby Tables

```
Madre: "He criado a mi hijo para que sea un programador cuidadoso,
        no un hacker que robe datos."
Hijo:  "Hola, me llamo Robert'); DROP TABLE Students; --"
```

No seas Bobby Tables. Usa PreparedStatement.

---

## 💉 PreparedStatement al rescate

La solución es separar el **código SQL** de los **datos**. El SQL se prepara con placeholders `?` y los valores se pasan después, por separado:

```java
String sql = "SELECT * FROM alumnos WHERE nombre = ?";
PreparedStatement pstmt = conexion.prepareStatement(sql);
pstmt.setString(1, nombre);
ResultSet rs = pstmt.executeQuery();
```

El controlador escapa los datos automáticamente: si el usuario escribe `Robert'); DROP TABLE Students; --`, se trata como un **valor**, no como código. La tabla se queda donde está.

Los `?` son **placeholders posicionales** y empiezan en **1** (no en 0, como los arrays... trampa clásica de examen):

| Tipo | Método |
|---|---|
| String | `setString(i, valor)` |
| int | `setInt(i, valor)` |
| double | `setDouble(i, valor)` |
| boolean | `setBoolean(i, valor)` |
| Date | `setDate(i, valor)` (usa `java.sql.Date`) |
| null | `setNull(i, Types.TIPO)` |

> 💡 **Consejo:** para muchas consultas iguales, `PreparedStatement` puede ser **más rápido** que `Statement`, porque la base de datos compila la consulta una sola vez y reutiliza el plan. La seguridad te la da gratis, y de regalo viene la velocidad.

---

## 🧪 Guía de placeholders

Varios `?`, en orden. El primero es el `1`, el segundo el `2`, y así sucesivamente:

```java
String sql = "SELECT * FROM alumnos WHERE curso = ? AND edad > ? ORDER BY nombre";
try (PreparedStatement pstmt = conexion.prepareStatement(sql)) {
    pstmt.setString(1, "DAM");
    pstmt.setInt(2, 18);
    try (ResultSet rs = pstmt.executeQuery()) {
        while (rs.next()) {
            System.out.println(rs.getString("nombre"));
        }
    }
}
```

¿Ves qué limpio? No hay concatenación, no hay comillas escapadas, no hay riesgo de inyección. Solo `?` limpios y ordenados. Los placeholders solo valen para **valores**, nunca para nombres de tabla o columna: `SELECT * FROM ?` no funciona, y no debería funcionar: un identificador no se escapa, se elige en el código.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** PreparedStatement previene la inyección SQL porque separa el código SQL de los datos. Nunca concatenes strings en SQL, ni en broma.

**Ejercicio: detecta el intento de ataque**

Un alumno te enseña este código y te pregunta si es seguro:

```java
String nombre = sc.nextLine();
String sql = "SELECT * FROM alumnos WHERE nombre = '" + nombre + "'";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
```

**¿Qué responderías?** ¿Es seguro? ¿Qué pasaría si el usuario escribiera `Ana'; DELETE FROM matriculas; --`? ¿Cómo lo arreglarías?

<details>
<summary>🔄 Solución</summary>

**No es seguro, es SQL injection en estado puro.** Con `Ana'; DELETE FROM matriculas; --`, el SQL se convierte en un `SELECT` que termina antes de tiempo y luego ejecuta `DELETE FROM matriculas` (la instrucción que el `--` comenta solo la parte sobrante). Se borrarían todas las matrículas.

La solución: `PreparedStatement` con placeholder.

```java
String sql = "SELECT * FROM alumnos WHERE nombre = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, nombre);
ResultSet rs = pstmt.executeQuery();
```

Ahora `Ana'; DELETE FROM matriculas; --` es solo un nombre raro que se busca tal cual. La tabla respira tranquila.

</details>

---

## 🥊 El ring: Statement vs PreparedStatement

Dos formas de ejecutar SQL discuten delante de la máquina de café.

**Statement:** — Yo soy el original. Sencillo, directo. `stmt.executeQuery("SELECT * FROM usuarios")`. Para consultas fijas soy perfecto.

**PreparedStatement:** — Sí, pero concatenar strings en SQL es una bomba de relojería. Inyección SQL, errores de sintaxis con comillas... Yo separo el SQL de los datos con `?` y soy seguro.

**Statement:** — Para una consulta fija, una sola vez, ¿para qué voy a preparar nada?

**PreparedStatement:** — Además, yo cacheo el plan de ejecución. Si ejecutas la misma consulta varias veces con distintos parámetros, soy más rápido. Y en Java, casi siempre ejecutas la misma consulta con distintos valores.

**Statement:** — Vale, pero yo valgo para DDL: CREATE TABLE, ALTER...

**PreparedStatement:** — Cierto. Para DDL usa Statement. Para DML (SELECT, INSERT, UPDATE, DELETE) usa PreparedStatement. ¿Trato?

**Statement:** — Trato.

> 🕶️ **Don Tip:** usa siempre `PreparedStatement` para consultas con datos de usuario. No es solo seguridad: es más rápido en consultas repetitivas y más legible.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿En qué número empiezan los índices de los `?` en un `PreparedStatement`?
2. ¿Qué hace la base de datos con `Robert'); DROP TABLE Students; --` si usas PreparedStatement?
3. ¿Puedes usar `?` para el nombre de una tabla?
4. ¿Por qué `PreparedStatement` puede ser más rápido en consultas repetidas?

<details>
<summary>🔄 Respuestas</summary>

1. En **1**. El primer `?` es el `setXxx(1, ...)`. No hay `?` en la posición 0.
2. Lo trata como un **valor** de texto, escapado. No se ejecuta ninguna instrucción extra.
3. No. Los `?` solo valen para valores, no para identificadores.
4. Porque la base de datos **compila la consulta una sola vez** y reutiliza el plan de ejecución.

</details>

---

## ✅ Resumen en 3 frases

1. Concatenar SQL con datos del usuario es **SQL injection**: una entrada como `'; DROP TABLE alumnos; --` puede borrar tablas enteras.
2. **`PreparedStatement`** separa el SQL de los datos con placeholders `?` y los `setXxx(i, valor)` (índices desde 1), escapando los valores automáticamente.
3. Es la forma **segura**, la más **rápida** para consultas repetidas y la única que no te hará pasar vergüenza en una entrevista de trabajo.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | SQL injection | Inyectar instrucciones SQL a través de datos de usuario |
> | Placeholder | El `?` que reserva el hueco para un valor |
> | `setXxx(i, valor)` | Rellena el placeholder número `i` (desde 1) |
> | Escapar | Neutralizar caracteres peligrosos de un texto |
> | Bobby Tables | El niño que te enseña por qué no concatenar |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/13-conexion-bases-datos) · **Anterior:** [04 · CRUD completo](/ApuntesProgramacion/13-conexion-bases-datos/04-crud) · **Siguiente:** [06 · El patrón DAO](/ApuntesProgramacion/13-conexion-bases-datos/06-pattern-dao)