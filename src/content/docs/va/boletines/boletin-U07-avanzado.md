---
title: Butlletí U07 — Avançat
description: Exercicis de dificultat progressiva per a esprémer la unitat
---

# 📝 Butlletí U07 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resisteix-te a mirar-la).

---

## ⭐ Exercici 1: La biblioteca

Escriu una classe `Llibre` amb els atributs `String titol`, `String autor` i `int pagines`. Afegeix un mètode `void mostrarInfo()` que imprimisca:

```
El Quixot, de Miguel de Cervantes (863 pàgines)
```

Crea en el `main` dos llibres distints i mostra'n la informació.

**Pista:** tres atributs, un constructor amb tres paràmetres i `this.` tres vegades. El mètode usa els atributs per a construir la frase.

---

## ⭐ Exercici 2: El rectangle que raona

Escriu una classe `Rectangle` amb els atributs `double ample` i `double alt`. Afegeix:
- `double calcularArea()` → `ample * alt`
- `double calcularPerimetre()` → `2 * (ample + alt)`
- `boolean esQuadrat()` → `true` si `ample == alt`

Crea un rectangle de 4 x 4 i un altre de 5 x 8 i prova els tres mètodes en tots dos.

**Pista:** els tres mètodes tornen valors amb `return`. `esQuadrat()` torna el resultat d'una comparació amb `==`.

---

## ⭐ Exercici 3: El compte bancari blindat

Escriu una classe `CompteBancari` amb els atributs `String titular` i `double saldo`. Afegeix:
- `void ingressar(double quantitat)` → suma al saldo.
- `void retirar(double quantitat)` → resta al saldo **només si** `quantitat <= saldo`; si no, imprimix `"Saldo insuficient"`.
- `void mostrar()` → imprimix `"Titular: X | Saldo: Y €"`.

Crea un compte amb 100 €, retira 30 €, intenta retirar 200 € i mostra el saldo final.

**Pista:** dins de `retirar`, un `if (quantitat <= this.saldo)` protegix el saldo de quedar-se en negatiu. Eixe `if` és la diferència entre un compte i un clot.

---

## ⭐⭐ Exercici 4: L'hora que es corregeix sola

Escriu una classe `Hora` amb els atributs `int hora`, `int minut` i `int segon`. El constructor ha de validar: si els valors no són vàlids (hora entre 0 i 23, minut i segon entre 0 i 59), s'inicialitzen a 0. Afegeix el mètode `void incrementarSegon()` que suma 1 segon gestionant els arrossegaments: si arriba a 60 segons passa a 0 i suma un minut, i així amb els minuts i les hores.

Crea una `Hora(23, 59, 59)`, crida `incrementarSegon()` i mostra `00:00:00`.

**Pista:** la validació és un `if` gran en el constructor. L'arrossegament són tres `if` encadenats, de segon a minut a hora. Per a mostrar amb dos dígits, imprimix `"0" + valor` si és menor que 10.

---

## ⭐⭐ Exercici 5: Què imprimeix? — el ball de referències

Sense executar, escriu l'eixida exacta:

```java
public class Baile {
    public static void main(String[] args) {
        Punto a = new Punto(3, 4);
        Punto b = a;
        b.x = 10;
        System.out.println("a.x = " + a.x);

        Punto c = new Punto(1, 1);
        cambiar(c);
        System.out.println("c.x = " + c.x);
    }

    static void cambiar(Punto p) {
        p.x = 99;
        p = new Punto(50, 50);
    }
}

class Punto {
    int x;
    int y;

    public Punto(int x, int y) {
        this.x = x;
        this.y = y;
    }
}
```

**Pista:** `b = a` no copia l'objecte: copia la referència. Quan `cambiar(c)` rep `c`, el paràmetre `p` és una *còpia* de la referència, així que modificar `p.x` sí que es nota, però `p = new Punto(...)` només reassigna el paràmetre local.

---

## ⭐⭐ Exercici 6: El correu que s'encadena

Escriu una classe `Email` amb els atributs `String remitent`, `String destinatari` i `String assumpte`. Crea **tres constructors sobrecarregats**:
- `Email(String remitent, String destinatari, String assumpte)` → el complet.
- `Email(String remitent, String destinatari)` → assumpte per defecte `"(sense assumpte)"`.
- `Email(String remitent)` → destinatari `"(sense destí)"` i assumpte `"(sense assumpte)"`.

Usa `this(...)` per a encadenar i evitar repetir codi. Afegeix `void mostrar()` que imprimisca les tres dades.

**Pista:** el constructor d'un paràmetre crida el de dos, i el de dos crida el de tres. Amb `this(...)` escrius l'assignació completa una sola vegada, en el constructor de tres paràmetres.

---

## ⭐⭐ Exercici 7: La fracció que es simplifica

Escriu una classe `Fraccio` amb els atributs `int numerador` i `int denominador`. Afegeix:
- Constructor que valide: si `denominador == 0`, s'usa `1`.
- `Fraccio sumar(Fraccio altra)` → torna una fracció nova amb `(a.num * b.den + b.num * a.den) / (a.den * b.den)`.
- `void simplificar()` → dividix numerador i denominador pel seu màxim comú divisor (MCD).

Crea `1/2` i `1/3`, suma-les i simplifica el resultat.

**Pista:** per al MCD usa l'algoritme d'Euclides (restes o mòduls) o `Math.abs` amb un bucle. `simplificar()` no torna res: modifica `this`.

---

## ⭐⭐⭐ Exercici 8: CodeWars — Building blocks

Resol la kata **"Building blocks"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/55b75fcf67e558d3750000a3).

Crea la classe `Block` amb un constructor que reba les tres dimensions (com `int[]` de 3 o com 3 enters) i els mètodes:
- `int getWidth()`, `int getLength()`, `int getHeight()`
- `int getVolume()` → `width * length * height`
- `int getSurfaceArea()` → `2 * (w*l + w*h + l*h)`

**Pista:** guarda les tres dimensions en atributs amb `this` i deixa que els getters simplement les tornen. La superfície és la suma de les cares per dos.

---

## ⭐⭐⭐ Exercici 9: AceptaElReto — 100 Constante de Kaprekar

Resol el problema **100 — Constante de Kaprekar** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=100).

L'entrada comença amb un nombre de casos. Per a cada cas de prova (un nombre de 4 xifres), aplica la rutina de Kaprekar: ordena les seues xifres de major a menor i de menor a major, resta, i repetix fins a arribar a 6174. Imprimix el nombre d'iteracions necessàries. Per als repdigits (1111, 2222...) imprimix `8`. Per a 6174 imprimix `0`.

**Exemple:**

```
3524 → 5432 - 2345 = 3087 → 8730 - 0378 = 8352 → 8532 - 2358 = 6174
```

Resultat: **3** iteracions.

**Pista:** passa el nombre a `String`, usa `Arrays.sort` sobre l'array de caràcters per a ordenar-los, i construïx el major i el menor. Un `while (n != 6174)` compta les voltes. Esta és l'oportunitat perfecta per a practicar una classe `Numero` amb mètodes com `ordenarDigits()`.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 100 — Constante de Kaprekar | Mitjana |
| AceptaElReto | 148 — Nochevieja | Fàcil |
| CodeWars | Object Oriented Piracy (8 kyu) | Principiant |
| CodeWars | Building blocks (7 kyu) | Aficionat |
| CodeWars | FIXME: Get Full Name (7 kyu) | Aficionat |
