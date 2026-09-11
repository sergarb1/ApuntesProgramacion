---
title: "Butlletí U01 — Avançat"
description: "Exercicis de dificultat progressiva per a exprimir la unitat"
---

# 📝 Butlletí U01 — Avançat

> Sense solucions. Sense presses. Amb un editor de text i moltes ganes de compilar. Això només comença. Comenta les solucions al fòrum i intenta ajudar als companys a què milloren les seues capacitats com a programador.

---

## Exercici 1: Calculadora de propines

Escriu un programa que calcule quant deixar de propina en un restaurant. Declara:

- `double totalCompte = 45.50;`
- `int percentatgePropina = 15;` (el percentatge, sense el símbol)

Calcula la propina (`totalCompte * percentatgePropina / 100`) i el total final (`totalCompte + propina`). Mostra els tres valors.

**Pista**: compte amb la divisió: `percentatgePropina / 100` amb enters dona 0. Multiplica primer i divideix després, o usa `100.0`.

---

## Exercici 2: Conversor dòlar-euro

Declara `final double TAXA_CANVI = 0.92;` (1 dòlar = 0.92 euros). Declara `double dolars = 100.0;` i calcula el seu equivalent en euros. També fes la conversió inversa: donat `double euros = 50.0;`, calcula quants dòlars són.

**Mostra:**

```
100.0$ són 92.0€
50.0€ són 54.347826086956516$
```

**Pista**: per a passar d'euros a dòlars divideixes entre la taxa: `euros / TAXA_CANVI`.

---

## Exercici 3: Què imprimeix? — el casting traïdor

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

**Pista**: fixa't bé en on està el càsting i en quin moment s'aplica la divisió entera. En `resultat1`, ¿la divisió es fa abans o després de guardar en el `double`?

---

## Exercici 4: Interés compost (sense bucle)

Declara `final double CAPITAL_INICIAL = 1000.0;`, `final double TAXA = 0.05;` (5% anual), `int anys = 3;`. Calcula el capital final després de 3 anys usant la fórmula de l'interés compost SENSE bucles:

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

💡 **Compte amb la precisió:** en l'any 3 el teu programa pot imprimir `1157.6250000000002` en lloc de `1157.625` per la coma flotant binària dels `double` (ho veurem a «Atreveix-te a pensar»). No és un error del teu codi.

**Pista**: per a mostrar cada any sense bucle, crea tres variables distintes (`capital1`, `capital2`, `capital3`) i usa `Math.pow(1 + TAXA, i)` amb `i` valent 1, 2 i 3.

---

## Exercici 5: L'enigma del post-increment

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

**Pista**: fes una taula en un full amb els valors de `x` i `y` després de cada operació. `x++` usa i després incrementa; `++x` incrementa i després usa.

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

## Exercici 6: El duel de daus (Extra)

Escriu un programa que llance un dau per a l'usuari (li demana el nom amb `Scanner`) i un altre per a la màquina (amb `Math.random()`). Guanya qui traga més. Mostra les dues tirades i el guanyador amb un missatge tipus:

```
Anna en trau 4, la màquina en trau 6.
Guanya la màquina.
```

**Pista**: combina `nextLine()` (nom), `(int)(Math.random() * 6) + 1` (daus) i un ternari encadenat per al veredicte. Compte amb l'empat.

---

## Exercici 7: Supercalculadora amb lògica (Extra)

Escriu un programa que llegisca dos nombres amb `Scanner` (`double`) i un caràcter d'operació (`+`, `-`, `*`, `/`) amb `next()`.

Segons l'operador, mostra el resultat. Si l'operador és `/` i el segon nombre és 0, mostra "Error: no es pot dividir entre 0". Per a qualsevol altre caràcter, mostra "Operador desconegut".

**Pista**: calcula els resultats possibles en variables i tria amb ternaris encadenats o amb lògica. Pots comprovar la divisió entre 0 amb `op.equals("/") && b == 0`.

---

## Exercici 8: Javadoc de campionat

Escriu una classe anomenada `SobreMi.java` que mostre per pantalla el teu nom, la teua motivació per a programar i quants arguments ha rebut per la línia d'ordres (`args.length`).

El programa ha d'incloure els tres tipus de comentaris de Java:

- Comentari d'una línia (`//`): Explica per què s'imprimeix primer el nom.
- Comentari de bloc (`/* ... */`): Un resum breu de la funció del programa.
- Comentaris Javadoc (`/** ... */`): Documentació formal per a la classe i per al mètode main, utilitzant les etiquetes `@author`, `@version` i `@param`.

**Tasca extra:** Executa la comanda `javadoc SobreMi.java` en la terminal (o des de les opcions de Java en VS Code) per a generar la documentació en HTML i obri l'arxiu `index.html` en el teu navegador.
