---
title: "06 — Referències, null i memòria"
description: "Què guarda de veritat una variable d'objecte, què pinta el heap i per què el NullPointerException et despertarà de nit 🕳️"
---

<p><small>Què guarda de veritat una variable d'objecte, què pinta el heap i per què el NullPointerException et despertarà de nit 🕳️</small></p>

> 🗺️ **Estàs en:** 🏗️ **U06 · POO: Classes i Objectes** → 06 · Referències, null i memòria

---

## 📬 La idea en una frase

> **Una variable d'objecte no guarda l'objecte: guarda l'adreça (la referència) on l'objecte viu en el heap. I `null` és una referència que no apunta a res.**

En el punt 2 tenies un dubte pendent: què passa amb `Galleta g3 = g1`. Eixe dubte es diu **referències**, i és de les poques coses d'esta unitat que de veritat mereixen que les veges vindre. Perquè quan ho entens, el 90% dels "bugs màgics" deixen de ser màgics.

---

## 📬 La carta davant de la casa

Pensa en les variables primitives com en les adreces postals: `int a = 5` guarda el **5** directament, com una foto en la teua cartera. Però una variable d'objecte guarda **l'adreça de la casa**, no la casa sencera:

```java
Galleta g = new Galleta();
```

- La galeta (l'objecte) viu en una zona de memòria anomenada **heap**.
- La variable `g` guarda un nombre que és *l'adreça* d'eixa galeta en el heap.

Eixe nombre es diu **referència**. Tu mai no el veus (Java l'amaga), però és la clau de tot el que passa en este punt.

> 💡 **Tip:** quan fas `new`, Java fabrica l'objecte en el heap i et lliura un "plànol de localització". La teua variable guarda eixe plànol. Copiar el plànol no copia la casa.

---

## 👯 L'àlies: dos variables, un objecte

Ací està el moment que ho canvia tot:

```java
Galleta g1 = new Galleta();
g1.sabor = "Chocolate";

Galleta g2 = g1;          // NO crea una altra galeta
g2.sabor = "Vainilla";    // quin sabor té g1 ara?

System.out.println(g1.sabor);  // "Vainilla" 😱
```

`g2 = g1` copia la **referència**, no l'objecte. Ara `g1` i `g2` apunten a **la mateixa galeta**. Canviar el sabor amb `g2` canvia la galeta que també veu `g1`. És el famós **àlies**: dos noms, una sola galeta.

> ⚠️ **Advertència:** este és el clàssic que cau en els exàmens "Què imprimeix?". La regla: **copiar una variable d'objecte copia l'adreça, no l'objecte**. Si vols una còpia independent, hauries de crear un objecte nou (`new`) i copiar atribut a atribut (o usar el que veuràs en la U09).

---

## ⚰️ `null`: la referència al buit

Una variable d'objecte que encara no apunta a res val `null`:

```java
Galleta g;          // sense inicialitzar: encara no apunta a res
Galleta h = null;   // explícitament "no hi ha galeta"
Galleta i = new Galleta();   // apunta a una galeta de veritat
```

`null` significa "referència que no apunta a cap objecte". I ací ve el monstre:

```java
Galleta h = null;
h.sabor = "Chocolate";   // 💥 NullPointerException
```

Si intentes tocar un atribut o cridar un mètode d'una referència `null`, Java llança **`NullPointerException`** (NPE): el programa mor en l'acte. És l'error més famós i odiat de Java.

> 💡 **Tip:** quan veges un `NullPointerException` en el teu programa, busca la variable que val `null` i pregunta't: *quan havia d'apuntar a un objecte i no ho va fer?* El 90% de les vegades és un objecte que mai no es va crear amb `new` o un atribut sense inicialitzar.

---

## 🏠 Primitius vs referències: el resum

| | Primitius (`int`, `double`...) | Referències (objectes) |
|---|---|---|
| Què guarda la variable | El **valor** directament | L'**adreça** de l'objecte en el heap |
| Comparar amb `==` | Compara valors | Compara **adreces** (mateix objecte?) |
| Valor "buit" | `0`, `false`, `0.0` | `null` |
| Copiar | Copia el valor | Copia l'adreça (àlies) |

> 📝 **Nota:** en la U02 vas vore que `String` es compara amb `equals`, no amb `==`. Ara tens el perquè: `String` és un objecte, així que `==` compara referències, no contingut. Els literals iguals de `String` a vegades compartixen adreça (el *string pool*), per això `"Hola" == "Hola"` pot donar `true` per pura casualitat. No confies mai en això: usa `equals`.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** dibuixa el heap. Per cada `new`, una capseta amb la seua etiqueta. Per cada variable, una fletxa cap a la seua capseta (o cap al buit si és `null`). Després només has de seguir les fletxes.

**Exercici: el lío de les fletxes**

Sense executar, què imprimix este programa?

```java
public class Cuenta {
    int saldo;
}

public class Main {
    public static void main(String[] args) {
        Cuenta a = new Cuenta();
        a.saldo = 100;

        Cuenta b = a;
        b.saldo += 50;

        Cuenta c = new Cuenta();
        c.saldo = a.saldo;

        a = null;

        System.out.println(b.saldo);
        System.out.println(c.saldo);
    }
}
```

<details>
<summary>🔄 Solució</summary>

Imprimix **`150`** i **`150`**.

- `b = a` fa que tots dos apunten al mateix compte, així que `b.saldo += 50` puja el saldo d'*eixe* compte a 150 (que també veu `a`).
- `c = new Cuenta()` és un objecte nou; `c.saldo = a.saldo` copia el **valor** 150.
- `a = null` desconnecta la variable `a`, però el compte continua viu perquè `b` l'apunta. Si ningú apuntara a l'objecte, el recol·lector de brossa el reciclaria (això també existix, i t'alegra la vida).

Resum: **`b` i `c` imprimixen 150, però per raons distintes**: `b` perquè compartix el compte amb `a`, `c` perquè li vas copiar el valor.

</details>

---

## ❓ No Hi Ha Preguntes Tontes!

> **Q:** Es pot comparar una referència amb `null` per a saber si apunta a alguna cosa?
>
> **A:** Sí, i és súper útil: `if (galleta == null) { ... }` o `if (galleta != null) { ... }`. És la forma de blindar el teu codi contra els NPE: *"si no és null, faig coses; si és null, salta del vaixell"*.

> **Q:** Què passa amb els objectes que ja no tenen cap variable apuntant-los? Es queden ahí per sempre?
>
> **A:** No. Java té un **recol·lector de brossa** (garbage collector) que detecta els objectes "orfe" (sense referències) i allibera la seua memòria. Tu no has de fer res: és la criada invisible de Java. En C++ això era manual i feia mal.

> **Q:** I si faig `null` a totes les variables que apunten al mateix objecte?
>
> **A:** Quan l'última referència desapareix, el recol·lector se'n porta l'objecte. És la forma de "matar" un objecte: llevar-li tots els apuntadors. No hi ha `delete` en Java; hi ha deixar de mirar-lo fins que desaparega.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què guarda una variable d'objecte: l'objecte o la seua adreça?
2. Què fa `Galleta g2 = g1;`? Crea una altra galeta?
3. Què significa `null`?
4. Quina excepció llança Java si uses una referència `null`?

<details>
<summary>🔄 Respostes</summary>

1. L'**adreça** (la referència), no l'objecte. L'objecte viu en el **heap**.
2. **No.** Copia la referència: `g1` i `g2` apunten al **mateix objecte** (àlies).
3. Que la referència **no apunta a cap objecte**.
4. **`NullPointerException`** (NPE).

</details>

---

## ✅ Resum en 3 frases

1. Una variable d'objecte guarda la **referència** (l'adreça en el heap), no l'objecte; per això copiar-la crea un **àlies**.
2. **`null`** és una referència que no apunta a res, i usar-la provoca la temuda **`NullPointerException`**.
3. Els primitius guarden el valor (i es comparen amb `==`); els objectes guarden adreces (i es comparen amb `equals`).

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Referència | L'adreça on viu l'objecte |
> | Heap | La zona de memòria on viuen els objectes |
> | Àlies | Dos variables apuntant al mateix objecte |
> | `null` | Referència que no apunta a res |
> | NPE | `NullPointerException`, el crash per usar `null` |
> | Recol·lector de brossa | El que recicla objectes sense referències |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/06-poo-clases-objetos) · **Anterior:** [05 · La paraula clau this](/ApuntesProgramacion/va/06-poo-clases-objetos/05-this) · **Següent:** [07 · Sobrecàrrega i pas per valor](/ApuntesProgramacion/va/06-poo-clases-objetos/07-sobrecarga-paso-valor)