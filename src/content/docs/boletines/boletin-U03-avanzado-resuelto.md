---
title: Boletín U03 — Avanzado Resuelto
description: Los mismos ejercicios que el boletín avanzado, con soluciones
---

# 📝 Boletín U03 — Avanzado (Resuelto)

> Las soluciones están ocultas. Inténtalo de verdad antes de destaparlas.

---

## ⭐ Ejercicio 1: La calculadora de notas

<details>
<summary>🔄 Solución</summary>

```java
public class CalculadoraNotas {
    public static void main(String[] args) {
        double nota = 8.7;

        if (nota < 0 || nota > 10) {
            System.out.println("Nota inválida");
        } else if (nota >= 9) {
            System.out.println("Sobresaliente");
        } else if (nota >= 7) {
            System.out.println("Notable");
        } else if (nota >= 5) {
            System.out.println("Aprobado");
        } else {
            System.out.println("Suspenso");
        }
    }
}
```

Salida: `Notable`

El primer `if` caza las notas imposibles (negativas o mayores de 10) y la cascada siguiente evalúa de la más exigente a la más permisiva. Con 8.7, el `>= 7` gana y da "Notable".

</details>

---

## ⭐ Ejercicio 2: El menú que no se rinde

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class MenuTenaz {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int opcion = 0;

        do {
            System.out.println("1. Jugar  2. Salir");
            System.out.print("Elige: ");
            opcion = sc.nextInt();
        } while (opcion != 1 && opcion != 2);

        System.out.println("Has elegido la opción " + opcion + ".");
        sc.close();
    }
}
```

El `do-while` garantiza que el menú se muestre al menos una vez. Mientras la opción no sea 1 ni 2, el bucle insiste. El usuario puede ser tonto todo lo que quiera; el menú no se rinde.

</details>

---

## ⭐⭐ Ejercicio 3: ¿Qué imprime? — la pirámide

<details>
<summary>🔄 Solución</summary>

```
*
**
***
****
```

En total **10 asteriscos** (1 + 2 + 3 + 4). El bucle interior (`col <= fila`) imprime tantos asteriscos como el número de fila. El corazón de los bucles anidados: el interior depende del exterior.

</details>

---

## ⭐⭐ Ejercicio 4: La escalera de números

<details>
<summary>🔄 Solución</summary>

```java
public class Escalera {
    public static void main(String[] args) {
        for (int fila = 1; fila <= 4; fila++) {
            for (int num = 1; num <= fila; num++) {
                System.out.print(num + " ");
            }
            System.out.println();
        }
    }
}
```

El interior imprime del 1 al número de fila con `print` (sin salto de línea); el `println()` vacío salta al terminar cada fila. La escalera completa:

```
1
1 2
1 2 3
1 2 3 4
```

</details>

---

## ⭐⭐⭐ Ejercicio 5: ¿Qué imprime? — break, continue y la etiqueta

<details>
<summary>🔄 Solución</summary>

```
11 12 13 21 22 23 31 41
```

Tabla de pares, en orden de ejecución:

| i | j | ¿Qué pasa? | ¿Imprime? |
|---|---|---|---|
| 1 | 1 | `1*1=1 < 8`, no hay `continue` | `11` |
| 1 | 2 | `j==2 && i>=3` → no; `1*2=2 < 8` | `12` |
| 1 | 3 | `1*3=3 < 8` | `13` |
| 2 | 1 | `2*1=2 < 8` | `21` |
| 2 | 2 | `j==2 && i>=3` → no (i=2); `2*2=4 < 8` | `22` |
| 2 | 3 | `2*3=6 < 8` | `23` |
| 3 | 1 | `3*1=3 < 8` | `31` |
| 3 | 2 | `j==2 && i>=3` → **sí** → `continue exterior` | nada |
| 4 | 1 | `4*1=4 < 8` | `41` |
| 4 | 2 | `j==2 && i>=3` → **sí** → `continue exterior` | nada |

Observa que el `break exterior` **nunca se dispara**: con `i=1` y `i=2` el producto `i*j` no llega a 8, y con `i>=3` siempre salta antes por el `continue exterior` (en `j=2`), así que nunca se evalúa el `j=3` donde `3*3=9` habría superado 8. La lección: con las etiquetas, no asumas qué pasa — ejecútalo mentalmente par a par.

</details>

---

## ⭐⭐ Ejercicio 6: cazador de primos

<details>
<summary>🔄 Solución</summary>

```java
public class CazadorPrimos {
    public static void main(String[] args) {
        for (int numero = 1; numero <= 50; numero++) {
            boolean esPrimo = true;

            if (numero < 2) {
                esPrimo = false;
            } else {
                for (int divisor = 2; divisor < numero; divisor++) {
                    if (numero % divisor == 0) {
                        esPrimo = false;
                        break;
                    }
                }
            }

            if (esPrimo) {
                System.out.println(numero);
            }
        }
    }
}
```

Salida (primeros): `2 3 5 7 11 13...`. El bucle exterior recorre los candidatos y el interior busca divisores con `break` en cuanto encuentra uno. El `if (numero < 2)` aparta el 1, que no es primo (es el patito feo de las matemáticas).

</details>

---

## ⭐⭐ Ejercicio 7: La suma centinela

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class SumaCentinela {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int suma = 0;
        int numero = sc.nextInt();

        while (numero != 0) {
            suma += numero;
            numero = sc.nextInt();
        }

        System.out.println("Suma total: " + suma);
        sc.close();
    }
}
```

El `while` se repite mientras el número no sea 0. El 0 es el **centinela**: no se suma, solo señala el final. Es el patrón clásico de lectura de datos con `while`.

</details>

---

## ⭐⭐⭐ Ejercicio 8: CodeWars — Categorize New Member

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String[] openOrSenior(int[][] data) {
        String[] result = new String[data.length];

        for (int i = 0; i < data.length; i++) {
            result[i] = (data[i][0] >= 55 && data[i][1] > 7) ? "Senior" : "Open";
        }

        return result;
    }
}
```

Un bucle que recorre los pares `{edad, handicap}` y un ternario con la condición combinada `&&`: para ser "Senior" hay que tener al menos 55 años Y un handicap mayor que 7. Todo lo demás es "Open". Bucles, condicionales y ternarios de la unidad en una sola función.

</details>

---

## ⭐⭐⭐ Ejercicio 9: AceptaElReto — 156 Ascensor

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Ascensor {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) {
                break;
            }

            int distancia = 0;
            int pisoActual = 0;

            for (int i = 0; i < n; i++) {
                int piso = sc.nextInt();
                distancia += Math.abs(piso - pisoActual);
                pisoActual = piso;
            }

            System.out.println(distancia);
        }
        sc.close();
    }
}
```

El `while (true)` con `break` en el 0 gestiona los múltiples casos. Dentro, un `for` acumula `Math.abs(piso - pisoActual)` y actualiza la planta actual. `Math.abs` da la distancia sin importar si sube o baja. Con la entrada del ejemplo: `|0-5| + |5-1| + |1-10| + |10-4| + |4-2| = 26`.

</details>

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 156 — Ascensor | Fácil |
| AceptaElReto | 149 — San Fermines | Fácil |
| AceptaElReto | 340 — Siguiente con mismo número de cifras | Medio |
| CodeWars | Even or Odd (8 kyu) | Principiante |
| CodeWars | Categorize New Member (7 kyu) | Aficionado |
| CodeWars | Return Negative (8 kyu) | Principiante |
