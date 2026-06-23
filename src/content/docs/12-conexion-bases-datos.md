---
title: "🗄️ Unidad 12: Conexión a Bases de Datos con JDBC"
---
🎯 **Objetivos de aprendizaje**
- Conectar Java a SQLite usando JDBC
- CRUD: INSERT, SELECT, UPDATE, DELETE con PreparedStatement
- Entender SQL Injection y cómo evitarla
- Aplicar el patrón DAO
- Manejar transacciones con commit y rollback

## ¿Qué es JDBC?

JDBC (Java Database Connectivity) es un conjunto de interfaces en `java.sql` que permiten a Java hablar con cualquier base de datos que tenga un driver JDBC.

> **💡 Consejo:** Piensa en JDBC como el USB de las bases de datos: da igual SQLite, MySQL o PostgreSQL. Si tienen driver JDBC, Java se conecta.

## Conexión a SQLite

SQLite es ideal para aprender: no necesita servidor, es un solo archivo.

### Los 5 Pasos

1. Cargar el driver
2. Establecer la conexión
3. Crear un Statement
4. Ejecutar la consulta
5. Procesar los resultados

**Bonus no opcional:** Cerrar todo.

### Dependencia Maven

```xml
<dependency>
    <groupId>org.xerial</groupId>
    <artifactId>sqlite-jdbc</artifactId>
    <version>3.45.1.0</version>
</dependency>
```

### Connection

SQLite no necesita usuario ni contraseña. La URL es un archivo local:

```java
String url = "jdbc:sqlite:instituto.db";
Connection con = DriverManager.getConnection(url);
```

> **📝 Nota:** SQLite crea el archivo automáticamente si no existe. No necesitas crear la BD aparte.

### Statement y ResultSet

```java
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM alumnos");

while (rs.next()) {
    System.out.println(rs.getInt("id") + ": " + rs.getString("nombre"));
}
```

`rs.next()` avanza a la siguiente fila. Devuelve `false` cuando no quedan más. El ResultSet empieza **antes** de la primera fila.

### executeQuery vs executeUpdate

| Método | Para | Devuelve |
|--------|------|----------|
| `executeQuery()` | SELECT | `ResultSet` |
| `executeUpdate()` | INSERT, UPDATE, DELETE | `int` (filas afectadas) |

> **⚠️ Advertencia:** Usar `executeQuery()` con un INSERT lanza excepción. Cada cosa en su sitio.

### Try-With-Resources

Desde Java 7, los recursos se cierran solos:

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

> **📝 Nota:** El orden de cierre es inverso al de apertura: ResultSet → Statement → Connection. Try-with-resources lo hace solo. Es mágico.

### SQLException

Es checked, te obliga a capturarla:

```java
catch (SQLException e) {
    System.err.println("Error: " + e.getMessage());
    System.err.println("Código: " + e.getErrorCode());
    System.err.println("Estado SQL: " + e.getSQLState());
}
```

> **💡 Consejo:** No hagas `catch (Exception e) {}` y te quedes tan pancho. Eso es tapar la luz de "check engine" con esparadrapo.

---

## CRUD con JDBC

CRUD = **C**reate, **R**ead, **U**pdate, **D**elete.

### La Tabla

```sql
CREATE TABLE contactos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    telefono TEXT,
    email TEXT
);
```

> **📝 Nota:** SQLite usa `INTEGER PRIMARY KEY AUTOINCREMENT` en lugar de `INT AUTO_INCREMENT`.

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
        System.err.println("Error al insertar: " + e.getMessage());
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
        System.err.println("Error al consultar: " + e.getMessage());
    }
    return contactos;
}
```

### Búsqueda con LIKE

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

> **💡 Consejo:** Devuelve `List<Contacto>` en lugar de `ResultSet`. El ResultSet está atado a la conexión. Si la cierras, el ResultSet muere. Mejor convierte a objetos Java y cierra todo.

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
        System.err.println("Error al actualizar: " + e.getMessage());
        return false;
    }
}
```

> **⚠️ Advertencia:** Sin `WHERE id = ?`, actualizas TODOS los contactos. 500 contactos llamados "John Doe". WHERE SIEMPRE.

### DELETE (Delete)

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

> **💡 Consejo:** Confirma con el usuario antes de borrar. El DELETE no tiene Ctrl+Z. Es para siempre. Como las decisiones en una película de terror.

---

## PreparedStatement y SQL Injection

Concatenar strings para construir SQL es PELIGROSO:

```java
// PELIGRO: esto es una bomba
String sql = "SELECT * FROM alumnos WHERE nombre = '" + inputUsuario + "'";
```

Si el usuario escribe `Luis'; DROP TABLE alumnos; --`, tu tabla `alumnos` se borra. Esto es **SQL Injection** y pasa de verdad.

> **⚠️ Advertencia:** NUNCA construyas SQL concatenando strings con datos del usuario. Es como dejar las llaves puestas con un cartel "PASE USTED".

### PreparedStatement al Rescate

```java
String sql = "SELECT * FROM alumnos WHERE nombre = ?";
PreparedStatement pstmt = conexion.prepareStatement(sql);
pstmt.setString(1, nombre);
ResultSet rs = pstmt.executeQuery();
```

Los `?` son placeholders posicionales (empiezan en 1):

| Tipo | Método |
|------|--------|
| String | `setString(i, valor)` |
| int | `setInt(i, valor)` |
| double | `setDouble(i, valor)` |
| boolean | `setBoolean(i, valor)` |
| Date | `setDate(i, valor)` (usa `java.sql.Date`) |
| null | `setNull(i, Types.TIPO)` |

> **💡 Consejo:** Para muchas consultas iguales, PreparedStatement puede ser MÁS RÁPIDO porque la BD compila la consulta una sola vez.

### La Historia de Bobby Tables

```
Madre: "He criado a mi hijo para que sea un programador cuidadoso,
        no un hacker que robe datos."
Hijo: "Hola, me llamo Robert'); DROP TABLE Students; --"
```

No seas Bobby Tables. Usa PreparedStatement.

### Guía de Placeholders

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

¿Ves qué limpio? No hay concatenación, no hay comillas escapadas, no hay riesgo de inyección. Solo `?` limpios y ordenados.

> **⭐ BE THE CODE, MY FRIEND: Tú Eres un PreparedStatement**
>
> > 🕶️ **Don Tip:** PreparedStatement previene inyección SQL porque separa el código SQL de los datos. Nunca concatenes strings en SQL.
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

## Patrón DAO

El **DAO (Data Access Object)** encapsula el acceso a la base de datos. Separamos la lógica de negocio del SQL.

### La Interfaz

```java
public interface ContactoDAO {
    void insertarContacto(Contacto c);
    List<Contacto> obtenerTodos();
    List<Contacto> buscarPorNombre(String nombre);
    boolean actualizarContacto(Contacto c);
    boolean eliminarContacto(int id);
}
```

### La Implementación

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

Los métodos son exactamente los que viste en la sección CRUD. El DAO los unifica bajo una misma interfaz.

> **📝 Nota:** DAO vs Repository: son casi lo mismo. DAO está más pegado a la BD (INSERT, SELECT). Repository es más de dominio (guardar, buscar). En proyectos pequeños se usan como sinónimos.

---

## Transacciones

A veces necesitas que varias operaciones ocurran todas juntas o ninguna. Como una transferencia bancaria.

### commit y rollback

```java
public void transferirContacto(int idOrigen, int idDestino) {
    String quitar = "UPDATE contactos SET grupo = 'vacio' WHERE id = ?";
    String poner = "UPDATE contactos SET grupo = 'destino' WHERE id = ?";

    try (Connection con = DriverManager.getConnection(URL)) {
        con.setAutoCommit(false);  // empezamos transacción

        try (PreparedStatement q = con.prepareStatement(quitar);
             PreparedStatement p = con.prepareStatement(poner)) {

            q.setInt(1, idOrigen);
            q.executeUpdate();

            if (idOrigen == idDestino)
                throw new SQLException("Destino inválido");

            p.setInt(1, idDestino);
            p.executeUpdate();

            con.commit();  // todo bien, confirmamos
            System.out.println("Transferencia OK");

        } catch (SQLException e) {
            con.rollback();  // algo falló, deshacemos todo
            System.err.println("Falló, todo deshecho: " + e.getMessage());
        }
    } catch (SQLException e) {
        System.err.println("Error de conexión: " + e.getMessage());
    }
}
```

> **⚠️ Advertencia:** Sin transacciones, si falla la segunda operación, la primera ya se ejecutó. El sistema queda inconsistente. Usa transacciones para operaciones atómicas (todo o nada). Como un puente que o está entero o no está.

### Savepoints

Puedes marcar puntos intermedios dentro de una transacción para no tener que deshacer todo si algo falla:

```java
con.setAutoCommit(false);
Savepoint sp = con.setSavepoint("despuesInsert");

// ... más operaciones ...

if (algoMal) {
    con.rollback(sp);  // vuelve al savepoint, no deshace todo
} else {
    con.commit();
}
```

---

## ⭐ BE THE CODE, MY FRIEND: Implementa un DAO Completo Desde Cero

> 🕶️ **Don Tip:** Un DAO encapsula el acceso a datos. Si cambias de SQLite a MySQL, solo cambias el DAO, el resto del código ni se entera.

Eres el arquitecto de una aplicación de gestión de biblioteca. Tienes estas entidades:

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

**Preguntas:**
1. ¿Cuántos DAOs crearías? ¿Uno por entidad (`LibroDAO`, `PrestamoDAO`) o uno solo genérico?
2. ¿Qué métodos tendría cada DAO?
3. ¿Dónde pondrías la lógica de "un libro no se puede prestar si ya está prestado"?
4. ¿Usarías transacciones para gestionar préstamos y devoluciones?

```
Usuario: Quiero añadir a "María".
Tú: PreparedStatement → INSERT → executeUpdate() → 1 fila.

Usuario: Búscame a María.
Tú: PreparedStatement → SELECT LIKE → ResultSet → List<Contacto>.

Usuario: Cambia el teléfono de María.
Tú: PreparedStatement → UPDATE WHERE id = ? → 1 fila.

Usuario: Borra a María.
Tú: ¿Seguro?
Usuario: Sí.
Tú: DELETE WHERE id = ? → 1 fila. Adiós, María.
Usuario: ¡Era broma!
Tú: El DELETE no tiene deshacer. Lo siento.
```

### 🥊 EL RING: Statement vs PreparedStatement

Dos formas de ejecutar SQL discuten.

**Statement:** «Yo soy el original. Sencillo, directo. `stmt.executeQuery("SELECT * FROM usuarios")`. ¡Para consultas simples soy perfecto!»

**PreparedStatement:** «Sí, pero concatenar strings en SQL es una bomba de relojería. Inyección SQL, errores de sintaxis con comillas... Yo separo el SQL de los datos con `?` y soy seguro.»

**Statement:** «Para una consulta fija, una sola vez, ¿para qué voy a preparar nada?»

**PreparedStatement:** «Además, yo cacheo el plan de ejecución. Si ejecutas la misma consulta varias veces con distintos parámetros, soy más rápido. Y en Java, casi siempre ejecutas la misma consulta con distintos valores.»

**Statement:** «Vale, pero yo valgo para DDL: CREATE TABLE, ALTER...»

**PreparedStatement:** «Cierto. Para DDL usa Statement. Para DML (SELECT, INSERT, UPDATE, DELETE) usa PreparedStatement. ¿Trato?»

**Statement:** «Trato.»

> 🕶️ **Don Tip:** Usa siempre PreparedStatement para consultas con datos de usuario. No es solo seguridad: es más rápido en consultas repetitivas y más legible.

## ¡No Hay Preguntas Tontas!

> **❓ ¡No Hay Preguntas Tontas!**
>
> **Q:** ¿Qué pasa si no cierro la conexión?
> **A:** Se queda abierta, consume memoria. Los servidores tienen un límite de conexiones simultáneas. Si llegas al límite, el próximo `getConnection()` casca con "Too many connections". Cierra siempre.
>
> **Q:** ¿Es necesario `Class.forName()` para cargar el driver?
> **A:** Desde Java 6 no hace falta. Pero lo verás en tutoriales antiguos. Si lo pones no pasa nada, si no lo pones tampoco.
>
> **Q:** ¿PreparedStatement es más lento que Statement?
> **A:** Para una consulta, igual. Para muchas iguales, PreparedStatement puede ser MÁS RÁPIDO porque la BD compila la consulta una vez.
>
> **Q:** ¿Puedo usar `?` para nombres de tabla o columna?
> **A:** No. `SELECT * FROM ?` no funciona. Los placeholders solo valen para valores, no para identificadores.
>
> **Q:** ¿Statement se usa todavía?
> **A:** Está zombi. Si ves un Statement en código real (que no sea una query literal), es bandera roja. PreparedStatement SIEMPRE.
>
> **Q:** ¿DAO y Repository son lo mismo?
> **A:** Casi. DAO está pegado a la BD (INSERT, SELECT). Repository es más de dominio (guardar, buscar). En proyectos pequeños se usan como sinónimos.
>
> **Q:** ¿Debo poner la URL de la BD en el código?
> **A:** No. Usa `config.properties` o variables de entorno. Las credenciales no van en el código. Es como llevar la contraseña del banco escrita en la frente.
>
> **Q:** ¿Y si cambio de BD, tengo que reescribir todo?
> **A:** Si usaste SQL estándar y JDBC, solo cambias el driver y la URL. Esa es la magia de JDBC.
>
> **Q:** ¿Puedo compartir una conexión entre varios hilos?
> **A:** Técnicamente sí, prácticamente no. Connection no es thread-safe. Usa un pool de conexiones (HikariCP) y cada hilo que pida la suya.

---

## Ejercicios Propuestos

1. **Conexión desde cero** — Crea una clase `TestConexion` que se conecte a una base de datos SQLite `test.db`, cree una tabla `alumnos(id INTEGER PRIMARY KEY, nombre TEXT, nota REAL)` e inserte 3 alumnos. Verifica que los datos están insertados.

2. **CRUD de estudiantes** — Implementa un DAO completo para `Estudiante` con: `insertar`, `listar`, `buscarPorId`, `actualizar`, `eliminar`. Usa `PreparedStatement` en todos.

3. **Transacción bancaria** — Simula una transferencia entre dos cuentas en una tabla `cuentas(id, titular, saldo)`. La transferencia debe ser atómica: si falla cualquier paso, haz `rollback()`.

4. **Consulta con JOIN** — Crea dos tablas relacionadas (`pedidos` y `clientes`). Escribe una consulta que muestre el nombre del cliente y el total de sus pedidos usando `JOIN`. Devuelve una lista de objetos `PedidoCliente`.

5. **Exportar a CSV** — Añade un método `exportarCSV(String archivo)` a tu DAO que lea todos los registros y los escriba en formato CSV con `try-with-resources`.

6. **DAO genérico** — Refactoriza tu DAO para que sea genérico: `public abstract class DAO<T>`. Implementa `EstudianteDAO extends DAO<Estudiante>`. ¿Cuánto código has reutilizado?

## Buenas Prácticas: El Decálogo del JDBC

1. **PreparedStatement siempre.** Nunca concatenes SQL.
2. **Try-with-resources.** Connection, Statement, ResultSet se cierran solos.
3. **No devuelvas ResultSet.** Devuelve listas de objetos.
4. **Captura SQLException con mensaje descriptivo.** No atrapes Exception a lo loco.
5. **Usa transacciones para operaciones múltiples.** Todo o nada.
6. **No expongas credenciales en el código.** Usa archivos de configuración.
7. **Comprueba filas afectadas.** `executeUpdate()` te dice si funcionó.
8. **No hagas consultas dentro de bucles.** Lentísimo. Una sola consulta basta.
9. **WHERE siempre en UPDATE y DELETE.** O pagas las consecuencias.
10. **Confirma antes de borrar.** El usuario siempre se equivoca.

### 🔮 EL ACERTIJO

Tienes dos tablas en SQLite: `usuarios(id, nombre, email)` y `pedidos(id, usuario_id, total)`.

Quieres obtener todos los usuarios que han hecho algún pedido con total superior a 100€. ¿Cuántas consultas SQL necesitas como mínimo? ¿Y si usas JOIN?

Pista: hay una diferencia entre "varias consultas en bucle" y "una consulta con JOIN".

> 🕶️ **Don Tip:** Una consulta con JOIN es UNA sola llamada a la base de datos. Hacer una consulta por cada usuario en un bucle es N+1 consultas, que es mucho más lento.

## Resumen Exprés

| Concepto | Analogía |
|----------|----------|
| JDBC | Traductor universal Java ↔ BD |
| Driver | El enchufe específico para cada BD |
| Connection | El cable telefónico |
| PreparedStatement | El mensajero seguro |
| ResultSet | La respuesta (tabla virtual) |
| executeQuery | Para SELECT |
| executeUpdate | Para INSERT/UPDATE/DELETE |
| commit / rollback | Transacciones (todo o nada) |
| DAO | Patrón que separa SQL del negocio |

**Siempre:**
1. Abre conexión
2. Crea PreparedStatement
3. Ejecuta consulta
4. Procesa resultados
5. Cierra todo (try-with-resources)

---

**RAs trabajados en esta unidad:**
- **RA9** - Bases de datos relacionales

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
