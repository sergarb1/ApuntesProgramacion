---
title: "Butlletí U12 — Avançat"
description: "Exercicis de dificultat progressiva per a esprémer reduce, groupingBy, Optional i les referències a mètodes"
---

# 📝 Butlletí U12 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resistix a mirar-la).

---

## ⭐⭐ Exercici 1: Ordenar amb referències a mètode

Tens una llista de noms. Ordena la llista **per longitud** (de menor a major) amb un stream usant `sorted()` i la referència `String::length` combinada amb `Comparator.comparing`. Després mostra-la.

**Pista:** `sorted(Comparator.comparing(String::length))` ordena per longitud sense tocar la llista original. Si vols l'ordre invers, usa `reversed()`.

---

## ⭐⭐ Exercici 2: Agrupar paraules per la seua primera lletra

Tens una llista de paraules. Usa `groupingBy` per a agrupar-les per la seua **primera lletra** i mostra el mapa resultant. Després, amb `groupingBy(p -> p.charAt(0), Collectors.counting())`, compta quantes paraules hi ha en cada grup.

**Pista:** `groupingBy` torna `Map<Character, List<String>>`. El segon argument `counting()` canvia el valor del mapa a `Long`.

---

## ⭐⭐ Exercici 3: Optional — el que no es deixa enganyar

Implementa un mètode que reba una `List<Integer>` i torne el **màxim** usant `max(Integer::compareTo)`, gestionant el resultat amb `orElse` perquè torne `-1` si la llista està buida. Prova amb una llista buida i amb una de plena.

**Pista:** `max` torna `Optional<Integer>`. No uses `get()` a cegues: `orElse(-1)` aterra amb seguretat.

---

## ⭐⭐⭐ Exercici 4: El pipeline complet

Tens esta llista de números:

```java
List<Integer> numeros = List.of(12, 5, 8, 3, 9, 5, 12, 7);
```

Construïx un pipeline que: filtre els **majors o iguals a 5**, els **eleve al quadrat** (`n * n`), **elimine els duplicats**, els **ordene de major a menor** i es quede amb els **3 primers**. Arreplega el resultat en una llista amb `toList()`.

**Pista:** per a ordenar de major a menor: `sorted(Comparator.reverseOrder())`. Recorda que l'ordre de les estacions importa: `distinct` abans de `sorted` canvia la comptada.

---

## ⭐⭐ Exercici 5: De llista a mapa amb `toMap`

Crea una classe senzilla `Alumno` amb `nombre` i `nota`. Amb una llista de 5 alumnes, usa `Collectors.toMap` per a obtenir un `Map<String, Integer>` on la clau siga el nom i el valor la nota. Com que els noms són únics, usa una funció de fusió per si de cas.

**Pista:** `Collectors.toMap(Alumno::getNombre, Alumno::getNota, (a, b) -> a)`. La fusió `(a, b) -> a` evita la `IllegalStateException` si es repetix una clau.

---

## ⭐⭐⭐ Exercici 6: El màxim amb `reduce` i comparador

Implementa el màxim d'una `List<Integer>` de dues formes: amb `reduce` i un acumulador que vaja guardant el major (sense usar `Math::max`), i amb `max`. Què torna cada una? Quina necessita una identitat?

**Pista:** `reduce(Integer.MIN_VALUE, (a, b) -> a > b ? a : b)` usa `Integer.MIN_VALUE` com a identitat. `max(Integer::compareTo)` torna un `Optional`.

---

## ⭐⭐ Exercici 7: Freqüències amb `groupingBy`

Tens un array de paraules amb repetides:

```java
String[] palabras = {"hola", "adios", "hola", "java", "hola", "adios"};
```

Usa `Arrays.stream` i `groupingBy(p -> p, Collectors.counting())` per a comptar quantes vegades apareix cada paraula. Mostra el mapa i, després, la paraula que més vegades apareix.

**Pista:** el mapa és `Map<String, Long>`. Per a la paraula més repetida, recorre `entrySet()` comparant valors, o usa streams de nou amb `max(Map.Entry.comparingByValue())`.

---

## ⭐⭐⭐ Exercici 8: Optional i streams, la parella

Tens una llista de noms. Busca, amb streams, el **primer nom que comence per "J"** usant `filter(...).findFirst()`. Gestiona el `Optional` resultant amb `ifPresent` per a imprimir-lo i amb `orElse` per a mostrar "no hay nadie" si no existix. Prova amb una llista que tinga "J" i amb una altra que no.

**Pista:** `findFirst()` torna `Optional<String>`. Amb `ifPresent(System.out::println)` imprimixes només si hi ha valor; `orElse("no hay nadie")` cobrix l'absència.

---

## ⭐⭐⭐ Exercici 9: el stream que es nega a morir

Observa este codi i respon **sense executar-lo**:

```java
import java.util.*;
import java.util.stream.*;

public class Test {
    public static void main(String[] args) {
        Stream<Integer> flujo = List.of(1, 2, 3).stream();
        long a = flujo.count();
        long b = flujo.count();
        System.out.println(a + " " + b);
    }
}
```

1. Compila?
2. Què ocorre en executar-lo?
3. Com l'arreglaries?

**Pista:** un stream és d'un sol ús. La primera operació terminal el consumeix. Si vols comptar dos vegades, crea dos streams (`List.of(1, 2, 3).stream()` dos vegades).

<details>
<summary>🔄 Solució</summary>

1. **Sí, compila** (l'error és d'execució, no de sintaxi).
2. En executar, la segona crida `flujo.count()` llança **`IllegalStateException: stream has already been operated upon or closed`**. El primer `count()` ja va consumir el stream: no es pot reutilitzar.
3. Creant un stream nou per a cada comptada:

```java
long a = List.of(1, 2, 3).stream().count();
long b = List.of(1, 2, 3).stream().count();
System.out.println(a + " " + b);   // 3 3
```

La regla d'or: un stream és com un bitllet d'autobús d'un sol viatge. Després de baixar-te, el bitllet no servix.

</details>