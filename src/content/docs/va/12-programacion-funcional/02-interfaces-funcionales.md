---
title: "02 · Interfícies funcionals: Predicate, Function, Consumer, Supplier"
description: "Els quatre vestits oficials de tota lambda: què espera cada un i com llegir la seua firma 🎭"
---

<p><small>Els quatre vestits oficials de tota lambda: què espera cada un i com llegir la seua firma 🎭</small></p>

> 🗺️ **Estàs en:** 🎯 **U12 · Programació Funcional** → 02 · Interfícies funcionals: Predicate, Function, Consumer, Supplier

---

## 📬 La idea en una frase

> **Una interfície funcional és una interfície amb un únic mètode abstracte. Java ja et regala les quatre més usades en `java.util.function`: `Predicate` (comprova), `Function` (transforma), `Consumer` (consumeix) i `Supplier` (fabrica).**

En el punt 1 vas vore que per a guardar una lambda en una variable necessites una interfície funcional. Hui et presente els quatre vestits oficials que Java et dona fets. Ja no cal inventar-se interfícies pròpies com `Transformador`: l'armari de `java.util.function` està ple.

---

## 🎭 Què és una interfície funcional?

És una interfície amb **exactament un mètode abstracte**. Eixe mètode és la firma que tota lambda ha de complir: si la interfície espera `boolean test(int)`, la teua lambda ha de ser una cosa que reba un `int` i torne un `boolean`.

Perquè el compilador et faça una mà, existeix l'anotació `@FunctionalInterface`: si algú intenta afegir un segon mètode abstracte, el compilador munta en còlera.

```java
@FunctionalInterface
interface Transformador {
    int transformar(int x);
    // int otroMetodo();  // 🚫 Error de compilació: només un mètode abstracte
}
```

> ⚠️ **Advertència:** `@FunctionalInterface` és opcional. La interfície funciona igual sense ella; l'anotació només serveix perquè el compilador verifique que seguixes les regles. Com un cinturó de seguretat: ningú t'obliga, però és bona idea.

---

## 🎭 Els quatre vestits oficials

### 1. `Predicate<T>` — el jutge

Comprova si alguna cosa compleix una condició. El seu mètode abstracte: **`boolean test(T t)`**.

```java
import java.util.function.Predicate;

Predicate<Integer> esPar = n -> n % 2 == 0;
System.out.println(esPar.test(4));   // true
System.out.println(esPar.test(7));   // false
```

### 2. `Function<T, R>` — el transformador

Rep una cosa de tipus `T` i torna una altra de tipus `R`. El seu mètode abstracte: **`R apply(T t)`**.

```java
import java.util.function.Function;

Function<String, Integer> longitud = s -> s.length();
System.out.println(longitud.apply("java"));   // 4

Function<String, String> gritando = s -> s.toUpperCase();
System.out.println(gritando.apply("hola"));   // HOLA
```

### 3. `Consumer<T>` — el que consumeix sense tornar

Fa alguna cosa amb el valor i no torna res. El seu mètode abstracte: **`void accept(T t)`**.

```java
import java.util.function.Consumer;

Consumer<String> imprimir = s -> System.out.println(s);
imprimir.accept("¡Hola!");
```

### 4. `Supplier<T>` — el fabricant

No rep res i produïx un valor. El seu mètode abstracte: **`T get()`**.

```java
import java.util.function.Supplier;

Supplier<String> fabricaSaludos = () -> "¡Hola!";
System.out.println(fabricaSaludos.get());   // ¡Hola!
```

---

## 📋 La xurrera de les quatre

| Interfície | Mètode abstracte | Què fa | Lambda típica |
|---|---|---|---|
| `Predicate<T>` | `boolean test(T)` | Comprova una condició | `n -> n % 2 == 0` |
| `Function<T, R>` | `R apply(T)` | Transforma un valor en un altre | `s -> s.length()` |
| `Consumer<T>` | `void accept(T)` | Consumeix sense tornar | `s -> System.out.println(s)` |
| `Supplier<T>` | `T get()` | Fabrica un valor sense entrada | `() -> new ArrayList<>()` |

Fixa't en el patró per a llegir-los sense por: el nom et diu el paper (**pre**dica, **fun**ció, **con**sumeix, **sup**lix) i la firma et diu el contracte. Quan en els punts següents veges `filter(n -> ...)`, `map(n -> ...)`, `forEach(...)` o `orElseGet(...)`, tots estaran demanant un d'estos vestits per darrere.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan una lambda no encaixa en `Predicate`, `Function`, `Consumer` o `Supplier`, Java té desenes de variants (`BiFunction`, `IntFunction`, `UnaryOperator`...). Comença sempre per les quatre bàsiques i amplia només si cal.

**Exercici: el porter de discoteca (versió funcional)**

```java
import java.util.function.*;

public class Portero {
    public static void main(String[] args) {
        Predicate<Integer> mayorDeEdad = edad -> edad >= 18;
        Function<Integer, String> etiqueta = edad -> edad >= 18 ? "ADULTO" : "MENOR";
        Consumer<String> anunciar = s -> System.out.println("Entrada: " + s);
        Supplier<Integer> reloj = () -> 20;

        int edad = reloj.get();
        if (mayorDeEdad.test(edad)) {
            anunciar.accept(etiqueta.apply(edad));
        }
    }
}
```

**Què imprimeix?**

- (A) `Entrada: ADULTO`
- (B) `Entrada: MENOR`
- (C) Res: l'`if` mai no es compleix.
- (D) Error de compilació: no es poden combinar quatre lambdes així.

<details>
<summary>🔄 Solució</summary>

La **A**. `reloj.get()` torna `20`, `mayorDeEdad.test(20)` és `true` (20 ≥ 18), i dins de l'`if` s'encadenen les altres dos: `etiqueta.apply(20)` torna `"ADULTO"` i `anunciar.accept("ADULTO")` imprimeix `Entrada: ADULTO`. Fixa't en com cada vestit fa el seu paper: el `Supplier` fabrica la dada, el `Predicate` decideix, la `Function` transforma i el `Consumer` actua. És el ball complet de `java.util.function`.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin mètode abstracte té `Predicate<T>` i què torna?
2. Què torna `Function<T, R>`?
3. Per a què serveix `Consumer<T>`?
4. I `Supplier<T>`?

<details>
<summary>🔄 Respostes</summary>

1. `boolean test(T)` — torna `true` o `false` segons una condició.
2. `R apply(T)` — transforma un valor de tipus `T` en un altre de tipus `R`.
3. Per a accions que no tornen res: `void accept(T)`. Ideal per a imprimir, guardar, enviar...
4. Produïx un valor sense rebre paràmetres: `T get()`. El proveïdor peresós.

</details>

---

## ✅ Resum en 3 frases

1. Una **interfície funcional** és una interfície amb un únic mètode abstracte: és la firma que tota lambda ha de complir.
2. Els quatre vestits oficials de `java.util.function` són **`Predicate`** (`test`), **`Function`** (`apply`), **`Consumer`** (`accept`) i **`Supplier`** (`get`).
3. L'anotació **`@FunctionalInterface`** li demana al compilador que verifique que la interfície és funcional: un únic mètode abstracte i res més.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Interfície funcional | Interfície amb un únic mètode abstracte |
> | `Predicate<T>` | Comprova una condició: `boolean test(T)` |
> | `Function<T, R>` | Transforma un valor: `R apply(T)` |
> | `Consumer<T>` | Consumeix sense tornar: `void accept(T)` |
> | `Supplier<T>` | Fabrica un valor: `T get()` |
> | `@FunctionalInterface` | Anotació que valida que la interfície és funcional |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-programacion-funcional) · **Anterior:** [01 · Lambdes: funcions que viatgen soles](/ApuntesProgramacion/va/12-programacion-funcional/01-lambdas) · **Següent:** [03 · Referències a mètodes: la drecera `::`](/ApuntesProgramacion/va/12-programacion-funcional/03-referencias-metodos)