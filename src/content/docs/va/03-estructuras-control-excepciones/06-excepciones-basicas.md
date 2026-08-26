---
title: 06 — Excepcions bàsiques
description: "Quan Java es queixa per escrit: la família Throwable i les queixes més típiques 💥"
---

<p><small>Quan Java es queixa per escrit: la família Throwable i les queixes més típiques 💥</small></p>

> 🗺️ **Estàs en:** 🔀 **U03 · Estructures de Control i Excepcions** → 06 · Excepcions bàsiques

---

## 📬 La idea en una frase

> **Una excepció és un avís que alguna cosa ha eixit malament; Java el llança com un objecte que hereta de `Throwable`, i el teu programa pot estar o no preparat per a atrapar-lo.**

T'ha passat que un programa es "cau" amb un munt de text roig? Eixe text és una excepció. En comptes de morir en silenci, Java crida amb tot el detall. Aprendre a llegir eixos crits és aprendre a depurar.

---

## 💥 El crash: la teua primera excepció

Executa això:

```java
public class Explosio {
    public static void main(String[] args) {
        int[] numeros = {1, 2, 3};
        System.out.println(numeros[5]);   // no existix!
    }
}
```

Java no es calla. Apareix una cosa així:

```
Exception in thread "main" java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 3
	at Explosio.main(Explosio.java:5)
```

Este text és or: et diu **què** excepció (`ArrayIndexOutOfBoundsException`), **on** (línia 5) i en **quin mètode**. Llegir-lo bé resol la mitat dels teus problemes.

---

## 🌳 La família Throwable: l'arbre genealògic

Totes les excepcions hereten d'una classe mare:

```
Object
 └── Throwable
      ├── Error                  (coses que no hauries d'intentar arreglar)
      └── Exception              (el que de veritat ens interessa)
           ├── RuntimeException  (excepcions en temps d'execució)
           └── (altres excepcions "controlades")
```

- **`Error`**: problemes greus de la JVM (memòria esgotada, per exemple). No els provoques tu i no has d'intentar atrapar-los. Ignora'ls.
- **`Exception`**: fallades del programa. Ací viu el 99% de la teua vida.
- **`RuntimeException`**: subfamília d'`Exception` que es llança en **temps d'execució** i que **no estàs obligat** a capturar. Ací viuen les més famoses.

```java
// Totes estes són RuntimeException (no necessites try perquè compile):
int x = 10 / 0;                        // ArithmeticException
int[] a = new int[3]; a[9] = 1;        // ArrayIndexOutOfBoundsException
String s = null; s.length();           // NullPointerException
int num = Integer.parseInt("Hola");    // NumberFormatException
```

> 💡 **Detall pràctic:** "RuntimeException" significa que l'error apareix quan el programa **corre**, no en compilar. El compilador no t'avisa: només ho descobrixes en plena execució.

---

## 🗺️ Les excepcions més comunes: la guia de camp

| Excepció | Quan apareix | Frase típica |
|---|---|---|
| `ArithmeticException` | Dividir entre 0 | "Dividir entre zero, quin valent" |
| `ArrayIndexOutOfBoundsException` | Índex fora de l'array | "Eixe buit no existix" |
| `NullPointerException` | Cridar alguna cosa `null` | "El clàssic absolut" |
| `NumberFormatException` | Convertir text que no és nombre | "Convertir 'Hola' en nombre, no" |
| `StringIndexOutOfBoundsException` | Índex fora d'un `String` | "substring() més enllà del final" |
| `InputMismatchException` | `Scanner` rep el tipus equivocat | "Vas posar text on anava un nombre" |

> ⚠️ **Advertència:** la `NullPointerException` (NPE) és, amb diferència, l'excepció més comuna de la història de Java. La teua àvia, si programara, també la tindria. El missatge sol ser un críptic "null" seguit de la línia on vas tocar un objecte que no existia.

---

## 🏫 Exemple guiat: el lector d'edats

Un programa que demana una edat per teclat pot explotar si l'usuari escriu lletres. Vegem el crash i després l'arreglarem en el punt 7:

```java
import java.util.Scanner;

public class LectorEdat {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Quants anys tens? ");
        int edat = sc.nextInt();
        System.out.println("Vas nàixer fa " + edat + " anys.");
        sc.close();
    }
}
```

Si escrius `hola`, obtens una `InputMismatchException`. El programa mor. La solució és atrapar l'excepció amb `try`/`catch`... que és justament el punt 7.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan un programa explote, llig la primera línia de l'error: el nom de l'excepció et diu *què* ha passat, i la línia amb `at ...` et diu *on*. És un GPS amb acusacions.

**Exercici: el detectiu d'excepcions**

Digues quina excepció llançaria cada línia (o si no llançaria cap):

```java
int a = 5 / 0;
String[] dies = {"L", "M", "X"};
System.out.println(dies[3]);
String text = null;
System.out.println(text.toUpperCase());
int b = Integer.parseInt("42");
int c = Integer.parseInt("quaranta-dos");
```

<details>
<summary>🔄 Solució</summary>

- `5 / 0` → **`ArithmeticException`** (divisió entre zero).
- `dies[3]` → **`ArrayIndexOutOfBoundsException`** (un array de 3 buits s'indexa 0, 1, 2).
- `text.toUpperCase()` → **`NullPointerException`** (`text` és `null`).
- `parseInt("42")` → **Sense excepció**: 42 sí que és un nombre.
- `parseInt("quaranta-dos")` → **`NumberFormatException`** (eixe text no és un nombre).

</details>

---

## 🎯 Mini-chequeig

1. Quina classe està a l'arrel de totes les excepcions?
2. Quina diferència hi ha entre `Error` i `Exception`?
3. Què significa que siga una `RuntimeException`?
4. Quina és l'excepció més famosa de la història i quan apareix?

<details>
<summary>🔄 Respostes</summary>

1. **`Throwable`**.
2. `Error` són problemes greus de la JVM que no has d'intentar arreglar; `Exception` són fallades del programa que sí que pots capturar.
3. Que es llança **en temps d'execució** (no en compilar) i que **no estàs obligat** a capturar-la.
4. La **`NullPointerException`**: apareix en tocar un objecte que val `null`.

</details>

---

## ✅ Resum en 3 frases

1. Una excepció és un **objecte** que Java llança quan alguna cosa eix malament i que hereta de `Throwable`.
2. La família es dividix en `Error` (greus, no tocar), `Exception` (capturables) i `RuntimeException` (es llancen en executar, sense obligació de capturar-les).
3. Llegir el missatge de l'excepció (què, on, en quin mètode) és la primera habilitat d'un bon depurador.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Excepció | Objecte que representa un error en el programa |
> | `Throwable` | Classe arrel d'errors i excepcions |
> | `Error` | Fallada greu de la JVM, no capturable |
> | `Exception` | Fallada del programa, capturable |
> | `RuntimeException` | Excepció d'execució, sense captura obligatòria |
> | Trace | El "stack trace": la llista de crides fins al fallo |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/03-estructuras-control-excepciones) · **Anterior:** [05 · break i continue](/ApuntesProgramacion/va/03-estructuras-control-excepciones/05-break-continue) · **Següent:** [07 · try, catch i finally](/ApuntesProgramacion/va/03-estructuras-control-excepciones/07-try-catch-finally)
