---
title: "08 · Buenas prácticas: el decálogo del JDBC"
description: "Diez mandamientos para no morir en el intento: PreparedStatement siempre, try-with-resources, WHERE siempre y no devolver ResultSet 🗄️📜"
---

<p><small>Diez mandamientos para no morir en el intento: PreparedStatement siempre, try-with-resources, WHERE siempre y no devolver ResultSet 🗄️📜</small></p>

> 🗺️ **Estás en:** 🗄️ **U13 · Conexión a BD con JDBC** → 08 · Buenas prácticas

---

## 📬 La idea en una frase

> **Todo lo que has aprendido en esta unidad, resumido en 10 mandamientos: de "PreparedStatement siempre" a "confirma antes de borrar". Memorízalos y serás el alma de la oficina.**

Ya sabes conectar, consultar, hacer el CRUD, evitar la inyección, aplicar el DAO y gestionar transacciones. Este punto es el cierre de la teoría: la lista de cosas que los programadores veteranos aprendieron a base de sustos, y que tú puedes aprender en cinco minutos. Son los hábitos que separan a quien escribe JDBC de quien lo domestica.

---

## 📜 El decálogo del JDBC

1. **PreparedStatement siempre.** Nunca concatenes SQL. La SQL injection no es un mito: es Bobby Tables llamando a tu puerta.
2. **Try-with-resources.** `Connection`, `Statement` y `ResultSet` se cierran solos. Conexión abierta que no se cierra = servidor que se atraganta.
3. **No devuelvas `ResultSet`.** Devuelve listas de objetos (`List<Contacto>`). El `ResultSet` está atado a su conexión: cuando la cierras, muere con ella.
4. **Captura `SQLException` con mensaje descriptivo.** No atrapes `Exception` a lo loco y no te quedes en silencio. `e.getMessage()` es tu amigo.
5. **Usa transacciones para operaciones múltiples.** Todo o nada. Una transferencia no se hace a medias, y tus datos tampoco.
6. **No expongas credenciales en el código.** La URL y los datos de acceso van en un archivo de configuración (`config.properties`) o en variables de entorno, no en un `static final String` de la clase. Es como llevar la contraseña del banco escrita en la frente.
7. **Comprueba las filas afectadas.** `executeUpdate()` te dice si la operación funcionó (`> 0`). Ignorar ese valor es apostar a ciegas.
8. **No hagas consultas dentro de bucles.** Una consulta en un bucle que recorre mil elementos es mil viajes a la base de datos. Una sola consulta con `JOIN` basta. El bucle es para procesar resultados, no para hacer consultas.
9. **`WHERE` siempre en `UPDATE` y `DELETE`.** O pagas las consecuencias. Sin `WHERE`, actualizas o borras la tabla entera y no hay vuelta atrás.
10. **Confirma antes de borrar.** El usuario siempre se equivoca. Un `DELETE` no tiene Ctrl+Z.

> 💡 **Consejo:** los mandamientos 1, 2 y 9 son los que más vidas han salvado. Si memorizas solo tres, que sean esos. Los otros siete vienen de regalo.

---

## 🔮 El acertijo

Tienes dos tablas en SQLite: `usuarios(id, nombre, email)` y `pedidos(id, usuario_id, total)`.

Quieres obtener todos los usuarios que han hecho algún pedido con total superior a **100 €**. ¿Cuántas consultas SQL necesitas como mínimo si las haces "a lo tonto"? ¿Y si usas `JOIN`?

<details>
<summary>🔄 Solución</summary>

**A lo tonto (patrón N+1):** primero una consulta para listar todos los usuarios (1 consulta) y luego, para cada usuario, otra consulta que pregunte por sus pedidos (N consultas, una por usuario). En total, **N + 1** consultas: si tienes 1.000 usuarios, son 1.001 viajes a la base de datos. Lentísimo.

**Con `JOIN`:** una sola consulta. La base de datos relaciona las dos tablas internamente y te devuelve solo lo que necesitas.

```sql
SELECT DISTINCT u.nombre, u.email
FROM usuarios u
JOIN pedidos p ON p.usuario_id = u.id
WHERE p.total > 100;
```

**Una consulta, un viaje.** La lección del mandamiento 8: el bucle procesa resultados, pero la base de datos es quien debe hacer el trabajo sucio. Pregúntate siempre: ¿estoy haciendo N consultas donde cabría una?

</details>

> 🕶️ **Don Tip:** una consulta con `JOIN` es UNA sola llamada a la base de datos. Hacer una consulta por cada usuario en un bucle es el patrón N+1, el clásico error de rendimiento que cae en todas las entrevistas de trabajo.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué tres mandamientos son los más importantes según este punto?
2. ¿Por qué no conviene devolver un `ResultSet` desde un método?
3. ¿Dónde deben vivir las credenciales de la base de datos?
4. ¿Qué es el patrón N+1?

<details>
<summary>🔄 Respuestas</summary>

1. **PreparedStatement siempre**, **try-with-resources** y **WHERE siempre** en UPDATE/DELETE.
2. Porque el `ResultSet` está ligado a su conexión: al cerrarla, deja de ser válido. Mejor devolver `List<Contacto>`.
3. En un archivo de configuración (`config.properties`) o variables de entorno. Jamás en el código.
4. Hacer 1 consulta para listar y N consultas dentro de un bucle: N+1 viajes a la base de datos donde cabría una sola con `JOIN`.

</details>

---

## ✅ Resumen en 3 frases

1. El decálogo del JDBC son **10 hábitos** que te ahorran desastres: `PreparedStatement` siempre, `try-with-resources`, `WHERE` siempre y comprobar filas afectadas, entre otros.
2. Dos errores de rendimiento clásicos: **consultas en bucles** (patrón N+1, se arregla con `JOIN`) y **devolver `ResultSet`** (se arregla devolviendo listas de objetos).
3. La seguridad también es una buena práctica: las **credenciales nunca van en el código**, y los `DELETE` se **confirman** antes de ejecutarse.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Decálogo | Las 10 reglas de oro del JDBC |
> | Patrón N+1 | N consultas en un bucle donde cabría una |
> | `JOIN` | Relacionar dos tablas en una sola consulta |
> | Filas afectadas | El `int` de `executeUpdate()` que confirma el cambio |
> | `config.properties` | Archivo donde van la URL y las credenciales |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/13-conexion-bases-datos) · **Anterior:** [07 · Transacciones](/ApuntesProgramacion/13-conexion-bases-datos/07-transacciones) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/13-conexion-bases-datos/09-repaso-interactivo)