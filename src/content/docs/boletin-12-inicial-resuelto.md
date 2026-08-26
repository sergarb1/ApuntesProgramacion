---
title: "Boletín 14 - Inicial Resuelto: JDBC - Conexión y Consultas"
nav_order: 14
---
> 💡 Los 5 pasos, bien explicados y con humor.

---

## Ejercicio 1: Los 5 pasos

1. **Cargar el controlador** → `Class.forName("com.mysql.cj.jdbc.Driver")` (opcional desde Java 6)
2. **Establecer conexión** → `DriverManager.getConnection(url, user, pass)` devuelve `Connection`
3. **Crear Statement** → `con.createStatement()` devuelve `Statement` o `con.prepareStatement(sql)` devuelve `PreparedStatement`
4. **Ejecutar consulta** → `stmt.executeQuery(sql)` para SELECT o `stmt.executeUpdate(sql)` para INSERT/UPDATE/DELETE
5. **Procesar resultados** → `rs.next()` + `rs.getXxx("columna")`
6. **(Bonus) Cerrar todo** → `con.close()`, `stmt.close()`, `rs.close()` (o `try-with-resources`)

> **💡 Explicación:**
> El paso 1 es opcional desde Java 6 (los controladores JDBC 4.0 se cargan automáticamente si están en el classpath). Pero verás `Class.forName()` en mucho código legacy. No pasa nada si lo pones. El paso 6 es obligatorio: conexiones abiertas = servidor saturado.

---

## Ejercicio 2: Completa la conexión

```java
String url = "jdbc:mysql://localhost:3306/instituto";
String user = "root";
String pass = "admin123";

Connection con = DriverManager.getConnection(url, user, pass);
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM alumnos");

while (rs.next()) {
    System.out.println(rs.getString("nombre"));
}

// ¡Falta cerrar!
con.close();
stmt.close();
rs.close();
```

> **💡 Explicación:**
> `Connection`, `Statement`, `ResultSet`. Al final hay que cerrar todo. Mejor con `try-with-resources` para que se cierre automáticamente. Si se te olvida cerrar, la conexión queda abierta hasta que el garbage collector decida visitarte (y no sabe cuándo venir).

---

## Ejercicio 3: ¿Qué imprime?

```java
try (Connection con = DriverManager.getConnection(url, user, pass);
     Statement stmt = con.createStatement();
     ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM alumnos")) {

    if (rs.next()) {
        System.out.println(rs.getInt(1));  // número total de alumnos
    }
}
```

> **💡 Explicación:**
> Imprime el número total de filas en la tabla `alumnos`. `COUNT(*)` devuelve una sola fila con una columna. Como no tiene nombre (o el nombre depende de la BD), accedemos por índice `1` (la primera columna). También funciona `rs.getInt("COUNT(*)")` pero es más feo. `rs.getInt(1)` es la forma estándar cuando hay una columna sin alias.

---

## Ejercicio 4: Encuentra el error

```java
public void buscarAlumno(String nombre) {
    String sql = "SELECT * FROM alumnos WHERE nombre = '" + nombre + "'";
    // ¡SQL INJECTION!
    try (Statement stmt = con.createStatement();
         ResultSet rs = stmt.executeQuery(sql)) { ... }
}
```

> **💡 Explicación:**
> ¡SQL Injection! Si `nombre` vale `Luis'; DROP TABLE alumnos; --`, la consulta se convierte en:
> ```sql
> SELECT * FROM alumnos WHERE nombre = 'Luis'; DROP TABLE alumnos; --'
> ```
> Adiós, tabla alumnos. Solución: usar `PreparedStatement`:

```java
String sql = "SELECT * FROM alumnos WHERE nombre = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, nombre);
ResultSet rs = pstmt.executeQuery();
```

> Nunca, jamás, concatenes SQL con datos de usuario. Es la regla de oro número 1 de JDBC.

---

## Ejercicio 5: INSERT con PreparedStatement

```java
String sql = "INSERT INTO alumnos (nombre, edad, curso) VALUES (?, ?, ?)";

try (PreparedStatement pstmt = con.prepareStatement(sql)) {
    pstmt.setString(1, "María");
    pstmt.setInt(2, 22);
    pstmt.setString(3, "DAM");
    int filas = pstmt.executeUpdate();
    System.out.println("Insertadas " + filas + " filas");
}
```

> **💡 Explicación:**
> `setString`, `setInt`, etc. reemplazan los `?` en orden (empezando en 1). `executeUpdate()` devuelve el número de filas afectadas. Si es 1, todo bien. Si es 0, algo falló (o el INSERT tenía una condición WHERE que no coincidió — cosa rara en INSERT).

---

## Ejercicio 6: ¿Qué hace `executeUpdate()`?

```java
int filas = stmt.executeUpdate("DELETE FROM alumnos WHERE id = 10");
System.out.println(filas);
```

> **💡 Explicación:**
> `executeUpdate()` devuelve el **número de filas afectadas**. Si el alumno con id=10 existe y se borra, imprime `1`. Si no existe, imprime `0`. No lanza excepción por no encontrar filas — solo devuelve 0. Siempre comprueba el valor devuelto para saber si la operación tuvo efecto.

---

## Ejercicio 7: Diferencia entre executeQuery y executeUpdate

1. Mostrar todos los productos → `executeQuery()` (SELECT)
2. Borrar un cliente por ID → `executeUpdate()` (DELETE)
3. Actualizar el precio de un producto → `executeUpdate()` (UPDATE)
4. Contar cuántos usuarios hay → `executeQuery()` (SELECT COUNT)
5. Insertar un nuevo pedido → `executeUpdate()` (INSERT)

> **💡 Explicación:**
> Regla mnemotécnica: si esperas datos de vuelta (filas con columnas), usa `executeQuery()`. Si solo quieres saber cuántas filas se modificaron, usa `executeUpdate()`. Mezclarlos da `SQLException`. Como meter un tenedor en el microondas.

---

> **🔗 CodeWars:** [SQL with Street Fighter](https://www.codewars.com/kata/585d8c8c28d62654a800025b) (6kyu)  
> **🔗 AceptaElReto.com:** [200 - Aburrimiento en las aulas](https://www.aceptaelreto.com/problem/statement.php?id=200)
