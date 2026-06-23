---
title: "Boletín 4 - Inicial Resuelto: POO - Clases y Objetos"
nav_order: 11
---
Las soluciones están aquí, esperándote. Pero primero inténtalo. La POO se aprende creando objetos, no leyendo sobre ellos.

---

## Ejercicio 1: Completa la clase Perro

```java
public class Perro {
    String nombre;
    int edad;

    public Perro(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    public void ladrar() {
        System.out.println("Guau, soy " + nombre);
    }

    public void cumplirAnios() {
        edad++;
    }

    public static void main(String[] args) {
        Perro rex = new Perro("Rex", 3);
        rex.ladrar();
        System.out.println("Edad: " + rex.edad);
        rex.cumplirAnios();
        System.out.println("Después de cumple: " + rex.edad);
    }
}
```

> **💡 Explicación:** El constructor `public Perro(String nombre, int edad)` asigna los parámetros a los atributos usando `this` para distinguir entre el parámetro `nombre` y el atributo `this.nombre`. Sin `this`, Java pensaría que son la misma variable (la del parámetro) y no asignaría nada al atributo. El método `cumplirAnios()` simplemente hace `edad++` igual que harías con cualquier variable. Al crear el objeto con `new Perro("Rex", 3)`, se ejecuta el constructor y el perro nace con 3 años. Luego ladra y cumple años como cualquier ser vivo (bueno, los perros no dicen "Guau, soy Rex", pero si lo hicieran, sería exactamente así).

---

## Ejercicio 2: ¿Qué imprime?

```java
public class Coche {
    String marca;
    int velocidad;

    public Coche(String marca) {
        this.marca = marca;
        this.velocidad = 0;
    }

    public void acelerar(int kmh) {
        velocidad += kmh;
    }

    public static void main(String[] args) {
        Coche c = new Coche("Seat");
        c.acelerar(50);
        c.acelerar(30);
        c.acelerar(-10);
        System.out.println(c.marca + " va a " + c.velocidad + " km/h");
    }
}
```

**Salida:** `Seat va a 70 km/h`

> **💡 Explicación:** Creamos un Seat con velocidad 0. Aceleramos +50 → 50. Aceleramos +30 → 80. Aceleramos -10 → 70. El método `acelerar` acepta valores negativos (frenar en realidad). No hay validación que impida ir a velocidad negativa porque no la programamos. Esto es un ejemplo de por qué la encapsulación es importante: cualquiera podría pasar un -500 y el coche iría a -420 km/h... ¿marcha atrás? En el siguiente boletín veremos cómo evitarlo con setters y validación.

---

## Ejercicio 3: Encuentra el error

```java
public class Main {
    public static void main(String[] args) {
        Rectangulo r = Rectangulo(5, 3);  // ERROR: falta 'new'
        System.out.println(r.area());
    }
}
```

**Error:** Falta `new`. Debe ser `new Rectangulo(5, 3)`.

> **💡 Explicación:** En Java, los objetos se crean con `new`. Sin `new`, estás tratando de llamar a un método que no existe (como si `Rectangulo` fuera un método estático). Java se queja: "no sé qué es `Rectangulo(5, 3)`". Es como si dijeras "coche()" en lugar de "coche nuevo()". Sin `new`, el objeto no se crea en memoria. Solo declaras una referencia a nada (null). **Regla de oro:** si quieres un objeto, necesitas `new`. Siempre.

---

## Ejercicio 4: Escribe la clase Persona

```java
public class Persona {
    String nombre;
    int edad;
    String ciudad;

    public Persona(String nombre, int edad, String ciudad) {
        this.nombre = nombre;
        this.edad = edad;
        this.ciudad = ciudad;
    }

    public void saludar() {
        System.out.println("Hola, soy " + nombre + " de " + ciudad);
    }

    public boolean esMayorEdad() {
        return edad >= 18;
    }

    public static void main(String[] args) {
        Persona p1 = new Persona("Ana", 25, "Madrid");
        Persona p2 = new Persona("Luis", 17, "Barcelona");

        p1.saludar();
        System.out.println(p1.nombre + " es mayor? " + p1.esMayorEdad());

        p2.saludar();
        System.out.println(p2.nombre + " es mayor? " + p2.esMayorEdad());
    }
}
```

> **💡 Explicación:** La clase `Persona` encapsula tres datos (nombre, edad, ciudad) y dos comportamientos (saludar, esMayorEdad). Cada objeto `Persona` tiene su propia copia de estos atributos. `p1` y `p2` son independientes: Ana tiene 25 años y es mayor de edad; Luis tiene 17 y no lo es. La POO permite agrupar datos y comportamiento en una misma entidad. Es como tener fichas de personas: cada ficha tiene sus datos y sus acciones. Sin POO, tendrías arrays separados para nombres, edades y ciudades, y funciones sueltas. Con POO, todo está junto y ordenado.

---

## Ejercicio 5: ¿Constructor por defecto?

```java
public class Prueba {
    int x;
    boolean activo;
    String texto;

    public static void main(String[] args) {
        Prueba p = new Prueba();
        System.out.println("x = " + p.x);
        System.out.println("activo = " + p.activo);
        System.out.println("texto = " + p.texto);
    }
}
```

**Salida:**
```
x = 0
activo = false
texto = null
```

> **💡 Explicación:** Cuando no defines ningún constructor, Java te regala uno por defecto (sin parámetros). Ese constructor inicializa los atributos a sus valores por defecto: números a 0, booleanos a false, objetos (como String) a null. Es como cuando abres una caja nueva: está vacía (null), no hay nadie dentro (false) y el contador está a 0. Por eso `x` es 0, `activo` es false y `texto` es null. Si hubieras creado un constructor propio, el constructor por defecto desaparece. Es como si al personalizar tu casa, perdieras la versión básica.

---

## Ejercicio 6: AceptaElReto 291 — Números afortunados

```java
import java.util.Scanner;

public class Problema291 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int casos = sc.nextInt();
        for (int c = 0; c < casos; c++) {
            int n = sc.nextInt();
            int suma = 0;
            while (n > 0) {
                suma += n % 10;
                n /= 10;
            }
            if (suma == 7 || suma % 7 == 0) {
                System.out.println("afortunado");
            } else {
                System.out.println("desafortunado");
            }
        }
    }
}
```

> **💡 Explicación:** Extraemos los dígitos de n con `n % 10` y `n / 10`, los sumamos, y comprobamos si la suma es 7 o múltiplo de 7. Por ejemplo: 16 → 1+6=7 → afortunado. 25 → 2+5=7 → afortunado. 34 → 3+4=7 → afortunado. 10 → 1+0=1 → desafortunado. 7 → 7 → afortunado. Es un problema sencillo de AceptaElReto que combina el bucle de extracción de dígitos con condiciones. Si tu número favorito es el 7, estás de suerte.

---

## Ejercicio 7: CodeWars — Grasshopper - Summation

```java
public class Grasshopper {
    public static int summation(int n) {
        int suma = 0;
        for (int i = 1; i <= n; i++) {
            suma += i;
        }
        return suma;
    }
}
```

> **💡 Explicación:** CodeWars espera el método exacto `public static int summation(int n)`. El método suma del 1 a n con un bucle. También se puede hacer con la fórmula matemática `n * (n + 1) / 2`, que es más eficiente. Pero para un 8 kyu, el bucle está bien. La kata te enseña que CodeWars tiene una firma concreta que debes seguir al pie de la letra. Si el método se llama `summation` y devuelve `int`, no puedes llamarlo `sumar` ni devolver `double`. CodeWars es muy puntilloso con las firmas, como un profesor de lengua con las tildes.
