---
title: "06 · Aplicacions dels arrays"
description: "Arrays de String, de char, d'objectes i de taules: quan l'aparcament deixa de ser teoria i comença a treballar 💼"
---

<p><small>Arrays de String, de char, d'objectes i de taules: quan l'aparcament deixa de ser teoria i comença a treballar 💼</small></p>

> 🗺️ **Estàs en:** 🅿️ **U04 · Arrays** → 06 · Aplicacions dels arrays

---

## 📬 La idea en una frase

> **Els arrays no són només per a números: guardes noms, paraules, caràcters, objectes i fins i tot taules senceres. Tot el que es puga comptar, es pot ficar en un aparcament.**

Fins ara has aparcat números. Però en la vida real les dades tenen noms: alumnes, assignatures, temperatures, pel·lícules... Este punt t'ensenya a guardar **coses** (no només números) en els teus arrays, i a donar-los un ús de veritat.

---

## 📝 Arrays de String: la llista de la classe

L'array més humà que existeix: una llista de noms.

```java
String[] clase = {"Ana", "Bruno", "Carla", "Diego"};

for (String alumno : clase) {
    System.out.println("Hola, " + alumno);
}
```

Cada plaça guarda una `String`. Res de nou en la sintaxi: el que canvia és el que guardes. I amb ells pots fer coses pròpies del text:

```java
String[] frutas = {"pera", "manzana", "pera", "uva"};

int peras = 0;
for (String fruta : frutas) {
    if (fruta.equals("pera")) {
        peras++;
    }
}
System.out.println("Hay " + peras + " peras.");
```

> ⚠️ **Advertència:** amb `String` mai no compares amb `==`. Usa `.equals()`. Ho vas vore en la U02 i en els arrays és igual d'obligatori: `fruta == "pera"` compara referències, no text.

### El més famós de tots: `args`

L'array de `String` més usat del curs el portes escrivint des de la U01: `main(String[] args)`. En el punt 5 vas vore que conté els arguments de la línia de comandes. Doncs això: un `String[]` de veritat, com el de la teua classe.

---

## 🔤 `char[]` vs `String`

Un `char[]` és un array de caràcters. I compte: s'assembla moltíssim a una `String`... però no és el mateix.

```java
char[] vocales = {'a', 'e', 'i', 'o', 'u'};

for (int i = 0; i < vocales.length; i++) {
    System.out.print(vocales[i] + " ");
}
```

| Cosa | `String` | `char[]` |
|---|---|---|
| Immutable? | Sí: no es pot canviar | No: pots tocar cada plaça |
| Mètodes | `length()`, `charAt()`, `substring()`... | No en té (uses bucles) |
| Es pot modificar una lletra? | No (en crees una altra) | Sí: `vocales[0] = 'A';` |
| Passar a mètode | Es comporta com immutable | Es compartix com qualsevol objecte |

> 💡 **Consell:** si necessites "canviar una lletra", amb `String` no pots. Una opció és passar-la a `char[]`, modificar-la i tornar a construir la `String`. En la U12 (fitxers i regex) esta idea eixirà diverses voltes.

---

## 🧍 Arrays d'objectes: l'aparcament de persones

Ací és on l'aparcament brilla de veritat. Els arrays no només guarden primitius o `String`: guarden **objectes** de qualsevol classe. Com encara no has creat les teues pròpies classes (això és la U06), usa una senzilla per a l'exemple:

```java
class Alumno {
    String nombre;
    int nota;

    Alumno(String nombre, int nota) {
        this.nombre = nombre;
        this.nota = nota;
    }
}
```

```java
Alumno[] alumnos = new Alumno[3];
alumnos[0] = new Alumno("Ana", 8);
alumnos[1] = new Alumno("Bruno", 5);
alumnos[2] = new Alumno("Carla", 10);

int aprobados = 0;
for (Alumno a : alumnos) {
    if (a.nota >= 5) {
        aprobados++;
    }
}
System.out.println("Aprobados: " + aprobados);
```

> ⚠️ **Advertència:** un `Alumno[]` acabat de crear està ple de `null`, no d'alumnes. `new Alumno[3]` crea 3 places buides; si accedixes a `alumnos[0].nombre` sense crear l'objecte abans, `NullPointerException` a l'acte. Primer `new Alumno(...)`, després usar.

El bucle és idèntic al dels números: canvia el contingut, no la mecànica. Això es diu **recórrer una col·lecció d'objectes**, i ho faràs moltíssim la resta del curs.

---

## 🗂️ Arrays de arrays: les dades en taula

L'últim clàssic: guardar diverses llistes a la vegada. Si tens les notes de diversos alumnes en diverses assignatures, una taula `double[][]` és la forma natural:

```java
double[][] notas = {
    {8.0, 7.5, 9.0},   // Ana: Matemàtiques, Llengua, Anglés
    {5.0, 6.0, 4.5},   // Bruno
    {9.5, 8.0, 10.0},  // Carla
};

for (int i = 0; i < notas.length; i++) {
    double suma = 0;
    for (int j = 0; j < notas[i].length; j++) {
        suma += notas[i][j];
    }
    System.out.println("Alumne " + i + ": mitjana " + (suma / notas[i].length));
}
```

Cada fila és un alumne i cada columna una assignatura. Amb dos bucles niats (els del punt 3) recorres tota la taula i calcules el que necessites. Els programes que "porten el compte" de la vida real són, en el fons, això.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan un array guarda objectes, el bucle no canvia res: recorre, pregunta, acumula. L'únic que és nou és que preguntes per **atributs** (`a.nota`), no per valors solts.

**Exercici: la cerca de la pel·lícula**

```java
public class BeTheCatalogo {
    public static void main(String[] args) {
        String[] peliculas = {"Alien", "Matrix", "Gladiator", "Matrix", "Coco"};
        String buscada = "Matrix";
        int cuantas = 0;

        for (String p : peliculas) {
            if (p.equals(buscada)) {
                cuantas++;
            }
        }

        System.out.println(cuantas);
    }
}
```

**Què imprimeix?**

- (A) 1
- (B) 2
- (C) 3
- (D) Matrix

<details>
<summary>🔄 Solució</summary>

La **B**. El for-each recorre les 5 pel·lícules i el `if` compta quantes voltes apareix `"Matrix"`. Apareix en les posicions 1 i 3: dues voltes. Fixa't en el `.equals()`: amb `==` compararies referències i `"Matrix"` no seria igual a cap, perquè són objectes diferents en memòria.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què hi ha a les places d'un `Alumno[]` acabat de crear?
2. Per què `fruta == "pera"` és un error amb `String`?
3. Pots modificar una lletra d'una `String`? I d'un `char[]`?
4. Quin bucle usaríes per a sumar una fila d'una taula `double[][]`?

<details>
<summary>🔄 Respostes</summary>

1. `null`. `new Alumno[3]` crea 3 places buides; cal crear els objectes amb `new Alumno(...)`.
2. Perquè `==` compara referències (és el mateix objecte?), no el contingut. Amb `String` cal usar `.equals()`.
3. No, `String` és immutable. Sí, `char[]` no ho és: `vocales[0] = 'A'` funciona.
4. Un `for` niat, o un `for` per la fila concreta: `for (int j = 0; j < notas[i].length; j++)`.

</details>

---

## ✅ Resum en 3 frases

1. Els arrays guarden **el que siga**: `String`, `char`, objectes propis i taules senceres, amb la mateixa mecànica de sempre.
2. Amb `String` usa **`.equals()`** i recorda que un array d'objectes acabat de crear està ple de **`null`**.
3. Els **arrays d'objectes** (recorres atributs) i els **arrays 2D** (recorres files i columnes) són la base dels programes que gestionen dades de la vida real.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Array d'objectes | Aparcament on cada plaça guarda un objecte (`Alumno`, `String`...) |
> | `null` | El valor per defecte de les places d'objectes acabades de crear |
> | Immutable | Que no es pot canviar; la `String` ho és |
> | `char[]` | Array de caràcters, modificable, sense mètodes propis |
> | Taula de dades | `double[][]`: files i columnes per a dades reals |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/04-arrays) · **Anterior:** [05 · Arrays i mètodes](/ApuntesProgramacion/va/04-arrays/05-arrays-metodos) · **Següent:** [07 · Be the Code: l'aparcament es gestiona](/ApuntesProgramacion/va/04-arrays/07-be-the-code)