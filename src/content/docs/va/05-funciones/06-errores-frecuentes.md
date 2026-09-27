---
title: "06 · Errors freqüents"
description: "Els 7 entrebancs de tothom amb els mètodes: codi trencat, error real de CONRAD i la seua arregla 🧯"
---

<p><small>Els 7 entrebancs de tothom amb els mètodes: codi trencat, error real de CONRAD i la seua arregla 🧯</small></p>

> 🗺️ **Estàs en:** 🔧 **U05 · Funcions i mètodes** → 06 · Errors freqüents

---

## 📬 La idea en una frase

> **Els errors amb mètodes no són aleatoris: tenen nom, missatge i arregla. Apren els set i el 90% de les teues hores de frustració s'evaporen.**

---

## 🧯 La galeria dels 7 entrebancs

### 1. Falta el `return` (o no tots els camins tanquen)

```java
public static int doble(int n) {
    if (n > 0) {
        return n * 2;
    }
    // ¿i si n <= 0?
}
```

`error: missing return statement`. **Arregla:** tanca tots els camins amb `return`.

### 2. Arguments en ordre o tipus incorrecte

```java
static void pintar(String color, int veces) { ... }
pintar(3, "roig");
```

`error: incompatible types: int cannot be converted to String`. **Arregla:** respecta l'ordre i el tipus de la firma; repassa la crida amb els ulls en la declaració.

### 3. Nombre d'arguments que no quadra

```java
static int suma(int a, int b) { return a + b; }
int r = suma(1, 2, 3);
```

`error: wrong number of arguments`. **Arregla:** la firma mana: 2 paràmetres = 2 arguments, ni un de més ni un de menys.

### 4. Imprimir quan has de tornar

```java
static void media(int a, int b) {
    System.out.println((a + b) / 2.0);   // void, sense retorn
}
double m = media(3, 4);   // ← això no compila: void no és un valor
```

`error: incompatible types: void cannot be converted to double`. **Arregla:** que el mètode `return` el resultat; imprimir és cosa de qui crida.

### 5. Oblidar `static` en cridar des de `main`

```java
void saludar() { ... }              // sense static
public static void main(String[] a) {
    saludar();                      // ← ¡PROHIBIT de moment!
}
```

`error: non-static method saludar() cannot be referenced from a static context`. **Arregla:** d'esta unitat, els teus mètodes porten `static`. L'explicació completa (i l'alternativa amb objectes) viu en la U10.

### 6. Cridar com si fora sentència solta

```java
saludar        // falten () i ;
saludar()      // falta el ;
```

**Arregla:** la crida és `saludar();` — amb parèntesis (encara que no porte arguments) i amb punt i coma.

### 7. Copiar i enganxar... el mètode equivocat

```java
mostrarTotal();
mostrarTotal();   // volies cridar a mostrarMedia()
```

Sense error de compilació: **el més perillós dels set**. Compila, executa i ment. **Arregla:** llegeix el nom de cada crida com si l'escriguera un desconegut (perquè d'ací a dos setmanes ho seràs).

> 📝 **Nota:** els errors 1-6 els veu CONRAD en roig abans d'executar. El 7 és d'execució: per això el nom del mètode i la prova manual importen tant.

---

## 🩺 Com diagnosticar sense perdre't

Quan fallen un mètode, fes les preguntes en este ordre:

1. **¿Compila?** → Llegeix el missatge de CONRAD: `cannot find symbol` (mal escrit o fora d'àmbit), `wrong number of arguments`, `incompatible types` (tipus/ordre), `missing return statement`.
2. **¿Compila però no fa el que esperaves?** → Has cridat al mètode correcte (7)? Li passes els arguments en l'ordre que creus (2)?
3. **¿Imprimeix alguna cosa rara?** → Traça la crida: qui imprimeix i qui torna? Estàs usant la còpia que arriba per paràmetre?

> ⚠️ **Advertència:** no pegues l'error en el buscador abans de llegir-lo sencer. El 95% dels errors d'esta unitat diuen en la primera línia **què** està mal i en la segona **on**.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan tot compile i el resultat continue sense quadrar, imprimeix (o millor: torna) els valors a mig camí. Depurar és mirar, no endevinar.

**Exercici: el taller d'arregles**

Este mètode hauria de tornar el major de dos nombres, però té **2 errors** (un de compilació i un de lògica):

```java
public static int mayor(int a, int b) {
    if (a > b) {
        return a
    }
    return 0;
}
```

**Quins són i com queden?**

<details>
<summary>🔄 Solució</summary>

1. **Compilació:** falta `;` després de `return a` → `return a;`.
2. **Lògica:** el segon camí torna `0` en lloc de `b`: quan `a <= b`, el major és `b`.

Versió correcta:

```java
public static int mayor(int a, int b) {
    if (a > b) {
        return a;
    }
    return b;
}
```

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin error dona `int r = media(3, 4);` si `media` és `void` i només imprimeix?
2. Quins tres missatges busques primer en no compilar una crida?
3. Per què l'error 7 (cridar al mètode equivocat) no el detecta el compilador?
4. Quina paraula falta en `void log(String s) { System.out.println(s) }`?

<details>
<summary>🔄 Respostes</summary>

1. `void cannot be converted to int`: res de `void` pot guardar-se en una variable.
2. `cannot find symbol`, `wrong number of arguments`, `incompatible types` (i `missing return statement` si el fall està en el cos).
3. Perquè el nom i els arguments són correctes **sintàcticament**: només el programador sap que volies l'altre mètode.
4. El `;` després del `println` (i eixe error apareix en compilar la classe, no només en cridar).

</details>

---

## ✅ Resum en 3 frases

1. Els errors de mètodes són **set famílies**: return, ordre/tipus d'arguments, nombre d'arguments, void-vs-retorn, `static`, puntuació de la crida i nom equivocat.
2. Els sis primers els atrapa el compilador; el setè el detecta **el teu cervell** llegint noms en veu alta.
3. Diagnosticar sempre en ordre: compila → missatge d'error → traça de la crida.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `missing return statement` | Algun camí no torna el que la firma promet |
> | `wrong number of arguments` | Arguments ≠ paràmetres |
> | `incompatible types` | El tipus no encaixa (ordre inclòs) |
> | `static context` | Cridar a algo de classe des de `main` (detalls en U10) |
> | Error de lògica | Compila i executa, però ment |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-funciones) · **Anterior:** [05 · Àmbit de variables](/ApuntesProgramacion/va/05-funciones/05-ambito-variables) · **Següent:** [07 · Divideix el problema](/ApuntesProgramacion/va/05-funciones/07-divide-problema)
