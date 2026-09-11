---
title: "Boletín U01 — Avanzado"
description: "Ejercicios de dificultad progresiva para exprimir la unidad"
---

# 📝 Boletín U01 — Avanzado

> Sin soluciones. Sin prisas. Con un editor de texto y muchas ganas de compilar. Esto solo empieza. Comenta las soluciones en el foro e intenta ayudar a tus compañeros a que mejoren sus capacidades como programador.

---

## Ejercicio 1: Calculadora de propinas

Escribe un programa que calcule cuánto dejar de propina en un restaurante. Declara:

- `double totalCuenta = 45.50;`
- `int porcentajePropina = 15;` (el porcentaje, sin el símbolo)

Calcula la propina (`totalCuenta * porcentajePropina / 100`) y el total final (`totalCuenta + propina`). Muestra los tres valores.

**Pista**: cuidado con la división: `porcentajePropina / 100` con enteros da 0. Multiplica primero y divide después, o usa `100.0`.

---

## Ejercicio 2: Conversor dólar-euro

Declara `final double TASA_CAMBIO = 0.92;` (1 dólar = 0.92 euros). Declara `double dolares = 100.0;` y calcula su equivalente en euros. También haz la conversión inversa: dado `double euros = 50.0;`, calcula cuántos dólares son.

**Muestra:**

```
100.0$ son 92.0€
50.0€ son 54.347826086956516$
```

**Pista**: para pasar de euros a dólares divides entre la tasa: `euros / TASA_CAMBIO`.

---

## Ejercicio 3: ¿Qué imprime? — el casting traidor

Sin ejecutar, escribe la salida exacta:

```java
public class CastingTraidor {
   public static void main(String[] args) {
       int a = 7;
       int b = 2;
       double resultado1 = a / b;
       double resultado2 = (double) a / b;
       double resultado3 = a / (double) b;

       System.out.println(resultado1);
       System.out.println(resultado2);
       System.out.println(resultado3);
       System.out.println(3 + 4 * 2.0);
       System.out.println((int) (3.7 + 2.3));
   }
}
```

**Pista**: fíjate bien en dónde está el casting y en qué momento se aplica la división entera. En `resultado1`, ¿la división se hace antes o después de guardar en el `double`?

---

## Ejercicio 4: Interés compuesto (sin bucle)

Declara `final double CAPITAL_INICIAL = 1000.0;`, `final double TASA = 0.05;` (5% anual), `int años = 3;`. Calcula el capital final después de 3 años usando la fórmula del interés compuesto SIN bucles:

```
capitalFinal = capitalInicial * (1 + tasa)^años
```

Para la potencia usa `Math.pow(base, exponente)`. Muestra el capital año a año:

```
Año 0: 1000.0€
Año 1: 1050.0€
Año 2: 1102.5€
Año 3: 1157.625€
```

💡 **Cuidado con la precisión:** en el año 3 tu programa puede imprimir `1157.6250000000002` en lugar de `1157.625` por la coma flotante binaria de los `double` (lo veremos en «Atréverte a pensar»). No es un error de tu código.

**Pista**: para mostrar cada año sin bucle, crea tres variables distintas (`capital1`, `capital2`, `capital3`) y usa `Math.pow(1 + TASA, i)` con `i` valiendo 1, 2 y 3.

---

## Ejercicio 5: El enigma del post-incremento

Sin ejecutar, determina el valor de cada variable después de ejecutar este código. Escribe el paso a paso:

```java
public class EnigmaIncrement {
   public static void main(String[] args) {
   int x = 3;
   int y = x++ + ++x;
   int z = --y + y-- + x++;
   System.out.println("x = " + x);
   System.out.println("y = " + y);
   System.out.println("z = " + z);
   }
}
```

**Pista**: haz una tabla en un papel con los valores de `x` e `y` después de cada operación. `x++` usa y después incrementa; `++x` incrementa y después usa.

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

## Ejercicio 6: El duelo de dados (Extra)

Escribe un programa que lance un dado para el usuario (le pide el nombre con `Scanner`) y otro para la máquina (con `Math.random()`). Gana quien saque más. Muestra las dos tiradas y el ganador con un mensaje tipo:

```
Anna saca 4, la máquina saca 6.
Gana la máquina.
```

**Pista**: combina `nextLine()` (nombre), `(int)(Math.random() * 6) + 1` (dados) y un ternario encadenado para el veredicto. Cuidado con el empate.

---

## Ejercicio 7: Supercalculadora con lógica (Extra)

Escribe un programa que lea dos números con `Scanner` (`double`) y un carácter de operación (`+`, `-`, `*`, `/`) con `next()`.

Según el operador, muestra el resultado. Si el operador es `/` y el segundo número es 0, muestra "Error: no se puede dividir entre 0". Para cualquier otro carácter, muestra "Operador desconocido".

**Pista**: calcula los resultados posibles en variables y elige con ternarios encadenados o con lógica. Puedes comprobar la división entre 0 con `op.equals("/") && b == 0`.

---

## Ejercicio 8: Javadoc de campeonato

Escribe una clase llamada `SobreMi.java` que muestre por pantalla tu nombre, tu motivación para programar y cuántos argumentos ha recibido por la línea de órdenes (`args.length`).

El programa tiene que incluir los tres tipos de comentarios de Java:

- Comentario de una línea (`//`): Explica por qué se imprime primero el nombre.
- Comentario de bloque (`/* ... */`): Un resumen breve de la función del programa.
- Comentarios Javadoc (`/** ... */`): Documentación formal para la clase y para el método main, utilizando las etiquetas `@author`, `@version` y `@param`.

**Tarea extra:** Ejecuta el comando `javadoc SobreMi.java` en la terminal (o desde las opciones de Java en VS Code) para generar la documentación en HTML y abre el archivo `index.html` en tu navegador.
