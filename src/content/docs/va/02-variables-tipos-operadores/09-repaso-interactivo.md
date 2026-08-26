---
title: "09 — Repàs interactiu: la caixa que no cabia"
description: El tancament pràctic de la unitat, amb un bug de truncament que no agradarà a ningú 😈
---

<p><small>El tancament pràctic de la unitat, amb un bug de truncament que no agradarà a ningú 😈</small></p>

> 🗺️ **Estàs en:** 🔤 **U02 · Variables, Tipus i Operadors** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaben de donar-te este programa per a executar:*

```java
public class Misterio {
    public static void main(String[] args) {
        int nota = 7;
        int sobre = 10;
        System.out.println("Nota " + nota + sobre);
        System.out.println("Nota " + (nota + sobre));
        System.out.println(nota / 2 + " de nota media");
    }
}
```

**Què imprimixes per pantalla? Tria sàviament:**

1. **`Nota 710`, `Nota 17` i `3 de nota media`** → ✅ Correcte! En la primera línia, en vore text abans del `+`, Java concaten: `"Nota " + 7` és `"Nota 7"` i després `+ 10` dona `"Nota 710"`. En la segona, els parèntesis forcen la suma: `Nota 17`. I `7 / 2` és divisió entera: 3.
2. **`Nota 17`, `Nota 17` i `3.5 de nota media`** → Els parèntesis no canvien res i la divisió entera es redonix. ❌
3. **`Nota 710`, `Nota 17` i `3.5 de nota media`** → La divisió de dos enters dona decimals. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **1**. Quan un `+` mescla text i números, Java concaten. Els parèntesis `(nota + sobre)` obliguen a sumar primer. I `7 / 2` amb enters trunca: **3**, no 3.5. Tres trampes de la unitat en un sol programa. Brutal.
>
> </details>

---

## 🔥 Fireside Chat: int vs double

> *Dos caixes del magatzem discutixen al costat de la prestatgeria de les dades.*

**int:** — Jo sóc la caixa de mudança. Compacta, exacta, sense decimals. En mi no hi ha lloc per a tonteries. 17 dividit entre 5 són 3 i s'ha acabat.

**double:** — *alça una cella* ¿3? De veres? Per a mi són 3.4. Jo guarde els decimals de veritat. Els preus, les notes mitjanes, les temperatures... tot això viu a casa meua.

**int:** — Sí, i quan intentes ficar un número meu a la teua caixa, va tot bé. Però quan intentes ficar tu el teu a la meua... ¡has de demanar permís amb `(int)` i encara perds cèntims pel camí!

**double:** — *arronsant les espatles* És el preu de la precisió. Jo guarde més dígits que tu. Saps quantes voltes he vist a novats escriure `(int)(Math.random() * 6 + 1)` i plorar perquè el dau mai no eixia 6?

**int:** — Val, val... I per a contar? Per a un bucle? Per a una edat? A mi em criden a mi. Contar amb decimals no té sentit.

**double:** — I mesurar, calcular mitjanes i preus, em criden a mi. Som un equip: tu per al sencer, jo per al fi.

**int:** — *gruny* Un equip. Bah. Però... val. Tu i jo, i `long` per als astronòmics i `char` per a les lletres. Tots al mateix magatzem.

> La lliçó: **`int` és per al sencer, `double` per al decimal**. Confondre'ls en una divisió (o en un casting mal posat) produïx els errors més clàssics d'esta unitat.

---

## 🕵️ Qui Soc?

Endevina quin concepte de la unitat sóc:

1. **Sóc el superglue del magatzem: una volta que fiques alguna cosa en mi, no ix ni amb palanca. M'escriuen en MAJÚSCULES perquè tots em respecten.**
2. **Compare dos valors i només sé dir dos paraules: `true` i `false`. Sóc el jutge de la discussió.**
3. **Sóc la caixa màgica del text: no sóc primitiu, sóc una classe, i si intentes canviar-me, tire el vell i en cree un de nou.**
4. **Sóc l'orella del programa: esper que escrigues pel teclat i després passe el que has llegit a una variable.**
5. **Sóc el casino: et done un nombre entre 0 i 1, i si em multipliques i em convertixes a `int`, et faig un dau.**

<details>
<summary>🔄 Respostes</summary>

1. **`final`** — El modificador que convertix una variable en constant.
2. **Un operador relacional** (`==`, `<`, `>`, ...) — Sempre retorna un `boolean`.
3. **`String`** — Classe immutable que guarda text.
4. **`Scanner`** — Llegix del teclat amb mètodes `next...`.
5. **`Math.random()`** — El generador de nombres aleatoris.

</details>

---

## 🤬 CONRAD VS EL MÓN: "El compilador odia la teua memòria"

> *CONRAD, el nostre compilador cascarrabias, opina sobre els clàssics del novat en esta unitat.*

**CONRAD:** — ALTRA VEGADA! Ve un alumne i em dona això: `long distancia = 3000000000;` sense la L. I jo: *això és un int, i no cap, collons.* Però ell no m'escolta. Per què? ¡Perquè creu que ja ho sap tot!

*I després el preu:* `float precio = 19.99;`. Un `double` solt dins d'una caixa `float`... i li falta la `f`. ¡LA F, HOME! És una lletra, una sola. Tan difícil és? I `char letra = "A"` amb cometes dobles. ¡Les simples, les simples! És com confondre un pis amb una escala.

*I el rei del mambo:* `String nombre = "Ana";` i després `if (nombre == "Ana")`. PERÒ T'HAS LLEGIT EL PUNT 2? `==` compara referències, no text. És que t'estic donant l'examen amb les respostes i me'l retornes en blanc.

**La lliçó:** en esta unitat, el compilador és el teu millor amic: `long` necessita L, `float` necessita f, `char` usa cometes simples i els `String` es comparen amb `.equals()`. Aprén la llista de quatre i t'estalviaràs el 80% de les bronques.

---

## ⚡ Laboratori de Tortura: el programa que cobra malament

> **Duració estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un archiu nou

**L'escenari:** copia este programa al teu IDE i fes que funcione. És un caixer que calcula quants bitllets de 5 € et dona el banc per un reintegrament. Té **3 errors** que impedixen que compile i 1 error de lògica que fa que el resultat siga incorrecte quan l'arregles.

```java
import java.util.Scanner;

public class Tortura {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Cantidad a retirar: ");
        int cantidad = sc.nextInt()
        int billetes5 = cantidad / 5.0;
        System.out.println("Te dan " + billetes5 + " billetes de 5");
        sc.close();
    }
}
```

**Fallada intencionada:** un dels errors pareix correcte a simple vista perquè "es veu bé", però canvia per complet l'eixida del programa.

**La teua tasca:** aconseguir que compile, que execute i que **tota** l'eixida siga correcta. Prova amb `cantidad = 17`: quants bitllets de 5 haurien de ser?

**Pistes per quan et frustres (no abans):**

1. Hi ha algun `;` que falte? *no → seguix buscant.*
   <details><summary>I si encara estic atascat?</summary>La línia del `nextInt()` acaba sense punt i coma. El `;` existix perquè Java sàpia on acaba cada ordre.</details>
2. Ja compila? *no → mira el missatge d'error i les majúscules.*
   <details><summary>I si encara estic atascat?</summary>Has recordat el `import java.util.Scanner;` al principi? Sense ell, `Scanner` no existix per al compilador.</details>
3. Executa però el número de bitllets ix amb decimals o rar? *És l'error de lògica: mescla de tipus.*
   <details><summary>Solució final</summary>

L'error de lògica: `cantidad / 5.0` dividix un `int` entre un `double`, així que `billetes5` hauria de ser `double`... però el vas declarar `int`. El resultat es trunca malament. La solució és dividir **entre enters** perquè la divisió entera faça el seu treball net:

```java
import java.util.Scanner;

public class Tortura {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Cantidad a retirar: ");
        int cantidad = sc.nextInt();
        int billetes5 = cantidad / 5;
        System.out.println("Te dan " + billetes5 + " billetes de 5");
        sc.close();
    }
}
```

Per a `cantidad = 17`: `17 / 5` amb enters dona **3** bitllets (i sobren 2 €). Amb la versió trencada, `17 / 5.0 = 3.4` que en truncar a `int` també dona 3, però si `cantidad` fóra, per exemple, 20, la versió amb `5.0` donaria `4.0`... que tampoc revienta. El vertader problema apareix al revés: intenta compilar `int billetes5 = cantidad / 5.0;` al cap. Si Java es queixa o no, eixe era l'enigma.

</details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-lo |
|---|---|
| 🏅 **El Guarda del Magatzem** | Explicar els 8 tipus primitius i què cap en cada caixa sense mirar |
| 🏅 **L'Equilibrista** | Resoldre `int y = x++ + ++x;` sense executar i sense plorar |
| 🏅 **El Traductor de Text** | Normalitzar un nom amb `trim().toUpperCase().substring(...)` en una línia |
| 🏅 **El Dau Trucat** | Generar 10 nombres aleatoris entre 1 i 6 sense que isca mai un 0 |
| 🏅 **El Coiot del Scanner** | Evitar l'embolic de `nextLine()` després de `nextInt()` sense que ningú t'ho recorde |

---

## 🧠 Atreveix-te a Pensar

1. **Sense executar:** què imprimix este programa?

```java
public class Misterio2 {
    public static void main(String[] args) {
        int a = 10;
        int b = 3;
        System.out.println("a/b = " + a / b);
        System.out.println("a/b real = " + (double) a / b);
        System.out.println("a%b = " + a % b);
    }
}
```

2. **El preu que no quadra:** un programa calcula `double total = precio * 0.21;` amb `precio = 100` i mostra `21.000000000000004`. Què li passa a Java? Com ho arreglaries només amb ferramentes d'esta unitat?

3. **El ternari encadenat:** escriu un ternari (o diversos encadenats) que assigne a `categoria` el valor `"niño"`, `"adulto"` o `"jubilado"` segons si l'edat és `< 12`, `< 65` o `>= 65`.

4. **Vertader o fals:** "`Math.random() * 5` pot retornar el número 5." Justifica.

<details>
<summary>💡 Solucions</summary>

1.
```
a/b = 3
a/b real = 3.3333333333333335
a%b = 1
```
La primera és divisió entera (trunca). La segona força decimal amb `(double) a` abans de dividir.

2. Java usa **coma flotant binària**: `0.21` no es pot representar exactament en binari, així que queden residus com `21.000000000000004`. Pots deixar-ho visualment net redonint amb `Math.round(total * 100) / 100.0`, o simplement acceptar que és un tema de precisió (els formats d'eixida bonics arriben en la U11).

3.
```java
String categoria = edad < 12 ? "niño" : (edad < 65 ? "adulto" : "jubilado");
```
Els ternaris es poden encadenar: si la primera condició és falsa, avaluem la segona.

4. **Fals.** `Math.random()` retorna entre `0.0` i `0.999...` (l'1 mai no s'inclou). En multiplicar per 5, el màxim és `4.999...`, que després del `(int)` dona 4. `(int)(Math.random() * 5)` dona de **0 a 4**.

</details>

---

## 🧩 Crucigrama de Bits

```
Horitzontal:
1. Operador que dona el reste d'una divisió (1 lletra)
3. Modificador que fa una variable constant (5 lletres)
5. Classe per a llegir del teclat (7 lletres)
7. Mètode que lleva els espais dels extrems (4 lletres)

Vertical:
2. Tipus que guarda text (6 lletres)
4. Classe amb mètodes estàtics com random i round (4 lletres)
6. Tipus primitiu de vertader o fals (7 lletres)
```

<details>
<summary>📝 Solucions</summary>

**Horitzontal:** 1. % · 3. FINAL · 5. SCANNER · 7. TRIM
**Vertical:** 2. STRING · 4. MATH · 6. BOOLEAN

</details>

---

## 💬 Preguntes d'Entrevista de Treball

> Preguntes reals que et farien per a programador Java júnior.

1. **"Explica'm, com si jo tinguera huit anys, què és una variable i què és un tipus primitiu."**
2. **"Per què `double nota = 7/2;` dona `3.0` i no `3.5`? I com ho arreglaries?"**
3. **"Quan usaríes `int` i quan `long`? Posa un exemple de cada un."**
4. **"Què és un casting i quins riscos té fer un casting de `double` a `int`?"**
5. **"Com llegixes un número enter i una línia de text des del teclat sense que el text es quede buit?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **Per què a voltes pose `L` al final d'un `long` i altres voltes no?**

Perquè depén del número. Si el número cap en un `int` (màxim 2.147 milions), `long x = 100;` va sense `L` (Java el promociona sol). Si supera eixe límit, `long x = 3000000000;` necessita la `L` perquè Java no intente ficar-lo en un `int` i es queixe.

---

> ❓ **És `Math.random()` un mètode de l'objecte `Math`?**

No exactament: `Math` és una **classe**, i `random()`, `pow()`, `round()`... són **mètodes estàtics**. No crees cap objecte de `Math`; crides directament `Math.random()`. És la diferència entre "cridar la classe" i "cridar l'objecte", que veuràs a fons en la U07.

---

> ❓ **Si escric `int nota = (int) 7.99;`, em dona 8 per redoniment?**

No. El casting **trunca**, no redonix: `(int) 7.99` dona **7**. Per a redonir de veritat usa `Math.round(7.99)`. El truncament talla amb destral; el redoniment negocia.

---

> ❓ **Puc sumar un `String` i un número així, sense més?**

Sí: `"Resultado: " + 5` dona `"Resultado: 5"`. Java convertix el número a text i el concaten. Això s'anomena **concatenació**. El problema ve quan t'oblides dels parèntesis: `"Suma: " + 5 + 3` dona `"Suma: 53"`. ¡Els parèntesis són vida!

---

## 🎬 Post-Crèdits

El programador novat acaba el seu caixer de bitllets, el compila i l'executa. Funciona. Llavors s'acosta CONRAD, el compilador cascarrabias, amb cara de pocs amics i una caixa etiquetada `double` a la mà.

**CONRAD:** — Molt bonic el teu caixer. Declares variables, fas castings, llegixes del teclat... quasi pareix un programa de veritat. Però hi ha un problema.

**Novat:** — Quin problema?

**CONRAD:** — *assenyala el codi amb menyspreu* El teu programa només fa UNA cosa. L'executes i s'ha acabat. Si l'usuari vol provar un altre reintegrament... ha de tornar a executar? Els programes de veritat **decidixen** i **repetixen**. Trien entre camins i donen voltes fins que s'acaba la condició.

**Novat:** — I això quan s'aprén?

**CONRAD:** — *somriu malvat* La pròxima parada. Ja et veig escrivint el teu primer `if`... i el teu primer bucle infinit. Espera'm, que jo estaré ahí per a riure'm.

El novat guarda el seu projecte, tanca l'IDE i sent que el magatzem de dades ja té amo.

**PRÒXIMAMENT EN U03:** Estructures de control i excepcions. El moment en què els teus programes deixen de fer *una* cosa i comencen a *decidir* i *repetir*. 🔀

---

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/02-variables-tipos-operadores) · **Anterior:** [08 · Mètodes útils de String](/ApuntesProgramacion/va/02-variables-tipos-operadores/08-metodos-string) · **Següent:** **[U03 · Estructures de Control](/ApuntesProgramacion/va/03-estructuras-control-excepciones)**