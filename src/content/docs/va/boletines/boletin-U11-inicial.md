---
title: "Butlletí U11 — Inicial"
description: "Exercicis bàsics de Genèrics i Mapes: classes genèriques, HashMap, getOrDefault i mètodes genèrics"
---

# 📝 Butlletí U11 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, crea la teua primera `Caja<T>` i fes que el `HashMap` deixe de semblar màgia. El `<T>` ho va canviar tot, però el que programa ets tu. Comença suaument, que els genèrics mosseguen a poc a poc.

---

## Exercici 1: Completa el codi — classe amb dos tipus genèrics

```java
public class Par<______, ______> {   // ¿qué dos tipos faltan?
    private T primero;
    private U segundo;

    public Par(T primero, U segundo) {
        this.primero = primero;
        this.segundo = segundo;
    }

    public T getPrimero() { return primero; }
    public U getSegundo() { return segundo; }
}
```

Completa la declaració perquè `Par` accepte dos tipus genèrics distints. Què passa si crees `Par<String, Integer>` i després intentes `par.getPrimero()`?

---

## Exercici 2: Què imprimeix? — HashMap amb put repetit

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

## Exercici 3: Troba l'error — ArrayList\<int\> no compila

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

Este codi **no compila**. Per què? Com el corregeixes? Quin paper juga l'autoboxing?

---

## Exercici 4: Escriu este programa — comptador de paraules amb HashMap

Crea un programa que tinga un array de paraules (hardcodejat) com este:

```java
String[] palabras = {"hola", "mundo", "hola", "java", "mundo", "hola", "adios"};
```

Usa un `HashMap<String, Integer>` per a comptar quantes vegades apareix cada paraula. Al final, recorre el mapa amb un bucle for-each sobre `entrySet()` i mostra cada paraula amb la seua comptada.

---

## Exercici 5: Què imprimeix? — mètode genèric amb límit

```java
public class Util {
    public static <T extends Comparable<T>> T maximo(T a, T b) {
        return a.compareTo(b) > 0 ? a : b;
    }

    public static void main(String[] args) {
        System.out.println(maximo(5, 8));
        System.out.println(maximo("gato", "perro"));
    }
}
```

Què imprimeix? Què passaria si `T` no tinguera el límit `Comparable<T>`?

---

## Exercici 6: Troba l'error — la clau duplicada i el primer valor perdut

```java
HashMap<Integer, String> mapa = new HashMap<>();
mapa.put(1, "uno");
mapa.put(2, "dos");
mapa.put(1, "Uno otra vez");

System.out.println(mapa.get(1));
```

Què imprimeix? Es perd el primer valor associat a la clau 1?

---

## Exercici 7: Escriu este programa — mini agenda amb getOrDefault

Crea un `TreeMap<String, Integer>` per a emmagatzemar les edats de 5 persones. Ompli'l amb noms i edats. Després, demana a l'usuari un nom per teclat i mostra la seua edat. Si el nom no existix, mostra un missatge d'error usant `getOrDefault()` per a evitar el `null`.

---

## Exercici 8: Completa el codi — getOrDefault

```java
HashMap<String, Integer> edades = new HashMap<>();
edades.put("Ana", 25);
edades.put("Bob", 30);

int edadAna = ______;                 // 25
int edadCarlos = ______;              // 0 si no existe (usa getOrDefault)
```

Completa les dos línies. Què tornaria `edades.get("Carlos")` i per què és perillós assignar-lo a un `int`?

---

## Exercici 9: Troba l'error — la clau mutable

```java
HashMap<ArrayList<Integer>, String> mapa = new HashMap<>();
ArrayList<Integer> lista = new ArrayList<>();
lista.add(1);
lista.add(2);
mapa.put(lista, "valor");
lista.add(3);  // modificamos la clave después de usarla
System.out.println(mapa.get(lista));  // ¿qué imprime?
```

Què imprimeix? Quin és el problema d'usar una `ArrayList` com a clau d'un `HashMap`?