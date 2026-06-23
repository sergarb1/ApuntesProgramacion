---
title: "Butlletí 2 - Inicial Resolt: Variables i Operadors"
nav_order: 5
---
Ací estan les solucions. Però només mires si ja ho has intentat. La memòria muscular es construeix equivocant-se.

---

## Exercici 1: Declara el tipus correcte

1. `int` — l'edat cap en un int (2.147 milions és el límit, 150 no fa por)
2. `double` (o `float`) — els preus tenen decimals
3. `long` — 8.000.000.000 no cap en un int (2.147.483.647 és el topall)
4. `boolean` — només dos valors: true o false
5. `char` — una sola lletra amb cometes simples
6. `double` — decimals per a la temperatura

> **💡 Explicació:** Cada tipus té una grandària i un propòsit. Usar `int` per a tot és com portar sempre un camió per si de cas t'has de mudar. `byte` per a l'edat, `short` per a la població d'un poble, `int` per a quasi tot, `long` per a coses astronòmiques, `double` per a decimals, `boolean` per a sí/no, `char` per a una lletra. La clau és triar el tipus adequat: ni un microbús per a dues persones, ni un Smart per a una família de 5.

---

## Exercici 2: Què imprimeix?

```java
public class Operaciones {
    public static void main(String[] args) {
        int a = 10;
        int b = 3;
        System.out.println(a / b);
        System.out.println(a % b);
        System.out.println((double) a / b);
    }
}
```

**Eixida:**
```
3
1
3.3333333333333335
```

> **💡 Explicació:** `10 / 3` amb enters dona 3 (es truncen els decimals). `10 % 3` dona 1 (el residu de la divisió). `(double) a / b` converteix `a` a double (10.0) i aleshores la divisió dona 3.333... El `(double)` davant de `a` és un *casting*: li dius a Java "confia en mi, tracta això com a decimal encara que siga enter". És com posar-li ulleres a un miop: de sobte veu els decimals.

---

## Exercici 3: Troba l'error

```java
public class Errores {
    public static void main(String[] args) {
        int 1numero = 10;            // ERROR 1
        float precio = 19.99;        // ERROR 2
        System.out.println(1numero + precio);
    }
}
```

**Correcció:**
```java
public class Errores {
    public static void main(String[] args) {
        int numero1 = 10;
        float precio = 19.99f;
        System.out.println(numero1 + precio);
    }
}
```

> **💡 Explicació:** Error 1: les variables no poden començar amb número. `1numero` és il·legal. `numero1` és legal. És com les matrícules dels cotxes: poden acabar en número però no començar amb ell. Error 2: els decimals en Java són `double` per defecte. Per a assignar-los a un `float` necessites afegir `f` al final: `19.99f`. Sense la `f`, Java es queixa perquè estàs ficant un double en una caixa float i es podria perdre precisió. És com intentar ficar una botella gran en un got xicotet: alguna cosa es derramarà.

---

## Exercici 4: L'intercanvi

```java
public class Intercambio {
    public static void main(String[] args) {
        int a = 5;
        int b = 10;

        System.out.println("Abans: a = " + a + ", b = " + b);

        int temp = a;
        a = b;
        b = temp;

        System.out.println("Després: a = " + a + ", b = " + b);
    }
}
```

**Eixida:**
```
Abans: a = 5, b = 10
Després: a = 10, b = 5
```

> **💡 Explicació:** Necessites una variable temporal `temp` per a no perdre el valor de `a`. Si fas `a = b` directament, perds el 5. És com quan vols intercanviar el contingut de dos gots: necessites un tercer got buit. Si abocares el de vi en el d'aigua sense buidar abans el d'aigua, tindries vi amb aigua. La variable temporal és eixe tercer got.

---

## Exercici 5: Escriu aquest programa

```java
public class AreaCirculo {
    public static void main(String[] args) {
        final double PI = 3.1416;
        double radio = 7.5;

        double area = PI * radio * radio;
        double perimetro = 2 * PI * radio;

        System.out.println("Àrea: " + area);
        System.out.println("Perímetre: " + perimetro);
    }
}
```

**Eixida:**
```
Àrea: 176.715
Perímetre: 47.124
```

> **💡 Explicació:** `final` fa que PI siga constant. No podràs canviar-la després. Intenta posar `PI = 4;` després i el compilador et saltarà al coll. L'àrea del cercle és PI per radi al quadrat. El perímetre (o circumferència) és 2 per PI per radi. `Math.PI` existeix com a constant més precisa (3.141592653589793), però ací usem la nostra. La gràcia de `final` és que li dius a Java i a altres programadors: "açò no es toca, ni que vinga el mismíssim Bill Gates a demanar-t'ho".

---

## Exercici 6: AceptaElReto 149 — San Fermines

```java
import java.util.Scanner;

public class Problema149 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (sc.hasNextInt()) {
            int n = sc.nextInt();
            int max = 0;
            for (int i = 0; i < n; i++) {
                int vel = sc.nextInt();
                if (vel > max) max = vel;
            }
            System.out.println(max);
        }
    }
}
```

> **💡 Explicació:** El problema de San Fermines et dona diverses línies, cadascuna amb un número N seguit de N velocitats. Has d'imprimir la velocitat màxima de cada cas. Usem `while (sc.hasNextInt())` perquè no sabem quantes línies hi ha. Llegim N, després N números amb un bucle, i ens quedem amb el màxim. El truc és que `max` comença en 0 (les velocitats són positives). Si hi haguera velocitats negatives, caldria començar amb `Integer.MIN_VALUE`. Però en San Fermines tots corren cap avant, no com alguns que corren cap arrere.

---

## Exercici 7: CodeWars — Even or Odd

```java
public class EvenOrOdd {
    public static String evenOrOdd(int number) {
        return number % 2 == 0 ? "Even" : "Odd";
    }
}
```

> **💡 Explicació:** L'operador `%` et dona el residu de la divisió. Si un número és parell, `numero % 2` dona 0. Si és senar, dona 1. El ternari `? :` és un if-else en una línia: `condició ? valorSiTrue : valorSiFalse`. Torna "Even" si el residu és 0, "Odd" si no. Una línia. Elegant. Com un esmòquing per al teu codi. També ho podries fer amb `if-else`, però el ternari queda més net. CodeWars premia l'elegància, no les 15 línies per a una tonteria.
