---
title: "05 · Operacions intermèdies: filter, map, distinct, sorted, limit"
description: "La cinta que filtra, transforma, lleva repetits, ordena i limita el flux 🌀"
---

<p><small>La cinta que filtra, transforma, lleva repetits, ordena i limita el flux 🌀</small></p>

> 🗺️ **Estàs en:** 🎯 **U12 · Programació Funcional** → 05 · Operacions intermèdies: filter, map, distinct, sorted, limit

---

## 📬 La idea en una frase

> **Les operacions intermèdies transformen el flux i tornen un altre `Stream`. No fan res per si soles (són peresoses) i no toquen la col·lecció original: només decidixen com serà la cinta quan arranque.**

Ja tens la cinta del punt 4. Hui li poses les estacions: `filter` decidix quins paquets passen, `map` els reetiqueta, `distinct` trau els duplicats, `sorted` els ordena i `limit` talla el flux. Totes tornen un stream nou, totes són peresoses i cap modifica la teua llista original. Això sí: **l'ordre de les estacions importa**.

---

## 🌀 Les cinc estacions

### `filter(Predicate)` — el porter

Deixa passar només els elements que complixen la condició. Necessita un `Predicate` (punt 2).

```java
List<Integer> numeros = List.of(1, 2, 3, 4, 5, 6);
List<Integer> pares = numeros.stream()
    .filter(n -> n % 2 == 0)      // 2, 4, 6
    .toList();
```

### `map(Function)` — el transformador

Transforma cada element. Necessita una `Function` (punt 2). Canvia el tipus de la cinta: `Stream<Integer>` → `Stream<String>` si vols.

```java
List<String> palabras = List.of("hola", "java");
List<Integer> longitudes = palabras.stream()
    .map(String::length)          // 4, 4
    .toList();
```

### `distinct()` — el que lleva repetits

Elimina duplicats usant `equals()`.

```java
List<String> repetidas = List.of("sol", "mar", "sol", "luna");
List<String> unicas = repetidas.stream()
    .distinct()                   // sol, mar, luna
    .toList();
```

### `sorted()` — el que ordena

Ordena segons l'ordre natural (amb `Comparable`). Si vols un altre criteri, usa `sorted(Comparator)`.

```java
List<Integer> desordenados = List.of(5, 2, 8, 1);
List<Integer> ordenados = desordenados.stream()
    .sorted()                     // 1, 2, 5, 8
    .toList();
```

### `limit(n)` — les tisores

Es queda amb els `n` primers elements del flux.

```java
List<Integer> numeros = List.of(10, 20, 30, 40, 50);
List<Integer> tresPrimeros = numeros.stream()
    .limit(3)                     // 10, 20, 30
    .toList();
```

---

## 🏭 Les estacions en cadena

Allò bonic és que s'encadenen: cada operació rep el flux de l'anterior i li passa el seu a la següent. Un exemple complet:

```java
import java.util.*;
import java.util.stream.*;

public class Cadena {
    public static void main(String[] args) {
        List<String> palabras = List.of("java", "hola", "java", "mundo", "adios", "luna");

        palabras.stream()
            .filter(p -> p.length() > 3)      // java, hola, java, mundo, adios, luna
            .map(String::toUpperCase)         // JAVA, HOLA, JAVA, MUNDO, ADIOS, LUNA
            .distinct()                       // JAVA, HOLA, MUNDO, ADIOS, LUNA
            .sorted()                         // ADIOS, HOLA, JAVA, LUNA, MUNDO
            .limit(3)                         // ADIOS, HOLA, JAVA
            .forEach(System.out::println);    // terminal: imprimeix les tres
    }
}
```

Eixida:

```
ADIOS
HOLA
JAVA
```

Fixa't en la **importància de l'ordre**: si poses `limit(3)` abans de `sorted()`, et quedes amb els tres primers en l'ordre d'arribada i després els ordenes; el resultat canvia. Dissenyar el pipeline és decidir en quin ordre passa cada paquet per cada estació.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `map` pot canviar el tipus del stream (`Stream<String>` → `Stream<Integer>`), però `filter` sempre torna el mateix tipus que rep: només lleva elements, no els transforma.

**Exercici: l'estació que sobra**

```java
import java.util.*;
import java.util.stream.*;

public class Estaciones {
    public static void main(String[] args) {
        List<String> nombres = List.of("ana", "bob", "carla", "david", "eva");
        List<String> resultado = nombres.stream()
            .sorted()
            .filter(n -> n.length() == 3)
            .limit(1)
            .toList();
        System.out.println(resultado);
    }
}
```

**Què imprimeix?**

- (A) `[ana]`
- (B) `[bob]`
- (C) `[ana, bob, eva]`
- (D) `[eva]`

<details>
<summary>🔄 Solució</summary>

La **B**. Primer `sorted()` ordena: `ana, bob, carla, david, eva`. Després `filter(n -> n.length() == 3)` deixa només els de 3 lletres: `ana, bob, eva`. I `limit(1)` es queda amb el primer del flux filtrat, que ara és `bob` (perquè després d'ordenar, `bob` va abans que `eva`). Sense el `sorted`, el resultat hauria sigut `[ana]`; l'ordre de les estacions canvia la resposta. Fixa't com `filter` i `limit` no toquen el tipus: continuem amb `List<String>`.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. `filter` deixa passar els elements que complixen la condició o els que no?
2. `map` modifica la col·lecció original?
3. Què fa `distinct`?
4. Què fa `limit(3)`?

<details>
<summary>🔄 Respostes</summary>

1. Els que fan que el `Predicate` torne `true`.
2. No. Torna un stream nou; la col·lecció original no es toca.
3. Elimina duplicats usant `equals()`.
4. Tall el flux i es queda amb els 3 primers elements (el seu efecte dependix de si va abans o després de `sorted`).

</details>

---

## ✅ Resum en 3 frases

1. Les **operacions intermèdies** transformen el flux i tornen un altre `Stream`: `filter`, `map`, `distinct`, `sorted` i `limit`.
2. Són **peresoses**: no s'executen fins que arriba una operació terminal, i **no modifiquen** la font.
3. L'**ordre de les estacions importa**: el mateix pipeline amb les mateixes operacions en un altre ordre pot donar resultats diferents.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Intermèdia | Operació que torna un altre `Stream` |
> | `filter` | Deixa passar el que complix el `Predicate` |
> | `map` | Transforma cada element amb una `Function` |
> | `distinct` | Elimina repetits (amb `equals`) |
> | `sorted` | Ordena (ordre natural o amb `Comparator`) |
> | `limit(n)` | Tall el flux en n elements |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-programacion-funcional) · **Anterior:** [04 · Streams: el flux de dades](/ApuntesProgramacion/va/12-programacion-funcional/04-streams-basicos) · **Següent:** [06 · Operacions terminals: collect, reduce, count, forEach](/ApuntesProgramacion/va/12-programacion-funcional/06-streams-terminales)