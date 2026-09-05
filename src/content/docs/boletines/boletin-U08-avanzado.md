---
title: Boletín U08 — Avanzado
description: Ejercicios de dificultad progresiva para exprimir la unidad
---

# 📝 Boletín U08 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. La herencia es como la familia: a veces heredas cosas buenas, a veces te toca la colección de sellos de tu tío abuelo. Pero con interfaces, al menos eliges qué implementar.

---

## ⭐ Ejercicio 1: Interfaz FiguraGeometrica

Crea una interfaz `FiguraGeometrica` con dos métodos:

- `double calcularArea()`
- `double calcularPerimetro()`

Implementa la interfaz en:

- `Circulo` (constructor con radio)
- `Rectangulo` (constructor con ancho y alto)
- `TrianguloRectangulo` (constructor con base y altura)

En el `main`, crea un `ArrayList<FiguraGeometrica>`, añade un círculo de radio 5, un rectángulo 4x3 y un triángulo rectángulo 3x4. Recórrelos imprimiendo área y perímetro de cada uno.

```java
public interface FiguraGeometrica {
    double calcularArea();
    double calcularPerimetro();
}
```

**Pista:** para el triángulo rectángulo, `area = base * altura / 2` y el perímetro es `base + altura + hipotenusa`, con `hipotenusa = Math.sqrt(base*base + altura*altura)`.

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

En el `main`, crea un array de `Empleado` con un gerente y un vendedor, recórrelo polimórficamente y muestra el salario de cada uno.

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
```

**Pista:** declara `nombre` y `salarioBase` como `protected` para que las subclases los usen sin getters. El `@Override` de `calcularSalario()` en cada subclase es el corazón del polimorfismo.

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

**Pista:** cada clase decide su propia lógica de aprobación; solo el contrato `procesarPago` es común. Para la transferencia, comprueba que `cantidad + 1 <= saldo`.

---

## ⭐⭐ Ejercicio 4: Interfaces múltiples: Volador y Nadador

Crea dos interfaces:

- `Volador`: método `void volar()`
- `Nadador`: método `void nadar()`

Crea una clase `Pato` que implemente ambas interfaces, una clase `Avion` que solo implemente `Volador` y una clase `Pez` que solo implemente `Nadador`.

En el `main`, crea un `ArrayList<Volador>` con un `Pato` y un `Avion`, y recórrelo llamando a `volar()`. Luego haz lo mismo con un `ArrayList<Nadador>`.

```java
public interface Volador { void volar(); }
public interface Nadador { void nadar(); }
```

**Pista:** el `Pato` es la estrella: una sola clase que firma dos contratos. Los `ArrayList` de tipo interfaz aceptan cualquier clase que implemente ese contrato.

---

## ⭐⭐ Ejercicio 5: Downcasting seguro

Crea una jerarquía `Empleado` → `Programador`, `Diseñador`:

- `Programador` tiene `void escribirCodigo()`.
- `Diseñador` tiene `void disenar()`.
- `Empleado` tiene `String nombre` y `void mostrarInfo()`.

En el `main`, crea un `ArrayList<Empleado>` con varios empleados de ambos tipos y recórrelo usando `instanceof` para llamar a los métodos específicos.

**Pista:** dentro del bucle, `if (e instanceof Programador)` → `((Programador) e).escribirCodigo();`. Siempre con `instanceof` antes del cast: nunca bajes sin preguntar.

---

## ⭐⭐ Ejercicio 6: Calculadora de figuras con clase abstracta

Crea una clase abstracta `Figura` con:

- Atributo `protected String color`.
- Constructor que reciba el color.
- Métodos abstractos `double calcularArea()` y `double calcularPerimetro()`.
- Método concreto `void mostrarColor()` que imprima el color.

Implementa `Circulo` (radio) y `Rectangulo` (ancho, alto). En el `main`, crea un `ArrayList<Figura>` con un círculo rojo de radio 3 y un rectángulo azul de 4x2, y muestra el área de cada uno y su color.

**Pista:** el área total de la lista se calcula recorriéndola con `for (Figura f : figuras)`. `mostrarColor()` ya está hecho: las subclases solo implementan los dos métodos abstractos.

---

## ⭐⭐⭐ Ejercicio 7: Sistema de notificaciones polimórfico

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

En el `main`, crea un `ArrayList<Notificable>` con los tres tipos. Añade un método estático que recorra la lista y envíe todas las notificaciones:

```java
public static void enviarTodas(List<Notificable> notificaciones, String mensaje) {
    for (Notificable n : notificaciones) {
        n.enviar(mensaje);
    }
}
```

**Pista:** los tres tipos comparten el patrón: al enviar, ponen `enviado = true` y devuelven "Enviado"; si no, "Pendiente". El polimorfismo hace que `enviarTodas` no sepa con qué tipo trata.

---

## ⭐⭐⭐ Ejercicio 8: Template method — las bebidas

Crea una clase abstracta `Bebida` con el patrón template method:

```java
public abstract class Bebida {
    public final void preparar() {
        hervirAgua();
        prepararIngrediente();
        servirEnTaza();
        anadirExtras();
    }

    private void hervirAgua() { System.out.println("Hirviendo agua..."); }
    private void servirEnTaza() { System.out.println("Sirviendo en taza..."); }

    protected abstract void prepararIngrediente();
    protected abstract void anadirExtras();
}
```

Implementa `Te` (bolsita de té + limón) y `Cafe` (café molido + azúcar). En el `main`, prepara un `Te` y un `Cafe` con una variable de tipo `Bebida`.

**Pista:** las subclases solo rellenan los dos métodos `protected abstract`. El `final` en `preparar()` garantiza que nadie reordene los pasos. Para probar ambas, usa una referencia polimórfica: `Bebida b = new Te(); b.preparar();`.

---

## ⭐⭐⭐ Ejercicio 9: El gran reto — vehículos con combustible

Crea una jerarquía de vehículos:

- `Vehiculo` (abstracta): `String matricula`, `int combustible`, `abstract boolean mover()`
- `Coche`: gasta 5 de combustible por movimiento
- `Moto`: gasta 3 de combustible por movimiento
- `Camion`: gasta 10 de combustible por movimiento, pero puede llevar `int carga`

Cada vehículo tiene un `mover()` que reduce el combustible y devuelve `true` si pudo moverse. Si no hay suficiente, imprime "Sin combustible" y devuelve `false`.

En `main()`, crea un `ArrayList<Vehiculo>` con varios vehículos. Cada vehículo se mueve repetidamente mientras pueda y cuenta cuántos movimientos hizo.

**Pista:** da a cada subclase una constante `private static final int GASTO` con lo que consume por movimiento. En `mover()`: `if (combustible >= GASTO) { combustible -= GASTO; ...; return true; } else { System.out.println("Sin combustible"); return false; }`. El bucle del `main` usa el valor de retorno: `while (v.mover()) { movimientos++; }`. Así nunca se queda en un bucle infinito cuando el combustible no llega para moverse.