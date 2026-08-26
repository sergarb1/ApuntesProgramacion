---
title: Butlletí U01 — Avançat
description: Exercicis de dificultat progressiva per a exprimir la unitat
---

# 📝 Butlletí U01 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resistix-te a mirar-la).

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

Has de usar exactament **5 línies de codi** (una per cada fila), combinant `print` i `println` sense usar bucles.

**Pista:** el `print` no salta de línia i el `println` sí. Pensa quina fila ha de començar línia nova i quina no.

---

## ⭐ Exercici 2: Sense executar — seqüències d'escapament

Què imprimix exactament este programa? Escriu l'eixida caràcter per caràcter.

```java
public class EscapeRoom {
    public static void main(String[] args) {
        System.out.println("Java\n\tmola\n\"mucho\"");
        System.out.println("C:\\carpeta\\archivo.java");
    }
}
```

**Pista:** `\n` salta de línia, `\t` tabula, `\"` imprimix una cometa i `\\` imprimix una barra invertida. Compta cada caràcter del text entre cometes com el llegiria la màquina, no com l'escrius.

---

## ⭐⭐ Exercici 3: El rellotge de milisegons

`System.currentTimeMillis()` torna el nombre de milisegons des de l'1 de gener de 1970 (la "epoch" d'Unix). Escriu un programa que:

1. Capture el moment actual amb `long inicio = System.currentTimeMillis();`
2. Faça una pausa artificial (un bucle que compte fins a 100.000.000 per a perdre temps)
3. Capture el moment després amb `long fin = System.currentTimeMillis();`
4. Mostre quants milisegons han passat

**Pista:** la resta `fin - inicio` et dona els milisegons transcorreguts. No et preocupes si el temps varia cada vegada: depén de la velocitat del teu ordinador.

---

## ⭐⭐ Exercici 4: Comptador d'arguments

Escriu un programa anomenat `ContadorArgs` que reba arguments des de la línia de comandes i mostre:

- Quants arguments es van rebre
- El primer argument (si existix)
- L'últim argument (si existix)

Si no es reben arguments, ha de mostrar: "No se recibieron argumentos. Programa cancelado por falta de datos."

Exemple d'execució:

```
> java ContadorArgs hola mundo cruel
Argumentos recibidos: 3
Primer argumento: hola
Último argumento: cruel
```

**Pista:** l'últim argument és `args[args.length - 1]` (perquè el primer element és l'índex 0). Comprova abans que `args.length > 0`.

---

## ⭐⭐⭐ Exercici 5: L'edat còsmica

La Terra tarda 365.25 dies a orbitar el Sol. Mercuri tarda 87.97 dies. Escriu un programa que, usant constants `final`:

1. Declare `final double DIAS_TIERRA = 365.25;`
2. Declare `final double DIAS_MERCURIO = 87.97;`
3. Emmagatzeme en una variable `int edadTerrestre = 20` (la teua edat en anys terrestres)
4. Calcule els anys que tindries en Mercuri (dividix els dies terrestres viscuts entre els dies de Mercuri)
5. Mostre: "En la Tierra tengo X años. En Mercurio tendría Y años."

Per a calcular els dies viscuts en la Terra: `diasVividos = edadTerrestre * DIAS_TIERRA`.

**Pista:** els anys en Mercuri seran un `double` (el resultat de dividir dos `double`). La divisió `diasVividos / DIAS_MERCURIO` te'l dona.

---

## ⭐⭐⭐ Exercici 6: CodeWars — Grasshopper - Summation

Resol la kata **"Grasshopper - Summation"** (8 kyu) en [CodeWars](https://www.codewars.com/kata/55d24f55d7dd296eb9000030).

Suma tots els números de l'1 fins a n. Si n = 4, torna 1+2+3+4 = 10.

**Pista:** hi ha una fórmula matemàtica (n * (n + 1) / 2), però també pots fer-ho amb un bucle encara que no l'hàgim vist oficialment. El mètode rebrà un `int n` i haurà de tornar un `int`.

---

## ⭐⭐⭐ Exercici 7: AceptaElReto — 119 Futbolistes

Resol el problema **119 — Futbolistes** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=119).

Llig els minuts que juga cada futbolista i determina quants partits complets (90 minuts) ha jugat cada un.

**Pista:** cada cas de prova acaba quan apareix un -1. Necessitaràs llegir números fins a trobar el marcador de fi i sumar els minuts de cada futbolista.

---

## ⭐⭐⭐ Exercici 8: Javadoc de campionat

Escriu una classe `SobreMi` totalment documentada:

1. Classe amb Javadoc (`@author`, `@version`).
2. Mètode `main` amb Javadoc (`@param args`).
3. Dins del `main`, un comentari d'una línia que explique *per què* (no *què*) imprimixes la teua motivació.
4. Un comentari de bloc que explique què fa el teu programa a grans trets.
5. Imprimix el teu nom, la teua motivació i quants arguments vas rebre.

**Pista:** recorda que els comentaris Javadoc van just **abans** de la classe i del mètode. Genera la documentació amb `javadoc SobreMi.java` i obri els `.html` que es generen.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 116 — ¡Hola mundo! | Principiant |
| AceptaElReto | 119 — Futbolistes | Fàcil |
| AceptaElReto | 114 — Últim dígit del factorial | Mitjà |
| CodeWars | Square(n) Sum (8 kyu) | Principiant |
| CodeWars | Grasshopper - Summation (8 kyu) | Principiant |