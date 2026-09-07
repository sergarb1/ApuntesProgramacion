---
title: "04 · Streams: el flux de dades"
description: "La cinta transportadora de Java: crear un `Stream`, el pipeline i per què no guarda res 📦"
---

<p><small>La cinta transportadora de Java: crear un `Stream`, el pipeline i per què no guarda res 📦</small></p>

> 🗺️ **Estàs en:** 🎯 **U12 · Programació Funcional** → 04 · Streams: el flux de dades

---

## 📬 La idea en una frase

> **Un `Stream` no és una col·lecció nova: és una cinta transportadora per on passen els elements d'una font (una llista, un array, diversos valors...) per a processar-los d'una vegada, sense bucles.**

Fins ara, per a treballar amb una llista de la U10 escrivies `for (String s : lista)` i dins feies la màgia. El stream és una altra filosofia: en comptes de dir-li a Java **com** recórrer (bucle, índex, iterador), li dius **què** vols aconseguir i ell munta la cinta. Tu dissenyes el flux; Java mou els paquets.

---

## 📦 Què és un Stream (i què NO és)?

Un `Stream<T>` és una **seqüència d'elements** de tipus `T` que es processa d'una vegada. Tres regles que t'estalviaran disgustos:

- **No guarda dades.** La cinta no emmagatzema paquets: les dades continuen vivint en la teua llista o el teu array. El stream només les va passant.
- **És peresós.** Les operacions intermèdies no s'executen fins que apareix una operació terminal (ho veiem en el punt 5).
- **Només es recorre una vegada.** Com una cinta de supermercat: quan l'últim producte cau a la bossa, la cinta es queda buida. Usar-lo dos vegades és impossible.

---

## 🚚 Crear un Stream: les quatre fonts

```java
import java.util.*;
import java.util.stream.*;

public class Fuentes {
    public static void main(String[] args) {
        List<String> nombres = List.of("ana", "bob", "carla");

        Stream<String> s1 = nombres.stream();                          // des d'una col·lecció
        Stream<Integer> s2 = Stream.of(1, 2, 3);                       // des de valors solts
        Stream<String> s3 = Arrays.stream(new String[]{"x", "y"});     // des d'un array
        Stream<Integer> s4 = Stream.iterate(0, n -> n + 1);            // infinita (¡amb compte!)
    }
}
```

- `lista.stream()` — la font més comuna: qualsevol col·lecció de la U10 té este mètode.
- `Stream.of(a, b, c)` — quan vols un flux a partir de diversos valors sense muntar una llista.
- `Arrays.stream(array)` — per a convertir un array de la U04 en flux.
- `Stream.iterate(0, n -> n + 1)` — genera una seqüència infinita. No la tanques amb una terminal que ho recórrega tot o el teu programa es dedicarà a comptar fins a l'infinit (i no és una metàfora).

---

## 🏭 El pipeline: font → intermèdies → terminal

La forma d'usar un stream és el **pipeline**: una font, zero o més operacions intermèdies, i una operació terminal que tanca l'aixeta.

```java
import java.util.*;
import java.util.stream.*;

public class Pipeline {
    public static void main(String[] args) {
        List<String> nombres = List.of("ana", "bob", "carla", "david", "eva");

        long cantidad = nombres.stream()          // 1. font
            .filter(n -> n.length() > 3)          // 2. intermèdia: es queda amb els llargs
            .count();                             // 3. terminal: els compta

        System.out.println(cantidad);             // 3 (carla, david, eva)
    }
}
```

L'operació terminal (`count()`) és la que fa que la cinta arranque. Sense ella, el stream no mou ni un paquet: les intermèdies només preparen la cinta. És com planejar un viatge: pots dissenyar la ruta tot el que vulgues, però ningú ix fins que l'autobús arranca.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `lista.stream()` et dona un flux, però `List.of(...)` crea llistes **immutables**. Si necessites que el resultat siga modificable, en el punt 7 veuràs com eixir del stream a una col·lecció que sí pugues tocar.

**Exercici: la cinta que arranca**

```java
import java.util.*;
import java.util.stream.*;

public class Cinta {
    public static void main(String[] args) {
        List<Integer> numeros = List.of(4, 8, 15, 16, 23, 42);
        Stream<Integer> flujo = numeros.stream()
            .filter(n -> n % 2 == 0)
            .map(n -> n * 10);
        System.out.println("Cinta preparada");
    }
}
```

**Què imprimeix?**

- (A) `Cinta preparada`
- (B) `Cinta preparada` i després `40 80 160 420`
- (C) `40 80 160 420`
- (D) Res: el programa es queda penjat esperant la cinta.

<details>
<summary>🔄 Solució</summary>

La **A**. El pipeline acaba amb `map` (una operació intermèdia), així que **no hi ha operació terminal**: la cinta es prepara però mai no arranca. `filter` i `map` no executen res fins que arriba un `collect`, `count`, `forEach` o similar. És la peresa del stream en estat pur: prepares la ruta, i ningú es puja a l'autobús. La B i la C serien certes si afegires `forEach(System.out::println)` o un `toList()` al final. I el programa no es penja: simplement no imprimeix números.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Un `Stream` guarda dades?
2. Quantes vegades pots recórrer un `Stream`?
3. Com crees un stream des d'una llista?
4. I des de diversos valors solts?

<details>
<summary>🔄 Respostes</summary>

1. No. És una vista/flux: les dades continuen en la col·lecció original.
2. Una sola vegada. Després d'una operació terminal, el stream queda consumit.
3. Amb `lista.stream()`.
4. Amb `Stream.of(valor1, valor2, ...)`.

</details>

---

## ✅ Resum en 3 frases

1. Un **`Stream`** és un flux d'elements, no un contenidor: no guarda res, és una cinta per on passen les dades.
2. Es crea amb `coleccion.stream()`, `Stream.of(...)`, `Arrays.stream(array)` o `Stream.iterate`, i s'usa en un **pipeline** de font → intermèdies → terminal.
3. El stream és **peresós i d'un sol ús**: sense operació terminal no fa res, i una vegada consumit no es pot reutilitzar.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Stream | Flux de dades que es processa d'una vegada |
> | Pipeline | Cadena font → intermèdies → terminal |
> | Font | D'on ixen els elements (col·lecció, array, `Stream.of`) |
> | Peresa | Les operacions intermèdies no s'executen fins a la terminal |
> | Consumible | Un stream només es recorre una vegada |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-programacion-funcional) · **Anterior:** [03 · Referències a mètodes: la drecera `::`](/ApuntesProgramacion/va/12-programacion-funcional/03-referencias-metodos) · **Següent:** [05 · Operacions intermèdies: filter, map, distinct, sorted, limit](/ApuntesProgramacion/va/12-programacion-funcional/05-streams-intermedias)