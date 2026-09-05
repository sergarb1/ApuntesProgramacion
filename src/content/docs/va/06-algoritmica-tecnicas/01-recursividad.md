---
title: "01 — Recursivitat: una funció que es crida a si mateixa"
description: Quan el teu codi decidix cridar-se a si mateix i el teu cervell comença a fumejar 🔁
---

<p><small>Quan el teu codi decidix cridar-se a si mateix i el teu cervell comença a fumejar 🔁</small></p>

> 🗺️ **Estàs en:** ⚡ **U06 · Algorítmica II: Tècniques** → 01 · Recursivitat

---

## 📬 La idea en una frase

> **La recursivitat és quan una funció es crida a si mateixa per a resoldre un problema resolent una versió més xicoteta de si mateix, fins a arribar a un cas base que ho deté tot.**

En la U05 vas vore que un algorisme es pot escriure amb bucles. Però hi ha problemes que s'*expressen* de manera molt més natural dient "este problema és com el mateix problema, però més xicotet". Per a eixos casos va nàixer la recursivitat: la tècnica estrella d'esta unitat.

---

## 🔁 El cicle de la vida recursiva

Tota funció recursiva necessita **dues parts imprescindibles**. Si et falta una, estàs mort:

> [!NOTE]
> - **Cas base**: la condició que deté la recursió. Sense això, el teu programa s'executa fins que la JVM es cansa i et llança un `StackOverflowError`.
> - **Cas recursiu**: la crida a si mateixa, normalment amb una versió més xicoteta del mateix problema.

L'estructura general és sempre la mateixa:

```java
public static tipus funcio(parametres) {
    if (/* condicio de parada */) {
        return /* valor base */;
    } else {
        // fer alguna cosa amb el problema actual
        return funcio(/* versio mes xicoteta */);
    }
}
```

Pensa-ho com a netejar la teua habitació (suposant que algun dia ho faces): en lloc de netejar-la sencera de cop, agafes una cosa del terra i torne a cridar la mateixa funció "netejarHabitacio" amb el que queda. Eventualment no queda res, i has acabat.

---

## 📚 La pila de crides: l'origen de tota la diversió

Cada vegada que una funció es crida, Java reserva un trosset de memòria en l'**stack** (la pila). Eixe trosset es diu **stack frame** i guarda: els paràmetres de la funció, les variables locals, i l'adreça de tornada per quan la funció acabe.

Si crides una funció 5 vegades, tens 5 frames en l'stack. Si la crides 10.000 vegades... bum. `StackOverflowError`.

```java
public class StackExplorer {

    static int prof = 0;

    static void recursiu() {
        prof++;
        System.out.println("Crida numero: " + prof);
        recursiu(); // ¡no hi ha cas base!
    }

    public static void main(String[] args) {
        try {
            recursiu();
        } catch (StackOverflowError e) {
            System.out.println("Stack explotat a la crida: " + prof);
        }
    }
}
```

Prova-ho. Veuràs que el nombre varia segons la teua màquina i la JVM: normalment entre 10.000 i 20.000 crides. No és infinit. Res no ho és.

> [!WARNING]
> Sense cas base, no hi ha pietat. L'stack té un límit i Java no et salvarà. Cada frame ocupa espai, i quan el got es desborda, la JVM diu "fins ací hem arribat". Atrapa el `StackOverflowError` només per a inspeccionar (com dalt), mai per a "arreglar" una recursió trencada.

---

## 🥊 Recursivitat vs iteració: el duel

| Aspecte | Recursivitat | Iteració (bucles) |
|---|---|---|
| Llegibilitat | Molt elegant per a problemes jeràrquics | Més verbosa però clara |
| Memòria | Gasta stack (cada crida = frame nou) | Només variables locals |
| Velocitat | Més lenta (overhead de crides) | Més ràpida |
| Stack overflow | Risc real si la profunditat és alta | No aplica |
| Casos ideals | Arbres, grafs, backtracking, divide i venceràs | Recorreguts lineals, processament simple |

La regla d'or: **usa recursivitat quan el problema siga inherentment recursiu** (estructures jeràrquiques, expressions anidades, ordenació avançada). Per a la resta, un `for` de tota la vida. Ningú no et donarà una medalla per fer una suma d'array amb recursió.

---

## 🌰 Un primer exemple complet

Abans dels clàssics del punt 2, un exemple mínim perquè vegen l'estructura completa. Comptar fins a `n`:

```java
public class CompteArrere {

    static void compte(int n) {
        if (n < 0) return;              // cas base: no hi ha nombres negatius per imprimir
        System.out.println(n);
        compte(n - 1);                  // cas recursiu: el mateix problema, un pas més xicotet
    }

    public static void main(String[] args) {
        compte(3);
    }
}
```

Eixida:

```
3
2
1
0
```

Fixa't: primer baixa imprimint 3, 2, 1, 0, i quan `n < 0`, la crida retorna i tots els frames es tanquen un darrere l'altre. La pila es buida en ordre invers al qual es va omplir.

> [!TIP]
> El 90% dels bugs de recursió són dos: **oblidar el cas base** o **no reduir el problema** (cridar-se a si mateixa amb els mateixos paràmetres). Si la teua recursió no acaba o no avança, dibuixa l'arbre de crides en un paper. El paper i el boli continuen sent les teues millors ferramentes de depuració.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quines dues parts necessita tota funció recursiva?
2. Què llança la JVM si la recursió mai no acaba?
3. Què guarda un *stack frame*?
4. Per què una suma d'array amb bucle sol ser millor que amb recursió?

<details>
<summary>🔄 Respostes</summary>

1. El **cas base** (deté la recursió) i el **cas recursiu** (la crida a si mateixa amb un problema més xicotet).
2. Un **`StackOverflowError`** quan l'stack s'ompli de frames.
3. Els **paràmetres**, les **variables locals** i l'**adreça de tornada** per a continuar quan la crida acabe.
4. Perquè cada crida recursiva crea un frame nou en l'stack: **més memòria i més overhead** que un simple `for`.

</details>

---

## ✅ Resum en 3 frases

1. La recursivitat és una **funció que es crida a si mateixa** amb una versió més xicoteta del problema.
2. Sense **cas base** no hi ha detenció: l'stack s'ompli i arriba el `StackOverflowError`.
3. Usa recursió quan el problema siga **inherentment recursiu**; per a allò lineal, els bucles continuen guanyant.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Cas base | La condició que deté la recursió |
> | Cas recursiu | La crida a si mateixa amb un problema menor |
> | Stack frame | El trosset de memòria de cada crida (paràmetres, locals, retorn) |
> | Call stack | La pila de frames pendents |
> | `StackOverflowError` | El que passa quan omplis la pila |
> | Recursió de cua | Quan la crida recursiva és l'últim que fa la funció |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/06-algoritmica-tecnicas) · **Anterior:** [Índex de la unitat](/ApuntesProgramacion/va/06-algoritmica-tecnicas) · **Següent:** [02 · Recursivitat: exemples clàssics](/ApuntesProgramacion/va/06-algoritmica-tecnicas/02-recursividad-ejemplos-clasicos)
