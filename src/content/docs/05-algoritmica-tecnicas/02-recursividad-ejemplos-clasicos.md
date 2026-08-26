---
title: "02 — Recursividad: ejemplos clásicos"
description: "Factorial, Fibonacci, palíndromos y torres de Hanói: los cuatro jinetes del apocalipsis recursivo 🧮"
---

<p><small>Factorial, Fibonacci, palíndromos y torres de Hanói: los cuatro jinetes del apocalipsis recursivo 🧮</small></p>

> 🗺️ **Estás en:** ⚡ **U05 · Algorítmica II: Técnicas** → 02 · Recursividad: ejemplos clásicos

---

## 📬 La idea en una frase

> **Estos cuatro ejemplos te perseguirán el resto de tu carrera: aparecen en exámenes, entrevistas técnicas y conversaciones de ascensor con otros programadores, así que más vale dominarlos.**

En el punto 1 viste la teoría: caso base, caso recursivo y la pila. Ahora toca el museo de los clásicos. Cada uno te enseña una lección diferente, desde la elegancia lineal del factorial hasta el horror exponencial del Fibonacci ingenuo.

---

## 🧮 Factorial: el "Hola Mundo" de la recursividad

```java
public class Factorial {

    static long fact(int n) {
        if (n <= 1) return 1;          // caso base: 0! y 1! valen 1
        return n * fact(n - 1);        // caso recursivo
    }

    public static void main(String[] args) {
        System.out.println("fact(5) = " + fact(5));   // 120
        System.out.println("fact(0) = " + fact(0));   // 1
        System.out.println("fact(7) = " + fact(7));   // 5040
    }
}
```

¿Qué pasa cuando llamamos a `fact(4)`? Vamos paso a paso:

```
fact(4) → 4 * fact(3)
       → 4 * (3 * fact(2))
       → 4 * (3 * (2 * fact(1)))
       → 4 * (3 * (2 * 1))
       → 4 * (3 * 2)
       → 4 * 6
       → 24
```

Primero "baja" hasta el caso base, luego "sube" haciendo las multiplicaciones. Como un ascensor que baja al sótano y vuelve a subir parando en cada puerta. La complejidad es **O(n)**: una llamada por cada número.

> [!NOTE]
> Ojo con `long`: `fact(20)` ya es 2.432.902.008.176.640.000, casi al límite de `long`. Para 21 en adelante, desbordas. El factorial crece **muy** deprisa.

---

## 🐰 Fibonacci ingenua: no hagas esto en casa

```java
public class FiboNaive {

    static long fibo(int n) {
        if (n <= 1) return n;
        return fibo(n - 1) + fibo(n - 2);
    }

    public static void main(String[] args) {
        long inicio = System.currentTimeMillis();
        System.out.println("fibo(40) = " + fibo(40));
        long fin = System.currentTimeMillis();
        System.out.println("Tiempo: " + (fin - inicio) + " ms");
    }
}
```

Ejecuta esto. Serán unos segundos de infierno. ¿El problema? `fibo(40)` genera un **árbol de llamadas monstruoso**. Cada llamada se bifurca en dos, que se bifurcan en dos, etc. El número total de llamadas es aproximadamente **O(2ⁿ)**.

```
                          fibo(5)
                         /       \
                   fibo(4)       fibo(3)
                  /       \      /     \
            fibo(3)    fibo(2) fibo(2) fibo(1)
            /    \      /   \   /   \
       fibo(2) fibo(1) ...  ... ...  ...
       /    \
  fibo(1) fibo(0)
```

Cuenta las veces que se llama a `fibo(1)`. Exacto, demasiadas. Es como preguntarle a tu compañero una y otra vez la misma pregunta esperando una respuesta diferente. Eso, señor mío, es locura.

> [!TIP]
> Este es el ejemplo perfecto para entender por qué **la eficiencia importa**. Un algoritmo que se ve bonito en código puede ser un desastre en tiempo de ejecución. El Fibonacci ingenuo es el rey de los algoritmos bonitos pero inútiles para números grandes.

---

## ⚡ Fibonacci optimizado: con memoización, ahora sí

```java
public class FiboOptimizado {

    static long[] memo;

    static long fibo(int n) {
        if (n <= 1) return n;
        if (memo[n] != 0) return memo[n];      // ya lo calculamos antes
        memo[n] = fibo(n - 1) + fibo(n - 2);
        return memo[n];
    }

    public static void main(String[] args) {
        int n = 92;
        memo = new long[n + 1];
        long inicio = System.currentTimeMillis();
        System.out.println("fibo(" + n + ") = " + fibo(n)); // instantáneo
        long fin = System.currentTimeMillis();
        System.out.println("Tiempo: " + (fin - inicio) + " ms");
    }
}
```

¿Qué cambia? Guardamos los resultados en un array (`memo[]`) para no recalcular. Si ya hemos calculado `fibo(10)`, lo devolvemos directamente. Cada Fibonacci se calcula **una sola vez**.

La mejora es brutal: de **O(2ⁿ) a O(n)**. Esa es la mayor subida de nivel desde que pasaste de piedra a pokéball.

> [!NOTE]
> Esto se llama **memoización** (sí, sin la "r"). Consiste en: "si ya lo calculé, no lo vuelvo a calcular; lo guardo en un array o mapa y lo reutilizo". Es la base de la **programación dinámica**, que verás en unidades más avanzadas.

---

## 🔍 Palíndromos: la palabra espejo

Un palíndromo es una palabra que se lee igual hacia delante y hacia atrás: *reconocer*, *salas*, *ana*. ¿Cómo se comprueba con recursión?

```java
public class Palindromo {

    static boolean esPalindromo(String s, int inicio, int fin) {
        if (inicio >= fin) return true;                    // caso base: quedan 0 o 1 letras
        if (s.charAt(inicio) != s.charAt(fin)) return false; // caso base: las puntas no coinciden
        return esPalindromo(s, inicio + 1, fin - 1);       // caso recursivo: vamos "pelando" las puntas
    }

    public static void main(String[] args) {
        String[] pruebas = {"reconocer", "salas", "hola", "anana", "a"};
        for (String s : pruebas) {
            System.out.println(s + " -> " + esPalindromo(s, 0, s.length() - 1));
        }
    }
}
```

Salida:

```
reconocer -> true
salas -> true
hola -> false
anana -> true
a -> true
```

La idea es elegante: comparas la primera y la última letra; si no coinciden, no es palíndromo; si coinciden, repites con las letras de dentro. Como pelar una cebolla, pero de letras.

---

## 🗼 Torres de Hanói: el rey de los clásicos

El mito: tres varillas y una pila de discos de tamaño creciente. Hay que mover todos los discos de la varilla A a la C, con dos reglas: solo se mueve un disco a la vez y nunca puede quedar un disco grande sobre uno pequeño. La leyenda dice que cuando los monjes terminen, el mundo se acabará (con 64 discos, no nos preocupemos).

```java
public class Hanoi {

    static void mover(int n, char origen, char destino, char auxiliar) {
        if (n == 1) {
            System.out.println("Mueve disco 1 de " + origen + " a " + destino);
            return;                                    // caso base
        }
        mover(n - 1, origen, auxiliar, destino);       // los n-1 discos de arriba, a la varilla auxiliar
        System.out.println("Mueve disco " + n + " de " + origen + " a " + destino);
        mover(n - 1, auxiliar, destino, origen);       // y ahora los n-1 discos, encima
    }

    public static void main(String[] args) {
        mover(3, 'A', 'C', 'B');
    }
}
```

Con 3 discos, la salida es:

```
Mueve disco 1 de A a C
Mueve disco 2 de A a B
Mueve disco 1 de C a B
Mueve disco 3 de A a C
Mueve disco 1 de B a A
Mueve disco 2 de B a C
Mueve disco 1 de A a C
```

Son **2ⁿ − 1** movimientos. Con 3 discos: 7. Con 64 discos: 18.446.744.073.709.551.615. Al ritmo de un movimiento por segundo, el universo se muere antes. Hanói es el ejemplo de que la recursión puede resolver en 6 líneas lo que iterativamente te haría sufrir de verdad.

> [!WARNING]
> Hanói es **exponencial** (O(2ⁿ)) por naturaleza: no es que lo hayas implementado mal, es que el problema *es* exponencial. La moraleja es distinta: una solución recursiva corta y clara vale más que un bucle ilegible que intenta emularla con pilas manuales.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Cuál es la complejidad del factorial recursivo?
2. ¿Cuántas veces se llama `fibo(1)` al calcular `fibo(5)` con el método ingenuo? (pista: míralo en el árbol)
3. ¿Qué hace la memoización para mejorar Fibonacci?
4. ¿Cuántos movimientos necesita Hanói con 4 discos?

<details>
<summary>🔄 Respuestas</summary>

1. **O(n)**: una llamada por cada número, y cada llamada hace trabajo constante.
2. **5 veces** (en el árbol de la unidad se ve claramente: `fibo(1)` aparece en 5 hojas).
3. Guarda cada resultado ya calculado en un array para **no repetir cálculos**: de O(2ⁿ) a O(n).
4. **15** movimientos (`2⁴ − 1`).

</details>

---

## ✅ Resumen en 3 frases

1. El **factorial** (O(n)) y los **palíndromos** son los ejemplos "lineales": recorren el problema hacia el caso base sin sorpresas.
2. El **Fibonacci ingenuo** es O(2ⁿ): los números explotan porque repite cálculos; la **memoización** lo deja en O(n).
3. Las **torres de Hanói** demuestran que la recursión expresa en pocas líneas problemas que iterativamente son un infierno.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Memoización | Guardar resultados ya calculados para reutilizarlos |
> | Palíndromo | Palabra que se lee igual de delante atrás: *salas* |
> | Recursión lineal | La que hace una sola llamada recursiva por invocación (factorial) |
> | Recursión exponencial | La que se bifurca en varias llamadas (Fibonacci, Hanói) |
> | `long` | Tipo para números grandes... hasta que el factorial lo desborda |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-algoritmica-tecnicas) · **Anterior:** [01 · Recursividad](/ApuntesProgramacion/05-algoritmica-tecnicas/01-recursividad) · **Siguiente:** [03 · Divide y vencerás](/ApuntesProgramacion/05-algoritmica-tecnicas/03-divide-y-venceras)
