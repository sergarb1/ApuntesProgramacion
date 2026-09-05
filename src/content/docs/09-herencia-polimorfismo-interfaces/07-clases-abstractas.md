---
title: "07 — Clases abstractas"
description: "Bocetos que no se instancian, métodos abstractos que obligan y el patrón template method 🧬"
---

<p><small>Bocetos que no se instancian, métodos abstractos que obligan y el patrón template method 🧬</small></p>

> 🗺️ **Estás en:** 🧬 **U09 · Herencia, Polimorfismo e Interfaces** → 07 · Clases abstractas

---

## 📬 La idea en una frase

> **Una clase abstracta es un boceto: no se puede instanciar, define métodos obligatorios (abstractos) y comparte código concreto con sus hijas.**

Imagina "A la venta: boceto de silla". No puedes sentarte en un boceto, ¿verdad? Pues eso son las clases abstractas: planos incompletos para que *otros* los completen.

---

## 🎨 ¿Qué es una clase abstracta?

Una clase que **NO puede instanciarse**. Puede tener métodos abstractos (sin implementación) y métodos concretos (con implementación):

```java
public abstract class Animal {
    protected String nombre;

    public abstract void hacerSonido();   // sin llaves: obliga a las hijas

    public void dormir() {                 // con llaves: código compartido
        System.out.println(nombre + " está durmiendo... Zzz");
    }
}
```

> ⚠️ **Advertencia:** `new Animal()` es un **error de compilación**. No puedes crear un "animal genérico"; solo puedes crear animales concretos que completen el boceto.

---

## 📋 You MUST: implementar los métodos abstractos

Si una clase **concreta** extiende una abstracta, está OBLIGADA a implementar todos sus métodos abstractos:

```java
public class Perro extends Animal {
    @Override
    public void hacerSonido() {
        System.out.println("¡Guau!");
    }
}

public abstract class Pajaro extends Animal {
    // No está obligada: Pajaro también es abstracta y puede dejar el método sin implementar
}
```

La regla es la ley de los contratos: **o implementas todo, o te declaras abstracto tú también**. No hay término medio.

### abstract vs concrete

| Clase abstracta | Clase concreta |
|---|---|
| No puedes crear objetos directamente | Puedes crear objetos |
| Puede tener métodos abstractos | Todos implementados |
| Concepto general | Algo específico |
| `abstract class` | Solo `class` |

---

## 📐 Ejemplo: figuras geométricas

```java
public abstract class Figura {
    protected String color;

    public Figura(String color) {
        this.color = color;
    }

    public abstract double calcularArea();
    public abstract double calcularPerimetro();

    public void mostrarColor() {
        System.out.println("Color: " + color);
    }
}

public class Circulo extends Figura {
    private double radio;

    public Circulo(String color, double radio) {
        super(color);
        this.radio = radio;
    }

    @Override public double calcularArea() { return Math.PI * radio * radio; }
    @Override public double calcularPerimetro() { return 2 * Math.PI * radio; }
}

public class Rectangulo extends Figura {
    private double ancho, alto;

    public Rectangulo(String color, double ancho, double alto) {
        super(color);
        this.ancho = ancho;
        this.alto = alto;
    }

    @Override public double calcularArea() { return ancho * alto; }
    @Override public double calcularPerimetro() { return 2 * (ancho + alto); }
}
```

`Figura` define **qué** tienen todas las figuras (color, área, perímetro) y delega **cómo** se calculan a cada una. El polimorfismo del punto 4 hace el resto: `ArrayList<Figura>` con círculos y rectángulos, y `calcularArea()` funciona solo.

---

## 🏗️ Constructores en clases abstractas

Sí, las abstractas pueden tener constructores. Se llaman con `super()`, igual que en cualquier herencia:

```java
public abstract class Animal {
    protected String nombre;

    public Animal(String nombre) {
        this.nombre = nombre;
        System.out.println("Constructor de Animal");
    }
}

public class Perro extends Animal {
    public Perro(String nombre) {
        super(nombre);
    }
}
```

No puedes instanciar `Animal`, pero su constructor **sí se ejecuta** cuando creas un `Perro` (recuerda la cadena de constructores del punto 2). El constructor de la abstracta inicializa la parte común.

---

## 🧩 Template Method: las abstractas en acción

Este es el patrón que hace que las clases abstractas valgan su peso en oro. Defines el **esqueleto de un algoritmo** y dejas que las subclases rellenen los detalles:

```java
public abstract class Bebida {
    public final void preparar() {          // final: nadie puede cambiar el esqueleto
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

public class Te extends Bebida {
    @Override protected void prepararIngrediente() { System.out.println("Poniendo la bolsita de té..."); }
    @Override protected void anadirExtras() { System.out.println("Añadiendo limón..."); }
}
```

La magia: `Te` solo implementa las dos partes variables, y `preparar()` (que es `final`) ya sabe el orden completo. Las subclases no pueden desordenar el algoritmo, solo personalizarlo. Ese es el **template method pattern**.

> 💡 **Detalle práctico:** fíjate en que los métodos abstractos son `protected`: solo la familia debe implementarlos. El esqueleto `public final` es lo único que el mundo exterior puede llamar.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** los métodos abstractos son contratos: la subclase TIENE que implementarlos. Si no, no compila. Úsalos para "forzar" comportamiento.

**Ejercicio: ¿compila?**

```java
public abstract class A { public abstract void metodo(); }
public class B extends A { }
```

<details>
<summary>🔄 Solución</summary>

**NO compila.** `B` es concreta y debe implementar `metodo()`. Solución: `public class B extends A { public void metodo() { } }` o declarar `B` como `abstract`.

</details>

**Ejercicio: ¿qué líneas dan error?**

```java
public abstract class A { public abstract void metodo(); }
public class B extends A { public void metodo() { } }

A a = new A();  // ¿error?
B b = new B();  // ¿error?
```

<details>
<summary>🔄 Solución</summary>

`new A()` → **ERROR**: no puedes instanciar una clase abstracta. `new B()` → **OK**: `B` implementó `metodo()` y es concreta.

</details>

**Ejercicio: el gato persa**

```java
abstract class Animal { abstract void hablar(); }
abstract class Mamifero extends Animal { void hablar() { System.out.println("Mamífero raro"); } }
class Gato extends Mamifero { void hablar() { System.out.println("Miau"); } }
class GatoPersa extends Gato { }

public class Test {
    public static void main(String[] args) {
        Animal a = new GatoPersa();
        a.hablar();
    }
}
```

<details>
<summary>🔄 Solución</summary>

Imprime **"Miau"**. `GatoPersa` hereda el `hablar()` de `Gato` (que sobrescribe al de `Mamifero`), y `Animal a` resuelve en runtime al objeto real: dynamic binding de principio a fin.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Puedes hacer `new` sobre una clase abstracta?
2. ¿Qué está obligada a hacer una subclase concreta?
3. ¿Puede una clase abstracta tener métodos concretos y constructores?
4. ¿Qué garantiza el `final` en el método `preparar()` del template method?

<details>
<summary>🔄 Respuestas</summary>

1. No: `new Animal()` es un error de compilación.
2. Implementar TODOS los métodos abstractos de la superclase (o declararse abstracta).
3. Sí: código compartido y constructores que se ejecutan vía `super()`.
4. Que ninguna subclase puede reordenar o saltarse pasos del algoritmo: solo rellena las partes abstractas.

</details>

---

## ✅ Resumen en 3 frases

1. Una **clase abstracta** es un boceto no instanciable con métodos abstractos (obligatorios) y concretos (compartidos).
2. Las subclases **concretas** deben implementar todos los métodos abstractos; las abstractas pueden dejar la deuda pendiente.
3. El **template method** define el esqueleto `final` de un algoritmo y delega los detalles variables a las subclases.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Clase abstracta | Clase que no puede instanciarse |
> | Método abstracto | Método sin implementación que obliga a las hijas |
> | Subclase concreta | Subclase que implementa todos los abstractos |
> | Template method | Esqueleto de algoritmo con partes que las hijas rellenan |
> | `abstract` | Modificador que marca clases y métodos sin acabar |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/09-herencia-polimorfismo-interfaces) · **Anterior:** [06 · La clase Object: el tatarabuelo](/ApuntesProgramacion/09-herencia-polimorfismo-interfaces/06-clase-object) · **Siguiente:** [08 · Interfaces: el contrato que firmas](/ApuntesProgramacion/09-herencia-polimorfismo-interfaces/08-interfaces)