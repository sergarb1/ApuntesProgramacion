---
title: "Butlletí U12 — Avançat"
description: "Exercicis de dificultat progressiva per a exprimir fitxers i expressions regulars"
---

# 📝 Butlletí U12 — Avançat

> Dificultat progressiva. ⭐ per a escalfar, ⭐⭐ per a pensar, ⭐⭐⭐ per a concursar. Cada exercici inclou una pista (resisteix-te a mirar-la).

---

## ⭐ Exercici 1: Buscador de fitxers per extensió

Crea un programa que demane una ruta de directori i una extensió (ex: `.txt`, `.java`) i llixe **recursivament** tots els fitxers amb eixa extensió. Usa la classe `File` i el seu mètode `listFiles()`.

**Pista:** si el fitxer és un directori, crida el mètode de nou (recursió). Recorda comprovar `isDirectory()` abans de `listFiles()`.

---

## ⭐ Exercici 2: Lector de CSV amb Scanner

Donat un fitxer `datos.csv` amb el següent format (sense capçalera):

```
Ana;25;DAM
Bob;22;DAW
Carlos;30;DAM
```

Usa `Scanner` amb `useDelimiter()` per a llegir el fitxer i mostrar les dades en format de taula alineada amb `printf()`.

**Pista:** `useDelimiter(";|\\R")` talla per `;` o per salt de línia. Repassa els formats de `printf` en la U02, punt 7.

---

## ⭐⭐ Exercici 3: Filtre de línies per paraula clau

Crea un programa que llig un fitxer de text (`origen.txt`) i escriga en `destino.txt` només les línies que contenen una paraula clau (demanada a l'usuari). Usa `BufferedReader` i `PrintWriter`. Mostra al final quantes línies van coincidir i quantes es van descartar.

**Pista:** la comprovació és `linea.contains(palabraClave)`. Porta dos comptadors.

---

## ⭐⭐ Exercici 4: Separador de línies parells i senars

Crea un programa que llig un fitxer `entrada.txt` i genere dos fitxers:

- `pares.txt` → conté les línies en posició parell (0, 2, 4...).
- `impares.txt` → conté les línies en posició senar (1, 3, 5...).

Usa `try-with-resources` amb **tres** recursos (un `BufferedReader` i dos `PrintWriter`).

**Pista:** els tres recursos van entre els parèntesis del `try`, separats per `;`. Usa `% 2` sobre el número de línia.

---

## ⭐⭐ Exercici 5: Split amb regex — analitzador de frases

Escriu un programa que llig una frase de l'usuari i use `split()` amb una expressió regular per a:

1. Separar les paraules (ignorant espais, comes, punts i signes).
2. Mostrar quantes paraules hi ha.
3. Mostrar la paraula més llarga.
4. Mostrar les paraules que comencen per vocal.

Exemple: `"Hola, mundo. Esto es Java: ¿mola?"` →

```
Palabras: 6
Más larga: "mundo"
Empiezan por vocal: ["Esto"]
```

**Pista:** el separador que ignora tot el que no siga lletra és `"[^a-zA-ZáéíóúüñÑ]+"`. Per a les vocals, comprova la primera lletra amb `matches("[aeiouAEIOUáéíóú]")` o amb un `indexOf` sobre una cadena de vocals.

---

## ⭐⭐⭐ Exercici 6 (ProgramaMe): Validador de dades amb regex

Crea un programa que llig un fitxer `datos.txt` on cada línia conté una dada i el seu tipus (separats per `;`):

```
ana@email.com;email
12345678Z;dni
+34 612345678;telefono
91 123 45 67;telefono
esto-no-es-email;email
```

Valida cada línia segons el tipus usant expressions regulars:

- **Correu:** format bàsic `xxx@xxx.xxx`.
- **DNI:** 8 dígits + lletra majúscula (la lletra ha de ser vàlida segons l'algoritme mòdul 23).
- **Telèfon:** opcional `+34` seguit de 9 dígits, amb o sense espais.

Mostra un resum: quants de vàlids, quants d'invàlids, i llixa els invàlids.

**Pista:** per a cada línia, fes `linea.split(";")`, mira el tipus amb `equals` i aplica el patró corresponent amb `matches()`.

---

## ⭐⭐⭐ Exercici 7: Xifrat Cèsar amb fitxers

Crea un programa que llig un fitxer `mensaje.txt`, desplace cada caràcter **3 posicions** en l'alfabet (xifrat Cèsar) i escriga el resultat en `mensaje_cifrado.txt`. Després, un altre programa (o el mateix amb una opció) que el descifre. Usa `try-with-resources` i `BufferedReader`/`PrintWriter`.

**Pista:** per cada `char`, si és lletra fes `(char) (c + 3)` i compte amb els extrems (la `z` ha de tornar a la `a`: usa `% 26` sobre la posició en l'alfabet).

---

## ⭐⭐⭐ Exercici 8: Serialització d'estudiants

Crea una classe `Estudiante` que implemente `Serializable` amb `String nombre`, `int edad` i `double notaMedia`. Crea un programa que guarde un `ArrayList<Estudiante>` en un fitxer `estudiantes.dat` usant `ObjectOutputStream`. Després, un altre programa (o el mateix amb una opció) que el llig amb `ObjectInputStream` i mostre les dades formatades.

**Pista:** recorda el `serialVersionUID`. El `readObject()` torna `Object`: fes el casting a `List<Estudiante>` amb calma i comprova que no siga `null`.

---

## ⭐⭐ Exercici 9: El comptador de línies, paraules i caràcters

Crea un programa que llig un fitxer de text i mostre quantes línies, paraules i caràcters té. Usa `BufferedReader` per a llegir.

**Pista:** cada línia suma 1 al comptador de línies i `linea.length()` al de caràcters; per a les paraules, `linea.split("\\s+").length` (amb compte amb les línies buides).

**Repte extra:** resol-lo també amb NIO (`Files.readAllLines`) i compara la diferència.