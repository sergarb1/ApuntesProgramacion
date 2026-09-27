---
title: "09 · Repàs interactiu"
description: "Fireside, CONRAD, crucigrama i laboratori: la festa de comiat de Funcions i mètodes 🎉"
---

<p><small>Fireside, CONRAD, crucigrama i laboratori: la festa de comiat de Funcions i mètodes 🎉</small></p>

> 🗺️ **Estàs en:** 🔧 **U05 · Funcions i mètodes** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **Este punt no ensenya res nou: destrossa l'après amb preguntes, errors aliens i un laboratori fins que ho tingues a les mans.**

---

## ⭐ Sé el Código, my friend...

**Pregunta 1 — la firma**

```java
public static double promedio(int a, int b, int c) {
    return (a + b + c) / 3;
}
```

**Què li passa a este mètode?**

- (A) Res: compila i torna bé
- (B) Compila, però torna un `int` amb la part decimal perduda
- (C) No compila: `double` no pot rebre la suma de tres `int`

> <details>
> <summary>🔄 Solució</summary>
>
> La **B**. `(a + b + c)` és `int` i `/ 3` també: divisió entera (`7` en lloc de `7,33...`). Java **no** canvia a `double` perquè la firma ho diga. Arregla: `return (a + b + c) / 3.0;`.
>
> </details>

**Pregunta 2 — l'ordre**

```java
static void pintar(String texto, int veces) { ... }
pintar(3, "OK");
```

**Què passa?**

- (A) Imprimeix `OK` tres voltes
- (B) Imprimeix `3` tres voltes
- (C) No compila: tipus al revés

> <details>
> <summary>🔄 Solució</summary>
>
> La **C**. El primer paràmetre és `String` i arriba un `int`: `incompatible types`. Els arguments viatgen en el mateix ordre que els paràmetres, sense excepcions.
>
> </details>

**Pregunta 3 — el pecat**

```java
static void doble(int n) {
    System.out.println(n * 2);
}
int r = doble(5);
```

Tria amb saviesa:

1. **`10`** — ¡correcte! ... no: `void` no es guarda en res ✗
2. **No compila** — `main` intenta guardar un `void` en un `int` ✓
3. **`0`** — Java ompli amb zeros el que falta ✗ (això només passa en arrays)
4. **Imprimeix `10` i `r` queda en `0`** — sona lògic, però `void` no és un valor ✗

> <details>
> <summary>🔄 Solució</summary>
>
> La **2**: la línia `int r = doble(5);` dona `incompatible types: void cannot be converted to int`. El mètode `void` no produïx valor: si vols el doble en una variable, que el **torne** (`static int doble(...)` amb `return n * 2;`) i el `println` el poses tu on faça falta.
>
> </details>

---

## 🔥 Fireside Chat: `void` vs `return`

> *Dos veterans del recorregut discutixen junt a la màquina de cafè.*

**`void`:** - Jo faig i m'assabente. Imprimir, guardar, borrar: efectes purs. El món em veu canviar i no em necessita tornar res.

**`return`:** - I per això quan et necessiten per a **calcular**, es perden. Em guarden en variables, em comparen, em passen com a argument a altres deu mètodes. Són dades de veritat.

**`void`:** - Els efectes també són dades... bé, efectes.

**`return`:** - ¿I què passa quan un novell et usa a mi però et posa `System.out.println` dins? Resultat: ningú rep el valor, s'imprimeix en l'instant exacte en que a vegades **no toca**, i qui crida no pot fer res amb ell.

**`void`:** - Això no és culpa meua, és culpa de barrejar els oficis.

**`return`:** - Exacte. Calcules → tornes. Decideixes → imprimix. Si el teu mètode comença per `calcular`, `obtener` o `es`, vine a ma casa.

**`void`:** - Tractat. Jo per a `imprimir` i `guardar`; tu per a tot el que un altre mètode vaja a necessitar. Que `main` siga l'únic que parle en veu alta.

> La lliçó: **`void` per a efectes, `return` per a valors.** Qui calcula torna; qui decideix imprimeix.

---

## 🕵️ Qui soc?

Endevina quin concepte de la unitat soc:

1. **Soc la variable que un mètode rep en ser cridat, declarada en la seua firma.**
2. **Soc el valor que arriba en la crida, en lloc exacte on polses el gatell.**
3. **Soc la regió on una variable existeix: de la firma a la clau de tancament.**
4. **Soc el final del mètode: tanque l'execució i entregue el valor promés.**
5. **Soc la firma completa: nom + tipus dels paràmetres, la meua targeta de visita.**
6. **Soc un mètode que torna `true` o `false`: `esPar`, `tieneSuspensa`, `todoPositivo`.**

<details>
<summary>🔄 Respostes</summary>

1. **El paràmetre** — viu en la declaració i s'usa com a variable dins del mètode.
2. **L'argument** — el paràmetre és la cadira; l'argument és qui se senta.
3. **L'àmbit (scope)** — fora d'ell, `cannot find symbol`.
4. **`return`** — i si algun camí d'una firma amb retorn no l'alcança: `missing return statement`.
5. **La firma del mètode** — canvien els noms de variables, no la firma.
6. **El predicat** — el patró `boolean` que decora tota la POO futura.

</details>

---

## 🤖 CONRAD VS EL MÓN: "El main que es va fer el llist"

> *CONRAD, el nostre compilador mala llet, ha trobat una nota en la safata d'errors.*

**CONRAD:** - ¡UNA ALTRA VOLTA! Un alumne em diu: *CONRAD, vull cridar al meu mètode des de `main`*. I jo: *¿i el `static`?* *Doncs... el vaig llevar, que em paregia repetir.* SENSE `static` NO HI HA `main`! `non-static method cannot be referenced from a static context`. El `main` és estàtic de naixement; fins que no aprengues a crear objectes (U09, U10), tots els teus mètodes porten `static`. No és decoració, és l'entrada obligatòria.

*I el clàssic del retorn:* *el meu mètode calcula bé però em dona `missing return statement`.* ¿I els camins? *¿Camins?* És clar! Si el `if` torna en una branca i l'`else` no, hi ha un sender que arriba al final amb la firma sense complir. Java no endevina la teua intenció: **tots els camins tanquen**.

*I el de la variable fantasma:* *en `main` em diu `cannot find symbol: variable total`... però la vaig declarar en `sumar()`.* PERQUÈ ÉS DE `sumar()`! Les locals moren amb el seu mètode. No hi ha ventanetes laterals entre cases: només arguments que entren i `return` que ix.

*I el que m'empipa:* criden `saludar()`... **sense `static`**... **sense `()`**... des d'un altre mètode... ¡LLEGIU EL MISSATGE ENTER, QUE LA PRIMERA LÍNIA DÍA QUÈ I LA SEGONA ON!

> CONRAD afegix: si el teu error desapareix en canviar **una lletra**, era un typo; si desapareix en afegir `()`, era la crida; si desapareix en afegir `static`, era el context. El compilador et dona classes gratis: llig-les.

---

## 🎮 El joc de les decisions

Tria la resposta correcta per a cada decisió (respostes al final):

1. Quina és la diferència real entre paràmetre i argument?
   - a) Cap, són sinònims   b) Declaració vs crida   c) Un és de `int` i l'altre de `String`
2. Què imprimeix `System.out.println(truco(7));` amb `truco` del punt 4?
   - a) `10`   b) `14`   c) `12`
3. Poden `a()` i `b()` tindre totes dues una variable `x`?
   - a) No: xoca   b) Sí, són cases distintes   c) Només si són `static`
4. Quin error dona `int r = suma(1, 2);` si `suma(int a, int b, int c)`?
   - a) `wrong number of arguments`   b) Res, el tercer queda a 0   c) `missing return statement`
5. Quan uses `void`?
   - a) Quan no tornes res útil, només fas un efecte   b) Quan no saps què tornar   c) Quan hi ha un sol paràmetre
6. Què fa `return;` dins d'un mètode `int`?
   - a) Torna 0   b) No compila   c) Torna `null`

<details>
<summary>🔄 Solucions</summary>

1. **b)** — paràmetre en la declaració, argument en la crida.
2. **a)** — `10`: cau en la branca `x > 5` i torna `7 + 3`.
3. **b)** — cada mètode té el seu propi àmbit; dos `x` diferents.
4. **a)** — la firma demana 3 arguments i n'arriben 2.
5. **a)** — `void` = només efecte (imprimir, guardar); no hi ha valor que entregar.
6. **b)** — `return;` (buit) només és legal en `void`.

</details>

---

## ⚡ Laboratori de tortura: el programa sense nom

> **Duració estimada:** 30 minuts
> **Eina:** el teu IDE i un fitxer nou

**L'escenari:** copia este programa i fes que imprimeixca `Mitjana: 7.5`. Té **2 errors de compilació** i **1 error de lògica** que només es nota en l'eixida.

```java
public class Tortura {
    public static void main(String[] args) {
        int r = media(6, 7, 8, 9);
        System.out.println("Mitjana: " + r);
    }

    public static int media(int a, int b, int c, int d) {
        double m = (a + b + c + d) / 4;
        return m;
    }
}
```

**La teua tasca:** que compile i que imprimeixca `Mitjana: 7.5`. Si imprimeix `7`, has trobat la lògica; si no compila, són les dos de compilació.

**Pistes per a quan te frustres (no abans):**

1. Quants paràmetres declara `media` i quants arguments li passes? *si quadra, continua.*
   <details><summary>¿I si continue aturat?</summary>4 i 4: això està bé. Mira dins del cos: quin tipus és `m` i quin tipus promet `return`?</details>
2. Què diu exactament l'error de la línia `return m;`?
   <details><summary>¿I si continue aturat?</summary>`incompatible types: double cannot be converted to int`. Una via: canviar la firma a `static double media(...)` i `double r` en `main`. Una altra: dividir amb `/ 4.0` i castear… però llavors perdries els decimals: la via bona és la primera.</details>
3. ¿Ja compila, però imprimeix `Mitjana: 7`?
   <details><summary>¿I si continue aturat?</summary>La divisió és entera: `(6+7+8+9)/4 = 30/4 = 7`. Amb la firma `double` i `/ 4.0` ix `7.5` de veritat.</details>

<details>
<summary>🔄 Solució completa</summary>

```java
public class Tortura {
    public static void main(String[] args) {
        double r = media(6, 7, 8, 9);
        System.out.println("Mitjana: " + r);
    }

    public static double media(int a, int b, int c, int d) {
        return (a + b + c + d) / 4.0;
    }
}
```

Errors: (1) `double m` no cap en un `return` d'`int` → firma `double`; (2) `int r = ...` no rep `double` → `double r`; (3) lògica: divisió entera → `4.0`.

</details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-lo |
|---|---|
| 🗣️ **El Traductor** | Explicar en veu alta la diferència entre paràmetre i argument sense dubtar |
| 📤 **El Tornador** | Escriure un predicat (`esPar`) que tanque tots els seus camins a la primera |
| 🏠 **El Paleta d'Àmbits** | Diagnosticar un `cannot find symbol` d'un cop d'ull (typo o fora de casa) |
| 🧯 **El Bomber** | Arreglar els 7 entrebancs del punt 6 sense mirar la taula |
| 🧱 **El Director d'Orquestra** | Trossejar un `main` de 30 línies en 4 mètodes amb eixida idèntica |
| 🛠️ **El Refactoritzador** | Completar el Be the Code amb l'eixida byte a byte igual que a l'inici |

---

## 🤔 Atreveix-te a pensar

1. **Sense executar:** què imprimeix?

```java
public class Misterio {
    static int f(int x) {
        if (x > 2) {
            return x + 1;
        }
        return f(x + 1);
    }

    public static void main(String[] args) {
        System.out.println(f(0));
    }
}
```

<details>
<summary>🔄 Resposta</summary>

**`4`.** Cadena de crides: `f(0)` → `f(1)` → `f(2)` → `f(3)` → `3 > 2` és cert → `3 + 1 = 4`. Fixa't en que `2 > 2` és fals, així que continua encadenant. Compte: estàs mirant **recursió**, el plat fort de la U08.

</details>

2. Per què diem que `main` ha de llegir-se "com un resum" i no com una recepta?

3. Si tots els teus mètodes imprimeixen, què li falta al teu programa per a ser reutilitzable?

4. Se't ocurren un cas legítim en què un mètode `void` cride a un altre `void` i el programa complet tinga sentit sense un sol `return` amb valor?

---

## 🧩 Crucigrama de bits

```
Horitzontal:
1. El que declara el mètode: tipus + nom de cada entrada (10 lletres)
3. Mètode que torna true o false (9 lletres)
5. Tipus de dada sense valor: "____ media(3, 4);" (4 lletres)
6. On viu una variable: el seu _______ (6 lletres)

Vertical:
2. El que passa en la crida: "sumar(3, 4)" són ____ (9 lletres)
4. Promesa de la firma que compleix return (7 lletres)
7. Paraula que tanca el mètode i entrega (6 lletres)
```

<details>
<summary>🔄 Solucions</summary>

**Horitzontal:** 1. PARÀMETRES · 3. PREDICAT · 5. VOID · 6. ÀMBIT
**Vertical:** 2. ARGUMENTS · 4. FIRMA · 7. RETURN

</details>

---

## 💬 Preguntes d'entrevista de treball

> Preguntes reals que et farien per a programador Java junior.

1. **"Explíca'm, com si jo fora ta àvia, la diferència entre un paràmetre i un argument."**
2. **"Escriu un mètode que torne `true` si tots els nombres d'una llista són positius. Per què `boolean` i no un `println`?"**
3. **"Què és l'àmbit d'una variable i per què existeix?"**
4. **"El teu mètode compila però el resultat no arriba a `main`. Per què pot ser?"**
5. **"Quan faries un mètode `void` i quan amb retorn? Dona'm un exemple de cada un."**
6. **"Refactoritza un `main` de 40 línies. Per on comences i com comproves que no l'has trencat?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **¿Per què Java m'obliga a posar `static` si jo només vull cridar al meu mètode?**

Perquè `main` és estàtic: s'executa **sense** crear cap objecte. Un mètode no estàtic pertany a un objecte, i no hi ha objecte al qual pertànyer. De moment tots els teus mètodes són de classe (`static`); quan cregues el teu primer objecte en la U09 i veges `static` en detall en la U10, això farà *clic* i no tornaràs a dubtar.

---

> ❓ **Puc cridar a un mètode des d'un altre mètode que estiga damunt o baix?**

Sí, sense restriccions d'ordre: tots es coneixen dins d'una classe. `main` pot cridar a `calcularMedia` encara que estiga escrita 50 línies més avall.

---

> ❓ **Si passe `x` per paràmetre, per què el meu mètode no pot canviar el meu `x`?**

Perquè rep una **còpia** (per a tipus primitius). És un disseny deliberat: els mètodes no reescriven res de ningú d'amagades; si hi ha un resultat nou, el **tornen** amb `return`. Amb els arrays la cosa canvia (es passa la referència) i ho veuràs en la U06.

---

> ❓ **Un mètode pot cridar a si mateix?**

Pot, i se'n diu **recursió**. És potent i perillós: si no arriba mai al seu cas base, s'acaba la pila i explota. Toca en la U08, Algorítmica II, amb guants.

---

## 🎬 Postcrèdits

El novell acaba de trossejar el seu informe de notes: `main` té quatre línies, cada verb viu al seu lloc i l'eixida és idèntica a la del matí. S'acosta CONRAD, el compilador mala llet, amb la seua tassa fumejant.

**CONRAD:** - Vaja. Quatre mètodes, zero bucles en `main` i ni un sol `println` on no tocava. ¿Segur que ets el mateix que va començar la unitat amb tot en 40 línies seguides?

**Novell:** - *somriu* Vaig començar copiant i enganxant, i he acabat amb un programa que es llegeix com una llista de la compra. ¿I ara què?

**CONRAD:** - *beu un glop* Ara aquestes dades volen créixer: cinc notes s'han convertit en cent, i guardar-les en variables soltes és un infern. Necessites un aparcament de veritat: arrays, índexs i `length`. Un altre plat, i ve just després.

El novell guarda el seu projecte, tanca l'IDE i sent que ja no escriu blocs de codi: **escriu plans amb noms**.

**PRÒXIMAMENT EN U06:** Arrays. L'aparcament de dades del mateix tipus: crear, omplir, recórrer i no eixir-te mai de l'últim índex. 🅿️

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-funciones) · **Anterior:** [08 · Be the Code](/ApuntesProgramacion/va/05-funciones/08-be-the-code) · **Següent:** **[U06 · Arrays](/ApuntesProgramacion/va/06-arrays)**
