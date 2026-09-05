---
title: "Boletín U10 — Inicial Resuelto"
description: "Los mismos ejercicios que el boletín inicial, con soluciones"
---

# 📝 Boletín U10 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: ¿Qué imprime? — ArrayList remove por índice vs valor

<details>
<summary>🔄 Solución</summary>

Imprime **`[A, C, D]`**.

Paso a paso:

- `lista.remove(1)` borra por **índice**: se va el `"B"` de la posición 1 → `[A, C, B, D]`.
- `lista.remove("B")` borra por **objeto**: busca la primera aparición de `"B"` y la borra → `[A, C, D]`.

El primer `remove` borra el `"B"` de la posición 1 (el primero). Cuando después llamas a `remove("B")`, ese `"B"` ya no está, pero queda el `"B"` que estaba en la posición 3 (el cuarto elemento), que ahora es el primero que encuentra: lo borra. Resultado final `[A, C, D]`.

</details>

---

## Ejercicio 2: Encuentra el error — size() vs length vs length()

<details>
<summary>🔄 Solución</summary>

Las **líneas 1 y 2 tienen error**, la 3 es correcta:

- `nombres.length` → las colecciones usan `size()` como método. `ArrayList` no tiene `length`. → **Error**.
- `edades.size()` → los arrays usan `length` como atributo, sin paréntesis. → **Error**.
- `saludo.length` → los `String` usan `length()` como método, con paréntesis. → **Correcta**.

Regla de oro: **array → `length`; `String` → `length()`; colecciones → `size()`.** Confundirlos es la trampa favorita de los exámenes.

</details>

---

## Ejercicio 3: Completa el código — for-each que suma una lista

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;

public class SumaLista {
    public static void main(String[] args) {
        ArrayList<Integer> numeros = new ArrayList<>();
        numeros.add(4);
        numeros.add(9);
        numeros.add(2);
        numeros.add(7);

        int suma = 0;
        for (Integer n : numeros) {
            suma += n;
        }

        System.out.println("Suma: " + suma);
    }
}
```

Los huecos: `0`, `Integer n` y `+=`. El for-each recorre cada elemento de la lista y lo acumula en `suma`. Resultado: `Suma: 22`.

</details>

---

## Ejercicio 4: Escribe este programa — la lista de la compra

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;

public class Compra {
    public static void main(String[] args) {
        ArrayList<String> compra = new ArrayList<>();
        compra.add("Leche");
        compra.add("Pan");
        compra.add("Huevos");

        compra.add(1, "Café");       // [Leche, Café, Pan, Huevos]

        System.out.println("Tamaño: " + compra.size()); // 4

        compra.remove(2);            // se va "Pan" → [Leche, Café, Huevos]

        for (String item : compra) {
            System.out.println(item);
        }
    }
}
```

Salida:

```
Tamaño: 4
Leche
Café
Huevos
```

`add(1, "Café")` inserta en la posición 1 y desplaza al resto; `remove(2)` borra por índice (el tercer elemento, "Pan").

</details>

---

## Ejercicio 5: ¿Qué imprime? — el ArrayList misterioso

<details>
<summary>🔄 Solución</summary>

Imprime **`10 15 30`**.

- `add(10)`, `add(20)`, `add(30)` → `[10, 20, 30]`.
- `add(1, 15)` inserta el 15 en la posición 1 y desplaza → `[10, 15, 20, 30]`.
- `remove(Integer.valueOf(20))` borra el **objeto** 20 (no el índice 2) → `[10, 15, 30]`.

`remove(Integer.valueOf(20))` no es lo mismo que `remove(2)`: el primero borra el objeto cuyo valor es 20; el segundo borra la posición 2 (que ahora ocupa el 20, casualidad). Aquí los dos coinciden en el resultado, pero por motivos distintos. Si la lista hubiera sido `[10, 20, 15, 20]`, `remove(Integer.valueOf(20))` borraría el primer 20 y `remove(2)` borraría el 15.

</details>

---

## Ejercicio 6: Escribe este programa — ¿está en la lista?

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;
import java.util.Scanner;

public class BuscarNombre {
    public static void main(String[] args) {
        ArrayList<String> nombres = new ArrayList<>();
        nombres.add("Ana");
        nombres.add("Bob");
        nombres.add("Carla");
        nombres.add("David");
        nombres.add("Eva");

        Scanner sc = new Scanner(System.in);
        System.out.print("Introduce un nombre: ");
        String buscado = sc.nextLine();

        int pos = nombres.indexOf(buscado);
        if (pos >= 0) {
            System.out.println("Sí, está en la posición " + pos);
        } else {
            System.out.println("No está");
        }
        sc.close();
    }
}
```

`indexOf` devuelve la posición de la primera aparición, o `-1` si no existe. Comparar con `>= 0` es el patrón clásico para "¿está?".

</details>

---

## Ejercicio 7: Escribe este programa — el mayor de la lista

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;

public class MayorLista {
    public static int mayor(ArrayList<Integer> notas) {
        int max = notas.get(0);
        for (int i = 1; i < notas.size(); i++) {
            if (notas.get(i) > max) {
                max = notas.get(i);
            }
        }
        return max;
    }

    public static void main(String[] args) {
        ArrayList<Integer> notas = new ArrayList<>();
        notas.add(6);
        notas.add(8);
        notas.add(5);
        notas.add(9);

        System.out.println("La mayor es: " + mayor(notas)); // 9
    }
}
```

El patrón del "máximo acumulado": asumes que el primero es el mayor y, si aparece uno más grande, lo sustituyes. El bucle empieza en `i = 1` porque el candidato inicial ya es `notas.get(0)`.

</details>

---

## Ejercicio 8: Encuentra el error — ArrayList<int> no compila

<details>
<summary>🔄 Solución</summary>

No compila porque **los genéricos solo aceptan objetos, y `int` es un primitivo**. `ArrayList<int>` no existe. La solución es usar la clase wrapper `Integer`:

```java
import java.util.ArrayList;

public class Error {
    public static void main(String[] args) {
        ArrayList<Integer> numeros = new ArrayList<>();
        numeros.add(5);
        numeros.add(10);
        System.out.println(numeros.get(0) + numeros.get(1)); // 15
    }
}
```

El **autoboxing** convierte automáticamente el `int` 5 en un `Integer` al añadirlo, y el **unboxing** lo convierte de vuelta a `int` al sumar. Tú no escribes nada de eso: Java lo hace solo.

</details>

---

## Ejercicio 9: Escribe este programa — posición y valor

<details>
<summary>🔄 Solución</summary>

```java
import java.util.ArrayList;

public class PosicionValor {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>();
        for (int i = 1; i <= 5; i++) {
            lista.add(i);
        }

        for (int i = 0; i < lista.size(); i++) {
            System.out.println("Posición " + i + " → " + lista.get(i));
        }
    }
}
```

Salida:

```
Posición 0 → 1
Posición 1 → 2
Posición 2 → 3
Posición 3 → 4
Posición 4 → 5
```

El primer bucle rellena la lista con `add(i)`; el segundo la recorre con el for clásico y lee cada posición con `get(i)`. Ojo: `add(i)` con `i` desde 1 añade al final los valores 1 a 5; `get(i)` recupera por índice.

</details>