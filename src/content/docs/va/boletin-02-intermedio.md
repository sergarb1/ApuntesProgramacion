---
title: "Butlletí 2 - Intermedi: Variables i Operadors"
nav_order: 7
---
De menys a més. De ⭐ a ⭐⭐⭐. De variables senzilles a operacions que et faran esbotzar.

---

## ⭐ Exercici 1: Calculadora de propines

Escriu un programa que calcule quant deixar de propina en un restaurant. Declara:

- `double totalCuenta = 45.50;`
- `int porcentajePropina = 15;` (percentatge, sense el símbol)

Calcula la propina (`totalCuenta * porcentajePropina / 100`) i el total final (`totalCuenta + propina`). Mostra-ho tot amb 2 decimals aproximats.

Eixida esperada:
```
Total compte: 45.5€
Propina (15%): 6.825€
Total a pagar: 52.325€
```

---

## ⭐ Exercici 2: Conversor dòlar-euro

Declara `final double TASA_CAMBIO = 0.92;` (1 dòlar = 0.92 euros). Declara `double dolares = 100.0;` i calcula el seu equivalent en euros. També fes la conversió inversa: donat `double euros = 50.0;`, calcula quants dòlars són.

Mostra:
```
100.0$ són 92.0€
50.0€ són 54.34782608695652$
```

---

## ⭐⭐ Exercici 3: Què imprimeix? — el casting traïdor

Sense executar, escriu l'eixida exacta:

```java
public class CastingTraidor {
    public static void main(String[] args) {
        int a = 7;
        int b = 2;
        double resultado1 = a / b;
        double resultado2 = (double) a / b;
        double resultado3 = a / (double) b;

        System.out.println(resultado1);
        System.out.println(resultado2);
        System.out.println(resultado3);
        System.out.println(3 + 4 * 2.0);
        System.out.println((int) (3.7 + 2.3));
    }
}
```

Fixat bé en on està el casting i en quin moment s'aplica la divisió entera.

---

## ⭐⭐ Exercici 4: Interés compost (sense bucle)

Declara `final double CAPITAL_INICIAL = 1000.0;`, `final double TASA = 0.05;` (5% anual) i `int anios = 3;`. Calcula el capital final després de 3 anys usant la fórmula de l'interés compost SENSE bucles:

```
capitalFinal = capitalInicial * (1 + tasa)^anios
```

Per a la potència, usa `Math.pow(base, exponente)`. Mostra el capital any a any:

```
Any 0: 1000.0€
Any 1: 1050.0€
Any 2: 1102.5€
Any 3: 1157.625€
```

Per a mostrar cada any, necessitaràs calcular `Math.pow(1 + TASA, i)` per a cada valor de `i` de 1 a 3... però sense bucle. Crea tres variables diferents.

---

## ⭐⭐⭐ Exercici 5: L'enigma del post-increment

Sense executar, determina el valor de cada variable després d'executar aquest codi. Escriu el pas a pas.

```java
public class EnigmaIncremento {
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

Pista: fes una taula amb els valors de x, y després de cada operació. `x++` usa x i després incrementa; `++x` incrementa i després usa x.

---

## ⭐⭐⭐ Exercici 6: CodeWars — Convert boolean values to strings 'Yes' or 'No'

Resol la kata **"Convert boolean values to strings 'Yes' or 'No'"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/53369039d7ab3ac506000467).

Completa el mètode `public static String boolToWord(boolean b)` que torne `"Yes"` si rep `true` i `"No"` si rep `false`. Es pot fer en una línia amb l'operador ternari.

---

## ⭐⭐⭐ Exercici 7: AceptaElReto — 114 Últim dígit del factorial

Resol el problema **114 — Últim dígit del factorial** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=114).

Donat un número N (0 ≤ N ≤ 1.000.000), calcula l'últim dígit de N! (factorial de N). Pista: no necessites calcular el factorial sencer. Què passa amb l'últim dígit quan multipliques per 10? I quan N ≥ 5? Observa que 5! = 120, 6! = 720... a partir de 5, el factorial sempre acaba en 0.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 114 — Últim dígit del factorial | Fàcil |
| AceptaElReto | 140 — Suma de dígits | Mitjà |
| AceptaElReto | 152 — Números de parells | Fàcil |
| CodeWars | Even or Odd (8 kyu) | Principiant |
| CodeWars | Opposite number (8 kyu) | Principiant |
| CodeWars | Convert boolean to Yes/No (8 kyu) | Principiant |
