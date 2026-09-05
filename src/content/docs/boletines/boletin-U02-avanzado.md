---
title: Boletín U02 — Avanzado
description: Ejercicios de dificultad progresiva para exprimir la unidad
---

# 📝 Boletín U02 — Avanzado

> Dificultad progresiva. ⭐ para calentar, ⭐⭐ para pensar, ⭐⭐⭐ para concursar. Cada ejercicio incluye una pista (resiste a mirarla).

---

## ⭐ Ejercicio 1: calculadora de propinas

Escribe un programa que calcule cuánto dejar de propina en un restaurante. Declara:

- `double totalCuenta = 45.50;`
- `int porcentajePropina = 15;` (el porcentaje, sin el símbolo)

Calcula la propina (`totalCuenta * porcentajePropina / 100`) y el total final (`totalCuenta + propina`). Muestra los tres valores.

**Pista:** cuidado con la división: `porcentajePropina / 100` con enteros da 0. Multiplica primero y divide después, o usa `100.0`.

---

## ⭐ Ejercicio 2: conversor dólar-euro

Declara `final double TASA_CAMBIO = 0.92;` (1 dólar = 0.92 euros). Declara `double dolares = 100.0;` y calcula su equivalente en euros. También haz la conversión inversa: dado `double euros = 50.0;`, calcula cuántos dólares son.

Muestra:

```
100.0$ son 92.0€
50.0€ son 54.347826086956516$
```

**Pista:** para pasar de euros a dólares divides entre la tasa: `euros / TASA_CAMBIO`.

---

## ⭐⭐ Ejercicio 3: ¿Qué imprime? — el casting traidor

Sin ejecutar, escribe la salida exacta:

```java
public class CastingTraidor {
    public static void main(String[] args) {
        int a = 7;
        int b = 2;
        double resultado1 = a / b;
        double resultado2 = (double) a / b;
        double resultado3 = a / (double) b;

        System.out.println(resultado1);
        System.out.println(resultado2);
        System.out.println(resultado3);
        System.out.println(3 + 4 * 2.0);
        System.out.println((int) (3.7 + 2.3));
    }
}
```

**Pista:** fíjate bien en dónde está el casting y en qué momento se aplica la división entera. En `resultado1`, ¿la división se hace antes o después de guardar en el `double`?

---

## ⭐⭐ Ejercicio 4: interés compuesto (sin bucle)

Declara `final double CAPITAL_INICIAL = 1000.0;`, `final double TASA = 0.05;` (5% anual) e `int anios = 3;`. Calcula el capital final después de 3 años usando la fórmula del interés compuesto SIN bucles:

```
capitalFinal = capitalInicial * (1 + tasa)^anios
```

Para la potencia usa `Math.pow(base, exponente)`. Muestra el capital año a año:

```
Año 0: 1000.0€
Año 1: 1050.0€
Año 2: 1102.5€
Año 3: 1157.625€
```

> 💡 **Ojo con la precisión:** en el año 3 tu programa puede imprimir `1157.6250000000002` en vez de `1157.625` por la coma flotante binaria de los `double` (lo veremos en «Atrévete a pensar»). No es un error de tu código.

**Pista:** para mostrar cada año sin bucle, crea tres variables distintas (`capital1`, `capital2`, `capital3`) y usa `Math.pow(1 + TASA, i)` con `i` valiendo 1, 2 y 3.

---

## ⭐⭐⭐ Ejercicio 5: El enigma del post-incremento

Sin ejecutar, determina el valor de cada variable después de ejecutar este código. Escribe el paso a paso:

```java
public class EnigmaIncremento {
    public static void main(String[] args) {
        int x = 3;
        int y = x++ + ++x;
        int z = --y + y-- + x++;
        System.out.println("x = " + x);
        System.out.println("y = " + y);
        System.out.println("z = " + z);
    }
}
```

**Pista:** haz una tabla con los valores de `x` e `y` después de cada operación. `x++` usa y luego incrementa; `++x` incrementa y luego usa.

---

## ⭐⭐ Ejercicio 6: El duelo de dados

Escribe un programa que lance un dado para el usuario (le pide su nombre con `Scanner`) y otro para la máquina (con `Math.random()`). Gana quien saque más. Muestra ambas tiradas y el ganador con un mensaje tipo:

```
Ana saca 4, la máquina saca 6.
Gana la máquina.
```

**Pista:** combina `nextLine()` (nombre), `(int)(Math.random() * 6) + 1` (dados) y un ternario encadenado para el veredicto. Cuidado con el empate.

---

## ⭐⭐ Ejercicio 7: supercalculadora con lógica

Escribe un programa que lea dos números con `Scanner` (`double`) y un carácter de operación (`+`, `-`, `*`, `/`) con `next()`.

Según el operador, muestra el resultado. Si el operador es `/` y el segundo número es 0, muestra "Error: no se puede dividir entre 0". Para cualquier otro carácter, muestra "Operador desconocido".

**Pista:** calcula los resultados posibles en variables y elige con ternarios encadenados o con lógica. Puedes comprobar la división entre 0 con `(op.equals("/") && b == 0)`.

---

## ⭐⭐⭐ Ejercicio 8: CodeWars — Convert boolean values to strings 'Yes' or 'No'

Resuelve la kata **"Convert boolean values to strings 'Yes' or 'No'"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/53369039d7ab3ac506000467).

Completa el método `public static String boolToWord(boolean b)` que devuelva `"Yes"` si recibe `true` y `"No"` si recibe `false`.

**Pista:** se puede hacer en una sola línea con el operador ternario: `b ? "Yes" : "No"`.

---

## ⭐⭐⭐ Ejercicio 9: AceptaElReto — 114 Último dígito del factorial

Resuelve el problema **114 — Último dígito del factorial** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=114).

Dado un número N (0 ≤ N ≤ 1.000.000), calcula el último dígito de N! (factorial de N).

**Pista:** no necesitas calcular el factorial entero. Observa que 5! = 120, 6! = 720, 7! = 5040... a partir de 5, el factorial siempre termina en 0. Solo necesitas manejar los casos pequeños (0 a 4) y los grandes con una sola regla.

---

## ⭐⭐ Ejercicio 10: el ticket de compra con NumberFormat

Escribe un programa llamado `TicketCompra` que simule un ticket de compra con tres productos (Pan, Leche y Huevos, cada uno con su precio y su cantidad). Muestra el ticket usando `NumberFormat` con moneda y locale español para los precios:

```
==========================
    TICKET DE COMPRA
==========================
Pan    2 x 1,20 € = 2,40 €
Leche  3 x 0,95 € = 2,85 €
Huevos 1 x 3,50 € = 3,50 €
--------------------------
TOTAL               = 8,75 €
==========================
```

Requisitos: alinear los nombres a la izquierda, dos decimales en los precios y formatear todos los importes con `NumberFormat.getCurrencyInstance(new Locale("es", "ES"))`.

**Pista:** `NumberFormat` formatea un `double` como moneda con el separador de tu idioma (`1.234,56 €`). Para cada producto calcula el subtotal (`precio * cantidad`) y súmalo al total. El `Locale("es", "ES")` le dice "habla como en España": coma para los decimales y símbolo €.

---

## ⭐⭐⭐ Ejercicio 11: la edad a prueba de bombas

Escribe un programa llamado `EdadSegura` que pida la edad por teclado con `Scanner` y **la repita hasta que el usuario escriba un número entero**. Si el usuario escribe letras o un decimal, el programa debe avisar con "Eso no es un número entero." y volver a preguntar sin romperse (nada de `InputMismatchException`).

Cuando por fin consiga un entero, muestra con `printf`:

```
Genial, 20 años y listo para programar.
```

**Pista:** antes de cada `nextInt()`, pregunta con `sc.hasNextInt()`. Si devuelve `false`, descarta la basura con `sc.next()` y repite. Recuerda: `hasNextInt()` **mira** el siguiente dato sin consumirlo; si no lo descartas, se quedará ahí para siempre.

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
