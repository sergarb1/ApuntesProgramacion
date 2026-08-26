---
title: Boletín U06 — Extras
description: CodeWars y AceptaElReto para ir más allá de la unidad
---

# 📝 Boletín U06 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. La solución está oculta: resístete hasta agotar tu pista.

---

## CodeWars

### 1. FIXME: Get Full Name

Te dan una clase `Dinglemouse` con un método `getFullName()` que debería devolver `"Nombre Apellido"`, pero el resultado está al revés o incompleto. Arréglala.

- [Enunciado en CodeWars](https://www.codewars.com/kata/597c684822bc9388f600010f)
- Dificultad: 7 kyu

**Pista:** fíjate en qué atributos existen (`firstName` y `lastName`) y en cómo el método los concatena. La clase está hecha para romperse: busca el error de `this` o de orden.

<details>
<summary>🔄 Solución</summary>

```java
public class Dinglemouse {
    private final String firstName;
    private final String lastName;

    public Dinglemouse(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public String getFullName() {
        if (firstName.isEmpty() && lastName.isEmpty()) {
            return "";
        }
        if (firstName.isEmpty()) {
            return lastName;
        }
        if (lastName.isEmpty()) {
            return firstName;
        }
        return firstName + " " + lastName;
    }
}
```

La clase original fallaba al construir el nombre completo: los casos en los que falta un nombre o los dos debían devolver lo que hay. El método correcto encadena los casos límite antes de juntar ambos nombres con un espacio.

</details>

---

### 2. Geometry Basics: Distance between points in 2D

Te dan una clase `Point` con dos propiedades (`x` e `y`) y tienes que implementar el método `distanceBetweenPoints(Point a, Point b)` que devuelva la distancia entre ellos.

**Ejemplo:** `Point(3, 3)` y `Point(3, 3)` → `0`. `Point(1, 6)` y `Point(4, 2)` → `5`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/58dced7b702b805b200000be)
- Dificultad: 8 kyu

**Pista:** distancia euclidiana `Math.sqrt(Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2))`. Los objetos se pasan como parámetro, como hicimos con `Fraccion.sumar`.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static double distanceBetweenPoints(Point a, Point b) {
        return Math.sqrt(Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2));
    }
}

class Point {
    public double x;
    public double y;

    public Point(double x, double y) {
        this.x = x;
        this.y = y;
    }
}
```

El método recibe dos objetos `Point` y lee sus atributos (`a.x`, `b.x`...). Es exactamente el mismo patrón de `sumar(Fraccion otra)`: un objeto trabaja con otro. La fórmula de Pitágoras resuelta por objetos.

</details>

---

### 3. Grasshopper — Personalized Message

Crea el método `greet(name, owner)` que devuelva `"Hello boss"` si `name` y `owner` son iguales, o `"Hello guest"` si son distintos.

**Ejemplos:** `greet("Daniel", "Daniel")` → `"Hello boss"`, `greet("Greg", "Daniel")` → `"Hello guest"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/5772da22b89313a4d50012f7)
- Dificultad: 8 kyu

**Pista:** compara `String` con `.equals()`, nunca con `==`. Un `if`/`else` o un ternario.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String greet(String name, String owner) {
        return name.equals(owner) ? "Hello boss" : "Hello guest";
    }
}
```

Una línea con el ternario y `.equals()`. Si usas `==` con cadenas, los resultados serán impredecibles: en Java los `String` se comparan con `.equals()` porque son objetos (aunque Java les da un trato especial). La U07 te contará por qué.

</details>

---

### 4. Sleigh Authentication

Tienes que completar la clase `Sleigh` con un método `authenticate(name, password)` que devuelva `true` solo si `name` es `"Santa Claus"` y `password` es `"Ho Ho Ho!"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/52adc142b2651f25a8000643)
- Dificultad: 8 kyu

**Pista:** devuelve `name.equals("Santa Claus") && password.equals("Ho Ho Ho!")`. Otra vez `.equals()`, y el `&&` de la U03.

<details>
<summary>🔄 Solución</summary>

```java
public class Sleigh {
    public boolean authenticate(String name, String password) {
        return name.equals("Santa Claus") && password.equals("Ho Ho Ho!");
    }
}
```

Un método de una sola línea: dos comparaciones con `.equals()` unidas por `&&`. Es una de esas katas trampa: parece trivial, pero muchos caen usando `==` y fallan los tests. Objetos por todos lados.

</details>

---

## AceptaElReto

### 5. 148 — Nochevieja

Ramón se pasa el día de Nochevieja contando los minutos que faltan para medianoche. Para cada hora de la entrada (formato `HH:MM`), di cuántos minutos faltan para las `00:00`. La entrada termina con `00:00`, que no se procesa.

**Entrada:**

```
23:45
21:30
00:01
00:00
```

**Salida:**

```
15
150
1439
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=148)
- Dificultad: Fácil

**Pista:** separa la hora y el minuto con `split(":")`. Los minutos que faltan son `(23 - hora) * 60 + (60 - minuto)`. Escribe una clase `Hora` con un método `minutosHastaMedianoche()` y verás lo natural que queda.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Nochevieja {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String linea = sc.next();

        while (!linea.equals("00:00")) {
            String[] partes = linea.split(":");
            int hora = Integer.parseInt(partes[0]);
            int minuto = Integer.parseInt(partes[1]);
            System.out.println((23 - hora) * 60 + (60 - minuto));
            linea = sc.next();
        }
        sc.close();
    }
}
```

Para `23:45`: `(23-23)*60 + (60-45)` = 15. Para `21:30`: `2*60 + 30` = 150. El `while` se detiene con la línea `00:00` porque se compara con `.equals()` (es un `String`, recuerda). La versión con clase `Hora` es un buen ejercicio voluntario.

</details>

---

### 6. 117 — La fiesta aburrida

Tinín odia saludar a desconocidos. La entrada empieza con un número N (cuánta gente hay) y luego N líneas con el formato `"Soy Lotario"`. Para cada una, imprime `"Hola, Lotario."`.

**Entrada:**

```
3
Soy Lotario
Soy Aldonza
Soy Ender
```

**Salida:**

```
Hola, Lotario.
Hola, Aldonza.
Hola, Ender.
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=117)
- Dificultad: Fácil

**Pista:** `split(" ")` sobre cada línea y coge la segunda parte (índice 1). Puedes modelar cada persona como un objeto de una clase `Persona` con el nombre y un método `saludar()`.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class FiestaAburrida {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.nextLine();

        for (int i = 0; i < n; i++) {
            String linea = sc.nextLine();
            String nombre = linea.split(" ")[1];
            System.out.println("Hola, " + nombre + ".");
        }
        sc.close();
    }
}
```

`split(" ")` parte `"Soy Lotario"` en `["Soy", "Lotario"]` y el índice 1 es el nombre. El `sc.nextLine()` tras el `nextInt()` consume el salto de línea sobrante. Una versión con clase `Persona` y su método `saludar()` es el reto extra ideal para esta unidad.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines las clases, el paso natural es proteger sus datos: eso es la **encapsulación** de la U07. Y si quieres ver objetos que se crean y destruyen solos, espérate a los arrays y colecciones de la U09, donde crearás decenas de objetos en un bucle.
