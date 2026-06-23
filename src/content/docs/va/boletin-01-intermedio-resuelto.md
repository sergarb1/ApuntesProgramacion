---
title: "Butlletí 1 - Resolt: Introducció"
nav_order: 3
---
Exercicis de dificultat progressiva. Els ⭐ són per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar.

---

## ⭐ Exercici 1: El programa que saluda tres vegades

Escriu un programa que imprimeixca "Hola" tres vegades en tres línies separades, però només usant UNA línia de `System.out.println` (pista: usa `\n`).

> **💡 Explicació:** `\n` és un caràcter especial que significa "nova línia". És com polsar Enter dins del text. Java interpreta `\n` com un salt de línia, encara que estiga dins de les cometes. Així que amb un sol `println` pots imprimir diverses línies. És com escriure un poema en una sola línia del quadern: els `\n` són els punts i a part invisibles.

---

## ⭐ Exercici 2: Arguments en l'arena

Escriu un programa que reba arguments des de la línia de comandaments i els imprimeixca en ordre invers.

> **💡 Explicació:** `args` és un array que conté tot allò que escrigues després de `java NombreClasse`. Si poses `java ArgumentosInversos hola mundo cruel`, `args[0]` és "hola", `args[1]` és "mundo", `args[2]` és "cruel". El bucle `for` comença per l'últim índex (args.length - 1) i va cap arrere. Si no passes arguments, args.length és 0 i el bucle no s'executa. El programa no diu res. Com un concert sense públic.

---

## ⭐⭐ Exercici 3: Comentari o no comentari

Sense executar, què imprimeix este programa?

```java
public class Comentarios {
    public static void main(String[] args) {
        // System.out.println("Uno");
        System.out.println("Dos");
        /* System.out.println("Tres"); */
        System.out.println(/* "Cuatro" */ "Cinco");
    }
}
```

**Solució:**
```
Dos
Cinco
```

> **💡 Explicació:** Les línies amb `//` s'ignoren completament. `System.out.println("Dos")` s'executa normal. El bloc `/* ... */` també s'ignora. Però l'última línia és un parany: el comentari està DINS de la línia. `System.out.println(/* "Cuatro" */ "Cinco")` — el `/* "Cuatro" */` s'ignora, però `"Cinco"` roman com a argument del `println`. Així que imprimeix "Cinco". Els comentaris no són comandaments, són notes adhesives: pots posar-los on vulgues, fins i tot enmig d'una línia, i el compilador els ignorarà com si mai hagen existit.

---

## ⭐⭐ Exercici 4: La festa d'aceptaelreto.com

Resol el problema **117 — La fiesta** de [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=117).

Diu: donat un número N, imprimeix "Hola mundo." N vegades.

> **💡 Explicació:** El problema et dona un número N en la primera línia. Has de llegir-lo amb `Scanner` (sí, ja sé que Scanner no l'hem vist oficialment, però AceptaElReto exigix llegir de teclat). Després un `for` que es repetix N vegades, imprimint "Hola mundo." cada vegada. Si et fixes, el `for` és com una gravació en bucle: "digues-ho una altra volta, digues-ho una altra volta, digues-ho una altra volta...". El `sc.close()` és opcional però educat: tanques el Scanner perquè eres una persona neta.

---

## ⭐⭐ Exercici 5: Calculadora sense Scanner

Declara dos variables `int a` i `int b` amb valors fixes (15 i 4). Mostra: suma, resta, multiplicació, divisió entera, divisió real i residu. Tot amb `System.out.println`.

**Eixida:**
```
a = 15, b = 4
Suma: 19
Resta: 11
Multiplicació: 60
Divisió entera: 3
Divisió real: 3.75
Residu: 3
```

> **💡 Explicació:** La divisió entera (`15 / 4`) dona `3` perquè tots dos són `int`: Java tritura els decimals i es queda amb la part entera. Per a la divisió real, convertim `a` a `double` amb `(double) a`. Així Java entén que volem decimals. El `%` et dona el residu: `15 % 4 = 3` perquè 4 cap 3 vegades en 15 (4×3=12) i sobren 3. Açò és la base de TOT: saber quan Java talla decimals i quan no et salvarà de molts maldecaps.

---

## ⭐⭐⭐ Exercici 6: Javadoc de la teua vida

Crea una classe `SobreMi` amb:
- Comentari Javadoc en la classe explicant qui eres
- Comentari Javadoc en el mètode `main`
- Un `println` que mostre el teu nom i motivació

> **💡 Explicació:** Javadoc són comentaris especials que comencen amb `/**` i permeten generar documentació automàtica amb l'eina `javadoc`. Es col·loquen just abans de la classe o mètode que documenten. Les etiquetes `@author` i `@version` són per a la classe; `@param` per als paràmetres del mètode. No és obligatori, però quan treballes en equip i et demanen documentar el teu codi, donaràs les gràcies. A més, en els exàmens sol caure. I sí, en la vida real quasi ningú documenta amb Javadoc... però els que ho fan dormen millor.

---

## ⭐⭐⭐ Exercici 7: El primer depurador

Escriu un programa amb un bucle que sume els números de l'1 al 10. Pos un breakpoint en la línia de la suma i executa pas a pas. Anota:

1. Quantes vegades es para el breakpoint?
2. Quin valor té la variable `suma` en cada parada?
3. Quin és el valor final?

**Respostes:**
1. Es para **10 vegades** (una per cada iteració del `for`, quan `i` val 1, 2, 3... fins a 10).
2. Valors de `suma`: 1, 3, 6, 10, 15, 21, 28, 36, 45, 55.
3. Valor final: **55**.

> **💡 Explicació:** El depurador és com tindre una màquina del temps per al teu codi. Pos un breakpoint (punt de ruptura) en una línia i el programa es deté just allí. Pots vore el valor de totes les variables. Després avances pas a pas i veus com canvien. En este cas, `suma` comença en 0, i en cada volta se li suma el valor d'`i`. `i` va d'1 a 10. La suma total 1+2+3+...+10 = 55. Si no sabies esta fórmula, ara sí: la suma d'1 a N és N*(N+1)/2. Per a N=10: 10*11/2 = 55. El depurador et permet confirmar que és cert, pas a pas, com un científic boig verificant la seua teoria.

---

## ⭐⭐⭐ Exercici 8: CodeWars — Return Negative

Resol la kata **"Return Negative"** (8 kyu) en CodeWars.

Donat un número, torna'l negatiu. Si ja és negatiu, torna'l tal qual. Si és 0, torna 0.

> **💡 Explicació:** Si el número ja és negatiu (o zero), el tornem tal qual. Si és positiu, li posem un `-` davant. També es pot fer amb l'operador ternari: `return x <= 0 ? x : -x;` en una sola línia. La kata t'ensenya que a voltes el més simple funciona. No necessites una funció de 20 línies per a això. Una línia (o un if) basten. És com quan et pregunten "com estàs?" i respons "bé". No necessites un discurs de 5 minuts.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 116 — ¡Hola mundo! | Principiant |
| AceptaElReto | 117 — La fiesta | Fàcil |
| AceptaElReto | 119 — Futbolistas | Fàcil |
| CodeWars | Multiply (8 kyu) | Principiant |
| CodeWars | Return Negative (8 kyu) | Principiant |
