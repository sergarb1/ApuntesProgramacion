---
title: "U05 — Funcions i mètodes"
description: "L'ofici de tallar el teu codi: mètodes que reben dades, tornen resultats i converteixen un main enorme en peces xicotetes i provables 🔧"
emoji: 🔧
---

<p><small>L'ofici de tallar el teu codi: mètodes que reben dades, tornen resultats i converteixen un main enorme en peces xicotetes i provables 🔧</small></p>



---

Fins ara tot el teu codi ha viscut dins de `main`: declaraves variables, reparties `if` i bucles, i el programa sencer era un paràgraf llarg i valent. Funciona... fins que el programa creix. Aleshores `main` es converteix en un full de receptes, no pots repetir una part sense copiar i enganxar, i cada canvi s'estén com una taca de cafè.

En esta unitat aprens la ferramenta que separa a qui escriu codi de qui el **disseny**: el **mètode** (o funció). Un mètode és una recepta amb nom: rep dades per la porta, fa una cosa ben explicada, i torna el resultat o no torna res i se'n va. Res més. Però amb això construeixes programes sencers.

La promesa concreta: en acabar esta unitat, `main` serà menut, cada concepte viurà en el seu propi mètode amb un nom que s'explica sol, i hauràs donat el salt que et separa dels exercicis d'"un sol fitxer" per sempre.

Esta unitat es llig com un **llibre de 9 capítols**: els 8 primers punts són teoria en progressió i el 9è és un aterratge pràctic per a martellejar tot l'après.

---

## 🎯 Objectiu de la unitat

En acabar, seràs capaç de:

- **Declarar** els teus propis mètodes (`public static`) i cridar-los des de `main`.
- **Passar dades** a un mètode mitjançant **paràmetres** i usar-los dins com si foren variables.
- **Tornar resultats** amb `return` i distingir quan un mètode torna i quan és `void`.
- Entendre l'**àmbit** de les variables: què existeix dins d'un mètode i què no ix d'ell.
- Reconèixer i arreglar els **errors típics** de les funcions (return oblidat, arguments desordenats...).
- **Dividir** un problema gran en mètodes menuts, cadascú amb una responsabilitat.
- **Refactoritzar** un programa monolític en funcions reutilitzables sense canviar el que fa.

---

## 🗺️ Mapa de la unitat

| Punt | Què aprendrás | Dificultat |
|---|---|---|
| [01 · Què és una funció?](/ApuntesProgramacion/va/05-funciones/01-que-es-funcion) | La recepta amb nom: per què existeix i què és "mètode" | Tots |
| [02 · El teu primer mètode](/ApuntesProgramacion/va/05-funciones/02-primer-metodo) | `public static void`, cridar des de `main` i executar | Tots |
| [03 · Paràmetres: l'entrada](/ApuntesProgramacion/va/05-funciones/03-parametros) | Dades que entren: tipus, ordre i diversos alhora | Tots |
| [04 · return: l'eixida](/ApuntesProgramacion/va/05-funciones/04-return-valores) | Tornar resultats i quan usar `void` | Tots |
| [05 · Àmbit de variables](/ApuntesProgramacion/va/05-funciones/05-ambito-variables) | Quines variables viuen dins d'un mètode i per què | Tots |
| [06 · Errors freqüents](/ApuntesProgramacion/va/05-funciones/06-errores-frecuentes) | Els 7 entrebancs de tothom eixir-ne | Tots |
| [07 · Divideix el problema](/ApuntesProgramacion/va/05-funciones/07-divide-problema) | Compondre: main menut, una responsabilitat per mètode | Tots |
| [08 · Be the Code](/ApuntesProgramacion/va/05-funciones/08-be-the-code) | Refactoritza un programa monolític a mà | Tots |
| [09 · Repàs interactiu](/ApuntesProgramacion/va/05-funciones/09-repaso-interactivo) | Sé el Còdigo, Fireside, Qui Sóc, Laboratori, Crucigrama… | Tots |

> 📖 **Flux de lectura:** els 8 primers punts són teoria en progressió. El 9è és l'aterratge pràctic: llig-lo just després del 8è i abans d'obrir els butlletins.

---

## 📝 Butlletins de la unitat

> Practica amb els parells del curs: intenta primer el per-resoldre i comprova amb el resolt quan hages acabat.

<div class="ejercicio-links">
  <a href="/ApuntesProgramacion/va/boletines/boletin-u05-inicial" class="elink">🟢 Inicial per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u05-inicial-resuelto" class="elink">✅ Inicial resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u05-avanzado" class="elink">⭐ Avançat per resoldre</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u05-avanzado-resuelto" class="elink">💪 Avançat resolt</a>
  <a href="/ApuntesProgramacion/va/boletines/boletin-u05-extras" class="elink">🔥 Extra</a>
</div>

---

## ✅ Criteris d'avaluació coberts (RA2)

**RA2: Escriu i prova programes senzills, reconeixent i aplicant els fonaments de la programació orientada a objectes.**

| CE | Criteri | On es cobreix |
|---|---|---|
| RA2 b) | S'han escrit programes simples. | ✅ Tots |
| RA2 e) | S'han escrit crides a mètodes estàtics. | ✅ Punts 2, 3, 4 i 7 |
| RA2 f) | S'han utilitzat paràmetres en la crida a mètodes. | ✅ Punts 3, 4 i 7 |

> 📌 Esta unitat és la primera meitat del viatge dels mètodes: ací els escrius "a pel" amb `static`, com a receptes soltes. La segona meitat arriba en la U09 (POO), on els mètodes viuen dins de classes amb atributs, i en la U10, on `static` per fi explica el seu nom. Hui només necessites la ferramenta: entrades, eixides i un nom honrat.

---

## 🚪 Per on comence?

- No has escrit mai un mètode que no fora `main`? → Comença en el [punt 1](/ApuntesProgramacion/va/05-funciones/01-que-es-funcion) i no et saltses el 2.
- El teu `main` ja sembla un paràgraf infinit de copiar i enganxar? → Ves directe al [punt 7](/ApuntesProgramacion/va/05-funciones/07-divide-problema) i després al [Be the Code](/ApuntesProgramacion/va/05-funciones/08-be-the-code).
- Només vols entendre per què `main` és `public static void main`? → El [punt 2](/ApuntesProgramacion/va/05-funciones/02-primer-metodo) te desmonta la firma en 4 paraules.
- Vens a repassar? → Fes el [Repàs interactiu](/ApuntesProgramacion/va/05-funciones/09-repaso-interactivo) i després els [butlletins](/ApuntesProgramacion/va/boletines/boletin-u05-inicial).

**📍 Primer punt:** [01 · Què és una funció?](/ApuntesProgramacion/va/05-funciones/01-que-es-funcion)  
**⏭️ En acabar la unitat, continua en [U06 · Arrays](/ApuntesProgramacion/va/06-arrays).**
