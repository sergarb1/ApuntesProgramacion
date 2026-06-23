---
title: "Boletín 2 - Inicial Resuelto: Variables y Operadores"
nav_order: 5
---
Aquí están las soluciones. Pero solo mires si ya lo has intentado. La memoria muscular se construye equivocándose.

---

## Ejercicio 1: Declara el tipo correcto

1. `int` — la edad cabe en un int (2.147 millones es el límite, 150 no da miedo)
2. `double` (o `float`) — los precios tienen decimales
3. `long` — 8.000.000.000 no cabe en un int (2.147.483.647 es el tope)
4. `boolean` — solo dos valores: true o false
5. `char` — una sola letra con comillas simples
6. `double` — decimales para la temperatura

> **💡 Explicación:** Cada tipo tiene un tamaño y un propósito. Usar `int` para todo es como llevar siempre un camión por si acaso tienes que mudarte. `byte` para la edad, `short` para la población de un pueblo, `int` para casi todo, `long` para cosas astronómicas, `double` para decimales, `boolean` para sí/no, `char` para una letra. La clave es elegir el tipo adecuado: ni un microbus para dos personas, ni un Smart para una familia de 5.

---

## Ejercicio 2: ¿Qué imprime?

```java
public class Operaciones {
    public static void main(String[] args) {
        int a = 10;
        int b = 3;
        System.out.println(a / b);
        System.out.println(a % b);
        System.out.println((double) a / b);
    }
}
```

**Salida:**
```
3
1
3.3333333333333335
```

> **💡 Explicación:** `10 / 3` con enteros da 3 (se truncan los decimales). `10 % 3` da 1 (el resto de la división). `(double) a / b` convierte `a` a double (10.0) y entonces la división da 3.333... El `(double)` delante de `a` es un *casting*: le dices a Java "confía en mí, trata esto como decimal aunque sea entero". Es como ponerle gafas a un miope: de repente ve los decimales.

---

## Ejercicio 3: Encuentra el error

```java
public class Errores {
    public static void main(String[] args) {
        int 1numero = 10;            // ERROR 1
        float precio = 19.99;        // ERROR 2
        System.out.println(1numero + precio);
    }
}
```

**Corrección:**
```java
public class Errores {
    public static void main(String[] args) {
        int numero1 = 10;
        float precio = 19.99f;
        System.out.println(numero1 + precio);
    }
}
```

> **💡 Explicación:** Error 1: las variables no pueden empezar con número. `1numero` es ilegal. `numero1` es legal. Es como las matrículas de los coches: pueden acabar en número pero no empezar con él. Error 2: los decimales en Java son `double` por defecto. Para asignarlos a un `float` necesitas añadir `f` al final: `19.99f`. Sin la `f`, Java se queja porque estás metiendo un double en una caja float y podría perderse precisión. Es como intentar meter una botella grande en un vaso pequeño: algo se derramará.

---

## Ejercicio 4: El intercambio

```java
public class Intercambio {
    public static void main(String[] args) {
        int a = 5;
        int b = 10;

        System.out.println("Antes: a = " + a + ", b = " + b);

        int temp = a;
        a = b;
        b = temp;

        System.out.println("Después: a = " + a + ", b = " + b);
    }
}
```

**Salida:**
```
Antes: a = 5, b = 10
Después: a = 10, b = 5
```

> **💡 Explicación:** Necesitas una variable temporal `temp` para no perder el valor de `a`. Si haces `a = b` directamente, pierdes el 5. Es como cuando quieres intercambiar el contenido de dos vasos: necesitas un tercer vaso vacío. Si vertieras el de vino en el de agua sin vaciar antes el de agua, tendrías vino con agua. La variable temporal es ese tercer vaso.

---

## Ejercicio 5: Escribe este programa

```java
public class AreaCirculo {
    public static void main(String[] args) {
        final double PI = 3.1416;
        double radio = 7.5;

        double area = PI * radio * radio;
        double perimetro = 2 * PI * radio;

        System.out.println("Área: " + area);
        System.out.println("Perímetro: " + perimetro);
    }
}
```

**Salida:**
```
Área: 176.715
Perímetro: 47.124
```

> **💡 Explicación:** `final` hace que PI sea constante. No podrás cambiarla después. Intenta poner `PI = 4;` después y el compilador te saltará al cuello. El área del círculo es PI por radio al cuadrado. El perímetro (o circunferencia) es 2 por PI por radio. `Math.PI` existe como constante más precisa (3.141592653589793), pero aquí usamos la nuestra. La gracia de `final` es que le dices a Java y a otros programadores: "esto no se toca, ni aunque venga el mismísimo Bill Gates a pedírtelo".

---

## Ejercicio 6: AceptaElReto 149 — San Fermines

```java
import java.util.Scanner;

public class Problema149 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (sc.hasNextInt()) {
            int n = sc.nextInt();
            int max = 0;
            for (int i = 0; i < n; i++) {
                int vel = sc.nextInt();
                if (vel > max) max = vel;
            }
            System.out.println(max);
        }
    }
}
```

> **💡 Explicación:** El problema de San Fermines te da varias líneas, cada una con un número N seguido de N velocidades. Debes imprimir la velocidad máxima de cada caso. Usamos `while (sc.hasNextInt())` porque no sabemos cuántas líneas hay. Leemos N, luego N números con un bucle, y nos quedamos con el máximo. El truco está en que `max` empieza en 0 (las velocidades son positivas). Si hubiera velocidades negativas, habría que empezar con `Integer.MIN_VALUE`. Pero en San Fermines todos corren hacia adelante, no como algunos que corren hacia atrás.

---

## Ejercicio 7: CodeWars — Even or Odd

```java
public class EvenOrOdd {
    public static String evenOrOdd(int number) {
        return number % 2 == 0 ? "Even" : "Odd";
    }
}
```

> **💡 Explicación:** El operador `%` te da el resto de la división. Si un número es par, `numero % 2` da 0. Si es impar, da 1. El ternario `? :` es un if-else en una línea: `condición ? valorSiTrue : valorSiFalse`. Devuelve "Even" si el resto es 0, "Odd" si no. Una línea. Elegante. Como un esmoquin para tu código. También podrías hacerlo con `if-else`, pero el ternario queda más limpio. CodeWars premia la elegancia, no las 15 líneas para una tontería.
