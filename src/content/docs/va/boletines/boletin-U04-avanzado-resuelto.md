---
title: Butlletí U04 — Avançat Resolt
description: Els mateixos exercicis que el butlletí avançat, amb solucions
---

# 📝 Butlletí U04 — Avançat (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: Què imprimeix? — la binària amb historial

<details>
<summary>🔄 Solució</summary>

Imprimix:

```
Prove l'índex 3
Prove l'índex 5
Prove l'índex 4
Trobat en 4
```

Traça sobre `{2, 4, 6, 8, 10, 12, 14, 16}` (8 elements, índexs 0 a 7):

| Volta | esq | der | mig | dades[mig] | Decisió |
|---|---|---|---|---|---|
| 1 | 0 | 7 | 3 | 8 | 8 < 10 → esq = 4 |
| 2 | 4 | 7 | 5 | 12 | 12 > 10 → der = 4 |
| 3 | 4 | 4 | 4 | 10 | Trobat! |

Tres proves, tres línies, i l'índex 4. Així de compacta és la binària: cada volta descarta la meitat de l'espai.

</details>

---

## Exercici 2: El buscador binari amb historial

<details>
<summary>🔄 Solució</summary>

```java
public static int cercaBinaria(int[] dades, int objectiu) {
    int esquerra = 0;
    int dreta = dades.length - 1;

    while (esquerra <= dreta) {
        int mig = esquerra + (dreta - esquerra) / 2;
        System.out.println("Provant l'índex " + mig);

        if (dades[mig] == objectiu) {
            return mig;
        } else if (dades[mig] < objectiu) {
            esquerra = mig + 1;
        } else {
            dreta = mig - 1;
        }
    }
    return -1;
}
```

Eixida per a `objectiu = 7`: `Provant l'índex 4`, `Provant l'índex 1`, `Provant l'índex 2`, i retorna `2` (el 7 està en `dades[2]`). El `println` dins del bucle convertix la binària en una capsa de vidre: pots vore cada intent.

</details>

---

## Exercici 3: La bombolla amb recompte (i flag)

<details>
<summary>🔄 Solució</summary>

```java
public class BombollaRecompte {
    public static void main(String[] args) {
        int[] dades = {9, 3, 7, 1, 5};
        int intercanvis = 0;
        boolean hiHaIntercanvi;

        for (int i = 0; i < dades.length - 1; i++) {
            hiHaIntercanvi = false;

            for (int j = 0; j < dades.length - 1 - i; j++) {
                if (dades[j] > dades[j + 1]) {
                    int temp = dades[j];
                    dades[j] = dades[j + 1];
                    dades[j + 1] = temp;
                    intercanvis++;
                    hiHaIntercanvi = true;
                }
            }

            if (!hiHaIntercanvi) break;
        }

        System.out.println("Intercanvis: " + intercanvis);
        for (int num : dades) {
            System.out.print(num + " ");
        }
    }
}
```

Eixida:

```
Intercanvis: 7
1 3 5 7 9
```

Sobre `{9, 3, 7, 1, 5}` són 7 intercanvis. El flag fa que, tan bon punt una passada no mou res, el `break` talla: no mereix la pena seguir. Compara amb el butlletí inicial, on el flag no existia i sempre es feien totes les passades.

</details>

---

## Exercici 4: La inserció descendent

<details>
<summary>🔄 Solució</summary>

```java
public static void ordenarDescendent(int[] dades) {
    for (int i = 1; i < dades.length; i++) {
        int clau = dades[i];
        int j = i - 1;

        while (j >= 0 && dades[j] < clau) {
            dades[j + 1] = dades[j];
            j--;
        }
        dades[j + 1] = clau;
    }
}
```

L'únic canvi és el signe: `dades[j] < clau` en comptes de `>`. Ara llisquem cap a la dreta els elements **menors** que la clau, perquè volem que els grans queden a l'esquerra. Sobre `{6, 9, 3, 8, 5}` retorna `9 8 6 5 3`. Canviar una comparació i tot el sentit de l'algoritme gira.

</details>

---

## Exercici 5: L'analista de complexitat

<details>
<summary>🔄 Solució</summary>

- **`metodeA` → O(n)**: un sol bucle que recorre l'array complet.
- **`metodeB` → O(n²)**: dos bucles anidats. Encara que l'interior comence en `j = i + 1`, són ≈ n·(n-1)/2 iteracions, que és O(n²). En Big O, les constants i la mitat no conten.
- **`metodeC` → O(log n)**: la cerca binària. En cada volta el segment es partix per la mitat, així que el nombre de voltes és log₂(n).

</details>

---

## Exercici 6: El caçador de parelles

<details>
<summary>🔄 Solució</summary>

```java
public static boolean existeixParella(int[] dades, int sumaObjectiu) {
    for (int i = 0; i < dades.length; i++) {
        for (int j = i + 1; j < dades.length; j++) {
            if (dades[i] + dades[j] == sumaObjectiu) {
                return true;
            }
        }
    }
    return false;
}
```

`j = i + 1` evita provar un element amb si mateix i duplicar parelles (provar (3,5) i (5,3)). Per a 17: 10 + 7 → `true`. Per a 25: cap combinació → `false`. És O(n²), però per a arrays xicotets és instantani.

</details>

---

## Exercici 7: El detectiu d'inversions

<details>
<summary>🔄 Solució</summary>

```java
public static int contarInversions(int[] dades) {
    int inversions = 0;

    for (int i = 0; i < dades.length; i++) {
        for (int j = i + 1; j < dades.length; j++) {
            if (dades[i] > dades[j]) {
                inversions++;
            }
        }
    }
    return inversions;
}
```

Sobre `{2, 4, 1, 3}`: parelles `(0,1)` 2<4 no, `(0,2)` 2>1 sí, `(0,3)` 2<3 no, `(1,2)` 4>1 sí, `(1,3)` 4>3 sí, `(2,3)` 1<3 no → 3 inversions. Curiositat: les inversions mesuren "com de desordenat" està un array. Un array ja ordenat té 0; un d'invertit té el màxim.

</details>

---

## Exercici 8: CodeWars — Ones and Zeros

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int binaryArrayToNumber(int[] numeros) {
        int valor = 0;
        for (int digit : numeros) {
            valor = valor * 2 + digit;
        }
        return valor;
    }
}
```

Per a `[1, 0, 1, 1]`: valor = 0·2+1 = 1, després 1·2+0 = 2, després 2·2+1 = 5, després 5·2+1 = 11. El truc `valor * 2 + digit` convertix binari a decimal en un sol recorregut, sense `Math.pow`. És un algoritme clàssic que et trobaràs a tot arreu: dígit a dígit, el valor "es desplaça" cap a l'esquerra.

</details>

---

## Exercici 9: AceptaElReto — 100 Constant de Kaprekar

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Kaprekar {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numero = sc.nextInt();

        while (numero != 0) {
            int iteracions = 0;

            while (numero != 6174) {
                int[] digits = new int[4];

                for (int i = 3; i >= 0; i--) {
                    digits[i] = numero % 10;
                    numero /= 10;
                }

                for (int i = 0; i < digits.length - 1; i++) {
                    for (int j = 0; j < digits.length - 1 - i; j++) {
                        if (digits[j] > digits[j + 1]) {
                            int temp = digits[j];
                            digits[j] = digits[j + 1];
                            digits[j + 1] = temp;
                        }
                    }
                }

                int ascendent = 0;
                int descendent = 0;
                for (int i = 0; i < 4; i++) {
                    ascendent = ascendent * 10 + digits[i];
                    descendent = descendent * 10 + digits[3 - i];
                }

                numero = descendent - ascendent;
                iteracions++;
            }

            System.out.println(iteracions);
            numero = sc.nextInt();
        }
        sc.close();
    }
}
```

Els nombres amb menys de 4 xifres es completen amb zeros perquè extraiem amb `% 10` i `/ 10` sobre un array de 4 posicions: el 21 es convertix en `{0, 0, 2, 1}`. L'algoritme de Kaprekar acaba sempre (màxim unes poques iteracions): per a 1111, la diferència dóna 0 i el `while (numero != 6174)` acaba en `0`. La bombolla del punt 4, reutilitzada dins del propi Kaprekar: el codi de la U04 resolent problemes reals.

</details>
