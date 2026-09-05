---
title: "Butlletí U11 — Inicial Resolt"
description: "Els mateixos exercicis que el butlletí inicial, amb solucions"
---

# 📝 Butlletí U11 — Inicial (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: Completa el codi — classe amb dos tipus genèrics

<details>
<summary>🔄 Solució</summary>

```java
public class Par<T, U> {
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

La declaració correcta és `public class Par<T, U>`. Si crees `Par<String, Integer> par = new Par<>("Ana", 25);`, aleshores `par.getPrimero()` torna un `String` (sense casting) i `par.getSegundo()` un `Integer`. Els dos paràmetres de tipus van separats per comes i es reomplin en instanciar.

</details>

---

## Exercici 2: Què imprimeix? — HashMap amb put repetit

<details>
<summary>🔄 Solució</summary>

Imprimeix **`30`** i **`2`**.

- `put("Ana", 10)` i després `put("Ana", 30)`: la clau "Ana" se sobreescriu amb l'últim valor.
- Per això `size()` és 2, no 3: les claus són úniques i "Ana" només compta una vegada.

</details>

---

## Exercici 3: Troba l'error — ArrayList\<int\> no compila

<details>
<summary>🔄 Solució</summary>

No compila perquè **els genèrics només accepten objectes, i `int` és un primitiu**. `ArrayList<int>` no existix. La solució és usar la classe wrapper `Integer`:

```java
import java.util.ArrayList;

public class Error {
    public static void main(String[] args) {
        ArrayList<Integer> numeros = new ArrayList<>();
        numeros.add(5);
        numeros.add(10);
        System.out.println(numeros.get(0) + numeros.get(1)); // 15
    }
}
```

L'**autoboxing** convertix automàticament el `int` 5 en un `Integer` en afegir-lo, i l'**unboxing** el convertix de tornada a `int` en sumar. Tu no escrius res d'això: Java ho fa sol.

</details>

---

## Exercici 4: Escriu este programa — comptador de paraules amb HashMap

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashMap;
import java.util.Map;

public class ContadorPalabras {
    public static void main(String[] args) {
        String[] palabras = {"hola", "mundo", "hola", "java", "mundo", "hola", "adios"};

        HashMap<String, Integer> contador = new HashMap<>();
        for (String p : palabras) {
            contador.put(p, contador.getOrDefault(p, 0) + 1);
        }

        for (Map.Entry<String, Integer> entrada : contador.entrySet()) {
            System.out.println(entrada.getKey() + " → " + entrada.getValue());
        }
    }
}
```

El patró de les freqüències: `getOrDefault(p, 0) + 1` torna la comptada actual (o 0 la primera vegada) i suma 1. `entrySet()` et dona cada paraula amb el seu comptador en un sol bucle, sense un `get` extra.

</details>

---

## Exercici 5: Què imprimeix? — mètode genèric amb límit

<details>
<summary>🔄 Solució</summary>

Imprimeix:

```
8
perro
```

- `maximo(5, 8)`: `T` és `Integer` i `8.compareTo(5) > 0`, així que torna 8.
- `maximo("gato", "perro")`: `T` és `String` i `"perro".compareTo("gato") > 0` (p > g), així que torna "perro".

Si `T` no tinguera el límit `Comparable<T>`, el codi no compilaria: el mètode no podria cridar `compareTo()` perquè no sabria que `T` sap comparar-se.

</details>

---

## Exercici 6: Troba l'error — la clau duplicada i el primer valor perdut

<details>
<summary>🔄 Solució</summary>

Imprimeix **`Uno otra vez`**.

Sí, el primer valor ("uno") es perd: en fer `put(1, "Uno otra vez")` amb una clau que ja existia, el HashMap sobreescriu el valor anterior. Les claus són úniques i només poden tindre UN valor, l'últim que es pose.

</details>

---

## Exercici 7: Escriu este programa — mini agenda amb getOrDefault

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;
import java.util.TreeMap;

public class Edades {
    public static void main(String[] args) {
        TreeMap<String, Integer> edades = new TreeMap<>();
        edades.put("Ana", 25);
        edades.put("Bob", 30);
        edades.put("Carla", 22);
        edades.put("David", 28);
        edades.put("Eva", 35);

        Scanner sc = new Scanner(System.in);
        System.out.print("¿De quién quieres saber la edad? ");
        String nombre = sc.nextLine();

        int edad = edades.getOrDefault(nombre, -1);
        if (edad == -1) {
            System.out.println(nombre + " no está en el mapa.");
        } else {
            System.out.println(nombre + " tiene " + edad + " años.");
        }
        sc.close();
    }
}
```

`getOrDefault(nombre, -1)` torna `-1` (un sentinella) si el nom no existix, així no toques un `null`. Amb un `TreeMap`, a més, les claus queden ordenades alfabèticament si algun dia decidixes llistar-les.

</details>

---

## Exercici 8: Completa el codi — getOrDefault

<details>
<summary>🔄 Solució</summary>

```java
int edadAna = edades.get("Ana");                  // 25
int edadCarlos = edades.getOrDefault("Carlos", 0); // 0
```

`edades.get("Carlos")` torna `null`, i assignar `null` a un primitiu `int` provoca un error (o un `NullPointerException` si la variable fóra `Integer`). `getOrDefault("Carlos", 0)` torna el valor per defecte 0 i evita l'ensurt. És el salvavides dels mapes.

</details>

---

## Exercici 9: Troba l'error — la clau mutable

<details>
<summary>🔄 Solució</summary>

Imprimeix **`null`** (o un valor impredictible, segons el `hashCode` intern).

El problema: les claus d'un HashMap han de ser **immutables**. En modificar `lista` amb `add(3)` després d'usar-la com a clau, el seu `hashCode()` canvia. El HashMap busca en el bucket antic, però la clau ara té un altre hash, així que `get()` no la troba encara que siga dins del mapa.

És com canviar el pany de casa teua i esperar que la clau vella continue funcionant. Per això `String` i `Integer` són claus perfectes: mai canvien. Mai uses una `ArrayList`, un array o les teues pròpies classes mutables com a clau d'un HashMap.

</details>