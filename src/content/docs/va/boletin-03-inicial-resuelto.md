---
title: "Butlletí 3 - Inicial Resolt: Estructures de Control"
nav_order: 8
---
Les solucions estan ací. Però només les necessites si ja has sudat un poc. La suor programa millor que les solucions.

---

## Exercici 1: Què imprimeix este if-else?

```java
public class QueImprime {
    public static void main(String[] args) {
        int edad = 17;
        boolean conPadres = true;

        if (edad >= 18) {
            System.out.println("Entrada libre");
        } else if (conPadres) {
            System.out.println("Pasas con tus viejos");
        } else {
            System.out.println("A casa");
        }
    }
}
```

**Resposta:** "Pasas con tus viejos"

> **💡 Explicació:** `edad >= 18` és `false` (en té 17), així que no entra al primer `if`. Després avalua `conPadres` que és `true`, per tant entra al `else if` i imprimeix "Pasas con tus viejos". El `else` final no s'executa mai perquè ja va entrar al `else if`. Java avalua les condicions en ordre i es queda amb la PRIMERA que siga `true`. Com un semàfor: si el primer està verd, passes; si no, mires el següent. No te'n saltes cap, però tampoc mires més enllà del que ja està verd.

---

## Exercici 2: Completa el switch

```java
int dia = 3;
String nombreDia;

switch (dia) {
    case 1:
        nombreDia = "Lunes";
        break;
    case 2:
        nombreDia = "Martes";
        break;
    case 3:
        nombreDia = "Miércoles";
        break;
    default:
        nombreDia = "Desconocido";
}
System.out.println(nombreDia);
```

**Amb breaks:** Imprimeix "Miércoles".

**Sense breaks (fall-through):** Imprimeix "Miércoles". Però si `dia = 1`, sense breaks imprimiria "LunesMartesMiércoles" (tot seguit!). Amb `dia = 2` sense breaks: "MartesMiércoles".

> **💡 Explicació:** `break` és la instrucció de "eixir del switch". Si no el poses, el codi "cau" al següent `case` (fall-through). És com si les escales no tingueren descansets: baixes d'una tirada fins al final. En el nostre exemple, amb `dia = 3`, el `break` del `case 3` frena la caiguda. Però en `case 1` i `case 2`, sense `break`, el programa continuaria executant els `case` següents fins a trobar un `break` o arribar al `default`.

---

## Exercici 3: Troba l'error (bucle infinit)

```java
public class BucleInfinito {
    public static void main(String[] args) {
        int i = 1;
        while (i <= 5) {
            System.out.println("Vuelta " + i);
        }
    }
}
```

**Error:** Falta `i++` dins del bucle. `i` sempre val 1, la condició `i <= 5` sempre és `true`.

**Corregit:**
```java
public class BucleCorregido {
    public static void main(String[] args) {
        int i = 1;
        while (i <= 5) {
            System.out.println("Vuelta " + i);
            i++;
        }
    }
}
```

> **💡 Explicació:** Sense `i++`, la variable de control no canvia mai. És com un gos perseguint-se la cua: no para mai. El bucle `while` només comprova la condició. Si sempre es compleix, el bucle és etern. `i++` és el que fa que `i` augmente fins a 6, moment en què `i <= 5` és fals i el bucle acaba. Sempre, SEMPRE, assegura't que la variable de control s'actualitze dins del bucle. És la primera regla dels bucles: "no oblides actualitzar la condició".

---

## Exercici 4: Escriu este programa (while)

```java
import java.util.Scanner;

public class PositivoNegativo {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numero;

        System.out.println("Introduce números (0 para salir):");
        numero = sc.nextInt();
        while (numero != 0) {
            if (numero > 0) {
                System.out.println(numero + " es positivo");
            } else {
                System.out.println(numero + " es negativo");
            }
            numero = sc.nextInt();
        }
        System.out.println("Fin del programa");
        sc.close();
    }
}
```

> **💡 Explicació:** Llegim el primer nombre abans del bucle (açò es diu "lectura anticipada"). Després, mentre no siga 0, avaluem si és positiu o negatiu, i tornem a llegir. Quan l'usuari introduïx 0, el bucle acaba. Podríem usar un `do-while` per a no repetir la lectura, però així és més clar. És com un porter que pregunta "quants anys tens?" fins que li dius 0 i aleshores et deixa passar... espera, això no té sentit. Però el codi sí.

---

## Exercici 5: El for de tota la vida

```java
public class SumaFor {
    public static void main(String[] args) {
        int suma = 0;
        for (int i = 1; i <= 100; i++) {
            suma += i;
        }
        System.out.println("Suma del 1 al 100: " + suma);
    }
}
```

**Eixida:** 5050

> **💡 Explicació:** El bucle `for` és perfecte quan saps exactament quantes vegades repetir. Ací sabem que anem d'1 a 100. La variable `i` comença en 1, s'incrementa d'1 en 1, i en cada volta se suma a `suma`. Al final, `suma` conté 5050. Hi ha una fórmula matemàtica: `n*(n+1)/2` = `100*101/2 = 5050`. Però en programació, el bucle està bé. La història conta que Gauss va descobrir esta fórmula de xiquet per a fer el càlcul més ràpid. Tu estàs aprenent a programar, no a ser Gauss. Encara que si vols ser Gauss, també val.

---

## Exercici 6: AceptaElReto 200 — Aburrimiento en las aulas

```java
import java.util.Scanner;

public class Problema200 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int num = sc.nextInt();
        while (num != 0) {
            int a = 5 * num * num + 4;
            int b = 5 * num * num - 4;
            int raizA = (int) Math.sqrt(a);
            int raizB = (int) Math.sqrt(b);

            if (raizA * raizA == a || raizB * raizB == b) {
                System.out.println("Fibonacci");
            } else {
                System.out.println("No fibonacci");
            }
            num = sc.nextInt();
        }
    }
}
```

> **💡 Explicació:** La propietat matemàtica diu: un nombre és part de la seqüència de Fibonacci si i només si `(5n² + 4)` o `(5n² - 4)` és un quadrat perfecte. Per a comprovar si alguna cosa és quadrat perfecte, calculem l'arrel quadrada, la truncuem a enter, i elevem al quadrat. Si coincidix amb l'original, és quadrat perfecte. Exemple: per a n=5: 5*25+4=129 (no és quadrat), 5*25-4=121=11² → Fibonacci! Efectivament, 5 està en la seqüència. Per a n=4: 5*16+4=84 (no), 5*16-4=76 (no) → No fibonacci. El 4 no està. El `while` seguix llegint nombres fins que s'introduïx un 0.

---

## Exercici 7: CodeWars — Century From Year

```java
public class CenturyFromYear {
    public static int century(int number) {
        return (number + 99) / 100;
    }
}
```

> **💡 Explicació:** Per a calcular el segle d'un any, sumem 99 i dividim entre 100. Any 1: (1+99)/100 = 1. Any 100: (100+99)/100 = 1. Any 101: (101+99)/100 = 2. Any 2000: (2000+99)/100 = 20. Any 2001: (2001+99)/100 = 21. La lògica: el segle 1 abasta de l'any 1 al 100. En sumar 99, desplacem el rang perquè la divisió entera funcione. És un truc matemàtic que evita usar `if` o `Math.ceil()`. Simple, elegant, i et fa quedar bé en els sopars de Nadal quan algú pregunta "en quin segle estem?".
