---
title: "04 · return: l'eixida"
description: "Tornar resultats com una màquina ben educada: tipus que coincideixen, camins que tanquen i el pecat d'imprimir quan has de tornar 📤"
---

<p><small>Tornar resultats com una màquina ben educada: tipus que coincideixen, camins que tanquen i el pecat d'imprimir quan has de tornar 📤</small></p>

> 🗺️ **Estàs en:** 🔧 **U05 · Funcions i mètodes** → 04 · return: l'eixida

---

## 📬 La idea en una frase

> **Un mètode amb `return` calcula i lliura un valor a qui l'ha cridat; un mètode `void` només executa alguna cosa i s'calla. La firma promet el tipus i `return` compleix la promesa.**

---

## 📤 Dos oficis, dos firmes

Fins ara els teus mètodes **feien** coses (imprimien). Ara aniran a **entregar** coses:

```java
public static int sumar(int a, int b) {
    return a + b;
}
//     ^^^
//     la firma diu "torne int" i return ho compleix
```

Qui crida rep el valor **i pot usar-lo**:

```java
int total = sumar(3, 4);          // 7 en una variable
System.out.println(sumar(3, 4));  // 7 directe al println
int doble = sumar(sumar(1, 2), 3); // tornat com a argument: 6
```

La regla d'or: **el tipus del `return` ha d'encaixar amb el tipus de la firma**. `int` amb `int`, `double` amb `double`, `String` amb `String`. Si la firma diu `double` i tornes `7`, Java ho accepta (l'enter s'amplia). Si diu `String` i tornes `7`, és un mur: `incompatible types: int cannot be converted to String`.

### `void`: la firma que no promet res

```java
public static void imprimirResultado(int x) {
    System.out.println("Resultat: " + x);
    // sense return (o amb un return; buit opcional)
}
```

`void` = "no torne res, només faig el meu treball". Com tries?

| Usa **retorn** quan... | Usa **void** quan... |
|---|---|
| Un altre mètode necessita el resultat | Només s'ha de produir un efecte (imprimir, guardar, pintar) |
| La tasca és "calcular" | La tasca és "fer" |
| Vols provar el valor per separat | El resultat ja es veu en pantalla o en fitxer |

> 💡 **Consell:** si el teu mètode es diu `calcular...`, `get...`, `es...` o `devolver...`, gairebé segur que ha de **tornar**. Si es diu `imprimir...`, `mostrar...` o `guardar...`, gairebé segur que és `void`. El nom del mètode i la seua firma conten la mateixa història.

---

## 🛤️ `return` talla l'execució

El primer `return` que s'executa **acaba el mètode a l'instant**: el que hi haja davall no s'executa mai.

```java
public static String clasificar(int nota) {
    if (nota >= 5) {
        return "Aprovat";
    }
    return "Suspès";   // només s'assolix si la línia anterior no s'executa
}
```

Dos `return` en el mateix mètode són legals (i molt útils), sempre que **tots els camins possibles acaben en un**:

```java
public static int maximo(int a, int b) {
    if (a > b) {
        return a;
    } else {
        return b;   // tots els camins tanquen ✓
    }
}
```

Si un camí arriba al final sense `return`:

```java
public static int peligro(int a) {
    if (a > 0) {
        return a;
    }
    // ¿i si a <= 0?  →  error: missing return statement
}
```

CONRAD es posa roig: `error: missing return statement`. Java no endevina: **exigeix** que la firma no puga quedar sense complir.

> ⚠️ **Advertència:** codi després d'un `return` incondicional no s'executa mai (`unreachable statement` és la seua forma de protesta). I si una branca torna `int` i una altra `double`... la firma només admet un: decideix.

---

## 🎭 El pecat d'imprimir quan has de tornar

L'error conceptual més comú de la unitat:

```java
// ❌ Imprimeix la mitjana... però qui crida no s'assabenta
public static void media(int a, int b) {
    System.out.println((a + b) / 2.0);
}

// ✅ Torna la mitjana; qui crida decideix què fer
public static double media(int a, int b) {
    return (a + b) / 2.0;
}
```

Amb la versió `void`, `main` no pot guardar la mitjana, comparar-la ni reutilitzar-la: es va imprimir i va desaparèixer. Amb `return`, el valor entra en el programa com a dades de veritat.

Pràctica: **`System.out.println` és per a `main` (o per als mètodes l'ofici dels quals siga mostrar), no per als mètodes que calculen**. Qui calcula calcula; qui decideix imprimeix.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** `return true;` / `return false;` en un mètode que comença per `es`, `te` o `pot` és el patró més rendible del llenguatge: converteix preguntes en booleanes reutilitzables.

**Exercici: l'endevinalla del retorn**

```java
public static int truco(int x) {
    if (x > 10) {
        return x * 2;
    } else if (x > 5) {
        return x + 3;
    }
    return 1;
}
```

**Què torna `truco(7)` i `truco(12)`?**

- (A) `10` i `24`
- (B) `14` i `24`
- (C) `10` i `12`
- (D) Compila, però `truco(7)` no torna res

<details>
<summary>🔄 Solució</summary>

La **A**: `10` i `24`. `truco(7)` no compleix `x > 10`, cau en `x > 5` i torna `7 + 3 = 10`. `truco(12)` compleix la primera branca i torna `12 * 2 = 24`. Traça el camí línia a línia sense donar-te les ganes: això és exactament el que fa el truc.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. En `public static boolean esPar(int n)`, quines dues línies ha de tindre com a mínim el cos?
2. Quin error dona un mètode `int` sense `return` en alguns camins?
3. Quina és la diferència entre `void imprimir(int x)` i `int devolver(int x)` per a qui crida?
4. Es pot fer `return` sense valor en un mètode `int`?

<details>
<summary>🔄 Respostes</summary>

1. Almenys un `return` amb booleà: `return n % 2 == 0;` (pot tindre més branques amb `if`).
2. `missing return statement` (error de compilació).
3. `void` només produeix un efecte (imprimir); `int` entrega un valor que qui crida pot guardar, comparar o reutilitzar.
4. No. `return;` (buit) només val en mètodes `void`; un `int` necessita `return expressió;`.

</details>

---

## ✅ Resum en 3 frases

1. La firma promet un tipus de retorn i cada camí del cos el compleix amb `return expressió;`.
2. `return` **acaba el mètode** en executar-se; si algun camí arriba al final sense `return` (i no és `void`), no compila.
3. Els mètodes **calculen** tornant; imprimir és ofici de qui decideix (normalment `main`).

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `return` | Entrega un valor i tanca el mètode |
> | `void` | Firma sense retorn: només executa |
> | `missing return statement` | Algun camí no compleix la firma |
> | Predicat | Mètode que torna `boolean` (`esPar`) |
> | Ampliació | `int` cap en `double` en tornar |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-funciones) · **Anterior:** [03 · Paràmetres: l'entrada](/ApuntesProgramacion/va/05-funciones/03-parametros) · **Següent:** [05 · Àmbit de variables](/ApuntesProgramacion/va/05-funciones/05-ambito-variables)
