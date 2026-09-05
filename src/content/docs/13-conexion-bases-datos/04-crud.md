---
title: "04 · CRUD completo: insertar, leer, actualizar y borrar"
description: "El CRUD completo con JDBC: INSERT, SELECT, UPDATE y DELETE con PreparedStatement, el POJO que guarda cada fila y el WHERE que te salva la vida 🗄️🔄"
---

<p><small>El CRUD completo con JDBC: INSERT, SELECT, UPDATE y DELETE con PreparedStatement, el POJO que guarda cada fila y el WHERE que te salva la vida 🗄️🔄</small></p>

> 🗺️ **Estás en:** 🗄️ **U13 · Conexión a BD con JDBC** → 04 · CRUD completo

---

## 📬 La idea en una frase

> **CRUD son las 4 operaciones básicas de cualquier base de datos — Create, Read, Update, Delete — y con JDBC se traducen en `INSERT`, `SELECT`, `UPDATE` y `DELETE` usando `executeUpdate()` para las que modifican y `executeQuery()` para las que consultan.**

Ya sabes conectar y consultar. Ahora toca la rutina de toda aplicación con base de datos: **insertar, leer, actualizar y borrar**. Es el pan de cada día. Aquí vamos a construir el ejemplo completo con una tabla `contactos`, un POJO (objeto Java, de los que conociste en la U07) y los cuatro métodos. Prepara la cafetera.

---

## 🧱 La tabla

Primero, la base de datos necesita una tabla. Este SQL se puede ejecutar una vez desde cualquier cliente SQLite (o con un `Statement` y `executeUpdate`, que también vale):

```sql
CREATE TABLE contactos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    telefono TEXT,
    email TEXT
);
```

> 📝 **Nota:** SQLite usa `INTEGER PRIMARY KEY AUTOINCREMENT` donde MySQL usa `INT AUTO_INCREMENT`. El `id` se asigna solo: tú no lo eliges, la base de datos lo genera.

---

## 🧍 El POJO

Cada fila de la tabla se convierte en un objeto Java. Es la clase de siempre, con atributos privados, getters y setters (la viste en la U07 y la U08):

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

La estrategia de toda la unidad: la base de datos devuelve filas, y el código las convierte en objetos `Contacto`. Así tu programa trabaja con objetos de verdad, no con `ResultSet` sueltos.

---

## ✍️ Create (INSERT)

Insertar un contacto. Fíjate en los `?`: son placeholders que se rellenan con `setXxx`, empezando en 1. Más sobre ellos en el punto 5; de momento, fíate de ellos:

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
        System.err.println("Error al insertar: " + e.getMessage());
    }
}
```

No le decimos a la base de datos qué `id` usar: lo genera ella sola. Si quisieras saber cuál ha sido, lo verás en el boletín avanzado con `RETURN_GENERATED_KEYS`.

---

## 📖 Read (SELECT)

Leer todos los contactos. La consulta devuelve filas y las convertimos en una `List<Contacto>` (colecciones, U10, haciendo de las suyas):

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
        System.err.println("Error al consultar: " + e.getMessage());
    }
    return contactos;
}
```

> 💡 **Consejo:** devuelve `List<Contacto>`, nunca un `ResultSet`. El `ResultSet` está atado a su conexión: si cierras la conexión, el `ResultSet` muere. Convierte a objetos Java y cierra todo tranquilo.

### La búsqueda con LIKE

¿Y si queremos buscar por una parte del nombre? Ahí entra `LIKE` con comodines `%`:

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
        System.err.println("Error al buscar: " + e.getMessage());
    }
    return contactos;
}
```

El `%` delante y detrás hace que coincida con cualquier contacto que contenga ese texto. Nota que los `%` van dentro del **valor**, no en el SQL: la concatenación aquí es segura.

---

## ✏️ Update (UPDATE)

Actualizar un contacto. Aquí aparece el invitado estrella: el `WHERE`. Sin él, actualizas TODOS los contactos de la tabla:

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
        System.err.println("Error al actualizar: " + e.getMessage());
        return false;
    }
}
```

> ⚠️ **Advertencia:** sin `WHERE id = ?`, actualizas TODOS los contactos. 500 contactos llamados "John Doe" en un abrir y cerrar de ojos. **WHERE SIEMPRE** en UPDATE y DELETE. Es la primera norma del club de las bases de datos.

`executeUpdate()` devuelve el número de filas afectadas: si es `> 0`, se actualizó algo. Comprobarlo es gratis y te dice si la operación funcionó de verdad.

---

## 🗑️ Delete (DELETE)

Borrar un contacto por su id. La misma historia: `WHERE`, o arde la tabla:

```java
public boolean eliminarContacto(int id) {
    String sql = "DELETE FROM contactos WHERE id = ?";
    try (Connection con = DriverManager.getConnection(URL);
         PreparedStatement pstmt = con.prepareStatement(sql)) {
        pstmt.setInt(1, id);
        return pstmt.executeUpdate() > 0;
    } catch (SQLException e) {
        System.err.println("Error al eliminar: " + e.getMessage());
        return false;
    }
}
```

> 💡 **Consejo:** confirma con el usuario antes de borrar. El `DELETE` no tiene Ctrl+Z: es para siempre. Como las decisiones en una película de terror, no se pueden deshacer.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué método usa el INSERT, `executeQuery()` o `executeUpdate()`?
2. ¿Qué pasa si ejecutas un `UPDATE` sin `WHERE`?
3. ¿Por qué conviene devolver `List<Contacto>` y no un `ResultSet`?
4. En `LIKE ?`, ¿dónde van los `%`?

<details>
<summary>🔄 Respuestas</summary>

1. `executeUpdate()` — devuelve las filas afectadas.
2. Actualiza **todas** las filas de la tabla. Por eso `WHERE` siempre.
3. Porque el `ResultSet` está atado a la conexión: al cerrarla, muere. Mejor objetos Java.
4. Dentro del **valor** (`"%" + nombre + "%"`), no en el SQL.

</details>

---

## ✅ Resumen en 3 frases

1. El **CRUD** son las 4 operaciones básicas: `INSERT` (create), `SELECT` (read), `UPDATE` (update) y `DELETE` (delete).
2. Cada fila del `ResultSet` se convierte en un **objeto Java** (`Contacto`) y las consultas devuelven `List<Contacto>` para no depender de la conexión abierta.
3. **`WHERE` siempre** en `UPDATE` y `DELETE`, y comprueba las **filas afectadas** que devuelve `executeUpdate()` para saber si la operación tuvo efecto.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | CRUD | Create, Read, Update, Delete: el abecedario de los datos |
> | POJO | Objeto Java que representa una fila de la tabla |
> | `LIKE ?` | Búsqueda por coincidencia parcial con `%` como comodín |
> | `WHERE` | El filtro que te evita actualizar/borrar la tabla entera |
> | Filas afectadas | El `int` que devuelve `executeUpdate()` |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/13-conexion-bases-datos) · **Anterior:** [03 · Statement y ResultSet](/ApuntesProgramacion/13-conexion-bases-datos/03-statement-resultset) · **Siguiente:** [05 · PreparedStatement y SQL injection](/ApuntesProgramacion/13-conexion-bases-datos/05-preparedstatement)