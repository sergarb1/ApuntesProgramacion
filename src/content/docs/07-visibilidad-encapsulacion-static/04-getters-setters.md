---
title: "04 — Getters y setters"
description: "El portero de la discoteca: leer y modificar atributos privados con nombre, orden y validación 🚪"
---

<p><small>El portero de la discoteca: leer y modificar atributos privados con nombre, orden y validación 🚪</small></p>

> 🗺️ **Estás en:** 🔒 **U07 · Visibilidad, Encapsulación y Static** → 04 · Getters y setters

---

## 📬 La idea en una frase

> **Un getter lee un atributo privado y un setter lo modifica, y ambos tienen nombres con una convención estricta. Son los porteros de tu discoteca: dejan entrar a quien quieren y echan a los que van borrachos.**

Los atributos son `private`, pero entonces... ¿cómo lee el mundo tu clase? ¿Cómo cambia la edad de un `Estudiante`? Ahí entran los **getters** (para leer) y los **setters** (para escribir). Y no, no valen nombres inventados: Java y sus frameworks esperan una convención.

---

## 🏷️ La convención de nombres (memorízala)

| Tipo de atributo | Getter | Setter |
|---|---|---|
| `String nombre` | `getNombre()` | `setNombre(String n)` |
| `boolean activo` | `isActivo()` | `setActivo(boolean a)` |
| `int cantidad` | `getCantidad()` | `setCantidad(int c)` |

Reglas de oro:

- El getter se llama `get` + atributo en mayúscula inicial. Con `boolean`, se usa `is` en vez de `get`.
- El setter se llama `set` + atributo en mayúscula inicial y recibe el valor como parámetro.
- Devuelven/reciben **exactamente el tipo del atributo**.

```java
public class Estudiante {
    private String nombre;
    private boolean matriculado;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isMatriculado() {
        return matriculado;
    }

    public void setMatriculado(boolean matriculado) {
        this.matriculado = matriculado;
    }
}
```

> 📝 **Nota:** `this` (el punto 5 de la U06) resuelve el lío de que parámetro y atributo se llamen igual. `this.nombre` es el atributo; `nombre` a secas es el parámetro. Sin `this`, te asignarías el parámetro a sí mismo y el atributo se quedaría con su valor por defecto.

---

## 🚪 El setter como portero: validar

Un setter no es solo "escribir". Es la **frontera donde validas**. Ejemplo clásico:

```java
public class Termometro {
    private double temperatura;

    public double getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(double temperatura) {
        if (temperatura < -273.15) {
            System.out.println("Imposible: eso está por debajo del cero absoluto.");
        } else {
            this.temperatura = temperatura;
        }
    }
}
```

Si alguien intenta `termometro.setTemperatura(-500)`, el setter lo frena: el termómetro nunca mostrará una temperatura imposible. Sin el setter, el atributo `public` habría aceptado ese -500 sin rechistar.

> ⚠️ **Advertencia:** un setter que no valida es un portero dormido: deja pasar a cualquiera. Si tu setter acepta edades negativas, en la práctica es como si el atributo fuera `public`.

---

## 🔒 Getter sin setter: atributos inmutables

¿Y si quieres que algo se lea pero **no se pueda cambiar**? Entonces pones getter y te ahorras el setter. Punto. Así consigues atributos de solo lectura:

```java
public class Tarjeta {
    private String numero;
    private int pin;

    public Tarjeta(String numero, int pin) {
        this.numero = numero;
        this.pin = pin;
    }

    public String getNumero() {
        return numero;
    }

    public int getPin() {
        return pin;
    }
    // Sin setters: el número y el pin se fijan al nacer y jamás cambian.
}
```

> 💡 **Detalle práctico:** los atributos que se fijan en el constructor y no deben cambiar (un DNI, un id, un pin) solo llevan getter. Es la forma elegante de decir "esto es de solo lectura".

---

## 🤷 No hay preguntas tontas

> ❓ **¿Por qué tanto rollo con los nombres? ¿No puedo llamar a mis métodos `leerEdad()` y `ponerEdad()`?**

Puedes, y funcionarían. Pero la convención `getX()` / `setX()` es lo que esperan los frameworks (y, de paso, los examinadores). Cuando en la U13 veas cómo se serializan objetos a JSON, entenderás por qué llamarse de la forma estándar ahorra dolores de cabeza.

> ❓ **¿El setter siempre tiene que validar con `println`?**

No. Otra opción muy común es **lanzar una excepción** (`IllegalArgumentException`) cuando el valor es inválido, para que el programa que llama se entere del problema. Eso lo verás bien en la U03 con `try`/`catch` y en los boletines avanzados.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** piensa en el setter como un portero de discoteca: no deja entrar a los borrachos (valores inválidos). Un buen setter convierte el error de un usuario (o de tu futuro yo) en algo controlado, no en un objeto roto.

**Ejercicio: la edad vigilada**

Escribe tú (mentalmente, o en papel) una clase `Persona` con:

- Atributo privado `int edad`.
- Constructor que recibe `edad`.
- Getter `getEdad()`.
- Setter `setEdad(int edad)` que **rechace** edades negativas y mayores de 120.

¿Qué imprimiría este código?

```java
Persona p = new Persona(25);
p.setEdad(-5);
System.out.println(p.getEdad());
```

<details>
<summary>🔄 Solución</summary>

Imprimiría **`25`**: el setter rechaza `-5` y el atributo se queda con el valor que ya tenía. Diseñar bien la frontera hace que los errores no entren. Un setter así:

```java
public void setEdad(int edad) {
    if (edad >= 0 && edad <= 120) {
        this.edad = edad;
    } else {
        System.out.println("Edad imposible, se mantiene la anterior.");
    }
}
```

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cómo se llama el getter de `boolean activo`?
2. ¿Para qué sirve validar en un setter?
3. ¿Cuándo usas un atributo solo con getter y sin setter?
4. ¿Qué hace `this` en `this.nombre = nombre`?

<details>
<summary>🔄 Respuestas</summary>

1. `isActivo()`: con `boolean`, la convención usa `is` en vez de `get`.
2. Para que el objeto nunca acepte valores imposibles: la validación ocurre en la frontera, no en el código de fuera.
3. Cuando el atributo se fija al nacer (constructor) y no debe cambiar: DNI, pin, id... Solo lectura.
4. Desambigua: `this.nombre` es el atributo de la clase y `nombre` sin más es el parámetro del método.

</details>

---

## ✅ Resumen en 3 frases

1. **Getter** lee un atributo privado; **setter** lo modifica, con nombres `getX()`/`setX()` (y `isX()` para booleanos).
2. El setter es la **frontera de validación**: rechaza valores imposibles para que el objeto nunca se rompa.
3. **Sin setter** consigues atributos de solo lectura, perfectos para datos que no deben cambiar.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Getter | Método que devuelve el valor de un atributo (`getEdad()`) |
> | Setter | Método que modifica un atributo, validando (`setEdad(int)`) |
> | `is` | Prefijo del getter cuando el atributo es `boolean` |
> | Solo lectura | Atributo con getter pero sin setter |
> | `this` | Referencia al objeto actual, desambigua atributo vs parámetro |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/07-visibilidad-encapsulacion-static) · **Anterior:** [03 · Encapsulación: el pilar de la POO](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/03-encapsulacion) · **Siguiente:** [05 · Atributos static](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/05-atributos-static)