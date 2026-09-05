---
title: "09 · Repàs interactiu: domina el JDBC"
description: "El tancament pràctic de la unitat, amb una injecció SQL que farà mal, un UPDATE sense WHERE que cremarà i una connexió que ningú no va tancar 😈🗄️"
---

<p><small>El tancament pràctic de la unitat, amb una injecció SQL que farà mal, un UPDATE sense WHERE que cremarà i una connexió que ningú no va tancar 😈🗄️</small></p>

> 🗺️ **Estàs en:** 🗄️ **U13 · Connexió a BD amb JDBC** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaben de donar-te este programa per a executar:*

```java
import java.sql.*;

public class Misterio {
    public static void main(String[] args) {
        String url = "jdbc:sqlite:instituto.db";

        try (Connection con = DriverManager.getConnection(url);
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM alumnos")) {

            if (rs.next()) {
                System.out.println("Total: " + rs.getInt(1));
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

**Què imprimixes per pantalla? Tria saviament:**

1. **`Total: 0`** → `COUNT(*)` sempre torna 0 si hi ha algun alumne. ❌
2. **`Total: <nombre d'alumnes>`** → `COUNT(*)` torna una sola fila amb una columna, i `rs.getInt(1)` la llig per índex. ✅
3. **Una excepció** → `getInt(1)` no existix perquè les columnes comencen en 0. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **2**. `SELECT COUNT(*)` torna **una sola fila amb una columna** sense nom fix, així que s'accedix per índex `rs.getInt(1)` (les columnes del `ResultSet` comencen en 1, no en 0). Si la taula té 25 alumnes, imprimeix `Total: 25`. Un `ResultSet` amb una fila seguix necessitant el seu `rs.next()`: el cursor sempre comença abans de la primera fila.
>
> </details>

---

## 🔥 Fireside Chat: Statement vs PreparedStatement

> *Dues formes d'executar SQL es troben davant la màquina de cafè.*

**Statement:** — Jo soc el de tota la vida. `stmt.executeQuery("SELECT * FROM usuarios")`. Directe, sense voltes. Per a una consulta fixa soc perfecte.

**PreparedStatement:** — Sí, però quan arriba una dada de l'usuari i concatenes, se t'encén el pilot de la injecció. Jo separo l'SQL de les dades amb `?` i els `setXxx`. Seguretat de sèrie.

**Statement:** — I si només execute una consulta una volta? Per a què he de preparar res?

**PreparedStatement:** — A més jo faig cache del pla d'execució. Si executes la mateixa consulta amb diferents paràmetres, soc més ràpid. I en Java quasi sempre fas això: la mateixa consulta, mil valors diferents.

**Statement:** — Val... però jo servisc per al DDL: `CREATE TABLE`, `ALTER`...

**PreparedStatement:** — Cert. Per a DDL, Statement. Per a DML (SELECT, INSERT, UPDATE, DELETE), jo. Tracte?

**Statement:** — Tracte.

> La lliçó: **DDL → Statement. DML → PreparedStatement.** I mai concatenes dades d'usuari en un SQL, digues el que digues.

---

## 🕵️ Qui soc?

Endevina quin concepte de la unitat soc:

1. **Soc el traductor universal entre Java i qualsevol base de dades amb controlador.**
2. **Soc la canonada que `DriverManager.getConnection()` et torna i que tanques amb `try-with-resources`.**
3. **Soc la taula virtual que es recorre amb `next()` i es llig amb `getXxx("columna")`.**
4. **Soc el missatger segur que separa l'SQL de les dades amb `?`.**
5. **Soc el patró que encapsula tot l'SQL darrere d'una interfície.**
6. **Soc l'operació que fa que diverses sentències es confirmen juntes... o cap.**

<details>
<summary>🔄 Respostes</summary>

1. **JDBC** — `java.sql`, el pont cap a SQLite, MySQL, PostgreSQL...
2. **`Connection`** — s'obté amb `DriverManager.getConnection()` i es tanca sempre.
3. **`ResultSet`** — `while (rs.next())` + `rs.getInt("id")`, `rs.getString("nombre")`...
4. **`PreparedStatement`** — placeholders `?` i `setString(1, ...)`, `setInt(2, ...)`...
5. **DAO** — `ContactoDAO` (interfície) + `ContactoDAOImpl` (implementació).
6. **Transacció** — `setAutoCommit(false)`, `commit()` o `rollback()`.

</details>

---

## 🤬 CONRAD VS EL MÓN: "El JDBC que no es tanca"

> *CONRAD, el nostre compilador cascarrabutxes, opina sobre els clàssics del novell.*

**CONRAD:** — UNA ALTRA VEGADA! Ve un alumne i em diu: *CONRAD, el meu programa funciona però a la segona volta es queixa de "Too many connections"*. AI, MARE MEUA! És que està obrint `Connection` a la babalà i **no la tanca mai**. Cada `getConnection()` sense el seu `try-with-resources` és una canonada degotant. El servidor té un límit de connexions, i tu les estàs esgotant totes. `try-with-resources`! Tant costa?

*I després està el de l'`UPDATE` sense `WHERE`.* M'ensenya un codi que actualitza "un" contacte i resulta que **els ha posat tots** amb el mateix telèfon. I el `WHERE id = ?`? Se li va oblidar! En `UPDATE` i `DELETE`, si no hi ha `WHERE`, és que volies arrasar la taula sencera.

*I el rei del drama:* usa `executeQuery()` per a un `INSERT` i s'emporta una `SQLException`. I tant! `executeQuery()` és per a SELECT; per a INSERT/UPDATE/DELETE està `executeUpdate()`. Cada cosa al seu lloc. Com la forqueta i el microones, que t'ho vaig dir al punt 3.

*I l'últim, el del silenci:* captura l'excepció i... **no fa res**. `catch (Exception e) {}` buit. La llum del "check engine" encesa i ell tan feliç. Escriu `e.getMessage()`! És gratis i et diu exactament què ha passat.

**La lliçó:** abans d'acusar la base de dades d'"odiar-te", repassa el trio sagrat de la unitat: **he tancat la connexió? hi ha `WHERE` en el meu UPDATE/DELETE? estic usant el mètode d'execució correcte?** El 90% dels errors d'esta unitat s'arreglen amb estes tres preguntes. La base de dades no t'odia: t'està passant les respostes de l'examen.

---

## 🎮 El joc de les decisions

Tria la resposta correcta per a cada decisió (respostes al final):

1. Vols buscar alumnes per un nom que tecleja l'usuari. Què uses?
   - a) `Statement` amb concatenació   b) `PreparedStatement` amb `?`
2. `executeUpdate()` en un `UPDATE` que no troba files... què torna?
   - a) `0`   b) una `SQLException`
3. Quin mètode obri una transacció?
   - a) `con.setAutoCommit(false)`   b) `con.beginTransaction()`
4. `rs.next()` en un `ResultSet` buit torna...
   - a) `false`   b) `null`
5. Per al DDL (`CREATE TABLE`), què s'usa amb més sentit?
   - a) `Statement`   b) `PreparedStatement`

<details>
<summary>🔄 Solucions</summary>

1. **b)** — Mai concatenes dades d'usuari en SQL. `PreparedStatement` amb placeholders.
2. **a)** — Torna `0`: no va trobar files, però no és un error. Per això es comprova `> 0`.
3. **a)** — `setAutoCommit(false)` desactiva l'auto-commit; la resta és `commit()`/`rollback()`.
4. **a)** — `next()` torna `false` quan no queden files, no `null` ni excepció.
5. **a)** — Per a DDL un `Statement` simple val; `PreparedStatement` és per a DML amb dades.

</details>

---

## ⚡ Laboratori de tortura: el CRUD que sagna

> **Duració estimada:** 30 minuts
> **Ferramenta:** el teu IDE, el controlador de SQLite i un fitxer nou

**L'escenari:** et passen este gestor de contactes amb SQLite. Et diuen que té **3 errors** que impedixen que compile i 1 error de lògica que fa que el resultat siga incorrecte... però, i si t'ho diuen malament? La teua tasca: fer que compile, que execute i que **tota** l'eixida siga correcta, comptant tu els errors reals.

```java
import java.sql.*;

public class GestorContactos {
    private static final String URL = "jdbc:sqlite:contactos.db";

    public static void main(String[] args) {
        crearTabla();
        insertar("Ana", "666111222");
        insertar("Luis", "666333444");
        listar();
    }

    static void crearTabla() {
        String sql = "CREATE TABLE IF NOT EXISTS contactos (id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, telefono TEXT)";
        try (Connection con = DriverManager.getConnection(URL);
             Statement stmt = con.createStatement()) {
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }

    static void insertar(String nombre, String telefono) {
        String sql = "INSERT INTO contactos (nombre, telefono) VALUES ('" + nombre + "', '" + telefono + "')";
        try (Connection con = DriverManager.getConnection(URL);
             Statement stmt = con.createStatement()) {
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }

    static void listar() {
        String sql = "SELECT * FROM contactos"
        try (Connection con = DriverManager.getConnection(URL);
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                System.out.println(rs.getInt("id") + " - " + rs.getString("nombre"));
            }
        } catch (SQLException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
```

**Fallada intencionada:** el nombre d'errors de l'enunciat està malament a propòsit: si busques el "tercer error de compilació" i "l'error de lògica", te'n tornes boig. La trampa és la teua confiança en l'enunciat.

**La teua tasca:** aconseguir que compile, que execute i que **tota** l'eixida siga correcta. Si el resultat no quadra, diagnostica.

**Pistes per quan et frustres (no abans):**

1. Compila? *no → busca punts i comes.*
   <details><summary>I si continuec atascat?</summary>Fixa't en la línia `String sql = "SELECT * FROM contactos"` de `listar()`: li falta el `;` al final.</details>
2. Compila ja? *no → busca més coses rares.*
   <details><summary>I si continuec atascat?</summary>Mira els `Statement` de `insertar()`: està concatenant l'SQL amb dades del programa. Compila, però és una bomba de rellotgeria.</details>
3. Creus que hi ha un error de lògica que canvia l'eixida? *Torna a llegir amb calma i no et fies de l'enunciat.*
   <details><summary>Solució final</summary>

**Errors de compilació:**

1. Falta el `;` al final de `String sql = "SELECT * FROM contactos"` a `listar()`.

**L'"error de lògica"**: no existix com a tal. La lògica de crear taula, inserir i llistar és correcta i l'eixida seria `1 - Ana` i `2 - Luis`. Eixa era la fallada intencionada: l'enunciat diu "3 errors de compilació i 1 de lògica", però només hi ha una falta de `;`. L'error "amagat" era la teua confiança en l'enunciat.

**El problema real que no es veu en executar**: `insertar()` concatena l'SQL amb els valors, cosa que és **SQL injection** en estat pur (punt 5). El programa "funciona" perquè les dades són de confiança, però si `nombre` vinguera de l'usuari, un `Ana'; DROP TABLE contactos; --` s'enduria la taula. La correcció professional és `PreparedStatement`:

```java
static void insertar(String nombre, String telefono) {
    String sql = "INSERT INTO contactos (nombre, telefono) VALUES (?, ?)";
    try (Connection con = DriverManager.getConnection(URL);
         PreparedStatement pstmt = con.prepareStatement(sql)) {
        pstmt.setString(1, nombre);
        pstmt.setString(2, telefono);
        pstmt.executeUpdate();
    } catch (SQLException e) {
        System.err.println("Error: " + e.getMessage());
    }
}
```

Eixida correcta amb el codi arreglat:

```
1 - Ana
2 - Luis
```

La lliçó real: **llig el codi, no l'enunciat.** Un bug pot ser que et diguen "hi ha 3 errors" i només n'hi haja 1: si busques els altres dos, et tornes boig. I l'error més perillós és el que no dona error: l'SQL injection es veu amb ulls d'arquitecte, no amb el compilador. Compta, verifica i confia en el que veus, no en la llegenda.

</details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-ho |
|---|---|
| 🏅 **El Conectador** | Obrir i tancar una `Connection` amb `try-with-resources` sense que escape ni una |
| 🏅 **El Missatger Segur** | Usar `PreparedStatement` per a una consulta amb dades d'usuari, sense concatenar res |
| 🏅 **El Caçador de Taules** | Detectar SQL injection en codi alié i explicar per què és perillosa |
| 🏅 **L'Arquitecte DAO** | Encapsular el CRUD en una interfície + implementació i usar-lo des d'un `main` net |
| 🏅 **El Banquer** | Muntar una transferència atòmica amb `commit()` i `rollback()` que mai deixa les dades a mitges |

---

## 🧠 Atreveix-te a pensar

1. **Sense executar:** què imprimeix este programa si la taula `alumnos` té 3 files?

```java
String sql = "SELECT nombre FROM alumnos WHERE edad > ?";
try (Connection con = DriverManager.getConnection(url);
     PreparedStatement pstmt = con.prepareStatement(sql)) {
    pstmt.setInt(1, 18);
    try (ResultSet rs = pstmt.executeQuery()) {
        while (rs.next()) {
            System.out.print(rs.getString("nombre") + " ");
        }
    }
}
```

2. **El detectiu del ResultSet:** un mètode torna un `ResultSet` al `main` i després tanca la connexió. Què passa quan el `main` intenta recórrer-lo?
3. **El consultor de preus:** tens una taula `productos(precio)` i vols actualitzar un preu concret. Quines dues coses són imprescindibles en l'`UPDATE`?
4. **Vertader o fals:** "un `PreparedStatement` permet usar `?` tant per a valors com per al nom de la taula".

<details>
<summary>💡 Solucions</summary>

1. **Els noms** dels alumnes majors de 18, separats per espai. El `?` s'ompli amb `setInt(1, 18)` i el bucle imprimeix cada `nombre`.
2. **El `ResultSet` mor.** Està lligat a la seua connexió: en tancar-la, deixa de ser vàlid i llança una `SQLException` al recórrer-lo. Per això els mètodes tornen `List<Alumno>` i no `ResultSet`.
3. **`WHERE id = ?`** (o el filtre que identifique el producte) i **comprovar les files afectades** amb `executeUpdate() > 0`. Sense `WHERE`, actualitzes tots els preus.
4. **Fals.** Els `?` només valen per a **valors**, mai per a identificadors (taula, columna). Estos es trien al codi.

</details>

---

## 🧩 Crucigrama de bits

```
Horizontal:
1. Mètode que avança a la següent fila d'un ResultSet (4 lletres)
3. Excepció checked que acompanya tot JDBC (13 lletres)
5. Mètode que confirma una transacció (6 lletres)
6. Patró que encapsula l'accés a dades (3 lletres)

Vertical:
2. El pont entre Java i la base de dades (4 lletres)
4. Objecte Java que representa una fila de la taula (4 lletres)
```

<details>
<summary>📝 Solucions</summary>

**Horizontal:** 1. NEXT · 3. SQLEXCEPTION · 5. COMMIT · 6. DAO
**Vertical:** 2. JDBC · 4. POJO

</details>

---

## 💬 Preguntes d'entrevista de treball

> Preguntes reals que et farien per a programador Java junior.

1. **"Explícam'ho, com si jo fóra la teua àvia, què és JDBC."**
2. **"Quina és la diferència entre `Statement` i `PreparedStatement`?"**
3. **"Què és l'SQL injection i com l'evites?"**
4. **"Què passa si no tanques una `Connection`?"**
5. **"Què és el patró DAO i per què s'usa?"**
6. **"Què són `commit` i `rollback` i quan els uses?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **És necessari `Class.forName()` per a carregar el controlador?**

No. Des de Java 6, els controladors JDBC 4.0 s'auto-descobrixen si són al classpath. Ho veuràs en tutorials antics, i no passa res si el poses: només és codi que ja no cal.

---

> ❓ **`Statement` s'usa encara?**

Està zombi. Si veus un `Statement` en codi real (que no siga una consulta literal o DDL), és bandera roja. Per a qualsevol consulta amb dades variables: `PreparedStatement`, sempre.

---

> ❓ **Puc compartir una `Connection` entre diversos fils?**

Tècnicament sí, pràcticament no. `Connection` no és *thread-safe*. En aplicacions amb fils s'usa un pool de connexions (HikariCP) i cada fil demana la seua.

---

> ❓ **DAO i Repository són el mateix?**

Quasi. El DAO està pegat a la base de dades (INSERT, SELECT). El Repository és més de domini (guardar, buscar). En projectes xicotets s'usen com a sinònims; en els grans conviuen.

---

## 🎬 Post-Crèdits

La programadora acaba el seu gestor de biblioteca: un `LibroDAO` amb el seu `PreparedStatement` en cada mètode, una transacció amb `commit` i `rollback` per als préstecs i un `config.properties` guardant la URL. Tot funciona. Fins que la directora li demana que els préstecs es consulten des del mòbil.

S'acosta CONRAD, el compilador cascarrabutxes, amb la seua tassa fumant.

**CONRAD:** — Has vist? Tens les dades en SQLite i només les lliges des de Java a la mateixa màquina. Per a consultar-les des d'un mòbil necessites que el teu programa **expose** eixa informació per la xarxa: una API. Algú li demana dades al teu servidor amb una petició HTTP, i el teu servidor respon amb JSON.

**Programadora:** — És a dir, que en comptes de connectar-me jo a la base de dades des de cada client, el client em parla a mi per la xarxa?

**CONRAD:** — *assentix* Exacte. El teu programa Java es convertix en l'intermediari: rep peticions, consulta la base de dades amb el JDBC que acables de dominar, i torna les dades. Primer vas servir dades des de la base; ara les serviràs per la web.

**PROXIMAMENT EN U14:** Servir i Consumir APIs amb Web. El moment en què el teu programa Java es posa un uniforme de cambrer: rep peticions HTTP i servix dades en JSON. 🌐

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/13-conexion-bases-datos) · **Anterior:** [08 · Bones pràctiques](/ApuntesProgramacion/va/13-conexion-bases-datos/08-buenas-practicas) · **Següent:** **[U14 · Servir i Consumir APIs amb Web](/ApuntesProgramacion/va/14-apis-web)**