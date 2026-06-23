---
title: "Boletín 8 - Inicial Resuelto: Arrays y Colecciones"
nav_order: 8
---
*Con soluciones. A aprender.*

---

## Ejercicio 1: ¿Qué imprime? — Array básico

```java
int[] nums = {1, 2, 3, 4, 5};
for (int i = 0; i < nums.length; i++) {
    nums[i] = nums[i] * 2;
}
System.out.println(nums[3]);
```

**Solución:** Imprime `8`.

> **💡 Explicación:** El array original es {1, 2, 3, 4, 5}. El bucle multiplica cada elemento por 2: {2, 4, 6, 8, 10}. `nums[3]` es el cuarto elemento (recuerda: los índices empiezan en 0). Así que `nums[3] = 8`.

---

## Ejercicio 2: Encuentra el error — ArrayIndexOutOfBounds

```java
String[] nombres = new String[3];
nombres[0] = "Ana";
nombres[1] = "Bob";
nombres[2] = "Carlos";
nombres[3] = "Diana";
```

**Solución:** La última línea lanza `ArrayIndexOutOfBoundsException`. El array tiene tamaño 3, los índices válidos son 0, 1 y 2. `nombres[3]` está fuera de los límites.

> **💡 Explicación:** Los arrays en Java tienen tamaño fijo. Si declaras `new String[3]`, las plazas son 0, 1 y 2. Intentar acceder a la 3 es como intentar aparcar en una plaza que no existe: el parking solo tiene 3 plazas (índices 0, 1, 2) y tú buscas la 3. Crash asegurado.

---

## Ejercicio 3: Completa el código — for-each

```java
int[] numeros = {4, 7, 2, 9, 5};
int suma = 0;

for (int n : numeros) {
    suma += n;
}

System.out.println("Suma: " + suma);
```

**Solución:** `int n : numeros` y `suma += n`. La suma total es 27.

> **💡 Explicación:** El for-each (o "enhanced for") recorre cada elemento del array sin necesidad de índice. `int n` toma el valor de cada elemento en cada iteración. `suma += n` es equivalente a `suma = suma + n`. Es más limpio que el for tradicional cuando solo necesitas leer y no modificar.

---

## Ejercicio 4: Escribe este programa — Array de 10 enteros al revés

```java
public class ArrayInverso {
    public static void main(String[] args) {
        int[] numeros = new int[10];
        for (int i = 0; i < numeros.length; i++) {
            numeros[i] = i + 1;
        }
        for (int i = numeros.length - 1; i >= 0; i--) {
            System.out.print(numeros[i] + " ");
        }
    }
}
```

Salida: `10 9 8 7 6 5 4 3 2 1`

> **💡 Explicación:** Dos bucles: uno para rellenar (del 1 al 10) y otro para imprimir al revés (del índice 9 al 0). El truco está en `numeros.length - 1` como índice inicial (último elemento) y `i >= 0` como condición (incluir el primero). Es como leer una lista del final al principio.

---

## Ejercicio 5: ¿Qué imprime? — ArrayList misterioso

```java
import java.util.ArrayList;

public class Test {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>();
        lista.add(10);
        lista.add(20);
        lista.add(30);
        lista.add(1, 15);         // inserta 15 en índice 1
        lista.remove(Integer.valueOf(20));  // borra el objeto 20

        for (Integer n : lista) {
            System.out.print(n + " ");
        }
    }
}
```

**Solución:** Imprime `10 15 30`.

> **💡 Explicación:** Paso a paso: `add(10)` → [10], `add(20)` → [10, 20], `add(30)` → [10, 20, 30], `add(1, 15)` → [10, **15**, 20, 30] (inserta, no reemplaza), `remove(Integer.valueOf(20))` → [10, 15, 30] (borra la primera ocurrencia del valor 20). Fíjate que `remove(1)` (con int) borraría por índice, pero `remove(Integer.valueOf(1))` (con Integer) borra por valor.

---

## Ejercicio 6: Encuentra el error — colección sin genérico

```java
ArrayList lista = new ArrayList();
lista.add("Hola");
lista.add(42);
lista.add(3.14);

String texto = (String) lista.get(1);  // 💥 ClassCastException
```

**Solución:** `lista.get(1)` devuelve el `Integer 42` (por el autoboxing), pero intentas castearlo a `String`. Como un `Integer` no es un `String`, salta `ClassCastException` en tiempo de ejecución.

> **💡 Explicación:** Sin genéricos, `ArrayList` es una caja de caos donde todo es `Object`. El compilador no te avisa. Te enteras cuando el programa ya está ejecutándose y explota. Con genéricos: `ArrayList<String>` solo acepta Strings, y el error saltaría en compilación. Los genéricos convierten errores de runtime en errores de compilación, que es donde queremos que estén.

---

## Ejercicio 7: Escribe este programa — HashSet sin duplicados

```java
import java.util.HashSet;
import java.util.Scanner;

public class SinDuplicados {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        HashSet<String> palabras = new HashSet<>();

        System.out.println("Introduce 5 palabras:");
        for (int i = 0; i < 5; i++) {
            System.out.print("Palabra " + (i + 1) + ": ");
            String p = sc.nextLine();
            palabras.add(p);
        }

        System.out.println("Palabras distintas: " + palabras.size());
        System.out.println("Contenido: " + palabras);
        sc.close();
    }
}
```

> **💡 Explicación:** `HashSet` no permite duplicados. Si el usuario introduce "hola" dos veces, la segunda llamada a `add("hola")` simplemente no hace nada y devuelve `false`. Al final, `size()` te dice cuántas palabras distintas hay. Es el mecanismo más sencillo para eliminar duplicados en Java: deja que `HashSet` haga el trabajo sucio.

---

## 🔗 Referencias para seguir practicando

- **CodeWars:** [Convert number to reversed array of digits](https://www.codewars.com/kata/5583090cbe83f4fd8c000051) (8 kyu)
- **CodeWars:** [Find the smallest integer in the array](https://www.codewars.com/kata/55a2d7ebe362532a0a000018) (7 kyu)
- **AceptaElReto.com:** [100 - Kaprekar](https://www.aceptaelreto.com/problem/statement.php?id=100)
- **AceptaElReto.com:** [152 - Suma pares e impares](https://www.aceptaelreto.com/problem/statement.php?id=152)
