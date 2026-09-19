---
title: "Butlletí U11 — Inicial"
description: "Exercicis bàsics de Col·leccions, genèrics i mapes: ArrayList, HashSet, HashMap, Caja<T> i getOrDefault"
---

# 📝 Butlletí U11 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, crea el teu primer `ArrayList`, la teua primera `Caja<T>` i fes que el `HashMap` deixe de semblar màgia. Comença suaument, que les col·leccions mosseguen a poc a poc.

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

Què imprimeix? Per què el segon `remove("B")` no borra el mateix element que el primer?

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

Quines línies tenen error? Explica què usa cada tipus per a preguntar quant mesura: `size()`, `length` o `length()`.

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

Crea un programa amb un `ArrayList<String>` anomenat `compra` i fes això:

1. Afig `"Leche"`, `"Pan"` i `"Huevos"`.
2. Afig `"Café"` en la posició 1 (entre Leche i Pan).
3. Mostra la grandària de la llista.
4. Borra l'element de la posició 2.
5. Recorre la llista amb un for-each i imprimeix cada element.

Pista: usa `add(e)`, `add(i, e)`, `remove(i)`, `size()` i un for-each.

---

## Exercici 5: Què imprimeix? — el HashSet que no deixa repetir

```java
import java.util.HashSet;

public class Test {
    public static void main(String[] args) {
        HashSet<String> invitados = new HashSet<>();
        invitados.add("Ana");
        invitados.add("Bob");
        invitados.add("Ana");

        System.out.println(invitados.size());
        System.out.println(invitados.contains("Bob"));
    }
}
```

Què imprimeix? Per què el segon `add("Ana")` no provoca cap error ni avís?

---

## Exercici 6: Escriu este programa — sense duplicats

Crea un `ArrayList<String>` amb noms de companys, **amb repetits a propòsit** (mínim 8 elements, 3 d'ells repetits). Després:

1. Construïx un `LinkedHashSet<String>` a partir de la llista.
2. Imprimeix la llista original i el conjunt.
3. Explica en un comentari quina diferència veus i per què.

Pista: el constructor de `LinkedHashSet` accepta qualsevol col·lecció: `new LinkedHashSet<>(lista)`.

---

## Exercici 7: Completa el codi — la teua primera classe genèrica

```java
public class Caja<______> {        // quin paràmetre de tipus falta?
    private ______ contenido;

    public void guardar(______ contenido) {
        this.contenido = contenido;
    }

    public ______ sacar() {
        return contenido;
    }
}
```

Completa els buits perquè `Caja<String>` guarde Strings i `Caja<Integer>` guarde Integers. Per què `Caja<int>` no compila?

---

## Exercici 8: Què imprimeix? — HashMap amb put repetit

```java
import java.util.HashMap;

public class Test {
    public static void main(String[] args) {
        HashMap<String, Integer> mapa = new HashMap<>();
        mapa.put("Ana", 10);
        mapa.put("Bob", 20);
        mapa.put("Ana", 30);

        System.out.println(mapa.get("Ana"));
        System.out.println(mapa.size());
    }
}
```

Què imprimeix? Per què `size()` no és 3?

---

## Exercici 9: Escriu este programa — comptador de paraules amb HashMap

Crea un programa que tinga un array de paraules (hardcodejat) com este:

```java
String[] palabras = {"hola", "mundo", "hola", "java", "mundo", "hola", "adios"};
```

Usa un `HashMap<String, Integer>` per a contar quantes vegades apareix cada paraula. Al final, recorre el mapa amb un bucle for-each sobre `entrySet()` i mostra cada paraula amb el seu compte.

Pista: el patró estrella és `mapa.put(p, mapa.getOrDefault(p, 0) + 1)`.
