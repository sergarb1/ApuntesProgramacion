---
title: "08 · Optional: el que accepta l'absència"
description: "Embolicar el `null` per a no ensopegar-hi: `Optional.of`, `orElse`, `isPresent` i `ifPresent` 🎁"
---

<p><small>Embolicar el `null` per a no ensopegar-hi: `Optional.of`, `orElse`, `isPresent` i `ifPresent` 🎁</small></p>

> 🗺️ **Estàs en:** 🎯 **U12 · Programació Funcional** → 08 · Optional: el que accepta l'absència

---

## 📬 La idea en una frase

> **`Optional<T>` és una capsa que conté un valor o està buida. En comptes de tornar un `null` a seques (que ningú sap si era una dada real o un oblit), tornes la capsa i obligues a qui la rep a preguntar: hi ha valor dins, o no?**

Portes tota la unitat processant dades com un cap. Però hi ha un moment en què tot es torç: quan un mètode no troba el que busca i torna `null`. I tu, innocent, crides a `.length()` o a `.get()` sobre eixe `null`... i la `NullPointerException` et saluda a tota la cara. `Optional` existix perquè l'absència siga **explícita** i **gestionable**, no un accident.

---

## 🎁 La capsa en acció

Un `Optional<T>` és una capseta que pot estar **plena** (amb un valor) o **buida**. Crear-la és fàcil:

```java
import java.util.*;

Optional<String> algo = Optional.of("java");        // capsa PLENA. Prohibit passar null.
Optional<String> vacio = Optional.empty();           // capsa BUIDA.
Optional<String> dudoso = Optional.ofNullable(valor); // accepta null: si és null, capsa buida
```

> ⚠️ **Advertència:** `Optional.of(null)` llança `NullPointerException` a l'instant. És la forma de dir "esta capsa NOMÉS admet valors reals". Si no saps si pot arribar `null`, usa `ofNullable`.

---

## 🎁 Obrir la capsa amb elegància

La gràcia de la capsa és que no l'obris a la bruta: uses els seus mètodes per a decidir què passa en cada cas.

```java
import java.util.*;

public class Caja {
    public static void main(String[] args) {
        Optional<String> vacio = Optional.empty();

        // Preguntar
        System.out.println(vacio.isPresent());          // false

        // Valor per defecte: immediat
        String texto = vacio.orElse("valor por defecto");
        System.out.println(texto);                       // valor por defecto

        // Valor per defecte: peresós (Supplier)
        String fabricado = vacio.orElseGet(() -> fabricarLento());

        // Si està buida... revienta amb la teua excepció
        // String valor = vacio.orElseThrow(() -> new IllegalStateException("¡Faltaba!"));

        // Si hi ha valor, fes alguna cosa (Consumer). Si no, no faces res.
        vacio.ifPresent(s -> System.out.println(s.toUpperCase()));  // no imprimeix res
    }

    static String fabricarLento() {
        return "fabricado con esfuerzo";
    }
}
```

La diferència entre `orElse` i `orElseGet`: `orElse(x)` ja té `x` calculat (l'argument s'avalua sempre, hi haja o no valor). `orElseGet(() -> ...)` només fabrica el valor per defecte si la capsa està buida: és peresós, i si fabricar és car, t'estalvies la despesa.

---

## 🎁 Optional i els streams: parella de ball

Ací s'ajunta tot: moltes operacions terminals de streams tornen un `Optional` perquè no poden garantir que existisca resultat. `findFirst`, `findAny`, `max` i `min` són les típiques.

```java
import java.util.*;
import java.util.stream.*;

public class Pareja {
    public static void main(String[] args) {
        List<String> nombres = List.of("bob", "ana", "carla");

        Optional<String> primeroConA = nombres.stream()
            .filter(n -> n.startsWith("a"))
            .findFirst();

        System.out.println(primeroConA.isPresent());      // true
        primeroConA.ifPresent(System.out::println);       // ana

        Optional<String> ninguno = nombres.stream()
            .filter(n -> n.startsWith("z"))
            .findFirst();
        System.out.println(ninguno.orElse("no hay nadie"));  // no hay nadie
    }
}
```

Si el `filter` no deixa passar a ningú, `findFirst` torna una capsa buida... i tu, amb `orElse` o `ifPresent`, decidixes l'aterratge. Això sí: **no uses `get()` a la boja**: si la capsa està buida, `get()` llança `NoSuchElementException`. Pregunta (`isPresent`) o aterra (`orElse`) abans d'obrir.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `orElse(null)` és legal però és tornar a casa amb les mans buides: millor `orElse("algo sensato")` o `orElseThrow(...)`. Si vas a tornar `null`, per a què vas embolicar l'absència en una capsa?

**Exercici: l'ascensor de la capsa**

```java
import java.util.*;
import java.util.stream.*;

public class Ascensor {
    public static void main(String[] args) {
        List<Integer> notas = List.of();
        Optional<Integer> maxima = notas.stream()
            .max(Integer::compareTo);
        System.out.println(maxima.orElse(-1));
    }
}
```

**Què imprimeix?**

- (A) `-1`
- (B) `0`
- (C) `Optional.empty`
- (D) Una `NoSuchElementException`

<details>
<summary>🔄 Solució</summary>

La **A**. `notas` està buida, així que `max(Integer::compareTo)` no troba cap màxim i torna una capsa **buida**. `orElse(-1)` és la xarxa de seguretat: com que no hi ha valor, torna `-1`. Sense el `orElse`, un `get()` a cegues hauria llançat `NoSuchElementException` (la D, que passa si intentes `maxima.get()`). La B (`0`) seria el resultat de `orElse(0)` amb una altra xarxa. I la C descriu la capsa abans d'obrir-la: l'`orElse` ja l'ha obert i ha decidit l'aterratge.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què passa si fas `Optional.of(null)`?
2. Com lliges el valor d'un `Optional` sense arriscar-te a una excepció?
3. Quina diferència hi ha entre `orElse` i `orElseGet`?
4. Quins mètodes de streams tornen `Optional`?

<details>
<summary>🔄 Respostes</summary>

1. `NullPointerException`: `Optional.of` només admet valors reals. Per a possibles `null`, usa `ofNullable`.
2. Amb `orElse`, `orElseGet` o `ifPresent`. Mai amb `get()` a cegues.
3. `orElse(x)` té el valor per defecte ja calculat (s'avalua sempre); `orElseGet(() -> ...)` el fabrica només si la capsa està buida (peresós).
4. `findFirst`, `findAny`, `max` i `min` tornen `Optional` perquè no poden garantir resultat.

</details>

---

## ✅ Resum en 3 frases

1. **`Optional`** és una capsa que conté un valor o està buida: substituïx el `null` a seques i fa explícita l'absència.
2. Es crea amb `of`, `ofNullable` o `empty`, i es consumeix amb `orElse`, `orElseGet`, `orElseThrow` i `ifPresent`.
3. Molts mètodes de streams (`findFirst`, `max`, `min`) tornen `Optional`: la capsa és el pont entre la peresa del stream i la teua decisió sobre l'absència.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `Optional<T>` | Capsa que embolica un valor o la seua absència |
> | `Optional.of(v)` | Capsa plena (prohibix `null`) |
> | `Optional.ofNullable(v)` | Capsa que admet `null` (si és null, queda buida) |
> | `Optional.empty()` | Capsa buida |
> | `orElse(x)` / `orElseGet(s)` | Valor per defecte (immediat / peresós) |
> | `orElseThrow()` | Llança una excepció si està buit |
> | `ifPresent(c)` | Executa un `Consumer` només si hi ha valor |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-programacion-funcional) · **Anterior:** [07 · Del stream a la col·lecció: toList, Collectors, groupingBy](/ApuntesProgramacion/va/12-programacion-funcional/07-streams-colecciones) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/12-programacion-funcional/09-repaso-interactivo)