---
title: "Butlletí U11 — Inicial Resolt"
description: "Els mateixos exercicis que el butlletí inicial, amb solucions"
---

# 📝 Butlletí U11 — Inicial (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: Què imprimeix? — ArrayList remove per índex vs valor

<details>
<summary>🔄 Solució</summary>

Imprimeix **`[A, C, D]`**.

- `lista.remove(1)` borra per **índex**: lleva el `"B"` de la posició 1 → `[A, C, B, D]`.
- `lista.remove("B")` borra per **objecte**: busca el primer `"B"` que quede → `[A, C, D]`.

El primer mira posicions; el segon, continguts. Com que l'`Integer` té sobrecàrregues (`remove(int)` vs `remove(Object)`), esta distinció és la trampa favorita dels exàmens.

</details>

---

## Exercici 2: Troba l'error — size() vs length vs length()

<details>
<summary>🔄 Solució</summary>

Les tres línies tenen error:

- **Línia 1:** un `ArrayList` pregunta la seua grandària amb `size()`, no amb `.length` (això és per a arrays).
- **Línia 2:** un array usa `.length` (sense parèntesis), no `.size()`.
- **Línia 3:** un `String` usa `.length()` (amb parèntesis, és un mètode).

Regla mnemotècnica: col·lecció → `size()`, array → `length`, String → `length()`.

</details>

---

## Exercici 3: Completa el codi — for-each que suma una llista

<details>
<summary>🔄 Solució</summary>

```java
int suma = 0;
for (Integer n : numeros) {   // o int n, amb unboxing automàtic
    suma += n;
}
```

La suma final és **22** (4 + 9 + 2 + 7). El buit inicial era `0` (començar acumulant des de zero), el tipus era `Integer` (o `int`, i l'unboxing fa la resta) i l'operador, `+=`.

</details>

---

## Exercici 4: Escriu este programa — la llista de la compra

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;

public class ListaCompra {
    public static void main(String[] args) {
        ArrayList<String> compra = new ArrayList<>();
        compra.add("Leche");       // [Leche]
        compra.add("Pan");         // [Leche, Pan]
        compra.add("Huevos");      // [Leche, Pan, Huevos]
        compra.add(1, "Café");     // [Leche, Café, Pan, Huevos]

        System.out.println("Grandària: " + compra.size());   // 4

        compra.remove(2);          // lleva "Pan" → [Leche, Café, Huevos]

        for (String articulo : compra) {
            System.out.println(articulo);
        }
    }
}
```

`add(e)` afegix al final, `add(i, e)` se cola en la posició `i` desplaçant la resta, i `remove(i)` lleva per índex. Ull: després d'inserir `"Café"` en la posició 1, el `"Pan"` passa a la posició 2, així que `remove(2)` el lleva a ell.

</details>

---

## Exercici 5: Què imprimeix? — el HashSet que no deixa repetir

<details>
<summary>🔄 Solució</summary>

Imprimeix **`2`** i **`true`**.

El segon `add("Ana")` no falla ni avisa: simplement torna `false` i no afegix res, perquè el `HashSet` ja conté "Ana" (compara amb `hashCode()` i `equals()`). Per això `size()` és 2 (només Ana i Bob) i `contains("Bob")` és `true`.

</details>

---

## Exercici 6: Escriu este programa — sense duplicats

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;
import java.util.LinkedHashSet;

public class SinDuplicados {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        nombres.add("Ana");
        nombres.add("Bob");
        nombres.add("Ana");
        nombres.add("Carla");
        nombres.add("Bob");
        nombres.add("Diego");
        nombres.add("Ana");
        nombres.add("Eva");

        LinkedHashSet<String> sinRepetir = new LinkedHashSet<>(nombres);

        System.out.println("Llista:    " + nombres);
        System.out.println("Conjunt:   " + sinRepetir);
    }
}
```

La llista imprimeix els 8 elements amb els seus repetits; el conjunt, només 5: `Ana`, `Bob`, `Carla`, `Diego` i `Eva`. El `LinkedHashSet` elimina els duplicats **i** conserva l'ordre de primera aparició. Amb un `HashSet` a seques, l'ordre d'eixida seria imprevisible.

</details>

---

## Exercici 7: Completa el codi — la teua primera classe genèrica

<details>
<summary>🔄 Solució</summary>

```java
public class Caja<T> {
    private T contenido;

    public void guardar(T contenido) {
        this.contenido = contenido;
    }

    public T sacar() {
        return contenido;
    }
}
```

El paràmetre de tipus `<T>` es declara al costat del nom de la classe i s'usa com un tipus més dins d'ella. `Caja<int>` no compila perquè els genèrics només accepten tipus referència: `int` és un primitiu, així que toca usar `Caja<Integer>` i deixar que l'autoboxing convertisca sol.

</details>

---

## Exercici 8: Què imprimeix? — HashMap amb put repetit

<details>
<summary>🔄 Solució</summary>

Imprimeix **`30`** i **`2`**.

- `put("Ana", 10)` i després `put("Ana", 30)`: la clau "Ana" es sobreescriu amb l'últim valor.
- Per això `size()` és 2, no 3: les claus són úniques i "Ana" només compta una vegada.

</details>

---

## Exercici 9: Escriu este programa — comptador de paraules amb HashMap

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashMap;
import java.util.Map;

public class ContadorPalabras {
    public static void main(String[] args) {
        String[] palabras = {"hola", "mundo", "hola", "java", "mundo", "hola", "adios"};

        HashMap<String, Integer> contador = new HashMap<>();
        for (String p : palabras) {
            contador.put(p, contador.getOrDefault(p, 0) + 1);
        }

        for (Map.Entry<String, Integer> entrada : contador.entrySet()) {
            System.out.println(entrada.getKey() + " → " + entrada.getValue());
        }
    }
}
```

El patró de les freqüències: `getOrDefault(p, 0) + 1` torna el compte actual (o 0 la primera vegada) i suma 1. `entrySet()` et dona cada paraula amb el seu comptador en un sol bucle, sense un `get` extra.

</details>
