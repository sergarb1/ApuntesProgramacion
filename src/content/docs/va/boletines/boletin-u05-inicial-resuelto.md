---
title: Butlletí U05 — Inicial Resolt
description: Els mateixos exercicis que el butlletí inicial, amb solucions
---

# 📝 Butlletí U05 — Inicial (Resolt)

> Les solucions estan ocultes en cada exercici. No facis trampa: primer intenta-ho de veritat.

---

## Exercici 1: La salutació oficial

<details>
<summary>🔄 Solució</summary>

```java
public class Saludo {
    public static void saludar() {
        System.out.println("¡Hola, Java!");
    }

    public static void main(String[] args) {
        saludar();
        saludar();
        saludar();
    }
}
```

Eixida:

```
¡Hola, Java!
¡Hola, Java!
¡Hola, Java!
```

La recepta s'escriu una vegada, fora del `main`, i s'usa tres vegades. Eix exactament el negoci dels mètodes: escriure una vegada, cridar les vegades que faça falta.

</details>

---

## Exercici 2: Què passa? — la variable fantasma

<details>
<summary>🔄 Solució</summary>

El programa no compila perquè `extra` és una **variable local** de `sumar()`: el seu àmbit acaba en el claudàtor que tanca el mètode. En la línia `System.out.println(extra);` el compilador escup un `cannot find symbol` (no troba el símbol), perquè des de `main` eixa variable mai ha existit.

Com arreglar-ho (qualsevol de les dos):

- Imprimir `extra` **dins** de `sumar()`, on sí viu.
- Passar-la com a paràmetre o tornar-la amb `return` si `main` la necessita.

La lliçó: cada mètode és una casa amb porta. El que es deixa dins no ix sense invitació.

</details>

---

## Exercici 3: La fitxa de presentació

<details>
<summary>🔄 Solució</summary>

```java
public class Ficha {
    public static void presentar(String nombre, int edad) {
        System.out.println("Em dic " + nombre + " i tinc " + edad + " anys.");
    }

    public static void main(String[] args) {
        presentar("Ana", 20);
        presentar("Luis", 15);
    }
}
```

Eixida:

```
Em dic Ana i tinc 20 anys.
Em dic Luis i tinc 15 anys.
```

Un mateix mètode, dos crides, dos persones diferents: els paràmetres són les entrades que fan genèric el mètode. Sense ells hauries de copiar el `println` dos vegades.

</details>

---

## Exercici 4: El primer `return`

<details>
<summary>🔄 Solució</summary>

```java
public class Suma {
    public static int sumar(int a, int b) {
        return a + b;
    }

    public static void main(String[] args) {
        int total = sumar(3, 4);
        System.out.println("3 + 4 = " + total);
        System.out.println("10 + 20 = " + sumar(10, 20));
    }
}
```

Eixida:

```
3 + 4 = 7
10 + 20 = 30
```

`return` talla el mètode i entrega el valor a qui l'ha cridat. El primer el guardes en `total`; el segon l'uses directament dins del `println`. Imprimir és cosa de qui rep, no de qui torna.

</details>

---

## Exercici 5: Doble, si us plau

<details>
<summary>🔄 Solució</summary>

```java
public class Doble {
    public static int calcularDoble(int n) {
        return n * 2;
    }

    public static void mostrarDoble(int n) {
        System.out.println("El doble de " + n + " és " + n * 2);
    }

    public static void main(String[] args) {
        int doble = calcularDoble(6);
        System.out.println(doble);
        mostrarDoble(6);
    }
}
```

Eixida:

```
12
El doble de 6 és 12
```

`calcularDoble` torna un `int` que pots guardar, comparar o usar en un altre càlcul. `mostrarDoble` és `void`: no torna res, només imprimeix. La regla d'or: el que calcula no imprimeix, i el que imprimeix no calcula.

</details>

---

## Exercici 6: Què imprimeix? — el viatge d'anada i tornada

<details>
<summary>🔄 Solució</summary>

```
abans
sumant...
total: 7
```

L'ordre és fidel al viatge: el `main` imprimeix `abans`, es para en `sumar(3, 4)`, salta al mètode (que imprimeix `sumant...` i torna `7`), torna al `main` amb el resultat i continua amb l'últim `println`. Si et vas saltar `sumant...`, recorda: res s'executa «en paral·lel»; Java va de dalt a baix i d'anada i tornada, sense atalls.

</details>

---

## Exercici 7: Pare o senar?

<details>
<summary>🔄 Solució</summary>

```java
public class ParOImpar {
    public static boolean esPar(int n) {
        return n % 2 == 0;
    }

    public static void main(String[] args) {
        if (esPar(7)) {
            System.out.println("7 és senar");
        } else {
            System.out.println("7 és pare");
        }
        if (esPar(12)) {
            System.out.println("12 és pare");
        } else {
            System.out.println("12 és senar");
        }
    }
}
```

Eixida:

```
7 és senar
12 és pare
```

`esPar` torna un `boolean`, així que pot viure directament en la condició del `if`. És la manera elegant de preguntar: sense guardar el resultat en una variable intermèdia.

</details>

---

## Exercici 8: La porta de l'edat

<details>
<summary>🔄 Solució</summary>

```java
public class Puerta {
    public static boolean mayorDeEdad(int edad) {
        return edad >= 18;
    }

    public static void main(String[] args) {
        System.out.println("15: " + (mayorDeEdad(15) ? "entra" : "no entra"));
        System.out.println("18: " + (mayorDeEdad(18) ? "entra" : "no entra"));
        System.out.println("30: " + (mayorDeEdad(30) ? "entra" : "no entra"));
    }
}
```

Eixida:

```
15: no entra
18: entra
30: entra
```

La regla viu en un sol lloc (`mayorDeEdad`) i s'aplica a les tres edats. Si demà el límit canvia a 21, toques **un** `return` i tot el programa se n'assabenta. Eixe és el poder de no repetir la lògica.

</details>

---

## Exercici 9: CodeWars — Century From Year

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static int century(int year) {
        return (year - 1) / 100 + 1;
    }
}
```

Dos camins:

- `(year - 1) / 100 + 1`: el `-1` fa que l'any 100 caiga en el segle 1 i el 101 en el 2.
- `Math.ceil(year / 100.0)`: arredoneix cap amunt el resultat decimal (`1705 / 100.0` és `17.05`, i `Math.ceil` el puja a `18`). Ojo: si divideixes en enter (`year / 100`) perds el resta i l'any 1601 cauria en el segle 16.

Un mètode, dues línies, zero bucles: de vegades la millor solució és la que no es complica.

</details>
