---
title: "Butlletí U13 — Inicial"
description: "Exercicis bàsics de JDBC: connectar-se a SQLite, consultar amb Statement i ResultSet i inserir amb PreparedStatement"
---

# 📝 Butlletí U13 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, afig la dependència de SQLite i fes que el teu primer `SELECT` deixe de semblar màgia. Connectar és el 90% de la batalla; la resta és qüestió de pràctica. Comença suaument, que les bases de dades mosseguen a poc a poc.

---

## Exercici 1: Què necessites per a usar JDBC?

Respon breument:

1. Quina dependència Maven (grup i artefacte) necessites per a connectar Java amb SQLite?
2. Quina classe de Java proporciona el mètode `getConnection()`?
3. Quina interfície representa la connexió oberta a la base de dades?
4. Quina excepció *checked* has de gestionar sempre en treballar amb JDBC?

---

## Exercici 2: Completa el codi — la connexió

Completa els tipus que falten:

```java
String url = "jdbc:sqlite:instituto.db";

String sql = "SELECT * FROM alumnos";

try (______ con = DriverManager.getConnection(url);
     ______ stmt = con.createStatement();
     ______ rs = stmt.executeQuery(sql)) {

    while (rs.next()) {
        System.out.println(rs.getString("nombre"));
    }

} catch (______ e) {  // quina excepció?
    System.err.println("Error: " + e.getMessage());
}
```

Quines tres interfícies van en els buits? I l'excepció?

---

## Exercici 3: Què imprimeix? — ResultSet buit

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

Si no hi ha cap alumne amb `id = 9999`, què imprimeix? Què torna `rs.next()` la primera vegada que es crida?

---

## Exercici 4: Troba l'error — SQLException sense gestionar

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

Este codi **no compila**. Per què? Quines dues coses falten perquè funcione?

---

## Exercici 5: Escriu este programa — la primera connexió

Crea una classe `TestConnexio` que:

1. Es connecte a una base de dades SQLite `test.db`.
2. Cree una taula `alumnes(id INTEGER PRIMARY KEY, nom TEXT, nota REAL)`.
3. Inserisca 3 alumnes.
4. Mostre «Connexió i taula creades» si tot ha anat bé.

Pista: usa `try-with-resources`, un `Statement` per al `CREATE TABLE` i `executeUpdate()` per a inserir. SQLite crea el fitxer sol.

---

## Exercici 6: Què imprimeix? — executeQuery en UPDATE

```java
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("UPDATE alumnos SET nota = 10 WHERE id = 1");
```

Què passa en executar esta línia? Per què no has d'usar `executeQuery()` per a un `UPDATE`?

---

## Exercici 7: Completa el codi — INSERT amb PreparedStatement

Completa els buits per a inserir un alumne de forma segura:

```java
String sql = "INSERT INTO alumnos (nombre, nota) VALUES (?, ?)";

try (Connection con = DriverManager.getConnection(url);
     PreparedStatement pstmt = con.prepareStatement(sql)) {

    pstmt.______(1, "Ana");
    pstmt.______(2, 8.5);

    int filas = pstmt.______();
    System.out.println("Inserides " + filas + " fila/es");
}
```

Quins mètodes van en els buits? En quin número comencen els índexs dels `?`?

---

## Exercici 8: Escriu este programa — llistar amb try-with-resources

Escriu un mètode `llistarAlumnes()` que:

1. Es connecte a la base de dades amb `try-with-resources`.
2. Execute `SELECT * FROM alumnos`.
3. Mostre cada alumne amb `printf("%d - %s (%.2f)", id, nombre, nota)`.
4. Gestione `SQLException` mostrant `e.getMessage()`.

Pista: `Connection`, `Statement` i `ResultSet` es tanquen sols dins del `try`. Recorre amb `while (rs.next())`.

---

## Exercici 9: Troba l'error — índexs del PreparedStatement

```java
String sql = "INSERT INTO alumnos (nombre, nota, curso) VALUES (?, ?, ?)";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(0, "Ana");    // índex correcte?
pstmt.setDouble(1, 8.5);      // índex correcte?
pstmt.setString(2, "DAM");    // índex correcte?
pstmt.executeUpdate();
```

Quins índexs són correctes per als `?` d'un `PreparedStatement`? En quin número comencen i què passa si uses `0`?