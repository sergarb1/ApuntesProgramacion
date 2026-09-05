---
title: "04 — Polimorfismo: el camaleón de la POO"
description: "Dynamic binding, referencias polimórficas, colecciones y parámetros que cambian de forma 🧬"
---

<p><small>Dynamic binding, referencias polimórficas, colecciones y parámetros que cambian de forma 🧬</small></p>

> 🗺️ **Estás en:** 🧬 **U08 · Herencia, Polimorfismo e Interfaces** → 04 · Polimorfismo: el camaleón de la POO

---

## 📬 La idea en una frase

> **El polimorfismo hace que un mismo método se comporte de forma diferente según el objeto real que lo invoca, decidiéndolo la JVM en tiempo de ejecución.**

Polimorfismo (_poly_ = muchas, _morphé_ = formas): un mismo método se comporta diferente según el objeto que lo invoque. Como un control remoto universal donde el mismo botón "PLAY" funciona en Netflix, Spotify y tu tostadora.

---

## 🎭 El mismo método, diferentes comportamientos

```java
public class Animal {
    public void hacerSonido() { System.out.println("..."); }
}

public class Perro extends Animal {
    @Override
    public void hacerSonido() { System.out.println("¡Guau!"); }
}

public class Gato extends Animal {
    @Override
    public void hacerSonido() { System.out.println("¡Miau!"); }
}
```

Y ahora la magia:

```java
Animal a;
a = new Perro(); a.hacerSonido(); // ¡Guau!
a = new Gato();  a.hacerSonido(); // ¡Miau!
```

La variable `a` es de tipo `Animal`, pero apunta a objetos diferentes. Se ejecuta siempre el método del **objeto real**, no el del tipo de la variable.

---

## 🔮 Dynamic binding: la decisión en runtime

El compilador y la JVM hacen trabajos distintos:

> **Compilador:** "¿`Animal` tiene `hacerSonido()`? Sí. Adelante."
> **JVM (runtime):** "El objeto es un `Perro`. Ejecuto el de `Perro`."

Esto es **dynamic binding** (o late binding): el *qué* se puede llamar lo decide el compilador; el *cómo* se ejecuta lo decide la JVM cuando el programa corre. Esa separación es la que hace posible el polimorfismo.

> 💡 **Detalle práctico:** si Java resolviese los métodos en compilación (static binding), llamar a `a.hacerSonido()` siempre ejecutaría la versión de `Animal`. El polimorfismo existe porque la decisión se aplaza hasta el momento justo.

---

## 🔗 Referencias polimórficas

Puedes guardar un objeto específico en una variable de tipo más general:

```java
Animal miMascota = new Perro();  // ✓
Animal tuMascota = new Gato();   // ✓
```

Pero la variable solo "ve" los métodos del tipo de la referencia:

```java
Animal a = new Perro();
a.hacerSonido();   // ✓
a.moverCola();     // ✗ Animal no tiene moverCola()
```

> ⚠️ **Advertencia:** el compilador es conservador: si la variable es `Animal`, solo deja llamar a métodos de `Animal`, aunque por dentro haya un `Perro`. Para acceder a `moverCola()` necesitas el punto 5 (downcasting).

---

## 📚 Polimorfismo con colecciones

Aquí es donde el polimorfismo paga el alquiler:

```java
import java.util.ArrayList;

ArrayList<Animal> animales = new ArrayList<>();
animales.add(new Perro());
animales.add(new Gato());
animales.add(new Vaca());

for (Animal a : animales) {
    a.hacerSonido();  // cada uno el suyo
}
// ¡Guau! / ¡Miau! / ¡Muuu!
```

Una sola lista, un solo bucle. Sin polimorfismo necesitarías tres listas separadas (y una bicicleta para llevarlas).

---

## 🧑‍⚕️ Polimorfismo con parámetros

Un método que acepta el tipo general funciona con cualquier subclase:

```java
public class Veterinario {
    public void vacunar(Animal a) {
        System.out.print("Vacunando a: ");
        a.hacerSonido();
    }
}

Veterinario vet = new Veterinario();
vet.vacunar(new Perro()); // Vacunando a: ¡Guau!
vet.vacunar(new Gato());  // Vacunando a: ¡Miau!
```

Y puedes ir más allá: una clase que gestiona una colección polimórfica:

```java
public class Zoologico {
    private ArrayList<Animal> animales = new ArrayList<>();

    public void agregarAnimal(Animal a) {
        animales.add(a);
    }

    public void hacerDesfile() {
        for (Animal a : animales) {
            System.out.print(a.getClass().getSimpleName() + " dice: ");
            a.hacerSonido();
        }
    }
}
```

Añadir un `Gato` o un `Perro` no requiere cambiar **una sola línea** del `Zoológico`. Eso es diseño a prueba de futuro: el código se abre a nuevas clases sin tocarse.

---

## 🚫 Los atributos NO son polimórficos

Punto importante para el examen: la magia solo funciona con **métodos**. Los atributos se resuelven por el tipo de la **referencia**, no del objeto:

```java
class A { int x = 1; }
class B extends A { int x = 2; }

A ref = new B();
System.out.println(ref.x);   // 1, NO 2
```

`ref.x` devuelve `1` porque los atributos no participan en el dynamic binding. Solo los métodos. Los atributos "ocultan" (shadowing), no sobrescriben.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el compilador mira el tipo de la variable; la JVM mira el tipo real del objeto. Ahí está la magia.

**Ejercicio: ¿qué imprime?**

```java
class A { void saluda() { System.out.println("Hola desde A"); } }
class B extends A { void saluda() { System.out.println("Hola desde B"); } }
class C extends B { void saluda() { System.out.println("Hola desde C"); } }

public class Test {
    public static void main(String[] args) {
        A ref1 = new B();
        A ref2 = new C();
        B ref3 = new C();
        ref1.saluda();
        ref2.saluda();
        ref3.saluda();
    }
}
```

<details>
<summary>🔄 Solución</summary>

```
Hola desde B
Hola desde C
Hola desde C
```

Solo importa el tipo real del objeto (`B`, `C`, `C`). El tipo de la referencia (`A`, `A`, `B`) no decide nada en runtime.

</details>

**Ejercicio: ¿compila?**

```java
class Vehiculo { void mover() { System.out.println("Vehículo se mueve"); } }

class Coche extends Vehiculo {
    void mover() { System.out.println("Coche acelera"); }
    void abrirPuertas() { System.out.println("Puertas abiertas"); }
}

public class Test {
    public static void main(String[] args) {
        Vehiculo v = new Coche();
        v.mover();
        // v.abrirPuertas();   <- ¿compila?
    }
}
```

<details>
<summary>🔄 Solución</summary>

`v.mover()` imprime **"Coche acelera"**. La línea comentada **NO compila**: el compilador solo mira el tipo de la referencia (`Vehiculo`), y `Vehiculo` no tiene `abrirPuertas()`.

</details>

**Ejercicio: ¿qué imprime `o`?**

```java
interface Volable { void volar(); }
class Pajaro implements Volable {
    public void volar() { System.out.println("Vuela"); }
}
class Aguila extends Pajaro {
    public void volar() { System.out.println("Vuela alto"); }
}

public class Test {
    public static void main(String[] args) {
        Volable v = new Aguila();
        Pajaro p = new Aguila();
        Object o = new Aguila();
        v.volar();
        p.volar();
        // o.volar() no compila: Object no tiene volar()
    }
}
```

<details>
<summary>🔄 Solución</summary>

`v.volar()` y `p.volar()` imprimen **"Vuela alto"**: el tipo de la referencia no importa, solo el objeto real. `o.volar()` ni siquiera compila porque `Object` no conoce `volar()` (aunque en runtime el objeto sí lo tenga). El polimorfismo actúa dentro de los límites que el compilador permite.

</details>

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué es el dynamic binding?
2. ¿`Animal a = new Perro();` — qué métodos puedes llamar con `a`?
3. ¿Por qué no necesitas cambiar el `Zoológico` al añadir un animal nuevo?
4. ¿Son polimórficos los atributos?

<details>
<summary>🔄 Respuestas</summary>

1. Que el método a ejecutar se decide en runtime según el tipo real del objeto, no en compilación.
2. Solo los de `Animal` (`hacerSonido()`). Para `moverCola()` necesitas downcasting (punto 5).
3. Porque `agregarAnimal` acepta `Animal` (o cualquier subclase) y el bucle usa polimorfismo.
4. No. Los métodos son polimórficos; los atributos se resuelven por el tipo de la referencia.

</details>

---

## ✅ Resumen en 3 frases

1. **Polimorfismo** = un método, muchas formas: la JVM elige la implementación del objeto real.
2. Las **referencias polimórficas** (`Animal a = new Perro()`) permiten colecciones y parámetros flexibles.
3. Los **métodos** son polimórficos; los **atributos**, no.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Polimorfismo | Un mismo método se comporta según el objeto real |
> | Dynamic binding | Decisión del método en tiempo de ejecución |
> | Referencia polimórfica | Variable de tipo general apuntando a un objeto específico |
> | Override | La herramienta que cambia el comportamiento |
> | Shadowing | Ocultar un atributo de la superclase (los atributos no son polimórficos) |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces) · **Anterior:** [03 · protected y jerarquías de clases](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/03-protected-jerarquias) · **Siguiente:** [05 · instanceof y downcasting](/ApuntesProgramacion/08-herencia-polimorfismo-interfaces/05-instanceof-downcasting)