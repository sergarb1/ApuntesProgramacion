---
title: "Boletín 2 - Intermedio: Variables y Operadores"
nav_order: 7
---
De menos a más. De ⭐ a ⭐⭐⭐. De variables sencillas a operaciones que te harán bizco.

---

## ⭐ Ejercicio 1: Calculadora de propinas

Escribe un programa que calcule cuánto dejar de propina en un restaurante. Declara:

- `double totalCuenta = 45.50;`
- `int porcentajePropina = 15;` (porcentaje, sin el símbolo)

Calcula la propina (`totalCuenta * porcentajePropina / 100`) y el total final (`totalCuenta + propina`). Muestra todo con 2 decimales aproximados.

Salida esperada:
```
Total cuenta: 45.5€
Propina (15%): 6.825€
Total a pagar: 52.325€
```

---

## ⭐ Ejercicio 2: Conversor dólar-euro

Declara `final double TASA_CAMBIO = 0.92;` (1 dólar = 0.92 euros). Declara `double dolares = 100.0;` y calcula su equivalente en euros. También haz la conversión inversa: dado `double euros = 50.0;`, calcula cuántos dólares son.

Muestra:
```
100.0$ son 92.0€
50.0€ son 54.34782608695652$
```

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

Fíjate bien en dónde está el casting y en qué momento se aplica la división entera.

---

## ⭐⭐ Ejercicio 4: Interés compuesto (sin bucle)

Declara `final double CAPITAL_INICIAL = 1000.0;`, `final double TASA = 0.05;` (5% anual) e `int anios = 3;`. Calcula el capital final después de 3 años usando la fórmula del interés compuesto SIN bucles:

```
capitalFinal = capitalInicial * (1 + tasa)^anios
```

Para la potencia, usa `Math.pow(base, exponente)`. Muestra el capital año a año:

```
Año 0: 1000.0€
Año 1: 1050.0€
Año 2: 1102.5€
Año 3: 1157.625€
```

Para mostrar cada año, necesitarás calcular `Math.pow(1 + TASA, i)` para cada valor de `i` de 1 a 3... pero sin bucle. Crea tres variables distintas.

---

## ⭐⭐⭐ Ejercicio 5: El enigma del post-incremento

Sin ejecutar, determina el valor de cada variable después de ejecutar este código. Escribe el paso a paso.

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

Pista: haz una tabla con los valores de x, y después de cada operación. `x++` usa x y luego incrementa; `++x` incrementa y luego usa x.

---

## ⭐⭐⭐ Ejercicio 6: CodeWars — Convert boolean values to strings 'Yes' or 'No'

Resuelve la kata **"Convert boolean values to strings 'Yes' or 'No'"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/53369039d7ab3ac506000467).

Completa el método `public static String boolToWord(boolean b)` que devuelva `"Yes"` si recibe `true` y `"No"` si recibe `false`. Se puede hacer en una línea con el operador ternario.

---

## ⭐⭐⭐ Ejercicio 7: AceptaElReto — 114 Último dígito del factorial

Resuelve el problema **114 — Último dígito del factorial** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=114).

Dado un número N (0 ≤ N ≤ 1.000.000), calcula el último dígito de N! (factorial de N). Pista: no necesitas calcular el factorial entero. ¿Qué pasa con el último dígito cuando multiplicas por 10? ¿Y cuándo N ≥ 5? Observa que 5! = 120, 6! = 720... a partir de 5, el factorial siempre termina en 0.

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 114 — Último dígito del factorial | Fácil |
| AceptaElReto | 140 — Suma de dígitos | Medio |
| AceptaElReto | 152 — Números de pares | Fácil |
| CodeWars | Even or Odd (8 kyu) | Principiante |
| CodeWars | Opposite number (8 kyu) | Principiante |
| CodeWars | Convert boolean to Yes/No (8 kyu) | Principiante |
