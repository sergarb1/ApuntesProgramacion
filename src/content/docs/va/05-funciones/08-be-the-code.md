---
title: "08 · Be the Code"
description: "Refactoritza un programa de notes en casa, pas a pas, sense copiar solucions: els verbs, les firmes i el main que es llig sol 🛠️"
---

<p><small>Refactoritza un programa de notes en casa, pas a pas, sense copiar solucions: els verbs, les firmes i el main que es llig sol 🛠️</small></p>

> 🗺️ **Estàs en:** 🔧 **U05 · Funcions i mètodes** → 08 · Be the Code

---

## 📬 La idea en una frase

> **Este punt no té teoria nova: té un programa de 30 línies que has de trossejar amb les teues mans. Només demanes pistes quan t'atuesques de veritat.**

El programa d'abans (tot en `main`) és el teu taller de hui. La teua missió: convertir-lo en una orquestra de mètodes sense canviar el que imprimeix. Si ho has fet a mà, domines la unitat sencera.

---

## 🛠️ El teu punt de partida

```java
import java.util.Scanner;

public class InformeNotas {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        double suma = 0;
        boolean haySuspensa = false;

        for (int i = 0; i < 5; i++) {
            System.out.print("Nota " + (i + 1) + ": ");
            double nota = teclado.nextDouble();
            suma += nota;
            if (nota < 5) {
                haySuspensa = true;
            }
        }

        double media = suma / 5;
        System.out.println("Mitjana: " + media);

        if (haySuspensa) {
            System.out.println("Hi ha suspesa: a per ella.");
        } else if (media >= 7) {
            System.out.println("¡Qué nota!");
        } else {
            System.out.println("Aprovat amb genolls.");
        }
    }
}
```

Abans d'escriure res, respon en paper (en serio, en paper):

1. Quants **verbs amb nom propi** veus? (pista: tres: llegir, calcular, mostrar)
2. Quines dades necessita cadascun i **què torna** cadascun?
3. Què queda en `main` després de trossejar?

---

## 🪜 Pas a pas (pistes que no regalen el final)

1. Crea `static double[] leerNotas(int cantidad)` davall de `main`.
   <details><summary>🪶 Aturat?</summary>Usa un `Scanner` **dins** del mètode, un `for` de `cantidad` voltes i un array `double[] notas = new double[cantidad]`. Torna `notas` al final.</details>
2. Crea `static double calcularMedia(double[] notas)`.
   <details><summary>🪶 Aturat?</summary>Suma les notes en un bucle i divideix entre `notas.length`. L'array arriba com a paràmetre; res de variables globals.</details>
3. Crea `static boolean tieneSuspensa(double[] notas)`.
   <details><summary>🪶 Aturat?</summary>Bucle: si alguna nota és menor que 5, `return true` a l'instant. Si el bucle acaba, `return false` (tots els camins tanquen).</details>
4. Crea `static void mostrarVeredicto(double media, boolean suspensa)`.
   <details><summary>🪶 Aturat?</summary>Les dades ja estan calculades: este mètode només **conta** el resultat. Dos paràmetres, sense `return`.</details>
5. Reescriu `main` com a resum: llegir → mitjana → suspesa → mostrar.
   <details><summary>🪶 Aturat?</summary>Quatre crides, zero bucles en `main`. Executa i compara l'eixida amb l'original.</details>

<details>
<summary>🔄 Solució completa</summary>

```java
import java.util.Scanner;

public class InformeNotas {

    public static void main(String[] args) {
        double[] notas = leerNotas(5);
        double media = calcularMedia(notas);
        boolean suspensa = tieneSuspensa(notas);
        mostrarVeredicto(media, suspensa);
    }

    static double[] leerNotas(int cantidad) {
        Scanner teclado = new Scanner(System.in);
        double[] notas = new double[cantidad];
        for (int i = 0; i < cantidad; i++) {
            System.out.print("Nota " + (i + 1) + ": ");
            notas[i] = teclado.nextDouble();
        }
        return notas;
    }

    static double calcularMedia(double[] notas) {
        double suma = 0;
        for (int i = 0; i < notas.length; i++) {
            suma += notas[i];
        }
        return suma / notas.length;
    }

    static boolean tieneSuspensa(double[] notas) {
        for (int i = 0; i < notas.length; i++) {
            if (notas[i] < 5) {
                return true;
            }
        }
        return false;
    }

    static void mostrarVeredicto(double media, boolean suspensa) {
        System.out.println("Mitjana: " + media);
        if (suspensa) {
            System.out.println("Hi ha suspesa: a per ella.");
        } else if (media >= 7) {
            System.out.println("¡Qué nota!");
        } else {
            System.out.println("Aprovat amb genolls.");
        }
    }
}
```

</details>

> ⚠️ **Advertència:** l'eixida ha de ser **idèntica** abans i després. Si canvia, has mogut una línia de més: torne al pas anterior (refactoritzar és canviar la forma, mai el comportament).

---

## 🧪 El Lío: el refactor malograt

El teu company va refactoritzar i ara això **no compila**:

```java
public class MalRefactor {
    public static void main(String[] args) {
        double m = media(3, 4, 5);
        System.out.println(m);
    }

    static void media(int a, int b, int c) {
        double resultado = (a + b + c) / 3.0;
        System.out.println(resultado);
    }
}
```

**Pistes (no mires la solució encara):**

1. Què vol fer `main` amb el resultat de `media`?
2. Què diu la firma que torna...?
3. Què passa amb el `println` de dins: és ofici de `media` o de qui crida?

<details>
<summary>🔄 Solució</summary>

`main` intenta guardar en `double m` el resultat d'un mètode `void`: `void cannot be converted to double`. Dos arregles possibles; el correcte és:

```java
static double media(int a, int b, int c) {
    return (a + b + c) / 3.0;
}
```

i llevada el `println` de dins (o deixar-lo si `media` és de veritat "mostrar mitjana"... però llavors no s'anomenaria `media`). Calcula → torna; qui crida imprimeix.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quines dues preguntes et fas de cada verb abans de crear el seu mètode? (entrades i eixides)
2. Per què `leerNotas` torna `double[]` i no imprimeix les notes?
3. Què ha de passar si trosseges bé i executes?
4. Quina és la senyal que has trossejat malament?

<details>
<summary>🔄 Respostes</summary>

1. Quins **paràmetres** necessita? Quin **retorn** té (o és `void`)?
2. Perquè `main` decidisca després: calcular mitjana, buscar suspeses… les dades viuen més enllà del llegir.
3. L'eixida és idèntica al programa original.
4. Va canviar el comportament, o `main` continua amb bucles dins (no l'has convertit en resum).

</details>

---

## ✅ Resum en 3 frases

1. Trossejar = **verb → mètode** amb firma clara, moure el codi i deixar una crida en `main`.
2. El `main` final es llig com un resum: llegir → calcular → mostrar, sense un sol `for`.
3. Refactoritzar **mai** canvia l'eixida: si canvia, es revertix el pas.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Refactoritzar | Reorganitzar sense canviar el comportament |
> | Extraure mètode | Sacar un bloc a la seua pròpia funció |
> | Resum en `main` | Línies que es llegeixen com el pla del programa |
> | Firma clara | Nom + paràmetres + retorn que s'entenen sols |
> | Abans/després | Prova que la refactorització va neta |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-funciones) · **Anterior:** [07 · Divideix el problema](/ApuntesProgramacion/va/05-funciones/07-divide-problema) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/05-funciones/09-repaso-interactivo)
