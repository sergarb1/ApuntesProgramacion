---
title: "03 · try-with-resources: tancar sense plorar"
description: "La porta que es tanca sola: deixa que Java faça servir close() per tu, encara que salte una excepció enmig del camí 🔒🚪"
---

<p><small>La porta que es tanca sola: deixa que Java faça servir close() per tu, encara que salte una excepció enmig del camí 🔒🚪</small></p>

> 🗺️ **Estàs en:** 📁 **U12 · Fitxers i Expressions Regulars** → 03 · try-with-resources: tancar sense plorar

---

## 📬 La idea en una frase

> **En comptes d'acordar-te de tancar cada fitxer, li dius a Java "tanca això quan acabis, passe el que passe" i ell ho fa sol.**

Al punt 2 vas vore que sense `close()` les dades es poden perdre. Però acordar-te de tancar, i a més quan hi ha excepcions pel mig, és un patiment. Des de Java 7 existix el `try-with-resources`: obris els recursos dins dels parèntesis del `try` i Java els tanca automàticament en eixir del bloc, tant si tot va bé com si salta una excepció.

---

## 🔒 El try-with-resources en acció

Mira com de net queda el lector del punt 2 sense `close()` manual:

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class LectorLimpio {
    public static void main(String[] args) {
        try (BufferedReader br = new BufferedReader(new FileReader("salida.txt"))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                System.out.println(linea);
            }
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
        // No hi ha br.close(). Es tanca sol.
    }
}
```

El que passa per darrere: en eixir del bloc `try` (amb èxit o amb excepció), Java crida a `close()` sobre cada recurs que vas declarar entre parèntesis. És el `finally` que t'estalvies escriure.

> 💡 **Consell:** fixa't que el `catch` continua existint. El `try-with-resources` tanca els recursos, però no s'empassa les excepcions: tu decidixes com gestionar-les.

---

## 🧹 Diversos recursos alhora

¿Llegir d'un fitxer i escriure en un altre? Declara els dos recursos separats per `;` i Java els tanca **en ordre invers** al de declaració:

```java
import java.io.*;

public class Copiador {
    public static void main(String[] args) {
        try (BufferedReader br = new BufferedReader(new FileReader("origen.txt"));
             PrintWriter pw = new PrintWriter(new FileWriter("copia.txt"))) {

            String linea;
            while ((linea = br.readLine()) != null) {
                pw.println(linea);
            }
            System.out.println("Copia terminada.");
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
```

És el patró estàndard per a copiar fitxers: llig línia a línia i escriu-la al destí. I si un dels dos no es pot obrir, no passa res: Java intenta tancar els que sí que es van obrir.

---

## 🤔 Quins recursos valen?

Només valen els que implementen `AutoCloseable` (o la seua filla `Closeable`). Les classes de fitxers que hem vist (`FileReader`, `FileWriter`, `BufferedReader`, `PrintWriter`, `ObjectInputStream`...) la implementen. En general: si la classe té `close()`, quasi segur que val.

> ⚠️ **Advertència:** `Scanner` també és `AutoCloseable`, així que pots fer `try (Scanner sc = new Scanner(new File(...)))`. Ull, no el uses per a tancar un `Scanner` que llig del teclat en un programa llarg: al tancar-lo, tanques també l'entrada estàndard i a partir d'ací tot `nextLine()` et dona errors. Per al teclat, un `Scanner` normal i un `close()` al final.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `try-with-resources` no és només per a fitxers: val per a qualsevol recurs que calga alliberar. Si la teua classe necessita netejar-se en acabar, que implemente `AutoCloseable` i la fiques entre els parèntesis.

**Exercici: el diari que no oblida (mode append)**

```java
import java.io.*;
import java.time.LocalDate;

public class Diario {
    public static void main(String[] args) {
        try (FileWriter fw = new FileWriter("diario.txt", true)) {
            fw.write(LocalDate.now() + ": Hoy he aprendido try-with-resources.\n");
        } catch (IOException e) {
            System.out.println("No pude escribir el diario: " + e.getMessage());
        }
    }
}
```

**Què passa si executes el programa dues vegades? I què fa el `LocalDate.now()`?**

<details>
<summary>🔄 Solució</summary>

Executat **dues vegades**, el fitxer `diario.txt` tindrà **dues línies** amb la data de hui. El mode *append* (`true`) afig al final sense esborrar l'anterior, així que cada execució suma una entrada. Perfecte per a un diari de veritat.

`LocalDate.now()` torna la data actual del sistema (per exemple, `2026-09-06`), en format ISO. És la forma moderna de demanar "quin dia és hui" sense liar-te amb `Date` i `Calendar`.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què fa Java en eixir del bloc d'un `try-with-resources`?
2. En quin ordre es tanquen diversos recursos declarats en el `try`?
3. Quina interfície ha d'implementar un recurs per a poder usar-lo en `try-with-resources`?
4. El `try-with-resources` elimina la necessitat de `catch`?

<details>
<summary>🔄 Respostes</summary>

1. Crida a `close()` sobre tots els recursos declarats, tant si tot va bé com si hi va haver excepció.
2. En ordre invers al que es van declarar.
3. `AutoCloseable` (o la seua subinterfície `Closeable`).
4. No. El `try-with-resources` tanca els recursos, però les excepcions s'han de capturar o declarar igualment.

</details>

---

## ✅ Resum en 3 frases

1. **`try-with-resources`** declara els recursos entre parèntesis del `try` i Java els tanca sol en eixir, amb èxit o amb excepció: adéu al `close()` oblidat.
2. Pots obrir **diversos recursos alhora** (separats per `;`) i es tanquen en ordre invers.
3. Només valen recursos que implementen **`AutoCloseable`**/**`Closeable`**, que és el cas de totes les classes de fitxers de Java.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `try-with-resources` | Bloc `try` que tanca els seus recursos automàticament |
> | `AutoCloseable` | Interfície amb `close()` que marca un recurs com a "alliberable" |
> | `Closeable` | Subinterfície de `AutoCloseable`, la que usen els streams clàssics |
> | Recurs | Alguna cosa que s'ha d'alliberar: fitxer, connexió, scanner... |
> | *Append* | Afegir al final d'un fitxer (segon argument `true` de `FileWriter`) |

📁 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-ficheros-regex) · **Anterior:** [02 · Escriure i llegir text: FileWriter, FileReader i BufferedReader](/ApuntesProgramacion/va/12-ficheros-regex/02-escribir-leer-texto) · **Següent:** [04 · PrintWriter i Scanner + File](/ApuntesProgramacion/va/12-ficheros-regex/04-printwriter-scanner-file)