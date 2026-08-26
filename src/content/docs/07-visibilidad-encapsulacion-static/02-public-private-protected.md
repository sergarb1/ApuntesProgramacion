---
title: "02 — public, private y protected"
description: "Los 4 niveles de visibilidad: de la valla publicitaria en Times Square al diario con candado 🔐"
---

<p><small>Los 4 niveles de visibilidad: de la valla publicitaria en Times Square al diario con candado 🔐</small></p>

> 🗺️ **Estás en:** 🔒 **U07 · Visibilidad, Encapsulación y Static** → 02 · public, private y protected

---

## 📬 La idea en una frase

> **Hay 4 niveles de visibilidad en Java — `public`, `protected`, package-private y `private` — y cada uno es como un tipo de cerradura: decide quién tiene la llave de cada miembro de tu clase.**

En el punto 1 viste el problema de la casa de cristal. Ahora toca el kit de cerraduras. Java te da exactamente **cuatro niveles** de visibilidad, de la valla publicitaria al diario con candado.

---

## 🗂️ Los 4 niveles: de la valla al diario

| Modificador | Se ve desde | Es como... |
|---|---|---|
| `public` | Todo el mundo, absolutamente todo | Una valla publicitaria en Times Square |
| `protected` | Mismo paquete + subclases (hijos) | Los secretos de familia: lo saben tus primos y tus hijos |
| (nada) package-private | Mismo paquete (el vecindario) | El cotilleo del barrio |
| `private` | Solo la propia clase | Tu diario secreto con candado |

El detalle importante: **si no pones nada, Java asume package-private**. No existe una palabra `default` para esto (esa palabra es para otra cosa), así que "sin modificador" = "vecindario".

> 💡 **Detalle práctico:** cuanto más `private` seas, más seguro estás. La regla de oro del programador paranoico: *empieza con el acceso más restrictivo y ábrelo solo si hay motivo*.

---

## 📣 public: la valla publicitaria

Todo el mundo lo ve. Desde cualquier clase, cualquier paquete, cualquier rincón del universo Java. Es como poner tu número de teléfono en una pancarta:

```java
public class VallaPublicitaria {
    public String mensaje;

    public void mostrar() {
        System.out.println(mensaje);
    }
}
```

Úsalo para lo que **quieres** que otros usen: métodos de servicio, la puerta de entrada de la clase, el `main`... No para tus atributos, a menos que te guste el caos.

---

## 🔒 private: el diario con candado

Solo la clase ve sus propios `private`. Ni su madre, ni su mejor amigo, ni el perro:

```java
public class DiarioSecreto {
    private String contenido;

    public void escribir(String mensaje) {
        this.contenido = "Querido diario: " + mensaje;
    }

    public String leer() {
        return contenido;
    }
}
```

Desde fuera no puedes hacer `diario.contenido` directamente: el compilador te lo prohíbe. Solo puedes usar lo que la clase expone (`escribir()` y `leer()`).

> ⚠️ **Advertencia:** nunca, NUNCA, hagas un atributo `public` "porque es más rápido". Es más rápido de escribir y el doble de lento de depurar: cuando alguien meta un valor imposible, te pasarás horas buscando quién lo cambió.

---

## 👨‍👩‍👧 protected: los secretos de familia

Es como las historias vergonzosas de la familia. Tus primos (mismo paquete) y tus hijos (subclases) pueden acceder. Pero un desconocido de otro paquete... no. En la U08 (herencia) lo exprimirás de verdad; por ahora, quédate con la idea: *protegido para la familia*.

```java
package zoologico;

public class Animal {
    protected String nombre; // Lo ven el paquete y las subclases
}
```

---

## 🏘️ package-private: el cotilleo del barrio

Si no pones ningún modificador, lo ven las clases del **mismo paquete**. Es como el grupo de WhatsApp del vecindario: los del bloque lo saben todo; los de la otra ciudad, ni idea.

```java
package barrio;

public class Casa {
    public String direccion;          // Lo sabe todo el mundo
    protected String telefono;        // Lo sabe la familia
    int numeroHabitaciones;           // Lo saben los vecinos (package-private)
    private String contrasenaWifi;    // SOLO YO
}
```

Desde el mismo paquete (`barrio`):

```java
public class Vecino {
    public void espiar() {
        Casa c = new Casa();
        System.out.println(c.direccion);          // OK: public
        System.out.println(c.telefono);           // OK: protected (mismo paquete)
        System.out.println(c.numeroHabitaciones); // OK: package-private
        // System.out.println(c.contrasenaWifi);  // ERROR: private
    }
}
```

Desde otro paquete, siendo subclase:

```java
package otraCiudad;
import barrio.Casa;

public class CasaHeredada extends Casa {
    public void espiar() {
        System.out.println(direccion);        // OK: public
        System.out.println(telefono);         // OK: protected (soy subclase)
        // System.out.println(numeroHabitaciones); // ERROR: package-private
        // System.out.println(contrasenaWifi);     // ERROR: private
    }
}
```

> 📝 **Nota:** los **métodos** también tienen visibilidad. Un método `private void calcularImpuesto()` solo se usa dentro de la clase; nadie fuera necesita saber cómo calculas los impuestos (ni tú mismo quieres saberlo).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** cuando tengas dudas de "¿quién ve esto?", hazte dos preguntas: *¿está la otra clase en el mismo paquete?* y *¿es una subclase?* Con esas dos respuestas, tienes la cerradura resuelta.

**Ejercicio: el banco espía**

Eres la clase `Banco`. Tienes estos miembros:

```java
public class Banco {
    public String nombreBanco;
    protected String direccionSucursal;
    String listaClientes;
    private double saldoCaja;

    public void mostrarInfo() {
        System.out.println(nombreBanco);
        System.out.println(direccionSucursal);
        System.out.println(listaClientes);
        System.out.println(saldoCaja);
    }
}
```

**Preguntas (sin ejecutar):**

1. ¿Puede una clase `Sucursal` de otro paquete ver `listaClientes`?
2. ¿Y `direccionSucursal`?
3. ¿Puede el `main()` de una clase del mismo paquete ver `saldoCaja`?

<details>
<summary>🔄 Solución</summary>

1. **No.** `listaClientes` es package-private: solo lo ven las clases del mismo paquete.
2. **Sí**, pero solo si `Sucursal` es subclase de `Banco` (porque es `protected`). Si es una clase suelta de otro paquete, tampoco.
3. **No.** `saldoCaja` es `private`: solo la propia clase `Banco` puede verlo. Por eso `mostrarInfo()` funciona: es un método de la clase y la clase siempre se ve a sí misma entera.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuántos niveles de visibilidad tiene Java y cómo se llaman?
2. ¿Qué nivel asume Java si no escribes ningún modificador?
3. ¿Quién puede ver un miembro `protected`?
4. ¿Puede un método ser `private`? ¿Para qué sirve?

<details>
<summary>🔄 Respuestas</summary>

1. Cuatro: `public`, `protected`, package-private (sin modificador) y `private`.
2. **Package-private**: lo ven las clases del mismo paquete.
3. Las clases del **mismo paquete** y las **subclases** (aunque estén en otro paquete).
4. Sí. Un método `private` es una pieza interna de la clase que nadie de fuera necesita: por ejemplo, `private void recalcularSaldo()`. Aisla la complejidad y evita que otros usen lo que no deben.

</details>

---

## ✅ Resumen en 3 frases

1. Los **4 niveles** de visibilidad son `public` > `protected` > package-private > `private`.
2. `private` es lo más restrictivo (solo la clase) y `public` lo más abierto (todo el mundo).
3. **Sin modificador, Java asume package-private**, y la buena práctica es empezar privado y abrir solo lo necesario.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Modificador de acceso | Palabra que decide quién ve un miembro: `public`, `protected`, `private` |
> | Package-private | Visibilidad "por defecto": solo el mismo paquete |
> | Paquete | Carpeta de clases (`package barrio;`) |
> | Subclase | Clase que hereda de otra (`extends`) |
> | Miembro | Un atributo o un método de la clase |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/07-visibilidad-encapsulacion-static) · **Anterior:** [01 · Visibilidad: el arte de no enseñarlo todo](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/01-visibilidad) · **Siguiente:** [03 · Encapsulación: el pilar de la POO](/ApuntesProgramacion/07-visibilidad-encapsulacion-static/03-encapsulacion)