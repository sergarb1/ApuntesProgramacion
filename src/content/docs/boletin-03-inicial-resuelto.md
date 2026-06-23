---
title: "Boletín 3 - Inicial Resuelto: Estructuras de Control"
nav_order: 8
---
Las soluciones están aquí. Pero solo las necesitas si ya has sudado un poco. El sudor programa mejor que las soluciones.

---

## Ejercicio 1: ¿Qué imprime este if-else?

```java
public class QueImprime {
    public static void main(String[] args) {
        int edad = 17;
        boolean conPadres = true;

        if (edad >= 18) {
            System.out.println("Entrada libre");
        } else if (conPadres) {
            System.out.println("Pasas con tus viejos");
        } else {
            System.out.println("A casa");
        }
    }
}
```

**Respuesta:** "Pasas con tus viejos"

> **💡 Explicación:** `edad >= 18` es `false` (tiene 17), así que no entra al primer `if`. Luego evalúa `conPadres` que es `true`, por lo tanto entra al `else if` e imprime "Pasas con tus viejos". El `else` final no se ejecuta nunca porque ya entró en el `else if`. Java evalúa las condiciones en orden y se queda con la PRIMERA que sea `true`. Como un semáforo: si el primero está verde, pasas; si no, miras el siguiente. No te saltas ninguno, pero tampoco miras más allá del que ya está verde.

---

## Ejercicio 2: Completa el switch

```java
int dia = 3;
String nombreDia;

switch (dia) {
    case 1:
        nombreDia = "Lunes";
        break;
    case 2:
        nombreDia = "Martes";
        break;
    case 3:
        nombreDia = "Miércoles";
        break;
    default:
        nombreDia = "Desconocido";
}
System.out.println(nombreDia);
```

**Con breaks:** Imprime "Miércoles".

**Sin breaks (fall-through):** Imprime "Miércoles". Pero si `dia = 1`, sin breaks imprimiría "LunesMartesMiércoles" (¡todo seguido!). Con `dia = 2` sin breaks: "MartesMiércoles".

> **💡 Explicación:** `break` es la instrucción de "salir del switch". Si no lo pones, el código "se cae" al siguiente `case` (fall-through). Es como si las escaleras no tuvieran descansillos: bajas de un tirón hasta el final. En nuestro ejemplo, con `dia = 3`, el `break` del `case 3` frena la caída. Pero en `case 1` y `case 2`, sin `break`, el programa seguiría ejecutando los `case` siguientes hasta encontrar un `break` o llegar al `default`.

---

## Ejercicio 3: Encuentra el error (bucle infinito)

```java
public class BucleInfinito {
    public static void main(String[] args) {
        int i = 1;
        while (i <= 5) {
            System.out.println("Vuelta " + i);
        }
    }
}
```

**Error:** Falta `i++` dentro del bucle. `i` siempre vale 1, la condición `i <= 5` siempre es `true`.

**Corregido:**
```java
public class BucleCorregido {
    public static void main(String[] args) {
        int i = 1;
        while (i <= 5) {
            System.out.println("Vuelta " + i);
            i++;
        }
    }
}
```

> **💡 Explicación:** Sin `i++`, la variable de control nunca cambia. Es como un perro persiguiéndose la cola: nunca para. El bucle `while` solo comprueba la condición. Si siempre se cumple, el bucle es eterno. `i++` es el que hace que `i` aumente hasta 6, momento en que `i <= 5` es falso y el bucle termina. Siempre, SIEMPRE, asegúrate de que la variable de control se actualice dentro del bucle. Es la primera regla de los bucles: "no olvides actualizar la condición".

---

## Ejercicio 4: Escribe este programa (while)

```java
import java.util.Scanner;

public class PositivoNegativo {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numero;

        System.out.println("Introduce números (0 para salir):");
        numero = sc.nextInt();
        while (numero != 0) {
            if (numero > 0) {
                System.out.println(numero + " es positivo");
            } else {
                System.out.println(numero + " es negativo");
            }
            numero = sc.nextInt();
        }
        System.out.println("Fin del programa");
        sc.close();
    }
}
```

> **💡 Explicación:** Leemos el primer número antes del bucle (esto se llama "lectura anticipada"). Luego, mientras no sea 0, evaluamos si es positivo o negativo, y volvemos a leer. Cuando el usuario introduce 0, el bucle termina. Podríamos usar un `do-while` para no repetir la lectura, pero así es más claro. Es como un portero que pregunta "¿cuántos años tienes?" hasta que le dices 0 y entonces te deja pasar... espera, eso no tiene sentido. Pero el código sí.

---

## Ejercicio 5: El for de toda la vida

```java
public class SumaFor {
    public static void main(String[] args) {
        int suma = 0;
        for (int i = 1; i <= 100; i++) {
            suma += i;
        }
        System.out.println("Suma del 1 al 100: " + suma);
    }
}
```

**Salida:** 5050

> **💡 Explicación:** El bucle `for` es perfecto cuando sabes exactamente cuántas veces repetir. Aquí sabemos que vamos de 1 a 100. La variable `i` empieza en 1, se incrementa de 1 en 1, y en cada vuelta se suma a `suma`. Al final, `suma` contiene 5050. Hay una fórmula matemática: `n*(n+1)/2` = `100*101/2 = 5050`. Pero en programación, el bucle está bien. La historia cuenta que Gauss descubrió esta fórmula de niño para hacer el cálculo más rápido. Tú estás aprendiendo a programar, no a ser Gauss. Aunque si quieres ser Gauss, también vale.

---

## Ejercicio 6: AceptaElReto 200 — Aburrimiento en las aulas

```java
import java.util.Scanner;

public class Problema200 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int num = sc.nextInt();
        while (num != 0) {
            int a = 5 * num * num + 4;
            int b = 5 * num * num - 4;
            int raizA = (int) Math.sqrt(a);
            int raizB = (int) Math.sqrt(b);

            if (raizA * raizA == a || raizB * raizB == b) {
                System.out.println("Fibonacci");
            } else {
                System.out.println("No fibonacci");
            }
            num = sc.nextInt();
        }
    }
}
```

> **💡 Explicación:** La propiedad matemática dice: un número es parte de la secuencia de Fibonacci si y solo si `(5n² + 4)` o `(5n² - 4)` es un cuadrado perfecto. Para comprobar si algo es cuadrado perfecto, calculamos la raíz cuadrada, la truncamos a entero, y elevamos al cuadrado. Si coincide con el original, es cuadrado perfecto. Ejemplo: para n=5: 5*25+4=129 (no es cuadrado), 5*25-4=121=11² → ¡Fibonacci! Efectivamente, 5 está en la secuencia. Para n=4: 5*16+4=84 (no), 5*16-4=76 (no) → No fibonacci. El 4 no está. El `while` sigue leyendo números hasta que se introduce un 0.

---

## Ejercicio 7: CodeWars — Century From Year

```java
public class CenturyFromYear {
    public static int century(int number) {
        return (number + 99) / 100;
    }
}
```

> **💡 Explicación:** Para calcular el siglo de un año, sumamos 99 y dividimos entre 100. Año 1: (1+99)/100 = 1. Año 100: (100+99)/100 = 1. Año 101: (101+99)/100 = 2. Año 2000: (2000+99)/100 = 20. Año 2001: (2001+99)/100 = 21. La lógica: el siglo 1 abarca del año 1 al 100. Al sumar 99, desplazamos el rango para que la división entera funcione. Es un truco matemático que evita usar `if` o `Math.ceil()`. Simple, elegante, y te hace quedar bien en las cenas de Navidad cuando alguien pregunta "¿en qué siglo estamos?".
