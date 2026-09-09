---
title: "06 · Operacions terminals: collect, reduce, count, forEach"
description: "L'aixeta que fa que l'aigua fluesca de veritat: `collect`, `reduce`, `count` i `forEach` 🚰"
---

<p><small>L'aixeta que fa que l'aigua fluesca de veritat: `collect`, `reduce`, `count` i `forEach` 🚰</small></p>

> 🗺️ **Estàs en:** 🎯 **U12 · Programació Funcional** → 06 · Operacions terminals: collect, reduce, count, forEach

---

## 📬 La idea en una frase

> **Les operacions terminals són l'aixeta del pipeline: sense una d'elles, el stream no flueix. `collect` empaqueta el resultat, `reduce` combina tots els elements en un, `count` els compta i `forEach` els recorre.**

En el punt 4 vas vore que el stream és peresós i en el punt 5 que les intermèdies només preparen la cinta. Hui obris l'aixeta. Cada terminal produïx un resultat final i, en fer-ho, **consumeix el stream**: després de `count()`, `reduce()` o `forEach()`, la cinta queda buida i no es pot reutilitzar.

---

## 🚰 Les quatre terminals

### `collect(Collector)` — la que empaqueta

Recull els elements del flux en una estructura. La més famosa: `Collectors.toList()`. És el pont entre el stream i les col·leccions de la U10 (en el punt 7 l'espremem a fons).

```java
import java.util.*;
import java.util.stream.*;

List<Integer> numeros = List.of(4, 8, 2, 9, 5);
List<Integer> lista = numeros.stream()
    .filter(n -> n % 2 == 0)
    .collect(Collectors.toList());    // [4, 8, 2]
```

### `reduce(identitat, acumulador)` — la que combina

Va combinant els elements en un de sol. El primer argument és la **identitat** (el valor neutre: `0` per a sumes, `1` per a productes), i el segon és un `BinaryOperator` que diu com combinar dos elements.

```java
int suma = numeros.stream().reduce(0, (a, b) -> a + b);      // 28
int maximo = numeros.stream().reduce(Integer.MIN_VALUE, Math::max);  // 9
```

`reduce(0, (a, b) -> a + b)` es llig: "comença en 0 i ve sumant cada element a l'acumulador". És com un bucle `for` on l'acumulador viatja d'element en element... sense bucle.

### `count()` — la que compta

Torna el nombre d'elements com a `long`.

```java
long pares = numeros.stream().filter(n -> n % 2 == 0).count();   // 3
```

### `forEach(Consumer)` — la que recorre

Aplica un `Consumer` a cada element. És la terminal "imperativa": l'única que s'assembla a un bucle, pensada per a efectes secundaris (imprimir, guardar...).

```java
numeros.stream().forEach(System.out::println);   // imprimeix tots
```

> ⚠️ **Advertència:** `forEach` amb un stream en paral·lel no garanteix ordre. Per al curs, usa'l en streams normals i no et preocupes; però recorda que si l'ordre importa, és més segur `collect` i després recórrer.

---

## 🏭 El pipeline complet

Junta el dels dos punts anteriors:

```java
import java.util.*;
import java.util.stream.*;

public class Notas {
    public static void main(String[] args) {
        List<Integer> notas = List.of(7, 8, 3, 9, 5);

        long aprobados = notas.stream()
            .filter(n -> n >= 5)
            .count();                                  // 4

        int sumaAprobados = notas.stream()
            .filter(n -> n >= 5)
            .reduce(0, Integer::sum);                  // 29

        List<Integer> dobladas = notas.stream()
            .filter(n -> n >= 5)
            .map(n -> n * 2)
            .collect(Collectors.toList());             // [14, 16, 18, 10]

        System.out.println(aprobados + " " + sumaAprobados + " " + dobladas);
    }
}
```

Eixida: `4 29 [14, 16, 18, 10]`. Tres pipelines, tres aixetes, tres resultats. Cada vegada que obris una, el stream es consumeix i has de crear-ne una altra.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `Integer::sum` és una referència a mètode (punt 3) perfecta per a `reduce`: és un `BinaryOperator<Integer>` que suma dos enters.

**Exercici: l'acumulador**

```java
import java.util.*;
import java.util.stream.*;

public class Acumulador {
    public static void main(String[] args) {
        List<Integer> numeros = List.of(1, 2, 3, 4, 5);
        int total = numeros.stream()
            .reduce(10, (a, b) -> a * b);
        System.out.println(total);
    }
}
```

**Què imprimeix?**

- (A) `120`
- (B) `15`
- (C) `1200`
- (D) `10`

<details>
<summary>🔄 Solució</summary>

La **C**. `reduce(10, (a, b) -> a * b)` comença en la identitat `10` i va multiplicant per cada element: `10 * 1 = 10`, `10 * 2 = 20`, `20 * 3 = 60`, `60 * 4 = 240`, `240 * 5 = 1200`. La identitat NO és "el primer element": és el valor amb què arranca l'acumulador. Per això la B (`15`) seria el resultat de `reduce(1, ...)` sense multiplicar per la identitat, i la A (`120`) la trampa de creure que la identitat s'ignora. La identitat és un element més del càlcul: `10` compta.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què torna `count()`?
2. Per a què serveix el primer argument de `reduce(0, ...)`?
3. Què fa `forEach`?
4. Pots reutilitzar el mateix stream després d'una operació terminal?

<details>
<summary>🔄 Respostes</summary>

1. Un `long` amb el nombre d'elements.
2. És la **identitat**: el valor amb què arranca l'acumulador (el neutre de l'operació: `0` per a sumes, `1` per a productes).
3. Aplica un `Consumer` a cada element: la terminal per a efectes secundaris com imprimir.
4. No. Després d'una terminal, el stream queda consumit.

</details>

---

## ✅ Resum en 3 frases

1. Les **operacions terminals** són l'aixeta del pipeline: sense elles, res no flueix.
2. `collect` empaqueta el resultat, `reduce` combina els elements en un (amb una identitat), `count` els compta i `forEach` els recorre.
3. Després d'una terminal, el stream es **consumeix**: si necessites processar de nou, crea un altre stream.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Terminal | Operació que tanca el pipeline i produïx un resultat |
> | `collect` | Recull el flux en una estructura (p. ex. llista) |
> | `reduce` | Combina tots els elements en un (suma, màxim...) |
> | Identitat | Valor inicial del `reduce` (neutre: `0` per a la suma) |
> | `count()` | Torna el nombre d'elements (`long`) |
> | `forEach` | Aplica un `Consumer` a cada element |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-programacion-funcional) · **Anterior:** [05 · Operacions intermèdies: filter, map, distinct, sorted, limit](/ApuntesProgramacion/va/12-programacion-funcional/05-streams-intermedias) · **Següent:** [07 · Del stream a la col·lecció: toList, Collectors, groupingBy](/ApuntesProgramacion/va/12-programacion-funcional/07-streams-colecciones)