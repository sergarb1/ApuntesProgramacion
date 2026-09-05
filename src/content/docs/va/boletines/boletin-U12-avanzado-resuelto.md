---
title: "Butlletí U12 — Avançat Resolt"
description: "Els mateixos exercicis que el butlletí avançat, amb solucions"
---

# 📝 Butlletí U12 — Avançat (Resolt)

> Les solucions estan amagades en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## ⭐ Exercici 1: Buscador de fitxers per extensió

<details>
<summary>🔄 Solució</summary>

```java
import java.io.File;

public class Buscador {
    public static void buscar(File carpeta, String extension) {
        File[] contenidos = carpeta.listFiles();
        if (contenidos == null) return;

        for (File item : contenidos) {
            if (item.isDirectory()) {
                buscar(item, extension);        // recursió: dins de la carpeta
            } else if (item.getName().endsWith(extension)) {
                System.out.println(item.getAbsolutePath());
            }
        }
    }

    public static void main(String[] args) {
        File carpeta = new File("src");
        buscar(carpeta, ".java");
    }
}
```

La recursió és el cor: si el fitxer és una carpeta, el mètode es crida a si mateix amb eixa carpeta; si és un fitxer, comprova l'extensió. L'`if (contenidos == null)` evita el `NullPointerException` si no hi ha permís de lectura. Així es recorre un arbre complet sense bucles niats infinits.

</details>

---

## ⭐ Exercici 2: Lector de CSV amb Scanner

<details>
<summary>🔄 Solució</summary>

```java
import java.io.File;
import java.util.Scanner;

public class LeeCSV {
    public static void main(String[] args) throws Exception {
        try (Scanner sc = new Scanner(new File("datos.csv"))) {
            sc.useDelimiter(";|\\R");
            System.out.printf("%-8s %3s %s%n", "Nombre", "Edad", "Ciclo");
            while (sc.hasNext()) {
                String nombre = sc.next();
                int edad = sc.nextInt();
                String ciclo = sc.next();
                System.out.printf("%-8s %3d %s%n", nombre, edad, ciclo);
            }
        }
    }
}
```

`useDelimiter(";|\\R")` talla per `;` o per qualsevol salt de línia: els camps eixen nets, un darrere de l'altre. `printf` amb `%-8s` alinea a l'esquerra i `%3d` reserva 3 posicions per a l'edat. Eixida:

```
Nombre   Edad Ciclo
Ana        25 DAM
Bob        22 DAW
Carlos     30 DAM
```

</details>

---

## ⭐⭐ Exercici 3: Filtre de línies per paraula clau

<details>
<summary>🔄 Solució</summary>

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;
import java.io.FileWriter;
import java.util.Scanner;

public class Filtro {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        System.out.print("Palabra clave: ");
        String clave = sc.nextLine();

        int coinciden = 0, descartadas = 0;

        try (BufferedReader br = new BufferedReader(new FileReader("origen.txt"));
             PrintWriter pw = new PrintWriter(new FileWriter("destino.txt"))) {

            String linea;
            while ((linea = br.readLine()) != null) {
                if (linea.contains(clave)) {
                    pw.println(linea);
                    coinciden++;
                } else {
                    descartadas++;
                }
            }
        }

        System.out.println("Coinciden: " + coinciden);
        System.out.println("Descartadas: " + descartadas);
        sc.close();
    }
}
```

`linea.contains(clave)` busca la paraula dins de la línia (sense regex, que ací no cal). Els dos `PrintWriter`/`BufferedReader` van en el mateix `try-with-resources` i Java tanca tots dos en eixir. Els comptadors donen el resum final.

</details>

---

## ⭐⭐ Exercici 4: Separador de línies parells i senars

<details>
<summary>🔄 Solució</summary>

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;
import java.io.FileWriter;

public class Separador {
    public static void main(String[] args) throws Exception {
        try (BufferedReader br = new BufferedReader(new FileReader("entrada.txt"));
             PrintWriter pares = new PrintWriter(new FileWriter("pares.txt"));
             PrintWriter impares = new PrintWriter(new FileWriter("impares.txt"))) {

            String linea;
            int numLinea = 0;
            while ((linea = br.readLine()) != null) {
                if (numLinea % 2 == 0) {
                    pares.println(linea);
                } else {
                    impares.println(linea);
                }
                numLinea++;
            }
        }
        System.out.println("Separados.");
    }
}
```

Tres recursos en el mateix `try-with-resources`, separats per `;`. El `numLinea` compta des de 0, així que la primera línia (posició 0, parell) va a `pares.txt`. En acabar, Java tanca els tres fitxers en ordre invers.

</details>

---

## ⭐⭐ Exercici 5: Split amb regex — analitzador de frases

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Analizador {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Frase: ");
        String frase = sc.nextLine();

        String[] palabras = frase.split("[^a-zA-ZáéíóúüñÑ]+");

        System.out.println("Palabras: " + palabras.length);

        String masLarga = "";
        for (String p : palabras) {
            if (p.length() > masLarga.length()) {
                masLarga = p;
            }
        }
        System.out.println("Más larga: \"" + masLarga + "\"");

        System.out.print("Empiezan por vocal: [");
        boolean primera = true;
        for (String p : palabras) {
            if (!p.isEmpty() && p.toLowerCase().charAt(0) == 'a' ||
                p.toLowerCase().charAt(0) == 'e' ||
                p.toLowerCase().charAt(0) == 'i' ||
                p.toLowerCase().charAt(0) == 'o' ||
                p.toLowerCase().charAt(0) == 'u') {
                if (!primera) System.out.print(", ");
                System.out.print("\"" + p + "\"");
                primera = false;
            }
        }
        System.out.println("]");
        sc.close();
    }
}
```

El patró `[^a-zA-ZáéíóúüñÑ]+` talla per tot el que NO siga lletra: espais, comes, punts i signes desapareixen com a separadors. La condició de les vocals usa `charAt(0)` sobre la paraula en minúscules (amb el `!p.isEmpty()` per a no esclatar amb cadenes buides). Eixida per a l'exemple:

```
Palabras: 6
Más larga: "mundo"
Empiezan por vocal: ["Esto"]
```

</details>

---

## ⭐⭐⭐ Exercici 6 (ProgramaMe): Validador de dades amb regex

<details>
<summary>🔄 Solució</summary>

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.regex.Pattern;

public class ValidadorDatos {
    private static final Pattern PATRON_EMAIL =
        Pattern.compile("[\\w.]+@[\\w.]+\\.[a-z]{2,}");
    private static final Pattern PATRON_DNI =
        Pattern.compile("\\d{8}[A-Z]");
    private static final Pattern PATRON_TELEFONO =
        Pattern.compile("(\\+34\\s?)?[679]\\d{8}");

    public static boolean valida(String dato, String tipo) {
        switch (tipo) {
            case "email":    return PATRON_EMAIL.matcher(dato).matches();
            case "dni":      return PATRON_DNI.matcher(dato.toUpperCase()).matches();
            case "telefono": return PATRON_TELEFONO.matcher(dato).matches();
            default:         return false;
        }
    }

    public static void main(String[] args) throws Exception {
        int validos = 0, invalidos = 0;

        try (BufferedReader br = new BufferedReader(new FileReader("datos.txt"))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                String[] partes = linea.split(";");
                boolean ok = valida(partes[0], partes[1]);
                if (ok) {
                    validos++;
                } else {
                    invalidos++;
                    System.out.println("Inválido: " + linea);
                }
            }
        }

        System.out.println("Válidos: " + validos);
        System.out.println("Inválidos: " + invalidos);
    }
}
```

Cada línia es troceja per `;` en dada i tipus, i un `switch` tria el patró. El telèfon `(\\+34\\s?)?` admet el prefix `+34` opcional (amb o sense espai) seguit de 9 dígits que comencen per 6, 7 o 9. El DNI es passa a majúscules per a acceptar la lletra en minúscula. Les regex validen el format: per al DNI de veritat caldria l'algoritme mòdul 23, que ací es dona per bo.

</details>

---

## ⭐⭐⭐ Exercici 7: Xifrat Cèsar amb fitxers

<details>
<summary>🔄 Solució</summary>

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;
import java.io.FileWriter;

public class CifradoCesar {
    public static char desplaza(char c, int n) {
        if (c >= 'a' && c <= 'z') {
            return (char) ('a' + (c - 'a' + n) % 26);
        }
        if (c >= 'A' && c <= 'Z') {
            return (char) ('A' + (c - 'A' + n) % 26);
        }
        return c;   // no és lletra: es queda igual
    }

    public static void procesar(String origen, String destino, int n) throws Exception {
        try (BufferedReader br = new BufferedReader(new FileReader(origen));
             PrintWriter pw = new PrintWriter(new FileWriter(destino))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                StringBuilder sb = new StringBuilder();
                for (char c : linea.toCharArray()) {
                    sb.append(desplaza(c, n));
                }
                pw.println(sb);
            }
        }
    }

    public static void main(String[] args) throws Exception {
        procesar("mensaje.txt", "mensaje_cifrado.txt", 3);   // xifrar
        procesar("mensaje_cifrado.txt", "descifrado.txt", -3); // descifrar
    }
}
```

El truc del `% 26`: cada lletra es convertix a la seua posició en l'alfabet (`c - 'a'`), es desplaça `n` i es fa mòdul 26 perquè la `z` torne a la `a`. Descifrar és el mateix amb `n = -3`. Els caràcters que no són lletres (espais, signes) es queden intactes, que és el que fa un Cèsar clàssic.

</details>

---

## ⭐⭐⭐ Exercici 8: Serialització d'estudiants

<details>
<summary>🔄 Solució</summary>

```java
import java.io.*;
import java.util.ArrayList;
import java.util.List;

class Estudiante implements Serializable {
    private static final long serialVersionUID = 1L;
    String nombre;
    int edad;
    double notaMedia;

    Estudiante(String n, int e, double m) {
        this.nombre = n;
        this.edad = e;
        this.notaMedia = m;
    }
}

public class GuardaEstudiantes {
    public static void main(String[] args) throws Exception {
        List<Estudiante> equipo = new ArrayList<>();
        equipo.add(new Estudiante("Ana", 20, 8.5));
        equipo.add(new Estudiante("Bob", 22, 6.0));
        equipo.add(new Estudiante("Carla", 19, 9.2));

        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("estudiantes.dat"))) {
            oos.writeObject(equipo);
        }

        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream("estudiantes.dat"))) {
            List<Estudiante> recuperados = (List<Estudiante>) ois.readObject();
            for (Estudiante e : recuperados) {
                System.out.printf("%-6s %2d años - nota: %.1f%n", e.nombre, e.edad, e.notaMedia);
            }
        }
    }
}
```

La classe `Estudiante` implementa `Serializable` amb el seu `serialVersionUID` fix perquè els fitxers sobrevisquen a xicotets canvis. El `writeObject` guarda la llista sencera d'una vegada i `readObject` la reconstruïx amb un casting a `List<Estudiante>`. Com que `ArrayList` i `Estudiante` són serialitzables, tot el paquet es congela i descongela en dos línies.

</details>

---

## ⭐⭐ Exercici 9: El comptador de línies, paraules i caràcters

<details>
<summary>🔄 Solució</summary>

```java
import java.io.BufferedReader;
import java.io.FileReader;

public class Contador {
    public static void main(String[] args) throws Exception {
        int lineas = 0, palabras = 0, caracteres = 0;

        try (BufferedReader br = new BufferedReader(new FileReader("texto.txt"))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                lineas++;
                caracteres += linea.length();
                if (!linea.trim().isEmpty()) {
                    palabras += linea.split("\\s+").length;
                }
            }
        }

        System.out.println("Líneas: " + lineas);
        System.out.println("Palabras: " + palabras);
        System.out.println("Caracteres: " + caracteres);
    }
}
```

Cada línia suma 1 a les línies i el seu `length()` als caràcters. Per a les paraules, `split("\\s+")` troceja pels espais; la comprovació `!linea.trim().isEmpty()` evita que una línia en blanc es compte com una "paraula buida".

Amb NIO seria encara més curt: `Files.readAllLines(ruta)` i un `for` sobre la llista, sense `close()` manual. Compara-ho amb el punt 5 del temari: menys codi, mateixa lògica.

</details>