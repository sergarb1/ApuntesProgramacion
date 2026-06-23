---
title: "Boletín 5 - Intermedio: Visibilidad, Encapsulación y Static"
nav_order: 15
---
Ejercicios de dificultad progresiva. Los ⭐ son para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. La encapsulación no es un hechizo de Harry Potter, es sentido común. Pero para estos ejercicios, igual necesitas un hechizo o dos.

---

## ⭐ Ejercicio 1: Clase CuentaAhorros encapsulada

Crea una clase `CuentaAhorros` con:
- Atributo privado `double saldo`
- Atributo privado `double interesAnual` (porcentaje, ej: 2.5 significa 2.5%)
- Constructor que reciba el saldo inicial y el interés anual. Si el saldo es negativo, se establece a 0.
- Getter para `saldo`
- Método `void aplicarInteres()` que aumente el saldo según el interés anual (saldo += saldo * interesAnual / 100)
- Método `boolean retirar(double cantidad)` que solo permita retirar si hay saldo suficiente

```java
public class CuentaAhorros {
    private double saldo;
    private double interesAnual;

    public CuentaAhorros(double saldoInicial, double interesAnual) {
        // validar e inicializar
    }

    public void aplicarInteres() {
        // saldo += saldo * interesAnual / 100
    }

    public boolean retirar(double cantidad) {
        // solo si cantidad > 0 y cantidad <= saldo
    }

    public double getSaldo() {
        return saldo;
    }
}
```

Ejemplo: `new CuentaAhorros(1000, 10).aplicarInteres()` → saldo = 1100.

---

## ⭐ Ejercicio 2: Clase Persona con validación estricta

Crea una clase `Persona` con atributos privados `String nombre` y `int edad`. El constructor y los setters deben validar que:
- `nombre` no sea null ni esté vacío (ni solo espacios)
- `edad` esté entre 0 y 120 (inclusive)

Si alguna validación falla, lanza `IllegalArgumentException` con un mensaje descriptivo.

```java
public class Persona {
    private String nombre;
    private int edad;

    public Persona(String nombre, int edad) {
        setNombre(nombre);  // ¡Usa el setter para aprovechar la validación!
        setEdad(edad);
    }

    public void setNombre(String nombre) {
        // validar y asignar
    }

    public void setEdad(int edad) {
        // validar y asignar
    }
}
```

¿Qué crees que pasa si haces `new Persona("", 25)`? ¿Y `new Persona("Ana", -5)`?

---

## ⭐⭐ Ejercicio 3: Clase TicketCompra con ID autoincremental

Crea una clase `TicketCompra` que modele un ticket de supermercado:

- Atributo estático `private static int contadorTickets = 0`
- Atributo de instancia `private int id` (autoincremental: al crear un ticket, recibe el valor actual de contadorTickets y luego se incrementa)
- Atributo `private String[] productos` y `private double[] precios`
- Constructor que reciba los arrays de productos y precios
- Método `double calcularTotal()` que sume todos los precios
- Método `double calcularIVA()` que calcule el 21% del total
- Método `String toString()` que muestre el ticket formateado

```java
public class TicketCompra {
    private static int contadorTickets = 0;
    private int id;
    private String[] productos;
    private double[] precios;

    public TicketCompra(String[] productos, double[] precios) {
        this.id = ++contadorTickets;  // O: contadorTickets++; this.id = contadorTickets;
        this.productos = productos;
        this.precios = precios;
    }

    public static int getTotalTicketsEmitidos() {
        return contadorTickets;
    }
}
```

Ejemplo:
```java
TicketCompra t1 = new TicketCompra(
    new String[]{"Pan", "Leche", "Huevos"},
    new double[]{1.20, 2.50, 3.00}
);
System.out.println(t1);  // Ticket #1: Pan=1.20€, Leche=2.50€, Huevos=3.00€ | Total: 6.70€ | IVA: 1.41€
```

---

## ⭐⭐ Ejercicio 4: Clase Biblioteca con contador estático

Crea una clase `Biblioteca` que gestione préstamos de libros:

- Atributo estático `private static int totalLibrosPrestados = 0`
- Atributo de instancia `private String nombreBiblioteca`
- Atributo de instancia `private int librosDisponibles`
- Constructor que reciba nombre y cantidad inicial de libros
- Método `boolean prestarLibro()`: si hay libros disponibles, reduce en 1, incrementa el contador estático y devuelve true. Si no, devuelve false.
- Método `void devolverLibro()`: aumenta libros disponibles en 1, decrementa el contador estático (si es > 0).
- Método estático `int getTotalPrestamos()` que devuelva el contador global de préstamos
- Método `int getDisponibles()` que devuelva los libros disponibles en esta biblioteca

```java
public class Biblioteca {
    private static int totalLibrosPrestados = 0;
    private String nombre;
    private int disponibles;

    // constructor, prestarLibro, devolverLibro, getters estáticos y de instancia
}
```

Ejemplo: Si creas dos bibliotecas con 10 libros cada una y prestas 3 de la primera y 2 de la segunda, `Biblioteca.getTotalPrestamos()` debería devolver 5.

---

## ⭐⭐⭐ Ejercicio 5: Clase CalculadoraEstadística utilitaria

Crea una clase `CalculadoraEstadistica` que sea una clase utilitaria (constructor privado, solo métodos estáticos):

- `static double media(double[] datos)`: calcula la media aritmética
- `static double mediana(double[] datos)`: calcula la mediana (ordena y toma el valor central; si es par, media de los dos centrales)
- `static double moda(double[] datos)`: calcula la moda (valor que más se repite; si hay empate, devuelve cualquiera)
- `static double desviacionTipica(double[] datos)`: calcula la desviación típica poblacional

```java
public class CalculadoraEstadistica {
    private CalculadoraEstadistica() {}  // No se puede instanciar

    public static double media(double[] datos) {
        double suma = 0;
        for (double d : datos) suma += d;
        return suma / datos.length;
    }

    // resto de métodos...
}
```

Ejemplo: `media(new double[]{1, 2, 3, 4, 5})` → 3.0. `mediana(new double[]{1, 3, 2, 4, 5})` → 3.0.

---

## ⭐⭐⭐ Ejercicio 6: CodeWars — Find the odd int

Resuelve la kata **"Find the odd int"** (6 kyu) en CodeWars.

Crea una clase utilitaria `FindOdd` con un método estático `findIt(int[] arr)` que recibe un array de enteros y devuelve el entero que aparece un número impar de veces. Siempre habrá exactamente uno.

Ejemplo: `findIt(new int[]{1,1,2,2,3,3,3})` → 3 (aparece 3 veces, que es impar).

> **Pista:** Puedes usar un `Map<Integer, Integer>` para contar frecuencias y luego quedarte con el que tenga frecuencia impar. O, si eres muy listo, usa XOR (`^`): cada número XOR consigo mismo da 0, así que al final solo queda el que no tiene par.

---

## ⭐⭐⭐ Ejercicio 7: AceptaElReto — 120 Número de pares y nones

Resuelve el problema **120 — Número de pares y nones** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=120).

Dado un número entero positivo, cuenta cuántos de sus dígitos son pares y cuántos son impares.

El problema lee números hasta que se introduce un 0.

Ejemplo:
- 12345 → P=2, I=3 (pares: 2,4; impares: 1,3,5)
- 2468 → P=4, I=0
- 7 → P=0, I=1

> **Pista:** Extrae dígitos con `n % 10` y `n / 10`. Comprueba paridad con `digito % 2 == 0`. Es un problema sencillo pero te obliga a pensar en cómo encapsular la lógica en una clase con métodos estáticos.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| CodeWars | Find the odd int | 6 kyu |
| CodeWars | Regex validate PIN code | 7 kyu |
| AceptaElReto | 120 — Número de pares y nones | Fácil |
| AceptaElReto | 157 — ¿Son iguales? | Medio |
