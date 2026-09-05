---
title: "08 — Be the Code: cerca binària des de zero"
description: Programa binària i bombolla sense xarxa de seguretat, com en les entrevistes de Google 🕶️
---

<p><small>Programa binària i bombolla sense xarxa de seguretat, com en les entrevistes de Google 🕶️</small></p>

> 🗺️ **Estàs en:** 🧩 **U05 · Algorítmica I: Fonaments** → 08 · Be the Code: cerca binària des de zero

---

## 📬 La idea en una frase

> **Este punt no té teoria nova: té dos reptes. Programar cerca binària i bombolla a mà, pas a pas, sense mirar els apunts. Si algun dia vols treballar en una FAANG, això ho has de saber escriure dormit.**

La cerca binària és un clàssic de les entrevistes tècniques de Google, Amazon i companyia. No perquè siga difícil, sinó perquè l'**off-by-one** castiga sense pietat qui confia de més. Anem a entrenar-te perquè no sigues eixa víctima.

---

## 🕶️ Don Tip: la recepta mental de la binària

Abans d'escriure codi, memoritza la recepta:

1. Dos punters: `esquerra = 0` i `dreta = array.length - 1`.
2. Mentre `esquerra <= dreta`: calcula `mig = esquerra + (dreta - esquerra) / 2`.
3. Si `array[mig] == objectiu` → retorna `mig`.
4. Si `array[mig] < objectiu` → `esquerra = mig + 1`.
5. Si no → `dreta = mig - 1`.
6. Fi del bucle → retorna `-1`.

L'error més comú (fins i tot amb 10 anys d'experiència) és l'**off-by-one**: ¿`<=` o `<`? ¿`mig + 1` o `mig`? La resposta: `<=` en la condició, i `mig + 1` / `mig - 1` en moure els punters. Sense el `+1`/`-1`, si l'objectiu no hi és, el bucle es pot quedar girant per sempre.

---

## 🧩 REPTE 1: Cerca binària des de zero

Ací tens l'esquelet. Completa'l. **Sense mirar els apunts.** El teu cervell ha de recordar, no copiar:

```java
public class RepBbinaria {

    public static int cercaBinaria(int[] array, int objectiu) {
        // 🧠 EL TEU CODI ACÍ
        return -1;
    }

    public static void main(String[] args) {
        int[] proves = {1, 3, 5, 7, 9, 11, 13, 15, 17, 19};

        System.out.println("El 7 està en posició: " + cercaBinaria(proves, 7));    // 3
        System.out.println("El 13 està en posició: " + cercaBinaria(proves, 13));  // 6
        System.out.println("El 8 està en posició: " + cercaBinaria(proves, 8));    // -1
        System.out.println("El 19 està en posició: " + cercaBinaria(proves, 19));  // 9
        System.out.println("L'1 està en posició: " + cercaBinaria(proves, 1));     // 0
        System.out.println("Array buit: " + cercaBinaria(new int[]{}, 5));         // -1
    }
}
```

**Passos guiats (resistix a llegir-los tots de cop):**

1. Declara `esquerra` i `dreta`.
   <details><summary>Atascat?</summary>`int esquerra = 0;` i `int dreta = array.length - 1;`</details>
2. Escriu el `while` amb la condició correcta.
   <details><summary>Atascat?</summary>`while (esquerra <= dreta) { ... }`</details>
3. Calcula el `mig`.
   <details><summary>Atascat?</summary>`int mig = esquerra + (dreta - esquerra) / 2;` — la fórmula anti-desbordament.</details>
4. Compara i decidix els tres casos.
   <details><summary>Atascat?</summary>`==` → retorna `mig`; `<` → `esquerra = mig + 1`; `>` → `dreta = mig - 1`.</details>
5. Fora del bucle, retorna el "no trobat".
   <details><summary>Atascat?</summary>`return -1;`</details>

> 💡 **Consell de depuració:** si alguna cosa falla, dibuixa l'array en un paper amb 3 elements i simula els passos amb un objectiu que no hi siga. El paper i el bolígraf són les teues millors ferramentes de depuració. Sí, en ple 2026, i sí, funcionen.

<details>
<summary>🔄 Solució completa</summary>

```java
public static int cercaBinaria(int[] array, int objectiu) {
    if (array == null || array.length == 0) return -1;

    int esquerra = 0;
    int dreta = array.length - 1;

    while (esquerra <= dreta) {
        int mig = esquerra + (dreta - esquerra) / 2;

        if (array[mig] == objectiu) {
            return mig;
        } else if (array[mig] < objectiu) {
            esquerra = mig + 1;
        } else {
            dreta = mig - 1;
        }
    }
    return -1;
}
```

</details>

---

## 🧩 REPTE 2: Bombolla a mà

Ara toca la bombolla. Mateixa regla: sense mirar. Completa el mètode `ordenar` perquè deixe l'array de menor a major. Ha de mostrar `11 12 22 25 34 64 90`:

```java
public class RepBombolla {

    public static void ordenar(int[] array) {
        // 🧠 EL TEU CODI ACÍ
    }

    public static void main(String[] args) {
        int[] dades = {64, 34, 25, 12, 22, 11, 90};

        ordenar(dades);

        for (int nombre : dades) {
            System.out.print(nombre + " ");
        }
    }
}
```

**Passos guiats:**

1. Dos bucles anidats: l'exterior repetix passades.
   <details><summary>Atascat?</summary>`for (int i = 0; i < array.length - 1; i++) { ... }`</details>
2. L'interior compara parelles veïnes, arribant cada vegada un element menys.
   <details><summary>Atascat?</summary>`for (int j = 0; j < array.length - 1 - i; j++) { ... }`</details>
3. Si estan desordenades, intercanvia amb una variable temporal.
   <details><summary>Atascat?</summary>`if (array[j] > array[j + 1]) { int temp = array[j]; array[j] = array[j + 1]; array[j + 1] = temp; }`</details>
4. Extres de nivell: afegix el flag `hiHaIntercanvi` amb el seu `break`.
   <details><summary>Atascat?</summary>Un `boolean hiHaIntercanvi = false;` al principi de cada passada, `true` en intercanviar, i `if (!hiHaIntercanvi) break;` al final de la passada.</details>

<details>
<summary>🔄 Solució completa</summary>

```java
public static void ordenar(int[] array) {
    int n = array.length;
    boolean hiHaIntercanvi;

    for (int i = 0; i < n - 1; i++) {
        hiHaIntercanvi = false;

        for (int j = 0; j < n - 1 - i; j++) {
            if (array[j] > array[j + 1]) {
                int temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
                hiHaIntercanvi = true;
            }
        }

        if (!hiHaIntercanvi) break;
    }
}
```

</details>

---

## 🧩 EL LIO: la bombolla que apesta

El departament de qualitat ha rebut este algoritme. Alguna cosa fa mala olor. Identifica els errors i explica per què no funciona:

```java
public class BombollaLiosa {
    public static void ordenar(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr.length; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
}
```

> 🕶️ **Don Tip:** quan un bucle accedix a `arr[j + 1]`, assegura't que `j + 1` no isca de l'array. I pregunta't: recórrec menys elements en cada passada?

<details>
<summary>🔄 Solució</summary>

Hi ha **dos errors**:

1. **Error d'índexs (i de càstig segur):** el bucle interior va `j < arr.length`, així que quan `j = arr.length - 1`, accedix a `arr[j + 1]` = `arr[arr.length]`, que **no existix** → `ArrayIndexOutOfBoundsException`. L'interior ha d'anar fins a `arr.length - 1 - i`.
2. **Error de rendiment:** el bucle exterior recorre `arr.length` vegades i l'interior **sempre** recorre tot l'array, sense aprofitar que cada passada deixa un element col·locat al final. A més, sense el flag `hiHaIntercanvi`, continua fent passades encara que l'array ja estiga ordenat. És bombolla "sense polir", i es nota.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. En la cerca binària, quina condició usa el `while`: `esquerra <= dreta` o `esquerra < dreta`?
2. Per què `esquerra = mig` (sense el `+1`) pot penjar el bucle?
3. Què passa si fas la bombolla amb `j < array.length` en el bucle interior?
4. Per a què servix el flag `hiHaIntercanvi` en la bombolla?

<details>
<summary>🔄 Respostes</summary>

1. `esquerra <= dreta`. Amb `<`, et pots perdre l'element que queda just en `mig` quan els punters es creuen.
2. Perquè si `mig` no és l'objectiu, en reassignar `esquerra = mig` (o `dreta = mig`) el segment **no es reduïx** i el bucle es repetix amb els mateixos límits per sempre.
3. `ArrayIndexOutOfBoundsException`: en arribar a `j = array.length - 1`, `arr[j + 1]` està fora de l'array.
4. Detectar que l'array ja està ordenat per a parar (`break`) en comptes de seguir fent passades inútils.

</details>

---

## ✅ Resum en 3 frases

1. La cerca binària s'escriu amb **dos punters**, el **mig anti-desbordament** i els **`+1`/`-1` sagrats**; amb això, no hi ha off-by-one que valga.
2. La bombolla es construïx amb **dos bucles anidats**, un intercanvi amb variable temporal i, si eres llest, un **flag** que talla quan ja està ordenat.
3. Escriure tots dos **a mà** (sense mirar) és l'exercici de la unitat: si ho aconsegueixes, et portes la medalla al cinturó.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Off-by-one | Error de "per un": `<=` vs `<`, `mig+1` vs `mig` |
> | Punter | Índex que delimita el segment actual (`esquerra`, `dreta`) |
> | Anti-desbordament | `esquerra + (dreta - esquerra) / 2` en comptes de `(esquerra+dreta)/2` |
> | Variable temporal | El `temp` que guarda un valor durant l'intercanvi |
> | Flag | Booleà que avisa de si va passar alguna cosa en la passada |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-fundamentos) · **Anterior:** [07 · Triar l'algoritme adequat](/ApuntesProgramacion/va/05-algoritmica-fundamentos/07-elegir-algoritmo) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/05-algoritmica-fundamentos/09-repaso-interactivo)
