---
title: "Boletín 5 - Inicial: Visibilidad, Encapsulación y Static"
nav_order: 13
---
Sin soluciones. private no significa que seas tímido, significa que proteges tus datos. Y static no es electricidad estática, es memoria compartida.

---

## Ejercicio 1: Encuentra el error de visibilidad (la nevera)

¿Qué líneas de este código dan error de compilación y por qué?

```java
public class Nevera {
    public String marca;
    protected int capacidadLitros;
    double temperatura;
    private String codigoDesbloqueo;

    public void mostrarInfo() {
        System.out.println(marca);
        System.out.println(capacidadLitros);
        System.out.println(temperatura);
        System.out.println(codigoDesbloqueo);
    }
}

public class Amigo {
    public void abrirNevera() {
        Nevera n = new Nevera();
        System.out.println(n.marca);
        System.out.println(n.capacidadLitros);
        System.out.println(n.temperatura);
        System.out.println(n.codigoDesbloqueo);
    }
}
```

---

## Ejercicio 2: Completa los getters y setters de la clase Producto

Completa la clase `Producto` con encapsulación real:

```java
public class Producto {
    private String nombre;
    private double precio;
    private int stock;

    // Getter para nombre
    public String getNombre() {
        // ¿qué va aquí?
    }

    // Setter para nombre (no puede estar vacío)
    public void setNombre(String nombre) {
        // ¿qué va aquí?
    }

    // Getter para precio
    public double getPrecio() {
        // ¿qué va aquí?
    }

    // Setter para precio (no puede ser negativo)
    public void setPrecio(double precio) {
        // ¿qué va aquí?
    }

    // Getter para stock
    public int getStock() {
        // ¿qué va aquí?
    }

    // Setter para stock (no puede ser negativo)
    public void setStock(int stock) {
        // ¿qué va aquí?
    }

    // Método: vender una cantidad (reduce el stock, solo si hay suficiente)
    public boolean vender(int cantidad) {
        // ¿qué va aquí? (devuelve true si se pudo vender)
    }
}
```

---

## Ejercicio 3: ¿Qué imprime? Static vs instancia II

Sin ejecutar, di qué imprime:

```java
public class Universidad {
    public static String nombreUniversidad = "UAX";
    public String nombreAlumno;

    public Universidad(String nombreAlumno) {
        this.nombreAlumno = nombreAlumno;
    }

    public void mostrar() {
        System.out.println(nombreAlumno + " estudia en " + nombreUniversidad);
    }

    public static void main(String[] args) {
        Universidad u1 = new Universidad("Ana");
        Universidad u2 = new Universidad("Luis");

        u1.mostrar();
        u2.mostrar();

        Universidad.nombreUniversidad = "UPM";

        u1.mostrar();
        u2.mostrar();
    }
}
```

---

## Ejercicio 4: Escribe la clase utilitaria MathUtils

Crea una clase `MathUtils` con constructor privado y métodos estáticos:
- `int maximo(int a, int b)` — devuelve el mayor de dos números
- `int minimo(int a, int b)` — devuelve el menor de dos números
- `boolean esPar(int n)` — devuelve true si n es par

---

## Ejercicio 5: Escribe la clase AppConfig

Crea una clase `AppConfig` con constantes `static final`:
- `NOMBRE_APP = "MiAplicacion"`
- `VERSION = "2.0.0"`
- `MAX_INTENTOS = 3`

Además, un atributo `private static int usuariosConectados` con getter y método `incrementarUsuarios()` / `decrementarUsuarios()`. No se puede instanciar la clase.

---

## Ejercicio 6: AceptaElReto — 117 Encontrar el mayor

Resuelve el problema **117 — Encontrar el mayor** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=117).

Lee números hasta que se introduzca un número igual al número anterior. En ese momento, imprime cuántos números se leyeron en total.

Ejemplo de entrada/salida:
```
1 3 5 7 8 6 3 3 → 8 (porque el 3 se repite como octavo número)
```

> **Pista:** Lleva un contador de números leídos y una variable con el número anterior. Cuando el actual sea igual al anterior, para y muestra el contador.

---

## Ejercicio 7: CodeWars — Opposite number

Resuelve la kata **"Opposite number"** (8 kyu) en CodeWars.

Completa el método `opposite` que recibe un número y devuelve su opuesto (negativo si es positivo, positivo si es negativo).

Crea una clase utilitaria `OppositeNumber` con un método estático:

```java
public class OppositeNumber {
    public static int opposite(int number) {
        // tu código aquí
    }
}
```

Ejemplos: `opposite(5)` → -5, `opposite(-3)` → 3, `opposite(0)` → 0.
