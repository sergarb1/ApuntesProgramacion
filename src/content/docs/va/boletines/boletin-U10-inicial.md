---
title: "Butlletí U10 — Inicial"
description: "Exercicis bàsics de Col·leccions: ArrayList, remove per índex vs valor i for-each sobre llistes"
---

# 📝 Butlletí U10 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, crea el teu primer `ArrayList` i fes que el `for-each` deixe de semblar màgia. L'aparcament creix sol, però el que aparca és un altre... i tu. Comença suaument, que les col·leccions mosseguen a poc a poc.

---

## Exercici 1: Què imprimeix? — ArrayList remove per índex vs valor

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

Què imprimeix? Per què el segon `remove("B")` no esborra el mateix element que el primer?

---

## Exercici 2: Troba l'error — size() vs length vs length()

```java
ArrayList<String> nombres = new ArrayList<>();
nombres.add("Ana");

int[] edades = {20, 30};
String saludo = "Hola";

System.out.println(nombres.length);   // línia 1
System.out.println(edades.size());    // línia 2
System.out.println(saludo.length);    // línia 3
```

Quines línies tenen error? Explica què usa cada tipus per a preguntar com de gran és: `size()`, `length` o `length()`.

---

## Exercici 3: Completa el codi — for-each que suma una llista

Completa el següent programa perquè sume tots els números d'una `ArrayList<Integer>`:

```java
import java.util.ArrayList;

public class SumaLista {
    public static void main(String[] args) {
        ArrayList<Integer> numeros = new ArrayList<>();
        numeros.add(4);
        numeros.add(9);
        numeros.add(2);
        numeros.add(7);

        int suma = ______;
        for (______ n : numeros) {      // quin tipus i quina variable?
            suma ______ n;              // quin operador?
        }

        System.out.println("Suma: " + suma);
    }
}
```

Què falta en cada buit? Quant val la suma al final?

---

## Exercici 4: Escriu este programa — la llista de la compra

Crea un programa amb un `ArrayList<String>` anomenat `compra` i fes el següent:

1. Afig `"Llet"`, `"Pa"` i `"Ous"`.
2. Afig `"Cafè"` a la posició 1 (entre Llet i Pa).
3. Mostra la grandària de la llista.
4. Esborra l'element de la posició 2.
5. Recorre la llista amb un for-each i imprimeix cada element.

Pista: usa `add(e)`, `add(i, e)`, `remove(i)`, `size()` i un for-each.

---

## Exercici 5: Què imprimeix? — l'ArrayList misteriós

```java
import java.util.ArrayList;

public class Misterio {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>();
        lista.add(10);
        lista.add(20);
        lista.add(30);
        lista.add(1, 15);
        lista.remove(Integer.valueOf(20));

        for (Integer n : lista) {
            System.out.print(n + " ");
        }
    }
}
```

Què imprimeix? Explica què fa `add(1, 15)` i per què `remove(Integer.valueOf(20))` NO és el mateix que `remove(2)`.

---

## Exercici 6: Escriu este programa — és a la llista?

Crea un `ArrayList<String>` amb almenys 5 noms de companys de classe. Demana a l'usuari un nom pel teclat amb `Scanner` i digues:

- Si el nom està a la llista, imprimeix `"Sí, está en la posición X"` usant `indexOf`.
- Si no hi és, imprimeix `"No está"`.

Pista: `indexOf` torna `-1` quan no troba l'element.

---

## Exercici 7: Escriu este programa — el major de la llista

Escriu un mètode `public static int mayor(ArrayList<Integer> notas)` que recórrega la llista amb un for clàssic (`get(i)`) i torne la nota més alta. En `main()`, crea una llista amb notes, crida el mètode i mostra el resultat.

Pista: comença amb `max = notas.get(0)` i recorre des de l'índex 1.

---

## Exercici 8: Troba l'error — ArrayList<int> no compila

```java
import java.util.ArrayList;

public class Error {
    public static void main(String[] args) {
        ArrayList<int> numeros = new ArrayList<>();
        numeros.add(5);
        numeros.add(10);
        System.out.println(numeros.get(0) + numeros.get(1));
    }
}
```

Este codi **no compila**. Per què? Com el corregeixes perquè sí que compile? Quin paper fa l'autoboxing?

---

## Exercici 9: Escriu este programa — posició i valor

Crea un `ArrayList<Integer>` amb els números de l'1 al 5 (usa un bucle). Després recórrel amb un **for clàssic** (amb índex) i imprimeix en cada línia la posició i el valor, així:

```
Posición 0 → 1
Posición 1 → 2
...
```

Pista: usa `lista.add(i)` dins d'un bucle per a omplir i després `lista.get(i)` per a llegir.