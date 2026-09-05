---
title: "06 — Complexitat algorísmica: Big O"
description: La balança que pesa algoritmes sense parar el cronòmetre ⏱️
---

<p><small>La balança que pesa algoritmes sense parar el cronòmetre ⏱️</small></p>

> 🗺️ **Estàs en:** 🧩 **U05 · Algorítmica I: Fonaments** → 06 · Complexitat algorísmica: Big O

---

## 📬 La idea en una frase

> **Big O no et diu quants segons tarda un algoritme: et diu com creix el seu temps quan creix la quantitat de dades. La tendència, no el cronòmetre.**

Dos ordinadors, un de 2024 i un altre de 2004. El modern guanya sempre en una prova ràpida, però això no ens diu res de l'*algoritme*. Per a comparar algoritmes de manera justa, mirem la seua **taxa de creixement**: què passa quan el nombre de dades `n` es fa MOLT gran? Això és Big O.

---

## 📈 Les complexitats més comunes

| Notació | Nom | Exemple | Per a n = 1.000 |
|---|---|---|---|
| O(1) | Constant | Accedir a `array[0]` | 1 operació |
| O(log n) | Logarítmica | Cerca binària | ~10 operacions |
| O(n) | Lineal | Cerca lineal | 1.000 operacions |
| O(n log n) | Quasi lineal | Ordenacions avançades (ho veuràs en la U06) | ~10.000 operacions |
| O(n²) | Quadràtica | Bombolla, inserció | 1.000.000 d'operacions |
| O(2ⁿ) | Exponencial | Fibonacci sense optimitzar | inviable! |

Fixa't en l'últim. Per a `n = 1.000`, O(2ⁿ) no és "molt lent": és que no acaba ni en l'era dels dinosaures. La diferència entre O(n) i O(n²) amb dades grans és la diferència entre "faig un cafè mentre carrega" i "em jubile abans que acabe".

---

## 🧪 Big O en codi

Anem a veure les tres més habituals amb exemples en Java:

```java
public class ExemplesComplexitat {

    // O(1) — CONSTANT: sempre igual, no importa la mida
    public static int obtenirPrimer(int[] array) {
        return array[0];  // un sol pas, sempre
    }

    // O(n) — LINEAL: creix en proporció a n
    public static int sumar(int[] array) {
        int suma = 0;
        for (int nombre : array) {
            suma += nombre;  // n passos
        }
        return suma;
    }

    // O(n²) — QUADRÀTICA: dos bucles anidats
    public static void imprimirParells(int[] array) {
        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array.length; j++) {
                System.out.println(array[i] + ", " + array[j]);  // n × n passos
            }
        }
    }

    public static void main(String[] args) {
        int[] dades = {10, 20, 30, 40, 50};

        System.out.println("O(1): " + obtenirPrimer(dades));
        System.out.println("O(n): " + sumar(dades));
        System.out.println("O(n²): mira la consola omplint-se de parells...");
        imprimirParells(dades);
    }
}
```

La regla del polze: **un bucle sol → O(n). Un bucle dins d'un altre → O(n²).** I si el bucle només recorre la meitat de les dades... continua sent O(n), no O(n/2). Les constants no conten.

---

## 📏 Les regles pràctiques de Big O

1. **Ignora les constants**: O(2n) és el mateix que O(n). El 2 no importa quan `n` tendix a l'infinit.
2. **Queda't amb el terme dominant**: O(n² + n) → O(n²). El `n²` es menja el `n` quan `n` creix.
3. **Els bucles anidats multipliquen**: un bucle dins d'un altre → `n × n` → O(n²).
4. **Els bucles seqüencials sumen**: un bucle i després un altre → O(n + n) → O(2n) → O(n).

```java
public class ReglesBigO {
    public static void main(String[] args) {
        // REGLA 1: les constants no importen
        // O(2n) → O(n)
        // O(100n) → O(n)

        // REGLA 2: el terme dominant es queda
        // O(n² + 5n + 1) → O(n²)
        // O(n + log n) → O(n)

        // REGLA 3: bucles anidats → multipliquen
        // for (i...) { for (j...) { } }  →  O(n × n) → O(n²)

        // REGLA 4: bucles seqüencials → sumen
        // for (i...) { }  for (i...) { }  →  O(n + n) → O(2n) → O(n)

        System.out.println("Big O no és màgia, és simplificar.");
        System.out.println("Pregunta't: què passa quan n es fa MOLT gran?");
    }
}
```

> 📝 **Nota:** Big O descriu el **pitjor cas** (la cota superior): "com a molt, tardarà això". Existixen també Big Omega Ω (millor cas) i Big Theta Θ (cas mitjà), però amb Big O tens suficient per a començar. I per a aprovar, també.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** per a calcular Big O de memòria: compta bucles i mira si s'aniden o se succeïxen. Si tens dubtes entre O(n) i O(n²), pensa en un array d'un milió: recorre una vegada (un milió de passos) o un milió de vegades (un bilió)?

**Exercici: l'analista de complexitats**

Digues la complexitat Big O de cada mètode (les respostes, amagades):

```java
public class Analisi {

    public static int metodeA(int[] array) {
        int total = 0;
        for (int i = 0; i < array.length; i++) {
            total += array[i];
        }
        for (int i = 0; i < array.length; i++) {
            total += array[i] * 2;
        }
        return total;
    }

    public static void metodeB(int[] array) {
        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array.length; j++) {
                System.out.println(array[i] + " " + array[j]);
            }
        }
    }

    public static int metodeC(int[] array) {
        return array[array.length - 1];
    }
}
```

<details>
<summary>🔄 Solució</summary>

- **`metodeA` → O(n)**: dos bucles **seqüencials** sumen: O(n + n) = O(2n) = O(n).
- **`metodeB` → O(n²)**: dos bucles **anidats** multipliquen: n × n.
- **`metodeC` → O(1)**: accés directe per índex, sense bucles. Un sol pas, sempre.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què mesura exactament Big O?
2. Quina és la complexitat d'un bucle anidat?
3. O(2n) i O(n) són el mateix?
4. Ordena de menor a major: O(1), O(n²), O(n), O(log n), O(2ⁿ).

<details>
<summary>🔄 Respostes</summary>

1. La **taxa de creixement** del temps d'execució quan creix `n`. No els segons exactes.
2. **O(n²)** — els bucles anidats multipliquen.
3. **Sí** — les constants s'ignoren: O(2n) = O(n).
4. **O(1) < O(log n) < O(n) < O(n²) < O(2ⁿ)**.

</details>

---

## ✅ Resum en 3 frases

1. Big O descriu **com creix el temps** d'un algoritme quan creix la quantitat de dades, no els segons exactes.
2. Les regles d'or: ignora constants, queda't amb el terme dominant, **anidar multiplica** i **seqüenciar suma**.
3. Amb dades grans, la diferència entre O(n) i O(n²) és la diferència entre un cafè i una jubilació.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Big O | Notació per a la cota superior de creixement d'un algoritme |
> | Terme dominant | El que mana quan `n` és enorme (el `n²` de `n² + n`) |
> | Anidar | Ficar un bucle dins d'un altre → multiplica la complexitat |
> | O(1) | Constant: sempre el mateix nombre de passos |
> | O(log n) | Cada pas descarta la meitat: creix molt a poc a poc |
> | Exponencial | O(2ⁿ): creix tan ràpid que és inviable amb dades mitjanes |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-fundamentos) · **Anterior:** [05 · Ordenació per inserció](/ApuntesProgramacion/va/05-algoritmica-fundamentos/05-ordenacion-insercion) · **Següent:** [07 · Triar l'algoritme adequat](/ApuntesProgramacion/va/05-algoritmica-fundamentos/07-elegir-algoritmo)
