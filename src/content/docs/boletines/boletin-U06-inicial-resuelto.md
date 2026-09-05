---
title: Boletín U06 — Inicial Resuelto
description: Los mismos ejercicios que el boletín inicial, con soluciones
---

# 📝 Boletín U06 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: El perro que habla

<details>
<summary>🔄 Solución</summary>

```java
public class Perro {
    String nombre;
    int edad;

    public Perro(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    void ladrar() {
        System.out.println("¡Guau guau! Soy " + nombre);
    }

    public static void main(String[] args) {
        Perro toby = new Perro("Toby", 3);
        toby.ladrar();
    }
}
```

Salida: `¡Guau guau! Soy Toby`

El constructor con `this` coloca el nombre y la edad en el objeto recién nacido. El método `ladrar()` no recibe nada: usa el atributo `nombre` que ya quedó guardado.

</details>

---

## Ejercicio 2: El teléfono con batería

<details>
<summary>🔄 Solución</summary>

```java
public class Telefono {
    String marca;
    int bateria;

    public Telefono(String marca, int bateria) {
        this.marca = marca;
        this.bateria = bateria;
    }

    void llamar() {
        System.out.println("Llamando... (batería al " + bateria + "%)");
    }

    void cargar(int minutos) {
        this.bateria += minutos;
    }

    public static void main(String[] args) {
        Telefono movil = new Telefono("Nokia", 50);
        movil.llamar();
        movil.cargar(30);
        movil.llamar();
    }
}
```

Salida:

```
Llamando... (batería al 50%)
Llamando... (batería al 80%)
```

`cargar(int minutos)` modifica el atributo con `this.bateria += minutos;`. El mismo objeto conserva su batería entre llamadas: eso es tener estado.

</details>

---

## Ejercicio 3: El estudiante con nota

<details>
<summary>🔄 Solución</summary>

```java
public class Estudiante {
    String nombre;
    double nota;

    public Estudiante(String nombre, double nota) {
        this.nombre = nombre;
        this.nota = nota;
    }

    void mostrarEstado() {
        if (nota >= 5) {
            System.out.println(nombre + " ha aprobado");
        } else {
            System.out.println(nombre + " ha suspendido");
        }
    }

    public static void main(String[] args) {
        Estudiante ana = new Estudiante("Ana", 8.5);
        Estudiante luis = new Estudiante("Luis", 3.0);
        ana.mostrarEstado();
        luis.mostrarEstado();
    }
}
```

Salida:

```
Ana ha aprobado
Luis ha suspendido
```

El método mezcla dos mundos: usa los atributos del objeto (`nombre`, `nota`) con la lógica de decisión (`if`/`else`) que aprendiste en la U03. Dos objetos, dos estados, una clase.

</details>

---

## Ejercicio 4: La película en cartelera

<details>
<summary>🔄 Solución</summary>

```java
public class Pelicula {
    String titulo;
    String genero;

    public Pelicula(String titulo, String genero) {
        this.titulo = titulo;
        this.genero = genero;
    }

    void mostrarCartelera() {
        System.out.println("Ahora en cines: " + titulo + " (" + genero + ")");
    }

    public static void main(String[] args) {
        Pelicula p = new Pelicula("El curso de Java", "Terror");
        p.mostrarCartelera();
    }
}
```

Salida: `Ahora en cines: El curso de Java (Terror)`

Mismo patrón que el perro y el teléfono: atributos, constructor con `this`, método que los usa. A estas alturas ya deberías notar que todas las clases fáciles se parecen.

</details>

---

## Ejercicio 5: La persona educada

<details>
<summary>🔄 Solución</summary>

```java
public class Persona {
    String nombre;
    int edad;

    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    void presentarse() {
        System.out.println("Hola, soy " + nombre + " y tengo " + edad + " años.");
    }

    public static void main(String[] args) {
        Persona ana = new Persona("Ana", 25);
        ana.presentarse();
    }
}
```

Salida: `Hola, soy Ana y tengo 25 años.`

Aquí es donde `this` demuestra su valor: sin `this`, `nombre = nombre` asignaría el parámetro al parámetro y el atributo quedaría en `null`. Con `this`, el atributo recibe el valor del parámetro.

</details>

---

## Ejercicio 6: El círculo calculador

<details>
<summary>🔄 Solución</summary>

```java
public class Circulo {
    double radio;

    public Circulo(double radio) {
        this.radio = radio;
    }

    double calcularArea() {
        return Math.PI * this.radio * this.radio;
    }

    public static void main(String[] args) {
        Circulo c = new Circulo(2.5);
        System.out.println("Área: " + c.calcularArea());
    }
}
```

Salida: `Área: 19.634954084936208`

Este método no es `void`: usa `return` para devolver el área. Los métodos que *calculan* devuelven un valor; los que solo *muestran* son `void`. Esa distinción es mitad de la batalla de esta unidad.

</details>

---

## Ejercicio 7: El videojuego jugable

<details>
<summary>🔄 Solución</summary>

```java
public class Videojuego {
    String titulo;
    int horasJugadas;

    public Videojuego(String titulo, int horasJugadas) {
        this.titulo = titulo;
        this.horasJugadas = horasJugadas;
    }

    void jugar(int horas) {
        this.horasJugadas += horas;
    }

    void mostrar() {
        System.out.println(titulo + " - " + horasJugadas + " horas");
    }

    public static void main(String[] args) {
        Videojuego juego = new Videojuego("Minecraft", 10);
        juego.jugar(5);
        juego.mostrar();
    }
}
```

Salida: `Minecraft - 15 horas`

El método `jugar(int horas)` es un *setter* informal: modifica el estado del objeto. El objeto no es una caja estática: sus atributos cambian con los métodos. Eso es la vida de un objeto.

</details>

---

## Ejercicio 8: ¿Qué imprime? — el taller de coches

<details>
<summary>🔄 Solución</summary>

Imprime:

```
Seat va a 150 km/h
Ford va a 90 km/h
```

Hay **dos** objetos (`c1` y `c2`), cada uno con su propia `velocidad`. `c1.acelerar(30)` suma 30 a la velocidad de `c1` (120 + 30 = 150) pero no toca la de `c2`. Cuando `c2.mostrar()` se ejecuta, su velocidad sigue siendo 90. Los atributos de un objeto son privados de ese objeto.

</details>

---

## Ejercicio 9: CodeWars — Object Oriented Piracy

<details>
<summary>🔄 Solución</summary>

```java
public class Ship {
    private final double draft;
    private final int crew;

    public Ship(double draft, int crew) {
        this.draft = draft;
        this.crew = crew;
    }

    public boolean isWorthIt() {
        return draft - (crew * 1.5) > 20;
    }
}
```

El constructor guarda `draft` y `crew` con `this`, y `isWorthIt()` aplica la fórmula: cada miembro de la tripulación reduce el calado útil en 1.5 pies. Si lo que queda supera 20, el barco merece la pena. Objeto + operaciones de la U02, resuelto.

</details>
