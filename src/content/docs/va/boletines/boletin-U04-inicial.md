---
title: "Butlletí U04 — Inicial"
description: "Exercicis bàsics d'Arrays"
---

# 📝 Butlletí U04 — Inicial

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

Pista: un número és parell si `numeros[i] % 2 == 0`.

---

## Exercici 5: Troba l'error — length vs length()

```java
int[] numeros = {10, 20, 30};
String texto = "Hola";

System.out.println(numeros.length());
System.out.println(texto.length);
```

Quines línies tenen error? Explica la diferència entre `length` (sense parèntesis) i `length()` (amb parèntesis).

---

## Exercici 6: Què imprimeix? — la suma dels senars

Sense executar, escriu l'eixida exacta d'este programa:

```java
public class SumaImpares {
    public static void main(String[] args) {
        int[] datos = {3, 8, 2, 9, 5};
        int total = 0;

        for (int n : datos) {
            if (n % 2 == 1) {
                total += n;
            }
        }

        System.out.println(total);
    }
}
```

Pista: el `for-each` recorre tots els valors; només se sumen els que deixen resta 1 en dividir entre 2.

---

## Exercici 7: Escriu este programa — cerca lineal

Crea un array d'enters anomenat `edades` amb 8 valors. Demana a l'usuari un número pel teclat (amb `Scanner`) i busca si eixe número està a l'array. Imprimeix «Encontrado en posición X» o «No encontrado».

```
Introduce edad a buscar: 25
Encontrado en posición 3
```

Pista: usa una variable `posicion = -1` com a "no trobat", i `break` tan bon punt el trobes.

---

## Exercici 8: Escriu este programa — l'invers

Crea un array de 10 enters, ompli'l amb els números de l'1 al 10 i després imprimeix-lo en **ordre invers** (del 10 a l'1). Fes-ho amb un `for` que recórrega l'array cap arrere.

Pista: el bucle va de `length - 1` fins a `0`, baixant amb `i--`.

---

## Exercici 9: Escriu este programa — la classe Arrays en acció

Crea l'array `int[] notas = {7, 3, 9, 5, 2, 8}` i fes el següent:

1. Mostra'l amb `Arrays.toString`.
2. Ordena amb `Arrays.sort` i mostra'l una altra vegada.
3. Busca el `8` amb `Arrays.binarySearch` i imprimeix la seua posició.

Pista: `import java.util.Arrays;` al principi, i recorda: `binarySearch` només és fiable si l'array ja està ordenat.