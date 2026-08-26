---
title: "07 — Sobrecàrrega i pas per valor"
description: "Diversos mètodes amb el mateix nom i què es copia de veritat quan crides (pista: les referències t'enganyen) 🎭"
---

<p><small>Diversos mètodes amb el mateix nom i què es copia de veritat quan crides (pista: les referències t'enganyen) 🎭</small></p>

> 🗺️ **Estàs en:** 🏗️ **U06 · POO: Classes i Objectes** → 07 · Sobrecàrrega i pas per valor

---

## 📬 La idea en una frase

> **La sobrecàrrega permet que diversos mètodes compartisquen nom si els seus paràmetres diferixen, i en Java tot es passa per valor: els primitius es copien, i de les referències es copia l'adreça (no l'objecte).**

Dos conceptes que pareixen d'un altre planeta i que són pa de cada dia en el codi real. El primer et dona flexibilitat (un mètode `sumar` que funciona amb `int`, amb `double` i amb tres nombres). El segon t'explica per què el teu mètode no aconseguix "canviar" un `int` que li passes... però sí modifica un objecte. Anem a per ells.

---

## 🎭 Sobrecàrrega: el mateix nom, altres mans

**Sobrecarregar** un mètode és declarar diversos mètodes amb el **mateix nom** però amb **distinta llista de paràmetres** (nombre, tipus u ordre). Java decidix quin usar mirant els arguments de la crida:

```java
public class Calculadora {
    int sumar(int a, int b) {
        return a + b;
    }

    int sumar(int a, int b, int c) {
        return a + b + c;
    }

    double sumar(double a, double b) {
        return a + b;
    }
}
```

```java
Calculadora calc = new Calculadora();
calc.sumar(2, 3);          // usa el de (int, int) → 5
calc.sumar(2, 3, 4);       // usa el de (int, int, int) → 9
calc.sumar(2.5, 3.5);      // usa el de (double, double) → 6.0
```

> ⚠️ **Advertència:** el que **no** pot canviar per a distingir mètodes és només el tipus de retorn. `int sumar(int, int)` i `double sumar(int, int)` no poden coexistir: Java no sap quin vols si només mires `sumar(2, 3)`. El desempat es fa amb la **firma** (nom + paràmetres), no amb el que retornen.

Els **constructors** també es sobrecarreguen, i de fet ja ho vas vore en el punt 4:

```java
public class Persona {
    String nombre;
    int edad;

    public Persona() {
        this("Desconocido", 0);
    }

    public Persona(String nombre) {
        this(nombre, 0);
    }

    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }
}
```

Tres maneres de nàixer: sense dades, només amb nom, o amb tot. El `this(...)` encadenat evita repetir la inicialització.

---

## 📦 Pas per valor: Java només sap copiar

Quan crides un mètode, Java fa una còpia de cada argument i l'hi passa. Això es diu **pas per valor**: el mètode rep **còpies**, no els originals.

**Amb primitius** queda clar:

```java
void duplicar(int x) {
    x = x * 2;   // canvia la còpia, no l'original
}

int numero = 21;
duplicar(numero);
System.out.println(numero);   // 21. La còpia es va duplicar, l'original ni se'n va assabentar
```

**Amb referències** la cosa es complica. La variable guarda una adreça; es copia **l'adreça**, no l'objecte:

```java
void subirSaldo(Cuenta c) {
    c.saldo += 100;   // l'objecte al qual apunta c SÍ canvia
}

Cuenta miCuenta = new Cuenta();
miCuenta.saldo = 50;
subirSaldo(miCuenta);
System.out.println(miCuenta.saldo);   // 150 ✅ (l'objecte va canviar)
```

La còpia i l'original guarden **la mateixa adreça**, així que tots dos apunten al mateix objecte: modificar l'objecte es nota fora.

> 📝 **Nota:** la trampa és esta: pots canviar *el contingut* de l'objecte, però **no pots** fer que la variable original apunte a un altre objecte. Si dins del mètode fas `c = new Cuenta()`, només la còpia canvia d'adreça; l'original continua apuntant al seu compte. És com donar-li a algú les claus de ta casa: pot redecorar la casa, però no pot canviar l'adreça de ta casa.

---

## 📊 El resum que et salva en l'examen

| Què li passes | Què rep el mètode | Es nota fora? |
|---|---|---|
| Primitiu (`int`, `double`...) | Una **còpia del valor** | ❌ No |
| Referència | Una **còpia de l'adreça** | ✅ Sí (si modifiques l'objecte) / ❌ No (si reassignes la referència) |

> 💡 **Tip:** memoritza-ho així: *Java copia sempre, però copiar una adreça et permet arribar al mateix lloc.* Els primitius mai no canvien fora; els objectes canvien si els toques, però no pots canviar-los el "punt de mira" des de dins.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** per a traçar una crida, dibuixa les caixes dels arguments originals i les caixes de les còpies del mètode. Després seguix qui apunta a qui.

**Exercici: la gran confusió**

Sense executar, què imprimix este programa?

```java
public class Caja {
    int valor;
}

public class Main {
    static void cambiar(Caja c, int n) {
        c.valor = 99;
        n = 7;
        c = new Caja();
        c.valor = 1;
    }

    public static void main(String[] args) {
        Caja miCaja = new Caja();
        miCaja.valor = 5;
        int numero = 5;

        cambiar(miCaja, numero);

        System.out.println(miCaja.valor);
        System.out.println(numero);
    }
}
```

<details>
<summary>🔄 Solució</summary>

Imprimix **`99`** i **`5`**.

- `c.valor = 99` modifica l'objecte compartit → l'original se n'assabenta → **99**.
- `n = 7` canvia la còpia del primitiu → l'original continua en **5**.
- `c = new Caja(); c.valor = 1;` canvia a què apunta *la còpia* `c`, però `miCaja` continua apuntant a la caixa de 99. La reassignació no ix del mètode.

Tres instruccions, tres comportaments distints. Este exercici té l'examen escrit al front.

</details>

---

## ❓ No Hi Ha Preguntes Tontes!

> **Q:** Per què no puc sobrecarregar canviant només el tipus de retorn? Semblaria lògic.
>
> **A:** Perquè Java tria el mètode mirant els **arguments** de la crida. Si dos mètodes tenen els mateixos paràmetres però distint retorn, `calc.sumar(2, 3)` seria ambigu: quin vol el que crida? Java odia l'ambigüitat més que als dilluns.

> **Q:** Els constructors sobrecarregats "hereten" alguna cosa entre ells?
>
> **A:** No hereten, però s'**encadenen** amb `this(...)`. El constructor curt crida el llarg, que fa el treball pesat. Així el codi d'inicialització s'escriu una sola vegada. Quan veges un constructor de tres línies que només fa `this(...)`, és eixa tècnica en acció.

> **Q:** Existix el "pas per referència" en Java?
>
> **A:** No. Java **només** té pas per valor. El que passa és que amb referències es copia l'adreça, i això *pareix* pas per referència. Els puristes ho diuen "pas per valor de la referència". En l'examen, digues que Java és sempre pas per valor.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què és sobrecarregar un mètode?
2. Què NO pot canviar per a distingir dos mètodes amb el mateix nom?
3. En Java el pas és per valor o per referència?
4. Si un mètode rep un objecte i el modifica, es nota fora?

<details>
<summary>🔄 Respostes</summary>

1. Declarar diversos mètodes amb el **mateix nom** però distinta **llista de paràmetres**.
2. El **tipus de retorn**: només la firma (nom + paràmetres) desempata.
3. **Pas per valor** sempre: es copien els valors; amb objectes es copia l'adreça.
4. **Sí**, perquè la còpia de la referència apunta al mateix objecte.

</details>

---

## ✅ Resum en 3 frases

1. La **sobrecàrrega** permet diversos mètodes amb el mateix nom i distints paràmetres; el tipus de retorn no servix per a distingir-los.
2. Java és **pas per valor**: els primitius es copien i mai no canvien fora; les referències copien l'adreça, així que pots modificar l'objecte però no reassignar-lo des de dins.
3. Els **constructors** també es sobrecarreguen i s'encadenen amb `this(...)` per a no repetir codi.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Sobrecàrrega | Diversos mètodes amb el mateix nom i distinta firma |
> | Firma | Nom + llista de paràmetres |
> | Pas per valor | Es passen còpies, mai els originals |
> | Còpia de referència | Es copia l'adreça, no l'objecte |
> | Encadenar constructors | Un constructor crida un altre amb `this(...)` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/06-poo-clases-objetos) · **Anterior:** [06 · Referències, null i memòria](/ApuntesProgramacion/va/06-poo-clases-objetos/06-referencias-memoria) · **Següent:** [08 · Be the Code: dissenya la teua classe](/ApuntesProgramacion/va/06-poo-clases-objetos/08-be-the-code)