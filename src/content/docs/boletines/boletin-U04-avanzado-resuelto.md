---
title: Boletín U04 — Avanzado Resuelto
description: Los mismos ejercicios que el boletín avanzado, con soluciones
---

# 📝 Boletín U04 — Avanzado (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: ¿Qué imprime? — la binaria con historial

<details>
<summary>🔄 Solución</summary>

Imprime:

```
Pruebo el índice 3
Pruebo el índice 5
Pruebo el índice 4
Encontrado en 4
```

Traza sobre `{2, 4, 6, 8, 10, 12, 14, 16}` (8 elementos, índices 0 a 7):

| Vuelta | izq | der | medio | datos[medio] | Decisión |
|---|---|---|---|---|---|
| 1 | 0 | 7 | 3 | 8 | 8 < 10 → izq = 4 |
| 2 | 4 | 7 | 5 | 12 | 12 > 10 → der = 4 |
| 3 | 4 | 4 | 4 | 10 | ¡Encontrado! |

Tres pruebas, tres líneas, y el índice 4. Así de compacta es la binaria: cada vuelta descarta la mitad del espacio.

</details>

---

## Ejercicio 2: El buscador binario con historial

<details>
<summary>🔄 Solución</summary>

```java
public static int busquedaBinaria(int[] datos, int objetivo) {
    int izquierda = 0;
    int derecha = datos.length - 1;

    while (izquierda <= derecha) {
        int medio = izquierda + (derecha - izquierda) / 2;
        System.out.println("Probando el índice " + medio);

        if (datos[medio] == objetivo) {
            return medio;
        } else if (datos[medio] < objetivo) {
            izquierda = medio + 1;
        } else {
            derecha = medio - 1;
        }
    }
    return -1;
}
```

Salida para `objetivo = 7`: `Probando el índice 4`, `Probando el índice 1`, `Probando el índice 2`, y devuelve `2` (7 está en `datos[2]`). El `println` dentro del bucle convierte a la binaria en una caja de cristal: puedes ver cada intento.

</details>

---

## Ejercicio 3: La bombolla con recuento (y flag)

<details>
<summary>🔄 Solución</summary>

```java
public class BombollaRecuento {
    public static void main(String[] args) {
        int[] datos = {9, 3, 7, 1, 5};
        int intercambios = 0;
        boolean huboIntercambio;

        for (int i = 0; i < datos.length - 1; i++) {
            huboIntercambio = false;

            for (int j = 0; j < datos.length - 1 - i; j++) {
                if (datos[j] > datos[j + 1]) {
                    int temp = datos[j];
                    datos[j] = datos[j + 1];
                    datos[j + 1] = temp;
                    intercambios++;
                    huboIntercambio = true;
                }
            }

            if (!huboIntercambio) break;
        }

        System.out.println("Intercambios: " + intercambios);
        for (int num : datos) {
            System.out.print(num + " ");
        }
    }
}
```

Salida:

```
Intercambios: 7
1 3 5 7 9
```

Sobre `{9, 3, 7, 1, 5}` son 7 intercambios. El flag hace que, en cuanto una pasada no mueve nada, el `break` corta: no merece la pena seguir. Compara con el boletín inicial, donde el flag no existía y siempre se hacían todas las pasadas.

</details>

---

## Ejercicio 4: La inserción descendente

<details>
<summary>🔄 Solución</summary>

```java
public static void ordenarDescendente(int[] datos) {
    for (int i = 1; i < datos.length; i++) {
        int clave = datos[i];
        int j = i - 1;

        while (j >= 0 && datos[j] < clave) {
            datos[j + 1] = datos[j];
            j--;
        }
        datos[j + 1] = clave;
    }
}
```

El único cambio es el signo: `datos[j] < clave` en vez de `>`. Ahora deslizamos hacia la derecha los elementos **menores** que la clave, porque queremos que los grandes queden a la izquierda. Sobre `{6, 9, 3, 8, 5}` devuelve `9 8 6 5 3`. Cambiar una comparación y todo el sentido del algoritmo gira.

</details>

---

## Ejercicio 5: El analista de complejidad

<details>
<summary>🔄 Solución</summary>

- **`metodoA` → O(n)**: un solo bucle que recorre el array completo.
- **`metodoB` → O(n²)**: dos bucles anidados. Aunque el interior empiece en `j = i + 1`, son ≈ n·(n-1)/2 iteraciones, que es O(n²). En Big O, las constantes y la mitad no cuentan.
- **`metodoC` → O(log n)**: la búsqueda binaria. En cada vuelta el segmento se parte por la mitad, así que el número de vueltas es log₂(n).

</details>

---

## Ejercicio 6: El cazador de parejas

<details>
<summary>🔄 Solución</summary>

```java
public static boolean existePareja(int[] datos, int sumaObjetivo) {
    for (int i = 0; i < datos.length; i++) {
        for (int j = i + 1; j < datos.length; j++) {
            if (datos[i] + datos[j] == sumaObjetivo) {
                return true;
            }
        }
    }
    return false;
}
```

`j = i + 1` evita probar un elemento consigo mismo y duplicar parejas (probar (3,5) y (5,3)). Para 17: 10 + 7 → `true`. Para 25: ninguna combinación → `false`. Es O(n²), pero para arrays pequeños es instantáneo.

</details>

---

## Ejercicio 7: El detective de inversiones

<details>
<summary>🔄 Solución</summary>

```java
public static int contarInversiones(int[] datos) {
    int inversiones = 0;

    for (int i = 0; i < datos.length; i++) {
        for (int j = i + 1; j < datos.length; j++) {
            if (datos[i] > datos[j]) {
                inversiones++;
            }
        }
    }
    return inversiones;
}
```

Sobre `{2, 4, 1, 3}`: parejas `(0,1)` 2<4 no, `(0,2)` 2>1 sí, `(0,3)` 2<3 no, `(1,2)` 4>1 sí, `(1,3)` 4>3 sí, `(2,3)` 1<3 no → 3 inversiones. Curiosidad: las inversiones miden "lo desordenado" que está un array. Un array ya ordenado tiene 0; uno invertido tiene el máximo.

</details>

---

## Ejercicio 8: CodeWars — Ones and Zeros

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int binaryArrayToNumber(int[] numeros) {
        int valor = 0;
        for (int digito : numeros) {
            valor = valor * 2 + digito;
        }
        return valor;
    }
}
```

Para `[1, 0, 1, 1]`: valor = 0·2+1 = 1, luego 1·2+0 = 2, luego 2·2+1 = 5, luego 5·2+1 = 11. El truco `valor * 2 + digito` convierte binario a decimal en un solo recorrido, sin `Math.pow`. Es un algoritmo clásico que te encontraras en todos lados: dígito a dígito, el valor "se desplaza" hacia la izquierda.

</details>

---

## Ejercicio 9: AceptaElReto — 100 Constante de Kaprekar

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Kaprekar {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numero = sc.nextInt();

        while (numero != 0) {
            if (esRepdigit(numero)) {
                System.out.println(8);
                numero = sc.nextInt();
                continue;
            }

            int iteraciones = 0;

            while (numero != 6174) {
                int[] digitos = new int[4];

                for (int i = 3; i >= 0; i--) {
                    digitos[i] = numero % 10;
                    numero /= 10;
                }

                for (int i = 0; i < digitos.length - 1; i++) {
                    for (int j = 0; j < digitos.length - 1 - i; j++) {
                        if (digitos[j] > digitos[j + 1]) {
                            int temp = digitos[j];
                            digitos[j] = digitos[j + 1];
                            digitos[j + 1] = temp;
                        }
                    }
                }

                int ascendente = 0;
                int descendente = 0;
                for (int i = 0; i < 4; i++) {
                    ascendente = ascendente * 10 + digitos[i];
                    descendente = descendente * 10 + digitos[3 - i];
                }

                numero = descendente - ascendente;
                iteraciones++;
            }

            System.out.println(iteraciones);
            numero = sc.nextInt();
        }
        sc.close();
    }

    static boolean esRepdigit(int n) {
        String s = String.format("%04d", n);
        char primera = s.charAt(0);
        for (char c : s.toCharArray()) {
            if (c != primera) return false;
        }
        return true;
    }
}
```

Los números con menos de 4 cifras se completan con ceros porque extraemos con `% 10` y `/ 10` sobre un array de 4 posiciones: el 21 se convierte en `{0, 0, 2, 1}`. El algoritmo de Kaprekar termina siempre (máximo unas pocas iteraciones) y llega a 6174... **excepto los repdigits** (1111, 5555...): la primera resta da 0 y, si entraras en el `while (numero != 6174)`, te quedarías dando vueltas con 0 para siempre. Por eso el problema oficial de AceptaElReto pide que los repdigits impriman `8`, y lo detectamos antes con `esRepdigit`. La bombolla del punto 4, reutilizada dentro del propio Kaprekar: el código de la U04 resolviendo problemas reales.

</details>
