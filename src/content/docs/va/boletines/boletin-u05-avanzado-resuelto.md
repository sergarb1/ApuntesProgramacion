---
title: Butlletí U05 — Avançat Resolt
description: Els mateixos exercicis que el butlletí avançat, amb solucions
---

# 📝 Butlletí U05 — Avançat (Resolt)

> Les solucions estan ocultes. Intenta-ho de veritat abans de destapar-les.

---

## ⭐ Exercici 1: El classificador de notes

<details>
<summary>🔄 Solució</summary>

```java
public class Notas {
    public static String calificar(double nota) {
        if (nota < 0 || nota > 10) {
            return "Nota no vàlida";
        }
        if (nota >= 9) {
            return "Excel·lent";
        }
        if (nota >= 7) {
            return "Notable";
        }
        if (nota >= 5) {
            return "Aprovat";
        }
        return "Suspés";
    }

    public static void main(String[] args) {
        System.out.println(calificar(8.7));
        System.out.println(calificar(4.5));
        System.out.println(calificar(11));
        System.out.println(calificar(-2));
    }
}
```

Eixida:

```
Notable
Suspés
Nota no vàlida
Nota no vàlida
```

La guarda de rang (`< 0 || > 10`) va **primera**: si no, un `11` seria "Excel·lent" i un `-2` entraria en la cascada. Cada `return` talla el mètode, així que els rangs posteriors només es miren si els anteriors no han fet *match*.

</details>

---

## ⭐ Exercici 2: Taules a demanda

<details>
<summary>🔄 Solució</summary>

```java
public class Tablas {
    public static void imprimirTabla(int n) {
        for (int i = 1; i <= 10; i++) {
            System.out.println(n + " x " + i + " = " + (n * i));
        }
    }

    public static void main(String[] args) {
        imprimirTabla(7);
        System.out.println("---");
        imprimirTabla(3);
    }
}
```

Eixida (primers):

```
7 x 1 = 7
7 x 2 = 14
...
---
3 x 1 = 3
...
```

El mètode no en sap res del 7 ni del 3: tot el que fa depèn de `n`. La mateixa recepta, dos taules; afegir una tercera és una línia més en el `main`.

</details>

---

## ⭐⭐ Exercici 3: Què imprimeix? — l'ombra del paràmetre

<details>
<summary>🔄 Solució</summary>

```
100
```

Dins de `cambiar`, el paràmetre `valor` **tapa** al camp `valor` durant tot el mètode (per això se'n diu *ombra*). L'expressió `valor = valor + 1` treballa sobre el paràmetre local: `5 + 1` es guarda en el paràmetre, que desapareix en tornar. El camp de la classe mai es toca, així que `main` continua imprimint `100`. Per a modificar el camp caldria `Sombra.valor = valor + 1` (sense `this` no hi ha `static`).

</details>

---

## ⭐⭐ Exercici 4: La suma de xifres

<details>
<summary>🔄 Solució</summary>

```java
public class Digitos {
    public static int sumaDigitos(int n) {
        n = Math.abs(n);
        int suma = 0;
        while (n > 0) {
            suma += n % 10;
            n /= 10;
        }
        return suma;
    }

    public static void main(String[] args) {
        System.out.println(sumaDigitos(1234));
        System.out.println(sumaDigitos(905));
    }
}
```

Eixida:

```
10
14
```

Amb `1234`: el `while` trau `4`, després `3`, després `2`, després `1` → `4 + 3 + 2 + 1 = 10`. `Math.abs` deixa a salvo el mètode d'un nombre negatiu. Tot el treball passa dins del mètode i `main` només imprimeix el `return`.

</details>

---

## ⭐⭐⭐ Exercici 5: Què imprimeix? — el return que talla

<details>
<summary>🔄 Solució</summary>

```
negatiu zero positiu
4
-1
```

`signo(-5)` cau en el primer `if` i torna `negatiu`; `signo(0)` supera el primer i cau en el segon → `zero`; `signo(4)` arriba fins a l'últim `return` → `positiu`. `primeroPar(7, 4)`: el 7 és senar, el 4 és pare → torna `4` abans d'arribar a l'últim `return`. `primeroPar(3, 5)`: cap és pare, així que arriba al final i torna `-1` (el valor sentinella). Recórrer amb calma cada crida és tot l'exercici: **un** `return` per execució, la resta és mort.

</details>

---

## ⭐⭐⭐ Exercici 6: Divideix l'informe

<details>
<summary>🔄 Solució</summary>

```java
public class Informe {
    public static double media(double a, double b, double c, double d) {
        return (a + b + c + d) / 4;
    }

    public static double maximo(double a, double b, double c, double d) {
        double max = a;
        if (b > max) max = b;
        if (c > max) max = c;
        if (d > max) max = d;
        return max;
    }

    public static double minimo(double a, double b, double c, double d) {
        double min = a;
        if (b < min) min = b;
        if (c < min) min = c;
        if (d < min) min = d;
        return min;
    }

    public static void main(String[] args) {
        System.out.println("Mitjana: " + media(7.5, 9.0, 4.5, 8.25));
        System.out.println("Màxim: " + maximo(7.5, 9.0, 4.5, 8.25));
        System.out.println("Mínim: " + minimo(7.5, 9.0, 4.5, 8.25));
    }
}
```

Eixida:

```
Mitjana: 7.3125
Màxim: 9.0
Mínim: 4.5
```

Cada concepte té la seua caixa i el seu nom: si demà l'informe rep mitja ponderada, toques **un** mètode. El `main` ha quedat en el que ha de ser: presentar resultats, pas de càlcul zero.

</details>

---

## ⭐⭐ Exercici 7: El comptador de vocals

<details>
<summary>🔄 Solució</summary>

```java
public class Vocales {
    public static int contarVocales(String texto) {
        int contador = 0;
        for (int i = 0; i < texto.length(); i++) {
            char c = texto.charAt(i);
            if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u'
                    || c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U') {
                contador++;
            }
        }
        return contador;
    }

    public static void main(String[] args) {
        System.out.println(contarVocales("Hola mundo"));
        System.out.println(contarVocales("zzz"));
    }
}
```

Eixida:

```
4
0
```

`"Hola mundo"` té `o`, `a`, `u`, `o` → `4`. Les 10 comparacions són el preu de no voler encara `toLowerCase()` ni les *regex* de la U13. Quan el criteri siga més lleuger que la llista, refactoritzaràs en una sola línia.

</details>

---

## ⭐⭐⭐ Exercici 8: CodeWars — 'Disemvowel' Trolls

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String disemvowel(String str) {
        String resultado = "";
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (c != 'a' && c != 'e' && c != 'i' && c != 'o' && c != 'u'
                    && c != 'A' && c != 'E' && c != 'I' && c != 'O' && c != 'U') {
                resultado += c;
            }
        }
        return resultado;
    }
}
```

Mateix motiu que l'exercici anterior, però a l'inversa: en lloc de comptar el que t'interessa, **concatenes el que no és vocal**. `"This website is for losers LOL!"` perd les vocals i torna `"Ths wbst s fr lsrs LL!"`. Cadenes immutables i `+=` en bucle no són el més ràpid del món, però per aquesta kata és més que suficient.

</details>

---

## ⭐⭐⭐ Exercici 9: AceptaElReto — 165 Número hyperpar

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Hiperpar {
    public static boolean esHyperpar(int n) {
        while (n > 0) {
            if (n % 10 % 2 != 0) {
                return false;
            }
            n /= 10;
        }
        return true;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        while (n >= 0) {
            System.out.println(esHyperpar(n) ? "SI" : "NO");
            n = sc.nextInt();
        }
        sc.close();
    }
}
```

Eixida per a l'exemple:

```
SI
NO
SI
```

`2460` → totes les xifres parelles → `true`. `1234` → en trobar la `1`, `1 % 2 != 0` → `false` i sortim de pressa. `2` → un sol salt de bucle → `true`. El `return false` anticipat és la idea clave de la unitat: quan ja saps la resposta, no cal acabar la feina. El `while` exterior del `main` llegeix fins que arriba un nombre negatiu.

</details>

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 165 — Número hyperpar | Fàcil |
| AceptaElReto | 115 — Número de Kaprekar | Mitjà |
| CodeWars | Century From Year (8 kyu) | Principiant |
| CodeWars | 'Disemvowel' Trolls (7 kyu) | Aficionat |
| CodeWars | Volume of a Cuboid (8 kyu) | Principiant |
| CodeWars | Drink about (8 kyu) | Principiant |
