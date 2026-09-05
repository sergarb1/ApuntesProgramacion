---
title: "05 — Arrays i mètodes"
description: "Passar arrays a mètodes i el pas per referència: el testimoni que es compartix, no es copia 🏃"
---

<p><small>Passar arrays a mètodes i el pas per referència: el testimoni que es compartix, no es copia 🏃</small></p>

> 🗺️ **Estàs en:** 📚 **U09 · Arrays i Col·leccions** → 05 · Arrays i mètodes

---

## 📬 La idea en una frase

> **Quan passes un array a un mètode, passes la referència, no les dades: el mètode compartix el teu aparcament i, si toca un cotxe, el canvi es veu fora.**

Ací se't cauran les ulleres (o se't posaran de moda). En la U06 vas vore que Java passa els arguments **per valor**. Però els arrays semblen arribar per referència... La clau: es passa per valor la **còpia de la referència**. L'array no es copia; només es copia l'adreça on és.

---

## 🏃 Passant el testimoni

Mira este programa i la seua eixida:

```java
public class ArraysMetodos {
    public static void main(String[] args) {
        int[] edades = {10, 20, 30};
        modificar(edades);
        System.out.println(edades[0]); // 99
    }

    public static void modificar(int[] arr) {
        arr[0] = 99;
    }
}
```

Imprimeix `99`, no `10`. El mètode `modificar` ha canviat la plaça 0 de l'array `edades`... encara que l'array es va crear en `main`. Com és possible si Java passa per valor?

L'explicació: **la referència** (l'adreça de memòria on viu l'array) es copia en passar al mètode. La còpia i l'original apunten al **mateix aparcament**. Quan el mètode fa `arr[0] = 99`, no canvia la seua còpia de la referència: canvia el contingut de l'objecte al qual tots dos apunten.

> 📝 **Nota:** això NO és un pas per referència de veritat. Java mai passa la variable per referència. Passa una còpia de la referència (per això es diu *pass-by-value*). Però com l'array és un objecte, eixa còpia apunta al mateix lloc.

---

## 🆚 Primitius vs arrays: la diferència clau

Compara el comportament:

```java
public class PasoDeDatos {
    public static void main(String[] args) {
        int numero = 5;
        cambiarNumero(numero);
        System.out.println(numero);   // 5 (el primitiu NO canvia)

        int[] arr = {1, 2, 3};
        cambiarArray(arr);
        System.out.println(arr[0]);   // 99 (l'array SÍ canvia)
    }

    static void cambiarNumero(int n) {
        n = 99;                       // canvia la còpia, l'original seguix en 5
    }

    static void cambiarArray(int[] a) {
        a[0] = 99;                    // canvia el contingut de l'objecte compartit
    }
}
```

| Tipus | Què rep el mètode | Es modifica fora? |
|---|---|---|
| `int`, `double`, `boolean`... | Una còpia del valor | No |
| `String` | Una còpia de la referència (String és immutable) | No (per immutable) |
| Array (`int[]`, `String[]`...) | Una còpia de la referència | Sí, si es modifiquen elements |
| Objectes | Una còpia de la referència | Sí, si es modifiquen atributs |

> ⚠️ **Advertència:** si dins del mètode fas `arr = otroArray`, NO canvies l'array original: només reassignes la teua còpia de la referència. Per a modificar l'original, toca elements (`arr[i] = ...`) o atributs de l'objecte, mai la variable.

---

## 🧪 Mètodes que usen arrays

### Rebre un array per a calcular

```java
public static double media(int[] notas) {
    int suma = 0;
    for (int n : notas) {
        suma += n;
    }
    return (double) suma / notas.length;
}
```

### Modificar un array (el canvi es veu fora)

```java
public static void duplicar(int[] arr) {
    for (int i = 0; i < arr.length; i++) {
        arr[i] *= 2;
    }
}
```

### Tornar un array nou

Els mètodes també poden **tornar** arrays. Ací se'n crea un de nou i s'ompli:

```java
public static int[] primerosCuadrados(int n) {
    int[] resultado = new int[n];
    for (int i = 0; i < n; i++) {
        resultado[i] = (i + 1) * (i + 1);
    }
    return resultado;
}

// Al main:
int[] cuadrados = primerosCuadrados(4);
System.out.println(Arrays.toString(cuadrados)); // [1, 4, 9, 16]
```

Quan tornes un array, tornes una **referència** a un objecte del heap. Qui la rep pot usar i modificar eixe objecte. Per això, si no vols que te'l toquen, torna una còpia (`Arrays.copyOf`).

---

## 🏁 El famós `main(String[] args)`

Des de la U01 portes escrivint `main(String[] args)` sense parar-te a pensar. És un mètode que rep un array de Strings! Eixos són els arguments de línia de comandes:

```java
public class Saludo {
    public static void main(String[] args) {
        System.out.println("Hola, " + args[0]);
    }
}
```

Si l'executes amb `java Saludo Ana`, `args` serà `{"Ana"}` i imprimirà `Hola, Ana`. Si l'executes sense arguments i accedixes a `args[0]`, `ArrayIndexOutOfBoundsException` — el mateix error del punt 1, ara amb la cara de `args`.

> 💡 **Consell:** `args.length` et diu quants arguments t'han passat. Comprova sempre abans d'accedir: `if (args.length > 0) { ... }`.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** els arrays es passen per referència (còpia de la referència). Les variables primitives es passen per valor. Si ho entens ací, entens el 90% dels bugs rars del curs.

**Exercici: l'array al quadrat**

```java
import java.util.Arrays;

public class BeTheArrayRevelde {
    public static void main(String[] args) {
        int[] nums = {1, 2, 3, 4, 5};
        for (int i = 0; i < nums.length; i++) {
            nums[i] = nums[i] * nums[i];
        }
        System.out.println(nums[2]);
    }
}
```

**Què imprimeix?**

- (A) 3
- (B) 6
- (C) 9
- (D) 25

<details>
<summary>🔄 Solució</summary>

La **C**. Es fa el quadrat de cada número al lloc: `{1, 4, 9, 16, 25}`. `nums[2]` = 9. No hi ha trampa de referències ací perquè tot passa al mateix mètode, però el patró (`arr[i] = ...`) és el mateix que usaríes per a modificar un array passat a un mètode.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què imprimeix este codi: `int[] a = {1,2,3}; cambiar(a);` on `cambiar(int[] x) { x[0] = 7; }`?
2. I si el mètode fa `x = new int[]{9,9,9}` en comptes de tocar `x[0]`?
3. `String` es comporta com un array o com un primitiu al passar-lo a un mètode?
4. Què guarda realment la variable `args` de `main`?

<details>
<summary>🔄 Respostes</summary>

1. `7`. El mètode modifica el contingut de l'objecte compartit, i el canvi es veu en `main`.
2. Res: l'array original seguix `{1, 2, 3}`. `x = new int[]{...}` només reassigna la còpia local de la referència.
3. Com un primitiu "especial": la referència es copia, però `String` és immutable, així que cap mètode no pot canviar el seu contingut. L'original mai canvia.
4. Un array de `String` amb els arguments de línia de comandes. `args[0]` és el primer, `args.length` quants n'hi ha.

</details>

---

## ✅ Resum en 3 frases

1. Els **arrays es passen per referència** (una còpia de la referència a l'objecte compartit): modificar-los dins d'un mètode es veu fora.
2. Els **primitius es passen per valor**: el mètode rep una còpia i l'original no canvia; els `String`, per ser immutables, es comporten com ells.
3. Els mètodes poden **tornar arrays** (una referència a un objecte nou) i `main(String[] args)` és, en realitat, un mètode que rep un array.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Pas per valor | Es copia la dada (primitius, referències) |
> | Pas per referència | Es compartix l'objecte (efecte visible en arrays) |
> | Referència | Adreça de memòria on viu l'objecte |
> | Àlies | Dues variables que apunten al mateix objecte |
> | Arguments de `main` | L'array `args` amb els paràmetres de la línia de comandes |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/09-arrays-colecciones) · **Anterior:** [04 · La classe Arrays: la teua navalla suïssa](/ApuntesProgramacion/va/09-arrays-colecciones/04-clase-arrays) · **Següent:** [06 · ArrayList i el Java Collections Framework](/ApuntesProgramacion/va/09-arrays-colecciones/06-arraylist-jcf)