---
title: 04 — Bucle for i bucles anidats
description: El comptador obsessiu que repetix un nombre exacte de voltes 🔢
---

<p><small>El comptador obsessiu que repetix un nombre exacte de voltes 🔢</small></p>

> 🗺️ **Estàs en:** 🔀 **U03 · Estructures de Control i Excepcions** → 04 · Bucle for i bucles anidats

---

## 📬 La idea en una frase

> **`for` és un bucle amb comptador de sèrie: declara la variable, posa la condició i l'actualitza en la mateixa línia, ideal per a "repetix N vegades".**

El `while` repetia "mentres passe alguna cosa". El `for` repetix "un nombre exacte de vegades". És el bucle favorit per a recórrer coses i el que més usaràs en tota la teua carrera.

---

## 🔢 L'anatomia del for

```java
for (inicialitzacio; condicio; actualitzacio) {
    // bloc
}
```

```java
for (int i = 1; i <= 5; i++) {
    System.out.println("Volta " + i);
}
```

Eixida:

```
Volta 1
Volta 2
Volta 3
Volta 4
Volta 5
```

El cicle de vida de `i`:

1. **Inicialització**: `int i = 1` — s'executa una sola vegada, en entrar.
2. **Condició**: `i <= 5` — es comprova abans de cada volta.
3. **Bloc**: s'executa si la condició és `true`.
4. **Actualització**: `i++` — s'executa al final de cada volta.
5. Tornada al pas 2.

> ⚠️ **Advertència:** una coma mal posada en el `for` és l'error d'examen més comú. La sintaxi és: inicialització **`;`** condició **`;`** actualització. Tres parts, dos punts i coma, zero comes entre elles.

---

## 🔁 Els tres bucles són el mateix acudit

Això és `while`, `do-while` i `for` fent exactament el mateix:

```java
int i = 1;                        // inicialització
while (i <= 5) {                   // condició
    System.out.println("Volta " + i);
    i++;                           // actualització
}
```

```java
int i = 1;
do {
    System.out.println("Volta " + i);
    i++;
} while (i <= 5);
```

```java
for (int i = 1; i <= 5; i++) {
    System.out.println("Volta " + i);
}
```

Els tres imprimixen el mateix. El `for` guanya perquè junta les tres parts del control en una línia: és més difícil oblidar el `i++` (adéu, bucles infinits per descuit).

> 💡 **Detall pràctic:** si saps quantes vegades repetiràs → `for`. Si no ho saps → `while`. Regla que et salvarà la vida en l'examen.

---

## 🧩 Bucles anidats: la graella d'exercicis

Un bucle dins d'un altre. Per cada volta del bucle **exterior**, el **interior** s'executa complet.

```java
for (int fila = 1; fila <= 3; fila++) {
    for (int columna = 1; columna <= 4; columna++) {
        System.out.print("* ");
    }
    System.out.println();
}
```

Eixida:

```
* * * *
* * * *
* * * *
```

- El bucle exterior controla les **files** (3).
- El interior controla les **columnes** (4).
- El `println()` sense text després de l'interior salta de línia en acabar cada fila.

> ⚠️ **Advertència:** cada nivell d'anidament multiplica les voltes. Amb 1000 files i 1000 columnes són 1.000.000 d'iteracions. Els bucles anidats són potents, però també la fàbrica de programes lents.

---

## 🏫 Exemple guiat: la taula de multiplicar

```java
public class TaulaMultiplicar {
    public static void main(String[] args) {
        for (int i = 1; i <= 10; i++) {
            System.out.println("7 x " + i + " = " + (7 * i));
        }
    }
}
```

Eixida (primeres línies):

```
7 x 1 = 7
7 x 2 = 14
7 x 3 = 21
...
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan uses un `for`, pregunta: *la condició usa `<` o `<=`?* Un descuit d'un dígit (repetir 9 voltes en comptes de 10) és el bug de l'off-by-one, el més famós de la història.

**Exercici: el triangular**

Sense executar, calcula quants asteriscs imprimix en total este programa:

```java
public class Triangle {
    public static void main(String[] args) {
        for (int fila = 1; fila <= 4; fila++) {
            for (int ast = 1; ast <= fila; ast++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }
}
```

<details>
<summary>🔄 Solució</summary>

Imprimix:

```
*
**
***
****
```

En total, **10 asteriscs** (1 + 2 + 3 + 4). Fixa't en el truc: la condició de l'interior és `ast <= fila`, així que cada fila imprimix tants asteriscs com número de fila. El bucle interior depén del valor de l'exterior: això és el cor dels bucles anidats.

</details>

---

## 🎯 Mini-chequeig

1. Quines són les tres parts del `for`?
2. Quantes vegades s'executa la inicialització?
3. Què imprimix `for (int i = 0; i < 5; i++)`? 5 o 4 voltes?
4. En un bucle anidat, què fa el bucle interior per cada volta de l'exterior?

<details>
<summary>🔄 Respostes</summary>

1. **Inicialització**, **condició** i **actualització**, separades per `;`.
2. **Una sola vegada**, en entrar en el bucle.
3. **5 voltes**: amb `i` valent 0, 1, 2, 3 i 4 (quan `i` arriba a 5, la condició falla).
4. S'executa **complet** (totes les seues voltes) per cada volta de l'exterior.

</details>

---

## ✅ Resum en 3 frases

1. `for` junta **inicialització, condició i actualització** en una línia: ideal per a repetir un nombre conegut de vegades.
2. `while`, `do-while` i `for` són intercanviables; tria `for` quan sàpies les voltes.
3. En els **bucles anidats**, per cada volta de l'exterior el interior s'executa complet, i això multiplica el treball.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `for` | Bucle amb comptador: `for (inici; condicio; avanc)` |
> | Comptador | Variable que compta les voltes (normalment `i`) |
> | Bucle anidat | Un bucle dins d'un altre |
> | Off-by-one | Fallar per un en la condició (`<` vs `<=`) |
> | Iteració | Una volta del bucle |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/03-estructuras-control-excepciones) · **Anterior:** [03 · Bucles: while i do-while](/ApuntesProgramacion/va/03-estructuras-control-excepciones/03-bucles-while-do-while) · **Següent:** [05 · break i continue](/ApuntesProgramacion/va/03-estructuras-control-excepciones/05-break-continue)
