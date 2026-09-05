---
title: "08 — Be the Code: encapsula tu clase"
description: "El reto guiado: convierte una clase sin blindar en una bien encapsulada con getters y setters 🔨"
---

<p><small>El reto guiado: convierte una clase sin blindar en una bien encapsulada con getters y setters 🔨</small></p>

> 🗺️ **Estás en:** 🔒 **U08 · Visibilidad, Encapsulación y Static** → 08 · Be the Code: encapsula tu clase

---

## 📬 La idea en una frase

> **Aquí no aprendemos nada nuevo: ponemos en práctica todo lo de los puntos 1 al 7 convirtiendo, paso a paso, una clase que es una puerta abierta en una clase con candado, portero y alarma.**

Es la hora de ser tú el código. La U07 ya te enseñó a diseñar una clase; ahora toca el trabajo fino: **blindarla**. Cogemos una clase que viola todas las reglas y la transformamos en una clase profesional.

---

## 🏚️ El punto de partida: la clase del caos

Este es el código que "funciona" pero debería darte vergüenza ajena:

```java
public class CuentaBancaria {
    public double saldo;
    public String titular;
    public int numeroIngresos;

    public CuentaBancaria(String titular, double saldoInicial) {
        saldo = saldoInicial;
        numeroIngresos = 0;
    }

    public void ingresar(double cantidad) {
        saldo = saldo + cantidad;
        numeroIngresos++;
    }
}
```

¿Qué falla? Todo: atributos `public`, sin validación, sin getters... Vamos a convertirlo en una clase que respira seguridad. **Paso a paso, sin saltarte ninguno.**

---

## 🧰 Paso 1: atributos privados

Regla número uno de la casa: los atributos van con `private`. Sin excepciones.

```java
public class CuentaBancaria {
    private double saldo;
    private String titular;
    private int numeroIngresos;
    ...
}
```

Si alguien intenta `cuenta.saldo = 1000` desde fuera, el compilador le dice que no. Pero... ¿y si alguien legítimamente quiere saber el saldo o cambiar el titular? Eso lo resuelven los pasos 2 y 3.

---

## 🧰 Paso 2: getters para leer

Un getter devuelve el valor del atributo, siguiendo la convención `get` + nombre:

```java
public double getSaldo() {
    return saldo;
}

public String getTitular() {
    return titular;
}

public int getNumeroIngresos() {
    return numeroIngresos;
}
```

Ahora el mundo puede *leer* el saldo, pero no *tocarlo*.

> 💡 **Detalle práctico:** fíjate en que `numeroIngresos` tiene getter pero no setter: nadie debe ponerlo a mano, solo `ingresar()` lo incrementa. Solo lectura, como debe ser.

---

## 🧰 Paso 3: setter para lo que se puede cambiar

El titular sí puede cambiar (un banco actualiza titulares, qué le vamos a hacer). Añadimos el setter con su validación:

```java
public void setTitular(String titular) {
    if (titular != null && !titular.trim().isEmpty()) {
        this.titular = titular;
    } else {
        System.out.println("Titular inválido.");
    }
}
```

Fíjate en el orden del `if`: primero la condición de validez, y dentro del `else` el aviso. El `this` desambigua (parámetro vs atributo, del punto 5 de la U07).

---

## 🧰 Paso 4: validar también en los métodos

Un setter es un portero, pero los métodos `ingresar()` también tienen que serlo. Ahora mismo el código acepta ingresos negativos (¡un "ingreso" de -50 euros!). Lo arreglamos:

```java
public void ingresar(double cantidad) {
    if (cantidad > 0) {
        saldo = saldo + cantidad;
        numeroIngresos++;
    } else {
        System.out.println("No se pueden ingresar cantidades negativas.");
    }
}
```

El estado de la cuenta ya no puede ser imposible: ni saldo negativo por la vía rápida ni ingresos fantasma.

---

## 🧰 Paso 5: el toque final, constantes

Podemos rematar con una constante de clase. Imaginemos que el banco solo permite un máximo de ingresos al día por la app:

```java
public class CuentaBancaria {
    public static final int MAX_INGRESOS_DIA = 10;
    private double saldo;
    private String titular;
    private int numeroIngresos;
    ...
}
```

Y en `ingresar()` añadir la comprobación:

```java
if (numeroIngresos >= MAX_INGRESOS_DIA) {
    System.out.println("Límite diario alcanzado.");
    return;
}
```

---

## 🏆 La clase final (compárala con la del caos)

```java
public class CuentaBancaria {
    public static final int MAX_INGRESOS_DIA = 10;

    private double saldo;
    private String titular;
    private int numeroIngresos;

    public CuentaBancaria(String titular, double saldoInicial) {
        setTitular(titular);
        saldo = saldoInicial;
        numeroIngresos = 0;
    }

    public double getSaldo() {
        return saldo;
    }

    public String getTitular() {
        return titular;
    }

    public int getNumeroIngresos() {
        return numeroIngresos;
    }

    public void setTitular(String titular) {
        if (titular != null && !titular.trim().isEmpty()) {
            this.titular = titular;
        } else {
            System.out.println("Titular inválido.");
        }
    }

    public void ingresar(double cantidad) {
        if (numeroIngresos >= MAX_INGRESOS_DIA) {
            System.out.println("Límite diario alcanzado.");
            return;
        }
        if (cantidad > 0) {
            saldo = saldo + cantidad;
            numeroIngresos++;
        } else {
            System.out.println("No se pueden ingresar cantidades negativas.");
        }
    }
}
```

Del caos a la fortaleza: `private` en todo, getters, setters con validación, métodos porteros y una constante. **Eso es encapsular.**

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Por qué `numeroIngresos` no tiene setter?
2. ¿Qué hace `setTitular()` si le pasas un texto vacío?
3. ¿Cuántos pasos hizo falta seguir para blindar la clase?
4. ¿Para qué sirve la constante `MAX_INGRESOS_DIA`?

<details>
<summary>🔄 Respuestas</summary>

1. Porque nadie debe fijarlo a mano: solo `ingresar()` lo incrementa. Getter para leer, nada para escribir.
2. Lo rechaza y muestra "Titular inválido.", dejando el atributo como estaba.
3. Cinco: atributos privados, getters, setter, validación en métodos y constantes. Todos importan.
4. Para poner un límite global al negocio en un único sitio, legible y a prueba de "números mágicos".

</details>

---

## ✅ Resumen en 3 frases

1. Encapsular una clase es un **proceso en pasos**: `private`, getters, setters, validación y constantes.
2. Cada setter y cada método son una **frontera** que decide qué entra y qué sale del objeto.
3. Al final tienes una clase que **se protege sola**: el error del mundo exterior no puede romperla.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Refactorizar | Mejorar el código sin cambiar su comportamiento |
> | Blindar | Convertir atributos `public` en `private` con control de acceso |
> | Frontera | Método público que valida lo que entra |
> | Solo lectura | Getter sin setter: se lee pero no se escribe |
> | Número mágico | Literal sin nombre: se convierte en constante |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/08-visibilidad-encapsulacion-static) · **Anterior:** [07 · Constantes de clase: static final](/ApuntesProgramacion/08-visibilidad-encapsulacion-static/07-constantes-static-final) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/08-visibilidad-encapsulacion-static/09-repaso-interactivo)