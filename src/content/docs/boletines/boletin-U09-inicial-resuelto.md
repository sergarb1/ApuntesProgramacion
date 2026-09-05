---
title: "Boletín U09 — Inicial Resuelto"
description: "Los mismos ejercicios que el boletín inicial, con soluciones"
---

# 📝 Boletín U09 — Inicial (Resuelto)

> Las soluciones están ocultas en cada ejercicio. No hagas trampa: primero inténtalo de verdad.

---

## Ejercicio 1: ¿Qué imprime? — Array de booleanos

<details>
<summary>🔄 Solución</summary>

Imprime **`false true false`**.

`flags` es un `boolean[]` de 3 plazas recién creadas. El valor por defecto de `boolean` es `false`, así que `flags[0]` y `flags[2]` valen `false`. Solo `flags[1]` se puso a `true`. Cada plaza nace con el valor por defecto de su tipo: `false` para `boolean`.

</details>

---

## Ejercicio 2: Encuentra el error — NullPointerException

<details>
<summary>🔄 Solución</summary>

Se lanza una **`NullPointerException`** en la última línea.

`nombres[2]` nunca se asignó, así que vale `null` (el valor por defecto de los objetos). Llamar a `nombres[2].toUpperCase()` sobre `null` es pedirle un método a la nada: Java no sabe qué hacer y lanza la excepción. Las plazas de un `String[]` recién creado están llenas de `null`, no de `""`.

</details>

---

## Ejercicio 3: Completa el código — for básico para buscar el mayor

<details>
<summary>🔄 Solución</summary>

```java
int[] numeros = {12, 45, 7, 34, 89, 23};
int mayor = numeros[0];

for (int i = 1; i < numeros.length; i++) {   // hasta length, sin pasar
    if (numeros[i] > mayor) {                // ¿es más grande que el actual?
        mayor = numeros[i];                  // actualiza el mayor
    }
}

System.out.println("El mayor es: " + mayor);
```

El patrón del "máximo acumulado": empiezas asumiendo que el primero es el mayor y, si aparece uno más grande, lo sustituyes. El bucle empieza en `i = 1` porque el candidato inicial ya es `numeros[0]`. Imprime `El mayor es: 89`.

</details>

---

## Ejercicio 4: Escribe este programa — contar números pares

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Arrays;

public class ContarPares {
    public static void main(String[] args) {
        int[] numeros = {3, 8, 12, 5, 7, 10, 2, 9, 6, 1};
        int pares = 0;

        for (int i = 0; i < numeros.length; i++) {
            if (numeros[i] % 2 == 0) {
                pares++;
            }
        }

        System.out.println("Array: " + Arrays.toString(numeros));
        System.out.println("Pares: " + pares);
    }
}
```

Salida: `Array: [3, 8, 12, 5, 7, 10, 2, 9, 6, 1]` y `Pares: 5`. Un número es par si su resto al dividir entre 2 es 0 (`% 2 == 0`). Y `Arrays.toString` es lo que hace la salida legible.

</details>

---

## Ejercicio 5: ¿Qué imprime? — ArrayList remove por índice vs valor

<details>
<summary>🔄 Solución</summary>

Imprime **`[A, C, B, D]`**.

Paso a paso:

- `lista.remove(1)` borra por **índice**: se va el `"B"` de la posición 1 → `[A, C, B, D]`.
- `lista.remove("B")` borra por **objeto**: busca la primera aparición de `"B"` y la borra → `[A, C, D]`.

El primer `remove` borra el `"B"` de la posición 1 (el primero). Cuando después llamas a `remove("B")`, ese `"B"` ya no está, pero queda el `"B"` que estaba en la posición 3 (el cuarto elemento), que ahora es el primero que encuentra: lo borra. Resultado final `[A, C, D]`.

</details>

---

## Ejercicio 6: Encuentra el error — length vs length()

<details>
<summary>🔄 Solución</summary>

Las **dos líneas tienen error**, pero por motivos opuestos:

- `numeros.length()` → los arrays usan `length` como **atributo**, sin paréntesis. `numeros.length()` no compila.
- `texto.length` → los `String` usan `length()` como **método**, con paréntesis. `texto.length` no compila.

Regla de oro: **array → `length`; `String` → `length()`; colecciones → `size()`.** Confundirlos es la trampa favorita de los exámenes.

</details>

---

## Ejercicio 7: Escribe este programa — búsqueda lineal

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class BusquedaLineal {
    public static void main(String[] args) {
        int[] edades = {12, 45, 25, 67, 33, 18, 40, 21};
        Scanner sc = new Scanner(System.in);

        System.out.print("Introduce edad a buscar: ");
        int buscado = sc.nextInt();

        int posicion = -1;
        for (int i = 0; i < edades.length; i++) {
            if (edades[i] == buscado) {
                posicion = i;
                break;
            }
        }

        if (posicion >= 0) {
            System.out.println("Encontrado en posición " + posicion);
        } else {
            System.out.println("No encontrado");
        }
        sc.close();
    }
}
```

La búsqueda lineal recorre el array de principio a fin. `posicion = -1` es el "no encontrado"; si aparece el valor, guardas el índice y cortas con `break` (ya no hace falta seguir).

</details>

---

## Ejercicio 8: Escribe este programa — el inverso

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Arrays;

public class Inverso {
    public static void main(String[] args) {
        int[] numeros = new int[10];
        for (int i = 0; i < numeros.length; i++) {
            numeros[i] = i + 1;
        }

        System.out.println("Original: " + Arrays.toString(numeros));

        System.out.print("Inverso: ");
        for (int i = numeros.length - 1; i >= 0; i--) {
            System.out.print(numeros[i] + " ");
        }
    }
}
```

El primer bucle rellena del 1 al 10. El segundo recorre **hacia atrás**: empieza en `length - 1` (el 10) y baja hasta 0 (el 1). Imprime `10 9 8 7 6 5 4 3 2 1`.

</details>

---

## Ejercicio 9: CodeWars — Convert number to reversed array of digits

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static int[] digitize(long n) {
        String texto = String.valueOf(n);
        int[] resultado = new int[texto.length()];
        for (int i = 0; i < texto.length(); i++) {
            resultado[i] = texto.charAt(texto.length() - 1 - i) - '0';
        }
        return resultado;
    }
}
```

O, con aritmética pura:

```java
public class Kata {
    public static int[] digitize(long n) {
        String texto = String.valueOf(n);
        int[] resultado = new int[texto.length()];
        for (int i = 0; i < resultado.length; i++) {
            resultado[i] = (int) (n % 10);
            n /= 10;
        }
        return resultado;
    }
}
```

Para `35231` → `{1, 3, 2, 5, 3}`. La primera versión recorre el texto de atrás hacia adelante y resta `'0'` para pasar de carácter a número. La segunda usa el truco del módulo: el último dígito es `n % 10`, y dividir entre 10 "quita" ese dígito. Ambos caminos usan el `length` del texto, no un número fijo.

</details>