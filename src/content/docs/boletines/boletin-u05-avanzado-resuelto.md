---
title: Boletín U05 — Avanzado Resuelto
description: Los mismos ejercicios que el boletín avanzado, con soluciones
---

# 📝 Boletín U05 — Avanzado (Resuelto)

> Las soluciones están ocultas. Inténtalo de verdad antes de destaparlas.

---

## ⭐ Ejercicio 1: El clasificador de notas

<details>
<summary>🔄 Solución</summary>

```java
public class Notas {
    public static String calificar(double nota) {
        if (nota < 0 || nota > 10) {
            return "Nota inválida";
        }
        if (nota >= 9) {
            return "Sobresaliente";
        }
        if (nota >= 7) {
            return "Notable";
        }
        if (nota >= 5) {
            return "Aprobado";
        }
        return "Suspenso";
    }

    public static void main(String[] args) {
        System.out.println(calificar(8.7));
        System.out.println(calificar(4.5));
        System.out.println(calificar(11));
        System.out.println(calificar(-2));
    }
}
```

Salida:

```
Notable
Suspenso
Nota inválida
Nota inválida
```

La estructura es la misma de la U04, pero cada rama hace `return` en lugar de `println`. Ahora la regla es reutilizable: podrías pasarle `calificar` a diez programas distintos sin copiar ni una línea de la cascada.

</details>

---

## ⭐ Ejercicio 2: Tablas a demanda

<details>
<summary>🔄 Solución</summary>

```java
public class Tablas {
    public static void imprimirTabla(int n) {
        for (int i = 1; i <= 10; i++) {
            System.out.println(n + " x " + i + " = " + n * i);
        }
    }

    public static void main(String[] args) {
        imprimirTabla(7);
        System.out.println("---");
        imprimirTabla(3);
    }
}
```

Salida (primera parte):

```
7 x 1 = 7
7 x 2 = 14
...
7 x 10 = 70
---
3 x 1 = 3
...
3 x 10 = 30
```

Un solo bucle escrito una vez y dos tablas distintas: el parámetro `n` es lo que cambia entre llamadas. Programar así es como cocinar con receta: la receta no cambia, cambian los ingredientes.

</details>

---

## ⭐⭐ Ejercicio 3: ¿Qué imprime? — la sombra del parámetro

<details>
<summary>🔄 Solución</summary>

Imprime **`100`**.

Dentro de `cambiar`, el parámetro `valor` (que vale `5`) **tapa** al campo `valor` (que vale `100`): la línea `valor = valor + 1;` modifica el parámetro local (`5 → 6`) y se olvida al cerrar el método. El campo sigue intacto en `100`.

Para modificar el campo tendrías que escribir algo como `Sombra.valor = ...` o, mejor, eliminar el nombre duplicado. Dos variables con el mismo nombre: gana la de más cerca, como una sombra.

</details>

---

## ⭐⭐ Ejercicio 4: La suma de dígitos

<details>
<summary>🔄 Solución</summary>

```java
public class Digitos {
    public static int sumaDigitos(int n) {
        int suma = 0;
        n = Math.abs(n);
        while (n > 0) {
            suma += n % 10;
            n /= 10;
        }
        return suma;
    }

    public static void main(String[] args) {
        System.out.println(sumaDigitos(1234));
        System.out.println(sumaDigitos(905));
    }
}
```

Salida:

```
10
14
```

El `while` va comiéndose el número por la derecha: `1234` deja el `4` suelto y se queda con `123`, hasta que `n` es `0`. `Math.abs` evita que un número negativo arruine la cuenta, porque `while (n > 0)` no arrancaría ni saludaría.

</details>

---

## ⭐⭐⭐ Ejercicio 5: ¿Qué imprime? — el return que corta

<details>
<summary>🔄 Solución</summary>

```
negativo cero positivo
4
-1
```

- `signo(-5)` → `-5 < 0` se cumple en el primer `if` y el `return "negativo"` corta el método. `signo(0)` → el primer `if` no vale, el segundo sí: `"cero"`. `signo(4)` → ninguno de los dos, así que cae en el `return` final: `"positivo"`.
- `primeroPar(7, 4)` → `7` no es par, pero `4` sí: devuelve `4`. `primeroPar(3, 5)` → ninguno es par: `-1` como señal de «no hay».

En cada ejecución solo se alcanza **un** `return`; los demás quedan inalcanzables. Ese es el truco del «return que corta»: decisiones encadenadas sin anidar `if`.

</details>

---

## ⭐⭐⭐ Ejercicio 6: Divide el informe

<details>
<summary>🔄 Solución</summary>

```java
public class Informe {
    public static double media(double a, double b, double c, double d) {
        return (a + b + c + d) / 4;
    }

    public static double maximo(double a, double b, double c, double d) {
        double max = a;
        if (b > max) max = b;
        if (c > max) max = c;
        if (d > max) max = d;
        return max;
    }

    public static double minimo(double a, double b, double c, double d) {
        double min = a;
        if (b < min) min = b;
        if (c < min) min = c;
        if (d < min) min = d;
        return min;
    }

    public static void main(String[] args) {
        double a = 7.5, b = 9.0, c = 4.5, d = 8.25;
        System.out.println("Media: " + media(a, b, c, d));
        System.out.println("Máximo: " + maximo(a, b, c, d));
        System.out.println("Mínimo: " + minimo(a, b, c, d));
    }
}
```

Salida:

```
Media: 7.3125
Máximo: 9.0
Mínimo: 4.5
```

El `main` pasó de 15 líneas con lógica escondida a tres frases que se leen en voz alta: «dame la media», «dame el máximo», «dame el mínimo». Cada método hace una cosa y la hace devolviendo, sin imprimir. Si mañana el informe necesita la mediana, añades un método más y no tocas los existentes.

</details>

---

## ⭐⭐ Ejercicio 7: El contador de vocales

<details>
<summary>🔄 Solución</summary>

```java
public class Vocales {
    public static int contarVocales(String texto) {
        int cuenta = 0;
        for (int i = 0; i < texto.length(); i++) {
            char c = texto.charAt(i);
            if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u'
                    || c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U') {
                cuenta++;
            }
        }
        return cuenta;
    }

    public static void main(String[] args) {
        System.out.println(contarVocales("Hola mundo"));
        System.out.println(contarVocales("zzz"));
    }
}
```

Salida:

```
4
0
```

`"Hola mundo"` tiene `o`, `a`, `u`, `o`: cuatro vocales. El truco está en comparar `char` con literales entre comillas simples (`'a'`), no entre comillas dobles (eso sería un `String` y nunca sería igual). Mayúsculas y minúsculas cubiertas con el doble de comparaciones.

</details>

---

## ⭐⭐⭐ Ejercicio 8: CodeWars — 'Disemvowel' Trolls

<details>
<summary>🔄 Solución</summary>

```java
public class Kata {
    public static String disemvowel(String str) {
        String resultado = "";
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (c != 'a' && c != 'e' && c != 'i' && c != 'o' && c != 'u'
                    && c != 'A' && c != 'E' && c != 'I' && c != 'O' && c != 'U') {
                resultado = resultado + c;
            }
        }
        return resultado;
    }
}
```

El troll pierde las vocales y se queda con el resto: `"This website is for losers LOL!"` → `"Ths wbst s fr lsrs LL!"`. Un `for` sobre la cadena, un `if` que filtra y un `String` que va creciendo. En la U13 podrás hacer lo mismo en una línea con regex, pero ahora dominas el camino largo, que es el que importa.

</details>

---

## ⭐⭐⭐ Ejercicio 9: AceptaElReto — 165 Número hyperpar

<details>
<summary>🔄 Solución</summary>

```java
import java.util.Scanner;

public class Hyperpar {
    public static boolean esHyperpar(int n) {
        while (n > 0) {
            if ((n % 10) % 2 != 0) {
                return false;
            }
            n /= 10;
        }
        return true;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        while (n >= 0) {
            System.out.println(esHyperpar(n) ? "SI" : "NO");
            n = sc.nextInt();
        }
        sc.close();
    }
}
```

Con la entrada del ejemplo: `2460` → todos los dígitos pares → `SI`; `1234` → el `1` y el `3` rompen el hechizo → `NO` (y el método sale corriendo con `return false` sin terminar de mirar); `2` → `SI`; `-1` detiene el `while` principal.

Dos niveles de responsabilidad: uno lee casos, el otro disecciona el número. Y la lógica de decisión vive aislada en `esHyperpar`, lista para que la pruebes con `System.out.println(esHyperpar(4602));` sin tocar la entrada.

</details>

---

## 📚 Referencias

| Plataforma | Problema | Dificultad |
|---|---|---|
| AceptaElReto | 165 — Número hyperpar | Fácil |
| AceptaElReto | 115 — Número de Kaprekar | Medio |
| CodeWars | Century From Year (8 kyu) | Principiante |
| CodeWars | 'Disemvowel' Trolls (7 kyu) | Aficionado |
| CodeWars | Volume of a Cuboid (8 kyu) | Principiante |
| CodeWars | Drink about (8 kyu) | Principiante |
