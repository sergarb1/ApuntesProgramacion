---
title: "09 · Modularitat"
description: "Un programa gegant no es domina: es parte. Paquets, cohesió i acoblament perquè el teu codi no es convertisca en espaguetis ⚡🧩"
---

<p><small>Un programa gegant no es domina: es parte. Paquets, cohesió i acoblament perquè el teu codi no es convertisca en espaguetis ⚡🧩</small></p>

> 🗺️ **Estàs en:** ⚡ **U07 · Algorítmica II: tècniques avançades i modularitat** → 09 · Modularitat

---

## 📬 La idea en una frase

> **La modularitat és partir un programa en peces amb nom, frontera i responsabilitat pròpia, perquè cada peça s'entenga (i s'arregle) per separat.**

En els punts del 3 al 8 vas dividir *problemes* fins a fer-los trivials. Ara apliques la mateixa estratègia al *codi*: un programa de mil línies en un sol fitxer ningú l'entén; mil línies repartides en mòduls amb sentit, sí. Divideix i venceràs, però ara en l'editor.

---

## 🧩 Per què importa tant?

- **Mantenibilitat:** quan algo es trenca, busques en el mòdul responsable, no en un fitxer amb 1.500 línies.
- **Treball en equip:** dues persones poden tocar mòduls distints sense pisar-se. Sense fronteres, cada merge és una loteria.
- **Reutilització:** una peça ben aïllada (una utilitat de dates, un algoritme d'ordenació) serveix en altres projectes.
- **Testing:** es prova una peça xiqueta per separat, no el monstre sencer.
- **Comprensió:** pots entendre *un* mòdul sense entendre *tots*. Ningú entén tot el sistema d'un colp, i no fa falta.

---

## 📦 La peça oficial en Java: el paquet

En Java, la unitat modular bàsica és el **paquet** (`package`): una carpeta amb nom que agrupa classes amb la mateixa missió.

```java
package curso.algoritmos;          // este fitxer viu en la carpeta curso/algoritmos/

public class Ordenacion {
    public static int[] burbuja(int[] datos) { /* ... */ }
}
```

Per a usar-lo des d'una altra classe, s'importa:

```java
import curso.algoritmos.Ordenacion;   // necessite la classe Ordenacion del paquet curso.algoritmos

int[] ordenados = Ordenacion.burbuja(datos);
```

Convencions que en l'examen i en la vida real es complixen:

1. El **directori = paquet**: `curso.algoritmos` viu en `curso/algoritmos/`.
2. Noms en **minúscules i sense espais** (`curso.algoritmos`, no `Curso.Algoritmos`).
3. Paquets que expressen **missió**: `ordenes`, `pagos`, `utilitats`... no `coses2`.
4. El punt (`.`) és el separador jeràrquic: primer l'empresa o el projecte, després la capa.

> 💡 **Analogia:** els paquets són les prestatgeries d'un taller. Les eines soltes en la taula sempre es perden; les que viuen en el seu calaix, apareixen quan les busques.

---

## 🎯 Cohesió alta, acoblament baix

Dos paraules que resolen el 90% de les dubtes de disseny:

- **Cohesió (alta):** tot el que hi ha dins d'un mòdul va junt *perquè té sentit*. Si el teu mòdul `factures` conté també receptes de cuina, la cohesió ha mort.
- **Acoplament (baix):** els mòduls han de dependre el mínim dels altres. Si per a canviar el nom d'un fitxer has de tocar cinc mòduls, estan massa pegats.

La regla d'or, en una frase: **un mòdul, una responsabilitat; i que parle amb els altres justet.**

---

## ✂️ Com decideixes els talls

No hi ha una única resposta, però estos senyals funcionen sempre:

1. **Nom que s'explica sol.** Si no saps posar nom al mòdul, encara no saps què fa.
2. **Canvi repetit en el mateix lloc.** Dues funcionalitats canvien juntes van al mateix mòdul.
3. **Mètodes curts amb una missió.** Una funció que fa cinc ja està demanant a crits dividir-se.
4. **Allò que es reutilitza, puja.** Si ho copies a un altre lloc, és que volia ser el seu propi mòdul.

> ⚠️ **[WARNING]** L'extrem contrari també enferma: **mòduls de dos línies** o una carpeta `utilitats` amb 40 classes de tot tipus. Modular en excés és soroll; l'objectiu és *claredat*, no arbres infinites de carpetes.

---

## 🔮 El que ve després

La modularitat és el pont perfecte cap a la POO: en la **U08** aprendràs que les **classes** són les peces menudes, i en la **U09** que la **visibilitat** (`public`, `private`) decideix quina cara mostra cada mòdul davant la resta del món. Hui poses les prestatgeries; demà fabriques les peces que van a dins.

---

## 🎯 Mini-comprovació

Posa't a prova en 30 segons (les respostes estan amagades):

1. Què indica el `package curso.algoritmos;` de la primera línia d'un fitxer?
2. Si canvies un mòdul i has d'editar cinc més, quin problema de disseny tens: cohesió alta o acoblament excessiu?
3. Per què el directori i el paquet han de coincidir?
4. Nombra dues avantatges de modularitzar un programa per a un equip de treball.

<details>
<summary>🔄 Respostes</summary>

1. Que la classe pertany al paquet `curso.algoritmos` i que el fitxer viu en la carpeta `curso/algoritmos/`.
2. **Acoblament excessiu**: els mòduls depenen massa els uns dels altres.
3. Perquè l'eina (el compilador/IDE) trobe la classe pel seu nom: la ruta del paquet *és* la ruta de la carpeta.
4. Qualsevol de: treballar en paral·lel sense pisar-se, arreglar errors localitzant el mòdul, reutilitzar peces, provar parts aïllades, entendre només un tros del sistema.

</details>

---

## ✅ Resum en 3 frases

1. La **modularitat** parteix el programa en peces amb nom i responsabilitat pròpia, aplicant al codi la mateixa «divideix i venceràs» que vas fer servir amb els algoritmes.
2. En Java la peça bàsica és el **paquet** (`package` / `import`), el nom del qual coincideix amb la carpeta on viu la classe.
3. Bon disseny = **cohesió alta** (tot junt va per sentit) i **acoblament baix** (els mòduls es parlen justet).

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Mòdul | Peça del programa amb una missió |
> | Paquet | Carpeta de classes en Java (`package`) |
> | Cohesió | Com té sentit que el codi vaja junt |
> | Acoblament | Com depén un mòdul dels altres |
> | Responsabilitat única | Un mòdul, una missió |
> | `import` | Declarar quina peça aliena necessites usar |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/07-algoritmica-tecnicas) · **Anterior:** [08 · Altres tècniques algorítmiques](/ApuntesProgramacion/va/07-algoritmica-tecnicas/08-otras-tecnicas-algoritmicas) · **Següent:** [10 · Repàs interactiu](/ApuntesProgramacion/va/07-algoritmica-tecnicas/10-repaso-interactivo)
