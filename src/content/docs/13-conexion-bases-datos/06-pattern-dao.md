---
title: "06 · El patrón DAO"
description: "El patrón DAO: una interfaz que promete y una implementación que cumple, para que el SQL no se cuele jamás en tu lógica de negocio 🗄️🏗️"
---

<p><small>El patrón DAO: una interfaz que promete y una implementación que cumple, para que el SQL no se cuele jamás en tu lógica de negocio 🗄️🏗️</small></p>

> 🗺️ **Estás en:** 🗄️ **U13 · Conexión a BD con JDBC** → 06 · El patrón DAO

---

## 📬 La idea en una frase

> **El patrón DAO (Data Access Object) encapsula todo el SQL en una clase separada, detrás de una interfaz: tu programa habla con objetos y métodos (`insertarContacto`, `obtenerTodos`...), no con sentencias SQL sueltas.**

En el punto 4 escribimos los cuatro métodos del CRUD. Si los dejas sueltos por el programa, el SQL se pega a la lógica de negocio como chicle al zapato: cada vez que cambie la base de datos, hay que repasar el código entero buscando `getConnection`. El patrón **DAO** pone orden. Es el tema de las interfaces que viste en la U08, aplicado al acceso a datos.

---

## 🏛️ La idea: separar el SQL del negocio

¿Qué significa "separar la lógica de negocio del SQL"? Que tu programa haga esto:

```java
ContactoDAO dao = new ContactoDAOImpl();
List<Contacto> contactos = dao.obtenerTodos();     // no hay ni un SELECT aquí
Contacto c = new Contacto("María", "666000111", "maria@ies.edu");
dao.insertarContacto(c);                            // tampoco
```

Y que **todo** el `jdbc:sqlite:`, el `PreparedStatement` y el `ResultSet` viva dentro de una sola clase. Si mañana cambias de SQLite a MySQL, solo tocas esa clase. El resto del programa no se entera de nada.

> 💡 **Consejo:** esto es programar contra una interfaz, que viste en la U08: declaras el tipo `ContactoDAO` y creas la implementación concreta `ContactoDAOImpl`. Si la implementación cambia, tu código no se mueve.

---

## 📜 La interfaz: el contrato

La interfaz declara **qué** se puede hacer, sin decir **cómo**:

```java
public interface ContactoDAO {
    void insertarContacto(Contacto c);
    List<Contacto> obtenerTodos();
    List<Contacto> buscarPorNombre(String nombre);
    boolean actualizarContacto(Contacto c);
    boolean eliminarContacto(int id);
}
```

Cinco métodos, cinco operaciones. El que llama a la interfaz no sabe (ni le importa) si detrás hay SQLite, MySQL o un fichero de texto. El contrato es lo único que importa.

> 📝 **Nota:** los métodos son exactamente los que escribimos en el punto 4. El DAO los unifica bajo una misma interfaz: eso es todo el secreto.

---

## 🏭 La implementación: quien pone las manos en la masa

La implementación concreta contiene la URL, el SQL y el manejo de `SQLException`. Aquí es donde vive todo lo de los puntos anteriores:

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
            System.err.println("Error al insertar: " + e.getMessage());
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
            System.err.println("Error al consultar: " + e.getMessage());
        }
        return contactos;
    }

    // buscarPorNombre, actualizarContacto y eliminarContacto siguen el mismo patrón
}
```

Fíjate en lo que **no** hay aquí fuera: ni un `SELECT` en el `main`, ni una URL de base de datos perdida entre la lógica. Todo el sucio trabajo del SQL está encerrado en su celda.

> 💡 **Consejo:** es habitual tener un DAO por entidad: `AlumnoDAO`, `ContactoDAO`, `LibroDAO`... Una tabla, un POJO y un DAO forman el trío clásico de las aplicaciones con base de datos.

---

## 🤔 DAO vs Repository

Dos términos que se parecen tanto que a veces se usan como sinónimos. La diferencia fina:

- **DAO** está pegado a la base de datos: habla de `INSERT`, `SELECT`, `UPDATE` y `DELETE`.
- **Repository** está más cerca del dominio: habla de `guardar`, `buscar`, `borrar`, sin mencionar SQL.

En proyectos pequeños se usan indistintamente. En los grandes, el Repository puede usar varios DAOs por debajo. Si alguien te lo pregunta en una entrevista, con esta respuesta sobrevives.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** un DAO encapsula el acceso a datos. Si cambias de SQLite a MySQL, solo cambia el DAO; la lógica de negocio ni se entera.

**Ejercicio: la biblioteca**

Eres la arquitecta o el arquitecto de una aplicación de gestión de biblioteca. Tienes estas entidades:

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

**Preguntas para pensar (responde antes de mirar):**

1. ¿Cuántos DAOs crearías: uno por entidad (`LibroDAO`, `PrestamoDAO`) o uno solo genérico?
2. ¿Qué métodos tendría cada DAO?
3. ¿Dónde pondrías la regla de "un libro no se puede prestar si ya está prestado"?
4. ¿Usarías transacciones para gestionar préstamos y devoluciones?

<details>
<summary>🔄 Solución orientativa</summary>

1. **Uno por entidad**: `LibroDAO` y `PrestamoDAO`. Cada uno con su POJO y su tabla. Un DAO genérico con `<T>` existe, pero para dos entidades añade abstracción sin beneficio.
2. `LibroDAO`: `listar`, `buscarPorIsbn`, `insertar`, `actualizar`, `eliminar`. `PrestamoDAO`: `listar`, `buscarPorSocio`, `insertar` (registrar préstamo), `actualizar` (devolución).
3. En la **lógica de negocio**, no en el DAO. El DAO pregunta "¿está disponible?", y el servicio de préstamos decide si se presta. El DAO no toma decisiones de negocio.
4. **Sí.** Prestar un libro implica marcar `disponible = false` y crear el préstamo: dos operaciones que deben ir juntas (transacciones, punto 7) o no ir ninguna.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué contiene la interfaz del DAO: el "qué" o el "cómo"?
2. Si cambias de SQLite a MySQL, ¿qué clase tocas y cuál no?
3. ¿Dónde vive el `jdbc:sqlite:...` en un programa bien hecho?
4. ¿DAO y Repository son exactamente lo mismo?

<details>
<summary>🔄 Respuestas</summary>

1. El **qué**: las operaciones disponibles. El cómo (SQL) vive en la implementación.
2. Tocas la **implementación** (`...DAOImpl`); la interfaz y el resto del programa no se mueven.
3. Dentro de la **implementación del DAO**, como una constante privada.
4. No. DAO está pegado a la base de datos (INSERT/SELECT); Repository es más de dominio (guardar/buscar). En proyectos pequeños se usan como sinónimos.

</details>

---

## ✅ Resumen en 3 frases

1. El **patrón DAO** separa el acceso a datos de la lógica de negocio: una **interfaz** con las operaciones y una **implementación** con el SQL.
2. El resto del programa habla con métodos (`obtenerTodos()`, `insertarContacto(...)`) y nunca ve un `SELECT` ni una URL de conexión.
3. Si cambias de base de datos, solo cambia la **implementación**: esa es la magia de programar contra la interfaz.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | DAO | Data Access Object: el patrón que encierra el SQL |
> | Interfaz | El contrato: qué se puede hacer |
> | Implementación | La clase concreta: cómo se hace (SQL, URL...) |
> | Lógica de negocio | Las reglas del problema, sin SQL |
> | Repository | Primo del DAO, más cercano al dominio |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/13-conexion-bases-datos) · **Anterior:** [05 · PreparedStatement y SQL injection](/ApuntesProgramacion/13-conexion-bases-datos/05-preparedstatement) · **Siguiente:** [07 · Transacciones](/ApuntesProgramacion/13-conexion-bases-datos/07-transacciones)