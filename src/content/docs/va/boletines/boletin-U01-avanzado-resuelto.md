---
title: Butlletí U01 — Avançat Resolt
description: Els mateixos exercicis que el butlletí avançat, amb solucions
---

# 📝 Butlletí U01 — Avançat (Resolt)

> Les solucions estan ocultes. Intenta-ho de veritat abans de destapar-les.

---

## ⭐ Exercici 1: ASCII art amb prints

<details>
<summary>🔄 Solució</summary>

```java
public class AsciiArt {
    public static void main(String[] args) {
        System.out.println("  *");
        System.out.println(" ***");
        System.out.println("*****");
        System.out.println(" ***");
        System.out.println("  *");
    }
}
```

Cada `println` s'encarrega d'una fila i salta de línia al final. Si hagueres usat `print`, totes les files s'haurien pegat en una sola línia.

</details>

---

## ⭐ Exercici 2: Sense executar — seqüències d'escapament

<details>
<summary>🔄 Solució</summary>

```
Java
	mola
"mucho"
C:\carpeta\archivo.java
```

Línia a línia:

- `"Java\n\tmola\n\"mucho\""` → `Java`, salt de línia, tabulador + `mola`, salt de línia, cometa + `mucho` + cometa.
- `"C:\\carpeta\\archivo.java"` → `C:\carpeta\archivo.java` (la `\\` es convertix en una sola barra).

</details>

---

## ⭐⭐ Exercici 3: El rellotge de milisegons

<details>
<summary>🔄 Solució</summary>

```java
public class RelojMilisegundos {
    public static void main(String[] args) {
        long inicio = System.currentTimeMillis();

        // Pausa artificial: comptem fins a 100 milions per a perdre temps
        long contador = 0;
        for (int i = 0; i < 100_000_000; i++) {
            contador++;
        }

        long fin = System.currentTimeMillis();
        System.out.println("Han pasado " + (fin - inicio) + " milisegundos.");
    }
}
```

El resultat variarà segons la velocitat del teu ordinador. Fixa't en el `100_000_000`: els guions baixos en els números són legals i fan el número més llegible (Java els ignora).

</details>

---

## ⭐⭐ Exercici 4: Comptador d'arguments

<details>
<summary>🔄 Solució</summary>

```java
public class ContadorArgs {
    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("No se recibieron argumentos. Programa cancelado por falta de datos.");
        } else {
            System.out.println("Argumentos recibidos: " + args.length);
            System.out.println("Primer argumento: " + args[0]);
            System.out.println("Último argumento: " + args[args.length - 1]);
        }
    }
}
```

L'últim argument és `args[args.length - 1]`: com el primer element ocupa l'índex 0, l'últim ocupa l'índex `length - 1`. El `if` protegix l'accés perquè no rebente amb un array buit.

</details>

---

## ⭐⭐⭐ Exercici 5: L'edat còsmica

<details>
<summary>🔄 Solució</summary>

```java
public class EdadCosmica {
    public static void main(String[] args) {
        final double DIAS_TIERRA = 365.25;
        final double DIAS_MERCURIO = 87.97;
        int edadTerrestre = 20;

        double diasVividos = edadTerrestre * DIAS_TIERRA;
        double edadMercurio = diasVividos / DIAS_MERCURIO;

        System.out.println("En la Tierra tengo " + edadTerrestre + " años. En Mercurio tendría " + edadMercurio + " años.");
    }
}
```

`final` convertix la variable en constant: no podràs canviar el seu valor després. La divisió de dos `double` dona un `double`, així que `edadMercurio` és un número amb decimals.

</details>

---

## ⭐⭐⭐ Exercici 6: CodeWars — Grasshopper - Summation

<details>
<summary>🔄 Solució</summary>

Amb bucle:

```java
public class Kata {
    public static int summation(int n) {
        int total = 0;
        for (int i = 1; i <= n; i++) {
            total += i;
        }
        return total;
    }
}
```

Amb la fórmula matemàtica (la suma d'1 a n és `n * (n + 1) / 2`):

```java
public class Kata {
    public static int summation(int n) {
        return n * (n + 1) / 2;
    }
}
```

Les dos tornen el mateix. La fórmula és instantània; el bucle, més transparent. Per a n = 4: 4 * 5 / 2 = 10. ✓

</details>

---

## ⭐⭐⭐ Exercici 7: AceptaElReto — 119 Futbolistes

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Futbolistas {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (sc.hasNextInt()) {
            int totalMinutos = 0;
            int minutos;
            while ((minutos = sc.nextInt()) != -1) {
                totalMinutos += minutos;
            }
            System.out.println(totalMinutos / 90);
        }
        sc.close();
    }
}
```

Pas a pas:

- `while (sc.hasNextInt())` repetix per cada cas de prova.
- El `while` intern llig minuts fins a trobar el `-1` que marca el fi.
- `totalMinutos / 90` és la divisió entera: quants partits complets ha jugat.

El `Scanner` (llegir de teclat) el veuràs a fons en la U02, però ací ja l'uses per a concursar. Benvingut a AceptaElReto!

</details>

---

## ⭐⭐⭐ Exercici 8: Javadoc de campionat

<details>
<summary>🔄 Solució</summary>

```java
/**
 * Classe que representa l'autor de la unitat i la seua motivació.
 *
 * @author Sergi Garcia
 * @version 1.0
 */
public class SobreMi {

    /**
     * Punt d'entrada: imprimix la motivació i el nombre d'arguments.
     *
     * @param args arguments rebuts des de la línia de comandes
     */
    public static void main(String[] args) {
        // Imprimixc primer el nom perquè el missatge tinga context
        System.out.println("Me llamo Sergi");

        /*
           Este bloc explica el programa a grans trets:
           mostrem la motivació per a estudiar programació
           i quants arguments vam rebre de la terminal.
        */
        System.out.println("Mi motivación: convertirme en programador");
        System.out.println("He recibido " + args.length + " argumentos.");
    }
}
```

Executa `javadoc SobreMi.java` en la terminal i es generaran els `.html` amb la teua documentació. Obri'ls: veuràs la teua classe i mètode amb les etiquetes `@author`, `@version` i `@param` formatejades.

</details>

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 116 — ¡Hola mundo! | Principiant |
| AceptaElReto | 119 — Futbolistes | Fàcil |
| AceptaElReto | 114 — Últim dígit del factorial | Mitjà |
| CodeWars | Square(n) Sum (8 kyu) | Principiant |
| CodeWars | Grasshopper - Summation (8 kyu) | Principiant |