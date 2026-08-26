---
title: Butlletí U03 — Inicial Resolt
description: Els mateixos exercicis que el butlletí inicial, amb solucions
---

# 📝 Butlletí U03 — Inicial (Resolt)

> Les solucions estan ocultes en cada exercici. No facis trampa: primer intenta-ho de veritat.

---

## Exercici 1: El porter del club

<details>
<summary>🔄 Solució</summary>

```java
public class Porter {
    public static void main(String[] args) {
        int edat = 17;
        boolean teEntrada = true;

        if (edat >= 18 && teEntrada) {
            System.out.println("Endavant, que passe el major d'edat.");
        } else if (edat >= 18) {
            System.out.println("Faltes tu sol, sense entrada no hi ha paradís.");
        } else {
            System.out.println("Fora d'ací, xicotet.");
        }
    }
}
```

Eixida: `Fora d'ací, xicotet.`

Fixa't en l'ordre: primer comproves la combinació completa (`major I entrada`), després el cas del major sense entrada. El `else` final es queda amb els menors. Ordre estricte a lax, com en el punt 1.

</details>

---

## Exercici 2: Què imprimeix? — el semàfor invertit

<details>
<summary>🔄 Solució</summary>

Imprimix **`Aprovat`**.

Amb `nota = 8`, el primer `if` (`nota >= 5`) es complix i guanya, encara que 8 també compliria les condicions de Notable i Excel·lent. Java avalua en ordre i es queda amb la primera `true`. La lliçó: l'ordre dels `else if` decidix el resultat.

</details>

---

## Exercici 3: El menú del dia

<details>
<summary>🔄 Solució</summary>

```java
public class MenuDia {
    public static void main(String[] args) {
        int dia = 4;

        switch (dia) {
            case 1:
                System.out.println("Dilluns: Llenties");
                break;
            case 2:
                System.out.println("Dimarts: Paella");
                break;
            case 3:
                System.out.println("Dimecres: Macarrons");
                break;
            case 4:
                System.out.println("Dijous: Fabada");
                break;
            case 5:
                System.out.println("Divendres: Peix");
                break;
            default:
                System.out.println("Cap de setmana, no hi ha menú");
                break;
        }
    }
}
```

Eixida: `Dijous: Fabada`

Cada `case` amb el seu `break` (llevat del `default`, que no el necessita, però no fa mal). Sense els `break`, el switch es convertiria en un tobogan i ho imprimiria tot des del `case 4` en avant.

</details>

---

## Exercici 4: El compte arrere del coet

<details>
<summary>🔄 Solució</summary>

```java
public class Coet {
    public static void main(String[] args) {
        int comptador = 5;

        while (comptador >= 0) {
            System.out.println(comptador);
            comptador--;
        }

        System.out.println("Enlairament! 🚀");
    }
}
```

Eixida:

```
5
4
3
2
1
0
Enlairament! 🚀
```

El `comptador--` al final de cada volta és el que evita el bucle infinit: la condició `comptador >= 0` avança cap a `false`.

</details>

---

## Exercici 5: La taula del 7

<details>
<summary>🔄 Solució</summary>

```java
public class TaulaDelSet {
    public static void main(String[] args) {
        for (int i = 1; i <= 10; i++) {
            System.out.println("7 x " + i + " = " + (7 * i));
        }
    }
}
```

Eixida (primeres línies):

```
7 x 1 = 7
7 x 2 = 14
```

Fixa't en els parèntesis de `(7 * i)`: sense ells, el `+` concatenaria igualment (perquè `*` mana sobre `+`), però és més clar amb ells. El `for` junta comptador, condició i avanç en una línia.

</details>

---

## Exercici 6: Només els parells

<details>
<summary>🔄 Solució</summary>

```java
public class SolsParells {
    public static void main(String[] args) {
        for (int i = 1; i <= 20; i++) {
            if (i % 2 != 0) {
                continue;
            }
            System.out.println(i);
        }
    }
}
```

Eixida:

```
2
4
6
8
10
12
14
16
18
20
```

El `continue` es salta els senars i el bucle seguix amb el següent nombre. Alternativa sense `continue`: `for (int i = 2; i <= 20; i += 2)`, però ací practiquem el salt.

</details>

---

## Exercici 7: El detectiu de divisors

<details>
<summary>🔄 Solució</summary>

```java
public class DetectiuDivisors {
    public static void main(String[] args) {
        int numero = 29;
        boolean esPrimer = true;

        for (int divisor = 2; divisor < numero; divisor++) {
            if (numero % divisor == 0) {
                esPrimer = false;
                break;
            }
        }

        System.out.println(esPrimer ? "És primer" : "No és primer");
    }
}
```

Eixida: `És primer`

El `break` talla el bucle tan bon punt apareix un divisor: no cal seguir comprovant. Per al 29 no hi ha divisors (és primer), així que el bucle es recorre sencer i `esPrimer` continua sent `true`.

</details>

---

## Exercici 8: L'edat blindada

<details>
<summary>🔄 Solució</summary>

```java
import java.util.InputMismatchException;
import java.util.Scanner;

public class EdatBlindada {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        try {
            System.out.print("Quants anys tens? ");
            int edat = sc.nextInt();
            System.out.println("Tens " + edat + " anys.");
        } catch (InputMismatchException e) {
            System.out.println("Això no és una edat vàlida.");
        }

        System.out.println("El programa seguix viu. 🎉");
        sc.close();
    }
}
```

Si escrius `hola`, el `catch` atrapar l'error, imprimix el missatge i el programa continua. Si escrius `17`, tot normal. Eixe és el poder del `try`/`catch`: el teu programa ja no mor per la porqueria de l'usuari.

</details>

---

## Exercici 9: CodeWars — Even or Odd

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String even_or_odd(int number) {
        return number % 2 == 0 ? "Even" : "Odd";
    }
}
```

Una línia amb l'operador `%` i un ternari. Si el residu de dividir entre 2 és 0, és parell (`"Even"`); si no, senar (`"Odd"`). Els dos conceptes de la U02 i la U03 treballant junts.

</details>
