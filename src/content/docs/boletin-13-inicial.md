---
title: "Boletín 13 - Inicial: Conexión a BD con JDBC"
nav_order: 13
---
*Sin soluciones. 7 pasos para no perder la conexión.*

---

## Ejercicio 1: ¿Qué necesitas para usar JDBC?

Responde brevemente:

1. ¿Qué archivo `.jar` necesitas incluir en tu proyecto para conectar con MySQL?
2. ¿Qué clase de Java proporciona el método `getConnection()`?
3. ¿Qué interfaz representa una conexión a la base de datos?
4. ¿Qué excepción checked tienes que manejar siempre al trabajar con JDBC?

---

## Ejercicio 2: Completa el código — try-with-resources

Completa los tipos que faltan:

```java
String url = "jdbc:mysql://localhost:3306/instituto";
String user = "root";
String pass = "admin123";

String sql = "SELECT * FROM alumnos";

try (______ con = DriverManager.getConnection(url, user, pass);
     ______ stmt = con.createStatement();
     ______ rs = stmt.executeQuery(sql)) {

    while (rs.next()) {
        System.out.println(rs.getString("nombre"));
    }

} catch (______ e) {  // ¿qué excepción?
    System.err.println("Error: " + e.getMessage());
}
```

---

## Ejercicio 3: ¿Qué imprime? — ResultSet vacío

```java
try (Connection con = DriverManager.getConnection(url, user, pass);
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
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/instituto", "root", "admin123");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM alumnos");
        while (rs.next()) {
            System.out.println(rs.getString("nombre"));
        }
    }
}
```

Este código no compila. ¿Por qué? ¿Qué dos cosas faltan para que funcione?

---

## Ejercicio 5: Escribe este programa — mostrar nombres de columnas

Escribe un programa que se conecte a la base de datos y, usando `ResultSetMetaData`, muestre:

1. El número de columnas de la tabla `alumnos`.
2. El nombre de cada columna.
3. El tipo de dato de cada columna (usando `getColumnTypeName()`).

Ejemplo de salida:
```
La tabla alumnos tiene 4 columnas:
  id (INT)
  nombre (VARCHAR)
  edad (INT)
  curso (VARCHAR)
```

---

## Ejercicio 6: ¿Qué imprime? — executeQuery en UPDATE

```java
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("UPDATE alumnos SET edad = 25 WHERE id = 1");
```

¿Qué ocurre al ejecutar esta línea? ¿Por qué no debes usar `executeQuery()` para un `UPDATE`?

---

## Ejercicio 7: Encuentra el error — PreparedStatement con índices incorrectos

```java
String sql = "INSERT INTO alumnos (nombre, edad, curso) VALUES (?, ?, ?)";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(0, "Ana");    // ¿índice correcto?
pstmt.setInt(1, 22);          // ¿índice correcto?
pstmt.setString(2, "DAM");    // ¿índice correcto?
pstmt.executeUpdate();
```

¿Qué índices son correctos para los `?` en un `PreparedStatement`? ¿En qué número empiezan?

---

## Ejercicio 8: Completa el código — cerrar recursos

```java
public void listarAlumnos() {
    // Escribe el código para:
    // 1. Conectarte a la BD usando try-with-resources
    // 2. Ejecutar un SELECT * FROM alumnos
    // 3. Mostrar cada alumno con printf("%d - %s (%d)", id, nombre, edad)
    // 4. Manejar SQLException
}
```

Completa el método. Recuerda que `try-with-resources` cierra automáticamente `Connection`, `Statement` y `ResultSet`.

---

## 🔗 Referencias para seguir practicando

- **CodeWars:** [SQL with Street Fighter](https://www.codewars.com/kata/585d8c8c28d62654a800025b) (6 kyu)
- **CodeWars:** [SQL Basics: Simple JOIN](https://www.codewars.com/kata/5802e32dd8c944e562000020) (6 kyu)
- **AceptaElReto.com:** [200 - Aburrimiento en las aulas](https://www.aceptaelreto.com/problem/statement.php?id=200)
