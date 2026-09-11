---
title: "Butlletí U01 — Avançat Resolt"
description: "Els mateixos exercicis que el butlletí avançat, amb solucions"
---

# 📝 Butlletí U01 — Avançat (Resolt)

> Les solucions estan ocultes. Intenta-ho de veritat abans de destapar-les. Compara el teu codi amb estes propostes de resolució i comparteix els teus dubtes o alternatives en el fòrum.

---

## Exercici 1: Calculadora de propines (Solució)

<details>
<summary>🔄 Solució</summary>

```java
public class CalculadoraPropines {
    public static void main(String[] args) {
        double totalCompte = 45.50;
        int percentatgePropina = 15;

        // Multipliquem primer per a evitar la divisió entera entre enters (15 / 100 = 0)
        double propina = totalCompte * percentatgePropina / 100.0;
        double totalFinal = totalCompte + propina;

        System.out.println("Total del compte: " + totalCompte + "€");
        System.out.println("Propina (" + percentatgePropina + "%): " + propina + "€");
        System.out.println("Total a pagar: " + totalFinal + "€");
    }
}
```

</details>

---

## Exercici 2: Conversor dòlar-euro (Solució)

<details>
<summary>🔄 Solució</summary>

```java
public class ConversorMoneda {
    public static void main(String[] args) {
        final double TAXA_CANVI = 0.92;

        double dolars = 100.0;
        double eurosDesDeDolars = dolars * TAXA_CANVI;

        double euros = 50.0;
        double dolarsDesDeEuros = euros / TAXA_CANVI;

        System.out.println(dolars + "$ són " + eurosDesDeDolars + "€");
        System.out.println(euros + "€ són " + dolarsDesDeEuros + "$");
    }
}
```

</details>

---

## Exercici 3: Què imprimeix? — el casting traïdor (Solució)

<details>
<summary>🔄 Solució</summary>

**Eixida exacta per pantalla:**

```
3.0
3.5
3.5
11.0
6
```

**Explicació pas a pas:**

- **resultat1 (3.0)**: `a / b` és una divisió entre dos enters (7 / 2). El resultat és la divisió entera 3. En assignar-ho a un `double`, es converteix en 3.0.
- **resultat2 (3.5)**: `(double) a` converteix en 7.0. La divisió 7.0 / 2 és entre `double` i `int`, per la qual cosa `b` es promou a `double` i s'obté la divisió decimal exacta 3.5.
- **resultat3 (3.5)**: Ocorre el mateix: `(double) b` converteix `b` en 2.0, donant la divisió decimal 7 / 2.0 = 3.5.
- **3 + 4 \* 2.0 (11.0)**: La multiplicació té prioritat (4 \* 2.0 = 8.0). Després es suma 3 + 8.0 = 11.0 (promogut a `double`).
- **(int) (3.7 + 2.3) (6)**: Primer es resol el parèntesi 3.7 + 2.3 = 6.0. El casting `(int)` trunca la part decimal i queda l'enter 6.

</details>

---

## Exercici 4: Interés compost (sense bucle) (Solució)

<details>
<summary>🔄 Solució</summary>

```java
public class InteresCompost {
    public static void main(String[] args) {
        final double CAPITAL_INICIAL = 1000.0;
        final double TAXA = 0.05;

        double capital0 = CAPITAL_INICIAL;
        double capital1 = CAPITAL_INICIAL * Math.pow(1 + TAXA, 1);
        double capital2 = CAPITAL_INICIAL * Math.pow(1 + TAXA, 2);
        double capital3 = CAPITAL_INICIAL * Math.pow(1 + TAXA, 3);

        System.out.println("Any 0: " + capital0 + "€");
        System.out.println("Any 1: " + capital1 + "€");
        System.out.println("Any 2: " + capital2 + "€");
        System.out.println("Any 3: " + capital3 + "€");
    }
}
```

</details>

---

## Exercici 5: L'enigma del post-increment (Solució)

<details>
<summary>🔄 Solució</summary>

**Pas a pas de l'execució:**

1. **`int x = 3;`** → x=3.
2. **`int y = x++ + ++x;`:**
   - `x++`: Usa el valor actual de `x` (3) i després l'incrementa a 4.
   - `++x`: Incrementa `x` primer (4→5) i usa el nou valor (5).
   - y=3+5=8. Valors actuals: x=5, y=8.
3. **`int z = --y + y-- + x++;`:**
   - `--y`: Decrementa `y` primer (8→7) i usa el nou valor (7).
   - `y--`: Usa el valor actual de `y` (7) i després el decrementa a 6.
   - `x++`: Usa el valor actual de `x` (5) i després l'incrementa a 6.
   - z=7+7+5=19. Valors finals: x=6, y=6, z=19.

**Eixida per pantalla:**

```
x = 6
y = 6
z = 19
```

</details>

---

## 💡 Ferramentes d'ampliació (Operador ternari, .equals(), Scanner i Math.random())

⚠️ **Fora de temari (de moment):** Aquestes ferramentes les veurem en detall i de manera oficial en pròximes unitats, però és útil saber com funcionen si vols començar a explorar opcions més avançades en els teus programes.

### 1. L'operador ternari (? :)

És una forma ultracompacta d'escriure una estructura condicional (if-else) senzilla en una sola línia. Serveix per a triar entre dos valors segons si es compleix o no una condició.

**Sintaxi**: `condicio ? valor_si_cert : valor_si_fals`

Exemple:

```java
int edat = 20;
String estat = (edat >= 18) ? "Major d'edat" : "Menor d'edat";
```

Si la condició (`edat >= 18`) és certa, retorna "Major d'edat"; si no, retorna "Menor d'edat".

### 2. Comparar text amb .equals()

En Java, les cadenes de text (`String`) són objectes, no tipus primitius com `int` o `double`. Per això, mai s'ha d'utilitzar `==` per a comparar el contingut de dos textos, ja que `==` compara si estan guardats en la mateixa posició de memòria, no si tenen les mateixes lletres.

**Sintaxi**: `cadena1.equals(cadena2)`

Exemple:

```java
String operador = "+";

// Incorrecte ❌ (pot fallar segons com s'haja creat el text):
// if (operador == "+")

// Correcte ✅ (compara el contingut del text lletra per lletra):
if (operador.equals("+")) {
    System.out.println("És una suma");
}
```

### 3. Llegir dades del teclat amb Scanner i la importació (import)

Per a llegir el que l'usuari escriu en la terminal, utilitzem la classe `Scanner`. Com que no ve carregada per defecte en el motor bàsic de Java, hem de dir-li al programa on trobar-la mitjançant una instrucció `import` en la primera línia de l'arxiu.

**Importació obligatòria**: `import java.util.Scanner;` (es posa abans de declarar la classe).

Mètodes principals de lectura:

- `tecleat.nextLine()`: Llegeix una línia de text completa (`String`).
- `tecleat.nextInt()`: Llegeix un nombre enter (`int`).
- `tecleat.nextDouble()`: Llegeix un nombre decimal (`double`).

**Exemple:**

```java
import java.util.Scanner; // 1. Importem la classe de la llibreria de Java

public class ExempleScanner {
    public static void main(String[] args) {
        Scanner tecleat = new Scanner(System.in); // 2. Creem l'objecte Scanner

        System.out.print("Introdueix el teu nom: ");
        String nom = tecleat.nextLine(); // 3. Llegim el text introduït

        System.out.println("Hola, " + nom + "!");
        tecleat.close(); // Bons hàbits: tanquem el Scanner en acabar
    }
}
```

### 4. Generar nombres aleatoris amb Math.random()

La classe `Math` ve inclosa automàticament en Java (no necessita `import`). El seu mètode `Math.random()` genera un nombre decimal aleatori entre 0.0 (inclòs) i 1.0 (exclòs).

**Com adaptar-lo per a obtindre un nombre enter en un rang (ex: un dau d'1 a 6):**

- Multipliquem el resultat pel màxim del rang (`Math.random() * 6` dona de 0.0 a 5.999...).
- Fem un casting a enter (`int`) per a eliminar la part decimal (0 a 5).
- Sumem 1 per a ajustar el rang final (1 a 6).

**Exemple per a simulació de daus:**

```java
// Genera un nombre enter aleatori entre 1 i 6:
int dau = (int) (Math.random() * 6) + 1;
System.out.println("Has tret un: " + dau);
```

---

## Exercici 6: El duel de daus (Extra) (Solució)

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class DuelDaus {
    public static void main(String[] args) {
        Scanner tecleat = new Scanner(System.in);

        System.out.print("Introdueix el teu nom: ");
        String nomUsuari = tecleat.nextLine();

        int dauUsuari = (int) (Math.random() * 6) + 1;
        int dauMaquina = (int) (Math.random() * 6) + 1;

        System.out.println(nomUsuari + " en trau " + dauUsuari + ", la màquina en trau " + dauMaquina + ".");

        String veredicte = (dauUsuari > dauMaquina) ? "Guanya " + nomUsuari + "!" :
                           (dauMaquina > dauUsuari) ? "Guanya la màquina." :
                           "Empat!";

        System.out.println(veredicte);

        tecleat.close();
    }
}
```

</details>

---

## Exercici 7: Supercalculadora amb lògica (Extra) (Solució)

<details>
<summary>🔄 Solució</summary>

```java
import java.util.Scanner;

public class Supercalculadora {
    public static void main(String[] args) {
        Scanner tecleat = new Scanner(System.in);

        System.out.print("Introdueix el primer nombre: ");
        double a = tecleat.nextDouble();

        System.out.print("Introdueix el segon nombre: ");
        double b = tecleat.nextDouble();

        System.out.print("Introdueix l'operador (+, -, *, /): ");
        String op = tecleat.next();

        String resultat = op.equals("+") ? "Resultat: " + (a + b) :
                          op.equals("-") ? "Resultat: " + (a - b) :
                          op.equals("*") ? "Resultat: " + (a * b) :
                          op.equals("/") ? (b == 0 ? "Error: no es pot dividir entre 0" : "Resultat: " + (a / b)) :
                          "Operador desconegut";

        System.out.println(resultat);

        tecleat.close();
    }
}
```

</details>

---

## Exercici 8: Javadoc de campionat (Solució)

<details>
<summary>🔄 Solució</summary>

```java
/**
 * Classe que representa l'autor de la unitat i la seua motivació.
 *
 * @author Sergi Garcia
 * @version 1.0
 */
public class SobreMi {

    /**
     * Punt d'entrada: imprimeix la motivació i el nombre d'arguments rebuts.
     *
     * @param args arguments rebuts des de la línia d'ordres
     */
    public static void main(String[] args) {
        // Imprimisc primer el nom perquè el missatge tinga context
        System.out.println("Me llamo Sergi");

        /*
        Este bloc explica el programa a grans trets:
        mostrem la motivació per a estudiar programació
        i quants arguments hem rebut des de la terminal.
        */
        System.out.println("Mi motivación: convertirme en programador");
        System.out.println("He recibido " + args.length + " argumentos.");
    }
}
```

**Explicació**: En executar la comanda `javadoc SobreMi.java` en la terminal, es generaran automàticament els arxius `.html` amb la documentació tècnica del teu projecte. Si obris l'arxiu generat en el navegador, veuràs la teua classe i el teu mètode amb les etiquetes `@author`, `@version` i `@param` perfectament estructurades i formatades com la documentació oficial de Java.

</details>
