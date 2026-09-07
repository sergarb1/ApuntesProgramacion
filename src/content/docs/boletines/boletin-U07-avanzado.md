---
title: Boletín U07 — Avanzado
description: Ejercicios de dificultad progresiva para exprimir la unidad
---

# 📝 Boletín U07 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: La biblioteca

Escribe una clase `Libro` con los atributos `String titulo`, `String autor` e `int paginas`. Añade un método `void mostrarInfo()` que imprima:

```
El Quijote, de Miguel de Cervantes (863 páginas)
```

Crea en el `main` dos libros distintos y muestra su información.

**Pista:** tres atributos, un constructor con tres parámetros y `this.` tres veces. El método usa los atributos para construir la frase.

---

## ⭐ Ejercicio 2: El rectángulo razonador

Escribe una clase `Rectangulo` con los atributos `double ancho` y `double alto`. Añade:
- `double calcularArea()` → `ancho * alto`
- `double calcularPerimetro()` → `2 * (ancho + alto)`
- `boolean esCuadrado()` → `true` si `ancho == alto`

Crea un rectángulo de 4 x 4 y otro de 5 x 8 y prueba los tres métodos en ambos.

**Pista:** los tres métodos devuelven valores con `return`. `esCuadrado()` devuelve el resultado de una comparación con `==`.

---

## ⭐ Ejercicio 3: La cuenta bancaria blindada

Escribe una clase `CuentaBancaria` con los atributos `String titular` y `double saldo`. Añade:
- `void ingresar(double cantidad)` → suma a saldo.
- `void retirar(double cantidad)` → resta a saldo **solo si** `cantidad <= saldo`; si no, imprime `"Saldo insuficiente"`.
- `void mostrar()` → imprime `"Titular: X | Saldo: Y €"`.

Crea una cuenta con 100 €, retira 30 €, intenta retirar 200 € y muestra el saldo final.

**Pista:** dentro de `retirar`, un `if (cantidad <= this.saldo)` protege el saldo de quedarse en negativo. Ese `if` es la diferencia entre una cuenta y un agujero.

---

## ⭐⭐ Ejercicio 4: La hora que se corrige sola

Escribe una clase `Hora` con los atributos `int hora`, `int minuto` y `int segundo`. El constructor debe validar: si los valores no son válidos (hora entre 0 y 23, minuto y segundo entre 0 y 59), se inicializan a 0. Añade el método `void incrementarSegundo()` que suma 1 segundo gestionando los acarreos: si llega a 60 segundos pasa a 0 y suma un minuto, y así con los minutos y las horas.

Crea una `Hora(23, 59, 59)`, llama a `incrementarSegundo()` y muestra `00:00:00`.

**Pista:** la validación es un `if` grande en el constructor. El acarreo son tres `if` encadenados, de segundo a minuto a hora. Para mostrar con dos dígitos, imprime `"0" + valor` si es menor que 10.

---

## ⭐⭐ Ejercicio 5: ¿Qué imprime? — el baile de referencias

Sin ejecutar, escribe la salida exacta:

```java
public class Baile {
    public static void main(String[] args) {
        Punto a = new Punto(3, 4);
        Punto b = a;
        b.x = 10;
        System.out.println("a.x = " + a.x);

        Punto c = new Punto(1, 1);
        cambiar(c);
        System.out.println("c.x = " + c.x);
    }

    static void cambiar(Punto p) {
        p.x = 99;
        p = new Punto(50, 50);
    }
}

class Punto {
    int x;
    int y;

    public Punto(int x, int y) {
        this.x = x;
        this.y = y;
    }
}
```

**Pista:** `b = a` no copia el objeto: copia la referencia. Cuando `cambiar(c)` recibe `c`, el parámetro `p` es una *copia* de la referencia, así que modificar `p.x` sí se nota, pero `p = new Punto(...)` solo reasigna el parámetro local.

---

## ⭐⭐ Ejercicio 6: El correo que se encadena

Escribe una clase `Email` con los atributos `String remitente`, `String destinatario` y `String asunto`. Crea **tres constructores sobrecargados**:
- `Email(String remitente, String destinatario, String asunto)` → el completo.
- `Email(String remitente, String destinatario)` → asunto por defecto `"(sin asunto)"`.
- `Email(String remitente)` → destinatario `"(sin destino)"` y asunto `"(sin asunto)"`.

Usa `this(...)` para encadenar y evitar repetir código. Añade `void mostrar()` que imprima los tres datos.

**Pista:** el constructor de un parámetro llama al de dos, y el de dos llama al de tres. Con `this(...)` escribes la asignación completa una sola vez, en el constructor de tres parámetros.

---

## ⭐⭐ Ejercicio 7: La fracción que se simplifica

Escribe una clase `Fraccion` con los atributos `int numerador` y `int denominador`. Añade:
- Constructor que valide: si `denominador == 0`, se usa `1`.
- `Fraccion sumar(Fraccion otra)` → devuelve una nueva fracción con `(a.num * b.den + b.num * a.den) / (a.den * b.den)`.
- `void simplificar()` → divide numerador y denominador por su máximo común divisor (MCD).

Crea `1/2` y `1/3`, súmalas y simplifica el resultado.

**Pista:** para el MCD usa el algoritmo de Euclides (restas o módulos) o `Math.abs` con un bucle. `simplificar()` no devuelve nada: modifica `this`.

---

## ⭐⭐⭐ Ejercicio 8: CodeWars — Building blocks

Resuelve la kata **"Building blocks"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/55b75fcf67e558d3750000a3).

Crea la clase `Block` con un constructor que reciba las tres dimensiones (como `int[]` de 3 o como 3 enteros) y los métodos:
- `int getWidth()`, `int getLength()`, `int getHeight()`
- `int getVolume()` → `width * length * height`
- `int getSurfaceArea()` → `2 * (w*l + w*h + l*h)`

**Pista:** guarda las tres dimensiones en atributos con `this` y deja que los getters simplemente las devuelvan. La superficie es la suma de las caras por dos.

---

## ⭐⭐⭐ Ejercicio 9: CodeWars — Object Oriented Piracy

Resuelve la kata **"Object Oriented Piracy"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/54fe05c4762e2e3047000add).

Crea la clase `Ship` que recibe un `draft` (calado en unidades) y un `crew` (tripulantes). Implementa:
- `getDraft()` y `getCrew()` → los getters de siempre.
- `isWorthIt()` → devuelve `true` si el barco merece la pena saquearlo: el calado total menos `1.5` por cada tripulante debe superar 20.

```java
Ship titanic = new Ship(15, 10);
titanic.isWorthIt(); // false: 15 - 1.5*10 = 0, no merece la pena
```

**Pista:** un getter devuelve el atributo tal cual; `isWorthIt()` combina ambos: `return draft - 1.5 * crew > 20;`. El `1.5` es una constante con nombre, mejor que un número suelto.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 148 — Nochevieja | Fácil |
| CodeWars | Object Oriented Piracy (8 kyu) | Principiante |
| CodeWars | Building blocks (7 kyu) | Aficionado |
| CodeWars | FIXME: Get Full Name (7 kyu) | Aficionado |
