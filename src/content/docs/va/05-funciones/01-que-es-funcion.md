---
title: "01 · Què és una funció?"
description: "La recepta amb nom que converteix el codi repetit en una sola línia: per què existeix i què diables és un mètode 🔧"
---

<p><small>La recepta amb nom que converteix el codi repetit en una sola línia: per què existeix i què diables és un mètode 🔧</small></p>

> 🗺️ **Estàs en:** 🔧 **U05 · Funcions i mètodes** → 01 · Què és una funció?

---

## 📬 La idea en una frase

> **Una funció és una recepta amb nom: rep dades per la porta, fa una cosa ben explicada i torna el resultat; tu només l'invites pel seu nom.**

---

## 🍳 El problema: el paràgraf infinit

Mira este `main` d'un quadern de notes:

```java
public class Notas {
    public static void main(String[] args) {
        // Calcular la mitjana de 3 notes
        double media = (8 + 7 + 9) / 3.0;
        System.out.println("Mitjana 1: " + media);

        // Calcular la mitjana d'altres 3 notes... una altra volta
        double media2 = (6 + 5 + 10) / 3.0;
        System.out.println("Mitjana 2: " + media2);

        // I demà, amb 30 alumnes, copiar i pegar 30 voltes
    }
}
```

El càlcul està escrit **dues voltes**. Si demà canvies la fórmula (¿i si les notes tenen pes?), hauràs de buscar i arreglar totes les còpies: una oblidada i el programa ja ment. Programar copiant i enganxant és com cuinar repetint cada pas del receptari en veu alta en cada plat: funciona... fins que tens comensals.

> ⚠️ **Advertència:** si alguna volta escrius `// Calcular la mitjana` més d'un programa en el mateix fitxer, en algun lloc un programador sènior torna a plorar. El codi repetit no és codi: és deute amb interessos.

---

## 📖 La recepta amb nom

Una **funció** (en jerga: un **mètode**) és exactament això: una recepta amb nom en el receptari.

| Recepta de cuina | Funció en Java |
|---|---|
| El nom ("Truita de patates") | El **nom** del mètode (`calcularMedia`) |
| els ingredients que et passen | Els **paràmetres** (les dades d'entrada) |
| Els passos dins de la recepta | El **cos** (el codi entre `{` i `}`) |
| El plat que ix | El **valor que torna** (o res, si només fa alguna cosa) |

No recites la recepta sencera cada volta: dius **"truita"** i la cuina treballa. El mateix: dius `calcularMedia(...)` i el programa executa eixe tros de codi en el seu lloc.

```java
double notaMedia = calcularMedia(8, 7, 9);
System.out.println("Mitjana 1: " + notaMedia);
```

Dos línies on abans n'hi havia tres... i el millor: la fórmula **només està escrita una volta**. Quan canvie, canviarà en un sol lloc.

---

## 🔧 Funció o mètode? (no, no és el mateix... bé, sí)

Curso honest sobre la terminologia:

- **Funció** és el concepte general: entrades → procés → eixides. En Python, JavaScript o C les anomenes funcions.
- **Mètode** és eixa mateixa idea **vivint dins d'una classe**, que és on viu tot en Java (ja ho vas veure en la U02: fins i tot `main` està dins d'una classe).

En la pràctica, tothom usa els dos noms per al mateix, i en este curs també ho farem. Si en una entrevista et pregunten la diferència, ací tens la resposta exacta: **en Java, les funcions són mètodes d'una classe**.

> 💡 **Consell:** "mètode" és la paraula que veuràs en la documentació de Java i en els errors del compilador. "Funció" és la que escoltaràs en les converses. Saber les dos t'evita quedar-te fora de la conversa.

---

## 🧰 Què guanya el teu programa al tallar-lo

1. **No repeteixes codi.** La fórmula s'escriu una volta i s'usa 30.
2. **Es llig millor.** `mostrarMedia(...)` explica què passa; cinc línies d'aritmètica a mitges no.
3. **Es prova per parts.** Pots comprovar que `calcularMedia` funciona sense executar el programa sencer.
4. **Es repara sense por.** Arregles el tros trencat (el mètode) i la resta no s'assabenta.

És el mateix instint de la descomposició de la U01, però esta vegada amb ferramenta: abans **pensaves** el problema per parts; ara el llenguatge et deixa **escriure** cada part per separat.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el nom del mètode és documentació. Un mètode anomenat `hacerCosas` és una confessió; un anomenat `calcularIVA` és un pla.

**Exercici: el vident d'eixides**

```java
public class Vidente {
    static void saludar() {
        System.out.println("Hola, món");
    }

    public static void main(String[] args) {
        saludar();
        saludar();
    }
}
```

**Què imprimeix?**

- (A) `Hola, món` una volta
- (B) `Hola, món` dues voltes
- (C) Res: els mètodes no s'executen sols
- (D) Error de compilació

<details>
<summary>🔄 Solució</summary>

La **B**. `saludar()` es crida dos voltes des de `main`, i cada crida executa el seu cos: dos `Hola, món`. Un mètode no s'executa sol en declarar-se: només quan algú el crida. (La C és la trampa clàssica de "si està escrit, s'executa".)

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quines tres coses "típiques" té una funció (segons la taula de la recepta)?
2. S'executa el cos d'un mètode pel sol fet d'estar escrit en el fitxer?
3. `main` és una funció? I `saludar()` del teu propi programa?
4. Menciona dues avantatges de tallar el codi en mètodes.

<details>
<summary>🔄 Respostes</summary>

1. Un **nom**, unes **entrades** (paràmetres) i un **resultat** que torna (o res).
2. No. S'executa quan algú el **crida**.
3. `main` és el mètode especial per on arranca el programa; `saludar()` és un mètode normal. En Java, els dos són mètodes (funcions dins d'una classe).
4. Qualsevol de: no repetir codi, llegibilitat, provar per parts, reparar sense trencar la resta (i la quarta corona: canviar la fórmula en un sol lloc).

</details>

---

## ✅ Resum en 3 frases

1. Una **funció/mètode** és una recepta amb nom: rep dades, fa una cosa i torna alguna cosa (o no).
2. La seua avantatge és **escriure una volta, usar moltes**: el codi repetit desapareix i el canvi afecta a un sol lloc.
3. En Java tot mètode viu dins d'una classe, per això "funció" i "mètode" són la mateixa ferramenta amb dos noms.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Funció / Mètode | Recepta amb nom: entrades → procés → eixida |
> | Paràmetre | Dada que la funció rep per la porta |
> | Retorn | Valor que la funció torna en acabar |
> | Crida | Executar un mètode: `nom(...)` |
> | Cos | El codi entre `{` i `}` del mètode |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-funciones) · **Anterior:** [Índex de la unitat](/ApuntesProgramacion/va/05-funciones) · **Següent:** [02 · El teu primer mètode](/ApuntesProgramacion/va/05-funciones/02-primer-metodo)
