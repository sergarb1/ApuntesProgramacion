---
title: "🗄️ Unitat 12: Connexió a Bases de Dades amb JDBC"
---
🎯 **Objectius d'aprenentatge**
- Connectar Java a SQLite usant JDBC
- CRUD: INSERT, SELECT, UPDATE, DELETE amb PreparedStatement
- Entendre SQL Injection i com evitar-la
- Aplicar el patró DAO
- Gestionar transaccions amb commit i rollback

## Què és JDBC?

JDBC (Java Database Connectivity) és un conjunt d'interfícies en `java.sql` que permeten a Java parlar amb qualsevol base de dades que tinga un driver JDBC.

> **💡 Consell:** Pensa en JDBC com l'USB de les bases de dades: tant li fa SQLite, MySQL o PostgreSQL. Si tenen driver JDBC, Java es connecta.

## Connexió a SQLite

SQLite és ideal per a aprendre: no necessita servidor, és un sol fitxer.

### Els 5 Passos

1. Carregar el driver
2. Establir la connexió
3. Crear un Statement
4. Executar la consulta
5. Processar els resultats

**Bonus no opcional:** Tancar-ho tot.

### Dependència Maven

```xml
<dependency>
    <groupId>org.xerial</groupId>
    <artifactId>sqlite-jdbc</artifactId>
    <version>3.45.1.0</version>
</dependency>
```

### Connection

SQLite no necessita usuari ni contrasenya. La URL és un fitxer local:

```java
String url = "jdbc:sqlite:instituto.db";
Connection con = DriverManager.getConnection(url);
```

> **📝 Nota:** SQLite crea el fitxer automàticament si no existeix. No necessites crear la BD a part.

### Statement i ResultSet

```java
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM alumnos");

while (rs.next()) {
    System.out.println(rs.getInt("id") + ": " + rs.getString("nombre"));
}
```

`rs.next()` avança a la següent fila. Torna `false` quan no queden més. El ResultSet comença **abans** de la primera fila.

### executeQuery vs executeUpdate

| Mètode | Per a | Torna |
|--------|-------|-------|
| `executeQuery()` | SELECT | `ResultSet` |
| `executeUpdate()` | INSERT, UPDATE, DELETE | `int` (files afectades) |

> **⚠️ Advertència:** Usar `executeQuery()` amb un INSERT llança excepció. Cada cosa al seu lloc.

### Try-With-Resources

Des de Java 7, els recursos es tanquen sols:

```java
try (Connection con = DriverManager.getConnection(url);
     Statement stmt = con.createStatement();
     ResultSet rs = stmt.executeQuery("SELECT * FROM alumnos")) {

    while (rs.next()) {
        System.out.printf("%d: %s%n", rs.getInt("id"), rs.getString("nombre"));
    }
} catch (SQLException e) {
    System.err.println("Error BD: " + e.getMessage());
}
```

> **📝 Nota:** L'ordre de tancament és invers al d'obertura: ResultSet → Statement → Connection. Try-with-resources ho fa sol. És màgic.

### SQLException

És checked, t'obliga a capturar-la:

```java
catch (SQLException e) {
    System.err.println("Error: " + e.getMessage());
    System.err.println("Codi: " + e.getErrorCode());
    System.err.println("Estat SQL: " + e.getSQLState());
}
```

> **💡 Consell:** No faces `catch (Exception e) {}` i et quedes tan ample. Això és tapar la llum de "check engine" amb esparadrap.

---

## CRUD amb JDBC

CRUD = **C**reate, **R**ead, **U**pdate, **D**elete.

### La Taula

```sql
CREATE TABLE contactos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    telefono TEXT,
    email TEXT
);
```

> **📝 Nota:** SQLite usa `INTEGER PRIMARY KEY AUTOINCREMENT` en lloc de `INT AUTO_INCREMENT`.

### El POJO

```java
public class Contacto {
    private int id;
    private String nombre;
    private String telefono;
    private String email;

    public Contacto() {}
    public Contacto(String nombre, String telefono, String email) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.email = email;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    @Override
    public String toString() {
        return id + " - " + nombre + " (" + telefono + ")";
    }
}
```

### INSERT (Create)

```java
public void insertarContacto(Contacto c) {
    String sql = "INSERT INTO contactos (nombre, telefono, email) VALUES (?, ?, ?)";
    try (Connection con = DriverManager.getConnection(URL);
         PreparedStatement pstmt = con.prepareStatement(sql)) {
        pstmt.setString(1, c.getNombre());
        pstmt.setString(2, c.getTelefono());
        pstmt.setString(3, c.getEmail());
        pstmt.executeUpdate();
    } catch (SQLException e) {
        System.err.println("Error en inserir: " + e.getMessage());
    }
}
```

### SELECT (Read)

```java
public List<Contacto> obtenerTodos() {
    List<Contacto> contactos = new ArrayList<>();
    String sql = "SELECT * FROM contactos ORDER BY nombre";
    try (Connection con = DriverManager.getConnection(URL);
         PreparedStatement pstmt = con.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery()) {
        while (rs.next()) {
            Contacto c = new Contacto(
                rs.getString("nombre"),
                rs.getString("telefono"),
                rs.getString("email")
            );
            c.setId(rs.getInt("id"));
            contactos.add(c);
        }
    } catch (SQLException e) {
        System.err.println("Error en consultar: " + e.getMessage());
    }
    return contactos;
}
```

### Cerca amb LIKE

```java
public List<Contacto> buscarPorNombre(String nombre) {
    List<Contacto> contactos = new ArrayList<>();
    String sql = "SELECT * FROM contactos WHERE nombre LIKE ?";
    try (Connection con = DriverManager.getConnection(URL);
         PreparedStatement pstmt = con.prepareStatement(sql)) {
        pstmt.setString(1, "%" + nombre + "%");
        try (ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Contacto c = new Contacto(
                    rs.getString("nombre"),
                    rs.getString("telefono"),
                    rs.getString("email")
                );
                c.setId(rs.getInt("id"));
                contactos.add(c);
            }
        }
    } catch (SQLException e) {
        System.err.println("Error en buscar: " + e.getMessage());
    }
    return contactos;
}
```

> **💡 Consell:** Torna `List<Contacto>` en lloc de `ResultSet`. El ResultSet està lligat a la connexió. Si la tanques, el ResultSet mor. Millor convertix a objectes Java i tanca-ho tot.

### UPDATE (Update)

```java
public boolean actualizarContacto(Contacto c) {
    String sql = "UPDATE contactos SET nombre = ?, telefono = ?, email = ? WHERE id = ?";
    try (Connection con = DriverManager.getConnection(URL);
         PreparedStatement pstmt = con.prepareStatement(sql)) {
        pstmt.setString(1, c.getNombre());
        pstmt.setString(2, c.getTelefono());
        pstmt.setString(3, c.getEmail());
        pstmt.setInt(4, c.getId());
        return pstmt.executeUpdate() > 0;
    } catch (SQLException e) {
        System.err.println("Error en actualitzar: " + e.getMessage());
        return false;
    }
}
```

> **⚠️ Advertència:** Sense `WHERE id = ?`, actualitzes TOTS els contactes. 500 contactes anomenats "John Doe". WHERE SEMPRE.

### DELETE (Delete)

```java
public boolean eliminarContacto(int id) {
    String sql = "DELETE FROM contactos WHERE id = ?";
    try (Connection con = DriverManager.getConnection(URL);
         PreparedStatement pstmt = con.prepareStatement(sql)) {
        pstmt.setInt(1, id);
        return pstmt.executeUpdate() > 0;
    } catch (SQLException e) {
        System.err.println("Error en eliminar: " + e.getMessage());
        return false;
    }
}
```

> **💡 Consell:** Confirma amb l'usuari abans de borrar. El DELETE no té Ctrl+Z. És per a sempre. Com les decisions en una pel·lícula de terror.

---

## PreparedStatement i SQL Injection

Concatenar strings per a construir SQL és PERILLÓS:

```java
// PERILL: això és una bomba
String sql = "SELECT * FROM alumnos WHERE nombre = '" + inputUsuario + "'";
```

Si l'usuari escriu `Luis'; DROP TABLE alumnos; --`, la teua taula `alumnos` es borra. Açò és **SQL Injection** i passa de veritat.

> **⚠️ Advertència:** MAI construïscues SQL concatenant strings amb dades de l'usuari. És com deixar les claus posades amb un cartell "PASSE VOSTÉ".

### PreparedStatement al Rescat

```java
String sql = "SELECT * FROM alumnos WHERE nombre = ?";
PreparedStatement pstmt = conexion.prepareStatement(sql);
pstmt.setString(1, nombre);
ResultSet rs = pstmt.executeQuery();
```

Els `?` són placeholders posicionals (comencen en 1):

| Tipus | Mètode |
|-------|--------|
| String | `setString(i, valor)` |
| int | `setInt(i, valor)` |
| double | `setDouble(i, valor)` |
| boolean | `setBoolean(i, valor)` |
| Date | `setDate(i, valor)` (usa `java.sql.Date`) |
| null | `setNull(i, Types.TIPO)` |

> **💡 Consell:** Per a moltes consultes iguals, PreparedStatement pot ser MÉS RÀPID perquè la BD compila la consulta una sola vegada.

### La Història de Bobby Tables

```
Madre: "He criat al meu fill perquè siga un programador acurat,
        no un hacker que robe dades."
Fill: "Hola, em dic Robert'); DROP TABLE Students; --"
```

No sigues Bobby Tables. Usa PreparedStatement.

### Guia de Placeholders

```java
String sql = "SELECT * FROM alumnos WHERE curso = ? AND edad > ? ORDER BY nombre";
try (PreparedStatement pstmt = conexion.prepareStatement(sql)) {
    pstmt.setString(1, "DAM");
    pstmt.setInt(2, 18);
    try (ResultSet rs = pstmt.executeQuery()) {
        while (rs.next()) {
            System.out.println(rs.getString("nombre"));
        }
    }
}
```

¿Veu qué net? No hi ha concatenació, no hi ha cometes escapades, no hi ha risc d'injecció. Només `?` nets i ordenats.

> **⭐ BE THE CODE, MY FRIEND: Tu Eres un PreparedStatement**
>
> > 🕶️ **Don Tip:** PreparedStatement prevé l'SQL injection perquè separa el codi SQL de les dades. Mai concatenes strings en SQL.
>
> ```
> Java: Oye, necesito ejecutar "SELECT * FROM productos WHERE precio < ? AND categoria = ?"
> Tú: Dame los valores.
> Java: setDouble(1, 50.0); setString(2, "informatica")
> Tú: Voy a la BD. Le paso la consulta ya montada y escapada. Sin riesgo.
> BD: Aquí tienes los resultados.
> Tú: Toma, Java. Un ResultSet limpito.
> ```

---

## Patró DAO

El **DAO (Data Access Object)** encapsula l'accés a la base de dades. Separem la lògica de negoci del SQL.

### La Interfície

```java
public interface ContactoDAO {
    void insertarContacto(Contacto c);
    List<Contacto> obtenerTodos();
    List<Contacto> buscarPorNombre(String nombre);
    boolean actualizarContacto(Contacto c);
    boolean eliminarContacto(int id);
}
```

### La Implementació

```java
public class ContactoDAOImpl implements ContactoDAO {
    private static final String URL = "jdbc:sqlite:contactos.db";

    @Override
    public void insertarContacto(Contacto c) { ... }

    @Override
    public List<Contacto> obtenerTodos() { ... }

    @Override
    public List<Contacto> buscarPorNombre(String nombre) { ... }

    @Override
    public boolean actualizarContacto(Contacto c) { ... }

    @Override
    public boolean eliminarContacto(int id) { ... }
}
```

Els mètodes són exactament els que vas veure en la secció CRUD. El DAO els unifica davall d'una mateixa interfície.

> **📝 Nota:** DAO vs Repository: són quasi el mateix. DAO està més pegat a la BD (INSERT, SELECT). Repository és més de domini (guardar, buscar). En projectes xicotets s'usen com a sinònims.

---

## Transaccions

De vegades necessites que diverses operacions ocorreguen totes juntes o cap. Com una transferència bancària.

### commit i rollback

```java
public void transferirContacto(int idOrigen, int idDestino) {
    String quitar = "UPDATE contactos SET grupo = 'vacio' WHERE id = ?";
    String poner = "UPDATE contactos SET grupo = 'destino' WHERE id = ?";

    try (Connection con = DriverManager.getConnection(URL)) {
        con.setAutoCommit(false);  // comencem transacció

        try (PreparedStatement q = con.prepareStatement(quitar);
             PreparedStatement p = con.prepareStatement(poner)) {

            q.setInt(1, idOrigen);
            q.executeUpdate();

            if (idOrigen == idDestino)
                throw new SQLException("Destí invàlid");

            p.setInt(1, idDestino);
            p.executeUpdate();

            con.commit();  // tot bé, confirmem
            System.out.println("Transferència OK");

        } catch (SQLException e) {
            con.rollback();  // alguna cosa va fallar, desfem tot
            System.err.println("Va fallar, tot desfet: " + e.getMessage());
        }
    } catch (SQLException e) {
        System.err.println("Error de connexió: " + e.getMessage());
    }
}
```

> **⚠️ Advertència:** Sense transaccions, si falla la segona operació, la primera ja es va executar. El sistema queda inconsistent. Usa transaccions per a operacions atòmiques (tot o res). Com un pont que o està sencer o no està.

### Savepoints

Pots marcar punts intermedis dins d'una transacció per a no haver de desfer-ho tot si alguna cosa falla:

```java
con.setAutoCommit(false);
Savepoint sp = con.setSavepoint("despuesInsert");

// ... més operacions ...

if (algoMal) {
    con.rollback(sp);  // torna al savepoint, no desfà tot
} else {
    con.commit();
}
```

---

## ⭐ BE THE CODE, MY FRIEND: Implementa un DAO Complet Des de Zero

> 🕶️ **Don Tip:** Un DAO encapsula l'accés a dades. Si canvies de SQLite a MySQL, només canvia el DAO, la resta del codi ni se n'assabenta.

Eres l'arquitecte d'una aplicació de gestió de biblioteca. Tens estes entitats:

```java
class Libro {
    String isbn;
    String titulo;
    String autor;
    boolean disponible;
}

class Prestamo {
    int id;
    String isbn;
    String socio;
    LocalDate fechaPrestamo;
    LocalDate fechaDevolucion;
}
```

**Preguntes:**
1. Quants DAOs crearies? Un per entitat (`LibroDAO`, `PrestamoDAO`) o un de sol genèric?
2. Quins mètodes tindria cada DAO?
3. On posaries la lògica de "un llibre no es pot prestar si ja està prestat"?
4. Usaries transaccions per a gestionar préstecs i devolucions?

```
Usuari: Vull afegir a "Maria".
Tu: PreparedStatement → INSERT → executeUpdate() → 1 fila.

Usuari: Busca'm a Maria.
Tu: PreparedStatement → SELECT LIKE → ResultSet → List<Contacto>.

Usuari: Canvia el telèfon de Maria.
Tu: PreparedStatement → UPDATE WHERE id = ? → 1 fila.

Usuari: Borra a Maria.
Tu: Segur?
Usuari: Sí.
Tu: DELETE WHERE id = ? → 1 fila. Adéu, Maria.
Usuari: Era broma!
Tu: El DELETE no té desfer. Ho sent.
```

### 🥊 EL RING: Statement vs PreparedStatement

Dos formes d'executar SQL discutiXen.

**Statement:** «Jo soc l'original. Senzill, directe. `stmt.executeQuery("SELECT * FROM usuarios")`. Per a consultes simples soc perfecte!»

**PreparedStatement:** «Sí, però concatenar strings en SQL és una bomba de rellotgeria. Injecció SQL, errors de sintaxi amb cometes... Jo separo l'SQL de les dades amb `?` i soc segur.»

**Statement:** «Per a una consulta fixa, una sola vegada, per què he de preparar res?»

**PreparedStatement:** «A més, jo faig cache del pla d'execució. Si executes la mateixa consulta diverses voltes amb diferents paràmetres, soc més ràpid. I en Java, quasi sempre executes la mateixa consulta amb diferents valors.»

**Statement:** «Val, però jo servisc per a DDL: CREATE TABLE, ALTER...»

**PreparedStatement:** «Cert. Per a DDL usa Statement. Per a DML (SELECT, INSERT, UPDATE, DELETE) usa PreparedStatement. Tracte?»

**Statement:** «Tracte.»

> 🕶️ **Don Tip:** Usa sempre PreparedStatement per a consultes amb dades d'usuari. No és només seguretat: és més ràpid en consultes repetitives i més llegible.

## ¡No Hay Preguntas Tontas!

> **❓ ¡No Hay Preguntas Tontas!**
>
> **Q:** Què passa si no tanque la connexió?
> **A:** Es queda oberta, consumix memòria. Els servidors tenen un límit de connexions simultànies. Si arribes al límit, el pròxim `getConnection()` casca amb "Too many connections". Tanca sempre.
>
> **Q:** És necessari `Class.forName()` per a carregar el driver?
> **A:** Des de Java 6 no cal. Però ho veuràs en tutorials antics. Si ho poses no passa res, si no ho poses tampoc.
>
> **Q:** PreparedStatement és més lent que Statement?
> **A:** Per a una consulta, igual. Per a moltes iguals, PreparedStatement pot ser MÉS RÀPID perquè la BD compila la consulta una vegada.
>
> **Q:** Puc usar `?` per a noms de taula o columna?
> **A:** No. `SELECT * FROM ?` no funcion. Els placeholders només valen per a valors, no per a identificadors.
>
> **Q:** Statement s'usa encara?
> **A:** Està zombi. Si veus un Statement en codi real (que no siga una query literal), és bandera roja. PreparedStatement SEMPRE.
>
> **Q:** DAO i Repository són el mateix?
> **A:** Quasi. DAO està pegat a la BD (INSERT, SELECT). Repository és més de domini (guardar, buscar). En projectes xicotets s'usen com a sinònims.
>
> **Q:** He de posar la URL de la BD en el codi?
> **A:** No. Usa `config.properties` o variables d'entorn. Les credencials no van en el codi. És com portar la contrasenya del banc escrita en el front.
>
> **Q:** I si canvie de BD, he de reescriure-ho tot?
> **A:** Si vas usar SQL estàndard i JDBC, només canvies el driver i la URL. Eixa és la màgia de JDBC.
>
> **Q:** Puc compartir una connexió entre diversos fils?
> **A:** Tècnicament sí, pràcticament no. Connection no és thread-safe. Usa un pool de connexions (HikariCP) i cada fil que demane la seua.

---

## Exercicis Proposats

1. **Connexió des de zero** — Crea una classe `TestConnexio` que es connecte a SQLite `test.db`, cree una taula `alumnes(id INTEGER PRIMARY KEY, nom TEXT, nota REAL)` i inserisca 3 alumnes.

2. **CRUD d'estudiants** — Implementa un DAO complet per a `Estudiant` amb: `insertar`, `listar`, `buscarPerId`, `actualitzar`, `eliminar`. Usa `PreparedStatement`.

3. **Transacció bancària** — Simula una transferència entre dos comptes en una taula `comptes(id, titular, saldo)`. La transferència ha de ser atòmica: si falla, fes `rollback()`.

4. **Consulta amb JOIN** — Crea dos taules relacionades (`comandes` i `clients`). Escriu una consulta JOIN que mostre el nom del client i el total de les seues comandes.

5. **Exportar a CSV** — Afig un mètode `exportarCSV(String archivo)` al teu DAO que llegisca tots els registres i els escriga en CSV amb `try-with-resources`.

6. **DAO genèric** — Refactoritza el teu DAO per a que siga genèric: `public abstract class DAO<T>`. Implementa `EstudiantDAO extends DAO<Estudiant>`.

## Bones Pràctiques: El Decàleg del JDBC

1. **PreparedStatement sempre.** Mai concatenes SQL.
2. **Try-with-resources.** Connection, Statement, ResultSet es tanquen sols.
3. **No tornes ResultSet.** Torna llistes d'objectes.
4. **Captura SQLException amb missatge descriptiu.** No atrapes Exception a la babalà.
5. **Usa transaccions per a operacions múltiples.** Tot o res.
6. **No exposes credencials en el codi.** Usa fitxers de configuració.
7. **Comprova files afectades.** `executeUpdate()` et diu si va funcionar.
8. **No faces consultes dins de bucles.** Lentíssim. Una sola consulta basta.
9. **WHERE sempre en UPDATE i DELETE.** O pagues les conseqüències.
10. **Confirma abans de borrar.** L'usuari sempre s'equivoca.

### 🔮 L'ENIGMA

Tens dues taules en SQLite: `usuarios(id, nombre, email)` i `pedidos(id, usuario_id, total)`.

Vols obtindre tots els usuaris que han fet algun pedido amb total superior a 100€. Quantes consultes SQL necessites com a mínim? I si uses JOIN?

Pista: hi ha una diferència entre "diverses consultes en bucle" i "una consulta amb JOIN".

> 🕶️ **Don Tip:** Una consulta amb JOIN és UNA sola crida a la base de dades. Fer una consulta per cada usuari en un bucle és N+1 consultes, que és molt més lent.

## Resum Exprés

| Concepte | Analogia |
|----------|----------|
| JDBC | Traductor universal Java ↔ BD |
| Driver | L'endoll específic per a cada BD |
| Connection | El cable telefònic |
| PreparedStatement | El missatger segur |
| ResultSet | La resposta (taula virtual) |
| executeQuery | Per a SELECT |
| executeUpdate | Per a INSERT/UPDATE/DELETE |
| commit / rollback | Transaccions (tot o res) |
| DAO | Patró que separa SQL del negoci |

**Sempre:**
1. Obri connexió
2. Crea PreparedStatement
3. Executa consulta
4. Processa resultats
5. Tanca-ho tot (try-with-resources)

---

**RAs treballats en esta unitat:**
- **RA9** - Bases de dades relacionals

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
