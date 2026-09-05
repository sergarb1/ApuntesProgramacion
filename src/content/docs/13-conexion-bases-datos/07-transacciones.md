---
title: "07 · Transacciones: commit, rollback y savepoints"
description: "Operaciones de todo o nada: setAutoCommit(false), commit para confirmar, rollback para deshacer y savepoints para no deshacerlo todo 🗄️🎭"
---

<p><small>Operaciones de todo o nada: setAutoCommit(false), commit para confirmar, rollback para deshacer y savepoints para no deshacerlo todo 🗄️🎭</small></p>

> 🗺️ **Estás en:** 🗄️ **U13 · Conexión a BD con JDBC** → 07 · Transacciones

---

## 📬 La idea en una frase

> **Una transacción agrupa varias operaciones en un "todo o nada": `setAutoCommit(false)` abre el paréntesis, `commit()` lo cierra confirmando, y `rollback()` lo cierra deshaciendo todo.**

Hasta ahora cada `executeUpdate()` se guardaba al momento. Pero ¿qué pasa cuando una operación depende de otra? Piensa en una transferencia bancaria: quitar 50 € de una cuenta y ponerlos en otra. Si la segunda operación falla, te quedas con 50 € volando en el limbo. Eso no puede pasar. Aquí entran las transacciones.

---

## 🎭 El problema: el limbo del dinero

Imagina estas dos operaciones:

```java
// Operación 1: quitar 50 € a Ana
stmt.executeUpdate("UPDATE cuentas SET saldo = saldo - 50 WHERE titular = 'Ana'");

// Operación 2: poner 50 € a Luis
stmt.executeUpdate("UPDATE cuentas SET saldo = saldo + 50 WHERE titular = 'Luis'");
```

Sin transacciones, cada `UPDATE` se confirma solo. Si la operación 2 lanza una `SQLException`, la 1 ya se ejecutó: Ana es más pobre y Luis no es más rico. El sistema queda **inconsistente**. Los datos ya no cuadran, y nadie sabe cómo arreglarlo.

> ⚠️ **Advertencia:** sin transacciones, si falla la segunda operación, la primera ya se ejecutó. El sistema queda inconsistente. Usa transacciones para operaciones **atómicas** (todo o nada): como un puente que o está entero o no está.

---

## 🔄 setAutoCommit(false): abrir el paréntesis

Por defecto, JDBC usa **auto-commit**: cada sentencia se confirma al momento. Para agrupar operaciones, lo desactivamos y decidimos nosotros cuándo se confirma:

```java
public void transferir(int idOrigen, int idDestino) {
    String quitar = "UPDATE cuentas SET saldo = saldo - 50 WHERE id = ?";
    String poner  = "UPDATE cuentas SET saldo = saldo + 50 WHERE id = ?";

    try (Connection con = DriverManager.getConnection(URL)) {
        con.setAutoCommit(false);   // abrimos la transacción

        try (PreparedStatement q = con.prepareStatement(quitar);
             PreparedStatement p = con.prepareStatement(poner)) {

            q.setInt(1, idOrigen);
            q.executeUpdate();

            if (idOrigen == idDestino) {
                throw new SQLException("Destino inválido: misma cuenta");
            }

            p.setInt(1, idDestino);
            p.executeUpdate();

            con.commit();           // todo bien: confirmamos
            System.out.println("Transferencia OK");

        } catch (SQLException e) {
            con.rollback();         // algo falló: deshacemos todo
            System.err.println("Falló, todo deshecho: " + e.getMessage());
        }
    } catch (SQLException e) {
        System.err.println("Error de conexión: " + e.getMessage());
    }
}
```

El flujo es claro: **abrir** con `setAutoCommit(false)`, hacer todas las operaciones, y al final **`commit()`** si todo fue bien o **`rollback()`** si algo falló. El `rollback()` está en el `catch` interno: cualquier `SQLException` de las dos operaciones lo dispara y la base de datos vuelve a como estaba.

> 💡 **Consejo:** el `setAutoCommit(false)` va antes de las operaciones, sobre la conexión. El `commit()` y el `rollback()` también son métodos de la `Connection`. Todo gira alrededor de ese objeto.

---

## 📍 Savepoints: no deshacerlo todo

A veces una transacción tiene varias fases y no quieres deshacer todo si falla la última. Un **savepoint** es una marca intermedia: puedes hacer `rollback` hasta ese punto y conservar lo anterior.

```java
con.setAutoCommit(false);

Savepoint sp = con.setSavepoint("despuesDeInsertar");
// ... más operaciones ...

if (algoMal) {
    con.rollback(sp);   // vuelve al savepoint, no deshace todo
} else {
    con.commit();       // todo bien
}
```

Es como en un videojuego: `setSavepoint` guarda la partida, `rollback(sp)` te devuelve a esa partida guardada en vez de empezar de cero, y `commit()` guarda el final definitivo. Útil cuando una transacción larga tiene una parte que sabes que siempre sale bien y otra que puede fallar.

> 📝 **Nota:** los savepoints se usan menos de lo que parece. El 90% de las veces te basta con `commit()`/`rollback()` en bloque. Pero saber que existen te ahorrará un susto el día que los necesites.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué método de `Connection` abre una transacción?
2. ¿Qué hace `commit()`? ¿Y `rollback()`?
3. ¿Dónde se suele poner el `rollback()` en un método típico?
4. ¿Qué te permite hacer un `Savepoint`?

<details>
<summary>🔄 Respuestas</summary>

1. `con.setAutoCommit(false)`. Con `true` (lo normal) cada sentencia se confirma sola.
2. `commit()` confirma todas las operaciones; `rollback()` las deshace todas.
3. En el `catch (SQLException e)` del bloque de operaciones: si algo falla, se deshace todo.
4. Hacer `rollback` hasta ese punto concreto en vez de deshacer toda la transacción.

</details>

---

## ✅ Resumen en 3 frases

1. Una **transacción** agrupa operaciones en un todo-o-nada: `setAutoCommit(false)` la abre, `commit()` la confirma y `rollback()` la deshace.
2. Sin transacciones, una operación que falla a medias deja los datos **inconsistentes** (como el dinero que desaparece del limbo).
3. Los **savepoints** marcan puntos intermedios para poder deshacer solo una parte de la transacción.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Transacción | Un grupo de operaciones que van juntas o no van |
> | `setAutoCommit(false)` | Abre la transacción: tú controlas el momento |
> | `commit()` | Confirmar todo: se guarda |
> | `rollback()` | Deshacer todo: como si no hubiera pasado |
> | `Savepoint` | Marca intermedia para deshacer solo hasta ahí |
> | Atómico | Todo o nada, sin estados a medias |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/13-conexion-bases-datos) · **Anterior:** [06 · El patrón DAO](/ApuntesProgramacion/13-conexion-bases-datos/06-pattern-dao) · **Siguiente:** [08 · Buenas prácticas](/ApuntesProgramacion/13-conexion-bases-datos/08-buenas-practicas)