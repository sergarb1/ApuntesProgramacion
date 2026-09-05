---
title: "03 — Encapsulación: el pilar de la POO"
description: "Atributos privados, acceso controlado y el patrón JavaBeans: la receta para que tu clase nunca se rompa 📦"
---

<p><small>Atributos privados, acceso controlado y el patrón JavaBeans: la receta para que tu clase nunca se rompa 📦</small></p>

> 🗺️ **Estás en:** 🔒 **U08 · Visibilidad, Encapsulación y Static** → 03 · Encapsulación: el pilar de la POO

---

## 📬 La idea en una frase

> **Encapsular es esconder los datos (atributos `private`) y ofrecer métodos controlados (`public`) para acceder a ellos. Es el pilar que sostiene toda la POO.**

Ya tienes la herramienta (`private`) y ahora toca la estrategia completa. Encapsulación = **privacidad + control**. No basta con esconder: hay que decidir cómo se entra y cómo se sale.

---

## 📦 La fórmula de la encapsulación

La receta tiene tres pasos:

1. Tus **atributos** son `private`. Nadie los toca directamente.
2. Controlas el acceso con **getters y setters** `public` (los verás en detalle en el punto 4).
3. Dentro de los setters y métodos, **validas** para que el objeto nunca tenga un estado imposible.

Ejemplo de vida (o de muerte), un banco que no quiere quebrar:

```java
public class CuentaBancaria {
    private double saldo;

    public void ingresar(double cantidad) {
        if (cantidad > 0) {
            this.saldo += cantidad;
        }
    }

    public void retirar(double cantidad) {
        if (cantidad > 0 && cantidad <= saldo) {
            this.saldo -= cantidad;
        } else {
            System.out.println("No tienes tanto dinero, amigo.");
        }
    }

    public double getSaldo() {
        return saldo;
    }
}
```

El saldo es `private`: **nadie** puede hacer `cuenta.saldo = -1000` desde fuera. La única manera de cambiarlo es pasar por `ingresar()` y `retirar()`, que son los porteros que validan.

> ⚠️ **Advertencia:** si haces los atributos `public`, estás renunciando a la encapsulación. Es como llevar la cartera abierta en el metro: tarde o temprano, alguien mete mano.

---

## 🎁 Las ventajas (o por qué no dormirás peor)

* **Control:** validas y filtras. Nada de edades negativas ni saldos inventados.
* **Mantenibilidad:** cambias la implementación interna y el código cliente ni se entera.
* **Seguridad:** nadie deja tu objeto en un estado inconsistente.
* **Bajo acoplamiento:** cada clase va a lo suyo. No se meten unas en los asuntos de otras.

> 💡 **Detalle práctico:** la encapsulación te permite cambiar cómo funciona un método por dentro (por ejemplo, que `getSaldo()` calcule en vez de guardar) sin que el resto del programa se rompa. Esa libertad vale oro en proyectos grandes.

---

## 🧬 La convención JavaBeans: el protocolo

JavaBeans es una convención (no obligatoria, pero sí sensata) que dice que una clase "bien educada":

1. Es **pública**.
2. Tiene **constructor sin argumentos**.
3. Sus **atributos son privados**.
4. Expone **getters y setters públicos**.
5. (Opcional) implementa `Serializable`.

No te dejes engañar por el nombre: no es una librería mágica, es un **estilo**. Muchas herramientas y frameworks (y exámenes) esperan que tus clases lo sigan. El punto 4 te enseña la convención de nombres exacta.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando una clase "deja pasar de todo", suele ser porque su autor confió demasiado en que los demás escribirían bien. Nunca confíes: *valida siempre en la frontera*.

**Ejercicio: el cajero que pierde dinero**

Esta clase pretende estar encapsulada, pero esconde un fallo gordo:

```java
public class Hucha {
    private int cantidad;

    public void anadir(int monedas) {
        cantidad = cantidad + monedas;
    }

    public int getCantidad() {
        return cantidad;
    }
}
```

**Preguntas (sin ejecutar):**

1. ¿Qué pasa si alguien llama a `hucha.anadir(-50)`?
2. ¿Qué le faltaría a `anadir()` para estar bien blindada?
3. ¿Y si quisiéramos que nadie pudiera leer la cantidad directamente y solo mostrara un mensaje?

<details>
<summary>🔄 Solución</summary>

1. La hucha quedaría con `cantidad = -50`: has metido dinero negativo en una hucha. Imposible en la vida real, permitido en el código.
2. Validar antes de sumar: `if (monedas > 0) { cantidad += monedas; }`. Nunca aceptes dinero negativo.
3. Eso es decisión de diseño: podrías tener `getCantidad()` público y, si solo quieres mostrar, un método `mostrarCantidad()` que imprima. Encapsular es decidir exactamente eso: qué se ve, qué se cambia y cómo.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuáles son los 3 pasos de la encapsulación?
2. ¿Qué es el patrón JavaBeans y para qué sirve?
3. ¿Por qué `CuentaBancaria` no deja hacer `saldo = -1000`?
4. ¿Qué ganas en mantenibilidad al encapsular?

<details>
<summary>🔄 Respuestas</summary>

1. Atributos `private`, acceso controlado con métodos `public` (getters/setters) y validación en la frontera.
2. Una convención de estilo: clase pública, constructor sin args, atributos privados y getters/setters públicos. Es el "protocolo" que esperan muchas herramientas.
3. Porque el saldo es `private`: desde fuera es imposible tocarlo. Solo `ingresar()` y `retirar()` lo modifican, y esos métodos validan.
4. Puedes cambiar cómo funciona tu clase por dentro sin que el código de fuera se rompa ni se entere.

</details>

---

## ✅ Resumen en 3 frases

1. **Encapsular** = atributos `private` + métodos `public` controlados + validación.
2. Da **control, mantenibilidad, seguridad y bajo acoplamiento**.
3. El **patrón JavaBeans** es la convención estándar que seguirán tus clases a partir de ahora.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Encapsulación | Esconder datos y controlar el acceso a ellos |
> | Estado | El conjunto de valores de los atributos de un objeto |
> | JavaBeans | Convención: clase pública, atributos privados, getters/setters |
> | Acoplamiento | Cuánto dependen unas clases de otras |
> | Frontera | Los métodos públicos por donde entra y sale la información |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/08-visibilidad-encapsulacion-static) · **Anterior:** [02 · public, private y protected](/ApuntesProgramacion/08-visibilidad-encapsulacion-static/02-public-private-protected) · **Siguiente:** [04 · Getters y setters](/ApuntesProgramacion/08-visibilidad-encapsulacion-static/04-getters-setters)