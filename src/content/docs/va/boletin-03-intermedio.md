---
title: "Butlletí 3 - Intermedi: Estructures de Control"
nav_order: 10
---
Dificultat progressiva. Els ⭐ t'escalfen, els ⭐⭐ et fan pensar, els ⭐⭐⭐ et preparen per al món real (i perquè el switch no se t'agarrote).

---

## ⭐ Exercici 1: Nombres parells i senars

Escriu un programa que recórrega els nombres de l'1 al 20 i mostre al costat si cada un és parell o senar. Usa un `for` i l'operador `%` dins d'un `if-else`.

Eixida esperada:
```
1 es impar
2 es par
3 es impar
...
20 es par
```

---

## ⭐ Exercici 2: Suma acumulativa

Demana nombres a l'usuari (amb `Scanner`) fins que introduïsca un 0. Mostra la suma acumulada després de cada nombre. Usa un bucle `while`.

Exemple d'execució:
```
Introduce un número (0 para salir): 5
Suma acumulada: 5
Introduce un número (0 para salir): 3
Suma acumulada: 8
Introduce un número (0 para salir): 0
Suma acumulada final: 8
```

---

## ⭐⭐ Exercici 3: Nombre perfecte

Un nombre perfecte és aquell que és igual a la suma dels seus divisors propis (excloent-se a si mateix). Per exemple, 6 = 1 + 2 + 3. Escriu un programa que demane un nombre N i determine si és perfecte o no.

Pista: usa un `for` que vaja d'1 a N/2, comprovant si N és divisible entre i (`N % i == 0`) i sumant els divisors.

---

## ⭐⭐ Exercici 4: Menú amb validació

Crea un programa que mostre un menú d'operacions i valide que l'opció siga correcta. Usa un `do-while` per al menú principal i un `switch` per a les opcions.

```
=== CALCULADORA RUPESTRE ===
1. Sumar
2. Restar
3. Multiplicar
4. Salir
Elige opción (1-4):
```

Si l'usuari tria una opció invàlida (menor que 1 o major que 4), mostra "Opción no válida, intenta de nuevo" i repetix el menú. Les opcions 1-3 han de demanar dos nombres i mostrar el resultat. L'opció 4 acaba el programa.

---

## ⭐⭐⭐ Exercici 5: Garbell d'Eratòstenes (nombres primers)

Escriu un programa que demane un nombre N i mostre tots els nombres primers des de 2 fins a N usant el **Garbell d'Eratòstenes**:

1. Crea un array de booleans amb grandària N+1, inicialitzat a `true` (tots són primers en teoria)
2. Des de 2 fins a √N, si el nombre és primer, marca com a `false` tots els seus múltiples
3. Al final, imprimeix els nombres que continuen sent `true`

Exemple per a N = 30:
```
Primos: 2 3 5 7 11 13 17 19 23 29
```

---

## ⭐⭐⭐ Exercici 6: CodeWars — Vowel Count

Resol la kata **"Vowel Count"** (7 kyu) en [CodeWars](https://www.codewars.com/kata/54ff3102c1bad923760001f3).

Torna el nombre de vocals (a, e, i, o, u) en un String donat. L'entrada serà només minúscules i espais. Per exemple, `"hola mundo"` té 4 vocals.

---

## ⭐⭐⭐ Exercici 7: AceptaElReto — 151 ¿Es matriz identidad?

Resol el problema **151 — ¿Es matriz identidad?** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=151).

Donada una matriu quadrada, determina si és la matriu identitat: tots els 1 en la diagonal principal i 0 en la resta. El programa ha de llegir casos de prova, cada un amb una grandària N seguit de N×N nombres.

Pista: per a recórrer la matriu, necessitaràs bucles niats. La diagonal principal són les posicions on fila == columna.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| AceptaElReto | 151 — ¿Es matriz identidad? | Mitjà |
| AceptaElReto | 200 — Aburrimiento en las aulas | Mitjà |
| AceptaElReto | 340 — Juegos de naipes | Mitjà |
| CodeWars | Century From Year (8 kyu) | Principiant |
| CodeWars | Vowel Count (7 kyu) | Fàcil |
| CodeWars | Cat years, Dog years (7 kyu) | Fàcil |
