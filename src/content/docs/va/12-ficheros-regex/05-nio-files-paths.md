---
title: "05 · NIO: Files i Paths (la forma moderna)"
description: "Llegir, escriure i consultar fitxers en una línia: l'API NIO va arribar perquè el vell File semble del segle passat ⚡🗃️"
---

<p><small>Llegir, escriure i consultar fitxers en una línia: l'API NIO va arribar perquè el vell File semble del segle passat ⚡🗃️</small></p>

> 🗺️ **Estàs en:** 📁 **U12 · Fitxers i Expressions Regulars** → 05 · NIO: Files i Paths (la forma moderna)

---

## 📬 La idea en una frase

> **`Path` és la ruta moderna i `Files` la seua navalla suïssa: `readAllLines`, `write`, `readString`... coses que amb `File` costaven cinc línies i amb NIO són una.**

Des de Java 7 existix l'API **NIO** (New I/O) en `java.nio.file`. És el reemplaçament modern de la classe `File`: `Path` per a representar rutes i `Files` per a fer tot lo altre. ¿Llegir un fitxer sencer en una llista de línies? Una línia de codi. ¿Escriure una llista en un fitxer? Una altra. El vell `File` continua funcionant, però quan veges això ja no voldràs tornar.

---

## 🗃️ Path i Paths: el nou File

`Path` és la ruta (com `File`, però més lleugera i pensada per a compondre's). Es crea amb la classe `Paths`:

```java
import java.nio.file.Path;
import java.nio.file.Paths;

Path ruta = Paths.get("C:/datos/notas.txt");
Path relativa = Paths.get("notas.txt");              // relativa al directori de treball
Path combinada = Paths.get("datos", "sub", "f.txt"); // amb separadors a prova de SO
```

`Paths.get(...)` amb diversos arguments construïx la ruta usant el separador del sistema operatiu (en Windows `\`, en Linux `/`). És la forma de no liar-te amb barres.

> 💡 **Consell:** els mètodes de `Path` (`getFileName()`, `getParent()`, `exists()`, `isDirectory()`...) són els mateixos conceptes de `File`. La diferència gran està en `Files`, la classe estàtica que fa el treball pesat.

---

## ⚡ Files: la navalla suïssa

La classe estàtica `Files` és on viu la màgia. Estos són els mètodes que usaràs el 90% del temps:

```java
import java.nio.file.*;
import java.util.List;

public class NioFacil {
    public static void main(String[] args) throws Exception {
        Path ruta = Paths.get("notas.txt");

        // Escriure una llista de línies (sobreescriu)
        Files.write(ruta, List.of("Línea 1", "Línea 2", "Línea 3"));

        // Llegir tot el fitxer en una llista de línies
        List<String> lineas = Files.readAllLines(ruta);
        for (String linea : lineas) {
            System.out.println(linea);
        }

        // Llegir tot el fitxer com un únic String
        String contenido = Files.readString(ruta);

        // Altres consultes útils
        System.out.println("¿Existe? " + Files.exists(ruta));
        System.out.println("¿Es archivo? " + Files.isRegularFile(ruta));
        System.out.println("Tamaño: " + Files.size(ruta) + " bytes");
    }
}
```

> ⚠️ **Advertència:** `Files.write` i `readAllLines` carreguen el fitxer sencer en memòria. Per a fitxers gegants usa `Files.newBufferedReader(ruta)` (com al punt 2, però sense `FileReader` pel mig) i llig línia a línia.

---

## 📋 Altres joies de Files

| Mètode | Què fa |
|---|---|
| `Files.readAllLines(ruta)` | Tot el fitxer com a `List<String>` |
| `Files.write(ruta, llista)` | Escriu una llista de línies (sobreescriu) |
| `Files.readString(ruta)` | Tot el fitxer com un únic `String` |
| `Files.writeString(ruta, text)` | Escriu un `String` |
| `Files.newBufferedReader(ruta)` | `BufferedReader` directe sobre un `Path` |
| `Files.newBufferedWriter(ruta)` | `BufferedWriter` directe sobre un `Path` |
| `Files.copy(origen, destí)` | Copia un fitxer |
| `Files.move(origen, destí)` | Mou (o reanomena) |
| `Files.delete(ruta)` | Esborra (llança excepció si no existix) |
| `Files.deleteIfExists(ruta)` | Esborra si existix, sense excepció |
| `Files.walk(ruta)` | Recorre recursivament tot un arbre de fitxers |
| `Files.lines(ruta)` | Un `Stream<String>` línia a línia (per a fitxers grans) |

La parella `Files.walk` + filtre és la forma elegant de "busca tots els `.java` en una carpeta i les seues subcarpetes":

```java
import java.nio.file.*;
import java.util.stream.Stream;

try (Stream<Path> rutas = Files.walk(Paths.get("src"))) {
    rutas.filter(p -> p.toString().endsWith(".java"))
         .forEach(System.out::println);
}
```

> 📝 **Nota:** no passa res si el `Stream` t'aclapara: és la U05 amb esteroides. L'important ara és el patró: `Files.walk` et dona totes les rutes i tu filtres la que t'interessa.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** NIO usa `Path` i `Files`. Són més moderns i tenen mètodes útils com `Files.walk()` per a recórrer arbres. Quan veges codi nou de Java, el 80% de les vegades usa NIO.

**Exercici: Be the NIO**

```java
import java.nio.file.*;
import java.util.*;

public class BeTheNIO {
    public static void main(String[] args) throws Exception {
        Path p = Paths.get("nums.txt");
        Files.write(p, List.of("3", "7", "2", "9", "5"));
        List<String> l = Files.readAllLines(p);
        int suma = 0;
        for (String s : l) {
            suma += Integer.parseInt(s);
        }
        Files.write(p, List.of("Total: " + suma));
        System.out.println(Files.readString(p));
    }
}
```

**Què imprimeix?**

<details>
<summary>🔄 Solució</summary>

Imprimeix **`Total: 26`**.

Pas a pas:
1. `Files.write` crea `nums.txt` amb les línies `3`, `7`, `2`, `9`, `5`.
2. `readAllLines` les llig i el bucle les convertix a `int` i les suma: `3+7+2+9+5 = 26`.
3. `Files.write` **sobreescriu** el fitxer amb una sola línia: `Total: 26`.
4. `Files.readString` llig tot el fitxer i `println` ho imprimeix: `Total: 26`.

Fixa't que el segon `Files.write` no afig: sobreescriu. Si volgueres afegir, tindries `Files.write(p, llista, StandardOpenOption.APPEND)`.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Amb quina classe crees un `Path`?
2. Quin mètode de `Files` llig un fitxer sencer com a `List<String>`?
3. Quin mètode de `Files` recorre un arbre de carpetes recursivament?
4. `Files.write` afig al final o sobreescriu?

<details>
<summary>🔄 Respostes</summary>

1. Amb `Paths` (`Paths.get(...)`). El plural té raó de ser: `Path` és la ruta, `Paths` la fàbrica.
2. `Files.readAllLines(ruta)`.
3. `Files.walk(ruta)`, que torna un `Stream<Path>` amb tot el que hi ha a sota.
4. Sobreescriu. Per a afegir, `Files.write(ruta, llista, StandardOpenOption.APPEND)`.

</details>

---

## ✅ Resum en 3 frases

1. **`Path`** (creat amb `Paths.get`) és la ruta moderna i **`Files`** la classe estàtica que fa el treball: `readAllLines`, `write`, `readString`, `copy`, `move`, `delete`, `walk`.
2. Llegir o escriure un fitxer complet són **operacions d'una línia**, sense `close()` perquè NIO s'encarrega.
3. `Files` ho carrega tot en memòria: per a fitxers enormes usa `Files.newBufferedReader` o `Files.lines` i processa en streaming.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | NIO | "New I/O": l'API moderna d'entrada/eixida de `java.nio.file` |
> | `Path` | La ruta moderna (el `File` nou) |
> | `Paths` | Fàbrica de `Path` |
> | `Files` | Classe estàtica amb les operacions sobre rutes |
> | `Stream` | Seqüència de dades sobre la qual pots filtrar, transformar i recórrer |

📁 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-ficheros-regex) · **Anterior:** [04 · PrintWriter i Scanner + File](/ApuntesProgramacion/va/12-ficheros-regex/04-printwriter-scanner-file) · **Següent:** [06 · Serialització: guardar objectes amb ObjectOutputStream](/ApuntesProgramacion/va/12-ficheros-regex/06-serializacion)