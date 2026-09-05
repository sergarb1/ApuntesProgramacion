---
title: Butlletí U03 — Avançat Resolt
description: Els mateixos exercicis que el butlletí avançat, amb solucions
---

# 📝 Butlletí U03 — Avançat (Resolt)

> Les solucions estan ocultes. Intenta-ho de veritat abans de destapar-les.

---

## ⭐ Exercici 1: La calculadora de notes

<details>
<summary>🔄 Solució</summary>

```java
public class CalculadoraNotes {
    public static void main(String[] args) {
        double nota = 8.7;

        if (nota < 0 || nota > 10) {
            System.out.println("Nota invàlida");
        } else if (nota >= 9) {
            System.out.println("Excel·lent");
        } else if (nota >= 7) {
            System.out.println("Notable");
        } else if (nota >= 5) {
            System.out.println("Aprovat");
        } else {
            System.out.println("Suspés");
        }
    }
}
```

Eixida: `Notable`

El primer `if` caça les notes impossibles (negatives o majors de 10) i la cascada següent avalua de la més exigent a la més permissiva. Amb 8.7, el `>= 7` guanya i dona "Notable".

</details>

---

## ⭐ Exercici 2: El menú que no es rendix

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class MenuTenac {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int opcio = 0;

        do {
            System.out.println("1. Jugar  2. Eixir");
            System.out.print("Tria: ");
            opcio = sc.nextInt();
        } while (opcio != 1 && opcio != 2);

        System.out.println("Has triat l'opció " + opcio + ".");
        sc.close();
    }
}
```

El `do-while` garantix que el menú es mostre almenys una vegada. Mentres l'opció no siga 1 ni 2, el bucle insistix. L'usuari pot ser tot el tonto que vulga; el menú no es rendix.

</details>

---

## ⭐⭐ Exercici 3: Què imprimeix? — la piràmide

<details>
<summary>🔄 Solució</summary>

```
*
**
***
****
```

En total **10 asteriscs** (1 + 2 + 3 + 4). El bucle interior (`col <= fila`) imprimix tants asteriscs com el número de fila. El cor dels bucles anidats: el interior depén de l'exterior.

</details>

---

## ⭐⭐ Exercici 4: L'escala de nombres

<details>
<summary>🔄 Solució</summary>

```java
public class Escala {
    public static void main(String[] args) {
        for (int fila = 1; fila <= 4; fila++) {
            for (int num = 1; num <= fila; num++) {
                System.out.print(num + " ");
            }
            System.out.println();
        }
    }
}
```

El interior imprimix de l'1 al número de fila amb `print` (sense salt de línia); el `println()` buit salta en acabar cada fila. L'escala completa:

```
1
1 2
1 2 3
1 2 3 4
```

</details>

---

## ⭐⭐⭐ Exercici 5: Què imprimeix? — break, continue i l'etiqueta

<details>
<summary>🔄 Solució</summary>

Taula de parells, en ordre d'execució:

| i | j | Què passa? | Imprimix? |
|---|---|---|---|
| 1 | 1 | `1*1=1 < 8` | `11` |
| 1 | 2 | `j==2 && i>=3` → no; `1*2=2 < 8` | `12` |
| 1 | 3 | `1*3=3 < 8` | `13` |
| 2 | 1 | `2*1=2 < 8` | `21` |
| 2 | 2 | `2*2=4 < 8` | `22` |
| 2 | 3 | `2*3=6 < 8` | `23` |
| 3 | 1 | `3*1=3 < 8` | `31` |
| 3 | 2 | `j==2 && i>=3` → **sí** → `continue exterior` | res |
| 4 | 1 | `4*1=4 < 8` | `41` |
| 4 | 2 | `j==2 && i>=3` → **sí** → `continue exterior` | res |

Fixat que el `break exterior` **mai no es dispara**: amb `i=1` i `i=2` el producte `i*j` no arriba a 8, i amb `i>=3` sempre salta abans pel `continue exterior` (en `j=2`), així que mai no s'avalua el `j=3` on `3*3=9` hauria superat 8. La lliçó: amb les etiquetes, no assumixques què passa — executa-ho mentalment parell a parell.

</details>

---

## ⭐⭐ Exercici 6: Caçador de primers

<details>
<summary>🔄 Solució</summary>

```java
public class CacadorPrimers {
    public static void main(String[] args) {
        for (int numero = 1; numero <= 50; numero++) {
            boolean esPrimer = true;

            if (numero < 2) {
                esPrimer = false;
            } else {
                for (int divisor = 2; divisor < numero; divisor++) {
                    if (numero % divisor == 0) {
                        esPrimer = false;
                        break;
                    }
                }
            }

            if (esPrimer) {
                System.out.println(numero);
            }
        }
    }
}
```

Eixida (primers): `2 3 5 7 11 13...`. El bucle exterior recorre els candidats i el interior busca divisors amb `break` tan bon punt en troba un. El `if (numero < 2)` aparta l'1, que no és primer (és l'anec lleig de les matemàtiques).

</details>

---

## ⭐⭐ Exercici 7: La suma sentinella

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class SumaSentinella {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int suma = 0;
        int numero = sc.nextInt();

        while (numero != 0) {
            suma += numero;
            numero = sc.nextInt();
        }

        System.out.println("Suma total: " + suma);
        sc.close();
    }
}
```

El `while` es repetix mentres el nombre no siga 0. El 0 és el **sentinella**: no es suma, només senyala el final. És el patró clàssic de lectura de dades amb `while`.

</details>

---

## ⭐⭐⭐ Exercici 8: CodeWars — Categorize New Member

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String[] openOrSenior(int[][] data) {
        String[] result = new String[data.length];

        for (int i = 0; i < data.length; i++) {
            result[i] = (data[i][0] >= 55 && data[i][1] > 7) ? "Senior" : "Open";
        }

        return result;
    }
}
```

Un bucle que recorre els parells `{edat, handicap}` i un ternari amb la condició combinada `&&`: per a ser "Senior" cal tindre almenys 55 anys I un handicap major que 7. Tot el que no ho complix és "Open". Bucles, condicionals i ternaris de la unitat en una sola funció.

</details>

---

## ⭐⭐⭐ Exercici 9: AceptaElReto — 156 Ascensor

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Ascensor {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) {
                break;
            }

            int distancia = 0;
            int pisActual = 0;

            for (int i = 0; i < n; i++) {
                int pis = sc.nextInt();
                distancia += Math.abs(pis - pisActual);
                pisActual = pis;
            }

            System.out.println(distancia);
        }
        sc.close();
    }
}
```

El `while (true)` amb `break` en el 0 gestiona els múltiples casos. Dins, un `for` acumula `Math.abs(pis - pisActual)` i actualitza la planta actual. `Math.abs` dona la distància sense importar si puja o baixa. Amb l'entrada de l'exemple: `|0-5| + |5-1| + |1-10| + |10-4| + |4-2| = 26`.

</details>

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 156 — Ascensor | Fàcil |
| AceptaElReto | 149 — San Fermines | Fàcil |
| AceptaElReto | 340 — Següent amb mateix nombre de xifres | Mitjà |
| CodeWars | Even or Odd (8 kyu) | Principiant |
| CodeWars | Categorize New Member (7 kyu) | Aficionat |
| CodeWars | Return Negative (8 kyu) | Principiant |
