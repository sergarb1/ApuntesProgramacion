---
title: "Butlletí U11 — Avançat"
description: "Exercicis de dificultat progressiva per a exprimir les col·leccions, els genèrics i els mapes"
---

# 📝 Butlletí U11 — Avançat

> Dificultat progressiva. ⭐ per a calentar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resistix a mirar-la).

---

## ⭐ Exercici 1: La cua del supermercat amb LinkedList

Simula una cua de supermercat usant `LinkedList<String>`. El programa ha de mostrar un menú:

1. **Arriba client** → Afegix un nom al final de la cua.
2. **Atén client** → Elimina i mostra el primer de la cua.
3. **Qui segueix?** → Mostra el primer sense eliminar-lo.
4. **Estat de la cua** → Mostra tots els clients en ordre.
0. **Eixir**

Usa els mètodes `addLast()`, `removeFirst()` i `getFirst()` de `LinkedList`, amb un `switch` i un `Scanner`.

**Pista:** el menú es repetix amb un `while` fins que l'usuari trie `0`. Cuida els casos en què la cua està buida abans de cridar `removeFirst()` o `getFirst()`.

---

## ⭐⭐ Exercici 2: Intersecció i unió de conjunts

Crea dos `HashSet<Integer>` amb números aleatoris (entre 1 i 20, 8 elements cada un). Calcula i mostra:

- **Intersecció:** elements que estan en tots dos conjunts.
- **Unió:** tots els elements sense repetir.
- **Diferència simètrica:** elements que estan en un o en l'altre, però no en tots dos.

**Pista:** usa `retainAll()`, `addAll()` i `removeAll()` de la interfície `Set`. Per a la diferència simètrica: `union.removeAll(interseccion)`.

---

## ⭐⭐ Exercici 3: Eliminar duplicats mantenint l'ordre

Crea un `ArrayList<Integer>` amb elements repetits (`[3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]`). Escriu un mètode que torne un nou `ArrayList<Integer>` **sense duplicats però mantenint l'ordre de primera aparició**.

**Pista:** un `HashSet` no val directament perquè perd l'ordre. Usa un `LinkedHashSet` (conserva l'ordre d'inserció) o recorre manualment comprovant amb `contains` abans d'afegir.

---

## ⭐⭐⭐ Exercici 4: Què imprimeix? — el remove que trenca el ball

Sense executar, respon què passa amb este programa:

```java
import java.util.ArrayList;

public class Puzle {
    public static void main(String[] args) {
        ArrayList<String> palabras = new ArrayList<>();
        palabras.add("hola");
        palabras.add("mundo");
        palabras.add("adiós");

        for (String p : palabras) {
            if (p.equals("mundo")) {
                palabras.remove(p);
            }
        }
        System.out.println(palabras);
    }
}
```

Imprimeix alguna cosa? O llança una excepció? Quina i per què?

**Pista:** pensa en què fa el `for-each` per davall (usa un `Iterator`) i en què passa si la col·lecció canvia mentre es recorre.

---

## ⭐⭐ Exercici 5: Filtrar amb Iterator

Crea un `ArrayList<Integer>` amb els números de l'1 al 10. Recorre'l amb un `Iterator<Integer>` explícit i **borra tots els números parells** usant `it.remove()`. Al final, imprimeix la llista.

**Pista:** recorre amb `while (it.hasNext())`, obtín cada número amb `it.next()` i comprova si és parell amb `% 2 == 0`. Mai uses `lista.remove(...)` dins del bucle.

---

## ⭐⭐ Exercici 6: El TreeSet ordenat

Crea un programa que demane a l'usuari paraules amb `Scanner` fins que escriga `"fin"`. Guarda-les en un `TreeSet<String>`. En acabar, mostra:

1. Les paraules ordenades (imprimir el TreeSet directament).
2. La primera paraula (`first()`) i l'última (`last()`).
3. Les paraules que van abans que `"m"` en ordre alfabètic (`headSet("m")`).

**Pista:** el TreeSet ordena i elimina duplicats automàticament. Comprova què passa si l'usuari repetix una paraula.

---

## ⭐ Pila genèrica `<T>`: Exercici 7

Implementa una classe genèrica `Pila<T>` que funcione com una pila (LIFO). Ha de tindre els mètodes:

- `void push(T elemento)` — apila un element.
- `T pop()` — desapila i torna l'element superior (llança `EmptyStackException` si està buida).
- `T peek()` — torna l'element superior sense desapilar-lo.
- `boolean isEmpty()` — indica si està buida.
- `int size()` — nombre d'elements.

Internament, usa un `ArrayList<T>` com a emmagatzematge. Prova-la amb `Pila<Integer>`, `Pila<String>` i `Pila<Double>`.

**Pista:** `EmptyStackException` està en `java.util.EmptyStackException`. Recorda comprovar `isEmpty()` abans de `pop()`/`peek()`.

---

## ⭐⭐ Exercici 8: HashMap invers

Escriu un mètode genèric estàtic:

```java
public static <K, V> HashMap<V, K> invertirMapa(HashMap<K, V> original)
```

Que torne un nou `HashMap` intercanviant claus i valors. Si hi ha valors duplicats en el mapa original, l'últim trobat sobreescriu l'anterior.

Prova-ho amb un mapa de `String → Integer` i un altre de `String → String`.

**Pista:** recorre `original.entrySet()` i fes `invertido.put(e.getValue(), e.getKey())`.

---

## ⭐⭐ Exercici 9: TreeMap — freqüència de lletres

Escriu un programa que llisca un text per teclat (o n'use un hardcodejat) i compte quantes vegades apareix cada **lletra** (ignorant espais, números i signes). Usa un `TreeMap<Character, Integer>` perquè les lletres es mostren automàticament ordenades alfabèticament.

Exemple d'eixida per «Hola mundo»:

```
a: 1, d: 1, h: 1, l: 1, m: 1, n: 1, o: 2, u: 1
```

**Pista:** recorre el `String` amb `toCharArray()` i usa `Character.isLetter(c)` per a filtrar. El `getOrDefault` suma el comptador; el TreeMap ordena sol.

---

## ⭐⭐⭐ Exercici 10: Wildcards — suma i barreja de números

Implementa un mètode que sume tots els números d'una llista, acceptant qualsevol subtipus de `Number`:

```java
public static double sumar(List<? extends Number> lista)
```

Prova-ho amb `List<Integer>`, `List<Double>` i `List<Float>`. Què passa si intentes passar una `List<String>`?

Crea també un segon mètode que **barrege** dues llistes de números de tipus distints en una sola `List<Double>`:

```java
public static List<Double> mezclar(List<? extends Number> a, List<? extends Number> b)
```

**Pista:** per a `sumar`, recorre amb `for (Number n : lista)` i usa `n.doubleValue()`. Per a `mezclar`, usa `addAll()` i converteix cada element amb `doubleValue()`. I no intentes `add` en `sumar`: `? extends` és de només lectura (PECS).

---

## ⭐⭐⭐ Exercici 11: Sistema de votacions amb mètode genèric

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

## ⭐⭐⭐ Exercici 12: el type erasure al descobert

La classe `Caja<T>` guarda un valor i el torna amb `getValor()`:

```java
public class Caja<T> {
    private T valor;

    public Caja(T valor) {
        this.valor = valor;
    }

    public T getValor() {
        return valor;
    }
}
```

Sense executar, respon:

1. Són `Caja<String>` i `Caja<Integer>` classes distintes en temps d'execució?
2. Quin tipus té realment `caja.getValor()` dins del bytecode si el compiles com `Caja<String>`?
3. Escriu un `main` que cree `Caja<String>` i `Caja<Integer>` i comprove amb `getClass()` que totes dos són instàncies de la mateixa classe `Caja`.

**Pista:** el type erasure converteix `Caja<T>` en `Caja` a palpes (amb `Object` on estava `T`). Per això `caja.getClass()` torna el mateix per a `Caja<String>` i `Caja<Integer>`: en runtime no hi ha dos classes, només una `Caja`. El cast de `getValor()` l'afegix el compilador, no el teu codi.
