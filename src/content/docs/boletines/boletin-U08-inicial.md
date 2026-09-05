---
title: Boletín U08 — Inicial
description: Ejercicios básicos de Herencia, Polimorfismo e Interfaces
---

# 📝 Boletín U08 — Inicial

> Sin soluciones. Sin prisas. Abre el IDE, dale la mano a tu primera superclase y haz que `extends` deje de parecer magia. La herencia en Java es como la de verdad: a veces te llevas genial con las subclases, a veces quieres renegar de todo. Pero nadie nace sabiendo usar `super`.

---

## Ejercicio 1: ¿Qué imprime? — La familia musical

```java
class Musico {
    void tocar() { System.out.println("El músico toca un instrumento"); }
}

class Guitarrista extends Musico {
    void tocar() { System.out.println("El guitarrista toca la guitarra"); }
}

class Bajista extends Guitarrista {
    void tocar() { System.out.println("El bajista toca el bajo"); }
}

public class Banda {
    public static void main(String[] args) {
        Bajista b = new Bajista();
        b.tocar();
    }
}
```

¿Qué imprime? ¿Por qué?

---

## Ejercicio 2: Encuentra el error — extends mal usado

```java
public class Animal {
    private String especie;

    public Animal(String especie) {
        this.especie = especie;
    }
}

public class Perro extends Animal {
    private String raza;

    public Perro(String raza) {
        this.raza = raza;
    }
}
```

Este código **no compila**. ¿Por qué? Explica el error y corrígelo.

---

## Ejercicio 3: Completa el código — el gato que llama a su padre

```java
public class Animal {
    public void hacerSonido() {
        System.out.println("Algún sonido genérico...");
    }
}

public class Gato extends Animal {
    @Override
    public void hacerSonido() {
        ________.hacerSonido();   // primero lo del padre
        System.out.println("¡MIAU!");
    }
}
```

¿Qué palabra falta en el hueco para que `Gato` primero ejecute el sonido de `Animal` y después su "¡MIAU!"? Escribe además un `main` que cree un `Gato` y llame a `hacerSonido()`.

---

## Ejercicio 4: Escribe este programa — la herencia de vehículos

Crea una jerarquía de 3 niveles usando `extends`:

- `Vehiculo` (atributo: `String marca`)
- `Coche` (atributo: `int numPuertas`)
- `Deportivo` (atributo: `int velocidadMaxima`)

Cada clase debe tener un constructor que reciba sus atributos y use `super`. En `main()`, crea un `Deportivo` de marca "Ferrari", 2 puertas y 340 km/h. Imprime sus atributos.

---

## Ejercicio 5: ¿Qué imprime? — polimorfismo con referencias

```java
class X {
    void mensaje() { System.out.println("X"); }
}

class Y extends X {
    void mensaje() { System.out.println("Y"); }
}

class Z extends Y { }

public class Test {
    public static void main(String[] args) {
        X ref1 = new Y();
        X ref2 = new Z();
        Y ref3 = new Z();

        ref1.mensaje();
        ref2.mensaje();
        ref3.mensaje();
    }
}
```

¿Qué imprime cada llamada? ¿Por qué el tipo de la referencia no decide nada?

---

## Ejercicio 6: Escribe este programa — la granja polimórfica

Crea una clase `Animal` con método `hacerSonido()`. Crea `Vaca`, `Oveja` y `Gallina` que lo sobrescriban. En `main()`, crea un `ArrayList<Animal>`, mete una vaca, una oveja y una gallina, recórrelo con un for-each llamando a `hacerSonido()`.

```java
// Salida esperada:
// Muuuu
// Beeee
// Cloc cloc
```

---

## Ejercicio 7: Encuentra el error — @Override que no lo es

```java
public class Animal {
    public void hacerSonido() {
        System.out.println("...");
    }
}

public class Pez extends Animal {
    @Override
    public void hacerSonido() { }   // ¿compila?

    @Override
    public void nadar() { }         // ¿compila?
}
```

Una de las dos líneas con `@Override` impide compilar. ¿Cuál y por qué? ¿Qué te avisa el compilador en el instante en que escribes esa línea?

---

## Ejercicio 8: Escribe este programa — el perro bien heredado

Parte de esta clase base:

```java
public class Animal {
    protected String nombre;
    protected int edad;

    public Animal(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }
}
```

Escribe una clase `Perro extends Animal` con:

- Constructor que use `super(nombre, edad)`.
- Método `ladrar()` que imprima `nombre + " dice: ¡Guau!"`.
- Un `main` que cree un `Perro("Firulais", 3)` y llame a `ladrar()`.

Responde: ¿por qué `Perro` puede usar `nombre` y `edad` aunque no las declare?

---

## Ejercicio 9: ¿Qué imprime? — la cadena de constructores

```java
class Abuelo {
    public Abuelo() { System.out.println("Abuelo"); }
}

class Padre extends Abuelo {
    public Padre() { System.out.println("Padre"); }
}

class Hijo extends Padre {
    public Hijo() { System.out.println("Hijo"); }
}

public class Test {
    public static void main(String[] args) {
        new Hijo();
    }
}
```

¿Qué imprime y por qué en ese orden?