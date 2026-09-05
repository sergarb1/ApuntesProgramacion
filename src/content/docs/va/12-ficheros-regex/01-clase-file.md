---
title: "01 · La classe File: el teu explorador de fitxers"
description: "El GPS que localitza fitxers sense llegir-ne el contingut: existeix, és fitxer, és carpeta, quant pesa i què hi ha dins 🗂️📍"
---

<p><small>El GPS que localitza fitxers sense llegir-ne el contingut: existeix, és fitxer, és carpeta, quant pesa i què hi ha dins 🗂️📍</small></p>

> 🗺️ **Estàs en:** 📁 **U12 · Fitxers i Expressions Regulars** → 01 · La classe File: el teu explorador de fitxers

---

## 📬 La idea en una frase

> **`File` no és el contingut d'un fitxer: és la targeta de visita que et diu on està, com es diu, quant pesa i si existix. Abans de llegir o escriure, pregunta-li al GPS.**

En la U11 guardaves les teues dades en memòria: llistes, mapes, objectes... tot viu mentre el programa corre. Però i si vols saber si un fitxer existix abans d'obrir-lo? I si necessites recórrer les carpetes del teu disc? Ací entra la classe `File`. No llig ni escriu res: només explora i descriu. És el porter de l'edifici dels fitxers.

---

## 🗂️ File: el GPS dels teus fitxers

La classe `File` (en `java.io`) representa una **ruta** en el teu sistema: un fitxer o una carpeta. El més important que has de gravar a foc: **`new File("ruta")` no crea res**. Només crea l'objecte que representa eixa ruta. Crear el fitxer de veritat és una altra història (ho veuràs al punt 2).

```java
import java.io.File;

File f = new File("C:/datos/notas.txt");
System.out.println("¿Existe? " + f.exists());            // true o false
System.out.println("¿Es archivo? " + f.isFile());        // ¿és un fitxer i no una carpeta?
System.out.println("¿Es carpeta? " + f.isDirectory());   // ¿és un directori?
System.out.println("Tamaño: " + f.length() + " bytes");  // pes en bytes
System.out.println("Ruta absoluta: " + f.getAbsolutePath()); // l'adreça completa
System.out.println("Nombre: " + f.getName());            // només el nom amb extensió
```

> 💡 **Consell:** en Windows usa `/` o `\\`. Escriu `"C:/datos/notas.txt"` o `"C:\\datos\\notas.txt"`. Amb una sola `\` Java creu que comences un caràcter especial (`\n`, `\t`...) i t'enredaràs. Això es posa interessant amb les regex al punt 7: les contrabarres es dupliquen pertot.

### El repertori imprescindible

| Mètode | Què et diu |
|---|---|
| `exists()` | Existix la ruta? |
| `isFile()` | És un fitxer (i no una carpeta)? |
| `isDirectory()` | És una carpeta? |
| `length()` | Grandària en bytes |
| `getName()` | Nom del fitxer (sense la ruta) |
| `getAbsolutePath()` | Ruta completa |
| `getParent()` | La carpeta que el conté |
| `listFiles()` | Els fitxers i carpetes que hi ha dins (si és un directori) |
| `createNewFile()` | Crea el fitxer buit (torna `false` si ja existia) |
| `mkdir()` / `mkdirs()` | Crea la carpeta (amb `mkdirs`, crea també les intermèdies) |

> ⚠️ **Advertència:** `File` **no llig contingut**. Li preguntes *"existix? quant pesa? és carpeta?"* i et contesta. Per a llegir el de dins, ja arribaran `FileReader`, `BufferedReader`, `Scanner` i `Files.readAllLines()` en els pròxims punts. Cadascú al seu ofici.

---

## 📁 Recórrer una carpeta amb listFiles

`listFiles()` et torna un array amb tot el que hi ha dins d'una carpeta. Perfecte per a l'"explorador de fitxers" casolà:

```java
import java.io.File;

public class Explorador {
    public static void main(String[] args) {
        File carpeta = new File("C:/datos");
        if (carpeta.exists() && carpeta.isDirectory()) {
            File[] contenidos = carpeta.listFiles();
            for (File item : contenidos) {
                String tipo = item.isDirectory() ? "[CARPETA] " : "[ARCHIVO] ";
                System.out.println(tipo + item.getName() + " (" + item.length() + " bytes)");
            }
        } else {
            System.out.println("Esa ruta no es una carpeta existente.");
        }
    }
}
```

Recorda comprovar `exists()` i `isDirectory()` abans de `listFiles()`: si la ruta no existix, `listFiles()` torna `null` i el `for-each` t'esclata a la cara.

---

## 📝 La ruta no és el contingut

Un error típic de novell és creure que `new File("notas.txt")` "crea" el fitxer o que en construir un `File` ja "lliges" alguna cosa. No:

```java
File f = new File("notas.txt");   // Només representa la ruta. No existix res nou en el disc.
boolean creado = f.createNewFile();  // AIXÒ sí intenta crear-lo. Torna false si ja existia.
```

`createNewFile()` crea un fitxer **buit** i torna `true` si l'ha creat, o `false` si ja existia. Si la carpeta no existix, llança `IOException`. El patró habitual: comprova `exists()` abans de decidir què fer.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** File representa rutes, no contingut. Per a llegir el contingut usa `Scanner`, `BufferedReader` o `Files.readAllLines()`. El GPS no t'explica el que hi ha dins de l'edifici: només et porta a la porta.

**Exercici: el detectiu de fitxers**

```java
import java.io.*;

public class DetectiveDeArchivos {
    public static void main(String[] args) throws IOException {
        File f = new File("misterio.txt");
        if (!f.exists()) {
            System.out.println("Creando archivo...");
            FileWriter w = new FileWriter(f);
            w.write("Tres\npalabras\nmisteriosas\n");
            w.close();
        }
        BufferedReader r = new BufferedReader(new FileReader(f));
        String s = "";
        String linea;
        while ((linea = r.readLine()) != null) {
            s = linea + " " + s;
        }
        r.close();
        System.out.println(s);
    }
}
```

**Què imprimeix la PRIMERA vegada? I la SEGONA vegada (quan el fitxer ja existix)?**

<details>
<summary>🔄 Solució</summary>

La **primera** vegada: el fitxer no existix, així que es crea amb les paraules "Tres", "palabras" i "misteriosas". Després es llig i es concatena **al revés**: `misteriosas palabras Tres`.

La **segona** vegada: el fitxer ja existix (`exists()` és `true`), així que no es recrea i es llig el mateix → torna a imprimir `misteriosas palabras Tres`.

La trampa està en l'`if (!f.exists())`: la primera execució "crea el fitxer", però les següents no. El contingut no canvia mai, així que l'eixida és sempre la mateixa.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Crea alguna cosa `new File("notas.txt")` en el disc?
2. Quin mètode torna `true` si una ruta és una carpeta?
3. Què torna `createNewFile()` si el fitxer ja existix?
4. Per a què servix `length()`?

<details>
<summary>🔄 Respostes</summary>

1. No. Només crea un objecte que representa la ruta. Per a crear el fitxer, `createNewFile()` (o un `FileWriter`, punt 2).
2. `isDirectory()`.
3. `false` (el fitxer ja existia, no ha creat res de nou).
4. Per a saber la grandària del fitxer en bytes. Servix per a decidir si et fa mandra llegir-lo sencer.

</details>

---

## ✅ Resum en 3 frases

1. **`File`** és un GPS de rutes: et diu si existixen, si són fitxer o carpeta, quant pesen i què contenen (`listFiles()`), però **no llig contingut**.
2. `new File("ruta")` **no crea res**: crea l'objecte que representa la ruta. Per a crear, `createNewFile()`, `mkdir()`/`mkdirs()` o un `FileWriter`.
3. Abans d'operar amb una ruta, comprova `exists()` i `isFile()`/`isDirectory()`: els mètodes tornen `false` o `null` si la ruta no és l'esperada.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `File` | Objecte que representa una ruta (fitxer o carpeta) en el sistema |
> | Ruta | L'"adreça" d'un fitxer: `C:/datos/notas.txt` |
> | Ruta relativa | Adreça des del directori de treball (`"notas.txt"`) |
> | Ruta absoluta | Adreça completa des de l'arrel del disc |
> | `listFiles()` | Torna els fitxers/carpetes que hi ha dins d'un directori |

📁 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-ficheros-regex) · **Anterior:** — · **Següent:** [02 · Escriure i llegir text: FileWriter, FileReader i BufferedReader](/ApuntesProgramacion/va/12-ficheros-regex/02-escribir-leer-texto)