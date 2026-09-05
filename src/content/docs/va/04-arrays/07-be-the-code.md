---
title: "07 · Be the Code: l'aparcament es gestiona"
description: "Inverteix, busca i compacta arrays a mà, sense ajuda de la classe Arrays, com en una entrevista de treball 🕶️"
---

<p><small>Inverteix, busca i compacta arrays a mà, sense ajuda de la classe Arrays, com en una entrevista de treball 🕶️</small></p>

> 🗺️ **Estàs en:** 🅿️ **U04 · Arrays** → 07 · Be the Code: l'aparcament es gestiona

---

## 📬 La idea en una frase

> **Este punt no té teoria nova: té tres reptes. Invertir un array sense mirar apunts, buscar totes les posicions d'un valor i caçar els errors d'un array que es rebel·la.**

La classe `Arrays` t'ho dona tot fet: ordena, copia, busca... Però quan et demanen "inverteix este array" en una entrevista, ningú et deixa usar `Arrays.sort()`. Cal saber-ho fer a mà. Este punt és el teu gimnàs.

---

## 🕶️ Don Tip: la recepta mental de l'invers al lloc

Invertir un array és el clàssic de les entrevistes. La recepta mental:

1. Dos punters: `izquierda = 0` i `derecha = array.length - 1`.
2. Mentre `izquierda < derecha`: intercanvia `array[izquierda]` i `array[derecha]`.
3. `izquierda++` i `derecha--`.
4. Quan es creuen, ja està.

L'error més comú: crear un **array auxiliar** quan no cal. Al lloc, amb dos punters i una variable temporal, és O(n) de temps i O(1) de memòria. Això és el que impressiona en una entrevista.

---

## 🧩 REPTE 1: Invertir l'array al lloc

Completa el mètode `invertir` perquè done la volta a l'array **sense crear un altre array**. Ha de mostrar `5 4 3 2 1`:

```java
public class RetoInverso {

    public static void invertir(int[] array) {
        // 🧠 EL TEU CODI ACÍ
    }

    public static void main(String[] args) {
        int[] datos = {1, 2, 3, 4, 5};
        invertir(datos);
        for (int n : datos) {
            System.out.print(n + " ");
        }
    }
}
```

**Passos guiats (resisteix a llegir-los tots de colp):**

1. Declara els dos punters.
   <details><summary>Atascat?</summary>`int izquierda = 0;` i `int derecha = array.length - 1;`</details>
2. Escriu el `while` amb la condició correcta.
   <details><summary>Atascat?</summary>`while (izquierda < derecha) { ... }` — quan es creuen, ja està.</details>
3. Intercanvia els dos elements amb una variable temporal.
   <details><summary>Atascat?</summary>`int temp = array[izquierda]; array[izquierda] = array[derecha]; array[derecha] = temp;`</details>
4. Mou els punters cap al centre.
   <details><summary>Atascat?</summary>`izquierda++; derecha--;`</details>

<details>
<summary>🔄 Solució completa</summary>

```java
public static void invertir(int[] array) {
    int izquierda = 0;
    int derecha = array.length - 1;

    while (izquierda < derecha) {
        int temp = array[izquierda];
        array[izquierda] = array[derecha];
        array[derecha] = temp;
        izquierda++;
        derecha--;
    }
}
```

</details>

---

## 🧩 REPTE 2: Buscar totes les posicions

`binarySearch` et dona una posició. Este repte et demana **totes**. Escriu un mètode que torne un array amb tots els índexs on apareix un valor (buit si no apareix):

```java
public class RetoBusqueda {

    public static int[] posiciones(int[] datos, int buscado) {
        // 🧠 EL TEU CODI ACÍ
        return new int[0];
    }

    public static void main(String[] args) {
        int[] datos = {3, 7, 2, 7, 9, 7, 1};
        System.out.println(java.util.Arrays.toString(posiciones(datos, 7)));
        System.out.println(java.util.Arrays.toString(posiciones(datos, 5)));
    }
}
```

Ha de mostrar `[1, 3, 5]` i `[]`.

**Passos guiats:**

1. Primera passada: compta quantes voltes apareix.
   <details><summary>Atascat?</summary>Un `for` amb un comptador que puge quan `datos[i] == buscado`.</details>
2. Crea l'array de resultats amb eixa grandària.
   <details><summary>Atascat?</summary>`int[] resultado = new int[cuantas];`</details>
3. Segona passada: ompli les posicions.
   <details><summary>Atascat?</summary>Un segon `for` que, quan trobe el valor, faça `resultado[k++] = i;`</details>

> 💡 **Consell de depuració:** este "comptar primer, crear després" és un patró que es repetix: no pots crear l'array de resultats fins a saber quantes places necessita. Quan la grandària depén de les dades, es fa en dues passades.

<details>
<summary>🔄 Solució completa</summary>

```java
public static int[] posiciones(int[] datos, int buscado) {
    int cuantas = 0;
    for (int i = 0; i < datos.length; i++) {
        if (datos[i] == buscado) {
            cuantas++;
        }
    }

    int[] resultado = new int[cuantas];
    int k = 0;
    for (int i = 0; i < datos.length; i++) {
        if (datos[i] == buscado) {
            resultado[k++] = i;
        }
    }
    return resultado;
}
```

</details>

---

## 🧩 EL LÍO: l'aparcament que es va rebel·lar

L'encarregat de l'aparcament ha escrit això per a "deixar les places imparelles buides". Alguna cosa fa mala olor. Troba els errors:

```java
public class ParkingLioso {
    public static void vaciarImpares(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 1) {
                arr[i] = null;   // 🚨 compila això?
            }
        }
    }
}
```

> 🕶️ **Don Tip:** pregunta sempre: quin tipus de dada guarda este array? Un `int` no pot valer `null`; un `Integer` sí (però això és un objecte de la U10).

<details>
<summary>🔄 Solució</summary>

**No compila.** `arr` és un `int[]`, i `int` és un tipus primitiu: **no pot valer `null`**. `null` només cap en variables de tipus objecte (`String`, `Integer`, `Alumno`...).

Si volgueres "buidar" un `int[]`, hauríes de posar un valor de sentinella, per exemple `0` o `-1`. I si de veritat necessites places buides de veritat, hauríes de usar un array d'objectes (`Integer[]`), que veuràs en la U10 amb les col·leccions.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina condició usa el `while` de l'invers al lloc: `<` o `<=`?
2. Què passa si uses `<=` en l'invers amb un array de longitud senar?
3. Per què el patró "comptar primer, crear després" necessita dues passades?
4. Pot un `int[]` guardar `null`? I un `String[]`?

<details>
<summary>🔄 Respostes</summary>

1. `izquierda < derecha`. Amb `<=` et sobraria el pas en què tots dos punters apunten al mateix element (amb longitud senar), que a més intercanviaria un element amb si mateix.
2. Amb longitud senar, a la volta central `izquierda == derecha`: intercanvies l'element amb si mateix (inútil però inofensiu). Amb `<` ni tan sols entres ací.
3. Perquè no saps quantes places necessita l'array de resultats fins a comptar les coincidències. Els arrays tenen grandària fixa: cal saber-la abans de crear-los.
4. No: `int` és primitiu i no accepta `null`. Sí: `String` és un objecte i el seu valor per defecte és `null`.

</details>

---

## ✅ Resum en 3 frases

1. **Invertir al lloc** és el clàssic de les entrevistes: dos punters (`izquierda`/`derecha`), intercanvi amb `temp`, i `while (izquierda < derecha)`.
2. Quan la grandària del resultat **depén de les dades**, es fa servir el patró de **dues passades**: comptar primer, crear i omplir després.
3. `null` no cap en un array de **primitius**: només en arrays d'objectes. Amb `int[]` s'usen valors de sentinella.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Invertir al lloc | Donar la volta a l'array sense crear-ne un altre, amb dos punters |
> | Variable temporal | El `temp` que guarda un valor durant l'intercanvi |
> | Dues passades | Comptar primer i crear/omplir després (grandària dependent de les dades) |
> | Valor de sentinella | Un valor especial (`-1`, `0`) que significa "buit" en primitius |
> | Punter | Índex que delimita una zona (`izquierda`, `derecha`) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/04-arrays) · **Anterior:** [06 · Aplicacions dels arrays](/ApuntesProgramacion/va/04-arrays/06-aplicaciones-arrays) · **Següent:** [08 · Array-revelde: errors comuns i depuració](/ApuntesProgramacion/va/04-arrays/08-array-revelde)