---
title: Boletín U05 — Inicial Resuelto
description: Los mismos ejercicios que el boletín inicial, con soluciones
---

# 📝 Boletín U05 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: El saludo oficial

<details>
<summary>🔄 Solución</summary>

```java
public class Saludo {
    public static void saludar() {
        System.out.println("¡Hola, Java!");
    }

    public static void main(String[] args) {
        saludar();
        saludar();
        saludar();
    }
}
```

Salida:

```
¡Hola, Java!
¡Hola, Java!
¡Hola, Java!
```

La receta se escribe una vez, fuera del `main`, y se usa tres veces. Ese es exactamente el negocio de los métodos: escribir una vez, llamar las veces que haga falta.

</details>

---

## Ejercicio 2: ¿Qué pasa? — la variable fantasma

<details>
<summary>🔄 Solución</summary>

El programa no compila porque `extra` es una **variable local** de `sumar()`: su ámbito termina en la llave que cierra el método. En la línea `System.out.println(extra);` el compilador escupe un `cannot find symbol` (no encuentra el símbolo), porque desde `main` esa variable nunca ha existido.

Cómo arreglarlo (cualquiera de las dos):

- Imprimir `extra` **dentro** de `sumar()`, donde sí vive.
- Pasarla como parámetro o devolverla con `return` si `main` la necesita.

La lección: cada método es una casa con puerta. Lo que se deja dentro no sale sin invitación.

</details>

---

## Ejercicio 3: La ficha de presentación

<details>
<summary>🔄 Solución</summary>

```java
public class Ficha {
    public static void presentar(String nombre, int edad) {
        System.out.println("Me llamo " + nombre + " y tengo " + edad + " años.");
    }

    public static void main(String[] args) {
        presentar("Ana", 20);
        presentar("Luis", 15);
    }
}
```

Salida:

```
Me llamo Ana y tengo 20 años.
Me llamo Luis y tengo 15 años.
```

Un mismo método, dos llamadas, dos personas distintas: los parámetros son las entradas que hacen genérico al método. Sin ellos tendrías que copiar el `println` dos veces.

</details>

---

## Ejercicio 4: El primer `return`

<details>
<summary>🔄 Solución</summary>

```java
public class Suma {
    public static int sumar(int a, int b) {
        return a + b;
    }

    public static void main(String[] args) {
        int total = sumar(3, 4);
        System.out.println("3 + 4 = " + total);
        System.out.println("10 + 20 = " + sumar(10, 20));
    }
}
```

Salida:

```
3 + 4 = 7
10 + 20 = 30
```

`return` corta el método y entrega el valor a quien lo llamó. El primero lo guardas en `total`; el segundo lo usas directamente dentro del `println`. Imprimir es cosa de quien recibe, no de quien devuelve.

</details>

---

## Ejercicio 5: Doble, por favor

<details>
<summary>🔄 Solución</summary>

```java
public class Doble {
    public static int calcularDoble(int n) {
        return n * 2;
    }

    public static void mostrarDoble(int n) {
        System.out.println("El doble de " + n + " es " + n * 2);
    }

    public static void main(String[] args) {
        int doble = calcularDoble(6);
        System.out.println(doble);
        mostrarDoble(6);
    }
}
```

Salida:

```
12
El doble de 6 es 12
```

`calcularDoble` devuelve un `int` que puedes guardar, comparar o usar en otra cuenta. `mostrarDoble` es `void`: no devuelve nada, solo imprime. La regla de oro: el que calcula no imprime, y el que imprime no calcula.

</details>

---

## Ejercicio 6: ¿Qué imprime? — el viaje de ida y vuelta

<details>
<summary>🔄 Solución</summary>

```
antes
sumando...
total: 7
```

El orden es fiel al viaje: el `main` imprime `antes`, se detiene en `sumar(3, 4)`, salta al método (que imprime `sumando...` y devuelve `7`), vuelve al `main` con el resultado y sigue con el último `println`. Si te saltaste `sumando...`, recuerda: nada se ejecuta «en paralelo»; Java va de arriba abajo y de ida y vuelta, sin atajos.

</details>

---

## Ejercicio 7: ¿Par o impar?

<details>
<summary>🔄 Solución</summary>

```java
public class ParOImpar {
    public static boolean esPar(int n) {
        return n % 2 == 0;
    }

    public static void main(String[] args) {
        if (esPar(7)) {
            System.out.println("7 es par");
        } else {
            System.out.println("7 es impar");
        }
        if (esPar(12)) {
            System.out.println("12 es par");
        } else {
            System.out.println("12 es impar");
        }
    }
}
```

Salida:

```
7 es impar
12 es par
```

`esPar` devuelve un `boolean`, así que puede vivir directamente en la condición del `if`. Es la manera elegante de preguntar: sin guardar el resultado en una variable intermedia.

</details>

---

## Ejercicio 8: La puerta de la edad

<details>
<summary>🔄 Solución</summary>

```java
public class Puerta {
    public static boolean mayorDeEdad(int edad) {
        return edad >= 18;
    }

    public static void main(String[] args) {
        System.out.println("15: " + (mayorDeEdad(15) ? "entra" : "no entra"));
        System.out.println("18: " + (mayorDeEdad(18) ? "entra" : "no entra"));
        System.out.println("30: " + (mayorDeEdad(30) ? "entra" : "no entra"));
    }
}
```

Salida:

```
15: no entra
18: entra
30: entra
```

La regla vive en un solo sitio (`mayorDeEdad`) y se aplica a las tres edades. Si mañana el límite cambia a 21, tocas **un** `return` y todo el programa se entera. Ese es el poder de no repetir la lógica.

</details>

---

## Ejercicio 9: CodeWars — Century From Year

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int century(int year) {
        return (year - 1) / 100 + 1;
    }
}
```

Dos caminos:

- `(year - 1) / 100 + 1`: el `-1` hace que el año 100 caiga en el siglo 1 y el 101 en el 2.
- `Math.ceil(year / 100.0)`: redondea hacia arriba el resultado decimal (`1705 / 100.0` es `17.05`, y `Math.ceil` lo sube a `18`). Ojo: si divides en entero (`year / 100`) pierdes el resto y el año 1601 caería en el siglo 16.

Un método, dos líneas, cero bucles: a veces la mejor solución es la que no se complica.

</details>
