---
title: "Butlletí U13 — Avançat Resolt"
description: "Els mateixos exercicis que el butlletí avançat, amb solucions completes"
---

# 📝 Butlletí U13 — Avançat (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## ⭐ Exercici 1: Connexió des de fitxer de propietats

<details>
<summary>🔄 Solució</summary>

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

public class ConexioProperties {
    public static void main(String[] args) {
        Properties props = new Properties();
        try (InputStream in = Files.newInputStream(Path.of("db.properties"))) {
            props.load(in);
        } catch (IOException e) {
            System.err.println("No es va poder llegir db.properties: " + e.getMessage());
            return;
        }

        String url = props.getProperty("url");
        if (url == null) {
            System.err.println("Falta la propietat 'url' a db.properties");
            return;
        }

        try (Connection con = DriverManager.getConnection(url)) {
            System.out.println("Connectat a: " + url);
        } catch (SQLException e) {
            System.err.println("Error BD: " + e.getMessage());
        }
    }
}
```

`Properties` carrega el parell clau-valor i `getProperty("url")` el recupera. Dues excepcions conviuen ací: la `IOException` de llegir el fitxer (U12) i la `SQLException` de connectar. I les credencials no viatgen en el codi: és el manament 6 del decàleg.

</details>

---

## ⭐ Exercici 2: INSERT amb clau autogenerada

<details>
<summary>🔄 Solució</summary>

```java
import java.sql.*;

public class InserirAmbId {
    public static void main(String[] args) {
        String sql = "INSERT INTO alumnos (nombre, edad, curso) VALUES (?, ?, ?)";

        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             PreparedStatement pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, "María");
            pstmt.setInt(2, 22);
            pstmt.setString(3, "DAM");
            pstmt.executeUpdate();

            try (ResultSet claus = pstmt.getGeneratedKeys()) {
                if (claus.next()) {
                    System.out.println("Nou id: " + claus.getInt(1));
                }
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

La clau està en `Statement.RETURN_GENERATED_KEYS`: li dius a la base de dades que vols saber el id que acaba de generar. Després, `getGeneratedKeys()` torna un `ResultSet` amb eixa clau i es llig amb `next()` + `getInt(1)`. Sense eixa opció, hauríes de fer una consulta extra o endevinar.

</details>

---

## ⭐ Exercici 3: UPDATE condicional

<details>
<summary>🔄 Solució</summary>

```java
import java.sql.*;
import java.util.Scanner;

public class ActualitzarCurs {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Quina edat mínima? ");
        int edat = sc.nextInt();
        sc.nextLine();
        System.out.print("Quin nou curs? ");
        String curs = sc.nextLine();

        String sql = "UPDATE alumnos SET curso = ? WHERE edad > ?";

        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, curs);
            pstmt.setInt(2, edat);

            int files = pstmt.executeUpdate();
            System.out.println("Actualitzats " + files + " alumne/s");

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

El `WHERE edad > ?` limita l'actualització als alumnes majors d'eixa edat. `executeUpdate()` torna el nombre de files afectades: si imprimeix `0`, és que no hi havia ningú major de 25 (o tots ja estaven en eixe curs). Sense el `WHERE`, hauríes actualitzat tota la taula. Comprova sempre les files.

</details>

---

## ⭐⭐ Exercici 4: INNER JOIN amb PreparedStatement

<details>
<summary>🔄 Solució</summary>

```java
import java.sql.*;
import java.util.Scanner;

public class JoinAlumne {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Nom de l'alumne: ");
        String nom = sc.nextLine();

        String sql = "SELECT a.nombre, m.asignatura, m.nota " +
                     "FROM alumnos a " +
                     "INNER JOIN matriculas m ON m.id_alumno = a.id " +
                     "WHERE a.nombre = ?";

        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, nom);

            try (ResultSet rs = pstmt.executeQuery()) {
                System.out.println("Alumne: " + nom);
                boolean trobat = false;
                while (rs.next()) {
                    System.out.printf("  %s: %.1f%n",
                        rs.getString("asignatura"),
                        rs.getDouble("nota"));
                    trobat = true;
                }
                if (!trobat) System.out.println("  Sense matrícules");
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

L'`INNER JOIN` relaciona `alumnos` i `matriculas` per la clau forana `id_alumno`, i el `WHERE` filtra pel nom. Una sola consulta, un sol viatge a la base de dades: és l'antídot del patró N+1 (manament 8). Els àlies `a` i `m` fan l'SQL més curt.

</details>

---

## ⭐⭐ Exercici 5: Cerca amb LIKE

<details>
<summary>🔄 Solució</summary>

```java
import java.sql.*;
import java.util.Scanner;

public class CercarAlumnes {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Part del nom: ");
        String text = sc.nextLine();

        String sql = "SELECT * FROM alumnos WHERE nombre LIKE ?";

        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, "%" + text + "%");

            try (ResultSet rs = pstmt.executeQuery()) {
                boolean trobat = false;
                while (rs.next()) {
                    System.out.printf("%d - %s (%d)%n",
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getInt("edad"));
                    trobat = true;
                }
                if (!trobat) System.out.println("Sense resultats");
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

`LIKE ?` amb `setString(1, "%" + text + "%")`: els `%` són comodins que permeten coincidència en qualsevol posició. La concatenació ací és segura perquè els `%` formen part del **valor**, no de l'SQL. El `ResultSet` anidat en el seu propi `try-with-resources` es tanca sol.

</details>

---

## ⭐⭐ Exercici 6: Dates en JDBC

<details>
<summary>🔄 Solució</summary>

```java
import java.sql.*;
import java.util.Scanner;

public class DatesJDBC {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Nom: ");
        String nom = sc.nextLine();
        System.out.print("Edat: ");
        int edat = sc.nextInt();
        sc.nextLine();
        System.out.print("Curs: ");
        String curs = sc.nextLine();
        System.out.print("Data de naixement (YYYY-MM-DD): ");
        String dataText = sc.nextLine();

        String inserir = "INSERT INTO alumnos (nombre, edad, curso, fecha_nacimiento) VALUES (?, ?, ?, ?)";

        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             PreparedStatement pstmt = con.prepareStatement(inserir)) {

            pstmt.setString(1, nom);
            pstmt.setInt(2, edat);
            pstmt.setString(3, curs);
            pstmt.setDate(4, Date.valueOf(dataText));

            int files = pstmt.executeUpdate();
            System.out.println("Inserits " + files + " alumne/s");

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }

        String llistar = "SELECT nombre, fecha_nacimiento FROM alumnos";
        try (Connection con = DriverManager.getConnection("jdbc:sqlite:instituto.db");
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(llistar)) {
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

`java.sql.Date.valueOf("2000-03-15")` convertix el text en una data que JDBC entén, i `setDate(4, ...)` la inserix. Per a llegir-la, `rs.getDate(...)`. Alerta amb el tipus: és `java.sql.Date`, no `java.util.Date` (són diferents). El `String` de la data ha d'anar en el format exacte `YYYY-MM-DD`.

</details>

---

## ⭐⭐ Exercici 7: Batch INSERT — 100 alumnes de prova

<details>
<summary>🔄 Solució</summary>

```java
import java.sql.*;

public class BatchAlumnes {
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

            int[] resultats = pstmt.executeBatch();

            long fin = System.currentTimeMillis();
            System.out.println("Inserits " + resultats.length + " alumnes en " + (fin - inicio) + " ms");

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

`addBatch()` acumula les sentències sense enviar-les, i `executeBatch()` les mana **totes de cop** en un sol viatge a la base de dades. `resultats` conté les files afectades per cada lot. Comparat amb 100 `executeUpdate()` solts (100 viatges), el batch és moltíssim més ràpid: una sola operació de xarxa en comptes de cent.

</details>

---

## ⭐⭐⭐ Exercici 8: El patró DAO

<details>
<summary>🔄 Solució</summary>

**1. El model:**

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

**2. La interfície (el contracte):**

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

**3. La implementació (l'SQL):**

```java
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlumnoDAOImpl implements AlumnoDAO {
    private static final String URL = "jdbc:sqlite:instituto.db";

    @Override
    public List<Alumno> listar() {
        List<Alumno> alumnes = new ArrayList<>();
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
                alumnes.add(a);
            }
        } catch (SQLException e) {
            System.err.println("Error en llistar: " + e.getMessage());
        }
        return alumnes;
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
            System.err.println("Error en cercar: " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<Alumno> buscarPorNombre(String nombre) {
        List<Alumno> alumnes = new ArrayList<>();
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
                    alumnes.add(a);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error en cercar: " + e.getMessage());
        }
        return alumnes;
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
            System.err.println("Error en inserir: " + e.getMessage());
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
            System.err.println("Error en actualitzar: " + e.getMessage());
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
            System.err.println("Error en eliminar: " + e.getMessage());
            return false;
        }
    }
}
```

**4. El Main (programa contra la interfície):**

```java
import java.util.List;

public class Main {
    public static void main(String[] args) {
        AlumnoDAO dao = new AlumnoDAOImpl();

        dao.insertar(new Alumno("Nova Alumna", 21, "DAM"));
        System.out.println("--- Alumnes ---");
        for (Alumno a : dao.listar()) {
            System.out.println(a);
        }

        System.out.println("--- Cercar per nom ('María') ---");
        for (Alumno a : dao.buscarPorNombre("María")) {
            System.out.println(a);
        }
    }
}
```

El `Main` només coneix la interfície `AlumnoDAO`: si demà canvies SQLite per MySQL, només canvia `AlumnoDAOImpl`, i el `Main` no se n'assabenta. Eixa és la màgia del DAO.

</details>

---

## ⭐⭐⭐ Exercici 9: Transacció bancària atòmica

<details>
<summary>🔄 Solució</summary>

```java
import java.sql.*;

public class Transferencia {
    private static final String URL = "jdbc:sqlite:instituto.db";

    public static void transferir(int idOrigen, int idDesti, double quantitat) {
        String treure = "UPDATE cuentas SET saldo = saldo - ? WHERE id = ?";
        String posar  = "UPDATE cuentas SET saldo = saldo + ? WHERE id = ?";

        try (Connection con = DriverManager.getConnection(URL)) {
            con.setAutoCommit(false);  // obrim la transacció

            try (PreparedStatement q = con.prepareStatement(treure);
                 PreparedStatement p = con.prepareStatement(posar)) {

                q.setDouble(1, quantitat);
                q.setInt(2, idOrigen);
                q.executeUpdate();

                if (idOrigen == idDesti) {
                    throw new SQLException("Destí invàlid: mateix compte");
                }

                p.setDouble(1, quantitat);
                p.setInt(2, idDesti);
                p.executeUpdate();

                con.commit();
                System.out.println("Transferència OK");
            } catch (SQLException e) {
                con.rollback();
                System.err.println("Va fallar, tot desfet: " + e.getMessage());
            }
        } catch (SQLException e) {
            System.err.println("Error de connexió: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        transferir(1, 2, 100);
        // Per a provar el rollback, crida transferir(1, 1, 100): mateix compte
    }
}
```

`setAutoCommit(false)` obri la transacció: les dues operacions s'executen sense confirmar-se. Si tot va bé, `commit()` les guarda juntes. Si alguna cosa falla (ací, forçat amb `throw new SQLException`), `rollback()` desfà la primera operació perquè el sistema no quede a mitges. És la definició d'atòmic: tot o res. Sense això, una transferència a mitges deixaria diners flotant al limbe.

</details>