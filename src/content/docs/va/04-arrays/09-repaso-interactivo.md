---
title: "09 — Repàs interactiu: l'aparcament a examen"
description: "El tancament pràctic de la unitat, amb recorreguts, cerques i un array que no funcionarà 😈"
---

<p><small>El tancament pràctic de la unitat, amb recorreguts, cerques i un array que no funcionarà 😈</small></p>

> 🗺️ **Estàs en:** 🅿️ **U04 · Arrays** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaben de donar-te este programa per a executar:*

```java
public class Misterio {
    public static void main(String[] args) {
        int[] datos = {3, 1, 4, 1, 5, 9};
        int total = 0;

        for (int i = 0; i < datos.length; i += 2) {
            total += datos[i];
        }

        System.out.println(total);
    }
}
```

**Què imprimeixes per pantalla? Tria saviament:**

1. **`23`** → Sumes tots els elements, però el bucle va de dos en dos. ❌
2. **`12`** → ✅ Correcte! El bucle salta de 2 en 2: `i = 0, 2, 4`. Suma `datos[0] + datos[2] + datos[4]` = `3 + 4 + 5` = **12**. La plaça 1 (l'1) i la 3 (l'1) es queden sense visitar.
3. **`13`** → Sumes els índexs en lloc dels valors. ❌
4. **`9`** → Només et quedes amb `datos[4]`, l'últim del salt. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **2**. `i += 2` recorre les posicions parells 0, 2 i 4. Els seus valors són 3, 4 i 5. `3 + 4 + 5 = 12`. El `for` amb índex et dona el control del pas: una cosa que el `for-each` no pot fer.
>
> </details>

---

## 🔥 Fireside Chat: for clàssic vs for-each

> *Dos veterans del recorregut discuteixen al costat de la màquina de cafè.*

**For-each:** — Jo soc el modern. "Per a cada X en Y": curt, net, impossible equivocar-se amb l'índex. Qui vol comptar places a mà?

**For clàssic:** — I quan em necessites a mi? Quan cal **modificar**, quan cal **saber la posició**, quan cal anar **cap arrere** o **de dos en dos**. Eixes quatre coses són el 80% dels exercicis del curs, i les faig totes. Tu, en canvi, lliges i et calles.

**For-each:** — Llegir és el que es fa quasi sempre: sumar, comptar, imprimir. El 80% de les voltes no et necessite, i si t'use sense necessitar-te, arriben els errors: el `<=`, el començar en 1, l'oblidar el `++`...

**For clàssic:** — Això és perquè no m'uses bé. Amb mi tens el control total. Tu ets... la variant peresosa.

**For-each:** — La variant **segura**. I no em digues peresosa: digues-me "sense índex, sense excuses".

**For clàssic:** — Val, treva. Tu per a llegir sense posicions; jo per a tot lo altre. Tracte?

**For-each:** — Tracte. Però que sàpies que en el bucle de la mitjana et guanye fins i tot amb els ulls tancats.

> La lliçó: **for-each** si només lliges i no t'importa la posició; **for amb índex** si modifiques, busques posicions o recorres de forma especial. El context decidix, no la moda.

---

## 🕵️ Qui soc?

Endevina quin concepte de la unitat soc:

1. **Soc un aparcament de grandària fixa: guarde moltes dades del mateix tipus sota un sol nom.**
2. **Soc el número de cada plaça, i comence en 0, per a confusió general.**
3. **Soc l'excepció favorita del novell: em llancen quan demanen la plaça que no existeix.**
4. **Soc el bucle de només lectura: "per a cada X en Y", sense índex i sense presses.**
5. **Soc la classe utilitària amb `toString`, `sort`, `binarySearch`, `copyOf` i `fill`.**
6. **Soc l'atribut que diu quantes places hi ha, sense parèntesis, per a no confondre'm amb els `String`.**

<details>
<summary>🔄 Respostes</summary>

1. **L'array** — aparcament de dades del mateix tipus, grandària fixa.
2. **L'índex** — número de la plaça; les vàlides van de 0 a `length - 1`.
3. **La `ArrayIndexOutOfBoundsException`** — en demanar la plaça `length` o més.
4. **El `for-each`** — només llig, no modifica.
5. **La classe `Arrays`** — la navalla suïssa dels arrays.
6. **`length`** — atribut de l'array, sense parèntesis (els `String` usen `length()`).

</details>

---

## 🤬 CONRAD VS EL MÓN: "L'array que no para"

> *CONRAD, el nostre compilador rondinaire, ha trobat una nota en la safata d'errors.*

**CONRAD:** — ¡ALTRES VEGADES! Un alumne em diu: *CONRAD, el meu bucle eix de l'array*. I jo: amb quina condició l'has escrit? *Doncs... `i <= notas.length`.* ¡¡PERÒ SI AIXÒ ÉS EL PRIMER QUE S'APRÉN EN ESTA UNITAT!! L'últim índex és `length - 1`. `<=` vol dir que demanaràs la plaça `length`, que no existeix. És com cridar a la planta 5 d'un aparcament de 5 plantes (que van de la 0 a la 4): no hi és, i el porter et llança la `ArrayIndexOutOfBoundsException`.

*I després el clàssic del for-each:* *el meu array no es modifica*. I com el recorres? *Amb for-each.* ¡CLAR! El for-each és un robot que LIG les matrícules. No repinta cotxes. Si vols canviar valors, índex i claudàtors: `notas[i] = notas[i] + 1;`. Quantes voltes ho he de dir?

*I el dels String:* *compare dos noms i no em dona igual*. Amb què? *Amb `==`.* ¿QUANTES VEGADES? Amb `String` s'usa `.equals()`. `==` compara referències: són el MATEIX objecte? Encara que tinguen el mateix text, si són dos objectes diferents, `==` diu false. ¡LLIG-T'HO EN EL PUNT 6, PER FAVOR!

**La lliçó:** els tres mals del novell amb arrays tenen nom: **`<=` fora de rang**, **for-each que no modifica** i **`==` que no compara text**. Abans de plorar sobre el teclat, comprova eixes tres coses. El 90% dels "arrays rebel·les" s'arreglen amb una ullada.

---

## 🎮 El joc de les decisions

Tria la resposta correcta per a cada decisió (respostes al final):

1. Quin és l'últim índex vàlid de `int[] a = new int[8]`?
   - a) 7   b) 8   c) 9
2. Quin valor té cada plaça de `boolean[] b = new boolean[4]`?
   - a) `true`   b) `false`   c) `null`
3. Què fa `Arrays.binarySearch` sobre un array **desordenat**?
   - a) Llança una excepció   b) Torna un resultat impredictible   c) Ordena primer
4. Què imprimeix `System.out.println(a.length);` per a `int[] a = new int[10]`?
   - a) `9`   b) `10`   c) `[10]`
5. Quin bucle uses per a recórrer un array **cap arrere**?
   - a) `for-each`   b) `for` amb índex   c) qualsevol

<details>
<summary>🔄 Solucions</summary>

1. **a)** — 7. Les places van de 0 a `length - 1`, és a dir, de 0 a 7.
2. **b)** — `false`. És el valor per defecte de `boolean`.
3. **b)** — Un resultat impredictible, sense avisar. Exigix array ordenat, sempre.
4. **b)** — `10`. `length` és el nombre de places, sense parèntesis.
5. **b)** — `for (int i = a.length - 1; i >= 0; i--)`. El `for-each` només avança de principi a fi.

</details>

---

## ⚡ Laboratori de tortura: la mitjana que es resistix

> **Duració estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un arxiu nou

**L'escenari:** copia este programa i fes que funcione. Té **3 errors** que impedixen que compile o que falle en execució, i 1 error de lògica que fa que el resultat siga incorrecte quan els arregles.

```java
public class Tortura
    public static void main(String[] args) {
        int[] notas = {8, 7, 9, 6};
        int suma = 0;

        for (int i = 0; i <= notas.length; i++) {
            suma += notas[i];
        }

        double media = suma / notas.length;
        System.out.println("Media: " + media)
    }
}
```

**Falta intencionada:** un dels errors sembla correcte a simple vista perquè "es veu bé", però fa que el programa falle en execució en el moment que arranca.

**La teua tasca:** aconseguir que compile, que execute i que imprimisca `Media: 7.5`. Si el resultat no quadra, diagnostica.

**Pistes per quan et frustres (no abans):**

1. Hi ha algun `;` que falte? *no → seguix buscant.*
   <details><summary>I si seguisc atascat?</summary>Comprova també les claus `{}`: la classe necessita la seua apertura, i l'últim `System.out.println` necessita el seu `;`.</details>
2. Compila ja? *no → mira el missatge d'error.*
   <details><summary>I si seguisc atascat?</summary>La classe `Tortura` necessita `{` d'apertura.</details>
3. Compila però explota en executar? *És l'error d'índexs: el bucle arriba massa lluny.*
   <details><summary>I si seguisc atascat?</summary>`i <= notas.length` accedix a `notas[4]`, que no existeix (les vàlides són 0-3). Ha de ser `i < notas.length`.</details>
4. Executa i imprimeix `Media: 7.0`? *És l'error de lògica: la divisió entera.*
   <details><summary>Solució final</summary>

Els **3 errors** que impedixen compilar o executar:

1. Falta la `{` d'apertura de la classe després de `Tortura`.
2. Falta el `;` al final de `System.out.println("Media: " + media)`.
3. `i <= notas.length` accedix a `notas[4]` fora de l'array: `ArrayIndexOutOfBoundsException`. Ha de ser `i < notas.length`.

L'**error de lògica**: `suma / notas.length` dividix enters. `30 / 4 = 7` (es trunca), no `7.5`. Perquè la mitjana isca amb decimals cal convertir abans: `(double) suma / notas.length`.

```java
public class Tortura {
    public static void main(String[] args) {
        int[] notas = {8, 7, 9, 6};
        int suma = 0;

        for (int i = 0; i < notas.length; i++) {
            suma += notas[i];
        }

        double media = (double) suma / notas.length;
        System.out.println("Media: " + media);
    }
}
```

Eixida correcta: `Media: 7.5`. Amb la versió trencada, una volta arreglats els altres errors, la divisió entera donava `7.0`: la pista de l'error de lògica.

</details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-lo |
|---|---|
| 🏅 **L'Aparcador Cap** | Crear un array, omplir-lo i recórrer-lo sense mirar apunts |
| 🏅 **El Comptador de Places** | Explicar la diferència entre `length`, `length()` i `size()` |
| 🏅 **El Caçador de Monstres** | Trobar els 3+1 errors del Laboratori sense usar les pistes |
| 🏅 **L'Inversor** | Invertir un array al lloc amb dos punters, a la primera |
| 🏅 **El Navaller** | Usar `toString`, `sort`, `binarySearch`, `copyOf` i `fill` en un programa |
| 🏅 **El Profe de la Classe** | Aprovar amb un array d'objectes: omplir, recórrer i calcular la mitjana |

---

## 🧠 Atreveix-te a pensar

1. **Sense executar:** què imprimeix este programa?

```java
public class Misterio2 {
    public static void main(String[] args) {
        int[] datos = {4, 2, 8, 1, 6};
        int mayor = datos[0];

        for (int i = 1; i < datos.length; i++) {
            if (datos[i] > mayor) {
                mayor = datos[i];
            }
        }
        System.out.println(mayor);
    }
}
```

2. **El truc de l'índex:** què passa si en el bucle de la mitjana de `{8, 7, 9, 6}` uses `i <= notas.length - 1` en lloc de `i < notas.length`? Funciona? Per què?
3. **El doble:** `int[] a = {1, 2, 3}; int[] b = a; b[0] = 99;` quant val `a[0]` després? (Pista: és el punt 5.)
4. **Vertader o fals:** "`Arrays.sort` modifica l'array original, així que convé copiar-lo abans si no vols perdre l'ordre inicial".

<details>
<summary>💡 Solucions</summary>

1. Imprimeix **`8`**. El patró del màxim: comença amb `datos[0]` (4) i va comparant; quan arriba al 8, el guarda; l'1 i el 6 no li guanyen.
2. **Funciona.** `i <= notas.length - 1` és exactament el mateix que `i < notas.length`: en tots dos casos l'últim valor de `i` és `length - 1`. Són dues formes d'escriure el mateix, però `i < notas.length` és la que no convida a l'error.
3. **`99`.** `b = a` no copia l'array: copia la referència. `a` i `b` apunten al mateix aparcament, així que tocar per `b` es veu per `a`. Per a copiar de veritat, `Arrays.copyOf`.
4. **Vertader.** `Arrays.sort` ordena "al lloc" (modifica l'original). Si necessites conservar l'ordre inicial, copia abans amb `Arrays.copyOf`.

</details>

---

## 🧩 Crucigrama de bits

```
Horitzontal:
1. Grandària d'un array, sense parèntesis (6 lletres)
4. Mètode de la classe Arrays per a comparar contingut (5 lletres)

Vertical:
2. Valor per defecte d'un boolean en un array (5 lletres)
3. Bucle de només lectura (3 lletres + 4 lletres)
5. L'excepció que llançes en eixir-te de l'array (una sola paraula molt llarga)
```

<details>
<summary>📝 Solucions</summary>

**Horitzontal:** 1. LENGTH · 4. EQUALS
**Vertical:** 2. FALSE · 3. FOR EACH · 5. ARRAYINDEXOUTOFBOUNDSEXCEPTION

</details>

---

## 💬 Preguntes d'entrevista de treball

> Preguntes reals que et farien per a programador Java júnior.

1. **"Explícam'ho, com si jo fóra la teua àvia, què és un array."**
2. **"Inverteix este array sense crear-ne un altre. Ara digues-me quanta memòria extra necessites."**
3. **"Quina és la diferència entre `length`, `length()` i `size()`?"**
4. **"Quan usaríes `for-each` i quan un `for` amb índex?"**
5. **"Com compares dos arrays per a saber si tenen el mateix contingut?"**
6. **"Escriu el codi que torna la nota més alta d'un array."**

---

## 🤷 No hi ha preguntes tontes

> ❓ **Per què el primer índex és 0 i no 1?**

Perquè l'índex és una **distància** des del principi, no un número de plaça. La primera casa és a 0 passes de tu, no a 1. En programació, contar des de 0 evita l'off-by-one en milers de càlculs (i és una convenció heretada dels llenguatges més antics). Et pareixerà rar fins que deixe de pareixer-t'ho, i aleshores ho defendràs amb ungles i dents.

---

> ❓ **Puc usar `Arrays.sort` i `Arrays.binarySearch` en lloc d'escriure els algoritmes a mà?**

En els teus programes reals, sí: són ràpids i provats, i els veuràs per tot arreu. Però en la U05 aprendràs **com funcionen per dins** (bombolla, cerca binària...) perquè entendre la idea és el que et diferencia d'algú que només importa llibreries. I en una entrevista, et demanaran l'algoritme a mà. Primer s'aprén a sumar sense calculadora, no?

---

> ❓ **Un array pot canviar de grandària?**

No. És **grandària fixa** per sempre. Quan necessites "més places", es crea un array nou i es copia (`Arrays.copyOf`). Si això et sembla un incordi, tens raó: per això existixen les col·leccions (`ArrayList` i companyia), que creixen soles. Les veuràs en la U10, i les abraçaràs.

---

## 🎬 Postcrèdits

El programador tanca la seua llista de la compra: un array de 12 `String`, recorregut amb un for-each, ordenat amb `Arrays.sort` i imprés amb `Arrays.toString`. Tot funciona a la primera. S'acosta CONRAD, el compilador rondinaire, amb la seua tassa humejant.

**CONRAD:** — Escolta, no està mal. Crees, recorres, ordenes, busques... i a més no has eixit de l'array ni una sola vegada. Segur que ets el mateix que va començar la unitat amb `gato1`, `gato2`, `gato3`?

**Novell:** — *somriu* Vaig començar amb 100 gats i he acabat gestionant l'aparcament sencer amb 20 línies. I ara què?

**CONRAD:** — *fa un glop* Ara el que és interessant. Totes estes dades que guardes en arrays demanen a crits que els **busques** i els **ordenes** bé. Bombolla, cerca binària, Big O... Un altre tipus de bèsties, i van just després.

El novell guarda el seu projecte, tanca l'IDE i sent que ja no guarda dades soltes: **pensa en aparcaments**.

**PRÒXIMAMENT EN LA U05:** Algorísmica I: Fonaments. Els algoritmes que busquen i ordenen els teus arrays, i la notació per a saber quin és ràpid de solemnitat. 🧩

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/04-arrays) · **Anterior:** [08 · Array-revelde: errors comuns i depuració](/ApuntesProgramacion/va/04-arrays/08-array-revelde) · **Següent:** **[U05 · Algorítmica I: Fonaments](/ApuntesProgramacion/va/05-algoritmica-fundamentos)**