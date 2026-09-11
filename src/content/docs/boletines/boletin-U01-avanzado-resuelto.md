---
title: "Boletín U01 — Avanzado Resuelto"
description: "Los mismos ejercicios que el boletín avanzado, con soluciones"
---

# 📝 Boletín U01 — Avanzado (Resuelto)

> Las soluciones están ocultas. Intenta de verdad antes de destaparlas. Compara tu código con estas propuestas de resolución y comparte tus dudas o alternativas en el foro.

---

## Ejercicio 1: Calculadora de propinas (Solución)

<details>
<summary>🔄 Solución</summary>

```java
public class CalculadoraPropinas {
    public static void main(String[] args) {
        double totalCuenta = 45.50;
        int porcentajePropina = 15;

        // Multiplicamos primero para evitar la división entera entre enteros (15 / 100 = 0)
        double propina = totalCuenta * porcentajePropina / 100.0;
        double totalFinal = totalCuenta + propina;

        System.out.println("Total de la cuenta: " + totalCuenta + "€");
        System.out.println("Propina (" + porcentajePropina + "%): " + propina + "€");
        System.out.println("Total a pagar: " + totalFinal + "€");
    }
}
```

</details>

---

## Ejercicio 2: Conversor dólar-euro (Solución)

<details>
<summary>🔄 Solución</summary>

```java
public class ConversorMoneda {
    public static void main(String[] args) {
        final double TASA_CAMBIO = 0.92;

        double dolares = 100.0;
        double eurosDesdeDolares = dolares * TASA_CAMBIO;

        double euros = 50.0;
        double dolaresDesdeEuros = euros / TASA_CAMBIO;

        System.out.println(dolares + "$ son " + eurosDesdeDolares + "€");
        System.out.println(euros + "€ son " + dolaresDesdeEuros + "$");
    }
}
```

</details>

---

## Ejercicio 3: ¿Qué imprime? — el casting traidor (Solución)

<details>
<summary>🔄 Solución</summary>

**Salida exacta por pantalla:**

```
3.0
3.5
3.5
11.0
6
```

**Explicación paso a paso:**

- **resultado1 (3.0)**: `a / b` es una división entre dos enteros (7 / 2). El resultado es la división entera 3. Al asignarlo a un `double`, se convierte en 3.0.
- **resultado2 (3.5)**: `(double) a` convierte en 7.0. La división 7.0 / 2 es entre `double` e `int`, por lo que `b` se promueve a `double` y se obtiene la división decimal exacta 3.5.
- **resultado3 (3.5)**: Ocurre lo mismo: `(double) b` convierte `b` en 2.0, dando la división decimal 7 / 2.0 = 3.5.
- **3 + 4 \* 2.0 (11.0)**: La multiplicación tiene prioridad (4 \* 2.0 = 8.0). Después se suma 3 + 8.0 = 11.0 (promovido a `double`).
- **(int) (3.7 + 2.3) (6)**: Primero se resuelve el paréntesis 3.7 + 2.3 = 6.0. El casting `(int)` trunca la parte decimal y queda el entero 6.

</details>

---

## Ejercicio 4: Interés compuesto (sin bucle) (Solución)

<details>
<summary>🔄 Solución</summary>

```java
public class InteresCompuesto {
    public static void main(String[] args) {
        final double CAPITAL_INICIAL = 1000.0;
        final double TASA = 0.05;

        double capital0 = CAPITAL_INICIAL;
        double capital1 = CAPITAL_INICIAL * Math.pow(1 + TASA, 1);
        double capital2 = CAPITAL_INICIAL * Math.pow(1 + TASA, 2);
        double capital3 = CAPITAL_INICIAL * Math.pow(1 + TASA, 3);

        System.out.println("Año 0: " + capital0 + "€");
        System.out.println("Año 1: " + capital1 + "€");
        System.out.println("Año 2: " + capital2 + "€");
        System.out.println("Año 3: " + capital3 + "€");
    }
}
```

</details>

---

## Ejercicio 5: El enigma del post-incremento (Solución)

<details>
<summary>🔄 Solución</summary>

**Paso a paso de la ejecución:**

1. **`int x = 3;`** → x=3.
2. **`int y = x++ + ++x;`:**
   - `x++`: Usa el valor actual de `x` (3) y después lo incrementa a 4.
   - `++x`: Incrementa `x` primero (4→5) y usa el nuevo valor (5).
   - y=3+5=8. Valores actuales: x=5, y=8.
3. **`int z = --y + y-- + x++;`:**
   - `--y`: Decrementa `y` primero (8→7) y usa el nuevo valor (7).
   - `y--`: Usa el valor actual de `y` (7) y después lo decrementa a 6.
   - `x++`: Usa el valor actual de `x` (5) y después lo incrementa a 6.
   - z=7+7+5=19. Valores finales: x=6, y=6, z=19.

**Salida por pantalla:**

```
x = 6
y = 6
z = 19
```

</details>

---

## 💡 Herramientas de ampliación (Operador ternario, .equals(), Scanner y Math.random())

⚠️ **Fuera de temario (de momento):** Estas herramientas las veremos en detalle y de manera oficial en próximas unidades, pero es útil saber cómo funcionan si quieres empezar a explorar opciones más avanzadas en tus programas.

### 1. El operador ternario (? :)

Es una forma ultracompacta de escribir una estructura condicional (if-else) sencilla en una sola línea. Sirve para elegir entre dos valores según si se cumple o no una condición.

**Sintaxis**: `condicion ? valor_si_verdadero : valor_si_falso`

Ejemplo:

```java
int edad = 20;
String estado = (edad >= 18) ? "Mayor de edad" : "Menor de edad";
```

Si la condición (`edad >= 18`) es cierta, retorna "Mayor de edad"; si no, retorna "Menor de edad".

### 2. Comparar texto con .equals()

En Java, las cadenas de texto (`String`) son objetos, no tipos primitivos como `int` o `double`. Por eso, nunca se debe utilizar `==` para comparar el contenido de dos textos, ya que `==` compara si están guardados en la misma posición de memoria, no si tienen las mismas letras.

**Sintaxis**: `cadena1.equals(cadena2)`

Ejemplo:

```java
String operador = "+";

// Incorrecto ❌ (puede fallar según cómo se haya creado el texto):
// if (operador == "+")

// Correcto ✅ (compara el contenido del texto letra por letra):
if (operador.equals("+")) {
    System.out.println("Es una suma");
}
```

### 3. Leer datos del teclado con Scanner y la importación (import)

Para leer lo que el usuario escribe en la terminal, utilizamos la clase `Scanner`. Como no viene cargada por defecto en el motor básico de Java, tenemos que decirle al programa dónde encontrarla mediante una instrucción `import` en la primera línea del archivo.

**Importación obligatoria**: `import java.util.Scanner;` (se pone antes de declarar la clase).

Métodos principales de lectura:

- `scanner.nextLine()`: Lee una línea de texto completa (`String`).
- `scanner.nextInt()`: Lee un número entero (`int`).
- `scanner.nextDouble()`: Lee un número decimal (`double`).

**Ejemplo:**

```java
import java.util.Scanner; // 1. Importamos la clase de la biblioteca de Java

public class EjemploScanner {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in); // 2. Creamos el objeto Scanner

        System.out.print("Introduce tu nombre: ");
        String nombre = scanner.nextLine(); // 3. Leemos el texto introducido

        System.out.println("Hola, " + nombre + "!");
        scanner.close(); // Buenos hábitos: cerramos el Scanner al terminar
    }
}
```

### 4. Generar números aleatorios con Math.random()

La clase `Math` viene incluida automáticamente en Java (no necesita `import`). Su método `Math.random()` genera un número decimal aleatorio entre 0.0 (incluido) y 1.0 (excluido).

**Cómo adaptarlo para obtener un número entero en un rango (ej: un dado de 1 a 6):**

- Multiplicamos el resultado por el máximo del rango (`Math.random() * 6` da de 0.0 a 5.999...).
- Hacemos un casting a entero (`int`) para eliminar la parte decimal (0 a 5).
- Sumamos 1 para ajustar el rango final (1 a 6).

**Ejemplo para simulación de dados:**

```java
// Genera un número entero aleatorio entre 1 y 6:
int dado = (int) (Math.random() * 6) + 1;
System.out.println("Has sacado un: " + dado);
```

---

## Ejercicio 6: El duelo de dados (Extra) (Solución)

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class DueloDados {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Introduce tu nombre: ");
        String nombreUsuario = scanner.nextLine();

        int dadoUsuario = (int) (Math.random() * 6) + 1;
        int dadoMaquina = (int) (Math.random() * 6) + 1;

        System.out.println(nombreUsuario + " saca " + dadoUsuario + ", la máquina saca " + dadoMaquina + ".");

        String veredicto = (dadoUsuario > dadoMaquina) ? "Gana " + nombreUsuario + "!" :
                           (dadoMaquina > dadoUsuario) ? "Gana la máquina." :
                           "¡Empate!";

        System.out.println(veredicto);

        scanner.close();
    }
}
```

</details>

---

## Ejercicio 7: Supercalculadora con lógica (Extra) (Solución)

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Supercalculadora {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Introduce el primer número: ");
        double a = scanner.nextDouble();

        System.out.print("Introduce el segundo número: ");
        double b = scanner.nextDouble();

        System.out.print("Introduce el operador (+, -, *, /): ");
        String op = scanner.next();

        String resultado = op.equals("+") ? "Resultado: " + (a + b) :
                           op.equals("-") ? "Resultado: " + (a - b) :
                           op.equals("*") ? "Resultado: " + (a * b) :
                           op.equals("/") ? (b == 0 ? "Error: no se puede dividir entre 0" : "Resultado: " + (a / b)) :
                           "Operador desconocido";

        System.out.println(resultado);

        scanner.close();
    }
}
```

</details>

---

## Ejercicio 8: Javadoc de campeonato (Solución)

<details>
<summary>🔄 Solución</summary>

```java
/**
 * Clase que representa el autor de la unidad y su motivación.
 *
 * @author Sergi Garcia
 * @version 1.0
 */
public class SobreMi {

    /**
     * Método principal: imprime la motivación y el número de argumentos recibidos.
     *
     * @param args argumentos recibidos desde la línea de órdenes
     */
    public static void main(String[] args) {
        // Imprimo primero el nombre para que el mensaje tenga contexto
        System.out.println("Me llamo Sergi");

        /*
        Este bloque explica el programa a grandes rasgos:
        muestra la motivación para estudiar programación
        y cuántos argumentos hemos recibido desde la terminal.
        */
        System.out.println("Mi motivación: convertirme en programador");
        System.out.println("He recibido " + args.length + " argumentos.");
    }
}
```

**Explicación**: Al ejecutar el comando `javadoc SobreMi.java` en la terminal, se crearán automáticamente los archivos `.html` con la documentación técnica de tu proyecto. Si abres el archivo generado en el navegador, verás tu clase y tu método con las etiquetas `@author`, `@version` y `@param` perfectamente estructuradas y formateadas como la documentación oficial de Java.

</details>
