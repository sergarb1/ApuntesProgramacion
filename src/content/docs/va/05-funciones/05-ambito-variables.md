---
title: "05 · Àmbit de variables"
description: "Les variables viuen dins del seu mètode i no ixen: per què la teua `total` no pot xocar amb la de al costat ni escapar-se de casa 🏠"
---

<p><small>Les variables viuen dins del seu mètode i no ixen: per què la teua <code>total</code> no pot xocar amb la de al costat ni escapar-se de casa 🏠</small></p>

> 🗺️ **Estàs en:** 🔧 **U05 · Funcions i mètodes** → 05 · Àmbit de variables

---

## 📬 La idea en una frase

> **L'àmbit (scope) és el tros de codi on una variable existeix: dins d'un mètode només viuen els seus paràmetres i els seus locals, i el que naix ahí mor ahí.**

---

## 🏠 Cada mètode és una casa

```java
public class Casas {
    public static void sumar() {
        int total = 10;
        total += 5;
        System.out.println(total);   // 15
    }

    public static void restar() {
        int total = 100;
        total -= 5;
        System.out.println(total);   // 95
    }

    public static void main(String[] args) {
        sumar();
        restar();
        // System.out.println(total);  →  ¡error!
    }
}
```

Dos mètodes amb una variable anomenada `total` **alhora**: zero problemes, perquè són dos `total` diferents, una en cada casa. En canvi, si `main` intenta usar `total` sense declarar-la:

```
error: cannot find symbol: variable total
```

Java no la troba perquè **no existeix** fora de `sumar()`. El mètode ha acabat, la seua pila d'execució s'ha desfet i `total` ja no està.

> 💡 **Consell:** quan veges `cannot find symbol` en una variable, gairebé sempre és una de dos: l'has escrit malament (typo) o estàs intentant usar-la **fora de la seua casa**.

---

## 📏 Les regles de l'àmbit

1. **Paràmetres i locals** d'un mètode es veuen **dins d'eixe mètode** (de la seua firma a la seua clau de tancament).
2. **Un bloc també és una casa menuda:** una variable declarada dins d'un `if` o d'un `for` no existeix fora de les seues claus (ja ho vas vore en la U04).

```java
for (int i = 0; i < 10; i++) { ... }
// System.out.println(i);  →  cannot find symbol: variable i
```

3. **L'ordre importa dins del mètode:** només pots usar una variable **després** de declarar-la.
4. **Dues germanes no es barallen:** cada mètode té el seu propi espai; repetir noms entre mètodes és normal i sa.
5. En acabar el mètode, les seues variables **moren**: els seus valors no sobreviuen (salvo el que el mètode torne amb `return` o el que imprima).

```
main:            sumar:
┌──────────┐     ┌──────────────┐
│ (res)     │     │ total = 10   │  ← existeix només ací
└──────────┘     │ total = 15   │
                 └──────────────┘  ← i ací desapareix
```

---

## 🚪 El que entra per la porta també és de la casa

Els **paràmetres** són variables com les altres: es declaren a l'inici del mètode i moren amb ell.

```java
public static int triplicar(int numero) {
    int resultado = numero * 3;  // dos variables de la casa
    return resultado;
}
```

I ací arriba la conseqüència bonica: com Java copia els arguments en entrar, **el teu mètode pot usar el valor que li passes, però no reescriure la variable de qui crida**:

```java
int puntos = 10;
triplicar(puntos);
System.out.println(puntos);   // continua sent 10
```

`triplicar` va treballar amb la seua **còpia** de `puntos`. Per a "tornar" canvis, el mètode torna el nou valor amb `return` i qui crida el guarda. (¿I què passa amb els arrays, que sí es modifiquen des de dins? Eixe misteri ho resols en la U06, punt 5. I la versió completa, amb objectes, en la U09.)

> ⚠️ **Advertència:** no intentes "guardar" el resultat d'un mètode en una variable d'un altre mètode. Els mètodes només comparteixen el que es **passen** (arguments) o el que es **torna** (`return`). No hi ha ventanetes laterals.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** si necessites recordar alguna cosa d'un mètode a un altre, no amagues una variable: **torna-la** amb `return` i que la decisió la prenga qui crida.

**Exercici: existeix esta variable?**

```java
public class Alcance {
    public static void a() {
        int x = 1;
    }

    public static void b() {
        System.out.println(x);
    }

    public static void main(String[] args) {
        b();
    }
}
```

**Què passa?**

- (A) Imprimeix `1`
- (B) Imprimeix `0`
- (C) No compila: `x` no existeix en `b()`
- (D) Compila, però llança excepció en executar

<details>
<summary>🔄 Solució</summary>

La **C**. `x` viu i mor dins de `a()`. El mètode `b()` no la coneix: és un `cannot find symbol` de compilació, ni tan sols arriba a executar-se. Les variables no viatgen entre mètodes per art d'engany.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Poden dos mètodes tindre una variable local anomenada `contador` alhora?
2. Existeix `i` del `for` fora de les seues claus?
3. Sobreviu `resultado` a l'acabar el mètode que la declara?
4. El meu mètode no canvia el `saldo` que li he passat. És un bug?

<details>
<summary>🔄 Respostes</summary>

1. Sí: cadascuna viu en el seu mètode, són dos variables diferents.
2. No. El seu àmbit acaba en la clau de tancament del `for`.
3. No. Les locals moren en eixir del mètode; només sobreviu el que tornes.
4. No és un bug: els arguments primitius arriben **copiats**. Si necessites el resultat, torna'l amb `return`.

</details>

---

## ✅ Resum en 3 frases

1. L'**àmbit** d'una variable és el tros de codi on existeix: el seu mètode (o el seu bloc `if`/`for`) i res més.
2. Dins caben **paràmetres** i **locals**; en acabar el mètode desapareixen i un altre mètode no pot veure-les.
3. Entre mètodes només viatja el que es **passa** (arguments copiats) o el que es **torna** (`return`).

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Àmbit / scope | Regió on una variable existeix |
> | Variable local | Declarada dins d'un mètode o bloc |
> | Paràmetre | Variable d'entrada del mètode |
> | `cannot find symbol` | Estàs usant una variable fora de la seua casa |
> | Còpia de l'argument | El mètode treballa amb el seu propi duplicat |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-funciones) · **Anterior:** [04 · return: l'eixida](/ApuntesProgramacion/va/05-funciones/04-return-valores) · **Següent:** [06 · Errors freqüents](/ApuntesProgramacion/va/05-funciones/06-errores-frecuentes)
