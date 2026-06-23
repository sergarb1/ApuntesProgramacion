---
title: "Butlletí 1 - Intermedi: Introducció"
nav_order: 4
---
Exercicis de dificultat progressiva. Els ⭐ són per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar.

---

## ⭐ Exercici 1: ASCII art amb prints

Escriu un programa que dibuixe esta figura usant combinacions de `System.out.print` i `System.out.println`:

```
  *
 ***
*****
 ***
  *
```

Has d'usar exactament **5 línies de codi** (una per cada fila), combinant `print` i `println` sense usar bucles. Pensa quan necessites salt de línia i quan no.

---

## ⭐ Exercici 2: Sense executar — seqüències d'escapament

Què imprimeix exactament este programa? Escriu l'eixida caràcter per caràcter.

```java
public class EscapeRoom {
    public static void main(String[] args) {
        System.out.println("Java\n\tmola\n\"mucho\"");
        System.out.println("C:\\carpeta\\archivo.java");
    }
}
```

Les seqüències `\n` (nova línia), `\t` (tabulador), `\"` (cometa literal) i `\\` (barra invertida literal) són les protagonistes.

---

## ⭐⭐ Exercici 3: El rellotge de mil·lisegons

`System.currentTimeMillis()` torna el nombre de mil·lisegons des de l'1 de gener de 1970 (l'"epoch" d'Unix). Escriu un programa que:

1. Capture el moment actual amb `long inicio = System.currentTimeMillis();`
2. Faça una pausa artificial (un bucle que conte fins a 100.000.000 per a perdre temps)
3. Capture el moment després amb `long fin = System.currentTimeMillis();`
4. Mostre quants mil·lisegons han passat

No et preocupes si el temps varia cada vegada que l'executes: depén de la velocitat del teu ordinador.

---

## ⭐⭐ Exercici 4: Comptador d'arguments

Escriu un programa anomenat `ContadorArgs` que reba arguments des de la línia de comandaments i mostre:

- Quants arguments es van rebre
- El primer argument (si existix)
- L'últim argument (si existix)

Si no es reben arguments, ha de mostrar: "No es van rebre arguments. Programa cancel·lat per falta de dades."

Exemple d'execució:
```
> java ContadorArgs hola mundo cruel
Argumentos recibidos: 3
Primer argumento: hola
Último argumento: cruel
```

---

## ⭐⭐⭐ Exercici 5: L'edat còsmica

La Terra tarda 365.25 dies a orbitar el Sol. Mercuri tarda 87.97 dies. Escriu un programa que, usant constants `final`:

1. Declare `final double DIAS_TIERRA = 365.25;`
2. Declare `final double DIAS_MERCURIO = 87.97;`
3. Emmagatzeme en una variable `int edadTerrestre = 20` (la teua edat en anys terrestres)
4. Calcule els anys que tindries en Mercuri (dividix els dies terrestres viscuts entre els dies de Mercuri)
5. Mostre: "A la Terra tinc X anys. A Mercuri tindria Y anys."

Per a calcular els dies viscuts a la Terra: `diasVividos = edadTerrestre * DIAS_TIERRA`.

---

## ⭐⭐⭐ Exercici 6: CodeWars — Grasshopper - Summation

Resol la kata **"Grasshopper - Summation"** (8 kyu) en [CodeWars](://www.codewars.com/kata/55d24f55d7dd296eb9000030).

Suma tots els números de l'1 fins a n. Si n = 4, torna 1+2+3+4 = 10. Hi ha una fórmula matemàtica, però també pots fer-ho amb un bucle (encara que no l'hagem vist oficialment, segur que te'n ixques).

---

## ⭐⭐⭐ Exercici 7: AceptaElReto — 119 Futbolistes

Resol el problema **119 — Futbolistes** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=119).

Llig els minuts que juga cada futbolista i determina quants partits complets (90 minuts) ha jugat cada un. Pista: cada cas de prova acaba quan apareix un -1. Necessitaràs llegir números fins a trobar el marcador de fi.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 116 — ¡Hola mundo! | Principiant |
| AceptaElReto | 119 — Futbolistas | Fàcil |
| AceptaElReto | 114 — Último dígito del factorial | Mitjà |
| CodeWars | Square(n) Sum (8 kyu) | Principiant |
| CodeWars | Grasshopper - Summation (8 kyu) | Principiant |
