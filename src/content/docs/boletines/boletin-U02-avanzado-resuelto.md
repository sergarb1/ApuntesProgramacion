---
title: Boletín U02 — Avanzado Resuelto
description: Los mismos ejercicios que el boletín avanzado, con soluciones
---

# 📝 Boletín U02 — Avanzado (Resuelto)

> Las soluciones están ocultas. Inténtalo de verdad antes de destaparlas.

---

## ⭐ Ejercicio 1: calculadora de propinas

<details>
<summary>🔄 Solución</summary>

```java
public class Propinas {
    public static void main(String[] args) {
        double totalCuenta = 45.50;
        int porcentajePropina = 15;

        double propina = totalCuenta * porcentajePropina / 100;
        double totalFinal = totalCuenta + propina;

        System.out.println("Total cuenta: " + totalCuenta + "€");
        System.out.println("Propina (" + porcentajePropina + "%): " + propina + "€");
        System.out.println("Total a pagar: " + totalFinal + "€");
    }
}
```

La clave: `totalCuenta * porcentajePropina / 100` multiplica primero (45.50 * 15 = 682.5) y divide después por 100 → 6.825. Si hubieras escrito `porcentajePropina / 100`, habrías hecho división entera (15/100 = 0) y la propina habría salido 0. Orden y división entera: las dos trampas del punto 3.

</details>

---

## ⭐ Ejercicio 2: conversor dólar-euro

<details>
<summary>🔄 Solución</summary>

```java
public class ConversorMoneda {
    public static void main(String[] args) {
        final double TASA_CAMBIO = 0.92;

        double dolares = 100.0;
        double euros = dolares * TASA_CAMBIO;

        double eurosInverso = 50.0;
        double dolaresInverso = eurosInverso / TASA_CAMBIO;

        System.out.println(dolares + "$ son " + euros + "€");
        System.out.println(eurosInverso + "€ son " + dolaresInverso + "$");
    }
}
```

Salida:

```
100.0$ son 92.0€
50.0€ son 54.347826086956516$
```

Para pasar de dólares a euros multiplicas por la tasa; al revés, divides. El `final` garantiza que nadie (ni tú) toque la tasa de cambio sin querer.

</details>

---

## ⭐⭐ Ejercicio 3: ¿Qué imprime? — el casting traidor

<details>
<summary>🔄 Solución</summary>

```
3.0
3.5
3.5
11.0
6
```

Línea a línea:

- `resultado1 = a / b` → primero divide enteros (7/2 = 3) y luego guarda en `double`: **3.0**.
- `resultado2 = (double) a / b` → castin a `a` a 7.0 antes de dividir: **3.5**.
- `resultado3 = a / (double) b` → castin a `b` a 2.0: **3.5**.
- `3 + 4 * 2.0` → la multiplicación manda y el `2.0` arrastra a decimal: `3 + 8.0` = **11.0**.
- `(int) (3.7 + 2.3)` → primero suma (6.0), luego trunca: **6**.

</details>

---

## ⭐⭐ Ejercicio 4: interés compuesto (sin bucle)

<details>
<summary>🔄 Solución</summary>

```java
public class InteresCompuesto {
    public static void main(String[] args) {
        final double CAPITAL_INICIAL = 1000.0;
        final double TASA = 0.05;

        double capital1 = CAPITAL_INICIAL * Math.pow(1 + TASA, 1);
        double capital2 = CAPITAL_INICIAL * Math.pow(1 + TASA, 2);
        double capital3 = CAPITAL_INICIAL * Math.pow(1 + TASA, 3);

        System.out.println("Año 0: " + CAPITAL_INICIAL + "€");
        System.out.println("Año 1: " + capital1 + "€");
        System.out.println("Año 2: " + capital2 + "€");
        System.out.println("Año 3: " + capital3 + "€");
    }
}
```

`Math.pow(1 + TASA, i)` calcula `(1.05)^i`. Con tres variables distintas evitas el bucle... que llegará en la U03. Fíjate en que `Math.pow` devuelve un `double`.

> 💡 **Detalle de precisión:** en el año 3 tu programa puede imprimir `1157.6250000000002` en vez de `1157.625`. Es la coma flotante binaria del punto "Atrévete a pensar" (los decimales no siempre se representan exactos). No es un error: es así como funcionan los `double`.

</details>

---

## ⭐⭐⭐ Ejercicio 5: El enigma del post-incremento

<details>
<summary>🔄 Solución</summary>

El programa imprime:

```
x = 6
y = 6
z = 19
```

Paso a paso:

- `int x = 3;` → x = 3.
- `int y = x++ + ++x;` → `x++` usa 3 y deja x = 4; `++x` sube x a 5 y usa 5. `y = 3 + 5 = 8`. Ahora x = 5, y = 8.
- `int z = --y + y-- + x++;` → `--y` baja y a 7 y usa 7; `y--` usa 7 y baja y a 6; `x++` usa 5 y sube x a 6. `z = 7 + 7 + 5 = 19`. Final: x = 6, y = 6, z = 19.

> 💡 **Confesión honesta:** si al hacerlo te salió otro número, bienvenido al club: este ejercicio existe precisamente para que sufras una vez en clase y no veinte en el examen. La lección del punto 3: los `++` y `--` se usan solos, en su propia línea.

</details>

---

## ⭐⭐ Ejercicio 6: El duelo de dados

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class DueloDados {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("¿Cómo te llamas? ");
        String nombre = sc.nextLine();

        int dadoUsuario = (int) (Math.random() * 6) + 1;
        int dadoMaquina = (int) (Math.random() * 6) + 1;

        System.out.println(nombre + " saca " + dadoUsuario + ", la máquina saca " + dadoMaquina + ".");

        String ganador = dadoUsuario > dadoMaquina ? "Gana " + nombre + "." :
                         dadoUsuario < dadoMaquina ? "Gana la máquina." : "Empate.";
        System.out.println(ganador);

        sc.close();
    }
}
```

Aquí no hay problema de Enter residual: el `nextLine()` va antes del `nextInt()` (que ni siquiera usamos). Los dados usan la fórmula `(int)(Math.random() * 6) + 1`, y el ternario encadenado decide el ganador en tres casos.

</details>

---

## ⭐⭐ Ejercicio 7: supercalculadora con lógica

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class SuperCalculadora {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Primer número: ");
        double a = sc.nextDouble();

        System.out.print("Segundo número: ");
        double b = sc.nextDouble();

        System.out.print("Operación (+, -, *, /): ");
        String op = sc.next();

        double suma = a + b;
        double resta = a - b;
        double multi = a * b;

        String resultado = op.equals("+") ? "Resultado: " + suma :
                           op.equals("-") ? "Resultado: " + resta :
                           op.equals("*") ? "Resultado: " + multi :
                           op.equals("/") && b != 0 ? "Resultado: " + (a / b) :
                           op.equals("/") ? "Error: no se puede dividir entre 0" :
                           "Operador desconocido";

        System.out.println(resultado);

        sc.close();
    }
}
```

La lógica del ternario encadenado: primero comprueba si el operador es `/` y además `b` no es 0; si el operador es `/` pero `b` es 0, cae en el mensaje de error. Fíjate en `op.equals("/")`: los `String` siempre se comparan con `.equals()`. Los operadores lógicos y relacionales unen todas las condiciones.

</details>

---

## ⭐⭐⭐ Ejercicio 8: CodeWars — Convert boolean values to strings 'Yes' or 'No'

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String boolToWord(boolean b) {
        return b ? "Yes" : "No";
    }
}
```

Una línea. El ternario devuelve `"Yes"` si el booleano es `true` y `"No"` si es `false`. Elegante, como un esmoquin para tu código.

</details>

---

## ⭐⭐⭐ Ejercicio 9: AceptaElReto — 114 Último dígito del factorial

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class UltimoDigitoFactorial {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int casos = sc.nextInt();

        for (int i = 0; i < casos; i++) {
            int n = sc.nextInt();
            int ultimo;
            if (n >= 5) {
                ultimo = 0;
            } else if (n == 0 || n == 1) {
                ultimo = 1;
            } else if (n == 2) {
                ultimo = 2;
            } else if (n == 3) {
                ultimo = 6;
            } else {
                ultimo = 4; // 4! = 24
            }
            System.out.println(ultimo);
        }
        sc.close();
    }
}
```

La clave matemática: 5! = 120, y a partir de ahí cualquier factorial multiplica por 5 (y antes por un número par), así que **siempre termina en 0**. Solo hay que memorizar los casos pequeños: 0! y 1! son 1, 2! = 2, 3! = 6, 4! = 24. Si intentaras calcular `1000000!`, tu programa reventaría: por eso la trampa del enunciado es que "parece que hay que calcular el factorial". No hace falta.

</details>

---

## ⭐⭐ Ejercicio 10: el ticket de compra con NumberFormat

<details>
<summary>🔄 Solución</summary>

```java
import java.text.NumberFormat;
import java.util.Locale;

public class TicketCompra {
    public static void main(String[] args) {
        NumberFormat moneda = NumberFormat.getCurrencyInstance(new Locale("es", "ES"));

        double precioPan = 1.20;
        double precioLeche = 0.95;
        double precioHuevos = 3.50;

        double subtotalPan = precioPan * 2;
        double subtotalLeche = precioLeche * 3;
        double subtotalHuevos = precioHuevos * 1;
        double total = subtotalPan + subtotalLeche + subtotalHuevos;

        System.out.println("==========================");
        System.out.println("    TICKET DE COMPRA");
        System.out.println("==========================");
        System.out.println("Pan    2 x " + moneda.format(precioPan) + " = " + moneda.format(subtotalPan));
        System.out.println("Leche  3 x " + moneda.format(precioLeche) + " = " + moneda.format(subtotalLeche));
        System.out.println("Huevos 1 x " + moneda.format(precioHuevos) + " = " + moneda.format(subtotalHuevos));
        System.out.println("--------------------------");
        System.out.println("TOTAL               = " + moneda.format(total));
        System.out.println("==========================");
    }
}
```

`NumberFormat.getCurrencyInstance(new Locale("es", "ES"))` formatea cualquier `double` como moneda española: `1.234,56 €`. Como los tres subtotales se calculan con `precio * cantidad` antes de sumarlos, el total es exacto y sin errores de redondeo acumulados. Este ejercicio te deja listo para el punto 7 en el examen: separadores de miles y moneda en un solo objeto.

</details>

---

## ⭐⭐⭐ Ejercicio 11: la edad a prueba de bombas

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class EdadSegura {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int edad = -1;

        while (edad == -1) {
            System.out.print("¿Cuántos años tienes? ");
            if (sc.hasNextInt()) {
                edad = sc.nextInt();
            } else {
                System.out.println("Eso no es un número entero.");
                sc.next();
            }
        }

        System.out.printf("Genial, %d años y listo para programar.%n", edad);
        sc.close();
    }
}
```

El bucle `while` repite la pregunta hasta que el usuario da un entero. `hasNextInt()` mira si el siguiente dato es un entero sin consumirlo; si no lo es, `sc.next()` se traga la basura y el bucle vuelve a preguntar. Así el programa es **a prueba de bombas**: no importa cuántas veces el usuario escriba "hola" o "3.14", nunca saltará la `InputMismatchException`.

</details>

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 114 — Último dígito del factorial | Fácil |
| AceptaElReto | 148 — Nochevieja | Fácil |
| AceptaElReto | 217 — ¿Qué lado de la calle? | Fácil |
| CodeWars | Will you make it? (8 kyu) | Principiante |
| CodeWars | Convert boolean to Yes/No (8 kyu) | Principiante |
| CodeWars | Keep Hydrated (8 kyu) | Principiante |
| CodeWars | Get the Middle Character (7 kyu) | Intermedio |
