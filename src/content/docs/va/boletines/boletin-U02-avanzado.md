---
title: Butlletí U02 — Avançat
description: Exercicis de dificultat progressiva per a exprimir la unitat
---

# 📝 Butlletí U02 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resisteix-te a mirar-la).

---

## ⭐ Exercici 1: Calculadora de propines

Escriu un programa que calcule quant deixar de propina en un restaurant. Declara:

- `double totalCompte = 45.50;`
- `int percentatgePropina = 15;` (el percentatge, sense el símbol)

Calcula la propina (`totalCompte * percentatgePropina / 100`) i el total final (`totalCompte + propina`). Mostra els tres valors.

**Pista:** compte amb la divisió: `percentatgePropina / 100` amb enters dona 0. Multiplica primer i dividix després, o usa `100.0`.

---

## ⭐ Exercici 2: Conversor dòlar-euro

Declara `final double TAXA_CANVI = 0.92;` (1 dòlar = 0.92 euros). Declara `double dolars = 100.0;` i calcula el seu equivalent en euros. També fes la conversió inversa: donat `double euros = 50.0;`, calcula quants dòlars són.

Mostra:

```
100.0$ són 92.0€
50.0€ són 54.347826086956516$
```

**Pista:** per a passar d'euros a dòlars dividixes entre la taxa: `euros / TAXA_CANVI`.

---

## ⭐⭐ Exercici 3: Què imprimeix? — el casting traïdor

Sense executar, escriu l'eixida exacta:

```java
public class CastingTraidor {
    public static void main(String[] args) {
        int a = 7;
        int b = 2;
        double resultat1 = a / b;
        double resultat2 = (double) a / b;
        double resultat3 = a / (double) b;

        System.out.println(resultat1);
        System.out.println(resultat2);
        System.out.println(resultat3);
        System.out.println(3 + 4 * 2.0);
        System.out.println((int) (3.7 + 2.3));
    }
}
```

**Pista:** fixa't bé en on està el casting i en quin moment s'aplica la divisió entera. En `resultat1`, ¿la divisió es fa abans o després de guardar en el `double`?

---

## ⭐⭐ Exercici 4: Interès compost (sense bucle)

Declara `final double CAPITAL_INICIAL = 1000.0;`, `final double TAXA = 0.05;` (5% anual) i `int anys = 3;`. Calcula el capital final després de 3 anys usant la fórmula de l'interès compost SENSE bucles:

```
capitalFinal = capitalInicial * (1 + taxa)^anys
```

Per a la potència usa `Math.pow(base, exponent)`. Mostra el capital any a any:

```
Any 0: 1000.0€
Any 1: 1050.0€
Any 2: 1102.5€
Any 3: 1157.625€
```

> 💡 **Compte amb la precisió:** en l'any 3 el teu programa pot imprimir `1157.6250000000002` en lloc de `1157.625` per la coma flotant binària dels `double` (ho veurem a «Atreveix-te a pensar»). No és un error del teu codi.

**Pista:** per a mostrar cada any sense bucle, crea tres variables distintes (`capital1`, `capital2`, `capital3`) i usa `Math.pow(1 + TAXA, i)` amb `i` valent 1, 2 i 3.

---

## ⭐⭐⭐ Exercici 5: L'enigma del post-increment

Sense executar, determina el valor de cada variable després d'executar este codi. Escriu el pas a pas:

```java
public class EnigmaIncrement {
    public static void main(String[] args) {
        int x = 3;
        int y = x++ + ++x;
        int z = --y + y-- + x++;
        System.out.println("x = " + x);
        System.out.println("y = " + y);
        System.out.println("z = " + z);
    }
}
```

**Pista:** fes una taula amb els valors de `x` i `y` després de cada operació. `x++` usa i després incrementa; `++x` incrementa i després usa.

---

## ⭐⭐ Exercici 6: El duel de daus

Escriu un programa que llance un dau per a l'usuari (li demana el nom amb `Scanner`) i un altre per a la màquina (amb `Math.random()`). Guanya qui traga més. Mostra les dos tirades i el guanyador amb un missatge tipus:

```
Anna trau 4, la màquina trau 6.
Guanya la màquina.
```

**Pista:** combina `nextLine()` (nom), `(int)(Math.random() * 6) + 1` (daus) i un ternari encadenat per al veredicte. Compte amb l'empat.

---

## ⭐⭐ Exercici 7: Supercalculadora amb lògica

Escriu un programa que llegixca dos nombres amb `Scanner` (`double`) i un caràcter d'operació (`+`, `-`, `*`, `/`) amb `next()`.

Segons l'operador, mostra el resultat. Si l'operador és `/` i el segon nombre és 0, mostra "Error: no es pot dividir entre 0". Per a qualsevol altre caràcter, mostra "Operador desconegut".

**Pista:** calcula els resultats possibles en variables i tria amb ternaris encadenats o amb lògica. Pots comprovar la divisió entre 0 amb `(op.equals("/") && b == 0)`.

---

## ⭐⭐⭐ Exercici 8: CodeWars — Convert boolean values to strings 'Yes' or 'No'

Resol la kata **"Convert boolean values to strings 'Yes' or 'No'"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/53369039d7ab3ac506000467).

Completa el mètode `public static String boolToWord(boolean b)` que retorne `"Yes"` si rep `true` i `"No"` si rep `false`.

**Pista:** es pot fer en una sola línia amb l'operador ternari: `b ? "Yes" : "No"`.

---

## ⭐⭐⭐ Exercici 9: AceptaElReto — 114 Últim dígit del factorial

Resol el problema **114 — Últim dígit del factorial** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=114).

Donat un nombre N (0 ≤ N ≤ 1.000.000), calcula l'últim dígit de N! (factorial de N).

**Pista:** no necessites calcular el factorial sencer. Observa que 5! = 120, 6! = 720, 7! = 5040... a partir de 5, el factorial sempre acaba en 0. Només necessites gestionar els casos menuts (0 a 4) i els grans amb una sola regla.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 114 — Últim dígit del factorial | Fàcil |
| AceptaElReto | 148 — Cap d'any | Fàcil |
| AceptaElReto | 217 — Quin costat del carrer? | Fàcil |
| CodeWars | Will you make it? (8 kyu) | Principiant |
| CodeWars | Convert boolean to Yes/No (8 kyu) | Principiant |
| CodeWars | Keep Hydrated (8 kyu) | Principiant |