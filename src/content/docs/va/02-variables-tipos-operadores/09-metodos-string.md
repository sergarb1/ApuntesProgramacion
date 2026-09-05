---
title: 09 — Mètodes útils de String
description: La caixa de ferramentes per a manipular text 🪄
---

<p><small>La caixa de ferramentes per a manipular text 🪄</small></p>

> 🗺️ **Estàs en:** 🔤 **U02 · Variables, Tipus i Operadors** → 09 · Mètodes útils de String

---

## 📬 La idea en una frase

> **`String` porta de sèrie una caixa de ferramentes amb mètodes per a mesurar, retallar, buscar i transformar text (`length()`, `trim()`, `toUpperCase()`, `substring()`, `replace()`…).**

En el punt 2 vas conéixer el `String` com la caixa màgica del text. Ara obriràs la seua caixa de ferramentes: perquè els programes no només guarden text, també el mesuren, el netegen, el posen en majúscules i el trocegen.

---

## 🪄 El gimnàs del text: els mètodes que mesuraràs

Ací està l'arsenal complet. Fixa't en com es crida un mètode d'objecte: `texto.metodo()`, amb un punt entre la variable i el mètode (no com `Math.random()`, que era estàtic):

```java
String texto = "  Programación DAM  ";

texto.length();               // 20 — quants caràcters hi ha (espais inclosos)
texto.trim();                 // "Programación DAM" — sense espais als costats
texto.toUpperCase();          // "  PROGRAMACIÓN DAM  "
texto.toLowerCase();          // "  programación dam  "
texto.contains("DAM");        // true — conté eixe text?
texto.startsWith("  ");       // true — comença per...?
texto.endsWith("AM  ");       // true — acaba per...?
texto.indexOf("DAM");         // 15 — en quina posició comença "DAM"?
texto.substring(2, 14);       // "Programación" — retalla del caràcter 2 al 13
texto.replace("DAM", "DAW");  // "  Programación DAW  " — substitueix text
```

> 💡 **Detall pràctic:** `length()` és un **mètode** (amb parèntesis). És l'error clàssic del novat escriure `texto.length` sense parèntesis i que no compile. En canvi, per a un array (la U04) s'usa `.length` sense parèntesis. Els `String` porten parèntesis; els arrays, no.

---

## 🔍 Els mètodes que busquen

Quan necessites saber si alguna cosa està dins del text:

```java
String email = "ana@instituto.edu";
boolean tieneArroba = email.contains("@");          // true
boolean esDeEdu = email.endsWith(".edu");           // true
boolean empiezaPorAna = email.startsWith("ana");    // true
int posicionArroba = email.indexOf("@");            // 3 — el @ està en la posició 3
```

> 📝 **Nota:** `indexOf()` retorna la **posició** (començant en 0) on troba el text, o **-1** si no el troba. És el "buscar" de Java.

---

## ✂️ Els mètodes que retallen

El clàssic: netejar espais i trocejar. `trim()` és l'heroi silenciós dels formularis mal omplits:

```java
String sucio = "   Ana   ";
String limpio = sucio.trim();          // "Ana" — sense espais al voltant
String nombreCompleto = "Ana Martínez";
String nombre = nombreCompleto.substring(0, 3);       // "Ana" — del 0 al 3 (sense incloure el 3)
String apellido = nombreCompleto.substring(4);        // "Martínez" — des del 4 fins al final
```

> ⚠️ **Advertència:** en `substring(inicio, fin)`, el `fin` **no s'inclou**. `substring(0, 3)` et dona els caràcters 0, 1 i 2. És un error típic demanar un caràcter de més (o de menys).

---

## 🏫 Exemple guiat: el nom de l'usuari

Anem a construir un programa que processe un nom com ho faria un formulari seriós: netejant espais i mostrant dades:

```java
public class ProcesaNombre {
    public static void main(String[] args) {
        String nombre = "  aNA  ";

        String limpio = nombre.trim();                     // "aNA"
        String enMayusculas = limpio.toUpperCase();        // "ANA"
        String enMinusculas = limpio.toLowerCase();        // "ana"
        String primera = enMayusculas.substring(0, 1);     // "A"
        String ultima = enMayusculas.substring(enMayusculas.length() - 1);  // "A"

        System.out.println("Nombre limpio: " + limpio);
        System.out.println("Longitud: " + limpio.length());
        System.out.println("En mayúsculas: " + enMayusculas);
        System.out.println("Primera letra: " + primera);
        System.out.println("Última letra: " + ultima);
    }
}
```

Eixida:

```
Nombre limpio: aNA
Longitud: 3
En mayúsculas: ANA
Primera letra: A
Última letra: A
```

Fixa't en l'última lletra: `enMayusculas.length() - 1` és l'última posició, perquè les posicions comencen en 0.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** encadena els mètodes per a expressions potents: `texto.trim().toUpperCase().substring(0, 1)` fa tres coses en una línia. Java les executa d'esquerra a dreta.

**Exercici: la inicial d'una reina**

Sense executar, digues què imprimix este codi:

```java
String nombre = "  merida  ";
String inicial = nombre.trim().toUpperCase().substring(0, 1);
String resto = nombre.trim().substring(1).toLowerCase();
System.out.println(inicial + ". " + resto);
```

<details>
<summary>🔄 Solució</summary>

Imprimix `M. erida`.

- `nombre.trim()` → `"merida"` (fora espais).
- `.toUpperCase()` → `"MERIDA"`.
- `.substring(0, 1)` → `"M"`. Eixe és el `inicial`.
- Per al resto: `"merida".substring(1)` → `"erida"`, i `.toLowerCase()` ho deixa igual. Resultat: `M. erida`.

(La idea era normalitzar un nom estil "M. erida"... encara que el resultat sona a princesa amb pressa.)

</details>

---

## 🎯 Mini-chequeig

1. Porta `String.length()` parèntesis o no? Per què?
2. Què fa `trim()` i quan és imprescindible?
3. Què retorna `indexOf("@")` si el text no conté `@`?
4. Què retorna `"Hola".substring(1, 3)`?

<details>
<summary>🔄 Respostes</summary>

1. **Porta parèntesis**: `length()` és un mètode de la classe `String`. (Els arrays usen `.length` sense parèntesis, però això és la U04.)
2. `trim()` elimina els **espais del principi i del final**. És imprescindible en netejar entrades d'usuari que solen portar espais de més.
3. **`-1`**, el sentinella de "no trobat".
4. `"ol"` — el caràcter 1 ('o') i el 2 ('l'); el `3` no s'inclou.

</details>

---

## ✅ Resum en 3 frases

1. Els mètodes de `String` es criden sobre la variable (`texto.metodo()`) i transformen el text en alguna cosa nova.
2. `length()`, `trim()`, `toUpperCase()`, `contains()`, `indexOf()`, `substring()` i `replace()` cobrixen el 90% del que faràs amb text.
3. En `substring(inicio, fin)` el fin no s'inclou, i `indexOf()` retorna `-1` quan no troba res.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `length()` | Nº de caràcters d'un String (amb parèntesis) |
> | `trim()` | Lleva els espais dels extrems |
> | `substring()` | Retalla una porció del text |
> | `indexOf()` | Posició de la primera aparició (o `-1`) |
> | `replace()` | Substituïx una part del text per una altra |
> | Encadenar mètodes | Aplicar diversos mètodes seguits amb punts |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/02-variables-tipos-operadores) · **Anterior:** [08 · Math.random() i nombres aleatoris](/ApuntesProgramacion/va/02-variables-tipos-operadores/08-math-random-aleatorios) · **Següent:** [10 · Repàs interactiu](/ApuntesProgramacion/va/02-variables-tipos-operadores/10-repaso-interactivo)