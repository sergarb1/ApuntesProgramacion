---
title: "Boletín U13 — Inicial Resuelto"
description: "Los mismos ejercicios que el boletín inicial, con soluciones"
---

# 📝 Boletín U13 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: ¿Qué necesitas para usar JDBC?

<details>
<summary>🔄 Solución</summary>

1. La dependencia **`org.xerial:sqlite-jdbc`**. En el `pom.xml`:

   ```xml
   <dependency>
       <groupId>org.xerial</groupId>
       <artifactId>sqlite-jdbc</artifactId>
       <version>3.45.1.0</version>
   </dependency>
   ```

2. **`DriverManager`** — su método estático `getConnection()` establece la conexión.
3. **`Connection`** — la interfaz del paquete `java.sql` que representa la conexión abierta.
4. **`SQLException`** — es *checked*: el compilador te obliga a capturarla o declararla.

</details>

---

## Ejercicio 2: Completa el código — la conexión

<details>
<summary>🔄 Solución</summary>

```java
String url = "jdbc:sqlite:instituto.db";

String sql = "SELECT * FROM alumnos";

try (Connection con = DriverManager.getConnection(url);
     Statement stmt = con.createStatement();
     ResultSet rs = stmt.executeQuery(sql)) {

    while (rs.next()) {
        System.out.println(rs.getString("nombre"));
    }

} catch (SQLException e) {
    System.err.println("Error: " + e.getMessage());
}
```

Los tres tipos son **`Connection`**, **`Statement`** y **`ResultSet`**, todos del paquete `java.sql`. La excepción es **`SQLException`**. Fíjate en el orden de apertura: Connection → Statement → ResultSet; `try-with-resources` los cierra en orden inverso.

</details>

---

## Ejercicio 3: ¿Qué imprime? — ResultSet vacío

<details>
<summary>🔄 Solución</summary>

Imprime **`No encontrado`**.

`rs.next()` devuelve **`false`** la primera vez si no hay filas. El cursor del `ResultSet` empieza *antes* de la primera fila, así que con una consulta sin resultados, el primer `next()` ya se encuentra con el vacío y devuelve `false`, saltando al `else`. No es un error: una consulta sin resultados devuelve un `ResultSet` vacío, no una excepción.

</details>

---

## Ejercicio 4: Encuentra el error — SQLException sin manejo

<details>
<summary>🔄 Solución</summary>

No compila porque **`SQLException` es checked**: `DriverManager.getConnection()`, `con.createStatement()` y `stmt.executeQuery()` la lanzan, y el código no la captura ni la declara.

Faltan dos cosas:

1. Envolver el código en un `try { ... } catch (SQLException e) { ... }`.
2. Cerrar los recursos (mejor, con `try-with-resources`).

```java
public class Test {
    public static void main(String[] args) {
        String sql = "SELECT * FROM alumnos";
        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                System.out.println(rs.getString("nombre"));
            }
        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

</details>

---

## Ejercicio 5: Escribe este programa — la primera conexión

<details>
<summary>🔄 Solución</summary>

```java
import java.sql.*;

public class TestConexion {
    public static void main(String[] args) {
        String url = "jdbc:sqlite:test.db";

        String crearTabla = "CREATE TABLE IF NOT EXISTS alumnos (" +
            "id INTEGER PRIMARY KEY, nombre TEXT, nota REAL)";

        try (Connection con = DriverManager.getConnection(url);
             Statement stmt = con.createStatement()) {

            stmt.executeUpdate(crearTabla);
            stmt.executeUpdate("INSERT INTO alumnos (nombre, nota) VALUES ('Ana', 7.5)");
            stmt.executeUpdate("INSERT INTO alumnos (nombre, nota) VALUES ('Luis', 9.0)");
            stmt.executeUpdate("INSERT INTO alumnos (nombre, nota) VALUES ('Sara', 6.5)");

            System.out.println("Conexión y tabla creadas");

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

`CREATE TABLE` y `INSERT` son operaciones que no devuelven filas, así que se ejecutan con `executeUpdate()`. El `IF NOT EXISTS` evita errores si vuelves a ejecutar el programa. Y sí: `test.db` se crea solo con la primera conexión.

</details>

---

## Ejercicio 6: ¿Qué imprime? — executeQuery en UPDATE

<details>
<summary>🔄 Solución</summary>

Lanza una **`SQLException`**.

`executeQuery()` es solo para consultas que **devuelven filas** (SELECT). Un `UPDATE` no devuelve un `ResultSet`; devuelve el número de filas afectadas, y eso es trabajo de `executeUpdate()`. Mezclarlos da `SQLException` siempre. Es como meter un tenedor en el microondas: no hay vuelta atrás.

Regla mnemotécnica: **¿esperas datos de vuelta? → `executeQuery()`. ¿Solo quieres saber cuántas filas se modificaron? → `executeUpdate()`.**

</details>

---

## Ejercicio 7: Completa el código — INSERT con PreparedStatement

<details>
<summary>🔄 Solución</summary>

```java
String sql = "INSERT INTO alumnos (nombre, nota) VALUES (?, ?)";

try (Connection con = DriverManager.getConnection(url);
     PreparedStatement pstmt = con.prepareStatement(sql)) {

    pstmt.setString(1, "Ana");
    pstmt.setDouble(2, 8.5);

    int filas = pstmt.executeUpdate();
    System.out.println("Insertadas " + filas + " fila(s)");
}
```

Los huecos: **`setString`**, **`setDouble`** y **`executeUpdate`**. Los índices de los `?` empiezan en **1** (no en 0, como los arrays). `setString(1, ...)` rellena el primer `?`, `setDouble(2, ...)` el segundo. `executeUpdate()` devuelve las filas afectadas: si es `1`, todo bien.

</details>

---

## Ejercicio 8: Escribe este programa — listar con try-with-resources

<details>
<summary>🔄 Solución</summary>

```java
import java.sql.*;

public class ListarAlumnos {
    public static void listarAlumnos() {
        String url = "jdbc:sqlite:instituto.db";
        String sql = "SELECT * FROM alumnos";

        try (Connection con = DriverManager.getConnection(url);
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                System.out.printf("%d - %s (%.2f)%n",
                    rs.getInt("id"),
                    rs.getString("nombre"),
                    rs.getDouble("nota"));
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        listarAlumnos();
    }
}
```

`try-with-resources` cierra `Connection`, `Statement` y `ResultSet` automáticamente en orden inverso. El `printf` formatea la salida en columnas, y `getInt`/`getString`/`getDouble` leen cada columna por nombre. La `SQLException` se captura y muestra su mensaje.

</details>

---

## Ejercicio 9: Encuentra el error — índices del PreparedStatement

<details>
<summary>🔄 Solución</summary>

Los índices de los `?` empiezan en **1**:

```java
pstmt.setString(1, "Ana");    // primer ?
pstmt.setDouble(2, 8.5);      // segundo ?
pstmt.setString(3, "DAM");    // tercer ?
```

`setString(0, "Ana")` es **incorrecto**: lanza una `SQLException` porque no existe ningún `?` con índice 0. Los placeholders son posicionales y el primero es el 1. Es la trampa clásica de quien viene de los arrays, donde los índices empiezan en 0.

</details>