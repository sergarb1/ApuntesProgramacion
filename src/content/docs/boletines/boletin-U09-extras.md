---
title: Boletín U09 — Extras
description: CodeWars y AceptaElReto para ir más allá de la unidad
---

# 📝 Boletín U09 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. La solución está oculta: resístete hasta agotar tu pista. CodeWars y AceptaElReto son los gimnasios donde los programadores se retan a diario: aquí es donde la herencia deja de ser teoría y se convierte en reflejos.

---

## CodeWars

### 1. Thinkful — Object Drills: Quarks

Crea la clase `Quark` con tres propiedades: `color` (String), `flavor` (String) y `baryon_number` (siempre `1.0`). Además:
- Constructor que recibe `color` y `flavor`.
- `interact(otro)` → intercambia los colores de los dos quarks.

**Ejemplo:**
```java
Quark q1 = new Quark("red", "up");
Quark q2 = new Quark("blue", "strange");
q1.interact(q2);
q1.color;  // "blue"
q2.color;  // "red"
q1.baryon_number;  // 1.0
```

- [Enunciado en CodeWars](https://www.codewars.com/kata/5882b052bdeafec15e0000e6)
- Dificultad: 7 kyu

**Pista:** `baryon_number` es una constante que todos los quarks comparten: `public final double baryon_number = 1.0;`. `interact()` usa una variable temporal para intercambiar: `String temp = this.color; this.color = otro.color; otro.color = temp;`. El `this` desambigua quién es quién en el intercambio.

<details>
<summary>🔄 Solución</summary>

```java
public class Quark {
    public String color;
    public String flavor;
    public final double baryon_number = 1.0;

    public Quark(String color, String flavor) {
        this.color = color;
        this.flavor = flavor;
    }

    public void interact(Quark otro) {
        String temporal = this.color;
        this.color = otro.color;
        otro.color = temporal;
    }
}
```

La física de quarks aplicada: `baryon_number` es `final` porque ningún quark cambia su número bariónico (es una constante universal). `interact()` intercambia los colores con una variable temporal; sin ella, uno de los dos colores se perdería. Este es el clásico "swap" que ya viste con variables, ahora entre dos objetos.

</details>

---

### 2. Building blocks

Crea la clase `Block` que recibe las tres dimensiones (como `int[]` de 3 o como 3 enteros) y los métodos:
- `int getWidth()`, `int getLength()`, `int getHeight()`
- `int getVolume()` → `width * length * height`
- `int getSurfaceArea()` → `2 * (w*l + w*h + l*h)`

**Ejemplo:** `new Block(new int[]{2, 4, 6})` → volumen 48, superficie `2*(2*4 + 2*6 + 4*6) = 88`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/55b75fcf67e558d3750000a3)
- Dificultad: 7 kyu

**Pista:** guarda las tres dimensiones en atributos privados en el constructor, y deja que los getters las devuelvan. Para la superficie, la fórmula es la suma de las tres caras por dos. El polimorfismo no aparece aquí, pero el objeto con estado y comportamiento sí: la excusa perfecta para repasar la U07 mientras piensas en la herencia.

<details>
<summary>🔄 Solución</summary>

```java
public class Block {
    private final int width;
    private final int length;
    private final int height;

    public Block(int[] dimensiones) {
        this.width = dimensiones[0];
        this.length = dimensiones[1];
        this.height = dimensiones[2];
    }

    public int getWidth() {
        return width;
    }

    public int getLength() {
        return length;
    }

    public int getHeight() {
        return height;
    }

    public int getVolume() {
        return width * length * height;
    }

    public int getSurfaceArea() {
        return 2 * (width * length + width * height + length * height);
    }
}
```

El objeto `Block` guarda su estado y lo expone con getters. Los atributos `final` se fijan en el constructor (un bloque no cambia de forma). El volumen y la superficie son métodos que calculan a partir del estado. Es un objeto con responsabilidad única: sabe sus dimensiones y cómo medirse. La herencia del curso llegará cuando quieras especializarlo en `Cubo` o `Caja` sin duplicar código.

</details>

---

### 3. Basic subclasses — Adam and Eve

Según el mito, Adam y Eva fueron los primeros humanos. Tu trabajo es "hacer el trabajo de Dios": crear un método estático `create()` que devuelva un array de `Human` con dos objetos: el primero un `Man` y el segundo una `Woman`. Ambas clases heredan de `Human`, y cada humano tiene `name`, `sex` y la propiedad `species` con valor `"Human"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/547274e24481cfc469000416)
- Dificultad: 8 kyu

**Pista:** herencia pura: `class Man extends Human` y `class Woman extends Human`. Cada subclase llama a `super(...)` para rellenar el nombre y el sexo. El array de retorno es de tipo `Human`, así que acepta ambas subclases.

<details>
<summary>🔄 Solución</summary>

```java
public class Human {
    private String name;
    private String sex;
    protected String species = "Human";

    public Human(String name, String sex) {
        this.name = name;
        this.sex = sex;
    }

    public String getName() {
        return name;
    }

    public String getSex() {
        return sex;
    }

    public String getSpecies() {
        return species;
    }
}

class Man extends Human {
    public Man(String name) {
        super(name, "man");
    }
}

class Woman extends Human {
    public Woman(String name) {
        super(name, "woman");
    }
}

public class God {
    public static Human[] create() {
        return new Human[] { new Man("Adam"), new Woman("Eve") };
    }
}
```

`Man` y `Woman` heredan todo de `Human` y solo aportan su constructor con el sexo fijo. `create()` devuelve un array de `Human` (el tipo general) relleno con las dos subclases: polimorfismo de arriba abajo, como Adam y Eva en el Paraíso.

</details>

---

### 4. Object Oriented Piracy

Crea la clase `Ship` que recibe un `draft` (calado) y un `crew` (tripulantes). Implementa `isWorthIt()`: devuelve `true` si el calado total menos `1.5` por cada tripulante supera 20.

**Ejemplo:** `new Ship(15, 10).isWorthIt()` → `false` (`15 - 1.5*10 = 0`).

- [Enunciado en CodeWars](https://www.codewars.com/kata/54fe05c4762e2e3047000add)
- Dificultad: 8 kyu

**Pista:** guarda `draft` y `crew` en atributos `private final`. El método combina ambos: `return draft - 1.5 * crew > 20;`. Es la clase de objeto simple que ya manejas: una excusa para repasar que el estado vive en el objeto, no en el main.

<details>
<summary>🔄 Solución</summary>

```java
public class Ship {
    private static final double PESO_TRIPULANTE = 1.5;

    private final double draft;
    private final int crew;

    public Ship(double draft, int crew) {
        this.draft = draft;
        this.crew = crew;
    }

    public boolean isWorthIt() {
        return draft - PESO_TRIPULANTE * crew > 20;
    }
}
```

Cada `Ship` guarda su propio estado (`draft` y `crew`) y decide por sí mismo si merece la pena. Los atributos `final` hacen el objeto inmutable: se fijan al nacer. La constante `static final` documenta el `1.5`. Es el mismo patrón de objeto con comportamiento que has practicado toda la unidad.

</details>

---

## AceptaElReto

### 5. 117 — La fiesta aburrida

Tinín odia las fiestas, y cada persona que se le acerca se presenta con el formato `"Soy Lotario"`. Ayúdale a responder `"Hola, [nombre]."` a cada uno. La entrada empieza con un número que indica cuántas personas hay, seguido de una línea por persona. Resuélvelo con una clase `Persona` que encapsule el nombre y un método `saludar()`.

**Entrada de ejemplo:**
```
3
Soy Lotario
Soy Aldonza
Soy Ender
```

**Salida de ejemplo:**
```
Hola, Lotario.
Hola, Aldonza.
Hola, Ender.
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=117)
- Dificultad: Fácil

**Pista:** lee la línea y quita el `"Soy "` inicial con `linea.substring(4)` o `split(" ")[1]`. Crea la `Persona` con ese nombre y llama a `saludar()`. Es la excusa perfecta para ver que un objeto con un método puede sustituir a un main que hace de todo.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Persona {
    private String nombre;

    public Persona(String nombre) {
        this.nombre = nombre;
    }

    public void saludar() {
        System.out.println("Hola, " + nombre + ".");
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.nextLine();  // consume el salto de línea

        for (int i = 0; i < n; i++) {
            String linea = sc.nextLine();
            Persona p = new Persona(linea.substring(4));
            p.saludar();
        }
        sc.close();
    }
}
```

`Persona` encapsula su nombre y sabe saludar: el `main` solo lee y crea objetos. `linea.substring(4)` se salta `"Soy "`. Es la forma "orientada a objetos" de resolver un problema que también podrías hacer con un `String` suelto: aquí el estado (el nombre) y el comportamiento (`saludar()`) viven juntos en la clase.

</details>

---

### 6. 119 — Escudos del ejército romano

Un general divide sus legionarios en formaciones **cuadradas** (lo más grande posible), repitiendo con los que queden libres hasta agotarlos. Cada cuadrado de lado `n` necesita escudos según el perímetro más la cobertura: los legionarios del borde llevan más escudos que los del interior. Para un cuadrado de `n × n`, los escudos son `n² + 4n` (una base por soldado más el perímetro exterior). Dado el número de legionarios, calcula el mínimo de escudos necesarios.

**Entrada:** varios casos de prueba, cada uno con el número de legionarios. Termina con `0`.

**Entrada de ejemplo:**
```
35
20
10
0
```

**Salida de ejemplo:**
```
71
44
26
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=119)
- Dificultad: Fácil/Media

**Pista:** mientras queden legionarios, encuentra el mayor cuadrado `n` tal que `n² <= restantes` (prueba `n` creciente o usa `Math.sqrt`). Suma los escudos de ese cuadrado y resta `n²` de los restantes. Encapsula la lógica en una clase `Formacion` con métodos como `mayorCuadrado()` y `calcularEscudos()`.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Formacion {
    public static int escudosDeCuadrado(int lado) {
        return lado * lado + 4 * lado;
    }

    public static int mayorCuadrado(int restantes) {
        int n = (int) Math.sqrt(restantes);
        return n * n;  // el mayor cuadrado perfecto <= restantes
    }

    public static int resolver(int legionarios) {
        int escudos = 0;
        int restantes = legionarios;

        while (restantes > 0) {
            int cuadrado = mayorCuadrado(restantes);
            int lado = (int) Math.sqrt(cuadrado);
            escudos += escudosDeCuadrado(lado);
            restantes -= cuadrado;
        }
        return escudos;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        while (n != 0) {
            System.out.println(resolver(n));
            n = sc.nextInt();
        }
        sc.close();
    }
}
```

Verifícalo con 35: el mayor cuadrado es 25 (lado 5) → `25 + 20 = 45` escudos; quedan 10, mayor cuadrado 9 (lado 3) → `9 + 12 = 21`; queda 1 (lado 1) → `1 + 4 = 5`. Total `45 + 21 + 5 = 71` ✓. `Math.sqrt` te da la raíz; al truncar obtienes el lado del mayor cuadrado que cabe. La clase agrupa los tres cálculos como métodos estáticos: pura lógica bien empaquetada.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines la herencia, vuelve a los problemas de las unidades anteriores y reescríbelos con jerarquías: un `Lector` abstracto, un `Solucionador` polimórfico, figuras que se calculan solas. El material no se pierde: se reutiliza.