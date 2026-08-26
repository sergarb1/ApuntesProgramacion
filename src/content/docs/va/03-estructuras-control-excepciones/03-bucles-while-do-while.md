---
title: "03 — Bucles: while i do-while"
description: Repetir sense copiar i enganxar, fins que una condició diga prou 🏃
---

<p><small>Repetir sense copiar i enganxar, fins que una condició diga prou 🏃</small></p>

> 🗺️ **Estàs en:** 🔀 **U03 · Estructures de Control i Excepcions** → 03 · Bucles: while i do-while

---

## 📬 La idea en una frase

> **Un bucle és una cinta de córrer: executa el mateix bloc una vegada i una altra mentre la condició siga `true`.**

T'imagines escriure "imprimix de l'1 al 100" amb cent `println`? Copiar i enganxar és pecat. Els bucles fan la faena bruta per tu: repetixen un bloc fins que els dius prou.

---

## 🏃 while: comprova i després corre

```java
while (condicio) {
    // bloc que es repetix
}
```

El `while` primer **mira la condició** i, si és `true`, executa el bloc. En acabar, torna a mirar. Si és `false` des del principi... **no executa res**.

```java
int intents = 3;

while (intents > 0) {
    System.out.println("Reintentant... queden " + intents);
    intents = intents - 1;
}
```

Eixida:

```
Reintentant... queden 3
Reintentant... queden 2
Reintentant... queden 1
```

> ⚠️ **Advertència:** si oblides la línia que modifica la condició (`intents = intents - 1;`), la condició és `true` per sempre i el teu programa **no acaba mai**. Benvingut al bucle infinit, el cotxe sense frens de la programació.

---

## ♾️ El bucle infinit (i com eixir-ne)

```java
while (true) {
    System.out.println("Socors");
}
```

Este programa imprimiria "Socors" fins que l'univers es congele. En l'IDE, el botó de parar (🟥) és el teu millor amic. Per què existix `while (true)`? Perquè a vegades vols un bucle "per sempre" que es trenque a l'interior amb `break` (ja ho veuràs en el punt 5).

> 💡 **Detall pràctic:** la sentència sentinella. Un clàssic és llegir dades fins que l'usuari escriga "eixir":

```java
String resposta = "";
Scanner sc = new Scanner(System.in);

while (!resposta.equals("eixir")) {
    System.out.print("Digues una cosa (o 'eixir'): ");
    resposta = sc.nextLine();
}
System.out.println("Adéu.");
```

---

## 🏃‍♂️ do-while: corre i després comprova

```java
do {
    // bloc
} while (condicio);
```

La diferència amb `while` és l'**ordre**: el `do-while` executa el bloc **almenys una vegada** i comprova la condició al final. Útil quan necessites preguntar sí o sí abans de decidir:

```java
int opcio;
Scanner sc = new Scanner(System.in);

do {
    System.out.println("1. Jugar  2. Eixir");
    System.out.print("Tria: ");
    opcio = sc.nextInt();
} while (opcio != 1 && opcio != 2);

System.out.println("Has triat l'opció " + opcio);
```

Ací el menú es mostra **sempre almenys una vegada**, i es repetix mentre l'usuari no trie 1 o 2. Perfecte per a menús.

> ⚠️ **Advertència:** no confongues els dos. Amb `while`, si la condició és `false` d'entrada, **zero execucions**. Amb `do-while`, **almenys una**. És com la diferència entre "mira abans de creuar" i "creua i després mira".

---

## 🆚 while vs do-while: el duel ràpid

| Situació | Bucle ideal |
|---|---|
| No saps si tocarà executar el bloc | `while` |
| El bloc s'ha d'executar sí o sí una vegada | `do-while` |
| Llegir dades fins que l'usuari done el sentinella | `while` |
| Mostrar un menú fins que trie una opció vàlida | `do-while` |

---

## 🏫 Exemple guiat: el compte arrere

Anem a llançar un coet amb un compte arrere. Com que s'ha d'imprimir el "Enlairament!" encara que el comptador comence en 0... usem `do-while`:

```java
public class CompteArrere {
    public static void main(String[] args) {
        int comptador = 5;

        do {
            System.out.println(comptador);
            comptador--;
        } while (comptador >= 0);

        System.out.println("Enlairament! 🚀");
    }
}
```

Eixida:

```
5
4
3
2
1
0
Enlairament! 🚀
```

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan veges un bucle, pregunta't: *la condició avança cap a `false` en algun moment?* Si la resposta és "no", tens un bucle infinit.

**Exercici: el comptador parat**

Sense executar, calcula quantes vegades imprimix "Hola" este programa... o si es penja:

```java
public class Comptador {
    public static void main(String[] args) {
        int x = 10;

        while (x > 0) {
            System.out.println("Hola");
            x = x + 1;
        }
    }
}
```

<details>
<summary>🔄 Solució</summary>

**Bucle infinit.** `x` comença en 10 i en comptes de disminuir, s'incrementa (`x = x + 1`): la condició `x > 0` és `true` per sempre i el programa imprimix "Hola" eternament. La correcció seria `x = x - 1;`. Pista visual: un comptador que puja en un `while` que demana que baixe és fum a l'ordinador.

</details>

---

## 🎯 Mini-chequeig

1. Quantes vegades s'executa el bloc d'un `while` si la condició és `false` des del principi?
2. I en un `do-while`?
3. Què és un bucle infinit i com s'ix d'ell en l'IDE?
4. Quan usaríes un `do-while` per a un menú?

<details>
<summary>🔄 Respostes</summary>

1. **Zero vegades**: el `while` comprova abans d'executar.
2. **Almenys una vegada**: el `do-while` executa i comprova després.
3. Un bucle la condició del qual mai no passa a `false`. Es talla amb el botó de **parar (🟥)** de l'IDE, i s'evita assegurant que alguna cosa modifique la condició dins.
4. Quan vulgues mostrar el menú **sempre almenys una vegada** i repetir-lo fins que l'usuari trie una opció vàlida.

</details>

---

## ✅ Resum en 3 frases

1. `while` comprova la condició **abans** d'executar i `do-while` **després**: el segon garantix almenys una execució.
2. Un bucle necessita que la condició **avance cap a `false`**; si no, tens un bucle infinit.
3. Usa `while` per a llegir fins a un sentinella i `do-while` per a menús que s'han de mostrar sí o sí.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Bucle | Bloc que es repetix mentre una condició siga `true` |
> | Iteració | Una volta completa del bucle |
> | Condició | L'expressió booleana que decidix si es continua |
> | Sentinella | Valor especial que acaba la lectura ("eixir") |
> | Bucle infinit | Bucle que no s'acaba mai per descuit |
> | do-while | Bucle que executa almenys una volta i comprova al final |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/03-estructuras-control-excepciones) · **Anterior:** [02 · switch](/ApuntesProgramacion/va/03-estructuras-control-excepciones/02-switch) · **Següent:** [04 · Bucle for](/ApuntesProgramacion/va/03-estructuras-control-excepciones/04-bucle-for)
