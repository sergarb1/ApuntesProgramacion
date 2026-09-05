---
title: "Butlletí U11 — Avançat"
description: "Exercicis de dificultat progressiva per a esprémer els genèrics i els mapes"
---

# 📝 Butlletí U11 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resisteix a mirar-la).

---

## ⭐ Exercici 1: Pila genèrica `<T>`

Implementa una classe genèrica `Pila<T>` que funcione com una pila (LIFO). Ha de tindre els mètodes:

- `void push(T elemento)` — apila un element.
- `T pop()` — desapila i torna l'element superior (llança `EmptyStackException` si està buida).
- `T peek()` — torna l'element superior sense desapilar-lo.
- `boolean isEmpty()` — indica si està buida.
- `int size()` — nombre d'elements.

Internament, usa un `ArrayList<T>` com a emmagatzematge. Prova-la amb `Pila<Integer>`, `Pila<String>` i `Pila<Double>`.

**Pista:** `EmptyStackException` està en `java.util.EmptyStackException`. Recorda comprovar `isEmpty()` abans de `pop()`/`peek()`.

---

## ⭐⭐ Exercici 2: Mètode genèric `maximo` sobre un array

Implementa un mètode genèric:

```java
public static <T extends Comparable<T>> T maximo(T[] array)
```

Que torne l'element més gran de l'array usant `compareTo()`. Prova-ho amb un `Integer[]` i un `String[]`.

**Pista:** assumix que el primer és el màxim i recorre des de l'índex 1. No pots usar arrays de primitius: usa `Integer[]`, no `int[]`.

---

## ⭐⭐ Exercici 3: HashMap invers

Escriu un mètode genèric estàtic:

```java
public static <K, V> HashMap<V, K> invertirMapa(HashMap<K, V> original)
```

Que torne un nou `HashMap` intercanviant claus i valors. Si hi ha valors duplicats en el mapa original, l'últim trobat sobreescriu l'anterior.

Prova amb un mapa de `String → Integer` i un altre de `String → String`.

**Pista:** recorre `original.entrySet()` i fes `invertido.put(e.getValue(), e.getKey())`.

---

## ⭐⭐ Exercici 4: TreeMap — freqüència de lletres

Escriu un programa que lligga un text per teclat (o use un hardcodejat) i compte quantes vegades apareix cada **lletra** (ignorant espais, números i signes). Usa un `TreeMap<Character, Integer>` perquè les lletres es mostren automàticament ordenades alfabèticament.

Exemple d'eixida per a «Hola mundo»:
```
a: 1, d: 1, h: 1, l: 1, m: 1, n: 1, o: 2, u: 1
```

**Pista:** recorre el `String` amb `toCharArray()` i usa `Character.isLetter(c)` per a filtrar. El `getOrDefault` suma el comptador; el TreeMap ordena sol.

---

## ⭐⭐⭐ Exercici 5: Wildcards — suma i mescla de números

Implementa un mètode que sume tots els números d'una llista, acceptant qualsevol subtipus de `Number`:

```java
public static double sumar(List<? extends Number> lista)
```

Prova-ho amb `List<Integer>`, `List<Double>` i `List<Float>`. Què passa si intentes passar una `List<String>`?

Crea també un segon mètode que **mescle** dos llistes de números de tipus distints en una sola `List<Double>`:

```java
public static List<Double> mezclar(List<? extends Number> a, List<? extends Number> b)
```

**Pista:** per a `sumar`, recorre amb `for (Number n : lista)` i usa `n.doubleValue()`. Per a `mezclar`, usa `addAll()` i convertix cada element amb `doubleValue()`. I no intentes `add` en `sumar`: `? extends` és de només lectura (PECS).

---

## ⭐⭐ Exercici 6: Caché LRU amb LinkedHashMap

Crea una classe `CacheLRU<K, V>` que use internament un `LinkedHashMap<K, V>` amb capacitat màxima de 5 elements. Quan s'afig un element i ja n'hi ha 5, s'elimina el **menys recentment usat** (accés, no inserció).

**Pista:** `LinkedHashMap` té el constructor amb `accessOrder=true` i el mètode protegit `removeEldestEntry()` que torna si cal expulsar el més vell. Sobreescriu-lo perquè torne `size() > 5`.

---

## ⭐⭐ Exercici 7: Agenda completa amb menú

Implementa una agenda usant `HashMap<String, String>` amb menú interactiu:

1. **Afegir contacte** (nom i telèfon).
2. **Buscar per nom** (mostra el telèfon).
3. **Llistar tots** (recorre amb `entrySet`).
4. **Esborrar contacte**.
0. **Eixir**

Usa un `while`, un `switch` i un `Scanner`. Cuida els casos en què el contacte no existix (usa `containsKey` o `getOrDefault`).

**Pista:** el menú es repetix fins que l'usuari trie `0`. Per a buscar, comprova `containsKey(nombre)` abans de `get`.

---

## ⭐⭐⭐ Exercici 8: Sistema de votacions amb mètode genèric

Crea un sistema de votacions on:

- Cada votant pot votar per un candidat (String).
- Usa un `HashMap<String, Integer>` per als vots.
- Usa un `TreeMap<String, Integer>` per a mostrar el rànquing ordenat.

Crea un mètode genèric:

```java
public static <T> T obtenerGanador(Map<T, Integer> votos)
```

Que torne la clau amb més vots. Prova-ho amb un `HashMap<String, Integer>` i un altre `HashMap<Integer, Integer>`.

**Pista:** recorre `votos.entrySet()` i guarda el guanyador provisional comparant `getValue()` amb un màxim acumulat. El mètode és genèric perquè el tipus de la clau (`String`, `Integer`...) no importa.

---

## ⭐⭐ Exercici 9: Parella genèrica amb intercanvi

Crea una classe genèrica `Pareja<T, U>` que emmagatzeme dos objectes de tipus possiblement distints. Inclou mètodes `getPrimero()`, `getSegundo()`, `setPrimero(T)`, `setSegundo(U)` i un mètode `intercambiar()` que torne una nova `Pareja<U, T>` amb els valors intercanviats.

**Pista:** `intercambiar()` crea i torna `new Pareja<>(this.segundo, this.primero)`. L'ordre dels paràmetres de tipus canvia: `Pareja<U, T>`.