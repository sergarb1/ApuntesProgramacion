---
title: "Boletín U12 — Avanzado Resuelto"
description: "Los mismos ejercicios que el boletín avanzado, con soluciones"
---

# 📝 Boletín U12 — Avanzado (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## ⭐ Ejercicio 1: Buscador de archivos por extensión

<details>
<summary>🔄 Solución</summary>

```java
import java.io.File;

public class Buscador {
    public static void buscar(File carpeta, String extension) {
        File[] contenidos = carpeta.listFiles();
        if (contenidos == null) return;

        for (File item : contenidos) {
            if (item.isDirectory()) {
                buscar(item, extension);        // recursión: dentro de la carpeta
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

La recursión es el corazón: si el archivo es una carpeta, el método se llama a sí mismo con esa carpeta; si es un archivo, comprueba la extensión. El `if (contenidos == null)` evita el `NullPointerException` si no hay permiso de lectura. Así se recorre un árbol completo sin bucles anidados infinitos.

</details>

---

## ⭐ Ejercicio 2: Lector de CSV con Scanner

<details>
<summary>🔄 Solución</summary>

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

`useDelimiter(";|\\R")` corta por `;` o por cualquier salto de línea: los campos salen limpios, uno detrás de otro. `printf` con `%-8s` alinea a la izquierda y `%3d` reserva 3 posiciones para la edad. Salida:

```
Nombre   Edad Ciclo
Ana        25 DAM
Bob        22 DAW
Carlos     30 DAM
```

</details>

---

## ⭐⭐ Ejercicio 3: Filtro de líneas por palabra clave

<details>
<summary>🔄 Solución</summary>

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

`linea.contains(clave)` busca la palabra dentro de la línea (sin regex, que aquí no hace falta). Los dos `PrintWriter`/`BufferedReader` van en el mismo `try-with-resources` y Java cierra ambos al salir. Los contadores dan el resumen final.

</details>

---

## ⭐⭐ Ejercicio 4: Separador de líneas pares e impares

<details>
<summary>🔄 Solución</summary>

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

Tres recursos en el mismo `try-with-resources`, separados por `;`. El `numLinea` cuenta desde 0, así que la primera línea (posición 0, par) va a `pares.txt`. Al terminar, Java cierra los tres archivos en orden inverso.

</details>

---

## ⭐⭐ Ejercicio 5: Split con regex — analizador de frases

<details>
<summary>🔄 Solución</summary>

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

El patrón `[^a-zA-ZáéíóúüñÑ]+` corta por todo lo que NO sea letra: espacios, comas, puntos y signos desaparecen como separadores. La condición de las vocales usa `charAt(0)` sobre la palabra en minúsculas (con el `!p.isEmpty()` para no reventar con cadenas vacías). Salida para el ejemplo:

```
Palabras: 6
Más larga: "mundo"
Empiezan por vocal: ["Esto"]
```

</details>

---

## ⭐⭐⭐ Ejercicio 6 (ProgramaMe): Validador de datos con regex

<details>
<summary>🔄 Solución</summary>

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

Cada línea se trocea por `;` en dato y tipo, y un `switch` elige el patrón. El teléfono `(\\+34\\s?)?` admite el prefijo `+34` opcional (con o sin espacio) seguido de 9 dígitos que empiezan por 6, 7 o 9. El DNI se pasa a mayúsculas para aceptar la letra en minúscula. Las regex validan el formato: para el DNI de verdad haría falta el algoritmo módulo 23, que aquí se da por bueno.

</details>

---

## ⭐⭐⭐ Ejercicio 7: Cifrado César con archivos

<details>
<summary>🔄 Solución</summary>

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
        return c;   // no es letra: se queda igual
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
        procesar("mensaje.txt", "mensaje_cifrado.txt", 3);   // cifrar
        procesar("mensaje_cifrado.txt", "descifrado.txt", -3); // descifrar
    }
}
```

El truco del `% 26`: cada letra se convierte a su posición en el alfabeto (`c - 'a'`), se desplaza `n` y se hace módulo 26 para que la `z` vuelva a la `a`. Descifrar es lo mismo con `n = -3`. Los caracteres que no son letras (espacios, signos) se quedan intactos, que es lo que hace un César clásico.

</details>

---

## ⭐⭐⭐ Ejercicio 8: Serialización de estudiantes

<details>
<summary>🔄 Solución</summary>

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

La clase `Estudiante` implementa `Serializable` con su `serialVersionUID` fijo para que los archivos sobrevivan a pequeños cambios. El `writeObject` guarda la lista entera de una vez y `readObject` la reconstruye con un casting a `List<Estudiante>`. Como `ArrayList` y `Estudiante` son serializables, todo el paquete se congela y descongela en dos líneas.

</details>

---

## ⭐⭐ Ejercicio 9: El contador de líneas, palabras y caracteres

<details>
<summary>🔄 Solución</summary>

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

Cada línea suma 1 a las líneas y su `length()` a los caracteres. Para las palabras, `split("\\s+")` trocea por los espacios; la comprobación `!linea.trim().isEmpty()` evita que una línea en blanco se cuente como una "palabra vacía". 

Con NIO sería aún más corto: `Files.readAllLines(ruta)` y un `for` sobre la lista, sin `close()` manual. Compáralo con el punto 5 del temario: menos código, misma lógica.

</details>