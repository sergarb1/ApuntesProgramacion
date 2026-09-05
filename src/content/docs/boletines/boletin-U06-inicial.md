---
title: Boletín U06 — Inicial
description: Ejercicios básicos de POO, Clases y Objetos
---

# 📝 Boletín U06 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, enciende la fábrica de galletas y haz que tus objetos nazcan, hablen y funcionen. Nadie nace sabiendo cuándo usar `this`.

---

## Ejercicio 1: El perro que habla

Escribe una clase `Perro` con dos atributos: `String nombre` e `int edad`. Incluye un método `void ladrar()` que imprima `"¡Guau guau! Soy [nombre]"`. Luego, en un `main`, crea un perro llamado `Toby` de 3 años y haz que ladre.

Pista: recuerda que los atributos se inicializan en el constructor con `this`.

---

## Ejercicio 2: El teléfono con batería

Escribe una clase `Telefono` con los atributos `String marca` e `int bateria`. Incluye un método `void llamar()` que imprima `"Llamando... (batería al X%)"` y otro `void cargar(int minutos)` que suba la batería en los minutos recibidos. Crea en el `main` un `Telefono` de marca `"Nokia"` con batería inicial `50`, llámalo y cárgalo `30` minutos.

Pista: `cargar(int minutos)` modifica el atributo `bateria`: `this.bateria += minutos;`.

---

## Ejercicio 3: El estudiante con nota

Escribe una clase `Estudiante` con los atributos `String nombre` y `double nota`. Incluye un método `void mostrarEstado()` que imprima `"[nombre] ha aprobado"` si la nota es mayor o igual que 5, o `"[nombre] ha suspendido"` si es menor. Crea en el `main` dos estudiantes (una con nota 8.5 y otro con nota 3) y muestra su estado.

Pista: dentro de `mostrarEstado()` puedes usar `if`/`else` con `this.nota`.

---

## Ejercicio 4: La película en cartelera

Escribe una clase `Pelicula` con los atributos `String titulo` y `String genero`. Incluye un método `void mostrarCartelera()` que imprima `"Ahora en cines: [titulo] ([genero])"`. Crea en el `main` una película `"El curso de Java"` de género `"Terror"` y muéstrala en cartelera.

Pista: el constructor recibe los dos valores y los asigna con `this`.

---

## Ejercicio 5: La persona educada

Escribe una clase `Persona` con los atributos `String nombre` y `int edad`. Usa un constructor con parámetros. Añade un método `void presentarse()` que imprima `"Hola, soy [nombre] y tengo [edad] años."`. Crea en el `main` a `"Ana"` de 25 años y haz que se presente.

Pista: esta es la clase con la que vas a entender por qué `this` separa al atributo del parámetro.

---

## Ejercicio 6: El círculo calculador

Escribe una clase `Circulo` con el atributo `double radio`. Incluye un método `double calcularArea()` que devuelva el área (`π * radio²`). Usa `Math.PI` para π. Crea en el `main` un círculo de radio `2.5` y muestra su área.

Pista: dentro del método, `return Math.PI * this.radio * this.radio;`.

---

## Ejercicio 7: El videojuego jugable

Escribe una clase `Videojuego` con los atributos `String titulo` y `int horasJugadas`. Incluye un método `void jugar(int horas)` que sume las horas a `horasJugadas` y otro `void mostrar()` que imprima `"[titulo] - X horas"`. Crea en el `main` un juego con 10 horas, juega 5 más y muéstralo.

Pista: suma las horas al atributo: `this.horasJugadas += horas;`.

---

## Ejercicio 8: ¿Qué imprime? — el taller de coches

Sin ejecutar, escribe la salida exacta de este programa:

```java
public class Taller {
    public static void main(String[] args) {
        Coche c1 = new Coche("Seat", 120);
        Coche c2 = new Coche("Ford", 90);
        c1.acelerar(30);
        c1.mostrar();
        c2.mostrar();
    }
}

class Coche {
    String marca;
    int velocidad;

    public Coche(String marca, int velocidad) {
        this.marca = marca;
        this.velocidad = velocidad;
    }

    void acelerar(int inc) {
        velocidad += inc;
    }

    void mostrar() {
        System.out.println(marca + " va a " + velocidad + " km/h");
    }
}
```

Pista: ¿cuántos objetos hay? Cada uno guarda su propia `velocidad`; acelerar al `c1` no toca a `c2`.

---

## Ejercicio 9: CodeWars — Object Oriented Piracy

Resuelve la kata **"Object Oriented Piracy"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/54fe05c4762e2e3047000add).

Crea la clase `Ship` con un constructor que reciba `draft` (calado en pies) y `crew` (tripulación), y un método `boolean isWorthIt()` que devuelva `true` si `draft - (crew * 1.5) > 20`.

Pista: guarda `draft` y `crew` en atributos con `this` y usa el operador `-` y `*` de la U02 dentro de `isWorthIt()`.
