---
title: "02 · La teua pròpia classe genèrica: `Caja<T>`"
description: "Els paràmetres de tipus, les convencions T/E/K/V/N i la teua primera classe amb buits rellenables 📦"
---

<p><small>Els paràmetres de tipus, les convencions T/E/K/V/N i la teua primera classe amb buits rellenables 📦</small></p>

> 🗺️ **Estàs en:** 🗺️ **U11 · Genèrics i Mapes** → 02 · La teua pròpia classe genèrica: `Caja<T>`

---

## 📬 La idea en una frase

> **Una classe genèrica és una plantilla amb buits: declares `<T>` en la classe i qui la use decidix quin tipus reompli cada buit. `Caja<String>` i `Caja<Integer>` són dos classes diferents generades a partir del mateix motle.**

En el punt 1 vas usar `ArrayList<String>` com a consumidora. Hui toca l'altre costat del taulell: **crear la teua pròpia classe genèrica**. No és tan difícil com pareix: només has d'afegir `<T>` al nom de la classe i, a partir d'ací, `T` es comporta com un tipus qualsevol dins d'ella.

---

## 🔤 Les convencions: T, E, K, V, N

El paràmetre de tipus s'escriu entre `< >` i, per convenció, s'usen lletres majúscules amb un significat implícit:

- `T` → Tipus (Type), el comodí general.
- `E` → Element (Element), per a col·leccions.
- `K` / `V` → Clau / Valor (Key / Value), per a mapes.
- `N` → Número (Number).

Pots usar qualsevol lletra, però les convencions fan que el teu codi es lligga sol. Quan veges `Map<K, V>` en un codi alié, ja sabràs que la primera lletra és la clau i la segona, el valor. Sense llegir ni una línia.

---

## 📦 La classe `Caja<T>`

Una capsa que guarda UN objecte de qualsevol tipus:

```java
public class Caja<T> {
    private T contenido;

    public void guardar(T contenido) {
        this.contenido = contenido;
    }

    public T sacar() {
        return contenido;
    }

    public boolean estaVacia() {
        return contenido == null;
    }
}
```

Fixa't en el patró: `T` apareix com a tipus de l'atribut, com a tipus del paràmetre de `guardar` i com a tipus de retorn de `sacar`. És una plantilla: quan algú escriu `Caja<String>`, totes les `T` es convertixen en `String` per a eixa instància.

I així s'usa:

```java
Caja<String> cajaDeTexto = new Caja<>();
cajaDeTexto.guardar("Mensaje secreto");
String mensaje = cajaDeTexto.sacar();  // Sin casting, directo al pelo

Caja<Integer> cajaDeNumeros = new Caja<>();
cajaDeNumeros.guardar(42);
Integer numero = cajaDeNumeros.sacar();
```

`cajaDeTexto` i `cajaDeNumeros` són del mateix motle `Caja`, però per al compilador són tipus diferents: no pots barrejar-les sense que et pille.

> ⚠️ **Advertència:** no pots usar tipus primitius com a paràmetre de tipus. `Caja<int>` no compila. Usa `Caja<Integer>`, amb la seua classe envolvent (wrapper). L'autoboxing de Java s'encarrega de la conversió automàtica, com vas vore en la U10.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el tipus `T` és un comodí. Quan instanciïs, es reemplaça pel tipus real. Però ull: la capsa només guarda UN element; el segon `guardar` pisà el primer.

**Exercici: la capsa que només recorda l'últim**

```java
public class BeTheCaja {
    public static void main(String[] args) {
        Caja<Integer> caja = new Caja<>();
        caja.guardar(5);
        caja.guardar(10);
        System.out.println(caja.sacar());
    }
}
```

**Què imprimeix?**

- (A) 5
- (B) 10
- (C) null
- (D) Error de compilació

<details>
<summary>🔄 Solució</summary>

La **B**. `Caja<T>` guarda un únic atribut `contenido`. El segon `guardar(10)` sobreescriu el 5, així que `sacar()` torna 10. Moraleja: si necessites guardar diversos elements, esta capsa no et servix... per a això estan les col·leccions de la U10.

</details>

---

## 🤷 No hi ha preguntes tontes

> ❓ **Puc tindre una classe amb dos tipus genèrics?**

Sí, i és molt comú. `Pareja<T, U>` amb `private T primero; private U segundo;` és l'exemple clàssic (el deixaràs ben lligat en els butlletins). La sintaxi és la mateixa: els paràmetres de tipus van separats per comes entre els `< >`.

---

> ❓ **Per què `Caja<int>` no compila?**

Perquè els genèrics només funcionen amb tipus referència (objectes), i `int` és un primitiu. Per això existixen les classes wrapper (`Integer`, `Double`, `Boolean`...). L'autoboxing convertix automàticament `int` → `Integer` en passar un `5`, i l'unboxing fa el camí invers en llegir.

---

> ❓ **`Caja` i `Caja<T>` són la mateixa classe?**

Quasi, però no. `Caja<T>` és la versió genèrica. `Caja` a seques (sense `< >`) és el que es diu un **tipus cru (raw type)**: funciona com l'infern del punt 1, sense seguretat de tipus. No l'usis mai excepte si t'obliguen les restes de codi antic.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina lletra s'usa per convenció per al paràmetre de tipus d'una col·lecció?
2. Quines lletres per a la clau i el valor d'un mapa?
3. Per què no existix `Caja<int>`?
4. Què li passa a `guardar(5)` quan després crides `guardar(10)` en una `Caja<Integer>`?

<details>
<summary>🔄 Respostes</summary>

1. `E`, d'Element.
2. `K` (Key) i `V` (Value).
3. Perquè `int` és un primitiu i els genèrics només accepten objectes. S'usa `Integer` amb autoboxing.
4. Que es perd: `Caja<T>` guarda un únic element i el segon `guardar` sobreescriu el primer.

</details>

---

## ✅ Resum en 3 frases

1. **Una classe genèrica** es declara amb `<T>` en el nom i usa `T` com un tipus més dins: atributs, paràmetres i retorns.
2. Les **convencions** (`T`, `E`, `K`/`V`, `N`) fan que el codi s'entenga sol, i els paràmetres de tipus van separats per comes quan n'hi ha diversos.
3. **Els primitius no valen**: usa les classes wrapper (`Integer` en comptes de `int`) i deixa que l'autoboxing faça la conversió automàtica.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Classe genèrica | Classe que declara `<T>` i usa el tipus com un buit rellenable |
> | Paràmetre de tipus | El `T` de `Caja<T>`; es decidix en instanciar |
> | Wrapper | Classe que embolica un primitiu (`Integer` embolica `int`) |
> | Autoboxing | Passar de primitiu a wrapper automàticament |
> | Tipus cru (raw type) | `Caja` sense `< >`: sense seguretat de tipus, evita'l |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-genericos-mapas) · **Anterior:** [01 · Genèrics: el `<T>` que ho va canviar tot](/ApuntesProgramacion/va/11-genericos-mapas/01-que-son-genericos) · **Següent:** [03 · El diamant `<>` i type erasure](/ApuntesProgramacion/va/11-genericos-mapas/03-diamante-type-erasure)