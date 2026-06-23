---
title: "Boletín 6 - Intermedio: POO: Clases y Objetos"
nav_order: 6
---
Ejercicios de dificultad progresiva. Los ⭐ son para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. De crear tu primera clase a construir objetos que harían llorar de envidia a tu profesor de FP Básica.

---

## ⭐ Ejercicio 1: Clase Libro

Crea una clase `Libro` con:
- Atributos privados: `String titulo`, `String autor`, `int paginas`
- Constructor que reciba los tres parámetros
- Getters para todos los atributos
- Método `toString()` que devuelva `"El libro '[título]' de [autor] tiene [páginas] páginas."`

```java
public class Libro {
    // atributos
    // constructor
    // getters
    // toString()
}
```

En el `main`, crea tres libros y muéstralos.

---

## ⭐ Ejercicio 2: Clase Termómetro

Crea una clase `Termometro` que almacene la temperatura en grados Celsius (privado). Debe tener:
- Constructor que reciba los Celsius iniciales
- Getter `getCelsius()`
- Método `getFahrenheit()` que devuelva la temperatura en Fahrenheit: `°F = °C * 9/5 + 32`
- Método `getKelvin()` que devuelva la temperatura en Kelvin: `K = °C + 273.15`
- Setter `setCelsius(double celsius)` que valide que la temperatura no sea menor que -273.15 (cero absoluto)

```java
public class Termometro {
    private double celsius;

    public Termometro(double celsius) {
        // validar y asignar
    }

    public double getCelsius() { return celsius; }
    public void setCelsius(double celsius) {
        // si es menor que -273.15, imprimir error, si no, asignar
    }
    public double getFahrenheit() {
        // calcular y devolver
    }
    public double getKelvin() {
        // calcular y devolver
    }
}
```

Ejemplo: `new Termometro(25)` → `getFahrenheit()` → 77.0, `getKelvin()` → 298.15.

---

## ⭐⭐ Ejercicio 3: Clase Fecha con validación

Crea una clase `Fecha` con `dia`, `mes`, `anio` (int, privados). El constructor debe validar que la fecha sea válida: días correctos por mes, teniendo en cuenta años bisiestos.

Además:
- Método `String toString()` que devuelva "DD/MM/AAAA"
- Método `boolean esBisiesto()` que indique si el año es bisiesto (divisible entre 4 pero no entre 100, salvo que sea divisible entre 400)
- Método `int diasDesde(Fecha otra)` que calcule los días transcurridos desde otra fecha anterior

```java
public class Fecha {
    private int dia, mes, anio;

    public Fecha(int dia, int mes, int anio) {
        // validar: si la fecha no es válida, lanzar IllegalArgumentException
    }

    public boolean esBisiesto() {
        // (anio % 4 == 0 && anio % 100 != 0) || anio % 400 == 0
    }

    public int diasEnMes(int mes, int anio) {
        // devuelve los días de un mes dado (considerando bisiesto para febrero)
    }

    public int diasDesde(Fecha otra) {
        // Días entre dos fechas (puedes convertir ambas a días totales)
    }
}
```

**Pista:** Para `diasDesde()`, convierte ambas fechas a un número de días desde una fecha fija (ej: 1/1/1). La diferencia es la resta.

---

## ⭐⭐ Ejercicio 4: Clase Reloj con adelanto

Crea una clase `Reloj` con `hora` (0-23), `minuto` (0-59), `segundo` (0-59), todos privados. Constructor con validación. Métodos:

- `void adelantar(int segundos)`: adelanta el reloj la cantidad de segundos indicada, manejando desbordamientos correctamente (segundo → minuto → hora → día siguiente)
- `String toString()`: formato "HH:MM:SS" (con dos dígitos cada uno)
- `int diferenciaSegundos(Reloj otro)`: devuelve los segundos de diferencia entre este reloj y otro

```java
public class Reloj {
    private int hora, minuto, segundo;

    public Reloj(int hora, int minuto, int segundo) {
        // validar rangos
    }

    public void adelantar(int segundos) {
        // suma segundos, maneja desbordamientos
    }

    public String toString() {
        // formato HH:MM:SS
    }
}
```

Ejemplo: Si el reloj marca 23:59:50 y adelantamos 15 segundos, debe pasar a 00:00:05.

---

## ⭐⭐⭐ Ejercicio 5: Clase Matriz 2D

Crea una clase `Matriz` que represente una matriz bidimensional de enteros. Debe tener:

- Constructor que reciba `filas` y `columnas` (inicializa con ceros)
- Constructor que reciba un `int[][]` existente
- `int get(int fila, int col)` y `void set(int fila, int col, int valor)`
- `Matriz sumar(Matriz otra)`: devuelve una NUEVA matriz con la suma de matrices (deben tener las mismas dimensiones)
- `Matriz restar(Matriz otra)`: igual pero restando
- `Matriz multiplicar(Matriz otra)`: multiplicación de matrices (columnas de esta deben coincidir con filas de otra)
- `String toString()`: representación bonita de la matriz

```java
public class Matriz {
    private int[][] datos;
    private int filas, columnas;

    // constructores, getters, setters
    // sumar, restar, multiplicar
    // toString()
}
```

Ejemplo:
```java
Matriz a = new Matriz(new int[][]{{1,2},{3,4}});
Matriz b = new Matriz(new int[][]{{5,6},{7,8}});
Matriz c = a.sumar(b); // [[6,8],[10,12]]
```

---

## ⭐⭐⭐ Ejercicio 6: CodeWars — Build Tower

Resuelve la kata **"Build Tower"** (6 kyu) en CodeWars.

Crea una clase `TowerBuilder` con un método estático `build(int nFloors)` que devuelva un array de Strings representando una torre con `nFloors` pisos hecha de asteriscos `*`.

Cada piso tiene un número impar de asteriscos centrados con espacios. Ejemplo para `nFloors = 3`:

```java
[
  "  *  ",
  " *** ",
  "*****"
]
```

> **Pista:** El piso `i` (empezando desde 0) tiene `2*i + 1` asteriscos. El ancho total es `2*nFloors - 1`. Los espacios alrededor son `(ancho - asteriscos) / 2`. Usa `String.repeat()` o un bucle.

---

## ⭐⭐⭐ Ejercicio 7: AceptaElReto — 246 Buscando el pin

Resuelve el problema **246 — Buscando el pin** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=246).

El problema trata de un pinball donde hay que encontrar el camino que la bola puede seguir desde la entrada hasta la salida. Esencialmente es un problema de búsqueda en un grafo (DFS/BFS) pero modelado con objetos.

> **Pista:** Modela el tablero como una cuadrícula de casillas. Cada casilla puede ser un objeto con propiedades (pared, hueco, direction). Usa una cola (BFS) para encontrar el camino más corto.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| CodeWars | Build Tower | 6 kyu |
| CodeWars | Persistent Bugger | 6 kyu |
| AceptaElReto | 246 — Buscando el pin | Medio |
| AceptaElReto | 367 — Ascensores | Medio |
