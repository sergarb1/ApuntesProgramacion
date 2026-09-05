---
title: "02 · Escriure i llegir text: FileWriter, FileReader i BufferedReader"
description: "El llapis que no oblida i el lector que no s'ennuega: escriu fitxers amb FileWriter i llig-los línia a línia amb BufferedReader ✍️📖"
---

<p><small>El llapis que no oblida i el lector que no s'ennuega: escriu fitxers amb FileWriter i llig-los línia a línia amb BufferedReader ✍️📖</small></p>

> 🗺️ **Estàs en:** 📁 **U12 · Fitxers i Expressions Regulars** → 02 · Escriure i llegir text: FileWriter, FileReader i BufferedReader

---

## 📬 La idea en una frase

> **`FileWriter` és el llapis que escriu caràcters en un fitxer i `FileReader` el lector que els recupera; amb `BufferedReader` al damunt, llegir línia a línia és bufar i fer ampolles.**

Al punt 1 `File` només et deia si el fitxer existia i quant pesava. Ara toca el bo: **escriure** contingut i **llegir-lo**. Per a escriure tens `FileWriter`; per a llegir, `FileReader`. I si a més emboliques el lector amb `BufferedReader`, podràs llegir fitxers sencers línia a línia sense despeinar-te.

---

## ✍️ Escriure amb FileWriter

`FileWriter` escriu **caràcters** en un fitxer. Si el fitxer no existix, el crea; si existix, el **sobreescriu** per defecte.

```java
import java.io.FileWriter;
import java.io.IOException;

public class EscribirTexto {
    public static void main(String[] args) throws IOException {
        FileWriter escritor = new FileWriter("salida.txt");
        escritor.write("Primera línea.\n");
        escritor.write("Segunda línea.\n");
        escritor.close();
    }
}
```

Vols **afegir al final** sense esborrar l'anterior? Passa-li un segon argument `true` (mode *append*):

```java
FileWriter writer = new FileWriter("bitacora.txt", true);  // afig al final
```

> ⚠️ **Advertència:** sense `close()` o `flush()`, les dades es queden atrapades al buffer intern i es poden perdre. És com escriure una carta i no tancar el sobre: el carter no la recull. Ho veuràs a fons al punt 3 amb `try-with-resources`.

---

## 📖 Llegir amb FileReader + BufferedReader

`FileReader` llig caràcters solts, que és incòmode. La solució: emboliques el `FileReader` amb un `BufferedReader` i uses `readLine()`, que et torna una línia sencera d'una volta (i `null` quan s'acaba el fitxer).

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class LeerTexto {
    public static void main(String[] args) throws IOException {
        BufferedReader lector = new BufferedReader(new FileReader("salida.txt"));
        String linea = lector.readLine();
        while (linea != null) {
            System.out.println(linea);
            linea = lector.readLine();
        }
        lector.close();
    }
}
```

El patró `while ((linea = lector.readLine()) != null)` és el pa de cada dia de Java: llig una línia, comprova que no és `null`, la processa i repetix. Quan `readLine()` torna `null`, el fitxer s'ha acabat.

> 📝 **Nota:** la lectura amb `Scanner` pel teclat la vas vore en la U02 (punt 6). Ací el `Scanner` reapareix al punt 4, però llegint fitxers.

---

## 🚨 I si el fitxer no existix en llegir?

Llances un `FileReader` sobre un fitxer que no existix i... `FileNotFoundException`. És filla de `IOException`, així que tens dos camins:

1. **Declarar** l'excepció en la signatura: `throws IOException` (el que hem fet adalt).
2. **Capturar-la** amb `try-catch` i fer alguna cosa sensata, com avisar l'usuari:

```java
try {
    BufferedReader lector = new BufferedReader(new FileReader("no_existe.txt"));
    String linea;
    while ((linea = lector.readLine()) != null) {
        System.out.println(linea);
    }
    lector.close();
} catch (IOException e) {
    System.out.println("Error al leer: " + e.getMessage());
}
```

> 💡 **Consell:** el camí 2 és el professional: no deixes que el programa muira per un fitxer que falta. El camí 1 és ràpid per a practicar. Al punt 3 veuràs la combinació definitiva.

---

## 🧱 I per què BufferedReader i no FileReader a seques?

`FileReader` et dona caràcters d'un en un. Per a llegir frases has de muntar un bucle d'acumulació. `BufferedReader` et dona **línies senceres** i a més és més ràpid en fitxers grans perquè **llig en blocs** i guarda el que sobra al seu buffer. El patró "embolicar" (`new BufferedReader(new FileReader(...))`) és típic de Java: una classe que afegix superpoders a una altra.

| Tasca | Ferramenta |
|---|---|
| Escriure caràcters | `FileWriter` |
| Escriure afegint al final | `FileWriter(path, true)` |
| Llegir caràcters | `FileReader` |
| Llegir línies senceres (recomanat) | `BufferedReader` embolicant `FileReader` |
| Formatar i escriure amb `println`/`printf` | `PrintWriter` (punt 4) |

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el trio clàssic per a llegir fitxers de text en Java és `BufferedReader` + `FileReader`. El bucle `while ((linea = lector.readLine()) != null)` és l'estàndard que veuràs en milers de projectes.

**Exercici: el comptador que no menteix**

```java
import java.io.*;

public class ContadorLineas {
    public static void main(String[] args) throws IOException {
        File f = new File("datos.txt");
        FileWriter w = new FileWriter(f);
        w.write("linea1\nlinea2\nlinea3\n");
        w.close();

        BufferedReader r = new BufferedReader(new FileReader(f));
        int contador = 0;
        while (r.readLine() != null) {
            contador++;
        }
        r.close();
        System.out.println(contador);
    }
}
```

**Què imprimeix? Compta les línies de veritat?**

<details>
<summary>🔄 Solució</summary>

Imprimeix **3**.

El fitxer es crea amb "linea1", "linea2" i "linea3", cadascuna amb el seu `\n`. El `readLine()` torna cada línia i quan arriba al final torna `null`, i ací s'acaba el `while`. L'últim `\n` no crea una "quarta línia": `readLine()` torna `null` quan no queda més text, no una línia buida.

Detall fi: el codi del `while` ni tan sols guarda la línia. Només la descarta (`r.readLine()` a seques) per a comptar. A vegades no necessites el contingut, només saber quantes línies hi ha.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què fa `FileWriter` amb un fitxer que ja existix per defecte?
2. Com afegixes text al final d'un fitxer sense esborrar l'anterior?
3. Què torna `readLine()` quan el fitxer s'ha acabat?
4. Per què s'embolica `FileReader` amb `BufferedReader`?

<details>
<summary>🔄 Respostes</summary>

1. El sobreescriu des de zero.
2. `new FileWriter("bitacora.txt", true)`: el segon argument `true` activa el mode *append*.
3. `null`. Per això funciona el bucle `while ((linea = lector.readLine()) != null)`.
4. Per a llegir línies senceres amb `readLine()` (i per a ser més ràpid en fitxers grans gràcies al seu buffer).

</details>

---

## ✅ Resum en 3 frases

1. **`FileWriter`** escriu caràcters en un fitxer (el crea si no existix i el sobreescriu si existix); amb l'argument `true` afig al final.
2. **`FileReader`** + **`BufferedReader`** llig fitxers de text línia a línia amb `readLine()`, que torna `null` al final.
3. Sense `close()` (o `flush()`) les dades es queden al buffer: **tanca sempre** o usa `try-with-resources` (punt 3).

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `FileWriter` | Escriu caràcters en un fitxer |
> | `FileReader` | Llig caràcters d'un fitxer |
> | `BufferedReader` | Lector amb buffer que permet `readLine()` |
> | `readLine()` | Torna la següent línia o `null` si no en queda cap |
> | *Append* | Afegir al final del fitxer sense esborrar l'anterior |
> | `FileNotFoundException` | Es llança en llegir un fitxer que no existix |

📁 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-ficheros-regex) · **Anterior:** [01 · La classe File: el teu explorador de fitxers](/ApuntesProgramacion/va/12-ficheros-regex/01-clase-file) · **Següent:** [03 · try-with-resources: tancar sense plorar](/ApuntesProgramacion/va/12-ficheros-regex/03-try-with-resources)