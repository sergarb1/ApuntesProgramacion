---
title: "08 — Be the Code: diseña tu clase"
description: "Cierra la página, abre el editor y diseña una clase completa de principio a fin (o sufre con honor) 🕶️"
---

<p><small>Cierra la página, abre el editor y diseña una clase completa de principio a fin (o sufre con honor) 🕶️</small></p>

> 🗺️ **Estás en:** 🏗️ **U07 · POO: Clases y Objetos** → 08 · Be the Code: diseña tu clase

---

## 📬 La idea en una frase

> **Ya has visto la teoría: ahora toca borrarla de la memoria y construir una clase completa tú solo, paso a paso, porque una clase solo se entiende de verdad cuando te duele diseñarla.**

> 🕶️ **Don Tip:** toda clase se diseña con la misma escalera: (1) elige el nombre y sus atributos, (2) el constructor que los inicializa, (3) los métodos que saben hacer cosas con ellos, (4) un `main` que la pruebe. Si dominas esa escalera, cualquier clase es tuya.

---

## 🚦 Ejercicio guiado: la cuenta bancaria

Cierra esta página. Abre un editor en blanco. No mires ni una línea de lo leído hasta ahora.

El encargo: diseñar una clase `CuentaBancaria` que guarde el titular y el saldo, y que sepa **ingresar** dinero, **retirar** dinero (sin dejar el saldo en negativo) y **mostrarse** por pantalla.

### Paso 1: el nombre y los atributos

¿Qué datos necesita una cuenta bancaria? Mínimo dos: quién la tiene (el **titular**, un `String`) y cuánto dinero hay (el **saldo**, un `double`). Los atributos van dentro de la clase, fuera de cualquier método:

```java
public class CuentaBancaria {
    String titular;
    double saldo;
}
```

> 🧠 **Antes de seguir, respóndete a ti mismo:** ¿el saldo debería ser `int` o `double`? ¿Por qué? (Pista: el dinero tiene céntimos, y los céntimos no son enteros.)

### Paso 2: el constructor

Los atributos no deben nacer sin rumbo. Un constructor que reciba el titular y el saldo inicial y los coloque con `this`:

```java
public CuentaBancaria(String titular, double saldoInicial) {
    this.titular = titular;
    this.saldo = saldoInicial;
}
```

### Paso 3: los métodos

La cuenta necesita tres comportamientos:

- `ingresar(double cantidad)`: suma al saldo. Debería rechazar cantidades negativas (¿quién ingresa -50 €?).
- `retirar(double cantidad)`: resta al saldo, pero **sin dejarlo negativo**. Si no hay saldo suficiente, no retira y avisa.
- `mostrar()`: imprime "Titular: X | Saldo: Y €".

Escribe cada método con su firma y su lógica. Recuerda: los métodos que solo hacen cosas son `void`; si alguno necesitara devolver algo, usaría `return`.

### Paso 4: pruébala con un `main`

Ninguna clase está terminada hasta que no la has visto funcionar. Añade un `main` que cree una cuenta, ingrese, retire (incluso más de lo que hay, para ver la protección) y muestre el resultado.

### La solución completa (inténtalo antes de mirar)

<details>
<summary>🔄 Solución de la cuenta bancaria</summary>

```java
public class CuentaBancaria {
    String titular;
    double saldo;

    public CuentaBancaria(String titular, double saldoInicial) {
        this.titular = titular;
        this.saldo = saldoInicial;
    }

    void ingresar(double cantidad) {
        if (cantidad > 0) {
            saldo += cantidad;
        } else {
            System.out.println("No puedes ingresar " + cantidad + " €. Eso es cosa de magos.");
        }
    }

    void retirar(double cantidad) {
        if (cantidad > saldo) {
            System.out.println("No hay saldo suficiente: solo tienes " + saldo + " €.");
        } else {
            saldo -= cantidad;
        }
    }

    void mostrar() {
        System.out.println("Titular: " + titular + " | Saldo: " + saldo + " €");
    }

    public static void main(String[] args) {
        CuentaBancaria cuenta = new CuentaBancaria("Ana", 100);
        cuenta.ingresar(50);
        cuenta.retirar(200);
        cuenta.retirar(30);
        cuenta.mostrar();
    }
}
```

Salida:

```
No hay saldo suficiente: solo tienes 150 €.
Titular: Ana | Saldo: 120 €
```

Fíjate en los detalles: el `if` del `ingresar` protege contra cantidades negativas, el `if` del `retirar` protege el saldo, y el `main` es la prueba de fuego que demuestra que la clase funciona.

</details>

---

## ⭐ Niveles de logro

- ⭐ **Lo tienes, pero has tenido que mirar la solución una vez.** Aprobado raspado.
- ⭐⭐ **Te ha salido a la primera y funciona.** Eres una máquina.
- ⭐⭐⭐ **Te ha salido a la primera, con los dos `if` de protección y, además, le has añadido un método `double consultarSaldo()` que devuelve el saldo.** No necesitas este curso. Vete a dar una charla TED.

> [!TIP]
> Pista mental gratuita: una clase necesita **cuatro piezas** — atributos, constructor, métodos y una prueba (`main`). Si memorizas esa escalera, cualquier clase que te pidan en el examen se te rinde en cinco minutos.

---

## 🧩 El lío

El departamento de calidad ha recibido esta clase. Algo huele mal. Encuentra los **3 errores**:

```java
public class Coche {
    String marca;
    int velocidad;

    public Coche(String marca) {
        marca = marca;
    }

    void acelerar(int inc) {
        velocidad += inc;
    }

    void mostrar() {
        System.out.println(marca + " a " + velocidad + " km/h");
    }
}
```

> 🕶️ **Don Tip:** ejecútalo con `new Coche("Seat")` y mira qué imprime `mostrar()`. Después revisa el constructor con lupa.

<details>
<summary>🔄 Solución del lío</summary>

1. **El constructor se queda sin inicializar el atributo**: `marca = marca` asigna el parámetro al parámetro (sin `this`, gana el parámetro). El atributo `marca` queda en `null`. Debe ser `this.marca = marca`.
2. **La velocidad nunca se inicializa**: Java la deja en 0 por defecto, pero eso es depender del regalo. Un constructor bien educado pondría `this.velocidad = 0` (o mejor, un constructor que la reciba).
3. **El `main` no existe**: la clase no tiene ninguna prueba. La clase compila, pero nadie puede ejecutarla para ver si funciona. Toda clase sin `main`... y sin otro programa que la use, es una clase que vive en la oscuridad.

La lección: **el constructor es el que "bautiza" los atributos, y sin un `main` (o un programa que instancie) tu clase es solo teoría**. Los tres errores típicos del novato en una sola clase.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuáles son las cuatro piezas de la escalera para diseñar una clase?
2. ¿Qué pasa en el constructor si escribes `marca = marca` sin `this`?
3. ¿Por qué el `retirar` necesita un `if` antes de restar?
4. ¿Cuándo está "terminada" una clase?

<details>
<summary>🔄 Respuestas</summary>

1. **Atributos → constructor → métodos → prueba (`main`)**.
2. Que asignas el parámetro al parámetro y el atributo queda en **`null`**.
3. Para **no dejar el saldo en negativo** (o rechazar la operación si no hay fondos).
4. Cuando **funciona**, es decir, cuando un `main` (u otro programa) la instancia y produce el resultado esperado.

</details>

---

## ✅ Resumen en 3 frases

1. Diseñar una clase es una **escalera de cuatro pisos**: atributos, constructor, métodos y prueba.
2. El constructor **bautiza los atributos** con `this` cuando hay choque de nombres; sin él, los atributos viven en `null` o en `0`.
3. Los métodos **protegen los datos** (un `if` antes de retirar) y el `main` demuestra que todo funciona.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Diseñar una clase | Elegir atributos, constructor, métodos y prueba |
> | Bautizar | Inicializar los atributos en el constructor |
> | Proteger | Validar antes de modificar (no saldos negativos) |
> | `main` de prueba | El programa que demuestra que la clase funciona |
> | Iterar | Probar, encontrar el error, corregir y volver a probar |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/07-poo-clases-objetos) · **Anterior:** [07 · Sobrecarga y paso por valor](/ApuntesProgramacion/07-poo-clases-objetos/07-sobrecarga-paso-valor) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/07-poo-clases-objetos/09-repaso-interactivo)