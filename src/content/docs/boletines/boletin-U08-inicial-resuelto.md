---
title: Boletín U08 — Inicial Resuelto
description: Los mismos ejercicios que el boletín inicial, con soluciones
---

# 📝 Boletín U08 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: La casa de cristal

<details>
<summary>🔄 Solución</summary>

```java
public class Persona {
    private String nombre;
    private int edad;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public static void main(String[] args) {
        Persona p = new Persona();
        p.setNombre("Ana");
        p.setEdad(25);
        System.out.println(p.getNombre() + " tiene " + p.getEdad() + " años.");
    }
}
```

Los atributos pasan a `private` y todo el acceso se hace con getters y setters. El `this` en los setters desambigua: el parámetro se asigna al atributo, no a sí mismo.

</details>

---

## Ejercicio 2: El coche del vecindario

<details>
<summary>🔄 Solución</summary>

```java
public class Coche {
    private String marca;
    private double velocidad;

    public Coche(String marca) {
        this.marca = marca;
        this.velocidad = 0;
    }

    public String getMarca() {
        return marca;
    }

    public double getVelocidad() {
        return velocidad;
    }

    public void setVelocidad(double velocidad) {
        if (velocidad >= 0 && velocidad <= 200) {
            this.velocidad = velocidad;
        } else {
            System.out.println("Velocidad inválida.");
        }
    }

    public static void main(String[] args) {
        Coche c = new Coche("Seat");
        c.setVelocidad(-50);
        c.setVelocidad(120);
        System.out.println("Velocidad: " + c.getVelocidad());
    }
}
```

Salida: `Velocidad inválida.` (por el -50) y luego `Velocidad: 120.0`. El setter valida antes de tocar el atributo: es la frontera que protege el estado del objeto.

</details>

---

## Ejercicio 3: El termómetro con cerebro

<details>
<summary>🔄 Solución</summary>

```java
public class Termometro {
    private double temperatura;

    public Termometro() {
        temperatura = 20.0;
    }

    public double getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(double temperatura) {
        if (temperatura >= -273.15 && temperatura <= 100.0) {
            this.temperatura = temperatura;
        } else {
            System.out.println("Temperatura fuera de rango.");
        }
    }

    public static void main(String[] args) {
        Termometro t = new Termometro();
        t.setTemperatura(-500);
        t.setTemperatura(36.5);
        System.out.println("Temperatura: " + t.getTemperatura());
    }
}
```

Salida: `Temperatura fuera de rango.` y luego `Temperatura: 36.5`. El setter convierte la clase en un "termómetro con cerebro": no acepta cualquier número, solo valores físicamente posibles.

</details>

---

## Ejercicio 4: getter sin setter

<details>
<summary>🔄 Solución</summary>

```java
public class Configuracion {
    private String idioma;

    public Configuracion(String idioma) {
        this.idioma = idioma;
    }

    public String getIdioma() {
        return idioma;
    }

    public static void main(String[] args) {
        Configuracion config = new Configuracion("es");
        System.out.println("Idioma: " + config.getIdioma());
    }
}
```

No tiene setter porque el idioma es una decisión de una sola vez: se elige en el constructor y ya. Si alguien intentase `config.idioma = "va"` desde fuera, **no compilaría**: `idioma` es `private`, y fuera de la clase no se puede tocar. Obligar a que el cambio pase por un setter (o a que no exista) es la esencia de la encapsulación.

</details>

---

## Ejercicio 5: El contador de la clase

<details>
<summary>🔄 Solución</summary>

```java
public class Contador {
    public static int total = 0;

    public Contador() {
        total++;
    }

    public static void main(String[] args) {
        Contador c1 = new Contador();
        Contador c2 = new Contador();
        Contador c3 = new Contador();
        System.out.println("Total: " + Contador.total);
    }
}
```

`total` vale **3**. Es `static`: una sola copia compartida por toda la clase. Cada `new` llama al constructor y lo incrementa; como los tres objetos comparten la misma variable, el contador cuenta los tres. No es 1 porque no hay una copia por objeto: hay una única copia de clase.

</details>

---

## Ejercicio 6: La calculadora sin pilas

<details>
<summary>🔄 Solución</summary>

```java
public class Utilidades {
    public static int sumar(int a, int b) {
        return a + b;
    }

    public static int restar(int a, int b) {
        return a - b;
    }

    public static void main(String[] args) {
        System.out.println(Utilidades.sumar(5, 3));
        System.out.println(Utilidades.restar(10, 4));
    }
}
```

Salida: `8` y `6`. Como los métodos son `static`, se llaman con el nombre de la clase (`Utilidades.sumar`), sin `new` y sin objeto. Es el mismo patrón que ya usas con `Math.sqrt` o `Integer.parseInt`.

</details>

---

## Ejercicio 7: las constantes del barrio

<details>
<summary>🔄 Solución</summary>

```java
public class Constantes {
    public static final double IVA = 0.21;
    public static final int MAX_INTENTOS_LOGIN = 3;
    public static final String NOMBRE_APP = "GestionCurso";

    public static void main(String[] args) {
        System.out.println("IVA: " + Constantes.IVA);
        System.out.println("Máximo intentos: " + Constantes.MAX_INTENTOS_LOGIN);
        System.out.println("App: " + Constantes.NOMBRE_APP);
        // Constantes.IVA = 0.5; // Error de compilación
    }
}
```

Al intentar `Constantes.IVA = 0.5;` el compilador lo **prohíbe**: `final` significa que el valor no se puede reasignar después de su declaración. Las constantes son a prueba de bombas, por eso van en MAÚSCULAS con `_`: todo el mundo sabe que no se tocan.

</details>

---

## Ejercicio 8: ¿Qué imprime? — el puzle estático

<details>
<summary>🔄 Solución</summary>

Imprime **`1 2 2`**.

`Puzle.s` es `static`: una sola copia compartida. Con el primer `new`, `s` pasa a 1 y `p1.i` se copia ese 1. Con el segundo `new`, `s` pasa a 2 y `p2.i` se copia ese 2. Al final, `p1.i` = 1, `p2.i` = 2 y `Puzle.s` = 2. El estático sube para todos; el de instancia se congela con el valor que tenía la clase en el momento de nacer.

</details>

---

## Ejercicio 9: CodeWars — Square(n) Sum

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int squareSum(int[] n) {
        int suma = 0;
        for (int i = 0; i < n.length; i++) {
            suma += n[i] * n[i];
        }
        return suma;
    }
}
```

Para `[1, 2, 2]` → `1 + 4 + 4 = 9`. El bucle recorre cada elemento y acumula `n[i] * n[i]`. Nota el `static`: CodeWars exige el método estático para poder llamarlo sin crear objetos, justo lo que acabas de practicar.

</details>