---
title: "05 · Classes genèriques: la teua `Caja<T>`"
description: "D'on ix el `<String>` d'ArrayList, les convencions T/E/K/V i la teua primera classe amb buits rellenables 📦"
---

<p><small>D'on ix el `<String>` d'ArrayList, les convencions T/E/K/V i la teua primera classe amb buits rellenables 📦</small></p>

> 🗺️ **Estàs en:** 📚 **U11 · Col·leccions, genèrics i mapes** → 05 · Classes genèriques: la teua `Caja<T>`

---

## 📬 La idea en una frase

> **Els genèrics existeixen per una sola raó: seguretat de tipus. I una classe genèrica és una plantilla amb buits: declares `<T>` i qui la use decideix quin tipus reompli cada buit.**

En els punts 1 i 2 portes tot el dia usant `ArrayList<String>` i `HashSet<Integer>`... però ningú t'ha explicat d'on ix eixe `<String>`. Hui és el dia.

---

## 😱 L'infern abans dels genèrics

Una `ArrayList` a la manera antiga (sense genèrics) és una capsa de caos on pots ficar qualsevol cosa. En traure, Java et torna un `Object` i tu has de recordar què vas ficar:

```java
import java.util.*;

ArrayList cajaDeCaos = new ArrayList();   // sin <String>, sin <Integer>...
cajaDeCaos.add(42);
cajaDeCaos.add("Hola");

Object cosa = cajaDeCaos.get(0);
String texto = (String) cosa;  // 💥 ClassCastException en temps d'execució
```

> ⚠️ **Advertència:** sense genèrics, els errors de tipus salten en temps d'EXECUCIÓ (quan l'usuari usa el teu programa). Amb genèrics, salten en temps de COMPILACIÓ (mentre programes). Quan prefereixes assabentar-te'n?

## 🤝 Arriben els genèrics

Una `ArrayList<String>` ja no és una capsa de caos: és una màquina expenedora que SOLS dona Coca-Coles. Si intentes ficar un `int`, el compilador et para el braç. I en traure, `get(0)` torna un `String` directament: sense casting i sense creuar els dits.

El `<String>` és un **paràmetre de tipus**: una promesa que li fas al compilador i que ell s'encarrega de complir.

---

## 🔤 Les convencions: T, E, K, V, N

El paràmetre de tipus s'escriu entre `< >` i, per convenció, s'usen majúscules amb significat implícit:

- `T` → Tipus (Type), el comodí general.
- `E` → Element (Element), per a col·leccions.
- `K` / `V` → Clau / Valor (Key / Value), per a mapes.
- `N` → Número (Number).

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

Fixa't en el patró: `T` apareix com a tipus de l'atribut, del paràmetre de `guardar` i del retorn de `sacar`. Quan algú escriu `Caja<String>`, totes les `T` es converteixen en `String` per a eixa instància:

```java
Caja<String> cajaDeTexto = new Caja<>();
cajaDeTexto.guardar("Mensaje secreto");
String mensaje = cajaDeTexto.sacar();  // Sin casting, directo al pelo

Caja<Integer> cajaDeNumeros = new Caja<>();
cajaDeNumeros.guardar(42);
Integer numero = cajaDeNumeros.sacar();
```

`cajaDeTexto` i `cajaDeNumeros` ixen del mateix motle, però per al compilador són tipus diferents: no pots barrejar-les sense que et pille.

> ⚠️ **Advertència:** no pots usar primitius com a paràmetre de tipus. `Caja<int>` no compila: usa `Caja<Integer>` amb la seua classe envolvent i deixa que l'autoboxing faça la conversió automàtica (ho vas vore en el punt 1).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el tipus `T` és un comodí que es reemplaça en instanciar. Però ull: la capsa només guarda UN element; el segon `guardar` pisà el primer.

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

La **B**. `Caja<T>` guarda un únic atribut `contenido`. El segon `guardar(10)` sobreescriu el 5, així que `sacar()` torna 10. Moraleja: si necessites guardar diversos elements, per a això estan les col·leccions dels punts anteriors.

</details>

---

## 🤷 No hi ha preguntes tontes

> ❓ **Puc tindre una classe amb dos tipus genèrics?**

Sí, i és molt comú. `Pareja<T, U>` amb `private T primero; private U segundo;` és l'exemple clàssic (el deixaràs ben lligat en els butlletins). Els paràmetres de tipus van separats per comes entre els `< >`.

---

> ❓ **`Caja` i `Caja<T>` són la mateixa classe?**

Quasi, però no. `Caja` a seques (sense `< >`) és un **tipus cru (raw type)**: funciona com l'infern del principi, sense seguretat de tipus. No l'usis mai excepte si t'obliguen les restes de codi antic.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina excepció evitem gràcies als genèrics en traure elements d'una col·lecció?
2. Quina lletra s'usa per convenció per al paràmetre de tipus d'una col·lecció? I per a clau i valor d'un mapa?
3. Per què no existeix `Caja<int>`?
4. Què li passa al 5 després de cridar `guardar(10)` en una `Caja<Integer>`?

<details>
<summary>🔄 Respostes</summary>

1. `ClassCastException`, el clàssic d'usar un element com si fóra d'un altre tipus.
2. `E` (Element); `K` (Key) i `V` (Value).
3. Perquè `int` és un primitiu i els genèrics només accepten objectes: s'usa `Integer` amb autoboxing.
4. Que es perd: la capsa guarda un únic element i el segon `guardar` sobreescriu el primer.

</details>

---

## ✅ Resum en 3 frases

1. Els genèrics porten **seguretat de tipus**: comproven en compilació que no fiques la pota i eliminen els castings a cegues.
2. Una **classe genèrica** es declara amb `<T>` i usa `T` com un buit rellenable en atributs, paràmetres i retorns; les convencions (`T`, `E`, `K`/`V`, `N`) fan que el codi es lligga sol.
3. **Els primitius no valen**: usa les classes wrapper (`Integer` en comptes de `int`) i deixa que l'autoboxing convertisca sol.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Genèric | Codi que treballa amb un tipus que es decideix en usar-lo (`<T>`) |
> | Paràmetre de tipus | El `<String>` de `ArrayList<String>`: el tipus que es passa |
> | Classe genèrica | Classe que declara `<T>` i usa el tipus com un buit rellenable |
> | Wrapper | Classe que embolica un primitiu (`Integer` embolica `int`) |
> | Tipus cru (raw type) | `Caja` sense `< >`: sense seguretat de tipus, evita'l |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-colecciones) · **Anterior:** [04 · Iterator i Collections](/ApuntesProgramacion/va/11-colecciones/04-iterator-collections) · **Següent:** [06 · El diamant, mètodes genèrics i wildcards](/ApuntesProgramacion/va/11-colecciones/06-genericos-avanzado)
