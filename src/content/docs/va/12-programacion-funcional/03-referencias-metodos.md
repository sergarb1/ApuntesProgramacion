---
title: "03 · Referències a mètodes: la drecera `::`"
description: "Reciclar mètodes ja escrits com si foren lambdes amb l'operador `::` 🩹"
---

<p><small>Reciclar mètodes ja escrits com si foren lambdes amb l'operador `::` 🩹</small></p>

> 🗺️ **Estàs en:** 🎯 **U12 · Programació Funcional** → 03 · Referències a mètodes: la drecera `::`

---

## 📬 La idea en una frase

> **Quan la teua lambda només crida un mètode que ja existeix, pots escriure `::` en comptes de `->`: `String::toUpperCase` significa "el mètode `toUpperCase` dels Strings", llest per a usar-se com una lambda.**

En el punt 1 vas vore les lambdes i en el punt 2 els quatre vestits oficials. Hui aprens a vestir-los sense escriure ni una fletxa: si el cos de la teua lambda és literalment "crida a este mètode", Java et deixa reciclar eixe mètode directament amb l'operador **`::`** (dos punts, dos punts, no són punts suspensius).

---

## 🩹 Quan la lambda és només una crida

Imagina que vols una `Function<String, String>` que pose un text en majúscules. Amb lambda:

```java
Function<String, String> mayusculas = s -> s.toUpperCase();
```

Eixa lambda fa una sola cosa: cridar a `toUpperCase()`. Java pensa: "escolta, ja existeix eixe mètode, per a què escric la fletxa?". La versió amb `::`:

```java
Function<String, String> mayusculas = String::toUpperCase;
```

**`String::toUpperCase`** es llig: "el mètode `toUpperCase` de la classe `String`". I funciona exactament igual que la lambda: quan li passes un String, el posarà en majúscules.

```java
System.out.println(mayusculas.apply("hola"));   // HOLA
```

---

## 🗂️ Els quatre tipus de referència

### 1. Mètode estàtic: `Clase::metodoEstatico`

```java
Function<Integer, Integer> valorAbsoluto = Math::abs;
System.out.println(valorAbsoluto.apply(-7));   // 7
```

Equival a `x -> Math.abs(x)`.

### 2. Mètode d'instància sobre un objecte qualsevol: `Clase::metodoInstancia`

```java
Function<String, Integer> longitud = String::length;
System.out.println(longitud.apply("java"));   // 4
```

Equival a `s -> s.length()`. El paràmetre de la lambda es converteix en l'objecte sobre el qual cridem.

### 3. Mètode d'instància sobre un objecte concret: `objeto::metodo`

```java
Consumer<String> imprimir = System.out::println;
imprimir.accept("¡Hola!");
```

Equival a `s -> System.out.println(s)`. Ací l'objecte ja existeix (`System.out`) i el paràmetre de la lambda és l'argument del mètode.

### 4. Constructor: `Clase::new`

```java
Supplier<ArrayList<String>> fabrica = ArrayList::new;
ArrayList<String> lista = fabrica.get();
```

Equival a `() -> new ArrayList<>()`. El constructor també és un mètode, i també es pot reciclar.

---

## 📋 La taula del `::`

| Referència | Sintaxi | Equival a |
|---|---|---|
| Estàtica | `Math::abs` | `x -> Math.abs(x)` |
| D'instància (classe) | `String::toUpperCase` | `s -> s.toUpperCase()` |
| D'instància (objecte) | `System.out::println` | `s -> System.out.println(s)` |
| Constructor | `ArrayList::new` | `() -> new ArrayList<>()` |

> ⚠️ **Advertència:** la referència a mètode no executa el mètode. `String::toUpperCase` **no** posa res en majúscules: és la recepta, no el menjar. S'executarà quan el stream o la interfície funcional ho demane.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan dubtes entre lambda i referència, pensa en la llegibilitat. `String::toUpperCase` és més net que `s -> s.toUpperCase()`, però una lambda amb lògica (com `s -> s.length() > 3`) no es pot convertir a `::` perquè no crida un únic mètode.

**Exercici: el reciclador de salutacions**

```java
import java.util.function.*;

public class Reciclador {
    public static void main(String[] args) {
        Supplier<String> fabrica = String::new;
        Function<String, String> mayusculas = String::toUpperCase;
        Consumer<String> imprimir = System.out::println;

        String vacio = fabrica.get();
        imprimir.accept(mayusculas.apply(vacio.isEmpty() ? "hola" : vacio));
    }
}
```

**Què imprimeix?**

- (A) `HOLA`
- (B) `hola`
- (C) Res: el `String` està buit.
- (D) Error de compilació: `String::new` no és una referència vàlida.

<details>
<summary>🔄 Solució</summary>

La **A**. `String::new` és una referència al constructor: `fabrica.get()` crea un `String` buit (`""`). Com que `vacio.isEmpty()` és `true`, el ternari tria `"hola"`, i `mayusculas.apply("hola")` crida a `String::toUpperCase` sobre eixe text, donant `"HOLA"`. El `Consumer` amb `System.out::println` ho imprimeix. Tres referències a mètode en tres rols distints: constructor, mètode d'instància i mètode sobre un objecte concret.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què significa `String::toUpperCase` sense parèntesis?
2. Quan usaríes `objeto::metodo` en comptes de `Clase::metodo`?
3. `Math::max` quin tipus de referència és?
4. Què fa `Clase::new`?

<details>
<summary>🔄 Respostes</summary>

1. Una referència al mètode `toUpperCase` de qualsevol `String`, llesta per a cridar-se quan toque. No executa res per si sola.
2. Quan el mètode es crida sobre un objecte concret que ja existeix, com `System.out::println`. `Clase::metodo` serveix per a mètodes que es criden sobre el paràmetre que arribe.
3. Referència a un mètode estàtic d'una classe.
4. Referència al constructor: fabrica objectes nous, com un `Supplier` (`() -> new Clase()`).

</details>

---

## ✅ Resum en 3 frases

1. Una **referència a mètode** (`::`) és una lambda encara més curta: reutilitza un mètode que ja existeix en comptes d'escriure la fletxa.
2. Hi ha quatre tipus: **estàtica** (`Math::abs`), **d'instància sobre classe** (`String::toUpperCase`), **d'instància sobre objecte** (`System.out::println`) i **de constructor** (`ArrayList::new`).
3. Quan la teua lambda només crida un mètode, la referència és més llegible i es comporta exactament igual.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Referència a mètode | Reutilitzar un mètode com a lambda amb `::` |
> | `Clase::estatico` | Referència a un mètode estàtic |
> | `Clase::instancia` | Mètode d'instància cridat sobre el paràmetre que arribe |
> | `objeto::metodo` | Mètode cridat sobre un objecte concret que ja existeix |
> | `Clase::new` | Referència al constructor |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-programacion-funcional) · **Anterior:** [02 · Interfícies funcionals: Predicate, Function, Consumer, Supplier](/ApuntesProgramacion/va/12-programacion-funcional/02-interfaces-funcionales) · **Següent:** [04 · Streams: el flux de dades](/ApuntesProgramacion/va/12-programacion-funcional/04-streams-basicos)