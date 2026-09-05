---
title: "Boletín 13 - Intermedio: Conexión a BD con JDBC"
nav_order: 13
---
*Ejercicios de dificultad progresiva. De ⭐ a ⭐⭐⭐.*

---

## ⭐ Ejercicio 1: Conexión desde archivo de propiedades

Crea un archivo `db.properties` con los datos de conexión:

```properties
url=jdbc:mysql://localhost:3306/instituto
user=root
password=admin123
```

Escribe un programa que lea este archivo usando `Properties` y establezca la conexión. Si el archivo no existe o falta alguna propiedad, muestra un mensaje de error claro.

---

## ⭐ Ejercicio 2: INSERT con clave autogenerada

Inserta un nuevo alumno en la tabla `alumnos` y **recupera el ID** que la base de datos le ha asignado automáticamente. Usa `PreparedStatement` con la opción `Statement.RETURN_GENERATED_KEYS` y el método `getGeneratedKeys()`.

Pista:

```java
PreparedStatement pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
```

---

## ⭐ Ejercicio 3: UPDATE condicional

Actualiza el curso de todos los alumnos que tengan una edad superior a un valor dado. Por ejemplo:

```
¿Edad mínima? 25
¿Nuevo curso? DAM2
```

Todos los alumnos mayores de 25 años pasan al curso «DAM2». Muestra cuántas filas se actualizaron.

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

---

## ⭐⭐ Ejercicio 5: Fechas en JDBC

Añade una columna `fecha_nacimiento DATE` a la tabla `alumnos` (asume que ya existe). Crea un programa que:

1. Pida nombre, edad, curso y fecha de nacimiento (formato `YYYY-MM-DD`).
2. Inserte el alumno usando `PreparedStatement` con `java.sql.Date.valueOf()`.
3. Liste todos los alumnos mostrando también su fecha de nacimiento formateada con `DateTimeFormatter`.

---

## ⭐⭐ Ejercicio 6: Batch INSERT — 100 alumnos de prueba

Crea un programa que inserte **100 alumnos de prueba** en la tabla `alumnos` usando lotes (batch). Los nombres pueden ser genéricos: `Alumno1`, `Alumno2`, etc.

Usa `addBatch()` y `executeBatch()` de `PreparedStatement`. Mide el tiempo que tarda con `System.currentTimeMillis()`.

Compara: ¿cuánto tardaría si hicieras 100 `executeUpdate()` individuales?

---

## ⭐⭐⭐ Ejercicio 7 (ProgramaMe): Patrón DAO

Implementa el patrón **Data Access Object (DAO)** para la tabla `alumnos`. Crea las siguientes clases:

1. `Alumno` — clase modelo con `id`, `nombre`, `edad`, `curso`.
2. `AlumnoDAO` — interfaz con métodos:
   - `List<Alumno> listar()`
   - `Alumno buscarPorId(int id)`
   - `List<Alumno> buscarPorNombre(String nombre)`
   - `boolean insertar(Alumno a)`
   - `boolean actualizar(Alumno a)`
   - `boolean eliminar(int id)`
3. `AlumnoDAOImpl` — implementación concreta con JDBC.
4. `Main` — programa con menú que use el DAO.

---

## ⭐⭐⭐ Ejercicio 8 (CodeWars + AceptaElReto)

Resuelve estos problemas que refuerzan conceptos de Bases de Datos y SQL:

**CodeWars:** [SQL Basics: Simple JOIN](https://www.codewars.com/kata/5802e32dd8c944e562000020) (6 kyu) — Practica JOINs en SQL.

**CodeWars:** [SQL with Street Fighter](https://www.codewars.com/kata/585d8c8c28d62654a800025b) (6 kyu) — Consultas con LIKE y ordenación.

**AceptaElReto:** [200 - Aburrimiento en las aulas](https://www.aceptaelreto.com/problem/statement.php?id=200) — Problema de estructura de datos que puedes resolver con JDBC.

---

## 📚 Referencias

- **CodeWars:** [SQL Basics: Simple JOIN](https://www.codewars.com/kata/5802e32dd8c944e562000020) (6 kyu)
- **CodeWars:** [SQL with Street Fighter](https://www.codewars.com/kata/585d8c8c28d62654a800025b) (6 kyu)
- **CodeWars:** [SQL Basics: Simple HAVING](https://www.codewars.com/kata/58167e8fcbd14c0d7d0000f8) (6 kyu)
- **AceptaElReto.com:** [200 - Aburrimiento en las aulas](https://www.aceptaelreto.com/problem/statement.php?id=200)
- **AceptaElReto.com:** [340 - Juegos de naipes](https://www.aceptaelreto.com/problem/statement.php?id=340)
- **AceptaElReto.com:** [100 - Kaprekar](https://www.aceptaelreto.com/problem/statement.php?id=100)
