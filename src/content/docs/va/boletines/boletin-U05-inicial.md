---
title: Butlletí U05 — Inicial
description: "Exercicis bàsics d'Algorísmica: fonaments"
---

# 📝 Butlletí U05 — Inicial

> Sense solucions. Sense presses. Obri l'IDE i deixa que els teus bucles busquen, ordenen i calculen. L'ordinador mai no es cansa de recórrer un array: eres tu qui decidix com.

---

## Exercici 1: Què imprimeix? — la cerca de la gema

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class CercaGema {
    public static void main(String[] args) {
        int[] cofre = {12, 7, 25, 9, 31};
        int objectiu = 9;
        int posicio = -1;

        for (int i = 0; i < cofre.length; i++) {
            if (cofre[i] == objectiu) {
                posicio = i;
                break;
            }
        }

        System.out.println("Posició: " + posicio);
    }
}
```

Pista: recorre l'array mentalment element a element. En quin índex apareix el 9 per primera vegada?

---

## Exercici 2: El buscador de tresors

Escriu un mètode `public static int buscar(int[] dades, int objectiu)` que recórrega l'array amb un `for` i retorne l'**índex** on apareix l'objectiu. Si no hi és, retorna `-1`.

Prova amb `int[] tresors = {4, 8, 15, 16, 23, 42}`:

- `buscar(tresors, 15)` → ha de retornar `2`
- `buscar(tresors, 7)` → ha de retornar `-1`

Pista: retorna `i` tan bon punt trobes l'objectiu; només després del bucle retornes `-1`.

---

## Exercici 3: Què imprimeix? — la bombolla mínima

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class BombollaMinima {
    public static void main(String[] args) {
        int[] dades = {3, 1, 2};

        for (int i = 0; i < dades.length - 1; i++) {
            for (int j = 0; j < dades.length - 1 - i; j++) {
                if (dades[j] > dades[j + 1]) {
                    int temp = dades[j];
                    dades[j] = dades[j + 1];
                    dades[j + 1] = temp;
                }
            }
        }

        for (int num : dades) {
            System.out.print(num + " ");
        }
    }
}
```

Pista: fes la traça en un paper. Primera passada: el 3 vs 1, després 3 vs 2. Què queda al final?

---

## Exercici 4: La capsa de sabates ordenada

Escriu un mètode `public static void ordenar(int[] dades)` que òrdene l'array **de menor a major** usant l'ordenació per inserció.

Prova amb `int[] capsa = {9, 2, 7, 1}` i mostra l'array resultant amb un `for...each`.

Pista: guarda `int clau = dades[i]` i llisca cap a la dreta els elements majors amb un `while`.

---

## Exercici 5: El detectiu de la cerca binària

Escriu un mètode `public static int cercaBinaria(int[] dades, int objectiu)` que use la cerca binària sobre un array **ja ordenat** i retorne l'índex de l'objectiu (o `-1`).

Prova amb `int[] agenda = {2, 5, 8, 12, 16, 23, 38, 56, 72, 91}`:

- `cercaBinaria(agenda, 23)` → ha de retornar `5`
- `cercaBinaria(agenda, 30)` → ha de retornar `-1`

Pista: dos punters `esquerra = 0` i `dreta = dades.length - 1`, un `while (esquerra <= dreta)` i `int mig = esquerra + (dreta - esquerra) / 2`.

---

## Exercici 6: Què imprimeix? — la binària que falla

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class BinariaQueFalla {
    public static void main(String[] args) {
        int[] dades = {10, 20, 30, 40, 50};
        int objectiu = 35;
        int esquerra = 0;
        int dreta = dades.length - 1;
        boolean trobat = false;

        while (esquerra <= dreta) {
            int mig = esquerra + (dreta - esquerra) / 2;
            if (dades[mig] == objectiu) {
                trobat = true;
                break;
            } else if (dades[mig] < objectiu) {
                esquerra = mig + 1;
            } else {
                dreta = mig - 1;
            }
        }

        System.out.println(trobat);
    }
}
```

Pista: el 35 no està en l'array. Quin valor té `trobat` al final del bucle?

---

## Exercici 7: El comptador d'intercanvis

Escriu un programa anomenat `ComptadorIntercanvis` que use la bombolla per a ordenar `int[] dades = {5, 2, 9, 1, 5}` i **compte quants intercanvis** realitza en total. Al final mostra: `Intercanvis: X`.

Pista: declara `int intercanvis = 0;` i suma-li 1 dins del `if` d'intercanvi, just després de l'operació.

---

## Exercici 8: La nota més alta de la classe

Escriu un mètode `public static int notaMaxima(int[] notes)` que recórrega l'array i retorne la nota més alta.

Prova amb `int[] notes = {7, 9, 5, 10, 6, 8, 4}` → ha de retornar `10`.

Pista: usa una variable `maxim` inicialitzada amb el primer element (`notes[0]`) i compara amb cada un.

---

## Exercici 9: CodeWars — Find the smallest integer in the array

Resol la kata **"Find the smallest integer in the array"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/55a2d7ebe362935a210000b2).

Crea el mètode `public static int findSmallestInt(int[] args)` que retorne l'enter més menut de l'array.

Pista: és el mateix patró de l'exercici 8: recorre i compara. Ací l'array mai no està buit.
