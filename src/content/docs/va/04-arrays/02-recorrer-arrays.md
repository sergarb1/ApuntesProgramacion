---
title: "02 — Recórrer arrays: for i for-each"
description: "El duo inseparable (for + array) i la variant peresosa que només llig: el for-each 🌀"
---

<p><small>El duo inseparable (for + array) i la variant peresosa que només llig: el for-each 🌀</small></p>

> 🗺️ **Estàs en:** 🅿️ **U04 · Arrays** → 02 · Recórrer arrays: for i for-each

---

## 📬 La idea en una frase

> **Un array sense un bucle és un aparcament que ningú no visita: el `for` recorre plaça a plaça per índex, i el `for-each` fa el mateix però sense índex i només per a llegir.**

Al punt 1 vas aprendre a crear l'aparcament. Ara toca el divertit: passejar per totes les places i fer alguna cosa amb cada cotxe. I ací mana un duo tan inseparable com el pa i la mantega.

---

## 🔗 El duo inseparable: for + array

Els arrays i els bucles `for` es veuen sempre junts. No és casualitat: el `for` té un comptador natural (`i`) que encaixa perfecte amb els índexs de l'array.

```java
String[] gatos = {"Bigotes", "Garfield", "Misifú", "Calcetines"};

for (int i = 0; i < gatos.length; i++) {
    System.out.println("Gato " + i + ": " + gatos[i]);
}
```

Eixida:

```
Gato 0: Bigotes
Gato 1: Garfield
Gato 2: Misifú
Gato 3: Calcetines
```

Fixa't en la condició: `i < gatos.length`. Si escrigueres `i <= gatos.length`, a l'última volta demanaries la plaça `length` i... ¡BOOM! `ArrayIndexOutOfBoundsException`. És l'error de bucle més comés de l'univers.

### Patrons clàssics amb for

El `for` amb índex no només servix per a imprimir. Estos tres patrons es repetixen a cada exercici del curs:

**Sumar tots els elements:**

```java
int[] notas = {7, 8, 5, 9, 6};
int suma = 0;
for (int i = 0; i < notas.length; i++) {
    suma += notas[i];
}
System.out.println("Media: " + (double) suma / notas.length);
```

**Buscar un valor (cerca lineal):**

```java
int[] edades = {12, 45, 7, 34, 89};
int buscado = 34;
int posicion = -1;
for (int i = 0; i < edades.length; i++) {
    if (edades[i] == buscado) {
        posicion = i;
        break;
    }
}
System.out.println(posicion >= 0 ? "Encontrado en " + posicion : "No encontrado");
```

**Modificar l'array al lloc** (això només es pot amb índex):

```java
int[] numeros = {1, 2, 3, 4, 5};
for (int i = 0; i < numeros.length; i++) {
    numeros[i] = numeros[i] * 10;
}
// {10, 20, 30, 40, 50}
```

---

## 🛋️ for-each: la variant peresosa

Si no necessites l'índex (només vols llegir els valors), hi ha una sintaxi més curta:

```java
String[] gatos = {"Bigotes", "Garfield", "Misifú"};

for (String gato : gatos) {
    System.out.println("Miau: " + gato);
}
```

Es llig: "per a cada String gato en gatos, fes això". La variable `gato` va prenent el valor de cada plaça una a una, sense que tu gestiones comptadors ni claudàtors.

> 📝 **Nota:** el for-each és **només de lectura**. No pots modificar l'array original dins del bucle. Bé, pots intentar-ho, però el canvi es perd en l'èter: `gato = "Nuevo"` només canvia la variable local, no la plaça de l'array. Per a modificar, usa el `for` amb índex.

### Quan use cada un?

| Situació | Bucle recomanat |
|---|---|
| Només llegir i no m'importa la posició | `for-each` |
| Necessite l'índex (posicions, comparar veïns) | `for` clàssic |
| Vull modificar els elements de l'array | `for` clàssic |
| Recórrer cap arrere o de dos en dos | `for` clàssic |
| Recórrer una col·lecció (`ArrayList`, `HashSet`...) | `for-each` (U10 Col·leccions) |

> 💡 **Consell:** si no necessites l'índex, usa `for-each`. És més curt, més llegible i t'estalvia una classe sencera d'errors (oblidar el `++`, començar en 1, escriure `<=`...).

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** el for-each és com un robot que va per l'aparcament llegint les matrícules. Només llig: no pot repintar els cotxes.

**Exercici: la suma dels pacients**

```java
public class BeTheForEach {
    public static void main(String[] args) {
        int[] numeros = {10, 20, 30, 40, 50};
        int total = 0;

        for (int n : numeros) {
            if (n % 20 == 0) {
                total += n;
            }
        }

        System.out.println(total);
    }
}
```

**Què imprimeix?**

- (A) 60
- (B) 90
- (C) 120
- (D) 150

<details>
<summary>🔄 Solució</summary>

La **A**. El for-each recorre cada element: 10, 20, 30, 40, 50. El `if` només suma els múltiples de 20, que són 20 i 40. `20 + 40 = 60`. Els altres s'ignoren.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què imprimeix `for (int i = 0; i < a.length; i++)` sobre `{1,2,3}` si imprimixes `a[i]`?
2. Per què `for (int i = 0; i <= a.length; i++)` llança excepció?
3. Es pot modificar un array amb `for-each`?
4. Quin bucle usaríes per a imprimir l'array al revés?

<details>
<summary>🔄 Respostes</summary>

1. `1 2 3`. El bucle recorre les places 0, 1 i 2.
2. Perquè a l'última volta (`i == a.length`) demana una plaça que no existeix: els índexs vàlids acaben en `length - 1`.
3. No. El for-each és de només lectura: la variable del bucle és una còpia del valor, no la plaça.
4. Un `for` clàssic cap arrere: `for (int i = a.length - 1; i >= 0; i--)`.

</details>

---

## ✅ Resum en 3 frases

1. El **`for` clàssic** recorre l'array amb un índex (`i`) des de `0` fins a `length - 1`, i és l'únic que permet **modificar** elements.
2. El **`for-each`** llig tots els valors sense índex: perfecte per a sumar, comptar o imprimir, però és **només de lectura**.
3. La condició del bucle és `i < length`; si escrius `<=`, et estavelles contra `ArrayIndexOutOfBoundsException`.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Recórrer | Visitar cada element de l'array, un a un |
> | `for` clàssic | Bucle amb índex per a llegir, modificar o buscar |
> | `for-each` | Bucle de només lectura: "per a cada X en Y" |
> | Cerca lineal | Recórrer de principi a fi buscant un valor |
> | `break` | Tallar el bucle en el moment en què trobes allò que busques |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/04-arrays) · **Anterior:** [01 · Arrays: l'aparcament de dades](/ApuntesProgramacion/va/04-arrays/01-arrays-basicos) · **Següent:** [03 · Arrays multidimensionals](/ApuntesProgramacion/va/04-arrays/03-arrays-multidimensionales)