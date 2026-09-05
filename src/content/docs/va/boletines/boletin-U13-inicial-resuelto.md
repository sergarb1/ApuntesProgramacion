---
title: "Butlletí U13 — Inicial Resolt"
description: "Els mateixos exercicis que el butlletí inicial, amb solucions"
---

# 📝 Butlletí U13 — Inicial (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: Què necessites per a usar JDBC?

<details>
<summary>🔄 Solució</summary>

1. La dependència **`org.xerial:sqlite-jdbc`**. Al `pom.xml`:

   ```xml
   <dependency>
       <groupId>org.xerial</groupId>
       <artifactId>sqlite-jdbc</artifactId>
       <version>3.45.1.0</version>
   </dependency>
   ```

2. **`DriverManager`** — el seu mètode estàtic `getConnection()` establix la connexió.
3. **`Connection`** — la interfície del paquet `java.sql` que representa la connexió oberta.
4. **`SQLException`** — és *checked*: el compilador t'obliga a capturar-la o declarar-la.

</details>

---

## Exercici 2: Completa el codi — la connexió

<details>
<summary>🔄 Solució</summary>

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

Els tres tipus són **`Connection`**, **`Statement`** i **`ResultSet`**, tots del paquet `java.sql`. L'excepció és **`SQLException`**. Fixa't en l'ordre d'obertura: Connection → Statement → ResultSet; `try-with-resources` els tanca en ordre invers.

</details>

---

## Exercici 3: Què imprimeix? — ResultSet buit

<details>
<summary>🔄 Solució</summary>

Imprimeix **`No encontrado`**.

`rs.next()` torna **`false`** la primera vegada si no hi ha files. El cursor del `ResultSet` comença *abans* de la primera fila, així que amb una consulta sense resultats, el primer `next()` ja es troba amb el buit i torna `false`, saltant a l'`else`. No és un error: una consulta sense resultats torna un `ResultSet` buit, no una excepció.

</details>

---

## Exercici 4: Troba l'error — SQLException sense gestionar

<details>
<summary>🔄 Solució</summary>

No compila perquè **`SQLException` és checked**: `DriverManager.getConnection()`, `con.createStatement()` i `stmt.executeQuery()` la llancen, i el codi no la captura ni la declara.

Falten dues coses:

1. Embolcar el codi en un `try { ... } catch (SQLException e) { ... }`.
2. Tancar els recursos (millor, amb `try-with-resources`).

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

## Exercici 5: Escriu este programa — la primera connexió

<details>
<summary>🔄 Solució</summary>

```java
import java.sql.*;

public class TestConnexio {
    public static void main(String[] args) {
        String url = "jdbc:sqlite:test.db";

        String crearTaula = "CREATE TABLE IF NOT EXISTS alumnos (" +
            "id INTEGER PRIMARY KEY, nombre TEXT, nota REAL)";

        try (Connection con = DriverManager.getConnection(url);
             Statement stmt = con.createStatement()) {

            stmt.executeUpdate(crearTaula);
            stmt.executeUpdate("INSERT INTO alumnos (nombre, nota) VALUES ('Ana', 7.5)");
            stmt.executeUpdate("INSERT INTO alumnos (nombre, nota) VALUES ('Luis', 9.0)");
            stmt.executeUpdate("INSERT INTO alumnos (nombre, nota) VALUES ('Sara', 6.5)");

            System.out.println("Connexió i taula creades");

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

`CREATE TABLE` i `INSERT` són operacions que no tornen files, així que s'executen amb `executeUpdate()`. L'`IF NOT EXISTS` evita errors si tornesses a executar el programa. I sí: `test.db` es crea sol amb la primera connexió.

</details>

---

## Exercici 6: Què imprimeix? — executeQuery en UPDATE

<details>
<summary>🔄 Solució</summary>

Llança una **`SQLException`**.

`executeQuery()` és només per a consultes que **tornen files** (SELECT). Un `UPDATE` no torna un `ResultSet`; torna el nombre de files afectades, i això és feina de `executeUpdate()`. Barrejar-los dona `SQLException` sempre. És com ficar una forqueta al microones: no hi ha volta enrere.

Regla mnemotècnica: **esperes dades de tornada? → `executeQuery()`. Només vols saber quantes files s'han modificat? → `executeUpdate()`.**

</details>

---

## Exercici 7: Completa el codi — INSERT amb PreparedStatement

<details>
<summary>🔄 Solució</summary>

```java
String sql = "INSERT INTO alumnos (nombre, nota) VALUES (?, ?)";

try (Connection con = DriverManager.getConnection(url);
     PreparedStatement pstmt = con.prepareStatement(sql)) {

    pstmt.setString(1, "Ana");
    pstmt.setDouble(2, 8.5);

    int filas = pstmt.executeUpdate();
    System.out.println("Inserides " + filas + " fila/es");
}
```

Els buits: **`setString`**, **`setDouble`** i **`executeUpdate`**. Els índexs dels `?` comencen en **1** (no en 0, com els arrays). `setString(1, ...)` ompli el primer `?`, `setDouble(2, ...)` el segon. `executeUpdate()` torna les files afectades: si és `1`, tot bé.

</details>

---

## Exercici 8: Escriu este programa — llistar amb try-with-resources

<details>
<summary>🔄 Solució</summary>

```java
import java.sql.*;

public class LlistarAlumnes {
    public static void llistarAlumnes() {
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
        llistarAlumnes();
    }
}
```

`try-with-resources` tanca `Connection`, `Statement` i `ResultSet` automàticament en ordre invers. El `printf` formata l'eixida en columnes, i `getInt`/`getString`/`getDouble` llig cada columna per nom. La `SQLException` es captura i mostra el seu missatge.

</details>

---

## Exercici 9: Troba l'error — índexs del PreparedStatement

<details>
<summary>🔄 Solució</summary>

Els índexs dels `?` comencen en **1**:

```java
pstmt.setString(1, "Ana");    // primer ?
pstmt.setDouble(2, 8.5);      // segon ?
pstmt.setString(3, "DAM");    // tercer ?
```

`setString(0, "Ana")` és **incorrecte**: llança una `SQLException` perquè no existix cap `?` amb índex 0. Els placeholders són posicionals i el primer és l'1. És la trampa clàssica de qui ve dels arrays, on els índexs comencen en 0.

</details>