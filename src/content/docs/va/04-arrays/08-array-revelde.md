---
title: "08 · Array-revelde: errors comuns i depuració"
description: "La galeria de monstres dels arrays: excepcions, null, comparacions que no comparen i com caçar-los amb calma 🐛"
---

<p><small>La galeria de monstres dels arrays: excepcions, null, comparacions que no comparen i com caçar-los amb calma 🐛</small></p>

> 🗺️ **Estàs en:** 🅿️ **U04 · Arrays** → 08 · Array-revelde: errors comuns i depuració

---

## 📬 La idea en una frase

> **Els arrays no es rebel·len per maldat: es rebel·len perquè oblides els límits. Conéixer els 6 monstres típics és la mitat de la batalla; saber depurar és l'altra mitat.**

A aquestes alçades ja has escrit els teus primers arrays. I, si ets humà, ja t'has estavellat una volta (o dos, o cinquanta). Este punt recopila els errors més comuns de l'univers array perquè els reconegues a l'instant i deixes de plorar sobre el teclat.

---

## 👹 La galeria de monstres

### Monstre 1: la `ArrayIndexOutOfBoundsException`

El rei del mambo. Eixes de les places vàlides (`0` a `length - 1`).

```java
int[] a = {10, 20, 30};
System.out.println(a[3]); // Index 3 out of bounds for length 3
```

> 🔍 **Diagnòstic:** el missatge et diu l'índex i la longitud. Si demanes `a[3]` i hi ha 3 places (0, 1, 2), el problema és el `<=` del teu bucle o un índex calculat malament. Llig el missatge: no és un misteri, és una pista.

### Monstre 2: la `NullPointerException`

Recorres un array d'objectes acabat de crear i toques una plaça sense objecte.

```java
String[] nombres = new String[3];
System.out.println(nombres[0].toUpperCase()); // BOOM: null no té mètodes
```

> 🔍 **Diagnòstic:** les places d'un `String[]` nou estan plenes de `null`. Pregunta abans: `if (nombres[i] != null) { ... }` o crea els objectes al principi.

### Monstre 3: imprimir sense `Arrays.toString`

```java
int[] a = {1, 2, 3};
System.out.println(a); // [I@6d06d69c
```

> 🔍 **Diagnòstic:** imprimeix l'adreça de memòria, no les dades. Sempre `Arrays.toString(a)` (o `Arrays.deepToString` per a 2D). Ho vas vore en el punt 4 i no et cansaràs de vore-ho.

### Monstre 4: comparar amb `==`

```java
int[] a = {1, 2, 3};
int[] b = {1, 2, 3};
System.out.println(a == b);            // false: són el MATEIX objecte?
System.out.println(a.equals(b));       // false també: els arrays no sobreescriuen equals
System.out.println(Arrays.equals(a, b)); // true: això compara contingut
```

> 🔍 **Diagnòstic:** `==` i `equals` comparen **referències**. Per a comparar contingut: `Arrays.equals(a, b)`.

### Monstre 5: confondre `length`, `length()` i `size()`

```java
int[] a = {1, 2, 3};
String s = "Hola";
System.out.println(a.length());  // no compila: array usa length (atribut)
System.out.println(s.length);    // no compila: String usa length() (mètode)
```

> 🔍 **Diagnòstic:** la regla d'or: **array → `length`** (sense parèntesis), **`String` → `length()`**, **col·lecció → `size()`**. Els exàmens adoren esta trampa.

### Monstre 6: intentar modificar amb `for-each`

```java
int[] a = {1, 2, 3};
for (int n : a) {
    n = n * 10;   // pugen els valors? NO: canvia una còpia
}
System.out.println(Arrays.toString(a)); // [1, 2, 3]
```

> 🔍 **Diagnòstic:** el `for-each` és de només lectura. La variable `n` és una còpia del valor de la plaça. Per a modificar, `for` amb índex: `a[i] = a[i] * 10;`.

---

## 🤬 CONRAD VS EL MÓN: "L'array que no es calla"

> *CONRAD, el nostre compilador rondinaire, té la tassa plena i els arrays trencats sobre la taula.*

**CONRAD:** — ¡ALTRES VEGADES! Em porten un programa i em diuen: *CONRAD, em dona ArrayIndexOutOfBoundsException*. I jo: i tu què has fet? *Doncs recórrer l'array.* AMB QUÈ? *Doncs amb un for... crec.* ¡AI, MARE MEUA! Un for amb quina condició? *Doncs `i <= numeros.length`...* ¡¿`<=`?! ¡PERÒ SI T'HO VAIG DIR EN EL PUNT 2! L'últim índex vàlid és `length - 1`. `<=` et porta a la plaça fantasma i d'allí no torna ningú.

*I després estan els que pregunten per què els ix null. Pregunta: què tens a la plaça?* No ho sé, la vaig crear amb `new String[10]`. *I quantes places has omplit?* Doncs... bé... ¡AH! ¡CAP! Un `String[]` acabat de crear és una fila de `null`. Si no fiques objectes, no hi ha objectes. És tan difícil?

*I el favorit de tots:* no em funciona el bucle que duplica. *Ensenya-me'l.* És un `for-each` que fa `n = n * 2`. *I esperaves canviar l'array?* Doncs sí. ¡EL `for-each` NO MODIFICA! És com un robot lector de matrícules: llig, però no repinta. Per a repintar, índex i claudàtors.

**La lliçó:** els sis monstres tenen nom, missatge i cura. El 90% dels "arrays rebel·les" s'arreglen mirant el missatge d'error amb calma i recordant les regles d'or: límits (`0` a `length-1`), `null` en objectes, `Arrays.toString` per a imprimir, `Arrays.equals` per a comparar, `length` sense parèntesis i `for` amb índex per a modificar.

---

## 🐛 Depurar arrays sense perdre el cap

Quan un array es porta malament, seguix este ordre:

1. **Imprimeix l'array complet** amb `Arrays.toString()` a cada pas. Vore les dades a la vista arregla la mitat dels misteris.
2. **Comprova els límits abans de tocar.** Si vas a accedir a `a[i + 1]`, que `i` no arribe a `length - 1`. Pregunta sempre: pot eixir-se?
3. **Usa el depurador de l'IDE.** Posa un *breakpoint* al bucle i observa `i` a cada volta. Si es passa de `length - 1`, ho veus a la primera.
4. **Paper i boli.** Amb un array de 3 elements i un objectiu que no hi siga, simula el bucle a mà. Sí, en ple segle XXI, i seguix funcionant.
5. **Aïlla l'error.** Dividix el problema: primer ompli i comprova que el contingut és correcte; després el bucle; després el càlcul. Si alguna cosa falla, sabràs quin tram és.

> 💡 **Consell:** el missatge d'excepció de Java no és el teu enemic: és un detectiu que et diu la línia i el motiu. `Index 5 out of bounds for length 5` no deixa lloc a dubtes. LLEGEIX-LO abans de tocar res.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan alguna cosa falle, pregunta abans "què esperava?" i després "què he escrit?". El 90% de les voltes la diferència entre les dues respostes és un `<=`, un `null` o un `==`.

**Exercici: el caçador de monstres**

```java
public class CazaMonstruos {
    public static void main(String[] args) {
        int[] datos = new int[5];
        for (int i = 1; i <= datos.length; i++) {
            datos[i] = i * 10;
        }
        System.out.println(java.util.Arrays.toString(datos));
    }
}
```

**Què ocorre?**

- (A) Imprimeix `[10, 20, 30, 40, 50]`
- (B) Imprimeix `[0, 10, 20, 30, 40]`
- (C) `ArrayIndexOutOfBoundsException`
- (D) `NullPointerException`

<details>
<summary>🔄 Solució</summary>

La **C**. El bucle va de `i = 1` a `i = 5` inclòs (`<=`). Quan `i` val 5, fa `datos[5] = 50`, però les places vàlides van de 0 a 4. Monstre 1 en acció. I de passada, la plaça 0 es queda sense tocar (a `0`), perquè el bucle comença en 1: un altre ensurt per als despistats.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina excepció llançes en accedir a `a[a.length]`?
2. Què hi ha en `String[] s = new String[3]` a cada plaça?
3. Com compares dos arrays per a saber si tenen el mateix contingut?
4. Amb quin bucle pots modificar els elements d'un array?

<details>
<summary>🔄 Respostes</summary>

1. `ArrayIndexOutOfBoundsException`: l'índex `length` no existeix, les places acaben en `length - 1`.
2. `null` a les tres. Les places d'objectes acabades de crear estan buides fins que les omplis amb `new`.
3. Amb `Arrays.equals(a, b)`. `==` i `a.equals(b)` comparen referències, no contingut.
4. Amb el `for` clàssic amb índex (`a[i] = ...`). El `for-each` és de només lectura.

</details>

---

## ✅ Resum en 3 frases

1. Els **sis monstres** dels arrays són: índex fora de rang, `null`, imprimir sense `toString`, comparar amb `==`, confondre `length`/`length()`/`size()` i modificar amb `for-each`.
2. El **missatge de l'excepció és una pista**: et diu la línia i el motiu. Llegeix-lo abans de tocar res.
3. Depurar un array és **vore les dades** (`Arrays.toString`), **respectar els límits** i aïllar el tram que falla, amb boli o amb *breakpoint*.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Monstre | Error típic amb nom i cura (`ArrayIndexOutOfBounds`, `NullPointer`...) |
> | `Arrays.toString` | La forma d'imprimir un array llegible |
> | `Arrays.equals` | Comparar contingut de dos arrays |
> | Valor de sentinella | Valor especial que representa "buit" en primitius |
> | *Breakpoint* | Punt de parada del depurador per a inspeccionar variables |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/04-arrays) · **Anterior:** [07 · Be the Code: l'aparcament es gestiona](/ApuntesProgramacion/va/04-arrays/07-be-the-code) · **Següent:** [09 · Repàs interactiu](/ApuntesProgramacion/va/04-arrays/09-repaso-interactivo)