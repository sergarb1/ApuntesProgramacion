---
title: "Boletín 6 - Inicial: Herencia y Polimorfismo"
nav_order: 6
---
Sin soluciones. La herencia en Java es como la de verdad: a veces te llevas bien con las subclases, a veces quieres renegar de todo.

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

## Ejercicio 2: Encuentra el error — extends mal usado II

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

## Ejercicio 3: Completa el código — instanceof con downcasting

Completa el siguiente programa para que funcione correctamente:

```java
Vehiculo v = new Coche();
if (v ______ Coche) {   // ¿qué va aquí?
    ______ c = (______) v;  // downcasting
    c.conducir();
}
```

Declara las clases `Vehiculo` (con método `mover()`) y `Coche` (con método `conducir()`) para que el código compile.

---

## Ejercicio 4: Escribe este programa — la herencia de vehículos

Crea una jerarquía de 3 niveles usando `extends`:
- `Vehiculo` (atributo: `String marca`)
- `Coche` (atributo: `int numPuertas`)
- `Deportivo` (atributo: `int velocidadMaxima`)

Cada clase debe tener un constructor que reciba sus atributos y use `super`. En `main()`, crea un `Deportivo` de marca "Ferrari", 2 puertas y 340 km/h de velocidad máxima. Imprime sus atributos.

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

¿Qué imprime cada llamada?

---

## Ejercicio 6: Encuentra el error — ClassCastException

```java
Animal a = new Perro();
Gato g = (Gato) a;
g.maullar();
```

Suponiendo que `Perro` y `Gato` extienden `Animal`, y `Gato` tiene método `maullar()`, ¿qué ocurre en tiempo de ejecución? ¿Cómo lo arreglarías?

---

## Ejercicio 7: Escribe este programa — la granja polimórfica

Crea una clase `Animal` con método `hacerSonido()`. Crea `Vaca`, `Oveja` y `Gallina` que lo sobreescriban. En `main()`, crea un `ArrayList<Animal>`, mete una vaca, una oveja y una gallina, recórrelo con un for-each llamando a `hacerSonido()`.

```java
// Salida esperada:
// Muuuu
// Beeee
// Cloc cloc
```

---

## 🔗 Referencias para seguir practicando

- **CodeWars:** [Is this a triangle?](https://www.codewars.com/kata/56606694ec01347ce800001b) (7 kyu)
- **CodeWars:** [Basic subclasses - Adam and Eve](https://www.codewars.com/kata/547274e24481cfc469000416) (8 kyu)
- **AceptaElReto.com:** [120 - Número de pares y nones](https://www.aceptaelreto.com/problem/statement.php?id=120)
- **AceptaElReto.com:** [154 - El ascensor](https://www.aceptaelreto.com/problem/statement.php?id=154)
