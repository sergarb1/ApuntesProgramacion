---
title: "Butlletí U09 — Inicial"
description: "Exercicis bàsics d'Arrays i Col·leccions"
---

# 📝 Butlletí U09 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, crea el teu primer aparcament de dades i fes que el `for-each` deixe de semblar màgia. Cap plaça no naix sabent tindre amo.

---

## Exercici 1: Què imprimeix? — Array de booleans

```java
boolean[] flags = new boolean[3];
flags[1] = true;
System.out.println(flags[0] + " " + flags[1] + " " + flags[2]);
```

Què imprimeix? Quin és el valor per defecte d'un `boolean` en un array?

---

## Exercici 2: Troba l'error — NullPointerException

```java
String[] nombres = new String[3];
nombres[0] = "Ana";
nombres[1] = "Bob";
System.out.println(nombres[2].toUpperCase());
```

Què ocorre en executar este codi? Per què?

---

## Exercici 3: Completa el codi — for bàsic per a buscar el major

Completa el següent programa perquè trobe i imprimisca el número més gran de l'array:

```java
int[] numeros = {12, 45, 7, 34, 89, 23};
int mayor = numeros[0];

for (int i = 1; i < ______; i++) {   // fins on arriba el bucle?
    if (numeros[i] ______ mayor) {    // quin operador?
        ______ = numeros[i];          // què assignem?
    }
}

System.out.println("El mayor es: " + mayor);
```

---

## Exercici 4: Escriu este programa — comptar números parells

Crea un array de 10 enters amb valors que tria tu. Recórrel amb un bucle `for` i compta quants d'ells són parells. Al final, imprimeix el total de parells i l'array original amb `Arrays.toString`.

Exemple d'eixida:

```
Array: [3, 8, 12, 5, 7, 10, 2, 9, 6, 1]
Pares: 5
```

---

## Exercici 5: Què imprimeix? — ArrayList remove per índex vs valor

```java
import java.util.ArrayList;

public class Test {
    public static void main(String[] args) {
        ArrayList<String> lista = new ArrayList<>();
        lista.add("A");
        lista.add("B");
        lista.add("C");
        lista.add("B");
        lista.add("D");

        lista.remove(1);          // remove per índex
        lista.remove("B");        // remove per objecte

        System.out.println(lista);
    }
}
```

Què imprimeix? Per què el segon `remove("B")` no esborra el mateix que el primer?

---

## Exercici 6: Troba l'error — length vs length()

```java
int[] numeros = {10, 20, 30};
String texto = "Hola";

System.out.println(numeros.length());
System.out.println(texto.length);
```

Quines línies tenen error? Explica la diferència entre `length` (sense parèntesis) i `length()` (amb parèntesis).

---

## Exercici 7: Escriu este programa — cerca lineal

Crea un array d'enters anomenat `edades` amb 8 valors. Demana a l'usuari un número pel teclat (amb `Scanner`) i busca si eixe número està a l'array. Imprimeix «Encontrado en posición X» o «No encontrado».

```
Introduce edad a buscar: 25
Encontrado en posición 3
```

---

## Exercici 8: Escriu este programa — l'invers

Crea un array de 10 enters, ompli'l amb els números de l'1 al 10 i després imprimeix-lo en **ordre invers** (del 10 a l'1). Fes-ho amb un `for` que recórrega l'array cap arrere.

---

## Exercici 9: CodeWars — Convert number to reversed array of digits

Resol la kata **"Convert number to reversed array of digits"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/5583090cbe83f4fd8c000051).

Completa el mètode `public static int[] digitize(long n)` que reba un número (per exemple `35231`) i torne un array amb els seus dígits **en ordre invers** (`{1, 3, 2, 5, 3}`).

Pista: usa `String.valueOf(n).toCharArray()` per a obtindre els dígits com a text, o dividix per 10 dins d'un bucle mentre el número siga major que 0.