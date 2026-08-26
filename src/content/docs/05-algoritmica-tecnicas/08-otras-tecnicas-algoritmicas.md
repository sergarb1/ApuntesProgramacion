---
title: "08 — Otras técnicas algorítmicas"
description: "Dos fichas más para tu cinturón: los algoritmos voraces (greedy) y el backtracking 🧠"
---

<p><small>Dos fichas más para tu cinturón: los algoritmos voraces (greedy) y el backtracking 🧠</small></p>

> 🗺️ **Estás en:** ⚡ **U05 · Algorítmica II: Técnicas** → 08 · Otras técnicas algorítmicas

---

## 📬 La idea en una frase

> **Recursividad y divide y vencerás no son las únicas técnicas: los algoritmos voraces toman la decisión que mejor pinta en cada paso, y el backtracking prueba caminos y retrocede cuando llega a un callejón sin salida.**

Esta unidad ya te ha dado las herramientas estrella. Estos dos puntos extra son "para saber que existen" y reconocerlos cuando los veas, porque aparecen en montones de problemas reales (y en entrevistas). Te aviso: aquí no vas a implementar nada gigante, vas a *entender la idea* con ejemplos sencillos.

---

## 🍬 Algoritmos voraces (greedy)

**La idea:** en cada paso, toma la decisión que parece mejor *en ese momento*, sin mirar hacia atrás ni hacia delante. Como quien compra caramelos y siempre coge el más grande de los que quedan.

**La regla de oro:** un greedy solo funciona si la decisión local óptima conduce a la solución global óptima. Eso no siempre pasa. Cuando funciona, es de los algoritmos más rápidos y simples que existen.

### Ejemplo clásico: el cambio de monedas

Dado un precio y el dinero entregado, devolver el cambio con el **menor número de monedas**:

```java
public class CambioMonedas {

    public static void main(String[] args) {
        int[] monedas = {200, 100, 50, 20, 10, 5, 2, 1};
        int cambio = 173;   // 1,73 €

        for (int moneda : monedas) {
            int cuantas = cambio / moneda;
            cambio %= moneda;
            if (cuantas > 0) {
                System.out.println(cuantas + " moneda(s) de " + moneda + " céntimos");
            }
        }
    }
}
```

Salida:

```
1 moneda(s) de 100 céntimos
1 moneda(s) de 50 céntimos
1 moneda(s) de 20 céntimos
3 moneda(s) de 1 céntimos
```

> [!NOTE]
> El algoritmo voraz de la moneda funciona con el sistema de monedas europeo (donde cada moneda es múltiplo de la anterior). Con sistemas raros (p. ej. monedas de 1, 3 y 4), el voraz **falla**: con cambio 6, el voraz daría 4+1+1 (3 monedas) cuando la solución óptima es 3+3 (2 monedas). La lección: *voraz = rápido y simple, pero no siempre óptimo*.

### Otros ejemplos famosos de greedy

- **El problema de la mochila (versión fraccionaria)**: caben solo objetos "a trozos", y llenas la mochila empezando por el de mejor relación valor/peso.
- **El árbol de expansión mínimo (Prim, Kruskal)**: conectas todos los nodos gastando el mínimo cable.
- **El problema del cambio**, como acabas de ver.
- **Planificación de tareas**: atender primero la tarea que termina antes.

---

## 🔁 Backtracking (vuelta atrás)

**La idea:** pruebas una opción; si llegas a un callejón sin salida, **deshaces el último paso** (de ahí el nombre) y pruebas la siguiente opción. Es una búsqueda exhaustiva e inteligente a la vez, porque *no insistes* en caminos que ya sabes que no llevan a nada.

El patrón clásico es recursivo:

```java
public static void resolver(opciones, pasosDados) {
    if (solucionCompleta) { ... }        // caso base: lo lograste
    if (callejonSinSalida) { return; }   // poda: no insistir

    for (opcion : opcionesPosibles) {
        tomar(opcion);
        resolver(opciones, pasosDados + 1);   // probar el siguiente paso
        deshacer(opcion);                     // ¡la vuelta atrás!
    }
}
```

Ese `deshacer(opcion)` es el corazón del backtracking: si el camino no funciona, recoges lo que pusiste y pruebas otro.

### Ejemplo sencillo: el laberinto

En un laberinto representado como una matriz de caracteres (`'.'` = pasillo, `'#'` = pared), intenta avanzar hacia la salida. Cuando una casilla no lleva a ningún sitio, deshaces el movimiento:

```java
public class Laberinto {

    static char[][] lab = {
        {'S', '.', '#', '#'},
        {'#', '.', '.', '#'},
        {'#', '#', '.', 'E'}
    };

    static boolean salir(int fila, int col) {
        if (fila < 0 || col < 0 || fila >= lab.length || col >= lab[0].length) return false;
        if (lab[fila][col] == '#') return false;                 // pared: callejón sin salida
        if (lab[fila][col] == 'E') return true;                  // caso base: ¡salida!

        lab[fila][col] = '*';                                    // marco la casilla como visitada

        boolean encontrado = salir(fila + 1, col)
                          || salir(fila - 1, col)
                          || salir(fila, col + 1)
                          || salir(fila, col - 1);

        lab[fila][col] = '.';                                    // la vuelta atrás: la dejo libre

        return encontrado;
    }

    public static void main(String[] args) {
        System.out.println(salir(0, 0) ? "¡Salida encontrada!" : "No hay salida.");
    }
}
```

Fíjate en las dos jugadas: marcar la casilla como visitada **evita dar vueltas en círculo** y desmarcarla al fallar **permite probar otros caminos**. Ese es el baile del backtracking.

### Otros ejemplos famosos

- **Las 8 reinas**: colocar 8 reinas en un tablero sin que se ataquen.
- **El Sudoku**: probar números y retroceder cuando la casilla se queda sin candidatos.
- **La suma de subconjuntos**: encontrar qué números de una lista suman un valor exacto.
- **Generar todas las permutaciones**: todas las ordenaciones posibles de un conjunto.

> [!TIP]
> Si alguna vez oyes "exhaustiva pero con poda", eso es backtracking: no te rindes hasta probarlo todo, pero **tiras a la basura de inmediato** los caminos que ya sabes que son callejones. Es la diferencia entre buscar una aguja en un pajar y buscar una aguja sabiendo en qué mitad del pajar no está.

---

## 🧠 Y con esto, el panorama

Ya tienes el mapa de las técnicas más importantes:

| Técnica | Idea | Típico para |
|---|---|---|
| Recursividad | Resolver una versión más pequeña de sí mismo | Estructuras jerárquicas |
| Divide y vencerás | Dividir, conquistar, combinar | Ordenación, búsqueda |
| Voraz (greedy) | Decisión óptima local en cada paso | Cambio de monedas, planificación |
| Backtracking | Probar, retroceder, probar de nuevo | Juegos, Sudoku, laberintos |
| Programación dinámica | Memoización + subproblemas superpuestos | Fibonacci optimizado (¡ya lo viste!) |

La programación dinámica es la "evolución" de la memoización del punto 2: la verás con más profundidad en unidades avanzadas, pero ya llevas el germen.

---

## 🎯 Mini-chequeo

Ponte a prueba en 30 segundos (las respuestas están escondidas):

1. ¿Qué significa que un algoritmo sea "voraz"?
2. ¿El greedy del cambio de monedas es siempre óptimo?
3. ¿Cuál es el paso más característico del backtracking?
4. ¿Por qué se marca una casilla como visitada en el laberinto?

<details>
<summary>🔄 Respuestas</summary>

1. Que en **cada paso toma la decisión localmente óptima**, sin mirar el futuro.
2. **No siempre**: con ciertos conjuntos de monedas (1, 3, 4) falla. El voraz es óptimo solo cuando la decisión local garantiza la global.
3. **`deshacer(opcion)`**: si un camino no funciona, se recoge el último paso y se prueba otra opción.
4. Para **no entrar en bucles infinitos**: sin marcar, el algoritmo iría de una casilla a otra sin fin.

</details>

---

## ✅ Resumen en 3 frases

1. Los algoritmos **voraces** eligen en cada paso la mejor opción local; son rapidísimos pero solo óptimos en ciertos problemas.
2. El **backtracking** prueba caminos y, al llegar a un callejón sin salida, **retrocede** deshaciendo el último paso.
3. Junto a la recursividad y divide y vencerás, estas técnicas completan tu cinturón algorítmico básico de DAM.

> 🐛 **Vocabulario rápido**
>
> | Término | Idea general |
> |---|---|
> | Greedy | Tomar la decisión óptima local en cada paso |
> | Óptimo local vs global | Lo mejor ahora vs lo mejor en conjunto |
> | Backtracking | Probar, y al fallar, deshacer y probar otra opción |
> | Poda | Descartar de inmediato los caminos sin salida |
> | Programación dinámica | Memoización + subproblemas que se repiten |

📚 [Volver al índice de la unidad](/ApuntesProgramacion/05-algoritmica-tecnicas) · **Anterior:** [07 · Be the Code: quicksort desde cero](/ApuntesProgramacion/05-algoritmica-tecnicas/07-be-the-code-quicksort) · **Siguiente:** [09 · Repaso interactivo](/ApuntesProgramacion/05-algoritmica-tecnicas/09-repaso-interactivo)
