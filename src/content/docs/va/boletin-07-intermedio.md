---
title: "Boletí 5 - Intermedi: Visibilitat, Encapsulació i Static"
nav_order: 15
---
Exercicis de dificultat progressiva. Els ⭐ són per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. L'encapsulació no és un encanteri de Harry Potter, és sentit comú. Però per a estos exercicis, igual necessites un encanteri o dos.

---

## ⭐ Exercici 1: Classe CompteEstalvis encapsulada

Crea una classe `CompteEstalvis` amb:
- Atribut privat `double saldo`
- Atribut privat `double interesAnual` (percentatge, ex: 2.5 significa 2.5%)
- Constructor que reba el saldo inicial i l'interés anual. Si el saldo és negatiu, s'establix a 0.
- Getter per a `saldo`
- Mètode `void aplicarInteres()` que augmenta el saldo segons l'interés anual
- Mètode `boolean retirar(double quantitat)` que només permeta retirar si hi ha saldo suficient

---

## ⭐ Exercici 2: Classe Persona amb validació estricta

Crea una classe `Persona` amb atributs privats `String nom` i `int edat`. El constructor i els setters han de validar que:
- `nom` no siga null ni estiga buit (ni només espais)
- `edat` estiga entre 0 i 120 (inclòs)

---

## ⭐⭐ Exercici 3: Classe TicketCompra amb ID autoincremental

Crea una classe `TicketCompra` que modele un ticket de supermercat:
- Atribut estàtic `private static int contadorTickets = 0`
- Atribut d'instància `private int id` (autoincremental)
- Atributs `private String[] productes` i `private double[] preus`
- Mètodes per a calcular total, IVA i toString()

---

## ⭐⭐ Exercici 4: Classe Biblioteca amb comptador estàtic

Crea una classe `Biblioteca` que gestione préstecs de llibres:
- Comptador estàtic de llibres prestats
- Mètodes per a prestar i devolre llibres
- Getter estàtic del total de préstecs globals

---

## ⭐⭐⭐ Exercici 5: Classe CalculadoraEstadística utilitària

Crea una classe `CalculadoraEstadistica` que siga una classe utilitària (constructor privat, només mètodes estàtics):
- `media(double[] dades)`
- `mediana(double[] dades)`
- `moda(double[] dades)`
- `desviacioTipica(double[] dades)`

---

## ⭐⭐⭐ Exercici 6: CodeWars — Find the odd int

Resol la kata **"Find the odd int"** (6 kyu) en CodeWars.

Crea una classe utilitària `FindOdd` amb un mètode estàtic `findIt(int[] arr)` que rep un array d'enters i torna l'enter que apareix un nombre impar de vegades.

---

## ⭐⭐⭐ Exercici 7: AceptaElReto — 120 Nombre de parells i senars

Resol el problema **120 — Nombre de parells i senars** en [AceptaElReto.com](https://www.aceptaelreto.com/problem/statement.php?id=120).

Donat un nombre enter positiu, compta quants dels seus dígits són parells i quants són senars.

---

## 📚 Referències

| Plataforma | Problema | Dificultat |
|---|---|---|
| CodeWars | Find the odd int | 6 kyu |
| CodeWars | Regex validate PIN code | 7 kyu |
| AceptaElReto | 120 — Nombre de parells i senars | Fàcil |
| AceptaElReto | 157 — ¿Son iguales? | Mitjà |
