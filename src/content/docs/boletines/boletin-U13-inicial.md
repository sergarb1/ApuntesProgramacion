---
title: "Boletín U13 — Inicial"
description: "Ejercicios básicos de JDBC: conectarse a SQLite, consultar con Statement y ResultSet e insertar con PreparedStatement"
---

# 📝 Boletín U13 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, añade la dependencia de SQLite y haz que tu primer `SELECT` deje de parecer magia. Conectar es el 90% de la batalla; el resto es cuestión de práctica. Empieza suave, que las bases de datos muerden poco a poco.

---

## Ejercicio 1: ¿Qué necesitas para usar JDBC?

Responde brevemente:

1. ¿Qué dependencia Maven (grupo y artefacto) necesitas para conectar Java con SQLite?
2. ¿Qué clase de Java proporciona el método `getConnection()`?
3. ¿Qué interfaz representa la conexión abierta a la base de datos?
4. ¿Qué excepción *checked* tienes que manejar siempre al trabajar con JDBC?

---

## Ejercicio 2: Completa el código — la conexión

Completa los tipos que faltan:

```java
String url = "jdbc:sqlite:instituto.db";

String sql = "SELECT * FROM alumnos";

try (______ con = DriverManager.getConnection(url);
     ______ stmt = con.createStatement();
     ______ rs = stmt.executeQuery(sql)) {

    while (rs.next()) {
        System.out.println(rs.getString("nombre"));
    }

} catch (______ e) {  // ¿qué excepción?
    System.err.println("Error: " + e.getMessage());
}
```

¿Qué tres interfaces van en los huecos? ¿Y la excepción?

---

## Ejercicio 3: ¿Qué imprime? — ResultSet vacío

```java
try (Connection con = DriverManager.getConnection(url);
     Statement stmt = con.createStatement();
     ResultSet rs = stmt.executeQuery("SELECT * FROM alumnos WHERE id = 9999")) {

    if (rs.next()) {
        System.out.println("Encontrado: " + rs.getString("nombre"));
    } else {
        System.out.println("No encontrado");
    }
}
```

Si no hay ningún alumno con `id = 9999`, ¿qué imprime? ¿Qué devuelve `rs.next()` la primera vez que se llama?

---

## Ejercicio 4: Encuentra el error — SQLException sin manejo

```java
public class Test {
    public static void main(String[] args) {
        Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM alumnos");
        while (rs.next()) {
            System.out.println(rs.getString("nombre"));
        }
    }
}
```

Este código **no compila**. ¿Por qué? ¿Qué dos cosas faltan para que funcione?

---

## Ejercicio 5: Escribe este programa — la primera conexión

Crea una clase `TestConexion` que:

1. Se conecte a una base de datos SQLite `test.db`.
2. Cree una tabla `alumnos(id INTEGER PRIMARY KEY, nombre TEXT, nota REAL)`.
3. Inserte 3 alumnos.
4. Muestre «Conexión y tabla creadas» si todo ha ido bien.

Pista: usa `try-with-resources`, un `Statement` para el `CREATE TABLE` y `executeUpdate()` para insertar. SQLite crea el archivo solo.

---

## Ejercicio 6: ¿Qué imprime? — executeQuery en UPDATE

```java
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("UPDATE alumnos SET nota = 10 WHERE id = 1");
```

¿Qué ocurre al ejecutar esta línea? ¿Por qué no debes usar `executeQuery()` para un `UPDATE`?

---

## Ejercicio 7: Completa el código — INSERT con PreparedStatement

Completa los huecos para insertar un alumno de forma segura:

```java
String sql = "INSERT INTO alumnos (nombre, nota) VALUES (?, ?)";

try (Connection con = DriverManager.getConnection(url);
     PreparedStatement pstmt = con.prepareStatement(sql)) {

    pstmt.______(1, "Ana");
    pstmt.______(2, 8.5);

    int filas = pstmt.______();
    System.out.println("Insertadas " + filas + " fila(s)");
}
```

¿Qué métodos van en los huecos? ¿En qué número empiezan los índices de los `?`?

---

## Ejercicio 8: Escribe este programa — listar con try-with-resources

Escribe un método `listarAlumnos()` que:

1. Se conecte a la base de datos con `try-with-resources`.
2. Ejecute `SELECT * FROM alumnos`.
3. Muestre cada alumno con `printf("%d - %s (%.2f)", id, nombre, nota)`.
4. Maneje `SQLException` mostrando `e.getMessage()`.

Pista: `Connection`, `Statement` y `ResultSet` se cierran solos dentro del `try`. Recorre con `while (rs.next())`.

---

## Ejercicio 9: Encuentra el error — índices del PreparedStatement

```java
String sql = "INSERT INTO alumnos (nombre, nota, curso) VALUES (?, ?, ?)";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(0, "Ana");    // ¿índice correcto?
pstmt.setDouble(1, 8.5);      // ¿índice correcto?
pstmt.setString(2, "DAM");    // ¿índice correcto?
pstmt.executeUpdate();
```

¿Qué índices son correctos para los `?` de un `PreparedStatement`? ¿En qué número empiezan y qué pasa si usas `0`?