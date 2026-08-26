---
title: Butlletí U02 — Avançat Resolt
description: Els mateixos exercicis que el butlletí avançat, amb solucions
---

# 📝 Butlletí U02 — Avançat (Resolt)

> Les solucions estan ocultes. Intenta-ho de veritat abans de destapar-les.

---

## ⭐ Exercici 1: Calculadora de propines

<details>
<summary>🔄 Solució</summary>

```java
public class Propines {
    public static void main(String[] args) {
        double totalCompte = 45.50;
        int percentatgePropina = 15;

        double propina = totalCompte * percentatgePropina / 100;
        double totalFinal = totalCompte + propina;

        System.out.println("Total compte: " + totalCompte + "€");
        System.out.println("Propina (" + percentatgePropina + "%): " + propina + "€");
        System.out.println("Total a pagar: " + totalFinal + "€");
    }
}
```

La clau: `totalCompte * percentatgePropina / 100` multiplica primer (45.50 * 15 = 682.5) i dividix després per 100 → 6.825. Si hagueres escrit `percentatgePropina / 100`, hauries fet divisió entera (15/100 = 0) i la propina hauria eixit 0. Ordre i divisió entera: les dos trampes del punt 3.

</details>

---

## ⭐ Exercici 2: Conversor dòlar-euro

<details>
<summary>🔄 Solució</summary>

```java
public class ConversorMoneda {
    public static void main(String[] args) {
        final double TAXA_CANVI = 0.92;

        double dolars = 100.0;
        double euros = dolars * TAXA_CANVI;

        double eurosInvers = 50.0;
        double dolarsInvers = eurosInvers / TAXA_CANVI;

        System.out.println(dolars + "$ són " + euros + "€");
        System.out.println(eurosInvers + "€ són " + dolarsInvers + "$");
    }
}
```

Eixida:

```
100.0$ són 92.0€
50.0€ són 54.34782608695652$
```

Per a passar de dòlars a euros multipliques per la taxa; al revés, dividixes. El `final` garantix que ningú (ni tu) toque la taxa de canvi sense voler.

</details>

---

## ⭐⭐ Exercici 3: Què imprimeix? — el casting traïdor

<details>
<summary>🔄 Solució</summary>

```
3.0
3.5
3.5
11.0
6
```

Línia a línia:

- `resultat1 = a / b` → primer dividix enters (7/2 = 3) i després guarda en `double`: **3.0**.
- `resultat2 = (double) a / b` → castin a `a` a 7.0 abans de dividir: **3.5**.
- `resultat3 = a / (double) b` → castin a `b` a 2.0: **3.5**.
- `3 + 4 * 2.0` → la multiplicació mana i el `2.0` arrossega a decimal: `3 + 8.0` = **11.0**.
- `(int) (3.7 + 2.3)` → primer suma (6.0), després trunca: **6**.

</details>

---

## ⭐⭐ Exercici 4: Interès compost (sense bucle)

<details>
<summary>🔄 Solució</summary>

```java
public class InteresCompost {
    public static void main(String[] args) {
        final double CAPITAL_INICIAL = 1000.0;
        final double TAXA = 0.05;

        double capital1 = CAPITAL_INICIAL * Math.pow(1 + TAXA, 1);
        double capital2 = CAPITAL_INICIAL * Math.pow(1 + TAXA, 2);
        double capital3 = CAPITAL_INICIAL * Math.pow(1 + TAXA, 3);

        System.out.println("Any 0: " + CAPITAL_INICIAL + "€");
        System.out.println("Any 1: " + capital1 + "€");
        System.out.println("Any 2: " + capital2 + "€");
        System.out.println("Any 3: " + capital3 + "€");
    }
}
```

`Math.pow(1 + TAXA, i)` calcula `(1.05)^i`. Amb tres variables distintes evites el bucle... que arribarà en la U03. Fixat que `Math.pow` retorna un `double`.

</details>

---

## ⭐⭐⭐ Exercici 5: L'enigma del post-increment

<details>
<summary>🔄 Solució</summary>

El programa imprimeix:

```
x = 6
y = 6
z = 19
```

Pas a pas:

- `int x = 3;` → x = 3.
- `int y = x++ + ++x;` → `x++` usa 3 i deixa x = 4; `++x` puja x a 5 i usa 5. `y = 3 + 5 = 8`. Ara x = 5, y = 8.
- `int z = --y + y-- + x++;` → `--y` baixa y a 7 i usa 7; `y--` usa 7 i baixa y a 6; `x++` usa 5 i puja x a 6. `z = 7 + 7 + 5 = 19`. Final: x = 6, y = 6, z = 19.

> 💡 **Confessió honesta:** si en fer-ho et va eixir un altre número, benvingut al club: este exercici existix precisament perquè patisca una volta en classe i no vint en l'examen. La lliçó del punt 3: els `++` i `--` es fan servir sols, en la seua pròpia línia.

</details>

---

## ⭐⭐ Exercici 6: El duel de daus

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class DuelDaus {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Com et dius? ");
        String nom = sc.nextLine();

        int dauUsuari = (int) (Math.random() * 6) + 1;
        int dauMaquina = (int) (Math.random() * 6) + 1;

        System.out.println(nom + " trau " + dauUsuari + ", la màquina trau " + dauMaquina + ".");

        String guanyador = dauUsuari > dauMaquina ? "Guanya " + nom + "." :
                           dauUsuari < dauMaquina ? "Guanya la màquina." : "Empat.";
        System.out.println(guanyador);

        sc.close();
    }
}
```

Ací no hi ha problema d'Enter residual: el `nextLine()` va abans del `nextInt()` (que ni tan sols usem). Els daus usen la fórmula `(int)(Math.random() * 6) + 1`, i el ternari encadenat decidix el guanyador en tres casos.

</details>

---

## ⭐⭐ Exercici 7: Supercalculadora amb lògica

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class SuperCalculadora {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Primer nombre: ");
        double a = sc.nextDouble();

        System.out.print("Segon nombre: ");
        double b = sc.nextDouble();

        System.out.print("Operació (+, -, *, /): ");
        String op = sc.next();

        double suma = a + b;
        double resta = a - b;
        double multi = a * b;

        String resultat = op.equals("+") ? "Resultat: " + suma :
                          op.equals("-") ? "Resultat: " + resta :
                          op.equals("*") ? "Resultat: " + multi :
                          op.equals("/") && b != 0 ? "Resultat: " + (a / b) :
                          op.equals("/") ? "Error: no es pot dividir entre 0" :
                          "Operador desconegut";

        System.out.println(resultat);

        sc.close();
    }
}
```

La lògica del ternari encadenat: primer comprova si l'operador és `/` i a més `b` no és 0; si l'operador és `/` però `b` és 0, cau en el missatge d'error. Fixat en `op.equals("/")`: els `String` sempre es comparen amb `.equals()`. Els operadors lògics i relacionals unixen totes les condicions.

</details>

---

## ⭐⭐⭐ Exercici 8: CodeWars — Convert boolean values to strings 'Yes' or 'No'

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String boolToWord(boolean b) {
        return b ? "Yes" : "No";
    }
}
```

Una línia. El ternari retorna `"Yes"` si el booleà és `true` i `"No"` si és `false`. Elegant, com un esmòquing per al teu codi.

</details>

---

## ⭐⭐⭐ Exercici 9: AceptaElReto — 114 Últim dígit del factorial

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class UltimDigitFactorial {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int casos = sc.nextInt();

        for (int i = 0; i < casos; i++) {
            int n = sc.nextInt();
            int ultim;
            if (n >= 5) {
                ultim = 0;
            } else if (n == 0 || n == 1) {
                ultim = 1;
            } else if (n == 2) {
                ultim = 2;
            } else if (n == 3) {
                ultim = 6;
            } else {
                ultim = 4; // 4! = 24
            }
            System.out.println(ultim);
        }
        sc.close();
    }
}
```

La clau matemàtica: 5! = 120, i a partir d'ací qualsevol factorial multiplica per 5 (i abans per un nombre parell), així que **sempre acaba en 0**. Només cal memoritzar els casos menuts: 0! i 1! són 1, 2! = 2, 3! = 6, 4! = 24. Si intentares calcular `1000000!`, el teu programa reventaria: per això la trampa de l'enunciat és que "pareix que cal calcular el factorial". No cal.

</details>

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