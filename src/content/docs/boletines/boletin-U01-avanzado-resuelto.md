---
title: Boletín U01 — Avanzado Resuelto
description: Los mismos ejercicios que el boletín avanzado, con soluciones
---

# 📝 Boletín U01 — Avanzado (Resuelto)

> Las soluciones están ocultas. Inténtalo de verdad antes de destaparlas.

---

## ⭐ Ejercicio 1: ASCII art con prints

<details>
<summary>🔄 Solución</summary>

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

Cada `println` se encarga de una fila y salta de línea al final. Si hubieras usado `print`, todas las filas se habrían pegado en una sola línea.

</details>

---

## ⭐ Ejercicio 2: sin ejecutar — secuencias de escape

<details>
<summary>🔄 Solución</summary>

```
Java
	mola
"mucho"
C:\carpeta\archivo.java
```

Línea a línea:

- `"Java\n\tmola\n\"mucho\""` → `Java`, salto de línea, tabulador + `mola`, salto de línea, comilla + `mucho` + comilla.
- `"C:\\carpeta\\archivo.java"` → `C:\carpeta\archivo.java` (la `\\` se convierte en una sola barra).

</details>

---

## ⭐⭐ Ejercicio 3: El reloj de milisegundos

<details>
<summary>🔄 Solución</summary>

```java
public class RelojMilisegundos {
    public static void main(String[] args) {
        long inicio = System.currentTimeMillis();

        // Pausa artificial: contamos hasta 100 millones para perder tiempo
        long contador = 0;
        for (int i = 0; i < 100_000_000; i++) {
            contador++;
        }

        long fin = System.currentTimeMillis();
        System.out.println("Han pasado " + (fin - inicio) + " milisegundos.");
    }
}
```

El resultado variará según la velocidad de tu ordenador. Fíjate en el `100_000_000`: los guiones bajos en los números son legales y hacen el número más legible (Java los ignora).

</details>

---

## ⭐⭐ Ejercicio 4: contador de argumentos

<details>
<summary>🔄 Solución</summary>

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

El último argumento es `args[args.length - 1]`: como el primer elemento ocupa el índice 0, el último ocupa el índice `length - 1`. El `if` protege el acceso para que no reviente con un array vacío.

</details>

---

## ⭐⭐⭐ Ejercicio 5: La edad cósmica

<details>
<summary>🔄 Solución</summary>

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

`final` convierte la variable en constante: no podrás cambiar su valor después. La división de dos `double` da un `double`, así que `edadMercurio` es un número con decimales.

</details>

---

## ⭐⭐⭐ Ejercicio 6: CodeWars — Grasshopper - Summation

<details>
<summary>🔄 Solución</summary>

Con bucle:

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

Con la fórmula matemática (la suma de 1 a n es `n * (n + 1) / 2`):

```java
public class Kata {
    public static int summation(int n) {
        return n * (n + 1) / 2;
    }
}
```

Ambas devuelven lo mismo. La fórmula es instantánea; el bucle, más transparente. Para n = 4: 4 * 5 / 2 = 10. ✓

</details>

---

## ⭐⭐⭐ Ejercicio 7: AceptaElReto — 119 Futbolistas

<details>
<summary>🔄 Solución</summary>

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

Vamos paso a paso:

- `while (sc.hasNextInt())` repite por cada caso de prueba.
- El `while` interno lee minutos hasta encontrar el `-1` que marca el fin.
- `totalMinutos / 90` es la división entera: cuántos partidos completos ha jugado.

El `Scanner` (leer de teclado) lo verás a fondo en la U02, pero aquí ya lo usas para concursar. ¡Bienvenido a AceptaElReto!

</details>

---

## ⭐⭐⭐ Ejercicio 8: Javadoc de campeonato

<details>
<summary>🔄 Solución</summary>

```java
/**
 * Clase que representa al autor de la unidad y su motivación.
 *
 * @author Sergi Garcia
 * @version 1.0
 */
public class SobreMi {

    /**
     * Punto de entrada: imprime la motivación y el número de argumentos.
     *
     * @param args argumentos recibidos desde la línea de comandos
     */
    public static void main(String[] args) {
        // Imprimo primero el nombre para que el mensaje tenga contexto
        System.out.println("Me llamo Sergi");

        /*
           Este bloque explica el programa a grandes rasgos:
           mostramos la motivación para estudiar programación
           y cuántos argumentos recibimos de la terminal.
        */
        System.out.println("Mi motivación: convertirme en programador");
        System.out.println("He recibido " + args.length + " argumentos.");
    }
}
```

Ejecuta `javadoc SobreMi.java` en la terminal y se generarán los `.html` con tu documentación. Ábrelos: verás tu clase y método con las etiquetas `@author`, `@version` y `@param` formateadas.

</details>

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 116 — ¡Hola mundo! | Principiante |
| AceptaElReto | 119 — Futbolistas | Fácil |
| AceptaElReto | 114 — Último dígito del factorial | Medio |
| CodeWars | Square(n) Sum (8 kyu) | Principiante |
| CodeWars | Grasshopper - Summation (8 kyu) | Principiante |