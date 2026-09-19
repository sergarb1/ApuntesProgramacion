---
title: "Boletín U11 — Inicial Resuelto"
description: "Los mismos ejercicios que el boletín inicial, con soluciones"
---

# 📝 Boletín U11 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: ¿Qué imprime? — ArrayList remove por índice vs valor

<details>
<summary>🔄 Solución</summary>

Imprime **`[A, C, D]`**.

- `lista.remove(1)` borra por **índice**: quita el `"B"` de la posición 1 → `[A, C, B, D]`.
- `lista.remove("B")` borra por **objeto**: busca el primer `"B"` que quede → `[A, C, D]`.

El primero mira posiciones; el segundo, contenidos. Como el `Integer` tiene sobrecargas (`remove(int)` vs `remove(Object)`), esta distinción es la trampa favorita de los exámenes.

</details>

---

## Ejercicio 2: Encuentra el error — size() vs length vs length()

<details>
<summary>🔄 Solución</summary>

Las tres líneas tienen error:

- **Línea 1:** un `ArrayList` pregunta su tamaño con `size()`, no con `.length` (eso es para arrays).
- **Línea 2:** un array usa `.length` (sin paréntesis), no `.size()`.
- **Línea 3:** un `String` usa `.length()` (con paréntesis, es un método).

Regla mnemotécnica: colección → `size()`, array → `length`, String → `length()`.

</details>

---

## Ejercicio 3: Completa el código — for-each que suma una lista

<details>
<summary>🔄 Solución</summary>

```java
int suma = 0;
for (Integer n : numeros) {   // o int n, con unboxing automático
    suma += n;
}
```

La suma final es **22** (4 + 9 + 2 + 7). El hueco inicial era `0` (empezar acumulando desde cero), el tipo era `Integer` (o `int`, y el unboxing hace el resto) y el operador, `+=`.

</details>

---

## Ejercicio 4: Escribe este programa — la lista de la compra

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;

public class ListaCompra {
    public static void main(String[] args) {
        ArrayList<String> compra = new ArrayList<>();
        compra.add("Leche");       // [Leche]
        compra.add("Pan");         // [Leche, Pan]
        compra.add("Huevos");      // [Leche, Pan, Huevos]
        compra.add(1, "Café");     // [Leche, Café, Pan, Huevos]

        System.out.println("Tamaño: " + compra.size());   // 4

        compra.remove(2);          // quita "Pan" → [Leche, Café, Huevos]

        for (String articulo : compra) {
            System.out.println(articulo);
        }
    }
}
```

`add(e)` añade al final, `add(i, e)` se cuela en la posición `i` desplazando al resto, y `remove(i)` quita por índice. Ojo: después de insertar `"Café"` en la posición 1, el `"Pan"` pasa a la posición 2, así que `remove(2)` lo quita a él.

</details>

---

## Ejercicio 5: ¿Qué imprime? — el HashSet que no deja repetir

<details>
<summary>🔄 Solución</summary>

Imprime **`2`** y **`true`**.

El segundo `add("Ana")` no falla ni avisa: simplemente devuelve `false` y no añade nada, porque el `HashSet` ya contiene a "Ana" (compara con `hashCode()` y `equals()`). Por eso `size()` es 2 (solo Ana y Bob) y `contains("Bob")` es `true`.

</details>

---

## Ejercicio 6: Escribe este programa — sin duplicados

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;
import java.util.LinkedHashSet;

public class SinDuplicados {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        nombres.add("Ana");
        nombres.add("Bob");
        nombres.add("Ana");
        nombres.add("Carla");
        nombres.add("Bob");
        nombres.add("Diego");
        nombres.add("Ana");
        nombres.add("Eva");

        LinkedHashSet<String> sinRepetir = new LinkedHashSet<>(nombres);

        System.out.println("Lista:    " + nombres);
        System.out.println("Conjunto: " + sinRepetir);
    }
}
```

La lista imprime los 8 elementos con sus repetidos; el conjunto, solo 5: `Ana`, `Bob`, `Carla`, `Diego` y `Eva`. El `LinkedHashSet` elimina los duplicados **y** conserva el orden de primera aparición. Con un `HashSet` a secas, el orden de salida sería impredecible.

</details>

---

## Ejercicio 7: Completa el código — tu primera clase genérica

<details>
<summary>🔄 Solución</summary>

```java
public class Caja<T> {
    private T contenido;

    public void guardar(T contenido) {
        this.contenido = contenido;
    }

    public T sacar() {
        return contenido;
    }
}
```

El parámetro de tipo `<T>` se declara junto al nombre de la clase y se usa como un tipo más dentro de ella. `Caja<int>` no compila porque los genéricos solo aceptan tipos referencia: `int` es un primitivo, así que toca usar `Caja<Integer>` y dejar que el autoboxing convierta solo.

</details>

---

## Ejercicio 8: ¿Qué imprime? — HashMap con put repetido

<details>
<summary>🔄 Solución</summary>

Imprime **`30`** y **`2`**.

- `put("Ana", 10)` y luego `put("Ana", 30)`: la clave "Ana" se sobrescribe con el último valor.
- Por eso `size()` es 2, no 3: las claves son únicas y "Ana" solo cuenta una vez.

</details>

---

## Ejercicio 9: Escribe este programa — contador de palabras con HashMap

<details>
<summary>🔄 Solución</summary>

```java
import java.util.HashMap;
import java.util.Map;

public class ContadorPalabras {
    public static void main(String[] args) {
        String[] palabras = {"hola", "mundo", "hola", "java", "mundo", "hola", "adios"};

        HashMap<String, Integer> contador = new HashMap<>();
        for (String p : palabras) {
            contador.put(p, contador.getOrDefault(p, 0) + 1);
        }

        for (Map.Entry<String, Integer> entrada : contador.entrySet()) {
            System.out.println(entrada.getKey() + " → " + entrada.getValue());
        }
    }
}
```

El patrón de las frecuencias: `getOrDefault(p, 0) + 1` devuelve la cuenta actual (o 0 la primera vez) y suma 1. `entrySet()` te da cada palabra con su contador en un solo bucle, sin un `get` extra.

</details>
