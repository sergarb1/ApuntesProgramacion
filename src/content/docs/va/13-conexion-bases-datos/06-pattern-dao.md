---
title: "06 · El patró DAO"
description: "El patró DAO: una interfície que promet i una implementació que complix, perquè l'SQL no es cole mai en la teua lògica de negoci 🗄️🏗️"
---

<p><small>El patró DAO: una interfície que promet i una implementació que complix, perquè l'SQL no es cole mai en la teua lògica de negoci 🗄️🏗️</small></p>

> 🗺️ **Estàs en:** 🗄️ **U13 · Connexió a BD amb JDBC** → 06 · El patró DAO

---

## 📬 La idea en una frase

> **El patró DAO (Data Access Object) encapsula tot l'SQL en una classe separada, darrere d'una interfície: el teu programa parla amb objectes i mètodes (`insertarContacto`, `obtenerTodos`...), no amb sentències SQL soltes.**

Al punt 4 vam escriure els quatre mètodes del CRUD. Si els deixes solts pel programa, l'SQL s'enganxa a la lògica de negoci com un xicle a la sabata: cada volta que canvie la base de dades, cal repassar el codi sencer buscant `getConnection`. El patró **DAO** posa ordre. És el tema de les interfícies que vas vore a la U08, aplicat a l'accés a dades.

---

## 🏛️ La idea: separar l'SQL del negoci

Què vol dir "separar la lògica de negoci de l'SQL"? Que el teu programa faça això:

```java
ContactoDAO dao = new ContactoDAOImpl();
List<Contacto> contactos = dao.obtenerTodos();     // no hi ha ni un SELECT ací
Contacto c = new Contacto("María", "666000111", "maria@ies.edu");
dao.insertarContacto(c);                            // tampoc
```

I que **tot** el `jdbc:sqlite:`, el `PreparedStatement` i el `ResultSet` visca dins d'una sola classe. Si demà canvies de SQLite a MySQL, només toques eixa classe. La resta del programa no se n'assabenta de res.

> 💡 **Consell:** això és programar contra una interfície, que vas vore a la U08: declares el tipus `ContactoDAO` i crees la implementació concreta `ContactoDAOImpl`. Si la implementació canvia, el teu codi no es mou.

---

## 📜 La interfície: el contracte

La interfície declara **què** es pot fer, sense dir **com**:

```java
public interface ContactoDAO {
    void insertarContacto(Contacto c);
    List<Contacto> obtenerTodos();
    List<Contacto> buscarPorNombre(String nombre);
    boolean actualizarContacto(Contacto c);
    boolean eliminarContacto(int id);
}
```

Cinc mètodes, cinc operacions. El que crida la interfície no sap (ni li importa) si darrere hi ha SQLite, MySQL o un fitxer de text. El contracte és l'única cosa que importa.

> 📝 **Nota:** els mètodes són exactament els que vam escriure al punt 4. El DAO els unifica davall d'una mateixa interfície: això és tot el secret.

---

## 🏭 La implementació: qui posa les mans a la pasta

La implementació concreta conté la URL, l'SQL i el maneig de `SQLException`. Ací és on viu tot el dels punts anteriors:

```java
public class ContactoDAOImpl implements ContactoDAO {
    private static final String URL = "jdbc:sqlite:contactos.db";

    @Override
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

    @Override
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
                    rs.getString("email"));
                c.setId(rs.getInt("id"));
                contactos.add(c);
            }
        } catch (SQLException e) {
            System.err.println("Error en consultar: " + e.getMessage());
        }
        return contactos;
    }

    // buscarPorNombre, actualizarContacto i eliminarContacto seguixen el mateix patró
}
```

Fixa't en el que **no** hi ha ací fora: ni un `SELECT` en el `main`, ni una URL de base de dades perduda entre la lògica. Tot el treball brut de l'SQL està tancat a la seua cel·la.

> 💡 **Consell:** és habitual tindre un DAO per entitat: `AlumnoDAO`, `ContactoDAO`, `LibroDAO`... Una taula, un POJO i un DAO formen el trio clàssic de les aplicacions amb base de dades.

---

## 🤔 DAO vs Repository

Dos termes que s'assemblen tant que de vegades s'usen com a sinònims. La diferència fina:

- **DAO** està pegat a la base de dades: parla de `INSERT`, `SELECT`, `UPDATE` i `DELETE`.
- **Repository** està més prop del domini: parla de `guardar`, `buscar`, `esborrar`, sense mencionar SQL.

En projectes xicotets s'usen indistintament. En els grans, el Repository pot usar diversos DAOs per davall. Si algú t'ho pregunta en una entrevista, amb esta resposta sobrevius.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** un DAO encapsula l'accés a dades. Si canvies de SQLite a MySQL, només canvia el DAO; la lògica de negoci ni se n'assabenta.

**Exercici: la biblioteca**

Eres l'arquitecta o l'arquitecte d'una aplicació de gestió de biblioteca. Tens estes entitats:

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

**Preguntes per a pensar (respon abans de mirar):**

1. Quants DAOs crearíes: un per entitat (`LibroDAO`, `PrestamoDAO`) o un de sol genèric?
2. Quins mètodes tindria cada DAO?
3. On posaries la regla de "un llibre no es pot prestar si ja està prestat"?
4. Usaries transaccions per a gestionar préstecs i devolucions?

<details>
<summary>🔄 Solució orientativa</summary>

1. **Un per entitat**: `LibroDAO` i `PrestamoDAO`. Cadascun amb el seu POJO i la seua taula. Un DAO genèric amb `<T>` existix, però per a dues entitats afegix abstracció sense benefici.
2. `LibroDAO`: `listar`, `buscarPerIsbn`, `insertar`, `actualitzar`, `eliminar`. `PrestamoDAO`: `listar`, `buscarPerSoci`, `insertar` (registrar préstec), `actualitzar` (devolució).
3. A la **lògica de negoci**, no al DAO. El DAO pregunta "està disponible?", i el servei de préstecs decidix si es presta. El DAO no pren decisions de negoci.
4. **Sí.** Prestar un llibre implica marcar `disponible = false` i crear el préstec: dues operacions que han d'anar juntes (transaccions, punt 7) o no anar-ne cap.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què conté la interfície del DAO: el "què" o el "com"?
2. Si canvies de SQLite a MySQL, quina classe toques i quina no?
3. On viu el `jdbc:sqlite:...` en un programa ben fet?
4. DAO i Repository són exactament el mateix?

<details>
<summary>🔄 Respostes</summary>

1. El **què**: les operacions disponibles. El com (SQL) viu a la implementació.
2. Toques la **implementació** (`...DAOImpl`); la interfície i la resta del programa no es mouen.
3. Dins de la **implementació del DAO**, com una constant privada.
4. No. DAO està pegat a la base de dades (INSERT/SELECT); Repository és més de domini (guardar/buscar). En projectes xicotets s'usen com a sinònims.

</details>

---

## ✅ Resum en 3 frases

1. El **patró DAO** separa l'accés a dades de la lògica de negoci: una **interfície** amb les operacions i una **implementació** amb l'SQL.
2. La resta del programa parla amb mètodes (`obtenerTodos()`, `insertarContacto(...)`) i no veu mai un `SELECT` ni una URL de connexió.
3. Si canvies de base de dades, només canvia la **implementació**: eixa és la màgia de programar contra la interfície.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | DAO | Data Access Object: el patró que tanca l'SQL |
> | Interfície | El contracte: què es pot fer |
> | Implementació | La classe concreta: com es fa (SQL, URL...) |
> | Lògica de negoci | Les regles del problema, sense SQL |
> | Repository | Cosí del DAO, més prop del domini |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/13-conexion-bases-datos) · **Anterior:** [05 · PreparedStatement i SQL injection](/ApuntesProgramacion/va/13-conexion-bases-datos/05-preparedstatement) · **Següent:** [07 · Transaccions](/ApuntesProgramacion/va/13-conexion-bases-datos/07-transacciones)