---
title: Boletín U08 — Inicial
description: Ejercicios básicos de Visibilidad, Encapsulación y Static
---

# 📝 Boletín U08 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, ponle cadenato a tu primera clase y haz que el `static` deje de parecer magia. Ningún atributo nace sabiendo ser `private`.

---

## Ejercicio 1: La casa de cristal

Esta clase es una casa de cristal: todo el mundo puede entrar y tocar lo que quiera.

```java
public class Persona {
    public String nombre;
    public int edad;
}
```

Convierte los atributos en `private` y añade getters y setters para `nombre` y `edad`. Escribe también un `main` que cree una `Persona`, le ponga "Ana" y 25 años usando los setters, y luego muestre los valores con los getters.

---

## Ejercicio 2: El coche del vecindario

Parte de esta clase:

```java
public class Coche {
    private String marca;
    private double velocidad;

    public Coche(String marca) {
        this.marca = marca;
        this.velocidad = 0;
    }

    public String getMarca() {
        return marca;
    }
}
```

Añade `getVelocidad()` y un `setVelocidad(double velocidad)` que **rechace** las velocidades negativas y las superiores a 200 (mostrando "Velocidad inválida."). Escribe un `main` que cree un coche "Seat" e intente ponerle -50 y luego 120.

---

## Ejercicio 3: El termómetro con cerebro

Escribe una clase `Termometro` con:

- Atributo `private double temperatura`.
- Constructor que inicialice la temperatura a 20.0.
- Getter `getTemperatura()`.
- Setter `setTemperatura(double temperatura)` que **solo** acepte valores entre -273.15 y 100.0. Si el valor no es válido, muestra "Temperatura fuera de rango.".

En un `main`, crea un termómetro, ponle -500 (debe rechazarse) y luego 36.5, y muestra la temperatura final.

---

## Ejercicio 4: getter sin setter

Esta clase representa la configuración de una app: el idioma se elige al crearla y **no debe poder cambiarse después**.

```java
public class Configuracion {
    private String idioma;

    public Configuracion(String idioma) {
        this.idioma = idioma;
    }

    public String getIdioma() {
        return idioma;
    }
}
```

Fíjate: tiene getter pero **no** setter. Escribe un `main` que cree una configuración con "es" y muestre el idioma. Responde: ¿por qué no tiene setter? ¿Qué le pasaría a un usuario que intentase hacer `config.idioma = "va"` desde fuera?

---

## Ejercicio 5: El contador de la clase

Escribe una clase `Contador` con:

- Atributo `public static int total = 0;`.
- Un constructor que incremente `total` en 1 cada vez que se crea un objeto.

En un `main`, crea 3 objetos `Contador` y muestra `Contador.total`. Responde: ¿cuánto vale `total` y por qué no es 1?

---

## Ejercicio 6: La calculadora sin pilas

Escribe una clase `Utilidades` con dos métodos **estáticos**: `sumar(int a, int b)` y `restar(int a, int b)`. En un `main`, usa ambos métodos **sin crear ningún objeto** (usa el nombre de la clase) y muestra los resultados de `sumar(5, 3)` y `restar(10, 4)`.

Pista: `int resultado = Utilidades.sumar(5, 3);`

---

## Ejercicio 7: las constantes del barrio

Escribe una clase `Constantes` que contenga:

- `public static final double IVA = 0.21;`
- `public static final int MAX_INTENTOS_LOGIN = 3;`
- `public static final String NOMBRE_APP = "GestionCurso";`

En un `main`, muestra las tres constantes. Después, intenta hacer `Constantes.IVA = 0.5;` y responde: ¿qué ocurre al compilar?

---

## Ejercicio 8: ¿Qué imprime? — el puzle estático

Sin ejecutar, escribe la salida exacta de este programa:

```java
public class Puzle {
    static int s = 0;
    int i = 0;

    public Puzle() {
        s++;
        i = s;
    }

    public static void main(String[] args) {
        Puzle p1 = new Puzle();
        Puzle p2 = new Puzle();
        System.out.println(p1.i + " " + p2.i + " " + Puzle.s);
    }
}
```

Pista: `s` es de la clase (una sola copia compartida); `i` es de cada objeto y se copia del valor de `s` en el momento de nacer.

---

## Ejercicio 9: CodeWars — Square(n) Sum

Resuelve la kata **"Square(n) Sum"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/515e271a311df0350d00000f).

Completa el método `public static int squareSum(int[] n)` que reciba un array de enteros y devuelva la suma de los cuadrados de cada número.

**Ejemplo:** `[1, 2, 2]` → `1 + 4 + 4 = 9`.

Pista: usa un `for` que acumule `n[i] * n[i]`. Los arrays se recorren con la U04, pero ya puedes usar el índice.