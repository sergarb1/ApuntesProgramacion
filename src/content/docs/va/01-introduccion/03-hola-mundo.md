---
title: "03 — El teu primer programa: Hola Món"
description: Com parlar-li a un extraterrestre molt literal 👽
---

<p><small>Com parlar-li a un extraterrestre molt literal 👽</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 03 · El teu primer programa

---

## 📬 La idea en una frase

> **Programar és parlar-li a un extraterrestre molt literal: si li dius "saluda", no ho fa. Has de dir-li *com*, *quan* i *per què*.**

L'ordinador és tonto però precís: no interpreta, **executa**. Cada línia, en orde, sense saltar-se'n cap. El teu primer programa va a cridar "Hola!" per la consola, i a partir d'ací tot és afegir més ordres.

---

## 👋 Hola Món, el ritual d'iniciació

Tot programador comença per ací. És com el primer cafè del matí: no és opcional.

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola, Mundo! Llevo años esperando a que me crearas.");
    }
}
```

Compila-ho (`javac HolaMundo.java`) i executa-ho (`java HolaMundo`), o polsa el botó ▶ del teu IDE. La consola dirà:

```
¡Hola, Mundo! Llevo años esperando a que me crearas.
```

---

## 🔬 Disecció d'Hola Món

Anem a diseccionar això com si fóra una granota en biologia:

- `public class HolaMundo`: declares una classe. Pensa que li dius a Java: "Escolta, vaig a crear una cosa que es diu `HolaMundo`". `public` significa que és accessible des de fora i la classe ha de dir-se igual que l'archiu.
- `public static void main(String[] args)`: este és el **botó d'inici**. Quan executes el programa, Java busca esta línia i diu "per ací es comença!".
- `System.out.println(...)`: és **la veu** del programa. Li dius que cride alguna cosa per la consola. `print` imprimix sense salt de línia; `println` imprimix i salta de línia.

```java
public class MiPrimerPrograma {
    public static void main(String[] args) {
        // Este és el meu primer programa
        System.out.println("¡Holaaaa, mundo!");
        System.out.println("Estoy aprendiendo Java");
        System.out.println("Y me está gustando (de momento)");
    }
}
```

> 💡 **Detall pràctic:** cada instrucció acaba amb `;`. És el punt final de cada frase. Sense ell, el compilador pensa que la frase continua i es lliga. Els `{}` delimiten els blocs: els de la classe contenen la classe, els del `main` contenen les ordres.

---

## 🗝️ Per què `public static void main(String[] args)`?

Pareix un encanteri de Harry Potter. Desgranem cada paraula:

| Paraula | Què significa |
|---|---|
| `public` | Java pot trobar-lo des de fora: el botó és visible |
| `static` | Pot cridar-se sense necessitat de crear un objecte (ho veuràs en la U06) |
| `void` | No torna cap valor: fa el seu treball i es calla |
| `main` | El nom exacte que Java busca en arrancar. No val un altre |
| `String[] args` | Una butxaca on pots ficar arguments en executar (punt 6) |

La firma és **obligatòria tal qual**. Si canvies `main` per `inicio`, Java no troba la porta i el programa no fa res.

---

## 🚪 El mètode que no es crida

Ací va una de les trampes favorites en els exàmens. Observa:

```java
public class Saludos {
    public static void main(String[] args) {
        System.out.println("¡Hola desde el método main!");
    }

    public static void saludo() {
        System.out.println("Esto nunca se ejecuta...");
    }
}
```

S'executarà correctament? **Sí**, però només imprimix la primera línia. El mètode `saludo()` existix, però com mai el crides des de `main`, es queda ahí fent el vague. Java només executa el que està dins del `main` (a no ser que explícitament crides altres mètodes). El mètode `saludo()` és com un actor que té el guió après però mai ix a l'escenari.

> 🧠 **Truc de memòria:** `main` és la porta d'entrada de la casa. Pot haver-hi moltes habitacions (mètodes), però ningú entra per la finestra. Si no crides a la porta, les habitacions es queden buides.

---

## ⭐ Sé el Código: tu ets la JVM

Vas a ser Java per un moment. Pren paper i boli (o mentalment). Et donen este codi:

```java
public class Computadora {
    public static void main(String[] args) {
        int x = 5;
        int y = 10;
        int z = x + y;
        System.out.println("El resultado es: " + z);
    }
}
```

Seguix els passos com si fores la JVM:

1. Trobes la classe `Computadora`.
2. Busques el mètode `main` — ahí està.
3. Crees un espai anomenat `x` i fiques un 5.
4. Crees `y` i fiques un 10.
5. Crees `z`, sumes `x` i `y` (15), ho guardes.
6. Crides per pantalla: "El resultado es: 15".

<details>
<summary>🔄 Solució</summary>

L'eixida és exactament:

```
El resultado es: 15
```

Si la teua resposta va ser diferent, torna a començar: l'ordinador no interpreta, *executa*, línia a línia.

</details>

---

## 🎯 Mini-chequeig

1. Què passa si reanomene `main` a `inicio`?
2. Imprimix el mateix `System.out.print("Hola")` que `System.out.println("Hola")`?
3. Per què falta un `;` en el codi de baix? Assenyala l'error:

```java
public class Erroneo {
    public static void main(String[] args) {
        System.out.println("Me falta algo")
    }
}
```

<details>
<summary>🔄 Respostes</summary>

1. Java no troba la porta d'entrada: el programa compila (en alguns entorns) però en executar no fa res, o dona error. La firma ha de ser exacta.
2. No. `print` no salta de línia; `println` sí. En pantalla es nota: `print("Hola")` seguit de `print("Mundo")` mostra `HolaMundo` pegat.
3. Falta el `;` al final de `System.out.println("Me falta algo")`. El compilador es queixarà esperant el punt i coma.

</details>

---

## ✅ Resum en 3 frases

1. Tot programa té una **classe** (contenidor) i un **mètode `main`** (porta d'entrada).
2. `System.out.println()` és la veu del programa; `;` és el punt final de cada frase.
3. La JVM executa **línia a línia, en orde**: tu decidixes què entra per la porta.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Classe | El contenidor del codi (una "cosa" en Java) |
> | Mètode | Un bloc d'ordres amb nom |
> | main | El mètode que Java executa en arrancar |
> | println | Imprimix text i salta de línia |
> | Consola | La finestra de text on s'imprimix l'eixida |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/01-introduccion) · **Anterior:** [02 · Instal·lació del JDK](/ApuntesProgramacion/va/01-introduccion/02-instalacion-jdk) · **Següent:** [04 · El depurador](/ApuntesProgramacion/va/01-introduccion/04-depurador)