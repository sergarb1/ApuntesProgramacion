---
title: Boletín U08 — Inicial Resuelto
description: Los mismos ejercicios que el boletín inicial, con soluciones
---

# 📝 Boletín U08 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: ¿Qué imprime? — La familia musical

<details>
<summary>🔄 Solución</summary>

Imprime **"El bajista toca el bajo"**.

`Bajista` tiene su propia versión de `tocar()`. Java busca el método empezando por la clase más específica (`Bajista`) y lo encuentra ahí mismo: nunca sube a `Guitarrista` ni a `Musico`. Ese es el *dynamic dispatch*: el método se resuelve según el tipo real del objeto, no según el tipo de la referencia.

</details>

---

## Ejercicio 2: Encuentra el error — extends mal usado

<details>
<summary>🔄 Solución</summary>

El error es que `Perro` no llama al constructor de `Animal`. Cuando una clase hija no pone `super(...)`, Java intenta llamar a `super()` sin parámetros. Pero `Animal` solo tiene `Animal(String)`, así que el compilador no encuentra el constructor vacío: **error de compilación**.

```java
public class Perro extends Animal {
    private String raza;

    public Perro(String especie, String raza) {
        super(especie);   // ¡la clave!
        this.raza = raza;
    }
}
```

Piensa en `super()` como llamar a papá para que configure su parte antes de que tú configures la tuya. Si papá necesita una especie para construirse, tú tienes que pasársela. Es como construir una casa sin cimientos: el constructor del padre es la base.

</details>

---

## Ejercicio 3: Completa el código — el gato que llama a su padre

<details>
<summary>🔄 Solución</summary>

La palabra es **`super`**:

```java
public class Gato extends Animal {
    @Override
    public void hacerSonido() {
        super.hacerSonido();   // primero lo del padre
        System.out.println("¡MIAU!");
    }

    public static void main(String[] args) {
        Gato g = new Gato();
        g.hacerSonido();
    }
}
```

Salida:

```
Algún sonido genérico...
¡MIAU!
```

`super.hacerSonido()` ejecuta la versión de `Animal` y luego el `Gato` añade lo suyo. Sin el `super`, el método estaría sobrescrito por completo y la línea del padre no saldría jamás.

</details>

---

## Ejercicio 4: Escribe este programa — la herencia de vehículos

<details>
<summary>🔄 Solución</summary>

```java
public class Vehiculo {
    protected String marca;

    public Vehiculo(String marca) {
        this.marca = marca;
    }
}

public class Coche extends Vehiculo {
    protected int numPuertas;

    public Coche(String marca, int numPuertas) {
        super(marca);
        this.numPuertas = numPuertas;
    }
}

public class Deportivo extends Coche {
    private int velocidadMaxima;

    public Deportivo(String marca, int numPuertas, int velocidadMaxima) {
        super(marca, numPuertas);
        this.velocidadMaxima = velocidadMaxima;
    }

    public static void main(String[] args) {
        Deportivo d = new Deportivo("Ferrari", 2, 340);
        System.out.println(d.marca + " con " + d.numPuertas
                + " puertas y " + d.velocidadMaxima + " km/h");
    }
}
```

La herencia en cadena: `Deportivo` → `Coche` → `Vehiculo`. Cada constructor llama al de su padre con `super(...)`. Por eso `marca` (de `Vehiculo`) y `numPuertas` (de `Coche`) son accesibles en `Deportivo` gracias a `protected`.

</details>

---

## Ejercicio 5: ¿Qué imprime? — polimorfismo con referencias

<details>
<summary>🔄 Solución</summary>

Imprime:

```
Y
Z
Z
```

El tipo de la **referencia** (X, X, Y) no importa. Lo que importa es el tipo **real** del objeto (Y, Z, Z). Java siempre ejecuta el método más específico del objeto real. Es como llevar la chaqueta de tu padre: por fuera pareces tu padre (la referencia), pero por dentro eres tú (el objeto). Cuando hablas, se oye tu voz, no la de tu padre. Dynamic binding en todo su esplendor.

</details>

---

## Ejercicio 6: Escribe este programa — la granja polimórfica

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;

public class Animal {
    public void hacerSonido() { System.out.println("..."); }
}

class Vaca extends Animal {
    @Override public void hacerSonido() { System.out.println("Muuuu"); }
}

class Oveja extends Animal {
    @Override public void hacerSonido() { System.out.println("Beeee"); }
}

class Gallina extends Animal {
    @Override public void hacerSonido() { System.out.println("Cloc cloc"); }
}

public class Granja {
    public static void main(String[] args) {
        ArrayList<Animal> animales = new ArrayList<>();
        animales.add(new Vaca());
        animales.add(new Oveja());
        animales.add(new Gallina());

        for (Animal a : animales) {
            a.hacerSonido();
        }
    }
}
```

Salida:

```
Muuuu
Beeee
Cloc cloc
```

Un solo `ArrayList<Animal>` y un solo bucle: cada animal ejecuta su propia versión gracias al polimorfismo. Sin él, tendrías tres listas separadas. Esto es lo que hace que el polimorfismo valga su peso en oro.

</details>

---

## Ejercicio 7: Encuentra el error — @Override que no lo es

<details>
<summary>🔄 Solución</summary>

La línea que **no compila** es:

```java
@Override
public void nadar() { }   // ✗ ERROR: Animal no tiene nadar()
```

`@Override` le dice al compilador: "verifica que realmente estoy sobrescribiendo un método del padre". Como `Animal` no tiene `nadar()`, el compilador lo avisa en el acto. La otra línea (`hacerSonido()`) sí es un override válido. Ese aviso a tiempo es el regalo de `@Override`: si escribes mal un nombre de método, te entera el compilador, no un bug rarísimo a medianoche.

</details>

---

## Ejercicio 8: Escribe este programa — el perro bien heredado

<details>
<summary>🔄 Solución</summary>

```java
public class Perro extends Animal {
    public Perro(String nombre, int edad) {
        super(nombre, edad);
    }

    public void ladrar() {
        System.out.println(nombre + " dice: ¡Guau!");
    }

    public static void main(String[] args) {
        Perro p = new Perro("Firulais", 3);
        p.ladrar();
    }
}
```

Salida: `Firulais dice: ¡Guau!`

`Perro` puede usar `nombre` y `edad` porque están declarados como `protected` en `Animal`: la herencia los pone a disposición de toda la familia. Si fueran `private`, ni `Perro` los vería. Es como la herencia familiar: lo que es privado en casa de los abuelos, no lo ven ni los nietos.

</details>

---

## Ejercicio 9: ¿Qué imprime? — la cadena de constructores

<details>
<summary>🔄 Solución</summary>

Imprime:

```
Abuelo
Padre
Hijo
```

Al crear un `Hijo` se ejecutan **todos** los constructores de la cadena, del más general al más específico. Como cada constructor llama a `super()` (o Java lo pone automáticamente), primero se construye `Abuelo`, luego `Padre` y por último `Hijo`. Los cimientos antes que el tejado, siempre.

</details>