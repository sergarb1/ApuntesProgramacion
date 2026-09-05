---
title: "03 — protected y jerarquías de clases"
description: "El miembro que solo ve la familia, árboles de clases y el peligro de la clase base frágil 🧬"
---

<p><small>El miembro que solo ve la familia, árboles de clases y el peligro de la clase base frágil 🧬</small></p>

> 🗺️ **Estás en:** 🧬 **U08 · Herencia, Polimorfismo e Interfaces** → 03 · protected y jerarquías de clases

---

## 📬 La idea en una frase

> **`protected` es la visibilidad de la familia: el miembro lo ven las subclases (y el propio paquete). Y las jerarquías de clases bien diseñadas son árboles, no bosques enmarañados.**

En la U07 viste los cuatro niveles de visibilidad. Aquí descubres el matiz que solo cobra sentido con herencia: `protected`.

---

## 🔐 protected: el secreto que solo la familia ve

| Visibilidad | Misma clase | Mismo paquete | Subclases (cualquier paquete) | Todos |
|---|---|---|---|---|
| `private` | ✅ | ❌ | ❌ | ❌ |
| package-private | ✅ | ✅ | ❌ | ❌ |
| `protected` | ✅ | ✅ | ✅ | ❌ |
| `public` | ✅ | ✅ | ✅ | ✅ |

`protected` es el punto dulce: ni privado ni público de todo el mundo. Es la puerta con **llave para la familia**:

```java
public class Animal {
    private String secreto;    // Solo Animal
    protected String familia;  // Animal, sus subclases y su paquete
    public String nombre;      // Todos
}
```

> 💡 **Consejo práctico:** cuando una clase base necesita que las hijas lean un atributo o llamen a un método, decláralo `protected`. Cuando las hijas no deben tocarlo, `private`. Y si nadie debe heredar de tu clase... `final`.

---

## 🌳 Diseñando jerarquías sensatas

Una jerarquía de clases es un árbol. Las reglas de un árbol sano:

1. **La raíz es general, las hojas son específicas.** `Animal` en la cima, `Perro` en la base.
2. **Cada nivel añade algo.** No crees una clase solo por tener una clase más.
3. **Poca profundidad.** 2 o 3 niveles son fáciles de mantener; 7 niveles son 7 niveles de dolor.
4. **Todo hereda de `Object`** (lo verás en el punto 6), aunque no lo escribas.

```java
public class Empleado {
    protected String nombre;
    protected double salarioBase;

    public Empleado(String nombre, double salarioBase) {
        this.nombre = nombre;
        this.salarioBase = salarioBase;
    }

    public void mostrarInfo() {
        System.out.println(nombre + " cobra " + salarioBase + " €");
    }
}

public class Gerente extends Empleado {
    private double bono;

    public Gerente(String nombre, double salarioBase, double bono) {
        super(nombre, salarioBase);
        this.bono = bono;
    }

    public void mostrarInfo() {
        super.mostrarInfo();
        System.out.println("  y tiene un bono de " + bono + " €");
    }
}
```

Fíjate en el patrón: el `Gerente` usa `super(...)` para construir la parte de `Empleado` y `super.mostrarInfo()` para extender la salida. Ese es el diseño limpio de una jerarquía: cada clase se encarga de lo suyo.

---

## 💥 El problema de la clase base frágil

Aquí va la advertencia seria. Imagina que tienes un `Jarrón` con un método `romper()` y un `JarrónChino` que lo sobrescribe para hacer un ritual de rotura. Todo va bien... hasta que alguien añade un método `caerAlSuelo()` a `Jarrón` que internamente llama a `romper()`:

```java
public class Jarrón {
    public void romper() { System.out.println("¡Crac! Jarrón roto"); }

    public void caerAlSuelo() {
        System.out.println("¡Se cae!");
        romper();   // ¡sorpresa: puede llamar al override de JarrónChino!
    }
}
```

Ahora `JarrónChino` se comporta de forma inesperada cada vez que cae al suelo, sin que nadie tocara su código. Este es el **problema de la clase base frágil** (fragile base class problem): cambiar la clase padre puede romper el comportamiento de las hijas.

> ⚠️ **Advertencia:** la herencia crea acoplamiento. Cuando cambias `Jarrón`, TODAS sus hijas cambian contigo, quieras o no. Es un superpoder con efectos secundarios.

> ❓ **¿Entonces la herencia es mala?**
>
> ¡No! Es una herramienta. Bien usada es perfecta para relaciones IS-A claras. El problema es usarla cuando una simple composición bastaría. La regla moderna: **prefiere composición sobre herencia**, y usa herencia solo para "es-un" reales.

---

## 🧩 Composición: "tener" en vez de "ser"

```java
// HERENCIA: un coche ES UN vehículo
public class Coche extends Vehiculo { }

// COMPOSICIÓN: un coche TIENE UN motor
public class Coche {
    private Motor motor;
    private Rueda[] ruedas;
}
```

¿Por qué preferir composición a veces?

1. **Menos acoplamiento:** cambiar la clase de la parte no rompe a la que la contiene.
2. **Más flexible:** puedes cambiar las partes en tiempo de ejecución.
3. **Evitas jerarquías profundas:** 5 niveles de herencia = 5 niveles de dolor.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `protected` no es "público para los amigos": es una visibilidad formal que el compilador controla. Úsala con intención, no por vaguería.

**Ejercicio: el árbol que no compila**

```java
public class SerVivo {
    protected int energia;

    public SerVivo(int energia) {
        this.energia = energia;
    }
}

public class Animal extends SerVivo {
    protected String nombre;

    public Animal(String nombre, int energia) {
        super(energia);
        this.nombre = nombre;
    }
}

public class Perro extends Animal {
    public Perro(String nombre, int energia) {
        super(nombre, energia);
    }

    public void ladrar() {
        System.out.println(nombre + " ladra con energía " + energia);
    }
}
```

**Pregunta:** ¿por qué `Perro` puede usar `nombre` y `energia` aunque no las declare? ¿Y qué pasaría si `energia` fuese `private`?

<details>
<summary>🔄 Solución</summary>

`Perro` usa `nombre` (declarado en `Animal`) y `energia` (declarado en `SerVivo`) porque ambos son `protected`: la herencia los pone a disposición de toda la cadena. Si `energia` fuese `private`, `Perro` no podría leerlo directamente; tendría que pasar por un getter de `SerVivo`.

</details>

**Ejercicio: el jarrón que cae**

Con el código de `Jarrón` y `JarrónChino` de arriba, ¿qué imprimiría si haces `new JarrónChino().caerAlSuelo()` sabiendo que `JarrónChino` sobrescribe `romper()` para gritar "¡LAMENTO MILENARIO!"?

<details>
<summary>🔄 Solución</summary>

```
¡Se cae!
¡LAMENTO MILENARIO!
```

El método `caerAlSuelo()` está en `Jarrón`, pero al llamar a `romper()` usa el override de `JarrónChino` (polimorfismo). Un cambio en la base alteró el comportamiento de la hija sin tocar su código: la clase base frágil en acción.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Quién ve un miembro `protected`?
2. ¿Cuántos niveles de profundidad sugiere el curso para una jerarquía?
3. ¿Qué es el problema de la clase base frágil?
4. ¿Cuándo usarías composición en vez de herencia?

<details>
<summary>🔄 Respuestas</summary>

1. La propia clase, las clases del mismo paquete y todas sus subclases (estén donde estén). El mundo exterior no.
2. 2 o 3 niveles. Más profundidad = más acoplamiento y más dolor.
3. Que al cambiar la superclase, las subclases se comportan de forma inesperada porque heredan esos cambios.
4. Cuando la relación es "tiene-un" (HAS-A), cuando necesitas flexibilidad o cuando la jerarquía se haría demasiado profunda.

</details>

---

## ✅ Resumen en 3 frases

1. **`protected`** es la visibilidad familiar: subclases y paquete lo ven; el mundo, no.
2. Las **jerarquías sanas** son poco profundas, cada nivel aporta algo y la raíz es general.
3. La herencia **acopla**; el problema de la clase base frágil avisa de que cambiar el padre tiene consecuencias. Composición sobre herencia cuando haya duda.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | `protected` | Visible para la clase, el paquete y las subclases |
> | Jerarquía de clases | Árbol de herencia de lo general a lo específico |
> | Clase base frágil | Cambios en la superclase que rompen subclases sin avisar |
> | Acoplamiento | Cuánto dependen unas clases de otras |
> | Composición | "Tener" (HAS-A) en vez de "ser" (IS-A) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces) · **Anterior:** [02 · super y @Override](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/02-super-override) · **Siguiente:** [04 · Polimorfismo: el camaleón de la POO](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/04-polimorfismo)