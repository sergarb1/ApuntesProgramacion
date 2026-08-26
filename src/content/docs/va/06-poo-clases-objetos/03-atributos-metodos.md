---
title: "03 — Atributs i mètodes"
description: "Les propietats i els comportaments de la teua classe, amb els seus tipus, paràmetres i valors de retorn 🏗️"
---

<p><small>Les propietats i els comportaments de la teua classe, amb els seus tipus, paràmetres i valors de retorn 🏗️</small></p>

> 🗺️ **Estàs en:** 🏗️ **U06 · POO: Classes i Objectes** → 03 · Atributs i mètodes

---

## 📬 La idea en una frase

> **Els atributs són les propietats de la cosa (què és) i els mètodes són els seus comportaments (què fa): la classe els declara i cada objecte els viu pel seu compte.**

Ja saps que la classe és el motle. Ara vestirem eixe motle per dins: quines dades guarda i què sap fer. Els atributs i mètodes són la carn de la classe, i és ací on els teus objectes comencen a tindre vida pròpia.

---

## 🏷️ Els atributs: les propietats de la cosa

Un atribut es declara igual que una variable, però **dins de la classe** i **fora de qualsevol mètode**:

```java
public class Coche {
    String marca;       // atribut
    String modelo;      // atribut
    int velocidad;      // atribut
    boolean encendido;  // atribut
}
```

Cada atribut té un tipus (que ja domines de la U02) i descriu una propietat de l'objecte. Quan crees un cotxe amb `new Coche()`, eixe cotxe concret tindrà **la seua pròpia còpia** dels quatre atributs. Un altre cotxe, altres còpies. Cada galeta porta les seues pepitas.

> 💡 **Tip:** els atributs es declaren amb els mateixos tipus que les variables: `String`, `int`, `double`, `boolean`... Si domines la U02, domines la mitat d'este punt.

---

## 🎮 Els mètodes: els comportaments de la cosa

Un mètode és una acció que l'objecte sap fer. Té nom, paràmetres (les dades d'entrada) i un **tipus de retorn** (el que retorna):

```java
public class Coche {
    String marca;
    int velocidad;

    // Mètode que no retorna res: només fa coses
    void acelerar(int incremento) {
        velocidad += incremento;
    }

    // Mètode que retorna un valor: calcula i retorna
    int velocidadActual() {
        return velocidad;
    }

    // Mètode que imprimix i no retorna res
    void mostrarEstado() {
        System.out.println(marca + " va a " + velocidad + " km/h");
    }
}
```

- **`void`** = no retorna res. Només executa (acelera, imprimix, saluda...).
- **Tipus normal** (`int`, `double`, `String`...) = retorna un valor amb `return`.

> ⚠️ **Advertència:** si el mètode promet retornar un `int` (`int velocidadActual()`), està **obligat** a acabar amb un `return` que done un `int`. Si promet `void`, es prohibix el `return` amb valor. Java és un notari molt puntillós amb les firmes.

---

## 📞 Cridar els mètodes

Dins del `main` (o d'un altre mètode) crides els mètodes amb el punt:

```java
public class Concesionario {
    public static void main(String[] args) {
        Coche miCoche = new Coche();
        miCoche.marca = "Seat";
        miCoche.acelerar(50);          // no retorna res
        int v = miCoche.velocidadActual();   // retorna 50
        System.out.println("Velocidad: " + v);
        miCoche.mostrarEstado();       // "Seat va a 50 km/h"
    }
}
```

> 📝 **Nota:** dins de la pròpia classe (per exemple, `acelerar` cridant a `mostrarEstado`), no cal el punt: `mostrarEstado();` a secas. El punt només cal quan crides un mètode d'**un altre** objecte.

---

## 🧬 Cada objecte amb la seua pròpia còpia

Ací està la màgia del punt 2 feta realitat. Dos cotxes creats del mateix motle són independents:

```java
Coche cocheA = new Coche();
Coche cocheB = new Coche();

cocheA.marca = "Seat";
cocheB.marca = "Ford";

cocheA.acelerar(100);   // només cocheA s'assabenta

System.out.println(cocheA.marca + " → " + cocheA.velocidad);  // Seat → 100
System.out.println(cocheB.marca + " → " + cocheB.velocidad);  // Ford → 0
```

`cocheB` no sap res de l'acceleració de `cocheA`: cada objecte guarda els seus propis valors. Això és el que fa que la POO no siga un caos: **les dades de cada objecte van amb el seu objecte**.

> 💡 **Tip:** pensa en els atributs com a taquilles personals. Tu tens la teua taquilla, el teu company té la seua. Si omplis la teua de entrepans, la d'ell no s'ompli sola.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** per a traçar un programa amb objectes, fes una capseta per cada objecte i apunta els seus atributs dins. Cada volta que es crida un mètode, actualitza només la capseta de l'objecte que el crida.

**Exercici: la caixa misteriosa**

Sense executar, calcula què imprimix este programa:

```java
public class Caja {
    int ancho;
    int alto;
    int profundo;

    int volumen() {
        return ancho * alto * profundo;
    }
}

public class Main {
    public static void main(String[] args) {
        Caja c1 = new Caja();
        Caja c2 = new Caja();

        c1.ancho = 2;  c1.alto = 3;  c1.profundo = 4;
        c2.ancho = 5;  c2.alto = 1;  c2.profundo = 2;

        c1.ancho = 10;
        System.out.println(c1.volumen());
        System.out.println(c2.volumen());
    }
}
```

<details>
<summary>🔄 Solució</summary>

Imprimix **`120`** i **`10`**.

- `c1.volumen()` → 10 × 3 × 4 = **120** (hem canviat `ancho` a 10 abans de calcular).
- `c2.volumen()` → 5 × 1 × 2 = **10**.
- El canvi de `c1.ancho` **no afecta `c2`**: cada objecte té la seua pròpia còpia dels atributs. Si no ho has vist vindre, repetix el mantra: *cada objecte guarda els seus propis valors*.

</details>

---

## ❓ No Hi Ha Preguntes Tontes!

> **Q:** Un mètode pot cridar un altre mètode de la mateixa classe?
>
> **A:** Sí, i és el més normal del món. `acelerar` pot cridar a `mostrarEstado` sense el punt: `mostrarEstado();`. És com parlar-te a tu mateix en veu alta: no necessites presentar-te.

> **Q:** I si un mètode necessita diverses dades? Puc passar diversos paràmetres?
>
> **A:** Tots els que vulgues, separats per comes: `void mover(int x, int y, int velocidad)`. El nombre i tipus de paràmetres formen la **firma** del mètode, i Java distingix mètodes per la seua firma (això ho exprimim en el punt 7 amb la sobrecàrrega).

> **Q:** Els atributs poden tindre valors per defecte?
>
> **A:** Sí, i de fet Java els dona un automàticament quan crees l'objecte: nombres a `0`, `boolean` a `false` i `String` (i qualsevol referència) a `null`. Però dependre d'eixos valors és mala costum: veuràs en el punt 4 que els **constructors** existixen per a donar-los un bon començament.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. On es declaren els atributs dins d'una classe?
2. Què significa `void` en la firma d'un mètode?
3. Quina paraula retorna un valor en un mètode?
4. Si dos objectes són de la mateixa classe, compartixen els seus atributs?

<details>
<summary>🔄 Respostes</summary>

1. **Dins de la classe i fora de qualsevol mètode**.
2. Que el mètode **no retorna res**; només executa.
3. `return`.
4. **No.** Compartixen la *definició* (la classe), però cada objecte té la seua **pròpia còpia** dels valors.

</details>

---

## ✅ Resum en 3 frases

1. Els **atributs** són les propietats de la cosa i es declaren com variables dins de la classe; cada objecte té la seua pròpia còpia.
2. Els **mètodes** són els comportaments: poden no retornar res (`void`) o retornar un valor amb `return`, i reben dades per paràmetres.
3. S'invoquen amb el punt (`objeto.metodo()`), i dins de la mateixa classe no cal.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Atribut | Propietat de l'objecte: `marca`, `velocidad` |
> | Mètode | Comportament: `acelerar()`, `volumen()` |
> | Firma | Nom + tipus dels paràmetres |
> | `void` | El mètode no retorna res |
> | `return` | Retorna un valor al qui va cridar |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/06-poo-clases-objetos) · **Anterior:** [02 · Classes i objectes: el tallagalletas i les galetes](/ApuntesProgramacion/va/06-poo-clases-objetos/02-clases-objetos) · **Següent:** [04 · Constructors](/ApuntesProgramacion/va/06-poo-clases-objetos/04-constructores)