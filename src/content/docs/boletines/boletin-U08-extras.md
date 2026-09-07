---
title: Boletín U08 — Extras
description: CodeWars y AceptaElReto para ir más allá de la unidad
---

# 📝 Boletín U08 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. La solución está oculta: resístete hasta agotar tu pista. Los `private`, los getters y el `static` son aquí los protagonistas: encapsula, protege y comparte sin miedo.

---

## CodeWars

### 1. Playing with cubes II

Te dan un molde de clase `Cube` con un atributo privado `side`. Tu trabajo: construirla con getter y setter, y dos constructores (uno vacío que inicializa `side` a 0, y otro que recibe el lado).

**Ejemplo de uso:**
```java
Cube c = new Cube(3);
c.getSide();  // 3
c.setSide(7);
c.getSide();  // 7
```

- [Enunciado en CodeWars](https://www.codewars.com/kata/55c0ac142326fdf18d0000af)
- Dificultad: 8 kyu

**Pista:** `side` debe ser `private` (nadie lo toca desde fuera) y los únicos portales son `getSide()` y `setSide()`. El constructor sin parámetros pone `this.side = 0;`. Exactamente lo que has visto en la unidad: encapsulación pura.

<details>
<summary>🔄 Solución</summary>

```java
public class Cube {
    private int side;

    public Cube() {
        this.side = 0;
    }

    public Cube(int side) {
        this.side = side;
    }

    public int getSide() {
        return side;
    }

    public void setSide(int side) {
        this.side = side;
    }
}
```

El atributo `side` es `private`: nadie puede hacer `c.side = 9` desde fuera. Los dos constructores dan dos formas de nacer (con o sin valor), y el getter/setter son las únicas puertas. El `this` del setter desambigua el parámetro del atributo, como viste en la unidad.

</details>

---

### 2. Classy Extentions

Crea la clase `Pet` con un atributo privado `name` (String) y un método `speak()` que devuelva el nombre del animal. Después crea la clase `Cat` que **hereda** de `Pet` y sobrescribe `speak()` para que devuelva `"[name] meows."`.

**Ejemplos:**
```java
new Cat("Milo").speak();  // "Milo meows."
new Cat("Garfield").speak();  // "Garfield meows."
```

- [Enunciado en CodeWars](https://www.codewars.com/kata/55a14aa4817efe41c20000bc)
- Dificultad: 8 kyu

**Pista:** `name` es privado, así que `Cat` no puede leerlo directamente: necesita un getter `getName()` en `Pet` (recuerda: los privados no se heredan, pero existen dentro del objeto). `Cat extends Pet` y usa `super(nombre)` para construir la parte del padre.

<details>
<summary>🔄 Solución</summary>

```java
public class Pet {
    private String name;

    public Pet(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String speak() {
        return name;
    }
}

public class Cat extends Pet {
    public Cat(String name) {
        super(name);
    }

    @Override
    public String speak() {
        return getName() + " meows.";
    }
}
```

Fíjate: `Cat` no toca `name` directamente (es privado en `Pet`), usa `getName()`. Eso es el triángulo perfecto: **encapsulación** (privado + getter) + **herencia** (`extends`) + **sobrescritura** (`@Override`). La herencia la profundizas en la U09, pero aquí ya la ves en acción.

</details>

---

### 3. Sleigh Authentication

Papá Noel tiene un método `authenticate(name, password)` y solo admite dos credenciales: el nombre debe ser `"Santa Claus"` y la contraseña `"Ho Ho Ho!"`. Devuelve `true` solo si ambas coinciden.

**Ejemplos:** `authenticate("Santa Claus", "Ho Ho Ho!")` → `true`, `authenticate("Santa", "Ho Ho Ho!")` → `false`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/52adc142b2651f25a8000643)
- Dificultad: 8 kyu

**Pista:** los dos valores son constantes: `private static final String NOMBRE_VALIDO = "Santa Claus";`. Compara con `.equals()`, nunca con `==`. Y nota el `static`: el método no necesita objeto, es pura lógica de clase.

<details>
<summary>🔄 Solución</summary>

```java
public class Sleigh {
    private static final String NOMBRE_VALIDO = "Santa Claus";
    private static final String PASSWORD_VALIDO = "Ho Ho Ho!";

    public boolean authenticate(String name, String password) {
        return NOMBRE_VALIDO.equals(name) && PASSWORD_VALIDO.equals(password);
    }
}
```

Las constantes `static final` son el secreto de la casa: `static` (una sola copia para toda la clase, la viste en el punto 7) y `final` (nadie puede reasignarlas). El `authenticate` combina las dos comprobaciones con `&&`. El `.equals()` se llama sobre la constante, no sobre el parámetro: así `null` nunca rompe el método.

</details>

---

### 4. Object Oriented Piracy

Crea la clase `Ship` que recibe un `draft` (calado) y un `crew` (tripulantes). Implementa `isWorthIt()`: devuelve `true` si el calado total menos `1.5` por cada tripulante supera 20.

**Ejemplo:** `new Ship(15, 10).isWorthIt()` → `false` (`15 - 1.5*10 = 0`).

- [Enunciado en CodeWars](https://www.codewars.com/kata/54fe05c4762e2e3047000add)
- Dificultad: 8 kyu

**Pista:** guarda `draft` y `crew` en atributos `private final` (se fijan en el constructor y ya no cambian). El método combina ambos: `return draft - 1.5 * crew > 20;`. El `1.5` merece ser una constante con nombre.

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

La clase es inmutable: los atributos `final` se fijan al nacer y nadie puede cambiarlos (ni siquiera con un setter, que aquí no existe). La constante `static final` documenta el `1.5`. El barco "sabe" si merece la pena saquearlo sin que nadie lea sus tripas: encapsulación y responsabilidad única.

</details>

---

## AceptaElReto

### 5. 117 — La fiesta aburrida

Tinín odia las fiestas, y cada persona que se le acerca se presenta con el formato `"Soy Lotario"`. Ayúdale a responder `"Hola, [nombre]."` a cada uno. La entrada empieza con un número que indica cuántas personas hay, seguido de una línea por persona. Escribe la solución con una clase `Persona` que guarde el nombre y un método `saludar()`.

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

**Pista:** lee la línea, quita el `"Soy "` inicial (`linea.substring(4)` o `split(" ")[1]`), crea la `Persona` con ese nombre y llama a su `saludar()`. Es una excusa perfecta para una clase con un atributo y un método, en vez de un main que lo hace todo.

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
            String nombre = linea.substring(4);  // quita "Soy "
            Persona p = new Persona(nombre);
            p.saludar();
        }
        sc.close();
    }
}
```

`Persona` encapsula su nombre: `private` + constructor + un método que sabe saludar. El `main` solo se encarga de leer y crear objetos. `linea.substring(4)` se salta los 4 primeros caracteres (`"Soy "`). El `sc.nextLine()` extra tras el `nextInt()` consume el Enter, el clásico del Scanner que viste en la U02.

</details>

---

### 6. 117 bis — La fiesta aburrida con contador estático

Reto extra con `static`: usa la clase `Persona` del ejercicio 5, pero añade un atributo `private static int totalSaludos` que cuente cuántas personas ha saludado Tinín en total. Tras cada saludo, muestra el total acumulado.

**Entrada de ejemplo:**
```
2
Soy Lotario
Soy Ender
```

**Salida de ejemplo:**
```
Hola, Lotario. (saludos: 1)
Hola, Ender. (saludos: 2)
```

**Pista:** `static` significa "de la clase, no del objeto": todos los `Persona` comparten `totalSaludos`. Instruméntalo dentro de `saludar()` con `totalSaludos++`. Así practicas que el contador sube para todos los objetos, como el `Contador` del boletín inicial.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Persona {
    private static int totalSaludos = 0;

    private String nombre;

    public Persona(String nombre) {
        this.nombre = nombre;
    }

    public void saludar() {
        totalSaludos++;
        System.out.println("Hola, " + nombre + ". (saludos: " + totalSaludos + ")");
    }

    public static int getTotalSaludos() {
        return totalSaludos;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.nextLine();

        for (int i = 0; i < n; i++) {
            String linea = sc.nextLine();
            Persona p = new Persona(linea.substring(4));
            p.saludar();
        }
        sc.close();
    }
}
```

`totalSaludos` es `static`: hay una única copia compartida por toda la clase, no una por objeto. Cada `saludar()` lo incrementa y, como todos comparten la misma variable, el contador acumula de verdad. `getTotalSaludos()` es `static` porque la pregunta "¿cuántos saludos en total?" se la haces a la clase, no a una persona concreta.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines la encapsulación, vuelve a los problemas de unidades anteriores y reescríbelos con clases bien blindadas: un `Rectangulo` con su área como método, un `Numero` con su análisis como método... El `private`, los getters y el `static` transforman un script suelto en un diseño. El material no se pierde: se reutiliza.