---
title: "Boletín U13 — Avanzado Resuelto"
description: "Los mismos ejercicios que el boletín avanzado, con soluciones completas"
---

# 📝 Boletín U13 — Avanzado (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## ⭐ Ejercicio 1: Conexión desde archivo de propiedades

<details>
<summary>🔄 Solución</summary>

`db.properties`:

```properties
url=jdbc:sqlite:instituto.db
```

```java
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConexionProperties {
    public static void main(String[] args) {
        Properties props = new Properties();
        try (InputStream in = Files.newInputStream(Path.of("db.properties"))) {
            props.load(in);
        } catch (IOException e) {
            System.err.println("No se pudo leer db.properties: " + e.getMessage());
            return;
        }

        String url = props.getProperty("url");
        if (url == null) {
            System.err.println("Falta la propiedad 'url' en db.properties");
            return;
        }

        try (Connection con = DriverManager.getConnection(url)) {
            System.out.println("Conectado a: " + url);
        } catch (SQLException e) {
            System.err.println("Error BD: " + e.getMessage());
        }
    }
}
```

`Properties` carga el par clave-valor y `getProperty("url")` lo recupera. Dos excepciones conviven aquí: la `IOException` de leer el fichero (U12) y la `SQLException` de conectar. Y las credenciales no viajan en el código: es el mandamiento 6 del decálogo.

</details>

---

## ⭐ Ejercicio 2: INSERT con clave autogenerada

<details>
<summary>🔄 Solución</summary>

```java
import java.sql.*;

public class InsertarConId {
    public static void main(String[] args) {
        String sql = "INSERT INTO alumnos (nombre, edad, curso) VALUES (?, ?, ?)";

        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             PreparedStatement pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, "María");
            pstmt.setInt(2, 22);
            pstmt.setString(3, "DAM");
            pstmt.executeUpdate();

            try (ResultSet claves = pstmt.getGeneratedKeys()) {
                if (claves.next()) {
                    System.out.println("Nuevo id: " + claves.getInt(1));
                }
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

La clave está en `Statement.RETURN_GENERATED_KEYS`: le dices a la base de datos que quieres saber el id que acaba de generar. Después, `getGeneratedKeys()` devuelve un `ResultSet` con esa clave y se lee con `next()` + `getInt(1)`. Sin esa opción, tendrías que hacer una consulta extra o adivinar.

</details>

---

## ⭐ Ejercicio 3: UPDATE condicional

<details>
<summary>🔄 Solución</summary>

```java
import java.sql.*;
import java.util.Scanner;

public class ActualizarCurso {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("¿Edad mínima? ");
        int edad = sc.nextInt();
        sc.nextLine();
        System.out.print("¿Nuevo curso? ");
        String curso = sc.nextLine();

        String sql = "UPDATE alumnos SET curso = ? WHERE edad > ?";

        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, curso);
            pstmt.setInt(2, edad);

            int filas = pstmt.executeUpdate();
            System.out.println("Actualizados " + filas + " alumno(s)");

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

El `WHERE edad > ?` limita la actualización a los alumnos mayores de esa edad. `executeUpdate()` devuelve el número de filas afectadas: si imprime `0`, es que no había nadie mayor de 25 (o todos ya estaban en ese curso). Sin el `WHERE`, habrías actualizado a toda la tabla. Siempre comprueba las filas.

</details>

---

## ⭐⭐ Ejercicio 4: INNER JOIN con PreparedStatement

<details>
<summary>🔄 Solución</summary>

```java
import java.sql.*;
import java.util.Scanner;

public class JoinAlumno {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Nombre del alumno: ");
        String nombre = sc.nextLine();

        String sql = "SELECT a.nombre, m.asignatura, m.nota " +
                     "FROM alumnos a " +
                     "INNER JOIN matriculas m ON m.id_alumno = a.id " +
                     "WHERE a.nombre = ?";

        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, nombre);

            try (ResultSet rs = pstmt.executeQuery()) {
                System.out.println("Alumno: " + nombre);
                boolean encontrado = false;
                while (rs.next()) {
                    System.out.printf("  %s: %.1f%n",
                        rs.getString("asignatura"),
                        rs.getDouble("nota"));
                    encontrado = true;
                }
                if (!encontrado) System.out.println("  Sin matrículas");
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

El `INNER JOIN` relaciona `alumnos` y `matriculas` por la clave foránea `id_alumno`, y el `WHERE` filtra por el nombre. Una sola consulta, un solo viaje a la base de datos: es el antídoto del patrón N+1 (mandamiento 8). Los alias `a` y `m` hacen el SQL más corto.

</details>

---

## ⭐⭐ Ejercicio 5: Búsqueda con LIKE

<details>
<summary>🔄 Solución</summary>

```java
import java.sql.*;
import java.util.Scanner;

public class BuscarAlumnos {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Parte del nombre: ");
        String texto = sc.nextLine();

        String sql = "SELECT * FROM alumnos WHERE nombre LIKE ?";

        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, "%" + texto + "%");

            try (ResultSet rs = pstmt.executeQuery()) {
                boolean encontrado = false;
                while (rs.next()) {
                    System.out.printf("%d - %s (%d)%n",
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getInt("edad"));
                    encontrado = true;
                }
                if (!encontrado) System.out.println("Sin resultados");
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

`LIKE ?` con `setString(1, "%" + texto + "%")`: los `%` son comodines que permiten coincidencia en cualquier posición. La concatenación aquí es segura porque los `%` forman parte del **valor**, no del SQL. El `ResultSet` anidado en su propio `try-with-resources` se cierra solo.

</details>

---

## ⭐⭐ Ejercicio 6: Fechas en JDBC

<details>
<summary>🔄 Solución</summary>

```java
import java.sql.*;
import java.util.Scanner;

public class FechasJDBC {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Nombre: ");
        String nombre = sc.nextLine();
        System.out.print("Edad: ");
        int edad = sc.nextInt();
        sc.nextLine();
        System.out.print("Curso: ");
        String curso = sc.nextLine();
        System.out.print("Fecha de nacimiento (YYYY-MM-DD): ");
        String fechaTexto = sc.nextLine();

        String insertar = "INSERT INTO alumnos (nombre, edad, curso, fecha_nacimiento) VALUES (?, ?, ?, ?)";

        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             PreparedStatement pstmt = con.prepareStatement(insertar)) {

            pstmt.setString(1, nombre);
            pstmt.setInt(2, edad);
            pstmt.setString(3, curso);
            pstmt.setDate(4, Date.valueOf(fechaTexto));

            int filas = pstmt.executeUpdate();
            System.out.println("Insertados " + filas + " alumno(s)");

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }

        String listar = "SELECT nombre, fecha_nacimiento FROM alumnos";
        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(listar)) {
            while (rs.next()) {
                System.out.printf("%s - %s%n",
                    rs.getString("nombre"),
                    rs.getDate("fecha_nacimiento"));
            }
        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

`java.sql.Date.valueOf("2000-03-15")` convierte el texto en una fecha que JDBC entiende, y `setDate(4, ...)` la inserta. Para leerla, `rs.getDate(...)`. Cuidado con el tipo: es `java.sql.Date`, no `java.util.Date` (son distintas). El `String` de fecha debe ir en el formato exacto `YYYY-MM-DD`.

</details>

---

## ⭐⭐ Ejercicio 7: Batch INSERT — 100 alumnos de prueba

<details>
<summary>🔄 Solución</summary>

```java
import java.sql.*;

public class BatchAlumnos {
    public static void main(String[] args) {
        String sql = "INSERT INTO alumnos (nombre, edad, curso) VALUES (?, ?, ?)";

        long inicio = System.currentTimeMillis();

        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            for (int i = 1; i <= 100; i++) {
                pstmt.setString(1, "Alumno" + i);
                pstmt.setInt(2, 18 + (i % 10));
                pstmt.setString(3, "DAM");
                pstmt.addBatch();
            }

            int[] resultados = pstmt.executeBatch();

            long fin = System.currentTimeMillis();
            System.out.println("Insertados " + resultados.length + " alumnos en " + (fin - inicio) + " ms");

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

`addBatch()` acumula las sentencias sin enviarlas, y `executeBatch()` las manda **todas de golpe** en un solo viaje a la base de datos. `resultados` contiene las filas afectadas por cada lote. Comparado con 100 `executeUpdate()` sueltos (100 viajes), el batch es muchísimo más rápido: una sola operación de red en vez de cien.

</details>

---

## ⭐⭐⭐ Ejercicio 8: El patrón DAO

<details>
<summary>🔄 Solución</summary>

**1. El modelo:**

```java
public class Alumno {
    private int id;
    private String nombre;
    private int edad;
    private String curso;

    public Alumno() {}
    public Alumno(String nombre, int edad, String curso) {
        this.nombre = nombre;
        this.edad = edad;
        this.curso = curso;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public int getEdad() { return edad; }
    public void setEdad(int edad) { this.edad = edad; }
    public String getCurso() { return curso; }
    public void setCurso(String curso) { this.curso = curso; }

    @Override
    public String toString() {
        return id + " - " + nombre + " (" + edad + ") " + curso;
    }
}
```

**2. La interfaz (el contrato):**

```java
import java.util.List;

public interface AlumnoDAO {
    List<Alumno> listar();
    Alumno buscarPorId(int id);
    List<Alumno> buscarPorNombre(String nombre);
    boolean insertar(Alumno a);
    boolean actualizar(Alumno a);
    boolean eliminar(int id);
}
```

**3. La implementación (el SQL):**

```java
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlumnoDAOImpl implements AlumnoDAO {
    private static final String URL = "jdbc:sqlite:instituto.db";

    @Override
    public List<Alumno> listar() {
        List<Alumno> alumnos = new ArrayList<>();
        String sql = "SELECT * FROM alumnos ORDER BY nombre";
        try (Connection con = DriverManager.getConnection(URL);
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Alumno a = new Alumno(
                    rs.getString("nombre"),
                    rs.getInt("edad"),
                    rs.getString("curso"));
                a.setId(rs.getInt("id"));
                alumnos.add(a);
            }
        } catch (SQLException e) {
            System.err.println("Error al listar: " + e.getMessage());
        }
        return alumnos;
    }

    @Override
    public Alumno buscarPorId(int id) {
        String sql = "SELECT * FROM alumnos WHERE id = ?";
        try (Connection con = DriverManager.getConnection(URL);
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Alumno a = new Alumno(
                        rs.getString("nombre"),
                        rs.getInt("edad"),
                        rs.getString("curso"));
                    a.setId(rs.getInt("id"));
                    return a;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al buscar: " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<Alumno> buscarPorNombre(String nombre) {
        List<Alumno> alumnos = new ArrayList<>();
        String sql = "SELECT * FROM alumnos WHERE nombre LIKE ?";
        try (Connection con = DriverManager.getConnection(URL);
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, "%" + nombre + "%");
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Alumno a = new Alumno(
                        rs.getString("nombre"),
                        rs.getInt("edad"),
                        rs.getString("curso"));
                    a.setId(rs.getInt("id"));
                    alumnos.add(a);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al buscar: " + e.getMessage());
        }
        return alumnos;
    }

    @Override
    public boolean insertar(Alumno a) {
        String sql = "INSERT INTO alumnos (nombre, edad, curso) VALUES (?, ?, ?)";
        try (Connection con = DriverManager.getConnection(URL);
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, a.getNombre());
            pstmt.setInt(2, a.getEdad());
            pstmt.setString(3, a.getCurso());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error al insertar: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean actualizar(Alumno a) {
        String sql = "UPDATE alumnos SET nombre = ?, edad = ?, curso = ? WHERE id = ?";
        try (Connection con = DriverManager.getConnection(URL);
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, a.getNombre());
            pstmt.setInt(2, a.getEdad());
            pstmt.setString(3, a.getCurso());
            pstmt.setInt(4, a.getId());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error al actualizar: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM alumnos WHERE id = ?";
        try (Connection con = DriverManager.getConnection(URL);
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error al eliminar: " + e.getMessage());
            return false;
        }
    }
}
```

**4. El Main (programa contra la interfaz):**

```java
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        AlumnoDAO dao = new AlumnoDAOImpl();
        Scanner sc = new Scanner(System.in);

        dao.insertar(new Alumno("Nueva Alumna", 21, "DAM"));
        System.out.println("--- Alumnos ---");
        for (Alumno a : dao.listar()) {
            System.out.println(a);
        }

        System.out.println("--- Buscar por nombre ('María') ---");
        for (Alumno a : dao.buscarPorNombre("María")) {
            System.out.println(a);
        }
    }
}
```

El `Main` solo conoce la interfaz `AlumnoDAO`: si mañana cambias SQLite por MySQL, solo cambia `AlumnoDAOImpl`, y el `Main` no se entera. Esa es la magia del DAO.

</details>

---

## ⭐⭐⭐ Ejercicio 9: Transacción bancaria atómica

<details>
<summary>🔄 Solución</summary>

```java
import java.sql.*;

public class Transferencia {
    private static final String URL = "jdbc:sqlite:instituto.db";

    public static void transferir(int idOrigen, int idDestino, double cantidad) {
        String quitar = "UPDATE cuentas SET saldo = saldo - ? WHERE id = ?";
        String poner  = "UPDATE cuentas SET saldo = saldo + ? WHERE id = ?";

        try (Connection con = DriverManager.getConnection(URL)) {
            con.setAutoCommit(false);  // abrimos la transacción

            try (PreparedStatement q = con.prepareStatement(quitar);
                 PreparedStatement p = con.prepareStatement(poner)) {

                q.setDouble(1, cantidad);
                q.setInt(2, idOrigen);
                q.executeUpdate();

                if (idOrigen == idDestino) {
                    throw new SQLException("Destino inválido: misma cuenta");
                }

                p.setDouble(1, cantidad);
                p.setInt(2, idDestino);
                p.executeUpdate();

                con.commit();
                System.out.println("Transferencia OK");
            } catch (SQLException e) {
                con.rollback();
                System.err.println("Falló, todo deshecho: " + e.getMessage());
            }
        } catch (SQLException e) {
            System.err.println("Error de conexión: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        transferir(1, 2, 100);
        // Para probar el rollback, llama a transferir(1, 1, 100): misma cuenta
    }
}
```

`setAutoCommit(false)` abre la transacción: las dos operaciones se ejecutan sin confirmarse. Si todo va bien, `commit()` las guarda juntas. Si algo falla (aquí, forzado con `throw new SQLException`), `rollback()` deshace la primera operación para que el sistema no quede a medias. Es la definición de atómico: todo o nada. Sin esto, una transferencia a medias dejaría dinero flotando en el limbo.

</details>