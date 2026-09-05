---
title: "Butlletí U10 — Inicial Resolt"
description: "Els mateixos exercicis que el butlletí inicial, amb solucions"
---

# 📝 Butlletí U10 — Inicial (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: Què imprimeix? — ArrayList remove per índex vs valor

<details>
<summary>🔄 Solució</summary>

Imprimeix **`[A, C, D]`**.

Pas a pas:

- `lista.remove(1)` esborra per **índex**: se'n va el `"B"` de la posició 1 → `[A, C, B, D]`.
- `lista.remove("B")` esborra per **objecte**: busca la primera aparició de `"B"` i l'esborra → `[A, C, D]`.

El primer `remove` esborra el `"B"` de la posició 1 (el primer). Quan després crides `remove("B")`, eixe `"B"` ja no hi és, però queda el `"B"` que estava a la posició 3 (el quart element), que ara és el primer que troba: l'esborra. Resultat final `[A, C, D]`.

</details>

---

## Exercici 2: Troba l'error — size() vs length vs length()

<details>
<summary>🔄 Solució</summary>

Les **línies 1 i 2 tenen error**, la 3 és correcta:

- `nombres.length` → les col·leccions usen `size()` com a mètode. `ArrayList` no té `length`. → **Error**.
- `edades.size()` → els arrays usen `length` com a atribut, sense parèntesis. → **Error**.
- `saludo.length` → els `String` usen `length()` com a mètode, amb parèntesis. → **Correcta**.

Regla d'or: **array → `length`; `String` → `length()`; col·leccions → `size()`.** Confondre'ls és la trampa favorita dels exàmens.

</details>

---

## Exercici 3: Completa el codi — for-each que suma una llista

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;

public class SumaLista {
    public static void main(String[] args) {
        ArrayList<Integer> numeros = new ArrayList<>();
        numeros.add(4);
        numeros.add(9);
        numeros.add(2);
        numeros.add(7);

        int suma = 0;
        for (Integer n : numeros) {
            suma += n;
        }

        System.out.println("Suma: " + suma);
    }
}
```

Els buits: `0`, `Integer n` i `+=`. El for-each recorre cada element de la llista i l'acumula a `suma`. Resultat: `Suma: 22`.

</details>

---

## Exercici 4: Escriu este programa — la llista de la compra

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;

public class Compra {
    public static void main(String[] args) {
        ArrayList<String> compra = new ArrayList<>();
        compra.add("Llet");
        compra.add("Pa");
        compra.add("Ous");

        compra.add(1, "Cafè");       // [Llet, Cafè, Pa, Ous]

        System.out.println("Grandària: " + compra.size()); // 4

        compra.remove(2);            // se'n va "Pa" → [Llet, Cafè, Ous]

        for (String item : compra) {
            System.out.println(item);
        }
    }
}
```

Eixida:

```
Grandària: 4
Llet
Cafè
Ous
```

`add(1, "Cafè")` inserix a la posició 1 i desplaça la resta; `remove(2)` esborra per índex (el tercer element, "Pa").

</details>

---

## Exercici 5: Què imprimeix? — l'ArrayList misteriós

<details>
<summary>🔄 Solució</summary>

Imprimeix **`10 15 30`**.

- `add(10)`, `add(20)`, `add(30)` → `[10, 20, 30]`.
- `add(1, 15)` inserix el 15 a la posició 1 i desplaça → `[10, 15, 20, 30]`.
- `remove(Integer.valueOf(20))` esborra l'**objecte** 20 (no l'índex 2) → `[10, 15, 30]`.

`remove(Integer.valueOf(20))` no és el mateix que `remove(2)`: el primer esborra l'objecte el valor del qual és 20; el segon esborra la posició 2 (que ara ocupa el 20, casualitat). Ací els dos coincidixen en el resultat, però per motius diferents. Si la llista haguera sigut `[10, 20, 15, 20]`, `remove(Integer.valueOf(20))` esborraria el primer 20 i `remove(2)` esborraria el 15.

</details>

---

## Exercici 6: Escriu este programa — és a la llista?

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;
import java.util.Scanner;

public class BuscarNombre {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        nombres.add("Ana");
        nombres.add("Bob");
        nombres.add("Carla");
        nombres.add("David");
        nombres.add("Eva");

        Scanner sc = new Scanner(System.in);
        System.out.print("Introduce un nombre: ");
        String buscado = sc.nextLine();

        int pos = nombres.indexOf(buscado);
        if (pos >= 0) {
            System.out.println("Sí, está en la posición " + pos);
        } else {
            System.out.println("No está");
        }
        sc.close();
    }
}
```

`indexOf` torna la posició de la primera aparició, o `-1` si no existix. Comparar amb `>= 0` és el patró clàssic per a "hi és?".

</details>

---

## Exercici 7: Escriu este programa — el major de la llista

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;

public class MayorLista {
    public static int mayor(ArrayList<Integer> notas) {
        int max = notas.get(0);
        for (int i = 1; i < notas.size(); i++) {
            if (notas.get(i) > max) {
                max = notas.get(i);
            }
        }
        return max;
    }

    public static void main(String[] args) {
        ArrayList<Integer> notas = new ArrayList<>();
        notas.add(6);
        notas.add(8);
        notas.add(5);
        notas.add(9);

        System.out.println("La mayor es: " + mayor(notas)); // 9
    }
}
```

El patró del "màxim acumulat": assumixes que el primer és el major i, si n'apareix un de més gran, el substitueixes. El bucle comença a `i = 1` perquè el candidat inicial ja és `notas.get(0)`.

</details>

---

## Exercici 8: Troba l'error — ArrayList<int> no compila

<details>
<summary>🔄 Solució</summary>

No compila perquè **els genèrics només accepten objectes, i `int` és un primitiu**. `ArrayList<int>` no existix. La solució és usar la classe wrapper `Integer`:

```java
import java.util.ArrayList;

public class Error {
    public static void main(String[] args) {
        ArrayList<Integer> numeros = new ArrayList<>();
        numeros.add(5);
        numeros.add(10);
        System.out.println(numeros.get(0) + numeros.get(1)); // 15
    }
}
```

L'**autoboxing** convertix automàticament l'`int` 5 en un `Integer` en afegir-lo, i l'**unboxing** el convertix de tornada a `int` en sumar. Tu no escrius res d'això: Java ho fa sol.

</details>

---

## Exercici 9: Escriu este programa — posició i valor

<details>
<summary>🔄 Solució</summary>

```java
import java.util.ArrayList;

public class PosicionValor {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>();
        for (int i = 1; i <= 5; i++) {
            lista.add(i);
        }

        for (int i = 0; i < lista.size(); i++) {
            System.out.println("Posición " + i + " → " + lista.get(i));
        }
    }
}
```

Eixida:

```
Posición 0 → 1
Posición 1 → 2
Posición 2 → 3
Posición 3 → 4
Posición 4 → 5
```

El primer bucle ompli la llista amb `add(i)`; el segon la recorre amb el for clàssic i llig cada posició amb `get(i)`. Compte: `add(i)` amb `i` des de 1 afig al final els valors 1 a 5; `get(i)` recupera per índex.

</details>