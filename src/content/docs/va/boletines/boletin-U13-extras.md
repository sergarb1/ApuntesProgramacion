---
title: "Butlletí U13 — Extres"
description: "CodeWars i AceptaElReto per a anar més enllà del JDBC: SQL de veritat i algoritmes amb dades"
---

# 📝 Butlletí U13 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes. Les solucions estan amagades: esgota la teua pista abans de mirar-les.

---

## CodeWars

### 1. SQL Basics: Simple JOIN

Crea una consulta `SELECT` que torne tots els productes juntament amb l'empresa que els fabrica. Hauràs de relacionar les taules `products` i `companies` mitjançant la clau forana `company_id`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/5802e32dd8c944e562000020)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Un `INNER JOIN` sobre la clau forana: `products.company_id = companies.id`. Selecciona les columnes que et demane el problema i cuida els àlies.

</details>

<details>
<summary>🔄 Solució</summary>

```sql
SELECT p.name, c.name AS company_name
FROM products p
INNER JOIN companies c ON p.company_id = c.id;
```

El `JOIN` relaciona les dues taules per la clau forana i, en una sola consulta, tens producte i empresa. És el mateix concepte del punt 8 de la unitat: una consulta amb `JOIN` on no caben consultes en bucle.

</details>

---

### 2. SQL with Street Fighter: Total Wins

És hora de decidir quins lluitadors passen a les semifinals del campionat mundial de Street Fighter. Cada combat registra si el lluitador va guanyar (1) o va perdre (0), i el moviment amb què va acabar. Com que els atacs ki han sigut prohibits, **no es compten** els combats acabats amb Hadoken, Shouoken o Kikoken. Torna `name`, `won` i `lost` sumant les victòries i derrotes, ordena de més a menys victòries i torna els 6 millors.

- [Enunciat en CodeWars](https://www.codewars.com/kata/5ab7a736edbcfc8e62000007)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

`GROUP BY` el nom del lluitador amb `SUM(won)` i `SUM(lost)`. Exclou els moviments prohibits amb `NOT IN ('Hadoken', 'Shouoken', 'Kikoken')` i ordena amb `ORDER BY won DESC LIMIT 6`.

</details>

<details>
<summary>🔄 Solució</summary>

```sql
SELECT f.name, SUM(f.won) AS won, SUM(f.lost) AS lost
FROM fighters f
LEFT JOIN winning_moves m ON f.move_id = m.id
WHERE m.move NOT IN ('Hadoken', 'Shouoken', 'Kikoken')
GROUP BY f.name
ORDER BY won DESC
LIMIT 6;
```

`GROUP BY` agrupa els combats de cada lluitador, `SUM` acumula victòries i derrotes, i el `WHERE` descarta els atacs prohibits abans d'agrupar. És exactament el tipus de consulta que podries llançar amb un `PreparedStatement` contra la taula `fighters`.

</details>

---

### 3. SQL Basics: Simple HAVING

Tens una taula `people` amb `id`, `name` i `age`. Compta quantes persones tenen la mateixa edat i torna **només els grups d'edat amb 10 o més persones**.

- [Enunciat en CodeWars](https://www.codewars.com/kata/58164ddf890632fa0f00011a)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

`GROUP BY` la columna `age` i compta amb `COUNT(*)`. `WHERE` no val per a filtrar grups: necessites `HAVING COUNT(*) >= 10`, que s'aplica després del agrupament.

</details>

<details>
<summary>🔄 Solució</summary>

```sql
SELECT age, COUNT(id) AS total_people
FROM people
GROUP BY age
HAVING COUNT(id) >= 10;
```

`GROUP BY age` crea un grup per cada edat, `COUNT(id)` compta els seus integrants, i `HAVING` filtra els grups que no arriben a 10 persones. La diferència amb `WHERE`: `WHERE` filtra files abans d'agrupar, `HAVING` filtra grups després.

</details>

---

### 4. SQL Basics: Group By Day

Tens una taula `orders` amb `id`, `datetime` i `amount`. Compta quants pedidos hi ha **per dia**, extraient la data del camp `datetime`.

- [Enunciat en CodeWars](https://www.codewars.com/kata/5811597e9d278beb04000038)
- Dificultat: 5 kyu

<details>
<summary>💡 Pista</summary>

Extrau el dia amb la funció `DATE(datetime)` i agrupa'l amb `GROUP BY`. Compta amb `COUNT(*)`. És el `GROUP BY` de sempre, però sobre una columna calculada.

</details>

<details>
<summary>🔄 Solució</summary>

```sql
SELECT DATE(datetime) AS day, COUNT(*) AS total
FROM orders
GROUP BY DATE(datetime);
```

`DATE(datetime)` retalla el `datetime` fins a només la data, i `GROUP BY` agrupa tots els pedidos d'eixe dia. Una columna calculada com a àlies: el mateix mecanisme que usaríes amb `ResultSetMetaData` per a llegir-la després des de Java.

</details>

---

## AceptaElReto

### 5. 245 — Qui guanya la partida?

Un grup de jugadors participa en un joc per torns amb números. Cada ronda, el jugador que encerta es descarta i el que falla passa al **final de la cua** per a tornar-ho a intentar. Simula les rondes i determina qui guanya la partida.

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=245)
- Dificultat: ⭐⭐⭐

<details>
<summary>💡 Pista</summary>

Simula els torns amb una `Queue<Integer>`: cada ronda, trau el primer amb `poll()`, i si falla el tornes a ficar amb `offer()`. El que encerta ix per sempre. La cua encaixa perfectament amb l'estructura "qui falla, torna al final".

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;

public class QuiGuanya {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        // Llegir participants i dades del joc segons l'enunciat
        Queue<Integer> cua = new LinkedList<>();
        // ... omplir la cua amb els jugadors ...

        // while (cua.size() > 1) {
        //     int jugador = cua.poll();
        //     if (falla(jugador)) {
        //         cua.offer(jugador);   // torna al final
        //     }
        // }
        // System.out.println(cua.peek());
    }
}
```

La `LinkedList` com a `Queue` és la protagonista: `poll()` trau el primer i `offer()` el torna al final si falla. Els jugadors que encerten ixen per sempre, i l'últim que queda és el guanyador. Estructura de dades (U10) al servei del problema de torns.

</details>

---

### 6. 424 — Bitllets d'autobús

Hi ha diverses rutes d'autobús entre dues ciutats, cadascuna amb la seua hora d'eixida i d'arribada. Vols agafar **el màxim nombre d'autobusos possible** sense que se superposen (agafar-ne un, baixar-te, i poder pujar a un altre que isca després d'arribar).

- [Enunciat en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=424)
- Dificultat: ⭐⭐

<details>
<summary>💡 Pista</summary>

Algoritme voraç: ordena les rutes per **hora d'arribada** i tria sempre la següent ruta que acabe abans i que no se superpose amb l'última triada. És el clàssic problema de "selecció d'activitats".

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.*;

public class Bitllets {
    static class Ruta implements Comparable<Ruta> {
        int eixida, arribada;
        Ruta(int e, int a) { eixida = e; arribada = a; }

        public int compareTo(Ruta o) {
            return Integer.compare(arribada, o.arribada); // ordena per arribada
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        // Llegir rutes, ordenar-les i aplicar el voraç:
        // Collections.sort(rutes);
        // int ultima = Integer.MIN_VALUE, comptador = 0;
        // for (Ruta r : rutes) {
        //     if (r.eixida >= ultima) {
        //         comptador++;
        //         ultima = r.arribada;
        //     }
        // }
        // System.out.println(comptador);
    }
}
```

El truc voraç: ordenar per hora d'arribada garantix que sempre tries la ruta que llibera el dia abans, deixant buit per a més autobusos. Una sola passada amb un comptador i una variable `ultima`. Clàssic d'AceptaElReto: les dades s'ordenen i la solució ix sola.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines el JDBC, torna als problemes d'AceptaElReto d'unitats anteriors i reescriu-los guardant les dades d'entrada en una taula SQLite amb `PreparedStatement`: et sorprendrà el natural que resulta que els teus algoritmes parlen amb una base de dades. El material no es perd: es reutilitza.