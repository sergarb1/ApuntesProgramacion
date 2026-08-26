---
title: "02 — switch: el menú del restaurant"
description: Triar entre moltes opcions sense omplir el codi de semàfors 🍽️
---

<p><small>Triar entre moltes opcions sense omplir el codi de semàfors 🍽️</small></p>

> 🗺️ **Estàs en:** 🔀 **U03 · Estructures de Control i Excepcions** → 02 · switch

---

## 📬 La idea en una frase

> **`switch` és la carta d'un restaurant: mires el valor d'una variable i executes el `case` que coincidisca, sense encadenar vint `if`.**

Quan has de triar entre moltes opcions amb un sol valor (dia de la setmana, talla, menú), una cadena d'`else if` funciona però és lletja. `switch` existix per a això.

---

## 🍽️ La carta del restaurant

```java
int dia = 3;

switch (dia) {
    case 1:
        System.out.println("Dilluns");
        break;
    case 2:
        System.out.println("Dimarts");
        break;
    case 3:
        System.out.println("Dimecres");
        break;
    default:
        System.out.println("Dia desconegut");
        break;
}
```

> ⚠️ **Advertència:** el **`break` és obligatori** (a menys que vulgues "fall-through", que veurem a baix). Sense ell, Java entra en el `case` correcte i seguix executant tots els següents fins a trobar un `break`. És el clàssic bug del novell.

---

## 🧱 Les peces del puzle

- **`switch (variable)`**: la variable que s'examina. Abans només admetia `int`, `char` i `String` (a partir de Java 7 també `String`).
- **`case valor:`**: cada opció possible. Si la variable coincidix, s'executa eixe bloc.
- **`break;`**: "fins ací he arribat, ix del switch". Sense ell, tot es desborda cap avall.
- **`default:`**: el comodí, el "cap dels anteriors". És opcional, com l'`else`.

```java
String talla = "M";

switch (talla) {
    case "S":
        System.out.println("Xicoteta");
        break;
    case "M":
        System.out.println("Mitjana");
        break;
    case "L":
        System.out.println("Gran");
        break;
    default:
        System.out.println("Talla no vàlida");
        break;
}
```

> 💡 **Detall pràctic:** usa `switch` quan compares **una variable amb molts valors concrets**. Usa `if`/`else if` quan les condicions siguen rangs ("més gran que 5", "entre 10 i 20") o mesclen variables.

---

## 🌀 El fall-through: error o superpoder?

El famós "caure a través" ocorre quan oblides el `break`. En la majoria dels casos és un bug:

```java
// ⚠️ Fall-through ACCIDENTAL: imprimix els tres plats
int plat = 1;

switch (plat) {
    case 1:
        System.out.println("Amanida");
        // sense break: es cau al següent
    case 2:
        System.out.println("Sopa");
        break;
}
```

Però a vegades s'usa a propòsit, per a agrupar casos:

```java
// ✅ Fall-through INTENCIONAL: diversos casos comparteixen bloc
char lletra = 'a';

switch (lletra) {
    case 'a':
    case 'e':
    case 'i':
    case 'o':
    case 'u':
        System.out.println("Vocal");
        break;
    default:
        System.out.println("Consonant");
        break;
}
```

Ací, si `lletra` és qualsevol vocal, executa el bloc compartit. Elegant i compacte.

---

## 🆚 switch vs else if: el duel

| Situació | Millor opció |
|---|---|
| Un valor i moltes opcions concretes (`1..7`, `"S"/"M"/"L"`) | `switch` |
| Rangs o comparacions (`>= 18`, `entre 10 i 20`) | `if`/`else if` |
| Combinar diverses variables | `if`/`else if` |
| Comprovar `null` | `if` |

> 💡 **Nota de futur:** en Java 14+ existix el `switch` amb fletxes (`->`) que no necessita `break` i retorna valors. Ho veuràs com a curiositat avançada; ací aprenem el clàssic, que és el de tots els exàmens.

---

## 🏫 Exemple guiat: el menú del dia

Muntem una carta que diga el plat segons el dia, amb un `default` que caça els despistats:

```java
public class MenuDia {
    public static void main(String[] args) {
        String dia = "dimecres";

        switch (dia) {
            case "dilluns":
                System.out.println("Llenties");
                break;
            case "dimarts":
                System.out.println("Paella");
                break;
            case "dimecres":
                System.out.println("Macarrons");
                break;
            case "dijous":
                System.out.println("Fabada");
                break;
            case "divendres":
                System.out.println("Peix");
                break;
            default:
                System.out.println("Cap de setmana: no hi ha menú");
                break;
        }
    }
}
```

Eixida:

```
Macarrons
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan veges un `switch`, compta els `break`: **n'hi ha d'haver un per cada `case` no compartit**. Si en falta algun, el teu programa es convertix en un tobogan.

**Exercici: el switch oblidadís**

Sense executar, calcula què imprimix este programa:

```java
public class Tobogan {
    public static void main(String[] args) {
        int numero = 2;

        switch (numero) {
            case 1:
                System.out.println("U");
            case 2:
                System.out.println("Dos");
            case 3:
                System.out.println("Tres");
                break;
            default:
                System.out.println("Altre");
                break;
        }
    }
}
```

<details>
<summary>🔄 Solució</summary>

Imprimix:

```
Dos
Tres
```

El `case 2` no té `break`, així que després d'imprimir "Dos" es cau al `case 3` ("Tres") i allà sí que troba el `break` i es deté. Fixa't: el `case 1` no imprimix res perquè `numero` no val 1. Un sol `break` oblidat convertix el switch en un tobogan.

</details>

---

## 🎯 Mini-chequeig

1. Què passa si un `case` no té `break`?
2. Què fa el `default`?
3. Quan prefereixes `switch` a una cadena d'`else if`?
4. Com agrupes diversos valors en el mateix bloc de `switch`?

<details>
<summary>🔄 Respostes</summary>

1. Es produïx el **fall-through**: el codi seguix executant els `case` següents fins a trobar un `break`.
2. És el comodí: s'executa si **cap** `case` coincidix. És opcional.
3. Quan compares **un valor amb moltes opcions concretes** (nombres, `char`, `String`).
4. Escrivint els `case` seguits sense `break` entre ells i un sol bloc al final.

</details>

---

## ✅ Resum en 3 frases

1. `switch` tria entre **moltes opcions concretes** d'una variable, amb `case`, `break` i `default`.
2. Sense `break` es produïx el **fall-through** (el codi es desborda), que pot ser un bug o un truc per a agrupar casos.
3. Usa `switch` per a valors exactes i `if`/`else if` per a **rangs** i condicions combinades.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `switch` | Estructura que tria entre diversos `case` segons un valor |
> | `case` | Cada opció concreta a comparar |
> | `break` | Ordre d'eixida: talla el switch |
> | `default` | El "cap dels anteriors", opcional |
> | Fall-through | Que el codi es desborde d'un `case` al següent |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/03-estructuras-control-excepciones) · **Anterior:** [01 · if, else if i else](/ApuntesProgramacion/va/03-estructuras-control-excepciones/01-if-else) · **Següent:** [03 · Bucles: while i do-while](/ApuntesProgramacion/va/03-estructuras-control-excepciones/03-bucles-while-do-while)
