---
title: "Butlletí U12 — Inicial Resolt"
description: "Els mateixos exercicis que el butlletí inicial, amb solucions"
---

# 📝 Butlletí U12 — Inicial (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: Troba l'error — IOException sense capturar

<details>
<summary>🔄 Solució</summary>

`FileWriter` llança `IOException` (per exemple, si no hi ha permís d'escriptura o la carpeta no existix). El `main` no la declara amb `throws` ni la captura amb `try-catch`, així que el compilador es queixa.

Les **dues formes** de solucionar-ho:

1. Declarar l'excepció en la signatura:
```java
public static void main(String[] args) throws IOException {
    FileWriter writer = new FileWriter("salida.txt");
    writer.write("Hola mundo");
    writer.close();
}
```

2. Capturar-la amb `try-catch`:
```java
public static void main(String[] args) {
    try (FileWriter writer = new FileWriter("salida.txt")) {
        writer.write("Hola mundo");
    } catch (IOException e) {
        System.out.println("Error: " + e.getMessage());
    }
}
```

La versió amb `try-with-resources` és la moderna: tanca el fitxer sol i captura l'error. Les excepcions comprovades de `java.io` no es poden ignorar: o les declares o les captures.

</details>

---

## Exercici 2: Completa el codi — try-with-resources

<details>
<summary>🔄 Solució</summary>

```java
import java.io.*;
import java.nio.file.*;

public class Lector {
    public static void main(String[] args) {
        Path ruta = Paths.get("datos.txt");

        try (BufferedReader reader = Files.newBufferedReader(ruta)) {
            String linea;
            while ((linea = reader.readLine()) != null) {
                System.out.println(linea);
            }
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
```

Els buits: `BufferedReader` i `linea`. `Files.newBufferedReader(Path)` et torna directament un `BufferedReader` sense passar per `FileReader` (la forma NIO del punt 5). El bucle llig línia a línia fins que `readLine()` torna `null`, i el `try-with-resources` tanca el fitxer en eixir.

</details>

---

## Exercici 3: Escriu este programa — guardar ciutats en un fitxer

<details>
<summary>🔄 Solució</summary>

```java
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Ciudades {
    public static void main(String[] args) {
        String[] ciudades = {"Valencia", "Madrid", "Barcelona", "Sevilla", "Bilbao"};

        try (BufferedWriter bw = Files.newBufferedWriter(Paths.get("ciudades.txt"))) {
            for (String ciudad : ciudades) {
                bw.write(ciudad);
                bw.newLine();
            }
            System.out.println("Ciudades guardadas.");
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
```

`Files.newBufferedWriter(Path)` et dona un `BufferedWriter` llest per a usar (la forma NIO del punt 5). Es recorre l'array i cada ciutat s'escriu amb el seu `newLine()`. El `try-with-resources` tanca el fitxer sol.

</details>

---

## Exercici 4: Troba l'error — File.createNewFile sense comprovar

<details>
<summary>🔄 Solució</summary>

Si `documento.txt` **ja existix**, `createNewFile()` torna `false` (no crea res de nou, no llança error) i el `FileWriter` **sobreescriu** el contingut igualment. El codi funciona, però sense que t'assabentes de si el fitxer ja estava.

`createNewFile()` torna:
- `true` si ha creat el fitxer.
- `false` si ja existia.

El patró professional és comprovar-ho:

```java
File f = new File("documento.txt");
if (f.createNewFile()) {
    System.out.println("Archivo creado.");
} else {
    System.out.println("El archivo ya existía.");
}
```

Si la carpeta no existix, `createNewFile()` llança `IOException`, així que també va amb `try-catch` o `throws`.

</details>

---

## Exercici 5: Què imprimeix? — el comptador de línies

<details>
<summary>🔄 Solució</summary>

Imprimeix **`3`**.

El fitxer té tres línies: "linea1", "linea2" i "linea3". L'últim `\n` **no** crea una quarta línia: quan `readLine()` no troba més text, torna `null` (no una línia buida) i el `while` acaba. El comptador s'incrementa 3 vegades.

Detall: el codi del `while` descarta la línia (`r.readLine()` a seques) perquè només vol comptar. Si a més volgueres el contingut, hauríes de guardar-la en una variable.

</details>

---

## Exercici 6: Escriu este programa — el diari personal

<details>
<summary>🔄 Solució</summary>

```java
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Scanner;

public class Diario {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("¿Qué has aprendido hoy? ");
        String entrada = sc.nextLine();

        try (FileWriter fw = new FileWriter("diario.txt", true)) {
            fw.write(LocalDate.now() + ": " + entrada + "\n");
            System.out.println("Anotado en el diario.");
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
        sc.close();
    }
}
```

El segon argument `true` del `FileWriter` activa el mode *append*: afig al final sense esborrar l'anterior. `LocalDate.now()` dona la data actual del sistema. Cada execució suma una entrada nova al diari.

</details>

---

## Exercici 7: Què imprimeix? — matches() vs find()

<details>
<summary>🔄 Solució</summary>

Imprimeix:

```
false
true
Número: 123
```

- `"abc123".matches("\\d+")` → **`false`**: `matches()` exigix que **tot** el string siguen dígits, i hi ha lletres pel mig.
- `"abc123".matches("\\w+")` → **`true`**: lletres i dígits són `\w`, i tot el string ho complix.
- El `Matcher` amb `find()` busca **subcadenes**: troba "123" dins del text i ho imprimeix.

La diferència clau: `matches()` = patró complet; `find()` = buscar dins. És l'error més repetit de la unitat.

</details>

---

## Exercici 8: Escriu este programa — comptar paraules amb split

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class ContarPalabras {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Escribe una frase: ");
        String frase = sc.nextLine().trim();

        String[] palabras = frase.split("\\s+");
        System.out.println("La frase tiene " + palabras.length + " palabras.");
        sc.close();
    }
}
```

`split("\\s+")` troceja per "un o més espais", així que els espais dobles no conten com a separadors buits. El `.trim()` lleva els espais dels extrems abans de trocejar (si no, una frase que comence amb espai generaria una paraula buida al principi).

</details>

---

## Exercici 9: Escriu este programa — comptar dígits amb Matcher

<details>
<summary>🔄 Solució</summary>

```java
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ContarDigitos {
    public static void main(String[] args) {
        String frase = "En 2026 hay 12 unidades";

        Pattern patron = Pattern.compile("\\d");
        Matcher matcher = patron.matcher(frase);

        int contador = 0;
        while (matcher.find()) {
            contador++;
        }
        System.out.println("Dígitos: " + contador);
    }
}
```

Eixida: `Dígitos: 6` — el `2026` aporta 4 dígits i el `12` altres 2: `4 + 2 = 6`.

El patró `\\d` troba cada dígit individual i `find()` avança d'un en un mentre hi haja coincidències. El comptador suma cada troballa. Amb la frase de l'enunciat, `"En 2026 hay 12 unidades"`, el resultat és exactament `6`.

</details>