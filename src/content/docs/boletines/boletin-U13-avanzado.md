---
title: "Boletín U13 — Avanzado"
description: "Ejercicios de dificultad progresiva para exprimir el JDBC: PreparedStatement, DAO, transacciones y más"
---

# 📝 Boletín U13 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: Conexión desde archivo de propiedades

Crea un archivo `db.properties` con los datos de conexión:

```properties
url=jdbc:sqlite:instituto.db
```

Escribe un programa que lea este archivo usando la clase `Properties` y establezca la conexión. Si el archivo no existe o falta la propiedad `url`, muestra un mensaje de error claro.

**Pista:** carga el archivo con `props.load(Files.newInputStream(Path.of("db.properties")))` y usa `props.getProperty("url")`. `load` lanza una `IOException` (la viste en la U12 con los ficheros) además de la `SQLException`.

---

## ⭐ Ejercicio 2: INSERT con clave autogenerada

Inserta un nuevo alumno en la tabla `alumnos` y **recupera el ID** que la base de datos le ha asignado automáticamente (es un `AUTOINCREMENT`). Usa `PreparedStatement` con `Statement.RETURN_GENERATED_KEYS` y el método `getGeneratedKeys()`.

**Pista:**

```java
PreparedStatement pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
pstmt.executeUpdate();
ResultSet claves = pstmt.getGeneratedKeys();
if (claves.next()) {
    int id = claves.getInt(1);
}
```

El `getGeneratedKeys()` devuelve un `ResultSet` con la clave que acaba de generar la base de datos. Se lee con `next()` y `getInt(1)`.

---

## ⭐ Ejercicio 3: UPDATE condicional

Actualiza el curso de todos los alumnos que tengan una edad superior a un valor dado. Por ejemplo:

```
¿Edad mínima? 25
¿Nuevo curso? DAM2
```

Todos los alumnos mayores de 25 años pasan al curso «DAM2». Muestra cuántas filas se actualizaron.

**Pista:** `UPDATE alumnos SET curso = ? WHERE edad > ?` con `setInt` y `setString`. `executeUpdate()` te devuelve el número de filas afectadas: es tu mejor amigo para confirmar que algo cambió.

---

## ⭐⭐ Ejercicio 4: INNER JOIN con PreparedStatement

Dada una tabla `matriculas` con `id_alumno`, `asignatura`, `nota`, escribe un programa que reciba un nombre de alumno y muestre todas sus asignaturas y notas. Usa un `INNER JOIN` entre `alumnos` y `matriculas`.

Ejemplo de salida:

```
Alumno: Ana García
  Matemáticas: 8.5
  Programación: 9.0
  Bases de Datos: 7.5
```

**Pista:** el `?` va en la parte del nombre: `SELECT a.nombre, m.asignatura, m.nota FROM alumnos a INNER JOIN matriculas m ON m.id_alumno = a.id WHERE a.nombre = ?`. El `JOIN` relaciona las dos tablas en una sola consulta: ni un bucle, ni consultas dentro de bucles.

---

## ⭐⭐ Ejercicio 5: Búsqueda con LIKE

Implementa una búsqueda de alumnos por nombre usando `LIKE` y `PreparedStatement`. El usuario escribe una parte del nombre y se muestran todos los que coinciden. Si no hay resultados, muestra «Sin resultados».

**Pista:** `SELECT * FROM alumnos WHERE nombre LIKE ?` con `pstmt.setString(1, "%" + texto + "%")`. Los `%` son comodines y van dentro del **valor**, no en el SQL. El `%texto%` busca el texto en cualquier posición.

---

## ⭐⭐ Ejercicio 6: Fechas en JDBC

Añade una columna `fecha_nacimiento DATE` a la tabla `alumnos` (asume que ya existe). Crea un programa que:

1. Pida nombre, edad, curso y fecha de nacimiento (formato `YYYY-MM-DD`).
2. Inserte el alumno usando `PreparedStatement` con `java.sql.Date.valueOf()`.
3. Liste todos los alumnos mostrando también su fecha de nacimiento.

**Pista:** `Date.valueOf("2000-03-15")` convierte el texto en `java.sql.Date` (¡ojo: es `java.sql.Date`, no `java.util.Date`!). Para leerla, `rs.getDate("fecha_nacimiento")`. Recuerda comprobar el valor que devuelve `executeUpdate()`.

---

## ⭐⭐ Ejercicio 7: Batch INSERT — 100 alumnos de prueba

Crea un programa que inserte **100 alumnos de prueba** en la tabla `alumnos` usando lotes (batch). Los nombres pueden ser genéricos: `Alumno1`, `Alumno2`, etc.

Usa `addBatch()` y `executeBatch()` de `PreparedStatement`. Mide el tiempo que tarda con `System.currentTimeMillis()`.

**Pista:** en el bucle, haces `addBatch()` en cada vuelta y una sola `executeBatch()` al final (o cada 50). Para medir: `long inicio = System.currentTimeMillis();` ... `long fin = System.currentTimeMillis();` y restas. Compara mentalmente con 100 `executeUpdate()` sueltos.

---

## ⭐⭐⭐ Ejercicio 8: El patrón DAO

Implementa el patrón **Data Access Object (DAO)** para la tabla `alumnos`. Crea las siguientes clases:

1. `Alumno` — clase modelo con `id`, `nombre`, `edad`, `curso`.
2. `AlumnoDAO` — interfaz con métodos: `listar()`, `buscarPorId(int id)`, `buscarPorNombre(String nombre)`, `insertar(Alumno a)`, `actualizar(Alumno a)`, `eliminar(int id)`.
3. `AlumnoDAOImpl` — implementación concreta con JDBC y SQLite.
4. `Main` — programa con menú que use el DAO.

**Pista:** la URL (`jdbc:sqlite:instituto.db`) es una constante privada de la implementación. Cada método abre su propia conexión con `try-with-resources`. El `Main` solo habla con la interfaz `AlumnoDAO`; el SQL no le importa.

---

## ⭐⭐⭐ Ejercicio 9: Transacción bancaria atómica

Simula una transferencia entre dos cuentas en una tabla `cuentas(id, titular, saldo)`. La transferencia debe ser **atómica**: quita 100 € de una cuenta, ponlos en la otra, y si falla cualquier paso, haz `rollback()` para que no quede el sistema a medias.

Ejemplo de salida:

```
Saldo antes: Ana 500, Luis 300
Transferencia OK
Saldo después: Ana 400, Luis 400
```

**Pista:** `con.setAutoCommit(false)`, después las dos operaciones con `PreparedStatement`, y al final `con.commit()`. El `rollback()` va en el `catch (SQLException e)` interno. Prueba a forzar el fallo (por ejemplo, una cuenta inexistente) y comprueba que el saldo de Ana no cambia.