---
title: "Butlletí U09 — Inicial Resolt"
description: "Els mateixos exercicis que el butlletí inicial, amb solucions"
---

# 📝 Butlletí U09 — Inicial (Resolt)

> Les solucions estan amagades a cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: Què imprimeix? — Array de booleans

<details>
<summary>🔄 Solució</summary>

Imprimeix **`false true false`**.

`flags` és un `boolean[]` de 3 places acabades de crear. El valor per defecte de `boolean` és `false`, així que `flags[0]` i `flags[2]` valen `false`. Només `flags[1]` es va posar a `true`. Cada plaça naix amb el valor per defecte del seu tipus: `false` per a `boolean`.

</details>

---

## Exercici 2: Troba l'error — NullPointerException

<details>
<summary>🔄 Solució</summary>

Es llança una **`NullPointerException`** a l'última línia.

`nombres[2]` mai no es va assignar, així que val `null` (el valor per defecte dels objectes). Cridar `nombres[2].toUpperCase()` sobre `null` és demanar un mètode al no-res: Java no sap què fer i llança l'excepció. Les places d'un `String[]` acabat de crear estan plenes de `null`, no de `""`.

</details>

---

## Exercici 3: Completa el codi — for bàsic per a buscar el major

<details>
<summary>🔄 Solució</summary>

```java
int[] numeros = {12, 45, 7, 34, 89, 23};
int mayor = numeros[0];

for (int i = 1; i < numeros.length; i++) {   // fins a length, sense passar
    if (numeros[i] > mayor) {                // és més gran que l'actual?
        mayor = numeros[i];                  // actualitza el major
    }
}

System.out.println("El mayor es: " + mayor);
```

El patró del "màxim acumulat": comences assumint que el primer és el major i, si n'apareix un de més gran, el substituïx. El bucle comença en `i = 1` perquè el candidat inicial ja és `numeros[0]`. Imprimeix `El mayor es: 89`.

</details>

---

## Exercici 4: Escriu este programa — comptar números parells

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Arrays;

public class ContarPares {
    public static void main(String[] args) {
        int[] numeros = {3, 8, 12, 5, 7, 10, 2, 9, 6, 1};
        int pares = 0;

        for (int i = 0; i < numeros.length; i++) {
            if (numeros[i] % 2 == 0) {
                pares++;
            }
        }

        System.out.println("Array: " + Arrays.toString(numeros));
        System.out.println("Pares: " + pares);
    }
}
```

Eixida: `Array: [3, 8, 12, 5, 7, 10, 2, 9, 6, 1]` i `Pares: 5`. Un número és parell si el seu residu en dividir entre 2 és 0 (`% 2 == 0`). I `Arrays.toString` és el que fa l'eixida llegible.

</details>

---

## Exercici 5: Què imprimeix? — ArrayList remove per índex vs valor

<details>
<summary>🔄 Solució</summary>

Imprimeix **`[A, C, B, D]`**.

Pas a pas:

- `lista.remove(1)` esborra per **índex**: se'n va el `"B"` de la posició 1 → `[A, C, B, D]`.
- `lista.remove("B")` esborra per **objecte**: busca la primera aparició de `"B"` i la borra → `[A, C, D]`.

El primer `remove` esborra el `"B"` de la posició 1 (el primer). Quan després crides `remove("B")`, eixe `"B"` ja no hi és, però queda el `"B"` que estava a la posició 3 (el quart element), que ara és el primer que troba: el borra. Resultat final `[A, C, D]`.

</details>

---

## Exercici 6: Troba l'error — length vs length()

<details>
<summary>🔄 Solució</summary>

Les **dues línies tenen error**, però per motius oposats:

- `numeros.length()` → els arrays usen `length` com a **atribut**, sense parèntesis. `numeros.length()` no compila.
- `texto.length` → els `String` usen `length()` com a **mètode**, amb parèntesis. `texto.length` no compila.

Regla d'or: **array → `length`; `String` → `length()`; col·leccions → `size()`.** Confondre'ls és la trampa favorita dels exàmens.

</details>

---

## Exercici 7: Escriu este programa — cerca lineal

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class BusquedaLineal {
    public static void main(String[] args) {
        int[] edades = {12, 45, 25, 67, 33, 18, 40, 21};
        Scanner sc = new Scanner(System.in);

        System.out.print("Introduce edad a buscar: ");
        int buscado = sc.nextInt();

        int posicion = -1;
        for (int i = 0; i < edades.length; i++) {
            if (edades[i] == buscado) {
                posicion = i;
                break;
            }
        }

        if (posicion >= 0) {
            System.out.println("Encontrado en posición " + posicion);
        } else {
            System.out.println("No encontrado");
        }
        sc.close();
    }
}
```

La cerca lineal recorre l'array de principi a fi. `posicion = -1` és el "no trobat"; si apareix el valor, guardes l'índex i talles amb `break` (ja no cal seguir).

</details>

---

## Exercici 8: Escriu este programa — l'invers

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Arrays;

public class Inverso {
    public static void main(String[] args) {
        int[] numeros = new int[10];
        for (int i = 0; i < numeros.length; i++) {
            numeros[i] = i + 1;
        }

        System.out.println("Original: " + Arrays.toString(numeros));

        System.out.print("Inverso: ");
        for (int i = numeros.length - 1; i >= 0; i--) {
            System.out.print(numeros[i] + " ");
        }
    }
}
```

El primer bucle ompli de l'1 al 10. El segon recorre **cap arrere**: comença en `length - 1` (el 10) i baixa fins a 0 (l'1). Imprimeix `10 9 8 7 6 5 4 3 2 1`.

</details>

---

## Exercici 9: CodeWars — Convert number to reversed array of digits

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int[] digitize(long n) {
        String texto = String.valueOf(n);
        int[] resultado = new int[texto.length()];
        for (int i = 0; i < texto.length(); i++) {
            resultado[i] = texto.charAt(texto.length() - 1 - i) - '0';
        }
        return resultado;
    }
}
```

O, amb aritmètica pura:

```java
public class Kata {
    public static int[] digitize(long n) {
        String texto = String.valueOf(n);
        int[] resultado = new int[texto.length()];
        for (int i = 0; i < resultado.length; i++) {
            resultado[i] = (int) (n % 10);
            n /= 10;
        }
        return resultado;
    }
}
```

Per a `35231` → `{1, 3, 2, 5, 3}`. La primera versió recorre el text de darrere cap endavant i resta `'0'` per a passar de caràcter a número. La segona usa el truc del mòdul: l'últim dígit és `n % 10`, i dividir entre 10 "trau" eixe dígit. Tots dos camins usen el `length` del text, no un número fix.

</details>