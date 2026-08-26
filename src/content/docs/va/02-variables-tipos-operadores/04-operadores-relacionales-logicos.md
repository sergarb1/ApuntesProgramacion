---
title: 04 — Relacionals, lògics i ternari
description: El jutge, el porter i el bouncer del club de les decisions ⚖️
---

<p><small>El jutge, el porter i el bouncer del club de les decisions ⚖️</small></p>

> 🗺️ **Estàs en:** 🔤 **U02 · Variables, Tipus i Operadors** → 04 · Relacionals, lògics i ternari

---

## 📬 La idea en una frase

> **Els operadors relacionals (`==`, `!=`, `<`, `>`, `<=`, `>=`) comparen valors i retornen un `boolean`; els lògics (`&&`, `||`, `!`) combinen booleans; i el ternari (`? :`) resumix una decisió en una sola línia.**

Les teues variables ja saben sumar i restar. Ara aprendran a **jutjar**: "eres major d'edat?", "tens entrada I diners?", "eres el amo O un convidat?". Benvingut al club de les decisions.

---

## ⚖️ Relacionals: el jutge de la discussió

Els operadors relacionals sempre retornen un `boolean`: `true` o `false`. Són el jutge que dicta sentència sobre la relació entre dos valors:

```java
int edad = 18;
boolean puedeVotar = edad >= 18;                  // true
boolean tieneDescuento = edad < 12 || edad > 65;  // false
boolean noEsEl = edad != 18;                      // false
```

| Operador | Significat | Exemple (`edad = 18`) |
|---|---|---|
| `==` | Igual que | `edad == 18` → `true` |
| `!=` | Distint de | `edad != 18` → `false` |
| `>` | Major que | `edad > 21` → `false` |
| `<` | Menor que | `edad < 21` → `true` |
| `>=` | Major o igual | `edad >= 18` → `true` |
| `<=` | Menor o igual | `edad <= 18` → `true` |

> ⚠️ **Advertència:** **`=` no és `==`.** `=` assigna ("guarda este valor en esta caixa"), `==` compara ("són iguals?"). Confondre'ls és l'error més clàssic de la història de la programació. És com confondre "posa la taula" amb "està posada la taula?".

---

## 🚪 Lògics: el porter del club

Els operadors lògics combinen booleans per a prendre decisions compostes. Són el porter del club nocturn:

- **`&&` (AND)**: Tens més de 18 **I** tens entrada? Les dos condicions s'han de complir.
- **`||` (OR)**: Tens més de 18 **O** eres l'amo? Basta que es complisca una.
- **`!` (NOT)**: **NO** tens menys de 18? Niega la condició.

```java
boolean mayorEdad = true;
boolean tieneEntrada = false;

boolean entra = mayorEdad && tieneEntrada;    // false (falta l'entrada)
boolean entraVip = mayorEdad || tieneEntrada; // true (basta ser major d'edat)
boolean noEsMenor = !(edad < 18);             // true (nega que siga menor)
```

---

## ⚡ Curtcircuit: el porter que no mira

Ací ve el truc del club més rendible de Java: el **curtcircuit**.

- Amb `&&`, si el primer és `false`, l'expressió ja és `false` i **Java ni es molesta a avaluar el segon**.
- Amb `||`, si el primer és `true`, l'expressió ja és `true` i tampoc mira el segon.

```java
int x = 5;
boolean resultado = (x > 10) && (++x > 0);   // false, i x seguix sent 5
System.out.println(x);                       // 5 — el ++x mai no es va executar
```

> 💡 **Detall pràctic:** el curtcircuit també et protegix. Si escrius `(algo != null) && algo.metodo()`, Java no cridarà el mètode si `algo` és `null`, evitant un crash al teu programa.

---

## 🎚️ El ternari: el bouncer del club

Quan la decisió és "si passa això, missatge A; si no, missatge B", el **operador ternari** ho resumix en una línia. És un `if-else` de butxaca (els `if` de veritat arriben en la U03):

```java
int edad = 17;
String mensaje = (edad >= 18) ? "Pasa, joven" : "Vuelve cuando crezcas";
```

L'estructura és: `condició ? valorSiTrue : valorSiFalse`.

```java
int nota = 7;
String resultado = nota >= 5 ? "Aprobado" : "Suspenso";
```

---

## 🏫 Exemple guiat: el porter del club

Anem a muntar el control d'accés d'un club amb tot el que has après:

```java
public class ClubNoche {
    public static void main(String[] args) {
        int edad = 19;
        boolean tieneEntrada = true;
        boolean esVip = false;

        boolean puedeEntrar = (edad >= 18) && (tieneEntrada || esVip);
        String mensaje = puedeEntrar ? "¡Pasa, disfruta!" : "Fuera de aquí, pequeñín";

        System.out.println(mensaje);

        int golesLocal = 2;
        int golesVisitante = 2;
        String resultado = golesLocal > golesVisitante ? "Gana el local" :
                           golesLocal < golesVisitante ? "Gana el visitante" : "Empate";
        System.out.println("Resultado: " + resultado);
    }
}
```

Eixida:

```
¡Pasa, disfruta!
Resultado: Empate
```

Fixa't en la segona decisió: els ternaris es poden **encadenar** (un ternari dins d'un altre) per a gestionar tres casos. Llegible i compacte.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** en una expressió amb `&&` i `||`, pregunta sempre: *i si el primer ja decidix?* Eixe és el curtcircuit.

**Exercici: el detectiu de booleans**

Sense executar, calcula el valor de cada variable:

```java
int n = 10;
boolean a = (n > 5) && (n < 20);              // ¿?
boolean b = (n > 15) || (++n == 11);          // ¿?
boolean c = !(n == 10) && (n % 2 == 0);       // ¿?
System.out.println(a);
System.out.println(b);
System.out.println(c);
System.out.println(n);
```

<details>
<summary>🔄 Solució</summary>

Imprimix `true`, `true`, `false` i `11`.

1. `a`: 10 és major que 5 **i** menor que 20 → **true**.
2. `b`: 10 no és major que 15, així que Java avalua el `||` amb la segona part: `++n == 11` → incrementa `n` a 11 i compara: `11 == 11` → **true**. (El `||` només curtcircuita quan la primera és `true`; ací era `false`.)
3. `c`: `!(n == 10)` amb `n = 11` → `!false` → `true`; `&&` amb `11 % 2 == 0` → `false`. Resultat: **false**.
4. `n` va acabar en **11** pel `++n` de la línia 2.

</details>

---

## 🎯 Mini-chequeig

1. Què retorna sempre un operador relacional?
2. Quina és la diferència entre `&&` i `||` en una frase?
3. Què és el curtcircuit i quan s'activa?
4. Escriu el ternari que assigne `"major"` o `"menor"` a una variable segons una edat.

<details>
<summary>🔄 Respostes</summary>

1. Un **`boolean`**: `true` o `false`.
2. `&&` exigix que **totes** les condicions es complisquen; `||` es conforma amb **una sola**.
3. Quan la primera condició ja decidix el resultat, Java **no avalua les altres**: amb `&&` si la primera és `false`, amb `||` si la primera és `true`.
4. `String resultado = edad >= 18 ? "major" : "menor";`

</details>

---

## ✅ Resum en 3 frases

1. Els **relacionals** (`==`, `!=`, `<`, `>`, `<=`, `>=`) comparen i retornen un `boolean`, i `=` mai no s'usa per a comparar.
2. Els **lògics** (`&&`, `||`, `!`) combinen condicions i patixen **curtcircuit**: si la primera ja decidix, no miren les altres.
3. El **ternari** (`condició ? A : B`) resumix una decisió de dos camins en una línia.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Operador relacional | Compara dos valors i dona `true`/`false` |
> | Operador lògic | Combina booleans: `&&`, `\|\|`, `!` |
> | Curtcircuit | Deixar d'avaluar quan la primera condició ja decidix |
> | Ternari | `condició ? valor1 : valor2`, un if-else en una línia |
> | Booleà | Tipus amb només dos valors: `true` o `false` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/02-variables-tipos-operadores) · **Anterior:** [03 · Operadors aritmètics](/ApuntesProgramacion/va/02-variables-tipos-operadores/03-operadores-aritmeticos) · **Següent:** [05 · Casting i conversions](/ApuntesProgramacion/va/02-variables-tipos-operadores/05-casting-conversiones)