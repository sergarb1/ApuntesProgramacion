---
title: "Boletín U13 — Extras"
description: "CodeWars y AceptaElReto para ir más allá del JDBC: SQL de verdad y algoritmos con datos"
---

# 📝 Boletín U13 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. Las soluciones están ocultas: agota tu pista antes de mirarlas.

---

## CodeWars

### 1. SQL Basics: Simple JOIN

Crea una consulta `SELECT` que devuelva todos los productos junto con la empresa que los fabrica. Tendrás que relacionar las tablas `products` y `companies` mediante la clave foránea `company_id`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/5802e32dd8c944e562000020)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

Un `INNER JOIN` sobre la clave foránea: `products.company_id = companies.id`. Selecciona las columnas que te pida el problema y cuida los alias.

</details>

<details>
<summary>🔄 Solución</summary>

```sql
SELECT p.name, c.name AS company_name
FROM products p
INNER JOIN companies c ON p.company_id = c.id;
```

El `JOIN` relaciona las dos tablas por la clave foránea y, en una sola consulta, tienes producto y empresa. Es el mismo concepto del punto 8 de la unidad: una consulta con `JOIN` donde no caben consultas en bucle.

</details>

---

### 2. SQL with Street Fighter: Total Wins

Es hora de decidir qué luchadores pasan a las semifinales del campeonato mundial de Street Fighter. Cada combate registra si el luchador ganó (1) o perdió (0), y el movimiento con el que terminó. Como los ataques ki han sido prohibidos, **no se cuentan** los combates terminados con Hadoken, Shouoken o Kikoken. Devuelve `name`, `won` y `lost` sumando las victorias y derrotas, ordena de más a menos victorias y devuelve los 6 mejores.

- [Enunciado en CodeWars](https://www.codewars.com/kata/5ab7a736edbcfc8e62000007)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

`GROUP BY` el nombre del luchador con `SUM(won)` y `SUM(lost)`. Excluye los movimientos prohibidos con `NOT IN ('Hadoken', 'Shouoken', 'Kikoken')` y ordena con `ORDER BY won DESC LIMIT 6`.

</details>

<details>
<summary>🔄 Solución</summary>

```sql
SELECT f.name, SUM(f.won) AS won, SUM(f.lost) AS lost
FROM fighters f
LEFT JOIN winning_moves m ON f.move_id = m.id
WHERE m.move NOT IN ('Hadoken', 'Shouoken', 'Kikoken')
GROUP BY f.name
ORDER BY won DESC
LIMIT 6;
```

`GROUP BY` agrupa los combates de cada luchador, `SUM` acumula victorias y derrotas, y el `WHERE` descarta los ataques prohibidos antes de agrupar. Es exactamente el tipo de consulta que podrías lanzar con un `PreparedStatement` contra la tabla `fighters`.

</details>

---

### 3. SQL Basics: Simple HAVING

Tienes una tabla `people` con `id`, `name` y `age`. Cuenta cuántas personas tienen la misma edad y devuelve **solo los grupos de edad con 10 o más personas**.

- [Enunciado en CodeWars](https://www.codewars.com/kata/58164ddf890632fa0f00011a)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

`GROUP BY` la columna `age` y cuenta con `COUNT(*)`. `WHERE` no vale para filtrar grupos: necesitas `HAVING COUNT(*) >= 10`, que se aplica después del agrupado.

</details>

<details>
<summary>🔄 Solución</summary>

```sql
SELECT age, COUNT(id) AS total_people
FROM people
GROUP BY age
HAVING COUNT(id) >= 10;
```

`GROUP BY age` crea un grupo por cada edad, `COUNT(id)` cuenta sus integrantes, y `HAVING` filtra los grupos que no alcanzan 10 personas. La diferencia con `WHERE`: `WHERE` filtra filas antes de agrupar, `HAVING` filtra grupos después.

</details>

---

### 4. SQL Basics: Group By Day

Tienes una tabla `orders` con `id`, `datetime` y `amount`. Cuenta cuántos pedidos hay **por día**, extrayendo la fecha del campo `datetime`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/5811597e9d278beb04000038)
- Dificultad: 5 kyu

<details>
<summary>💡 Pista</summary>

Extrae el día con la función `DATE(datetime)` y agrúpalo con `GROUP BY`. Cuenta con `COUNT(*)`. Es el `GROUP BY` de siempre, pero sobre una columna calculada.

</details>

<details>
<summary>🔄 Solución</summary>

```sql
SELECT DATE(datetime) AS day, COUNT(*) AS total
FROM orders
GROUP BY DATE(datetime);
```

`DATE(datetime)` recorta el `datetime` a solo la fecha, y `GROUP BY` agrupa todos los pedidos de ese día. Una columna calculada como alias: el mismo mecanismo que usarías con `ResultSetMetaData` para leerla después desde Java.

</details>

---

## AceptaElReto

### 5. 245 — ¿Quién gana la partida?

Un grupo de jugadores participa en un juego por turnos con números. Cada ronda, el jugador que acierta se descarta y el que falla pasa al **final de la cola** para volver a intentarlo. Simula las rondas y determina quién gana la partida.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=245)
- Dificultad: ⭐⭐⭐

<details>
<summary>💡 Pista</summary>

Simula los turnos con una `Queue<Integer>`: cada ronda, saca al primero con `poll()`, y si falla lo vuelves a meter con `offer()`. El que acierta sale para siempre. La cola encaja perfectamente con la estructura "quien falla, vuelve al final".

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;

public class QuienGana {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        // Leer participantes y datos del juego según el enunciado
        Queue<Integer> cola = new LinkedList<>();
        // ... rellenar la cola con los jugadores ...

        // while (cola.size() > 1) {
        //     int jugador = cola.poll();
        //     if (falla(jugador)) {
        //         cola.offer(jugador);   // vuelve al final
        //     }
        // }
        // System.out.println(cola.peek());
    }
}
```

La `LinkedList` como `Queue` es la protagonista: `poll()` saca al primero y `offer()` lo devuelve al final si falla. Los jugadores que aciertan salen para siempre, y el último que queda es el ganador. Estructura de datos (U10) al servicio del problema de turnos.

</details>

---

### 6. 424 — Billetes de autobús

Hay varias rutas de autobús entre dos ciudades, cada una con su hora de salida y de llegada. Quieres coger **el máximo número de autobuses posible** sin que se solapen (coger uno, bajarte, y poder subir a otro que salga después de llegar).

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=424)
- Dificultad: ⭐⭐

<details>
<summary>💡 Pista</summary>

Algoritmo voraz: ordena las rutas por **hora de llegada** y elige siempre la siguiente ruta que termine antes y que no se solape con la última elegida. Es el clásico problema de "selección de actividades".

</details>

<details>
<summary>🔄 Solución</summary>

```java
import java.util.*;

public class Billetes {
    static class Ruta implements Comparable<Ruta> {
        int salida, llegada;
        Ruta(int s, int l) { salida = s; llegada = l; }

        public int compareTo(Ruta o) {
            return Integer.compare(llegada, o.llegada); // ordena por llegada
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        // Leer rutas, ordenarlas y aplicar el voraz:
        // Collections.sort(rutas);
        // int ultima = Integer.MIN_VALUE, contador = 0;
        // for (Ruta r : rutas) {
        //     if (r.salida >= ultima) {
        //         contador++;
        //         ultima = r.llegada;
        //     }
        // }
        // System.out.println(contador);
    }
}
```

El truco voraz: ordenar por hora de llegada garantiza que siempre eliges la ruta que libera el día antes, dejando hueco para más autobuses. Una sola pasada con un contador y una variable `ultima`. Clásico de AceptaElReto: los datos se ordenan y la solución sale sola.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines el JDBC, vuelve a los problemas de AceptaElReto de unidades anteriores y reescríbelos guardando los datos de entrada en una tabla SQLite con `PreparedStatement`: te sorprenderá lo natural que resulta que tus algoritmos hablen con una base de datos. El material no se pierde: se reutiliza.