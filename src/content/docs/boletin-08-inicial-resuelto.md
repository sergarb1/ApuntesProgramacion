---
title: "Boletín 6 - Inicial Resuelto: Herencia y Polimorfismo"
nav_order: 6
---
*Aquí con soluciones y explicaciones. Sin trampas.*

---

## Ejercicio 1: ¿Qué imprime? — La llamada a la familia

```java
class Abuelo {
    void saludar() { System.out.println("Soy el abuelo"); }
}
class Padre extends Abuelo {
    void saludar() { System.out.println("Soy el padre"); }
}
class Hijo extends Padre {
    void saludar() { System.out.println("Soy el hijo"); }
}

public class Test {
    public static void main(String[] args) {
        Hijo h = new Hijo();
        h.saludar();
    }
}
```

**Solución:** Imprime `"Soy el hijo"`.

> **💡 Explicación:** Java busca el método `saludar()` empezando por la clase más específica (`Hijo`). La encuentra ahí mismo y la ejecuta. Nunca sube a `Padre` ni a `Abuelo`. Esto se llama *dynamic dispatch*: el método se resuelve en tiempo de ejecución según el tipo real del objeto, no según el tipo de la referencia. Y como `h` es un `Hijo` de verdad (de los que no llaman a los abuelos), ejecuta su propia versión.

---

## Ejercicio 2: Encuentra el error — extends mal usado

```java
public class Vehiculo {
    private String matricula;
    public Vehiculo(String matricula) {
        this.matricula = matricula;
    }
}

public class Coche extends Vehiculo {
    private int numPuertas;
    public Coche(int numPuertas) {
        this.numPuertas = numPuertas;
    }
}
```

**Solución:** El error es que `Coche` no llama al constructor de `Vehiculo`. Cuando una clase hija no pone `super()` explícitamente, Java intenta llamar a `super()` sin parámetros. Pero `Vehiculo` no tiene constructor sin parámetros — solo tiene `Vehiculo(String)`. Por tanto: **error de compilación**.

```java
public class Coche extends Vehiculo {
    private int numPuertas;
    public Coche(String matricula, int numPuertas) {
        super(matricula);  // ¡Aquí está la clave!
        this.numPuertas = numPuertas;
    }
}
```

> **💡 Explicación:** Piensa en `super()` como llamar a papá para que configure su parte antes de que tú configures la tuya. Si papá necesita una matrícula para construirse, tú tienes que pasársela. No puedes escaquearte. Es como intentar construir una casa sin cimientos: el constructor del padre es la base.

---

## Ejercicio 3: Completa el código — the instanceof

```java
class Animal {
    public void hacerSonido() {
        System.out.println("...");
    }
}

class Perro extends Animal {
    public void ladrar() {
        System.out.println("¡Guau!");
    }
}

// En main:
Animal a = new Perro();
if (a instanceof Perro) {
    Perro p = (Perro) a;
    p.ladrar();
}
```

> **💡 Explicación:** `instanceof` pregunta: "¿eres realmente un Perro o solo te disfrazas de Animal?". Como el objeto real es un `new Perro()`, la respuesta es `true`. Luego hacemos downcasting con `(Perro) a` para tener una referencia de tipo `Perro` y poder llamar a `ladrar()`. Sin el casting, el compilador no te deja: "Oye, `Animal` no tiene `ladrar()`, no me engañas".

---

## Ejercicio 4: Escribe este programa — la jerarquía de animales

```java
class SerVivo {
    protected int edad;

    public SerVivo(int edad) {
        this.edad = edad;
    }
}

class Animal extends SerVivo {
    protected String nombre;

    public Animal(String nombre, int edad) {
        super(edad);
        this.nombre = nombre;
    }
}

class Perro extends Animal {
    public Perro(String nombre, int edad) {
        super(nombre, edad);
    }

    public void ladrar() {
        System.out.println(nombre + " dice: ¡Guau! Edad: " + edad);
    }
}

public class Test {
    public static void main(String[] args) {
        Perro p = new Perro("Firulais", 3);
        p.ladrar();
    }
}
```

**Salida:** `Firulais dice: ¡Guau! Edad: 3`

> **💡 Explicación:** La herencia en cadena: `Perro` → `Animal` → `SerVivo`. Cada constructor llama a su padre con `super()`. Al final, `Perro` tiene acceso a `nombre` (de `Animal`) y `edad` (de `SerVivo`) porque están declarados como `protected`. Si fueran `private`, ni `Perro` los vería. Es como la herencia familiar: lo que es privado en casa de los abuelos, no lo ven ni los nietos.

---

## Ejercicio 5: ¿Qué imprime? — referencias polimórficas

```java
class A {
    void foo() { System.out.println("A"); }
}
class B extends A {
    void foo() { System.out.println("B"); }
}
class C extends B { }

public class Test {
    public static void main(String[] args) {
        A ref1 = new B();
        A ref2 = new C();
        B ref3 = new C();

        ref1.foo();  // "B"
        ref2.foo();  // "C"
        ref3.foo();  // "C"
    }
}
```

> **💡 Explicación:** El tipo de la REFERENCIA (A, A, B) no importa. Lo que importa es el tipo REAL del objeto (B, C, C). Java siempre ejecuta el método más específico del objeto real. Es como si llevaras una chaqueta de tu padre: por fuera pareces tu padre (la referencia), pero por dentro eres tú (el objeto). Cuando hablas, se oye tu voz, no la de tu padre. Dynamic binding en todo su esplendor.

---

## Ejercicio 6: Encuentra el error — polimorfismo y casting

```java
Animal a = new Gato();
Perro p = (Perro) a;  // 💥 ClassCastException en runtime
p.ladrar();
```

**Solución:** El error es que estás intentando disfrazar un `Gato` de `Perro`. Java no se deja engañar: en tiempo de ejecución, el objeto real es un `Gato`, no un `Perro`, y lanza `ClassCastException`.

Para arreglarlo:

```java
Animal a = new Gato();
if (a instanceof Perro) {
    Perro p = (Perro) a;
    p.ladrar();
} else {
    System.out.println("No es un perro, no puedo hacerlo ladrar.");
}
```

> **💡 Explicación:** `instanceof` es tu red de seguridad. Siempre úsalo antes de hacer downcasting. Es como mirar por la mirilla antes de abrir la puerta: si es un repartidor de pizzas, abre; si es un león, mejor no. En este caso, es un `Gato`, así que el `instanceof` da `false` y te ahorras el `ClassCastException`.

---

## Ejercicio 7: Escribe este programa — el zoo polimórfico

```java
import java.util.ArrayList;

abstract class Animal {
    public abstract void hacerSonido();
}

class Perro extends Animal {
    @Override
    public void hacerSonido() {
        System.out.println("¡Guau!");
    }
}

class Gato extends Animal {
    @Override
    public void hacerSonido() {
        System.out.println("¡Miau!");
    }
}

public class Zoo {
    public static void main(String[] args) {
        ArrayList<Animal> animales = new ArrayList<>();
        animales.add(new Perro());
        animales.add(new Gato());

        for (Animal a : animales) {
            a.hacerSonido();
        }
    }
}
```

Salida:
```
¡Guau!
¡Miau!
```

> **💡 Explicación:** Aquí pasa la magia del polimorfismo. Declaramos `ArrayList<Animal>`, que acepta cualquier subclase de `Animal`. Cuando recorremos la lista con un for-each, cada `Animal a` apunta a un objeto diferente (primero `Perro`, luego `Gato`). Pero al llamar a `hacerSonido()`, Java ejecuta la versión del objeto real, no la de `Animal`. Un solo bucle, múltiples comportamientos. Esto es polimorfismo en acción. Sin él, tendrías que tener listas separadas para cada tipo de animal, como en la edad de piedra de la programación.

---

## 🔗 Referencias para seguir practicando

- **CodeWars:** [Is this a triangle?](https://www.codewars.com/kata/56606694ec01347ce800001b) (7 kyu)
- **CodeWars:** [Basic subclasses - Adam and Eve](https://www.codewars.com/kata/547274e24481cfc469000416) (8 kyu)
- **AceptaElReto.com:** [364 - Spiderman](https://www.aceptaelreto.com/problem/statement.php?id=364)
- **AceptaElReto.com:** [458 - El espejo](https://www.aceptaelreto.com/problem/statement.php?id=458)
