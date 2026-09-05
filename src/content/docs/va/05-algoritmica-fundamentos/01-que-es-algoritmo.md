---
title: "01 — Què és un algoritme"
description: La recepta de la truita que el teu ordinador pot seguir al peu de la lletra 🍳
---

<p><small>La recepta de la truita que el teu ordinador pot seguir al peu de la lletra 🍳</small></p>

> 🗺️ **Estàs en:** 🧩 **U05 · Algorítmica I: Fonaments** → 01 · Què és un algoritme

---

## 📬 La idea en una frase

> **Un algoritme és una recepta de cuina per al teu ordinador: una seqüència finita, ordenada i sense ambigüitats de passos que resol un problema.**

Quan cuines una truita de creïlles, seguixes un algoritme mental:

1. Pelar les creïlles.
2. Tallar-les a rodanxes fines.
3. Fregir-les amb oli abundant.
4. Batre els ous.
5. Barrejar-ho tot i quallar.

Però compte: "posa sal al gust" no val com a pas d'algoritme. Quant és "al gust"? Un pessic? Un grapat? Cada persona interpretaria la recepta de manera diferent. Un algoritme de veritat **no deixa espai a la interpretació**: cada pas ha de ser precís i determinista. Si li passes la mateixa entrada, sempre produïx la mateixa eixida. Com una màquina expenedora: fiques la moneda, polses el botó, i sempre ix el mateix batut.

---

## 🏛️ Les propietats d'un algoritme

Perquè una seqüència de passos mereca el nom d'algoritme, ha de complir cinc propietats:

1. **Finit**: ha d'acabar en algun moment. Si s'executa per sempre, no és un algoritme, és un malson.
2. **Precís**: cada pas està definit sense ambigüitat. Res de "al gust" ni "quan estiga llest".
3. **Entrada**: rep zero o més valors d'entrada.
4. **Eixida**: produïx almenys un valor d'eixida.
5. **Eficaç**: resol el problema en temps finit i de manera correcta.

> 📝 **Nota històrica:** la paraula "algoritme" ve del matemàtic persa **Al-Juarismi** (segle IX), que va escriure un llibre sobre com fer càlculs amb els nombres indis. Segles després, els informàtics li vam robar la paraula. Som així.

---

## 🧠 La idea vs. el codi

Este és un moment important, així que puja el volum mental:

> ⚠️ **Advertència:** **no tot codi és un algoritme.** L'algoritme és la *idea*: la seqüència de passos. El codi és la seua *materialització* en un llenguatge concret. Pots implementar el mateix algoritme en Java, en Python o en ensamblador, i l'essència serà la mateixa.

Mira este exemple. L'algoritme de "sumar dos nombres" es materialitza així en Java:

```java
public class AlgoritmeSimple {
    public static void main(String[] args) {
        int a = 5;
        int b = 3;
        int resultat = a + b;  // la idea: sumar. El codi: la materialització
        System.out.println("5 + 3 = " + resultat);
    }
}
```

La *idea* (sumar dos nombres) és la mateixa en qualsevol llenguatge. El *codi* és només el disfressa. Per això els algoritmes s'estudien independentment del llenguatge: són les receptes, i Java només és una de les teues cuines.

---

## 📦 Les dos grans famílies

En esta unitat (i en la pròxima) viuràs amb dos famílies d'algoritmes:

- **Cerca**: trobar un element dins d'un conjunt de dades. El nombre 23 és en este array?
- **Ordenació**: posar un conjunt de dades en un ordre determinat. Pots deixar este array ordenat de menor a major?

Són les dos habilitats bàsiques de qualsevol programa que maneja dades, i apareixen pertot arreu: en una llista de reproducció, en una base de dades, en un cercador. Sense ordenar ni buscar, la teua app és un calaix desordenat on les coses només estan "per ací".

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan escrigues passos "a la babalà" en un paper, pregunta't sempre: *podria la meua àvia executar estos passos sense preguntar-me res?* Si la resposta és "no", tens ambigüitat.

**Exercici: la truita ordenada**

Els passos d'esta recepta estan desordenats. Ordena'ls perquè formen un algoritme vàlid i explica quina de les propietats de l'algoritme fallaria si els deixares en l'ordre original:

1. Batre els ous.
2. Menjar la truita.
3. Posar sal "al gust" sobre les creïlles fregides.
4. Fregir les creïlles amb oli abundant.
5. Pelar i tallar les creïlles a rodanxes.
6. Barrejar les creïlles amb l'ou batut i quallar a la paella.

<details>
<summary>🔄 Solució</summary>

Ordre correcte: **5 → 4 → 1 → 6 → 2** (pelar i tallar, fregir, batre, barrejar i quallar, menjar).

El pas 3 ("posar sal al gust") sobra com a algoritme **precís**: és ambigu, cada persona interpretaria una quantitat diferent. Si el deixares en l'ordre original, la recepta no seria **precisa** ni **eficaç**, perquè no hi ha una única manera correcta d'executar-la. Nota extra: el pas 2 (menjar) podria estar en un altre ordre, però el lògic és al final.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quina és la diferència entre un algoritme i un programa?
2. Per què "posa sal al gust" no pot ser un pas d'algoritme?
3. Un algoritme pot rebre zero entrades?
4. Què passaria si un algoritme mai no acabara?

<details>
<summary>🔄 Respostes</summary>

1. L'algoritme és la **idea** (la seqüència de passos); el programa és la seua **materialització** en un llenguatge (Java, Python…).
2. Perquè és **ambigu**: no definix una quantitat exacta, i dos persones l'interpretarien de manera diferent.
3. Sí, un algoritme pot rebre **zero o més** entrades. Per exemple, "imprimix els nombres de l'1 al 10".
4. Deixaria de ser un algoritme: incomplix la propietat de ser **finit**. Es convertiria en un malson en bucle.

</details>

---

## ✅ Resum en 3 frases

1. Un algoritme és una **seqüència finita, precisa i sense ambigüitats de passos** que resol un problema: una recepta de cuina per a l'ordinador.
2. Ha de ser **finit, precís, amb entrades, amb eixida i eficaç**, i no deixa espai a la interpretació.
3. L'algoritme és la **idea** i el codi la seua materialització: el mateix algoritme s'escriu igual de bé en qualsevol llenguatge.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Algoritme | Seqüència finita i precisa de passos que resol un problema |
> | Determinista | Mateixa entrada → sempre mateixa eixida |
> | Ambigüitat | Pas que es pot interpretar de diverses maneres ("al gust") |
> | Cerca | Trobar un element dins d'un conjunt de dades |
> | Ordenació | Posar les dades en un ordre determinat (numèric, alfabètic…) |
> | Materialitzar | Traduir la idea de l'algoritme a codi d'un llenguatge |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-fundamentos) · **Anterior:** [Índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-fundamentos) · **Següent:** [02 · Cerca lineal](/ApuntesProgramacion/va/05-algoritmica-fundamentos/02-busqueda-lineal)
