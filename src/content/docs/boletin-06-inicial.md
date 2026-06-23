---
title: "Boletín 4 - Inicial: POO: Clases y Objetos"
nav_order: 10
---
Sin soluciones. Las clases no se van a crear solas. Y si se crearan solas, probablemente serían clases abstractas, pero eso es para otro boletín.

---

## Ejercicio 1: Completa la clase Alumno

Faltan algunas partes. Complétalas para que funcione:

```java
public class Alumno {
    String nombre;
    String apellidos;
    int edad;

    // Completa el constructor: debe recibir nombre, apellidos y edad
    public Alumno(String nombre, String apellidos, int edad) {
        // ¿Qué va aquí?
    }

    public void presentarse() {
        System.out.println("Hola, soy " + nombre + " " + apellidos);
    }

    public void cumplirAnyos() {
        // Incrementa la edad en 1
    }
}
```

Crea luego en el `main` un alumno llamado "Laura García" con 20 años, haz que se presente y luego cumpla años.

---

## Ejercicio 2: ¿Qué imprime?

Sin ejecutar, di qué sale:

```java
public class Contador {
    int valor;

    public Contador(int valorInicial) {
        valor = valorInicial;
    }

    public void incrementar() {
        valor++;
    }

    public void decrementar() {
        valor--;
    }

    public static void main(String[] args) {
        Contador c = new Contador(10);
        c.incrementar();
        c.incrementar();
        c.decrementar();
        c.incrementar();
        System.out.println("Valor final: " + c.valor);
    }
}
```

---

## Ejercicio 3: Encuentra el error

```java
public class Producto {
    String nombre;
    double precio;

    public Producto(String nombre, double precio) {
        nombre = nombre;
        precio = precio;
    }

    public void mostrar() {
        System.out.println(nombre + " cuesta " + precio + "€");
    }
}

public class Main {
    public static void main(String[] args) {
        Producto p = new Producto("Laptop", 999.99);
        p.mostrar();
    }
}
```

Hay 1 error. Encuéntralo.

---

## Ejercicio 4: Escribe la clase Película

Crea una clase `Pelicula` con:
- Atributos: `String titulo`, `String genero`, `int duracion` (en minutos)
- Constructor que reciba los tres parámetros
- Método `void reproducir()` que imprima "Reproduciendo [título] ([género]) - [duración] min"
- Método `boolean esLarga()` que devuelva `true` si la duración es mayor a 120 minutos

En el `main`, crea dos películas y reproduce cada una, indicando si es larga o no.

---

## Ejercicio 5: Constructor vacío y setters

¿Qué imprime este código?

```java
public class Estudiante {
    String nombre;
    double notaMedia;

    public Estudiante() {
        this.nombre = "Desconocido";
        this.notaMedia = 5.0;
    }

    public Estudiante(String nombre, double notaMedia) {
        this.nombre = nombre;
        this.notaMedia = notaMedia;
    }

    public static void main(String[] args) {
        Estudiante e1 = new Estudiante();
        Estudiante e2 = new Estudiante("Carlos", 8.5);

        System.out.println(e1.nombre + " - " + e1.notaMedia);
        System.out.println(e2.nombre + " - " + e2.notaMedia);
    }
}
```

---

## Ejercicio 6: AceptaElReto — 417 Números binomiales

Resuelve el problema **417 — Números binomiales** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=417).

Calcula el coeficiente binomial "n sobre k". Tradicionalmente se define como `n! / (k! * (n-k)!)`. El problema lee pares (n, k) hasta (0, 0).

> **Pista:** Los factoriales pueden ser enormes. Mejor usa la fórmula iterativa: multiplica desde n hasta n-k+1 y divide por k!.

---

## Ejercicio 7: CodeWars — Return the day

Resuelve la kata **"Return the day"** (8 kyu) en CodeWars.

Crea una clase `DayOfWeek` con un método estático `getDay(int n)` que devuelva el día de la semana correspondiente:
- 1 → "Sunday", 2 → "Monday", ..., 7 → "Saturday"
- Cualquier otro número → "Wrong, please enter a number between 1 and 7"
