---
title: "04 · CRUD complet: inserir, llegir, actualitzar i esborrar"
description: "El CRUD complet amb JDBC: INSERT, SELECT, UPDATE i DELETE amb PreparedStatement, el POJO que guarda cada fila i el WHERE que et salva la vida 🗄️🔄"
---

<p><small>El CRUD complet amb JDBC: INSERT, SELECT, UPDATE i DELETE amb PreparedStatement, el POJO que guarda cada fila i el WHERE que et salva la vida 🗄️🔄</small></p>

> 🗺️ **Estàs en:** 🗄️ **U13 · Connexió a BD amb JDBC** → 04 · CRUD complet

---

## 📬 La idea en una frase

> **CRUD són les 4 operacions bàsiques de qualsevol base de dades — Create, Read, Update, Delete — i amb JDBC es traduïxen en `INSERT`, `SELECT`, `UPDATE` i `DELETE` usant `executeUpdate()` per a les que modifiquen i `executeQuery()` per a les que consulten.**

Ja saps connectar i consultar. Ara toca la rutina de tota aplicació amb base de dades: **inserir, llegir, actualitzar i esborrar**. És el pa de cada dia. Ací anem a construir l'exemple complet amb una taula `contactos`, un POJO (objecte Java, dels que vas conéixer a la U07) i els quatre mètodes. Prepara la cafetera.

---

## 🧱 La taula

Primer, la base de dades necessita una taula. Este SQL es pot executar una volta des de qualsevol client SQLite (o amb un `Statement` i `executeUpdate`, que també val):

```sql
CREATE TABLE contactos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    telefono TEXT,
    email TEXT
);
```

> 📝 **Nota:** SQLite usa `INTEGER PRIMARY KEY AUTOINCREMENT` on MySQL usa `INT AUTO_INCREMENT`. El `id` s'assigna sol: tu no el tries, la base de dades el genera.

---

## 🧍 El POJO

Cada fila de la taula es convertix en un objecte Java. És la classe de sempre, amb atributs privats, getters i setters (la vas vore a la U07 i la U08):

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

L'estratègia de tota la unitat: la base de dades torna files, i el codi les convertix en objectes `Contacto`. Així el teu programa treballa amb objectes de veritat, no amb `ResultSet` solts.

---

## ✍️ Create (INSERT)

Inserir un contacte. Fixa't en els `?`: són placeholders que s'omplen amb `setXxx`, començant en 1. Més sobre ells al punt 5; de moment, fia-te'n:

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

No li diem a la base de dades quin `id` usar: el genera ella sola. Si volgueres saber quin ha sigut, ho veuràs al butlletí avançat amb `RETURN_GENERATED_KEYS`.

---

## 📖 Read (SELECT)

Llegir tots els contactes. La consulta torna files i les convertim en una `List<Contacto>` (col·leccions, U10, fent de les seues):

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

> 💡 **Consell:** torna `List<Contacto>`, mai un `ResultSet`. El `ResultSet` està lligat a la seua connexió: si tanques la connexió, el `ResultSet` mor. Convertix a objectes Java i tanca-ho tot tranquil.

### La cerca amb LIKE

I si volem buscar per una part del nom? Ahí entra `LIKE` amb comodins `%`:

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

El `%` davant i darrere fa que coincidisca amb qualsevol contacte que continga eixe text. Fixa't que els `%` van dins del **valor**, no en l'SQL: la concatenació ací és segura.

---

## ✏️ Update (UPDATE)

Actualitzar un contacte. Ací apareix l'invitat estrella: el `WHERE`. Sense ell, actualitzes TOTS els contactes de la taula:

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

> ⚠️ **Advertència:** sense `WHERE id = ?`, actualitzes TOTS els contactes. 500 contactes anomenats "John Doe" en un obrir i tancar d'ulls. **WHERE SEMPRE** en UPDATE i DELETE. És la primera norma del club de les bases de dades.

`executeUpdate()` torna el nombre de files afectades: si és `> 0`, s'ha actualitzat alguna cosa. Comprovar-ho és gratis i et diu si l'operació va funcionar de veritat.

---

## 🗑️ Delete (DELETE)

Esborrar un contacte pel seu id. La mateixa història: `WHERE`, o crema la taula:

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

> 💡 **Consell:** confirma amb l'usuari abans d'esborrar. El `DELETE` no té Ctrl+Z: és per a sempre. Com les decisions en una pel·lícula de terror, no es poden desfer.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin mètode usa l'INSERT, `executeQuery()` o `executeUpdate()`?
2. Què passa si executes un `UPDATE` sense `WHERE`?
3. Per què convé tornar `List<Contacto>` i no un `ResultSet`?
4. En `LIKE ?`, on van els `%`?

<details>
<summary>🔄 Respostes</summary>

1. `executeUpdate()` — torna les files afectades.
2. Actualitza **totes** les files de la taula. Per això `WHERE` sempre.
3. Perquè el `ResultSet` està lligat a la connexió: en tancar-la, mor. Millor objectes Java.
4. Dins del **valor** (`"%" + nombre + "%"`), no en l'SQL.

</details>

---

## ✅ Resum en 3 frases

1. El **CRUD** són les 4 operacions bàsiques: `INSERT` (create), `SELECT` (read), `UPDATE` (update) i `DELETE` (delete).
2. Cada fila del `ResultSet` es convertix en un **objecte Java** (`Contacto`) i les consultes tornen `List<Contacto>` per a no dependre de la connexió oberta.
3. **`WHERE` sempre** en `UPDATE` i `DELETE`, i comprova les **files afectades** que torna `executeUpdate()` per a saber si l'operació va tindre efecte.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | CRUD | Create, Read, Update, Delete: l'abecedari de les dades |
> | POJO | Objecte Java que representa una fila de la taula |
> | `LIKE ?` | Cerca per coincidència parcial amb `%` com a comodí |
> | `WHERE` | El filtre que t'estalvia actualitzar/esborrar la taula sencera |
> | Files afectades | El `int` que torna `executeUpdate()` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/13-conexion-bases-datos) · **Anterior:** [03 · Statement i ResultSet](/ApuntesProgramacion/va/13-conexion-bases-datos/03-statement-resultset) · **Següent:** [05 · PreparedStatement i SQL injection](/ApuntesProgramacion/va/13-conexion-bases-datos/05-preparedstatement)