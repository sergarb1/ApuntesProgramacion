---
title: "01 · Genèrics: el `<T>` que ho va canviar tot"
description: "El lio abans dels genèrics, el compilador que es torna el teu amic i la fi dels castings a cegues 🤝"
---

<p><small>El lio abans dels genèrics, el compilador que es torna el teu amic i la fi dels castings a cegues 🤝</small></p>

> 🗺️ **Estàs en:** 🗺️ **U11 · Genèrics i Mapes** → 01 · Genèrics: el `<T>` que ho va canviar tot

---

## 📬 La idea en una frase

> **Els genèrics existixen per una sola raó: seguretat de tipus. Comproven en temps de compilació que no fiques la pota amb els tipus i eliminen els castings a cegues i les temudes `ClassCastException`.**

En la U10 vas vore `ArrayList<String>`, `HashSet<Integer>`... però ningú et va explicar d'on ix eixe `<String>`. Hui és el dia. Benvingut o benvinguda a la unitat on el compilador deixa de ser un jutge i es convertix en el teu entrenador personal.

---

## 😱 L'infern abans dels genèrics

Imagina que tens una `ArrayList` a la manera antiga, sense genèrics. És com una capsa de caos on pots ficar qualsevol cosa: una sabata, una poma, un gat, un número de la sort. El problema és que quan _tires_ les coses, Java et torna un `Object` i tu has de recordar què vas ficar. I si vas ficar un `Integer` però el tractes com `String`? **BOOM**. `ClassCastException` a tota la cara.

```java
import java.util.*;

public class InfiernoSinGenericos {
    public static void main(String[] args) {
        ArrayList cajaDeCaos = new ArrayList();   // sin <String>, sin <Integer>...
        cajaDeCaos.add(42);
        cajaDeCaos.add("Hola");
        cajaDeCaos.add(3.14);

        // Todo lo que sacas es Object... ¡tú adivina qué es!
        Object cosa = cajaDeCaos.get(0);
        String texto = (String) cosa;  // 💥 ClassCastException en tiempo de ejecución
    }
}
```

Ho veus? El compilador no t'avisà de res. Te n'assabentes quan el programa ja està corrent i explota. Com una granada amb el segur llevat. I el pitjor: el casting `(String) cosa` no era mentida fins que va explotar, perquè Java no tenia manera de saber que dins hi havia un `Integer`.

> ⚠️ **Advertència:** sense genèrics, els errors de tipus salten en temps d'EXECUCIÓ (quan l'usuari està usant el teu programa). Amb genèrics, salten en temps de COMPILACIÓ (quan tu estàs programant). Quan prefereixes assabentar-te'n?

---

## 🤝 Arriben els genèrics: el compilador es torna el teu amic

A partir de Java 5, els genèrics van canviar les regles del joc. Una `ArrayList<String>` ja no és una capsa de caos: és una màquina expenedora que SOLS dona Coca-Coles. No pots ficar una sabata, i si ho intentes, el compilador et para el braç abans que la festa es tórce.

```java
import java.util.*;

public class CieloConGenericos {
    public static void main(String[] args) {
        ArrayList<String> maquinaDeCocacolas = new ArrayList<>();
        maquinaDeCocacolas.add("Coca-Cola");
        maquinaDeCocacolas.add("Coca-Cola Light");
        // maquinaDeCocacolas.add(42);  // 🚫 Error de compilación

        // Al sacar, ya sabes que es String. Sin casting.
        String bebida = maquinaDeCocacolas.get(0);
        System.out.println(bebida.toUpperCase());  // "COCA-COLA" sin miedo
    }
}
```

Fixa't en el superpoder: `get(0)` torna un `String`, no un `Object`. Pots cridar `.toUpperCase()` directament, sense casting i sense creuar els dits. El `<String>` és un **paràmetre de tipus**: una promesa que li fas al compilador i que ell s'encarrega de complir.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `ArrayList<String>` només accepta Strings. Si intentes ficar un `int` o un `double`, el compilador et para el braç a la porta.

**Exercici: el porter de discoteca**

```java
import java.util.*;

public class BeTheList {
    public static void main(String[] args) {
        ArrayList<String> lista = new ArrayList<>();
        lista.add("Hola");
        lista.add("Mundo");
        // lista.add(42);       // línea A
        String s = lista.get(0); // línea B
        System.out.println(s.toUpperCase());
    }
}
```

**Què passa si descomentes la línia A?**

- (A) Compila i afig el `42` sense problema.
- (B) Error de compilació: no es pot ficar un `int` en una llista de Strings.
- (C) Compila, però salta una excepció en executar.
- (D) El `42` es convertix sol en `"42"` com a String.

<details>
<summary>🔄 Solució</summary>

La **B**. `lista` és `ArrayList<String>`, així que el compilador rebutja `add(42)` abans que el programa arribe a executar-se. Eixa és exactament la màgia dels genèrics: l'error apareix quan tu estàs programant, no quan l'usuari està usant la teua app. La línia B i el `toUpperCase()` funcionen sense casting perquè el compilador ja sap que `get(0)` torna un String.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina excepció evitem gràcies als genèrics en traure elements d'una col·lecció?
2. Quan salten els errors de tipus amb genèrics: en compilació o en execució?
3. Què et torna `get(0)` en una `ArrayList<String>` sense fer casting?
4. Per què sense genèrics tot el que traus d'una `ArrayList` és un `Object`?

<details>
<summary>🔄 Respostes</summary>

1. `ClassCastException`, el clàssic d'intentar usar un element com si fóra d'un altre tipus.
2. En compilació. El compilador comprova els tipus abans de generar el bytecode.
3. Un `String`. El paràmetre de tipus `<String>` li diu al compilador què torna cada mètode.
4. Perquè la `ArrayList` a la manera antiga guarda `Object` i no recorda què vas ficar. Els genèrics afegeixen eixa memòria al compilador.

</details>

---

## ✅ Resum en 3 frases

1. **Abans dels genèrics**, les col·leccions eren capses de caos: tot es guardava com `Object`, tiraves amb casting a cegues i les `ClassCastException` explotaven en temps d'execució.
2. **Amb els genèrics**, `ArrayList<String>` promet al compilador quin tipus conté i ell ho comprova en compilació: no cola un `int` en una llista de Strings.
3. Els genèrics existixen per a **seguretat de tipus**: menys castings, menys excepcions i codi que s'explica sol.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Genèric | Codi que treballa amb un tipus que es decidix en usar-lo (`<T>`) |
> | Paràmetre de tipus | El `<String>` de `ArrayList<String>`: el tipus que es passa |
> | Casting | Convertir a la força: `(String) objeto` |
> | `ClassCastException` | Excepció en usar un objecte com si fóra d'un altre tipus |
> | Seguretat de tipus | Que el compilador verifique que els tipus quadren |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-genericos-mapas) · **Anterior:** — · **Següent:** [02 · La teua pròpia classe genèrica: `Caja<T>`](/ApuntesProgramacion/va/11-genericos-mapas/02-clases-genericas)