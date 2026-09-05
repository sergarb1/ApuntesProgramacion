---
title: "Butlletí 13 - Resolt: JDBC - Connexió i Consultes"
nav_order: 13
---
---

## ⭐ Ejercicio 1: Conexión básica con MySQL

Escribe un programa que se conecte a una BD MySQL (o SQLite) llamada `instituto` y muestre todos los alumnos de la tabla `alumnos`. Usa `try-with-resources`.

```java
import java.sql.*;

public class ListarAlumnos {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/instituto";
        String user = "root";
        String pass = "admin123";

        String sql = "SELECT id, nombre, edad, curso FROM alumnos";

        try (Connection con = DriverManager.getConnection(url, user, pass);
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            System.out.println("=== ALUMNOS ===");
            while (rs.next()) {
                System.out.printf("%d | %s | %d años | %s%n",
                    rs.getInt("id"),
                    rs.getString("nombre"),
                    rs.getInt("edad"),
                    rs.getString("curso"));
            }

        } catch (SQLException e) {
            System.err.println("Error BD: " + e.getMessage());
        }
    }
}
```

> **💡 Explicación:**
> `try-with-resources` cierra `Connection`, `Statement` y `ResultSet` automáticamente en orden inverso. El `printf` con `%d` y `%s` formatea la salida en columnas. `getInt("id")` y `getString("nombre")` leen por nombre de columna. Siempre captura `SQLException` — es checked y no te deja ignorarla.

---

## ⭐ Ejercicio 2: INSERT con PreparedStatement

Crea un método que inserte un nuevo alumno. Los parámetros deben pasarse como argumentos. Usa `PreparedStatement`.

```java
import java.sql.*;

public class InsertarAlumno {
    public static void insertar(String nombre, int edad, String curso) {
        String sql = "INSERT INTO alumnos (nombre, edad, curso) VALUES (?, ?, ?)";

        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/instituto", "root", "admin123");
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, nombre);
            pstmt.setInt(2, edad);
            pstmt.setString(3, curso);

            int filas = pstmt.executeUpdate();
            System.out.println("Insertado: " + filas + " fila(s)");

        } catch (SQLException e) {
            System.err.println("Error al insertar: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        insertar("Luis García", 22, "DAM");
    }
}
```

> **💡 Explicación:**
> Los `?` son placeholders. `setString(1, ...)` asigna al primer `?`. El índice empieza en 1 (no en 0 como los arrays — trampa clásica). `executeUpdate()` devuelve 1 si todo fue bien. Si el nombre tiene una comilla simple como "Luis'O'Connell", `PreparedStatement` la escapa automáticamente. Sin riesgo de SQL Injection.

---

## ⭐ Ejercicio 3: UPDATE con PreparedStatement

Actualiza la edad de un alumno buscándolo por nombre. Muestra cuántas filas se actualizaron.

```java
import java.sql.*;

public class ActualizarAlumno {
    public static void main(String[] args) {
        String sql = "UPDATE alumnos SET edad = ? WHERE nombre = ?";

        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/instituto", "root", "admin123");
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, 23);
            pstmt.setString(2, "Luis García");

            int filas = pstmt.executeUpdate();
            if (filas > 0) {
                System.out.println("Actualizados " + filas + " alumno(s)");
            } else {
                System.out.println("No se encontró al alumno");
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

> **💡 Explicación:**
> `executeUpdate()` devuelve filas afectadas. Si el WHERE no encuentra nada, devuelve 0 — no es error. Siempre comprueba el valor. Si olvidas el `WHERE`, actualizas TODOS los alumnos con la misma edad. No preguntes cómo lo sé.

---

## ⭐ Ejercicio 4: DELETE con PreparedStatement

Borra un alumno por ID. Pide confirmación antes de borrar.

```java
import java.sql.*;
import java.util.Scanner;

public class EliminarAlumno {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("ID del alumno a borrar: ");
        int id = sc.nextInt();
        sc.nextLine();
        System.out.print("¿Seguro? (s/n): ");
        String conf = sc.nextLine();

        if (!conf.equalsIgnoreCase("s")) {
            System.out.println("Cancelado");
            return;
        }

        String sql = "DELETE FROM alumnos WHERE id = ?";

        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/instituto", "root", "admin123");
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            int filas = pstmt.executeUpdate();
            System.out.println(filas > 0 ? "Eliminado" : "No encontrado");

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

> **💡 Explicación:**
> Confirmación antes de borrar: buena práctica. El DELETE sin WHERE es el beso de la muerte para tus datos. `executeUpdate()` devuelve filas afectadas. Si devuelve 0, el ID no existe. Y recuerda: en SQL no hay papelera de reciclaje.

---

## ⭐⭐ Ejercicio 5: Búsqueda por nombre con LIKE

Implementa una búsqueda de alumnos por nombre usando `LIKE` y `PreparedStatement`. El usuario escribe parte del nombre y se muestran todos los que coinciden.

```java
import java.sql.*;

public class BuscarAlumnos {
    public static void buscar(String nombreParcial) {
        String sql = "SELECT * FROM alumnos WHERE nombre LIKE ?";

        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/instituto", "root", "admin123");
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, "%" + nombreParcial + "%");

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

    public static void main(String[] args) {
        buscar("Luis");  // Busca cualquier nombre que contenga "Luis"
    }
}
```

> **💡 Explicación:**
> `LIKE ?` con `setString(1, "%" + nombre + "%")`. Los `%` son comodines SQL: `%Luis%` busca "Luis" en cualquier posición. La concatenación aquí es segura porque los `%` son parte del valor, no de la SQL. El `ResultSet` está anidado en otro `try-with-resources` para que se cierre automáticamente.

---

## ⭐⭐ Ejercicio 6: Contar alumnos por curso

Escribe un programa que muestre cuántos alumnos hay en cada curso usando `GROUP BY`.

```java
import java.sql.*;

public class ContarPorCurso {
    public static void main(String[] args) {
        String sql = "SELECT curso, COUNT(*) AS total FROM alumnos GROUP BY curso ORDER BY total DESC";

        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/instituto", "root", "admin123");
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            System.out.println("Alumnos por curso:");
            while (rs.next()) {
                System.out.printf("  %s: %d alumno(s)%n",
                    rs.getString("curso"),
                    rs.getInt("total"));
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

> **💡 Explicación:**
> `GROUP BY` agrupa por curso. `COUNT(*)` cuenta filas de cada grupo. `AS total` da nombre a la columna calculada. `ORDER BY total DESC` ordena de mayor a menor. Aquí usamos `Statement` porque no hay parámetros variables — la SQL es fija. PreparedStatement también valdría, pero no es necesario.

---

## ⭐⭐ Ejercicio 7: Transacciones básicas

Simula una transferencia de puntos entre dos alumnos. Usa transacciones: si alguna operación falla, todo se deshace.

```java
import java.sql.*;

public class TransferenciaPuntos {
    public static void main(String[] args) {
        String sqlQuitar = "UPDATE alumnos SET puntos = puntos - ? WHERE id = ?";
        String sqlPoner = "UPDATE alumnos SET puntos = puntos + ? WHERE id = ?";

        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/instituto", "root", "admin123")) {

            con.setAutoCommit(false);

            try (PreparedStatement q = con.prepareStatement(sqlQuitar);
                 PreparedStatement p = con.prepareStatement(sqlPoner)) {

                // Quitar 10 puntos al alumno 1
                q.setInt(1, 10);
                q.setInt(2, 1);
                q.executeUpdate();

                // Poner 10 puntos al alumno 2
                p.setInt(1, 10);
                p.setInt(2, 2);
                p.executeUpdate();

                con.commit();
                System.out.println("Transferencia OK ✅");

            } catch (SQLException e) {
                con.rollback();
                System.err.println("Error, todo deshecho: " + e.getMessage());
            }

        } catch (SQLException e) {
            System.err.println("Error de conexión: " + e.getMessage());
        }
    }
}
```

> **💡 Explicación:**
> `setAutoCommit(false)` desactiva el modo "cada sentencia es una transacción". Ahora tú controlas: `commit()` confirma todo, `rollback()` deshace todo. Si falla la segunda sentencia, la primera se deshace con `rollback()`. Las transacciones son para operaciones que deben ser atómicas: "todo o nada".

---

## ⭐⭐⭐ Ejercicio 8: CRUD completo con menú

Crea un programa con menú textual que permita: Listar, Insertar, Actualizar, Eliminar y Buscar alumnos. Cada operación en su propio método. Usa `PreparedStatement` siempre.

```java
import java.sql.*;
import java.util.*;

public class CrudAlumnosCompleto {
    private static final String URL = "jdbc:mysql://localhost:3306/instituto";
    private static final String USER = "root";
    private static final String PASS = "admin123";

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int op;
        do {
            System.out.println("\n=== CRUD ALUMNOS ===");
            System.out.println("1. Listar  2. Buscar  3. Insertar");
            System.out.println("4. Actualizar  5. Eliminar  6. Salir");
            System.out.print("Opción: ");
            op = sc.nextInt(); sc.nextLine();

            switch (op) {
                case 1 -> listar();
                case 2 -> buscar(sc);
                case 3 -> insertar(sc);
                case 4 -> actualizar(sc);
                case 5 -> eliminar(sc);
            }
        } while (op != 6);
    }

    static void listar() {
        try (Connection c = DriverManager.getConnection(URL, USER, PASS);
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM alumnos ORDER BY nombre")) {
            while (rs.next())
                System.out.printf("%d - %s (%d) %s%n",
                    rs.getInt("id"), rs.getString("nombre"),
                    rs.getInt("edad"), rs.getString("curso"));
        } catch (SQLException e) { System.err.println("Error: " + e.getMessage()); }
    }

    static void buscar(Scanner sc) {
        System.out.print("Nombre a buscar: ");
        try (Connection c = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = c.prepareStatement("SELECT * FROM alumnos WHERE nombre LIKE ?")) {
            ps.setString(1, "%" + sc.nextLine() + "%");
            ResultSet rs = ps.executeQuery();
            boolean ok = false;
            while (rs.next()) { ok = true;
                System.out.printf("%d - %s (%d)%n",
                    rs.getInt("id"), rs.getString("nombre"), rs.getInt("edad")); }
            if (!ok) System.out.println("Sin resultados");
            rs.close();
        } catch (SQLException e) { System.err.println("Error: " + e.getMessage()); }
    }

    static void insertar(Scanner sc) {
        System.out.print("Nombre: "); String n = sc.nextLine();
        System.out.print("Edad: "); int e = sc.nextInt(); sc.nextLine();
        System.out.print("Curso: "); String c = sc.nextLine();
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(
                 "INSERT INTO alumnos (nombre, edad, curso) VALUES (?, ?, ?)")) {
            ps.setString(1, n); ps.setInt(2, e); ps.setString(3, c);
            System.out.println(ps.executeUpdate() > 0 ? "OK" : "Error");
        } catch (SQLException ex) { System.err.println("Error: " + ex.getMessage()); }
    }

    static void actualizar(Scanner sc) {
        System.out.print("ID: "); int id = sc.nextInt(); sc.nextLine();
        System.out.print("Nueva edad: "); int edad = sc.nextInt(); sc.nextLine();
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(
                 "UPDATE alumnos SET edad = ? WHERE id = ?")) {
            ps.setInt(1, edad); ps.setInt(2, id);
            System.out.println(ps.executeUpdate() > 0 ? "Actualizado" : "No encontrado");
        } catch (SQLException e) { System.err.println("Error: " + e.getMessage()); }
    }

    static void eliminar(Scanner sc) {
        System.out.print("ID: "); int id = sc.nextInt(); sc.nextLine();
        System.out.print("¿Seguro? (s/n): ");
        if (!sc.nextLine().equalsIgnoreCase("s")) { System.out.println("Cancelado"); return; }
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement("DELETE FROM alumnos WHERE id = ?")) {
            ps.setInt(1, id);
            System.out.println(ps.executeUpdate() > 0 ? "Eliminado" : "No encontrado");
        } catch (SQLException e) { System.err.println("Error: " + e.getMessage()); }
    }
}
```

> **💡 Explicación:**
> CRUD completo en ~130 líneas. Cada operación abre y cierra su propia conexión (no óptimo para producción, pero sí para aprender). `PreparedStatement` en todas las consultas con parámetros. `Statement` solo en listar (consulta fija sin parámetros). Fíjate que `ResultSet` también se cierra automáticamente cuando está dentro de `try-with-resources`.

---

## ⭐⭐⭐ Ejercicio 9: Paginación con LIMIT y OFFSET

Crea un método que muestre alumnos por páginas de 5 en 5. El usuario elige la página.

```java
import java.sql.*;
import java.util.Scanner;

public class PaginacionAlumnos {
    private static final int TAM_PAGINA = 5;

    public static void mostrarPagina(int pagina) {
        String sql = "SELECT * FROM alumnos ORDER BY id LIMIT ? OFFSET ?";

        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/instituto", "root", "admin123");
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            int offset = (pagina - 1) * TAM_PAGINA;
            pstmt.setInt(1, TAM_PAGINA);
            pstmt.setInt(2, offset);

            try (ResultSet rs = pstmt.executeQuery()) {
                System.out.println("--- Página " + pagina + " ---");
                while (rs.next()) {
                    System.out.printf("%d - %s (%d) %s%n",
                        rs.getInt("id"), rs.getString("nombre"),
                        rs.getInt("edad"), rs.getString("curso"));
                }
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int pag = 1;
        while (true) {
            mostrarPagina(pag);
            System.out.print("Siguiente (s) / Anterior (a) / Salir (x): ");
            String cmd = sc.nextLine();
            if (cmd.equals("s")) pag++;
            else if (cmd.equals("a") && pag > 1) pag--;
            else if (cmd.equals("x")) break;
        }
    }
}
```

> **💡 Explicación:**
> `LIMIT ? OFFSET ?`: LIMIT=5 (filas por página), OFFSET=(pag-1)*5 (desplazamiento). `OFFSET` permite navegar por páginas sin cargar todos los datos. Esto es eficiente para tablas grandes: la BD solo devuelve las 5 filas de la página. En PostgreSQL se usa `LIMIT ? OFFSET ?`, en SQL Server `OFFSET ... FETCH NEXT`.

---

## ⭐⭐⭐ Ejercicio 10: Exportar a CSV con metadatos

Exporta todos los alumnos a un archivo CSV. Además de los datos, incluye una fila de metadatos: nombre de las columnas, número de filas exportadas y fecha de exportación.

```java
import java.sql.*;
import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ExportarCSV {
    public static void main(String[] args) {
        String csvFile = "alumnos_export.csv";

        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/instituto", "root", "admin123");
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM alumnos ORDER BY id");
             BufferedWriter writer = new BufferedWriter(new FileWriter(csvFile))) {

            // Metadatos
            writer.write("# Exportación generada el " +
                LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
            writer.newLine();

            // Cabecera desde ResultSetMetaData
            ResultSetMetaData meta = rs.getMetaData();
            int numCols = meta.getColumnCount();
            for (int i = 1; i <= numCols; i++) {
                if (i > 1) writer.write(";");
                writer.write(meta.getColumnName(i));
            }
            writer.newLine();

            // Datos
            int filas = 0;
            while (rs.next()) {
                for (int i = 1; i <= numCols; i++) {
                    if (i > 1) writer.write(";");
                    String valor = rs.getString(i);
                    if (valor != null) writer.write(valor);
                }
                writer.newLine();
                filas++;
            }

            // Pie con total
            writer.write("# Total: " + filas + " filas exportadas");
            writer.newLine();

            System.out.println("Exportadas " + filas + " filas a " + csvFile);

        } catch (SQLException | IOException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

> **💡 Explicación:**
> `ResultSetMetaData` da información sobre las columnas: nombre, tipo, tamaño. `getColumnCount()` + `getColumnName(i)` genera la cabecera dinámicamente — funciona para cualquier consulta, no solo `SELECT *`. El CSV usa `;` como separador (estilo español). La fecha de exportación y el total de filas se escriben como comentarios con `#`. Esto es exportación profesional.

---

> **🔗 CodeWars:** [SQL with Street Fighter](https://www.codewars.com/kata/585d8c8c28d62654a800025b) (6kyu) • [SQL Basics: Simple JOIN](https://www.codewars.com/kata/5802e32dd8c944e562000020) (6kyu)  
> **🔗 AceptaElReto.com:** [200 - Aburrimiento en las aulas](https://www.aceptaelreto.com/problem/statement.php?id=200) • [340 - Juegos de naipes](https://www.aceptaelreto.com/problem/statement.php?id=340) • [100 - Kaprekar](https://www.aceptaelreto.com/problem/statement.php?id=100)
