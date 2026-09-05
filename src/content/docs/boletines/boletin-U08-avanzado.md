---
title: Boletín U08 — Avanzado
description: Ejercicios de dificultad progresiva para exprimir la unidad
---

# 📝 Boletín U08 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: empleado con validación

Escribe una clase `Empleado` con:

- Atributos `private String nombre`, `private double salario`.
- Constructor que valide que el salario no sea negativo (si lo es, lo deja en 0 y muestra un aviso).
- Getters y setters. El setter de salario también debe rechazar negativos.

En un `main`, crea un empleado "Laura" con salario 1500, intenta ponerle -300 y muestra el salario final.

**Pista:** reutiliza la validación del setter dentro del constructor: `setSalario(salario)` en vez de asignar a pelo.

---

## ⭐ Ejercicio 2: Círculo encapsulado

Escribe una clase `Circulo` con:

- Atributo `private double radio`.
- Constructor que reciba el radio.
- Getter `getRadio()`, setter `setRadio(double)` que rechace radios negativos o cero.
- Métodos `getArea()` y `getPerimetro()` que usen `Math.PI`.

En un `main`, crea un círculo de radio 5 y muestra su área y perímetro.

**Pista:** `area = Math.PI * radio * radio;` y `perimetro = 2 * Math.PI * radio;`. Recuerda que `Math.PI` es una constante estática.

---

## ⭐⭐ Ejercicio 3: JavaBean Alumno

Escribe una clase `Alumno` siguiendo el estilo JavaBean (el estándar para clases de datos):

- Atributos `private String nombre`, `private int edad`, `private double notaMedia`.
- Constructor sin parámetros y constructor con los tres valores.
- Getter y setter para **cada** atributo.
- El setter de `edad` debe rechazar edades fuera de 0 y 120; el de `notaMedia`, fuera de 0 y 10.

En un `main`, crea un alumno con el constructor completo y luego modifica su nota con el setter.

**Pista:** un JavaBean es "atributos privados + getters/setters + constructores": el patrón que verás en cualquier framework. Los setters validan; los getters solo leen.

---

## ⭐⭐ Ejercicio 4: hora inmutable

Escribe una clase `Hora` que represente una hora del día y que sea **inmutable**: sus atributos solo se asignan en el constructor y no tienen setters.

- Atributos `private final int hora`, `private final int minuto`.
- Constructor que valide `hora` entre 0 y 23 y `minuto` entre 0 y 59.
- Getters `getHora()` y `getMinuto()`.
- Método `mostrar()` que devuelva `"HH:MM"` (con ceros: `09:05`).

En un `main`, crea una hora 9:05 y muéstrala. Responde: ¿por qué no necesita setters?

**Pista:** usa `String.format("%02d:%02d", hora, minuto)` o `"0" + ...` cuando el valor sea menor que 10.

---

## ⭐⭐ Ejercicio 5: ¿Qué imprime? — el puzle de los gatos

Sin ejecutar, escribe la salida exacta:

```java
public class Gato {
    public static int totalGatos = 0;
    private String nombre;
    private int vidas;

    public Gato(String nombre) {
        this.nombre = nombre;
        this.vidas = 9;
        totalGatos++;
    }

    public void perderVida() {
        if (vidas > 0) {
            vidas--;
        }
    }

    public String toString() {
        return nombre + " (" + vidas + " vidas)";
    }
}
```

```java
public class PuzleGatos {
    public static void main(String[] args) {
        Gato g1 = new Gato("Bigotes");
        Gato g2 = new Gato("Garfield");
        g1.perderVida();
        g1.perderVida();
        g2.perderVida();

        System.out.println(g1);
        System.out.println(g2);
        System.out.println("Total: " + Gato.totalGatos);
    }
}
```

**Pista:** cada gato nace con 9 vidas y las pierde una a una con `perderVida()`. Cuenta cuántas veces se llama sobre cada gato, y recuerda que `totalGatos` es `static`.

---

## ⭐⭐ Ejercicio 6: contador de usuarios

Escribe una clase `Usuario` que asigne a cada objeto un `id` **único y automático**:

- Atributo `private static int contador = 0;` y `private int id;`.
- Constructor que incremente `contador` y asigne `id = contador`.
- Método `public static int getTotalUsuarios()`.
- Getter `getId()`.

En un `main`, crea 5 usuarios y muestra el id del último y el total de usuarios.

**Pista:** el patrón del punto 5: el `static` cuenta cuántos se han creado, y cada objeto se "congela" su número al nacer. `getTotalUsuarios` es estático porque pregunta a la clase, no a un objeto.

---

## ⭐⭐⭐ Ejercicio 7: La clase utilitaria OperacionesArray

Escribe una clase `OperacionesArray` **utilitaria** (constructor privado) con estos métodos `static`:

- `suma(int[] numeros)` → suma todos los elementos.
- `media(double[] numeros)` → devuelve el promedio.
- `maximo(int[] numeros)` → devuelve el mayor.
- `estaOrdenado(int[] numeros)` → `true` si cada elemento es mayor o igual que el anterior.

En un `main`, usa la clase **sin crear ningún objeto** sobre `{3, 1, 4, 1, 5}` y `{1, 2, 3}`.

**Pista:** el constructor `private OperacionesArray() {}` impide instanciarla, como `Math`. Para `estaOrdenado`, recorre con un `for` y compara cada elemento con el anterior (`numeros[i] < numeros[i - 1]` → no está ordenado).

---

## ⭐⭐⭐ Ejercicio 8: validador de datos

Escribe una clase `Validador` **utilitaria** (constructor privado) con estos métodos `static`:

- `esEmailValido(String email)` → `true` si contiene exactamente una `@` y al menos un `.` después de la `@`.
- `esEdadValida(int edad)` → `true` si está entre 0 y 120.
- `esTextoNoVacio(String texto)` → `true` si no es `null` y no está en blanco.

En un `main`, prueba los tres métodos con casos válidos e inválidos (por ejemplo `"ana@mail.com"`, `"ana@"`, `"hola"`, `-5`, `200`, `null`).

**Pista:** usa `String.indexOf("@")` para localizar la `@`, `indexOf("@", pos + 1)` para comprobar que no hay una segunda, y `indexOf(".", pos)` para el punto después de la `@`. Un `return` temprano en cada condición fallida simplifica mucho.

---

## ⭐⭐⭐ Ejercicio 9: El gran reto — refactoriza el banco

Este código funciona... pero es una puerta abierta. Refactorízalo siguiendo los pasos del punto 8 (Be the Code):

```java
public class CuentaBancaria {
    public String titular;
    public double saldo;

    public CuentaBancaria(String titular, double saldo) {
        titular = titular;
        saldo = saldo;
    }

    public void retirar(double cantidad) {
        saldo = saldo - cantidad;
    }

    public void ingresar(double cantidad) {
        saldo = saldo + cantidad;
    }
}
```

Debe quedar así:

1. Atributos `private`.
2. Constructor con `this` y que valide que el saldo inicial no sea negativo.
3. Getters para ambos; **sin setters** para el saldo.
4. `retirar(double)` que rechace cantidades negativas y que **no permita** dejar el saldo en negativo (si `cantidad > saldo`, avisa y no retira).
5. `ingresar(double)` que rechace cantidades negativas.
6. Una constante `public static final String NOMBRE_BANCO = "Banco DAM";`.

Escribe también un `main` de prueba que cree una cuenta, ingrese, intente retirar más de lo que tiene y muestre el saldo.

**Pista:** sin setter para el saldo, solo las operaciones `retirar` e `ingresar` pueden tocarlo: es la frontera del negocio. Recuerda el bug del constructor (`titular = titular` se asigna a sí mismo) y valida todo antes de asignar.