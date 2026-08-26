---
title: Boletín U06 — Avanzado Resuelto
description: Los mismos ejercicios que el boletín avanzado, con soluciones
---

# 📝 Boletín U06 — Avanzado (Resuelto)

> Las soluciones están ocultas. Inténtalo de verdad antes de destaparlas.

---

## ⭐ Ejercicio 1: La biblioteca

<details>
<summary>🔄 Solución</summary>

```java
public class Libro {
    String titulo;
    String autor;
    int paginas;

    public Libro(String titulo, String autor, int paginas) {
        this.titulo = titulo;
        this.autor = autor;
        this.paginas = paginas;
    }

    void mostrarInfo() {
        System.out.println(titulo + ", de " + autor + " (" + paginas + " páginas)");
    }

    public static void main(String[] args) {
        Libro quijote = new Libro("El Quijote", "Miguel de Cervantes", 863);
        Libro java = new Libro("Java", "Sergi", 100);
        quijote.mostrarInfo();
        java.mostrarInfo();
    }
}
```

Tres atributos, tres asignaciones con `this`, un método que los combina. Dos libros, dos objetos, dos salidas independientes.

</details>

---

## ⭐ Ejercicio 2: El rectángulo razonador

<details>
<summary>🔄 Solución</summary>

```java
public class Rectangulo {
    double ancho;
    double alto;

    public Rectangulo(double ancho, double alto) {
        this.ancho = ancho;
        this.alto = alto;
    }

    double calcularArea() {
        return ancho * alto;
    }

    double calcularPerimetro() {
        return 2 * (ancho + alto);
    }

    boolean esCuadrado() {
        return ancho == alto;
    }

    public static void main(String[] args) {
        Rectangulo cuadrado = new Rectangulo(4, 4);
        Rectangulo rectangulo = new Rectangulo(5, 8);

        System.out.println("Cuadrado: área " + cuadrado.calcularArea()
                + ", perímetro " + cuadrado.calcularPerimetro()
                + ", ¿es cuadrado? " + cuadrado.esCuadrado());
        System.out.println("Rectángulo: área " + rectangulo.calcularArea()
                + ", perímetro " + rectangulo.calcularPerimetro()
                + ", ¿es cuadrado? " + rectangulo.esCuadrado());
    }
}
```

Salida:

```
Cuadrado: área 16.0, perímetro 16.0, ¿es cuadrado? true
Rectángulo: área 40.0, perímetro 26.0, ¿es cuadrado? false
```

Tres métodos que *devuelven* valores. Fíjate: `esCuadrado()` convierte una comparación en un booleano de un solo `return`. Objetos que razonan, no solo que muestran.

</details>

---

## ⭐ Ejercicio 3: La cuenta bancaria blindada

<details>
<summary>🔄 Solución</summary>

```java
public class CuentaBancaria {
    String titular;
    double saldo;

    public CuentaBancaria(String titular, double saldo) {
        this.titular = titular;
        this.saldo = saldo;
    }

    void ingresar(double cantidad) {
        this.saldo += cantidad;
    }

    void retirar(double cantidad) {
        if (cantidad <= this.saldo) {
            this.saldo -= cantidad;
        } else {
            System.out.println("Saldo insuficiente");
        }
    }

    void mostrar() {
        System.out.println("Titular: " + titular + " | Saldo: " + saldo + " €");
    }

    public static void main(String[] args) {
        CuentaBancaria cuenta = new CuentaBancaria("Ana", 100);
        cuenta.retirar(30);
        cuenta.retirar(200);
        cuenta.mostrar();
    }
}
```

Salida:

```
Saldo insuficiente
Titular: Ana | Saldo: 70 €
```

El `if` de `retirar` es el guardián: la retirada de 200 € se rechaza porque supera el saldo, y la cuenta nunca queda en negativo. Un objeto que se protege a sí mismo.

</details>

---

## ⭐⭐ Ejercicio 4: La hora que se corrige sola

<details>
<summary>🔄 Solución</summary>

```java
public class Hora {
    int hora;
    int minuto;
    int segundo;

    public Hora(int hora, int minuto, int segundo) {
        if (hora < 0 || hora > 23) {
            hora = 0;
        }
        if (minuto < 0 || minuto > 59) {
            minuto = 0;
        }
        if (segundo < 0 || segundo > 59) {
            segundo = 0;
        }
        this.hora = hora;
        this.minuto = minuto;
        this.segundo = segundo;
    }

    void incrementarSegundo() {
        segundo++;
        if (segundo == 60) {
            segundo = 0;
            minuto++;
            if (minuto == 60) {
                minuto = 0;
                hora++;
                if (hora == 24) {
                    hora = 0;
                }
            }
        }
    }

    void mostrar() {
        String h = hora < 10 ? "0" + hora : "" + hora;
        String m = minuto < 10 ? "0" + minuto : "" + minuto;
        String s = segundo < 10 ? "0" + segundo : "" + segundo;
        System.out.println(h + ":" + m + ":" + s);
    }

    public static void main(String[] args) {
        Hora h = new Hora(23, 59, 59);
        h.incrementarSegundo();
        h.mostrar();
    }
}
```

Salida: `00:00:00`

Tres niveles de validación en el constructor y tres acarreos encadenados en `incrementarSegundo()`. De 23:59:59 pasa a 00:00:00: la hora se corrige sola porque cada unidad sabe cuándo resetear y avisar a la siguiente.

</details>

---

## ⭐⭐ Ejercicio 5: ¿Qué imprime? — el baile de referencias

<details>
<summary>🔄 Solución</summary>

Imprime:

```
a.x = 10
c.x = 99
```

**Primera parte:** `b = a` copia la *referencia*, no el objeto. `b.x = 10` modifica el mismo objeto que ve `a`, así que `a.x` también es 10.

**Segunda parte:** al llamar a `cambiar(c)`, el parámetro `p` recibe una *copia* de la referencia. `p.x = 99` modifica el objeto original (por eso `c.x` es 99). Pero `p = new Punto(50, 50)` solo reasigna la copia local: el objeto de `c` no cambia y el nuevo `Punto` se pierde al terminar el método. En Java las referencias se pasan por valor.

</details>

---

## ⭐⭐ Ejercicio 6: El correo que se encadena

<details>
<summary>🔄 Solución</summary>

```java
public class Email {
    String remitente;
    String destinatario;
    String asunto;

    public Email(String remitente, String destinatario, String asunto) {
        this.remitente = remitente;
        this.destinatario = destinatario;
        this.asunto = asunto;
    }

    public Email(String remitente, String destinatario) {
        this(remitente, destinatario, "(sin asunto)");
    }

    public Email(String remitente) {
        this(remitente, "(sin destino)");
    }

    void mostrar() {
        System.out.println("De: " + remitente + " | Para: " + destinatario + " | Asunto: " + asunto);
    }

    public static void main(String[] args) {
        Email completo = new Email("ana@gmail.com", "luis@gmail.com", "Tarea Java");
        Email medio = new Email("ana@gmail.com", "luis@gmail.com");
        Email corto = new Email("ana@gmail.com");

        completo.mostrar();
        medio.mostrar();
        corto.mostrar();
    }
}
```

Salida:

```
De: ana@gmail.com | Para: luis@gmail.com | Asunto: Tarea Java
De: ana@gmail.com | Para: luis@gmail.com | Asunto: (sin asunto)
De: ana@gmail.com | Para: (sin destino) | Asunto: (sin asunto)
```

Los dos constructores cortos delegan en el largo con `this(...)`. La asignación completa se escribe **una sola vez**; los valores por defecto se rellenan en el encadenamiento. Eso es sobrecarga sin duplicar código.

</details>

---

## ⭐⭐ Ejercicio 7: La fracción que se simplifica

<details>
<summary>🔄 Solución</summary>

```java
public class Fraccion {
    int numerador;
    int denominador;

    public Fraccion(int numerador, int denominador) {
        if (denominador == 0) {
            denominador = 1;
        }
        this.numerador = numerador;
        this.denominador = denominador;
    }

    Fraccion sumar(Fraccion otra) {
        int num = this.numerador * otra.denominador + otra.numerador * this.denominador;
        int den = this.denominador * otra.denominador;
        return new Fraccion(num, den);
    }

    void simplificar() {
        int mcd = mcd(Math.abs(numerador), Math.abs(denominador));
        numerador /= mcd;
        denominador /= mcd;
    }

    int mcd(int a, int b) {
        while (b != 0) {
            int resto = a % b;
            a = b;
            b = resto;
        }
        return a == 0 ? 1 : a;
    }

    void mostrar() {
        System.out.println(numerador + "/" + denominador);
    }

    public static void main(String[] args) {
        Fraccion unMedio = new Fraccion(1, 2);
        Fraccion unTercio = new Fraccion(1, 3);
        Fraccion suma = unMedio.sumar(unTercio);
        suma.simplificar();
        suma.mostrar();
    }
}
```

Salida: `5/6`

`sumar(Fraccion otra)` usa `this` para el primer sumando y `otra.` para el segundo, y devuelve una **fracción nueva** (no toca a ninguna de las dos). `simplificar()` sí modifica el objeto (por eso es `void`). Euclides con módulos encuentra el MCD en pocas vueltas.

</details>

---

## ⭐⭐⭐ Ejercicio 8: CodeWars — Building blocks

<details>
<summary>🔄 Solución</summary>

```java
public class Block {
    private int width;
    private int length;
    private int height;

    public Block(int[] dimensions) {
        this.width = dimensions[0];
        this.length = dimensions[1];
        this.height = dimensions[2];
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

    public static void main(String[] args) {
        Block bloque = new Block(new int[]{2, 4, 6});
        System.out.println("Volumen: " + bloque.getVolume());
        System.out.println("Superficie: " + bloque.getSurfaceArea());
    }
}
```

Salida:

```
Volumen: 48
Superficie: 88
```

Los getters devuelven cada atributo, y los dos métodos calculados combinan los tres. La superficie es cada par de caras multiplicado y sumado, todo por dos. La kata acepta también tres enteros por separado en el constructor.

</details>

---

## ⭐⭐⭐ Ejercicio 9: AceptaElReto — 100 Constante de Kaprekar

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Arrays;
import java.util.Scanner;

public class Kaprekar {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int casos = sc.nextInt();

        for (int i = 0; i < casos; i++) {
            int numero = sc.nextInt();
            System.out.println(iteraciones(numero));
        }
        sc.close();
    }

    static int iteraciones(int numero) {
        if (numero == 6174) {
            return 0;
        }
        if (esRepdigit(numero)) {
            return 8;
        }

        int vueltas = 0;
        int actual = numero;
        while (actual != 6174) {
            actual = pasoKaprekar(actual);
            vueltas++;
        }
        return vueltas;
    }

    static boolean esRepdigit(int numero) {
        String s = String.format("%04d", numero);
        char primera = s.charAt(0);
        for (char c : s.toCharArray()) {
            if (c != primera) {
                return false;
            }
        }
        return true;
    }

    static int pasoKaprekar(int numero) {
        String s = String.format("%04d", numero);
        char[] asc = s.toCharArray();
        Arrays.sort(asc);
        char[] desc = new char[4];
        for (int i = 0; i < 4; i++) {
            desc[i] = asc[3 - i];
        }

        int mayor = Integer.parseInt(new String(desc));
        int menor = Integer.parseInt(new String(asc));
        return mayor - menor;
    }
}
```

Para 3524, el `while` da: 3524 → 3087 → 8352 → 6174, tres vueltas. `%04d` rellena con ceros a la izquierda (necesario para números como 3087). `esRepdigit` devuelve `false` en cuanto encuentra un dígito distinto. Este es un problema estupendo para probar tu clase `Numero` con métodos separados.

</details>

---

> 📚 **¿Quieres más?** Revisa el boletín de **extras** de esta unidad: tiene cuatro katas de CodeWars (incluida una de depuración de una clase) y dos problemas de AceptaElReto.
