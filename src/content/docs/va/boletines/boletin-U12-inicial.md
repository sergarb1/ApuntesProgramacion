---
title: "Butlletí U12 — Inicial"
description: "Exercicis bàsics de Fitxers i Regex: File, FileWriter, BufferedReader, try-with-resources i les primeres expressions regulars"
---

# 📝 Butlletí U12 — Inicial

> Sense solucions. Sense presses. Obri l'IDE, crea el teu primer fitxer amb `FileWriter` i fes que `readLine()` deixe de semblar màgia. El disc és teu i les dades esperen. Comença suaument, que els fitxers mosseguen a poc a poc.

---

## Exercici 1: Troba l'error — IOException sense capturar

```java
import java.io.*;

public class Test {
    public static void main(String[] args) {
        FileWriter writer = new FileWriter("salida.txt");
        writer.write("Hola mundo");
        writer.close();
    }
}
```

Este codi **no compila**. Per què? Quines dues formes hi ha de solucionar-ho?

---

## Exercici 2: Completa el codi — try-with-resources

Completa el següent programa perquè llig un fitxer i mostre el seu contingut:

```java
import java.io.*;
import java.nio.file.*;

public class Lector {
    public static void main(String[] args) {
        Path ruta = Paths.get("datos.txt");

        try (______ reader = Files.newBufferedReader(ruta)) {  // quin tipus?
            String linea;
            while ((linea = reader.readLine()) != null) {
                System.out.println(______);  // què va ací?
            }
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
```

---

## Exercici 3: Escriu este programa — guardar ciutats en un fitxer

Crea un array de cadenes amb 5 noms de ciutats. Escriu cada nom en una línia d'un fitxer anomenat `ciudades.txt`, usant `BufferedWriter` i `try-with-resources`. No oblides el salt de línia.

Pista: `BufferedWriter` té `write(...)` i `newLine()`.

---

## Exercici 4: Troba l'error — File.createNewFile sense comprovar

```java
File f = new File("documento.txt");
f.createNewFile();
FileWriter w = new FileWriter(f);
w.write("Contenido importante");
w.close();
```

Què passa si el fitxer `documento.txt` ja existix? Què torna `createNewFile()`?

---

## Exercici 5: Què imprimeix? — el comptador de línies

```java
import java.io.*;

public class Test {
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

Què imprimeix? L'últim `\n` compta com una línia més?

---

## Exercici 6: Escriu este programa — el diari personal

Escriu un programa que afegisca una línia a `diario.txt` amb la data de hui i el text que l'usuari introduïsca pel teclat. Cada execució ha d'**afegir al final sense esborrar** l'anterior.

Pista: `new FileWriter("diario.txt", true)` i per a la data `java.time.LocalDate.now()`.

---

## Exercici 7: Què imprimeix? — matches() vs find()

```java
import java.util.regex.*;

public class Test {
    public static void main(String[] args) {
        String texto = "abc123";

        System.out.println(texto.matches("\\d+"));
        System.out.println(texto.matches("\\w+"));

        Pattern p = Pattern.compile("\\d+");
        Matcher m = p.matcher(texto);
        while (m.find()) {
            System.out.println("Número: " + m.group());
        }
    }
}
```

Què imprimeix cada línia? Per què `matches("\\d+")` dona `false` però `find()` sí que troba alguna cosa?

---

## Exercici 8: Escriu este programa — comptar paraules amb split

Demana a l'usuari una frase pel teclat i mostra quantes paraules té, ignorant els espais dobles.

Pista: `frase.split("\\s+")` troceja per "un o més espais". Compte amb el `.trim()`.

---

## Exercici 9: Escriu este programa — comptar dígits amb Matcher

Escriu un programa que compte quants **dígits** hi ha en una frase. Per exemple, `"En 2026 hay 12 unidades"` → `6` dígits (`2`, `0`, `2`, `6`, `1` i `2`).

Pista: compila `Pattern.compile("\\d")`, usa `matcher.find()` en un bucle i porta un comptador.