---
title: Boletín U09 — Extras
description: CodeWars y AceptaElReto para ir más allá de la unidad
---

# 📝 Boletín U09 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas. La solución está oculta: resístete hasta agotar tu pista. CodeWars y AceptaElReto son los gimnasios donde los programadores se retan a diario: aquí es donde la herencia deja de ser teoría y se convierte en reflejos.

---

## CodeWars

### 1. Convert string to camel case

Te dan una cadena con guiones o guiones bajos separando palabras. Devuelve la versión en **camelCase**: cada palabra empieza en mayúscula excepto la primera.

**Ejemplos:** `"the-stealth-warrior"` → `"theStealthWarrior"`, `"The_Stealth_Warrior"` → `"TheStealthWarrior"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/517abf86da9663f1d2000003)
- Dificultad: 6 kyu

**Pista:** recorre los caracteres con un `for` y lleva una variable `boolean` que recuerde si el carácter anterior era un separador (`-` o `_`). Si lo era, el siguiente carácter va en mayúscula.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String toCamelCase(String s) {
        StringBuilder resultado = new StringBuilder();
        boolean capitalizar = false;

        for (char c : s.toCharArray()) {
            if (c == '-' || c == '_') {
                capitalizar = true;
            } else if (capitalizar) {
                resultado.append(Character.toUpperCase(c));
                capitalizar = false;
            } else {
                resultado.append(c);
            }
        }
        return resultado.toString();
    }
}
```

La bandera `capitalizar` se activa al ver un separador y se consume al transformar la siguiente letra. Un solo bucle, sin `split`: recorrer y recordar es suficiente.

</details>

---

### 2. Counting Duplicates

Cuenta cuántos caracteres aparecen **más de una vez** en una cadena, sin distinguir mayúsculas de minúsculas.

**Ejemplos:** `"abcde"` → `0`, `"aabBcde"` → `2` (la `a` y la `b`), `"indivisibility"` → `1` (la `i`).

- [Enunciado en CodeWars](https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1)
- Dificultad: 6 kyu

**Pista:** convierte a minúsculas y cuenta frecuencias con un `Map<Character, Integer>`; al final, cuenta cuántas entradas tienen frecuencia mayor que 1. (El `Map` se estudia a fondo en la U11, pero puedes usarlo ya.)

<details>
<summary>🔄 Solución</summary>

```java
import java.util.HashMap;
import java.util.Map;

public class Kata {
    public static int duplicateCount(String text) {
        Map<Character, Integer> frecuencias = new HashMap<>();

        for (char c : text.toLowerCase().toCharArray()) {
            frecuencias.put(c, frecuencias.getOrDefault(c, 0) + 1);
        }

        int repetidos = 0;
        for (int frecuencia : frecuencias.values()) {
            if (frecuencia > 1) {
                repetidos++;
            }
        }
        return repetidos;
    }
}
```

El `Map` guarda cuántas veces aparece cada carácter. `getOrDefault(c, 0)` devuelve la frecuencia actual o 0 si el carácter aún no estaba. Después, basta con contar las que superan 1: `"aabBcde"` → la `a` (2) y la `b` (2) → `2`.

</details>

---

### 3. Human Readable Time

Te dan un número de **segundos** (máximo 359999). Devuélvelo con formato `HH:MM:SS` con ceros a la izquierda.

**Ejemplos:** `makeReadable(0)` → `"00:00:00"`, `makeReadable(5)` → `"00:00:05"`, `makeReadable(86399)` → `"23:59:59"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/52685f7382004e774f0001f7)
- Dificultad: 5 kyu

**Pista:** división entera y módulo: horas = `segundos / 3600`, minutos = `(segundos % 3600) / 60`, segundos = `segundos % 60`. Formatea con `String.format("%02d:%02d:%02d")`.

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String makeReadable(int seconds) {
        int horas = seconds / 3600;
        int minutos = (seconds % 3600) / 60;
        int segundos = seconds % 60;
        return String.format("%02d:%02d:%02d", horas, minutos, segundos);
    }
}
```

El `%02d` rellena con ceros a la izquierda hasta dos dígitos. Para `86399`: `23`, `59`, `59` → `"23:59:59"`. Es el mismo razonamiento de unidades, decenas y centenas que ya usas al dividir.

</details>

---

### 4. Basic subclasses — Adam and Eve

Según el mito, Adam y Eva fueron los primeros humanos. Tu trabajo es "hacer el trabajo de Dios": crear un método estático `create()` que devuelva un array de `Human` con dos objetos: el primero un `Man` y el segundo una `Woman`. Ambas clases heredan de `Human`, y cada humano tiene `name`, `sex` y la propiedad `species` con valor `"Human"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/547274e24481cfc469000416)
- Dificultad: 8 kyu

**Pista:** herencia pura: `class Man extends Human` y `class Woman extends Human`. Cada subclase llama a `super(...)` para rellenar el nombre y el sexo. El array de retorno es de tipo `Human`, así que acepta ambas subclases.

<details>
<summary>🔄 Solución</summary>

```java
public class Human {
    private String name;
    private String sex;
    protected String species = "Human";

    public Human(String name, String sex) {
        this.name = name;
        this.sex = sex;
    }

    public String getName() {
        return name;
    }

    public String getSex() {
        return sex;
    }

    public String getSpecies() {
        return species;
    }
}

class Man extends Human {
    public Man(String name) {
        super(name, "man");
    }
}

class Woman extends Human {
    public Woman(String name) {
        super(name, "woman");
    }
}

public class God {
    public static Human[] create() {
        return new Human[] { new Man("Adam"), new Woman("Eve") };
    }
}
```

`Man` y `Woman` heredan todo de `Human` y solo aportan su constructor con el sexo fijo. `create()` devuelve un array de `Human` (el tipo general) relleno con las dos subclases: polimorfismo de arriba abajo, como Adam y Eva en el Paraíso.

</details>

---

## AceptaElReto

### 5. 100 — Constante de Kaprekar

El matemático Kaprekar descubrió que, aplicando a cualquier número de 4 dígitos (con al menos dos distintos) la rutina *ordena los dígitos de mayor a menor, réstale el ordenado de menor a mayor*, siempre se llega al número **6174** en 7 vueltas como mucho. Por ejemplo, `3524`: `5432 - 2345 = 3087`, `8730 - 0378 = 8352`, `8532 - 2358 = 6174` (3 vueltas).

**Entrada:** la primera línea es el número de casos de prueba. Cada caso es un número de 4 dígitos.

**Salida:** para cada caso, las vueltas hasta alcanzar 6174. Para los *repdigits* (las 4 cifras iguales, como `1111`) escribe `8`. Para el propio `6174`, escribe `0`.

**Entrada de ejemplo:**

```
5
3524
1111
1121
6174
1893
```

**Salida de ejemplo:**

```
3
8
5
0
7
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=100)
- Dificultad: Fácil/Media

**Pista:** pasa el número a cadena con `String.format("%04d", n)` para mantener los 4 dígitos con ceros. Ordena los caracteres con `Arrays.sort` para obtener el menor; el mayor es el mismo array recorrido al revés. Repite hasta llegar a 6174.

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
            int n = sc.nextInt();
            System.out.println(vueltasKaprekar(n));
        }
        sc.close();
    }

    static int vueltasKaprekar(int n) {
        if (n == 6174) {
            return 0;
        }

        String s = String.format("%04d", n);
        if (s.charAt(0) == s.charAt(1)
                && s.charAt(1) == s.charAt(2)
                && s.charAt(2) == s.charAt(3)) {
            return 8;
        }

        int vueltas = 0;
        while (n != 6174) {
            char[] asc = String.format("%04d", n).toCharArray();
            Arrays.sort(asc);
            int menor = Integer.parseInt(new String(asc));

            char[] desc = new char[4];
            for (int j = 0; j < 4; j++) {
                desc[j] = asc[3 - j];
            }
            int mayor = Integer.parseInt(new String(desc));

            n = mayor - menor;
            vueltas++;
        }
        return vueltas;
    }
}
```

Para `3524`: los dígitos ordenados dan `2345` (menor) y `5432` (mayor), se restan y se repite hasta alcanzar `6174`. El `String.format("%04d", ...)` conserva los ceros iniciales (el `0378` del ejemplo). Verifícalo con `1121`: `5` vueltas, tal y como promete el enunciado.

</details>

---

### 6. 369 — Contando en la arena

Mucho antes de la base 2 y de los números romanos, los primeros humanos contaban haciendo surcos en la arena. Te piden la "base 1": representar cada número como tantos **unos** como valga.

**Entrada:** varios números mayores que 0 y nunca mayores que 1.000, cada uno en una línea. La entrada termina con un `0`, que no debe procesarse.

**Salida:** para cada número, su codificación en base 1 (esa cantidad de `1` seguidos).

**Entrada de ejemplo:**

```
1
4
6
0
```

**Salida de ejemplo:**

```
1
1111
111111
```

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=369)
- Dificultad: Fácil

**Pista:** un `StringBuilder` y un bucle que añada `'1'` tantas veces como el número. El patrón de lectura "leer hasta 0" es el centinela que ya conoces de los boletines anteriores.

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class ContandoArena {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            int n = sc.nextInt();
            if (n == 0) {
                break;
            }

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < n; i++) {
                sb.append('1');
            }
            System.out.println(sb);
        }
        sc.close();
    }
}
```

El bucle exterior lee hasta que llega el `0` centinela. Por cada número, el bucle interior fabrica una cadena de `n` unos. `StringBuilder` evita crear cadenas nuevas en cada concatenación: es el patrón eficiente para acumular caracteres.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines la herencia, vuelve a los problemas de las unidades anteriores y reescríbelos con jerarquías: un `Lector` abstracto, un `Solucionador` polimórfico, figuras que se calculan solas. El material no se pierde: se reutiliza.