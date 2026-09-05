---
title: Butlletí U02 — Inicial Resolt
description: Els mateixos exercicis que el butlletí inicial, amb solucions
---

# 📝 Butlletí U02 — Inicial (Resolt)

> Les solucions estan ocultes en cada exercici. No faces trampa: primer intenta-ho de veritat.

---

## Exercici 1: Conversor de temperatures

<details>
<summary>🔄 Solució</summary>

```java
public class ConversorTemperatura {
    public static void main(String[] args) {
        int celsius = 30;
        double fahrenheit = celsius * 9 / 5.0 + 32;

        System.out.println(celsius + "°C són " + fahrenheit + "°F");
    }
}
```

Eixida: `30°C són 86.0°F`.

Fixat en el `5.0`: si escrigueres `celsius * 9 / 5 + 32`, la divisió `9 / 5` es faria amb enters (dona 1) i el resultat seria 62, un desastre. En usar `5.0`, la divisió es fa en decimal. Això és la divisió entera del punt 3 en acció.

</details>

---

## Exercici 2: Què imprimeix? — increments

<details>
<summary>🔄 Solució</summary>

```
5
7
7
5
5
```

Pas a pas, amb `x` començant en 5:

1. `x++` (POST) → imprimeix 5, després `x` passa a 6.
2. `++x` (PRE) → `x` passa a 7, després imprimeix 7.
3. `x--` (POST) → imprimeix 7, després `x` passa a 6.
4. `--x` (PRE) → `x` passa a 5, després imprimeix 5.
5. `x` → imprimeix 5.

</details>

---

## Exercici 3: Calculadora de descomptes

<details>
<summary>🔄 Solució</summary>

```java
public class CalculadoraDescomptes {
    public static void main(String[] args) {
        final double DESCOMPTE = 0.15;
        double preuOriginal = 120.0;

        double descompte = preuOriginal * DESCOMPTE;
        double preuFinal = preuOriginal - descompte;

        System.out.println("Preu original: " + preuOriginal + "€");
        System.out.println("Descompte (15%): " + descompte + "€");
        System.out.println("Preu final: " + preuFinal + "€");
    }
}
```

Si intentes fer `DESCOMPTE = 0.20;` després, el compilador t'ho impedirà: `final` és el superglue del punt 2, una constant no es pot reassignar. Eixa és la raó que "el compilador s'enfade".

</details>

---

## Exercici 4: El tipus perfecte

<details>
<summary>🔄 Solució</summary>

1. **`int`** — ~500.000 cap de sobres en un `int` (topall: 2.147 milions).
2. **`long`** — 384.400 km sí que cap en un `int`, però és una distància "astronòmica" i queda més coherent amb `long`. (Si ho posares `int`, també compila: la decisió de fons és que supera el quotidià.)
3. **`char`** — una sola lletra, amb cometes simples: `'M'`.
4. **`double`** — 3.7 té decimals.
5. **`boolean`** — només dos valors: `true` o `false`.
6. **`int`** — els cèntims són un nombre enter (sense decimals).

</details>

---

## Exercici 5: El casting assassí

<details>
<summary>🔄 Solució</summary>

```java
public class CastingAssassi {
    public static void main(String[] args) {
        double preu = 9.99;
        int preuEnter = (int) preu;

        System.out.println("Preu original: " + preu);
        System.out.println("Preu enter: " + preuEnter);

        int gran = 300;
        byte petit = (byte) gran;
        System.out.println("300 en un byte: " + petit);
    }
}
```

- `(int) 9.99` trunca i dona **9**: es perden els 0.99€. El casting talla amb destral, no redonix.
- `300` en un `byte` (màxim 127) es **desborda** silenciosament i dona **44**. Java no avisa: és la teua responsabilitat comprovar que el valor cap abans d'estretir la caixa.

</details>

---

## Exercici 6: Parell o senar?

<details>
<summary>🔄 Solució</summary>

```java
public class ParellOSenar {
    public static void main(String[] args) {
        int numero = 7;
        String resultat = numero % 2 == 0 ? "Parell" : "Senar";

        System.out.println(numero + " és " + resultat);
        System.out.println("És parell? " + (numero % 2 == 0));
    }
}
```

Eixida:

```
7 és Senar
És parell? false
```

El `%` retorna el reste de la divisió: si és 0, el nombre és parell. El ternari tria el missatge en una línia.

</details>

---

## Exercici 7: String en acció

<details>
<summary>🔄 Solució</summary>

```java
public class NomEnAccio {
    public static void main(String[] args) {
        String nom = "  ana  ";
        String net = nom.trim();

        System.out.println("Net: " + net);
        System.out.println("Longitud: " + net.length());
        System.out.println("Majúscules: " + net.toUpperCase());
        System.out.println("Primera lletra: " + net.toUpperCase().substring(0, 1));
    }
}
```

Eixida:

```
Net: ana
Longitud: 3
Majúscules: ANA
Primera lletra: A
```

Fixat en l'encadenat: `net.toUpperCase().substring(0, 1)` neteja, posa en majúscules i talla la primera lletra en una sola línia.

</details>

---

## Exercici 8: Salutació amb Scanner

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class SalutacioScanner {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Com et dius? ");
        String nom = sc.nextLine();

        System.out.print("Quants anys tens? ");
        int edat = sc.nextInt();

        System.out.println("Hola, " + nom + ". " + edat + " anys, benvingut.");

        sc.close();
    }
}
```

En este programa l'ordre està bé: com que el `nextLine()` va abans que el `nextInt()`, no hi ha Enter residual que reclamar. El lio apareix al revés (número primer i text després), com en el punt 6.

</details>

---

## Exercici 9: CodeWars — Will you make it?

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static boolean zeroFuel(double distanceToPump, double mpg, double fuelLeft) {
        return mpg * fuelLeft >= distanceToPump;
    }
}
```

Multipliques els litres que tens pels quilòmetres per litre: això et dona la distància màxima que pots recórrer. Si és més gran o igual que la distància a la gasolinera, hi arribes (`true`); si no, et quedes tirat (`false`). Una línia amb un operador relacional i un `>=`.

</details>

---

## Exercici 10: Què imprimeix? — printf amb conversions

<details>
<summary>🔄 Solució</summary>

Imprimeix:

```
42 3.141600 Java
```

`%d` rellena amb l'enter (42), `%f` amb el decimal (per defecte mostra **6 decimals**: 3.141600) i `%s` amb el text (Java). El `%n` és un salt de línia independent del sistema operatiu: funciona igual en Windows, Linux i Mac. En un `printf`, el `%n` és l'opció "oficial" per a saltar de línia.

</details>

---

## Exercici 11: la nota amb dos decimals

<details>
<summary>🔄 Solució</summary>

```java
public class NotaFormatejada {
    public static void main(String[] args) {
        String nom = "Marta";
        double nota = 9.5678;

        String missatge = String.format("%s ha tret un %.2f.", nom, nota);
        System.out.println(missatge);

        System.out.printf("%s ha tret un %.2f.%n", nom, nota);
    }
}
```

`String.format` construïx el text i el guarda en la variable `missatge` (no imprimeix res); `printf` escriu directament en pantalla. Els dos redonixen a dos decimals amb `%.2f`. Fixa't: usa `String.format` quan vulgues el text com a valor, i `printf` quan només vulgues escriure'l.

</details>

---

## Exercici 12: la propina amb dos decimals

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class PropinaFormatejada {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Total del compte: ");
        double total = sc.nextDouble();

        System.out.print("Percentatge de propina: ");
        int percentatge = sc.nextInt();

        double propina = total * percentatge / 100.0;
        double totalFinal = total + propina;

        System.out.printf("Total: %.2f €%n", total);
        System.out.printf("Propina (%d%%): %.2f €%n", percentatge, propina);
        System.out.printf("Total a pagar: %.2f €%n", totalFinal);

        sc.close();
    }
}
```

- Per a mostrar el símbol `%` en un `printf` cal escriure'l **doble**: `%%`.
- Fixa't en `100.0`: si usares `100` (enter), `percentatge / 100` faria divisió entera i la propina eixiria 0. Ordre de les operacions i divisió entera, les dos trampes del punt 3.

</details>