---
title: 07 — Math.random() i nombres aleatoris
description: El casino de Java, amb daus i fórmules per a no fer trampa 🎲
---

<p><small>El casino de Java, amb daus i fórmules per a no fer trampa 🎲</small></p>

> 🗺️ **Estàs en:** 🔤 **U02 · Variables, Tipus i Operadors** → 07 · Math.random() i nombres aleatoris

---

## 📬 La idea en una frase

> **`Math.random()` retorna un nombre aleatori entre `0.0` (inclòs) i `1.0` (exclòs), i amb la fórmula `(int)(Math.random() * (max - min + 1)) + min` el convertixes en un dau, una loteria o qualsevol nombre que necessites.**

Els teus programes ja escolten (Scanner) i calculen (operadors). Ara jugaran: als daus, a la loteria, a endevinar nombres. I per a això necessites el casino de Java: `Math.random()`.

---

## 🎲 El casino: què retorna Math.random()

`Math.random()` és un **mètode estàtic** de la classe `Math`. Retorna un nombre entre `0.0` i `1.0`... amb un detall important: **l'`1.0` no està inclòs**. És com quan et toca la loteria però no.

```java
double aleatorio = Math.random();          // Entre 0.0 y 0.999999...
System.out.println(aleatorio);             // Per exemple: 0.473821...
```

> 💡 **Detall pràctic:** `Math.random()` és un mètode **estàtic**: no necessites crear un objecte de `Math` per a cridar-lo. Escrius `Math.random()` directament i ja està. És una crida de classe, no d'objecte.

---

## 🎯 La fórmula: de 0.0-1.0 al que tu vulgues

Un nombre entre 0 i 1 està molt bé, però tu vols un dau, un número de la loteria, un percentatge... Ací va l'escala:

```java
double aleatorio = Math.random();                    // Entre 0.0 y 0.999999...
int deCeroANueve = (int) (Math.random() * 10);      // Entre 0 y 9
int dado = (int) (Math.random() * 6) + 1;            // Entre 1 y 6 (como un dado)
```

Veus el patró? El truc està en multiplicar i sumar:

- `Math.random() * 6` → nombre entre `0.0` i `5.999...`
- `(int)` el trunca → entre `0` i `5`
- `+ 1` el desplaça → entre `1` i `6` ✅

**La fórmula universal** per a un nombre entre `min` i `max` (tots dos inclosos):

```java
int numero = (int) (Math.random() * (max - min + 1)) + min;
```

Exemple del 5 al 10:

```java
int entreCincoYDiez = (int) (Math.random() * 6) + 5;   // 5, 6, 7, 8, 9 o 10
```

> 📝 **Nota:** memoritza la fórmula com un mantra: `(max - min + 1)` dona la mida del ventall, i `+ min` el col·loca on comença. No hi ha més secret.

---

## 🧰 Altres ferramentes del casino: la classe Math

`Math` no és només la ruleta: és tota la sala de màquines. Algunes joies que usaràs a diari:

```java
double pi = Math.PI;                    // 3.141592653589793 — constant
double potencia = Math.pow(2, 10);      // 1024.0 — 2 elevat a 10
double raiz = Math.sqrt(144);           // 12.0
double absoluto = Math.abs(-7);         // 7.0
double redondeo = Math.round(4.6);      // 5.0
double techo = Math.ceil(4.1);          // 5.0
double suelo = Math.floor(4.9);         // 4.0
int maximo = Math.max(3, 9);            // 9
int minimo = Math.min(3, 9);            // 3
```

> 💡 **Detall pràctic:** tots estos són **mètodes estàtics** de la classe `Math` (i `Math.PI` una constant estàtica): es criden amb `Math.nombre`, sense crear objectes. A l'examen, la pregunta típica és "com redonix 4.6 sense truncar-lo?" → `Math.round(4.6)`.

---

## 🏫 Exemple guiat: el joc dels daus

Anem a muntar un dau de veritat, amb dos tirades, suma i veredicte:

```java
public class JuegoDeDados {
    public static void main(String[] args) {
        int dado1 = (int) (Math.random() * 6) + 1;
        int dado2 = (int) (Math.random() * 6) + 1;
        int suma = dado1 + dado2;

        System.out.println("Dado 1: " + dado1);
        System.out.println("Dado 2: " + dado2);
        System.out.println("Suma: " + suma);

        boolean esPar = suma % 2 == 0;
        String mensaje = esPar ? "Suma par — ganas" : "Suma impar — pierdes";
        System.out.println(mensaje);
    }
}
```

Eixida possible:

```
Dado 1: 4
Dado 2: 6
Suma: 10
Suma par — ganas
```

Cada execució dona un resultat distint: això és el divertit (i a voltes frustrant) dels aleatoris.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** recorda sempre *truncar abans de sumar*: `(int)(... * 6) + 1`, mai `(int)(... * 6 + 1)`. Si sumes abans del casting, el rang canvia i els teus daus mentiran.

**Exercici: el dau que mentix**

Quin rang de nombres produïx cadascuna d'estes tres línies? Quina és la que dona un dau de veritat (1 a 6)?

```java
int a = (int) (Math.random() * 6);
int b = (int) (Math.random() * 6) + 1;
int c = (int) (Math.random() * 7);
```

<details>
<summary>🔄 Solució</summary>

- `a`: `Math.random() * 6` va de `0.0` a `5.999...` → després del `(int)`, **0 a 5**.
- `b`: la línia anterior més `1` → **1 a 6**. ✅ És el dau de veritat.
- `c`: `Math.random() * 7` va de `0.0` a `6.999...` → després del `(int)`, **0 a 6** (¡set cares, i el 0 no existix en un dau!).

La diferència entre `b` i `c` és subtil però decisiva: la `+ 1` ha d'anar **fora** del casting.

</details>

---

## 🎯 Mini-chequeig

1. Quin rang exacte retorna `Math.random()`?
2. Escriu la línia per a obtindre un nombre aleatori entre 5 i 10.
3. Què retorna `(int) (Math.random() * 100)`? I si li sumes 1?
4. És `Math.PI` un mètode o una constant? I `Math.round`?

<details>
<summary>🔄 Respostes</summary>

1. Entre `0.0` (inclòs) i `1.0` (**exclòs**): de `0.0` a `0.999...`.
2. `int numero = (int) (Math.random() * 6) + 5;` — ventall de 6 valors començant en 5.
3. `(int) (Math.random() * 100)` dona **0 a 99**; amb `+ 1` dona **1 a 100**.
4. `Math.PI` és una **constant** (sense parèntesis); `Math.round` és un **mètode** (amb parèntesis).

</details>

---

## ✅ Resum en 3 frases

1. `Math.random()` retorna un nombre entre `0.0` i `1.0` (sense incloure l'1), i es combina amb multiplicacions i casting per a generar el rang que vulgues.
2. La fórmula `(int)(Math.random() * (max - min + 1)) + min` és la teua navalla suïssa per a qualsevol nombre aleatori.
3. `Math` és la sala de màquines estàtica: `PI`, `pow`, `sqrt`, `abs`, `round`... tots es criden amb `Math.nombre`, sense crear objectes.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `Math.random()` | Nombre aleatori entre 0.0 i 1.0 (l'1 exclòs) |
> | Mètode estàtic | Es crida amb `Math.nombre(...)`, sense crear objectes |
> | `Math.pow` | Potència: `Math.pow(base, exponent)` |
> | `Math.round` | Redonix (a diferència del truncament del casting) |
> | `Math.PI` | Constant amb el número π |
> | Truncar | Tallar els decimals amb `(int)` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/02-variables-tipos-operadores) · **Anterior:** [06 · Scanner: llegir pel teclat](/ApuntesProgramacion/va/02-variables-tipos-operadores/06-scanner-entrada-teclado) · **Següent:** [08 · Mètodes útils de String](/ApuntesProgramacion/va/02-variables-tipos-operadores/08-metodos-string)