---
title: "Boletín 6 - Intermedio: Herencia, Polimorfismo e Interfaces"
nav_order: 6
---
Ejercicios de dificultad progresiva. Los ⭐ son para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. La herencia es como la familia: a veces heredas cosas buenas, a veces te toca la colección de sellos de tu tío abuelo. Pero con interfaces, al menos eliges qué implementar.

---

## ⭐ Ejercicio 1: Interfaz FiguraGeometrica

Crea una interfaz `FiguraGeometrica` con dos métodos:
- `double calcularArea()`
- `double calcularPerimetro()`

Implementa la interfaz en:
- `Circulo` (constructor con radio)
- `Rectangulo` (constructor con ancho y alto)
- `TrianguloRectangulo` (constructor con base y altura)

```java
public interface FiguraGeometrica {
    double calcularArea();
    double calcularPerimetro();
}

public class Circulo implements FiguraGeometrica {
    private double radio;

    public Circulo(double radio) {
        this.radio = radio;
    }

    @Override
    public double calcularArea() {
        return Math.PI * radio * radio;
    }

    @Override
    public double calcularPerimetro() {
        return 2 * Math.PI * radio;
    }
}

// Implementa Rectangulo y TrianguloRectangulo
```

En el `main`, crea un `ArrayList<FiguraGeometrica>`, añade un círculo de radio 5, un rectángulo 4x3 y un triángulo rectángulo 3x4. Recórrelos imprimiendo área y perímetro de cada uno.

---

## ⭐ Ejercicio 2: Jerarquía de Empleados

Crea una clase base `Empleado` con:
- `String nombre`
- `double salarioBase`
- Constructor, getters
- Método `double calcularSalario()` que devuelva el `salarioBase`

Crea dos subclases:
- `Gerente`: tiene un `double bono` extra. `calcularSalario()` devuelve `salarioBase + bono`.
- `Vendedor`: tiene un `double comision` por venta y un `int ventasRealizadas`. `calcularSalario()` devuelve `salarioBase + comision * ventasRealizadas`.

```java
public class Empleado {
    protected String nombre;
    protected double salarioBase;

    public Empleado(String nombre, double salarioBase) {
        this.nombre = nombre;
        this.salarioBase = salarioBase;
    }

    public double calcularSalario() {
        return salarioBase;
    }
}

public class Gerente extends Empleado {
    private double bono;
    // constructor y override de calcularSalario()
}

public class Vendedor extends Empleado {
    private double comision;
    private int ventasRealizadas;
    // constructor y override de calcularSalario()
}
```

En el `main`, crea un array de `Empleado` con un gerente y un vendedor, recórrelo polimórficamente y muestra el salario de cada uno.

---

## ⭐⭐ Ejercicio 3: Sistema de pagos con interfaz

Crea una interfaz `Pagable` con el método:
- `boolean procesarPago(double cantidad)`

Implementa la interfaz en:
- `TarjetaCredito`: tiene `double limite` y `double saldoUsado`. Puede pagar si `cantidad + saldoUsado <= limite`.
- `PayPal`: tiene `double saldo`. Puede pagar si `cantidad <= saldo`.
- `TransferenciaBancaria`: tiene `double saldo`. Puede pagar siempre que `cantidad <= saldo`, pero tiene un coste fijo de 1 € por transferencia.

```java
public interface Pagable {
    boolean procesarPago(double cantidad);
}
```

Ejemplo:
```java
Pagable tarjeta = new TarjetaCredito(1000, 0);
tarjeta.procesarPago(500);   // true
tarjeta.procesarPago(600);   // false (supera el límite)
```

---

## ⭐⭐ Ejercicio 4: Interfaces múltiples: Volador y Nadador

Crea dos interfaces:
- `Volador`: método `void volar()`
- `Nadador`: método `void nadar()`

Crea una clase `Pato` que implemente ambas interfaces, más una clase `Avion` que solo implemente `Volador` y una clase `Pez` que solo implemente `Nadador`.

```java
public interface Volador {
    void volar();
}

public interface Nadador {
    void nadar();
}

public class Pato implements Volador, Nadador {
    @Override
    public void volar() {
        System.out.println("El pato vuela en formación en V");
    }

    @Override
    public void nadar() {
        System.out.println("El pato nada tranquilamente en el estanque");
    }
}
```

En el `main`, crea un `ArrayList<Volador>` con un `Pato` y un `Avion`, y recórrelo llamando a `volar()`. Luego haz lo mismo con un `ArrayList<Nadador>`.

---

## ⭐⭐⭐ Ejercicio 5: Sistema de notificaciones polimórfico

Crea una interfaz `Notificable` con:
- `void enviar(String mensaje)`
- `String getEstado()`

Implementa:
- `EmailNotificacion`: atributos `String direccion`, `boolean enviado`. Al enviar, imprime "Enviando email a [dirección]: [mensaje]". Estado: "Enviado" o "Pendiente".
- `SMSNotificacion`: atributos `String telefono`, `boolean enviado`. Al enviar, imprime "Enviando SMS a [teléfono]: [mensaje]". Estado similar.
- `PushNotificacion`: atributos `String dispositivoId`, `boolean enviado`. Al enviar, imprime "Enviando push a [dispositivoId]: [mensaje]".

```java
public interface Notificable {
    void enviar(String mensaje);
    String getEstado();
}
```

En el `main`, crea un `ArrayList<Notificable>` con los tres tipos. Añade también un método estático que recorra la lista y envíe todas las notificaciones:

```java
public static void enviarTodas(List<Notificable> notificaciones, String mensaje) {
    for (Notificable n : notificaciones) {
        n.enviar(mensaje);
    }
}
```

---

## ⭐⭐⭐ Ejercicio 6: CodeWars — Is this a triangle?

Resuelve la kata **"Is this a triangle?"** (7 kyu) en CodeWars.

Implementa una clase `Triangle` con un método estático `isTriangle(int a, int b, int c)` que devuelva `true` si con las tres longitudes se puede formar un triángulo (la suma de dos lados siempre es mayor que el tercero).

```java
public class TriangleValidator {
    public static boolean isTriangle(int a, int b, int c) {
        // tu código aquí
    }
}
```

Ejemplo: `isTriangle(3, 4, 5)` → true, `isTriangle(1, 2, 3)` → false (1+2 no es mayor que 3).

> **Pista:** Un triángulo existe si `a + b > c && a + c > b && b + c > a`. Es decir, la suma de dos lados siempre es mayor que el lado restante. Esta kata es de lógica pura, pero puedes aprovechar para practicar herencia creando una jerarquía de figuras si quieres ir más allá.

---

## ⭐⭐⭐ Ejercicio 7: AceptaElReto — 154 El ascensor

Resuelve el problema **154 — El ascensor** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=154).

El problema modela un ascensor que recorre varias plantas. Dada una secuencia de plantas a las que va, calcula cuántas veces cambia de dirección (sube → baja o baja → sube). El ascensor empieza en la planta 0.

Ejemplo: Plantas: 3, 5, 2, 7, 9, 1 → Direcciones: sube(3), sube(5), baja(2), sube(7), sube(9), baja(1) → Cambios: 3 (cuando baja a 2, cuando sube a 7, cuando baja a 1).

> **Pista:** Lee la secuencia de plantas y lleva la cuenta de la dirección anterior. Cuando la dirección cambie, incrementa el contador. Si el ascensor se queda en la misma planta, no hay cambio de dirección. Piensa en cómo modelarías esto con objetos: una clase `Ascensor` con método `moverA(int planta)`.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| CodeWars | Is this a triangle? | 7 kyu |
| CodeWars | Thinkful - Logic Drills: Traffic light | 7 kyu |
| AceptaElReto | 154 — El ascensor | Medio |
| AceptaElReto | 369 — Navegación en Google Maps | Difícil |
