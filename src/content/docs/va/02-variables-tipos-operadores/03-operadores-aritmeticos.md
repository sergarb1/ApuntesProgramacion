---
title: 03 — Operadors aritmètics
description: Les màquines de pesos del gimnàs de dades ➕
---

<p><small>Les màquines de pesos del gimnàs de dades ➕</small></p>

> 🗺️ **Estàs en:** 🔤 **U02 · Variables, Tipus i Operadors** → 03 · Operadors aritmètics

---

## 📬 La idea en una frase

> **Els operadors aritmètics (`+`, `-`, `*`, `/`, `%`) són les màquines de pesos del gimnàs de dades: transformen les teues variables, i la divisió entera i la precedència són les trampes que separen els que saben dels que improvisen.**

Tindre variables està molt bé, però no servixen de res si no fas coses amb elles. Benvingut al gimnàs: suaràs amb els cinc exercicis bàsics i descobriràs per què `10 / 3` no és el que tu creus.

---

## 💪 El dia al gimnàs: els 5 exercicis bàsics

| Operador | Exercici | Exemple |
|---|---|---|
| `+` | Press de banca | `5 + 3 = 8` |
| `-` | Curl de bíceps | `5 - 3 = 2` |
| `*` | Sentadilla | `5 * 3 = 15` |
| `/` | Pes mort | `10 / 3 = 3` (enters) o `10.0 / 3 = 3.333...` |
| `%` | L'odiat abdominal | `10 % 3 = 1` (el reste de 10/3) |

```java
int a = 10;
int b = 3;
double c = 10.0;

System.out.println(a / b);            // 3  (divisió entera)
System.out.println(a % b);            // 1  (el reste)
System.out.println(c / b);            // 3.333... (divisió real)
System.out.println((double) a / b);   // 3.333... (obligues decimal)
```

> 💡 **Detall pràctic:** el **mòdul** (`%`) no és per a avorrits: et diu si un nombre és parell (`numero % 2 == 0`), repartix torns, dona voltes als rellotges i alimenta un munt de jocs. Sense `%` no existiria res cíclic.

---

## ⚠️ La divisió entera mata

**Si dividixes dos enters, Java et retorna un enter.** Punt. Els decimals es truncaren sense pietat:

```java
int alumnos = 17;
int grupos = 5;
System.out.println(alumnos / grupos);   // 3 — Java diu que cada grup té 3 alumnes
```

Per a Java, 17 dividit entre 5 són **3**. Ni 3.4 ni 3.5: 3. Si vols decimals, almenys un dels dos operands ha de ser `double` (o fer un casting, que veuràs en el punt 5).

> ⚠️ **Advertència:** este és un dels errors més rendibles per a un examen. `5 / 2` és `2`. `5 / 2.0` és `2.5`. `(double) 5 / 2` és `2.5`. Memoritza-ho com un mantra.

---

## 🎭 Precedència: la llei del menjador

Qui se servix primer en el menjador de les expressions? Hi ha un ordre estricte:

```java
int resultado = 2 + 3 * 4;        // 14 — la multiplicació es cola abans
int conParentesis = (2 + 3) * 4;  // 20 — els parèntesis tenen passe VIP
```

**La llei del menjador:**
1. **Parèntesis `()`** — passe VIP, van els primers.
2. **Multiplicació, divisió i mòdul `* / %`** — els populars.
3. **Suma i resta `+ -`** — els normals, els últims.

> 📝 **Nota:** i quan dubtes, **posa parèntesis**. `(a + b) * (c - d)` és molt més llegible que confiar en la teua memòria de la precedència. Els parèntesis no dolen i el que llegix el teu codi (el teu jo del futur) t'ho agrairà.

---

## 🌀 Assignació composta: la drecera peresosa

Escriure `x = x + 5` és tan verbós... Per sort, Java té els **operadors d'assignació composta**, una aixeta d'aigua al sofà per a no anar a la cuina:

```java
int x = 10;
x += 5;   // x = 15  (x = x + 5, però més cool)
x -= 3;   // x = 12
x *= 2;   // x = 24
x /= 4;   // x = 6
x %= 3;   // x = 0
```

---

## 💪 `++` i `--`: flexions per a variables

Sumar o restar 1 és tan comú que Java té el seu propi operador: `++` (increment) i `--` (decrement). Però compte, que tenen dos cares:

```java
int a = 5;
int b = a++;  // POST: primer usa a (5), després incrementa → b = 5, a = 6
int c = ++a;  // PRE: primer incrementa, després usa → a = 7, c = 7
```

- **Post-increment (`a++`)**: "usa i després puja".
- **Pre-increment (`++a`)**: "puja i després usa".

> ⚠️ **Advertència:** regla d'or: si uses `++` o `--` *dins* d'una expressió complicada, estaràs escrivint codi que ni tu entendràs en una setmana. Usa'ls sols, en la seua pròpia línia. En els exàmens apareixen les trampes, i ací tens la prova.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** desglossa l'expressió pas a pas. Quin valor té cada variable en cada moment? Anota-ho, no ho faces de memòria.

**Exercici: l'acròbata de les variables**

Sense executar, calcula quant val tot ací:

```java
int x = 3;
int y = x++ + ++x;
System.out.println("x = " + x + ", y = " + y);
```

<details>
<summary>🔄 Solució</summary>

Imprimix `x = 5, y = 8`. Pas a pas:

1. `x = 3`.
2. `x++` — POST: usa `x` (3), després incrementa `x` a 4. El valor de `x++` és **3**.
3. `++x` — PRE: `x` val 4 ara; l'incrementa a **5** i eixe és el seu valor.
4. `y = 3 + 5 = 8`.
5. Resultat: `x = 5, y = 8`.

Als programadors professionals també els costa. Per això quasi ningú escriu això en producció... però en els exàmens, ¡ai, apareix!

</details>

---

## 🎯 Mini-chequeig

1. Quant val `int r = 10 / 3`? I `double r = 10 / 3`?
2. Què fa l'operador `%` i per a què servix saber si `n % 2 == 0`?
3. Quin és el resultat de `2 + 3 * 4 - 1`?
4. Diferència entre `a++` i `++a` en una frase.

<details>
<summary>🔄 Respostes</summary>

1. `int r = 10 / 3` val **3** (divisió entera trunca). `double r = 10 / 3` també val **3.0**: la divisió es fa primer amb enters i després es guarda. Per a decimals necessites `10 / 3.0` o `(double) 10 / 3`.
2. El `%` dona el **reste** de la divisió. `n % 2 == 0` és la prova universal de paritat: si el reste és 0, `n` és parell.
3. **13**: primer `3 * 4 = 12`, després `2 + 12 - 1 = 13`. La multiplicació mana.
4. `a++` **usa** el valor actual i després incrementa; `++a` **incrementa** primer i després usa el nou.

</details>

---

## ✅ Resum en 3 frases

1. Els operadors `+ - * / %` transformen les teues dades, i la **divisió entera** trunca els decimals si tots dos operands són enters.
2. La **precedència** seguix la llei del menjador (parèntesis → `* / %` → `+ -`), i els parèntesis sempre són el pla B segur.
3. `+=`, `-=`, `++` i `--` són dreceres perillosament còmodes: usa-les soles i no dins d'expressions enrevessades.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Operador aritmètic | `+ - * / %`: les operacions matemàtiques de Java |
> | Divisió entera | Divisió de dos enters que trunca els decimals |
> | Mòdul | `%`, el reste d'una divisió |
> | Precedència | L'ordre en què Java avalua els operadors |
> | Assignació composta | Drecera com `x += 5` (= `x = x + 5`) |
> | Increment | `++`/`--`: sumar o restar 1, amb cara pre i post |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/02-variables-tipos-operadores) · **Anterior:** [02 · String, constants i final](/ApuntesProgramacion/va/02-variables-tipos-operadores/02-string-constantes-final) · **Següent:** [04 · Relacionals, lògics i ternari](/ApuntesProgramacion/va/02-variables-tipos-operadores/04-operadores-relacionales-logicos)