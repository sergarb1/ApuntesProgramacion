---
title: "03 · Statement i ResultSet: consultar dades"
description: "Llança consultes amb Statement, processa files amb ResultSet i decidix entre executeQuery i executeUpdate sense ficar una forqueta al microones 🗄️📊"
---

<p><small>Llança consultes amb Statement, processa files amb ResultSet i decidix entre executeQuery i executeUpdate sense ficar una forqueta al microones 🗄️📊</small></p>

> 🗺️ **Estàs en:** 🗄️ **U13 · Connexió a BD amb JDBC** → 03 · Statement i ResultSet

---

## 📬 La idea en una frase

> **Amb `Statement` envies la consulta i amb `ResultSet` reps les files: `rs.next()` avança a la següent fila (començant abans de la primera) i `rs.getInt("id")` / `rs.getString("nombre")` llig cada columna.**

Ja tens la canonada (`Connection`). Ara toca la part divertida: **preguntar-li** a la base de dades. El missatger que porta la teua pregunta es diu `Statement`, i la resposta arriba en un `ResultSet`, que és com una taula virtual amb les files que han coincidit. Anem a vore com es llança una consulta i com es processa fila a fila.

---

## 📤 Statement: el missatger

`Statement` és la forma més directa d'executar una consulta. La crees a partir de la connexió i li passes el SQL com un String:

```java
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM alumnos");
```

`executeQuery()` és el mètode per a **SELECT**: torna un `ResultSet` amb les files que han coincidit. Si la consulta no torna res, no és un error: et dona un `ResultSet` buit, i `rs.next()` tornarà `false` directament.

> ⚠️ **Advertència:** no uses `executeQuery()` per a un INSERT, UPDATE o DELETE. Això llança una `SQLException`. `executeQuery()` és només per a consultes que tornen dades (SELECT); per a les altres està `executeUpdate()`. Cada cosa al seu lloc, com la forqueta i el microones.

---

## 📊 ResultSet: la taula virtual

`ResultSet` és la resposta de la base de dades: un conjunt de files. La clau és que el cursor comença **abans de la primera fila**, i `next()` l'avança a la següent. Quan no queden més files, `next()` torna `false`.

```java
while (rs.next()) {
    System.out.println(rs.getInt("id") + ": " + rs.getString("nombre"));
}
```

El patró és sempre el mateix: `while (rs.next())` per a recórrer totes les files, i dins, `rs.getXxx("nom_columna")` per a llegir cada camp. El `getXxx` depén del tipus: `getInt`, `getString`, `getDouble`, `getBoolean`, `getDate`...

| Tipus en SQLite | Mètode de lectura |
|---|---|
| INTEGER | `getInt("columna")` |
| TEXT | `getString("columna")` |
| REAL | `getDouble("columna")` |
| BOOLEAN (0/1) | `getBoolean("columna")` |

> 💡 **Consell:** també pots usar l'índex de columna en comptes del nom: `rs.getString(1)` és la primera columna, `rs.getString(2)` la segona... El nom és més llegible i no es trenca si reordena les columnes. Usa noms.

---

## ⚖️ executeQuery vs executeUpdate

Dos mètodes, dues missions. Esta taula et salva en els exàmens:

| Mètode | Per a què | Torna |
|---|---|---|
| `executeQuery()` | SELECT | `ResultSet` (les files) |
| `executeUpdate()` | INSERT, UPDATE, DELETE | `int` (files afectades) |

Regla mnemotècnica: si esperes **dades de tornada** (files amb columnes), `executeQuery()`. Si només vols saber **quantes files s'han modificat**, `executeUpdate()`. Barrejar-los dona `SQLException`: és com ficar la forqueta al microones, no hi ha volta enrere.

---

## 🧼 El programa complet

Tot junt, amb `try-with-resources` perquè no escape cap recurs:

```java
String url = "jdbc:sqlite:instituto.db";
String sql = "SELECT id, nombre FROM alumnos";

try (Connection con = DriverManager.getConnection(url);
     Statement stmt = con.createStatement();
     ResultSet rs = stmt.executeQuery(sql)) {

    while (rs.next()) {
        System.out.printf("%d: %s%n", rs.getInt("id"), rs.getString("nombre"));
    }

} catch (SQLException e) {
    System.err.println("Error BD: " + e.getMessage());
}
```

Fixa't en l'ordre d'obertura: Connection → Statement → ResultSet. Amb `try-with-resources` es tanquen en ordre invers i no has de preocupar-te'n. Si la consulta és fixa i no té paràmetres variables, un `Statement` senzill és suficient. Quan hi haja dades de l'usuari de per mig... això és cosa del punt 5.

> 💡 **Consell:** `Statement` servix per a consultes literalment fixes. Per al 90% de les teues consultes reals (amb paràmetres que canvien) usaràs `PreparedStatement`. Ho veuràs molt prompte, no t'enamores del `Statement` encara.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. On comença el cursor d'un `ResultSet` abans de cridar `next()`?
2. Quin mètode usaríes per a un `UPDATE` i què torna?
3. Què passa si `executeQuery()` no troba cap fila?
4. Com lliges un valor enter d'una columna anomenada `edad`?

<details>
<summary>🔄 Respostes</summary>

1. **Abans de la primera fila.** Per això el bucle és `while (rs.next())`.
2. `executeUpdate()` — torna un `int` amb les files afectades.
3. No és un error: et dona un `ResultSet` buit i `next()` torna `false` a la primera.
4. `rs.getInt("edad")`.

</details>

---

## ✅ Resum en 3 frases

1. `Statement` envia la consulta amb `executeQuery()` (SELECT) i torna un `ResultSet`, una **taula virtual** que es recorre amb `while (rs.next())`.
2. Cada fila es llig amb `rs.getXxx("columna")`, i el cursor comença **abans** de la primera fila, d'ací el `next()` del bucle.
3. `executeUpdate()` (per a INSERT/UPDATE/DELETE) torna les **files afectades**, i usar `executeQuery()` per a eixes operacions llança `SQLException`.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `Statement` | El missatger que executa una consulta fixa |
> | `ResultSet` | La taula virtual amb les files tornades |
> | `next()` | Avança a la següent fila (comença abans de la primera) |
> | `executeQuery()` | Per a SELECT: torna `ResultSet` |
> | `executeUpdate()` | Per a INSERT/UPDATE/DELETE: torna files afectades |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/13-conexion-bases-datos) · **Anterior:** [02 · Connexió a SQLite](/ApuntesProgramacion/va/13-conexion-bases-datos/02-conexion) · **Següent:** [04 · CRUD complet](/ApuntesProgramacion/va/13-conexion-bases-datos/04-crud)