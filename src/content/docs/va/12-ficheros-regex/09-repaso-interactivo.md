---
title: "09 · Repàs interactiu: domina fitxers i regex"
description: "El tancament pràctic de la unitat, amb un close() que doldrà, una regex que fallarà i un objecte que viatjarà en el temps 😈"
---

<p><small>El tancament pràctic de la unitat, amb un close() que doldrà, una regex que fallarà i un objecte que viatjarà en el temps 😈</small></p>

> 🗺️ **Estàs en:** 📁 **U12 · Fitxers i Expressions Regulars** → 09 · Repàs interactiu

---

## 📬 La idea en una frase

> **En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

---

## ⭐ Sé el Código, my friend...

> *Eres la JVM. Acaben de donar-te este programa per a executar:*

```java
import java.io.*;
import java.util.regex.*;

public class Misterio {
    public static void main(String[] args) throws Exception {
        File f = new File("datos.txt");
        if (!f.exists()) {
            FileWriter w = new FileWriter(f);
            w.write("Ana;20\nBob;35\nCarla;28");
            w.close();
        }

        Pattern patron = Pattern.compile("(\\w+);(\\d+)");
        BufferedReader r = new BufferedReader(new FileReader(f));
        String linea;
        int suma = 0;
        while ((linea = r.readLine()) != null) {
            Matcher m = patron.matcher(linea);
            if (m.matches()) {
                suma += Integer.parseInt(m.group(2));
            }
        }
        r.close();
        System.out.println("Suma: " + suma);
    }
}
```

**Què imprimixes per pantalla? Tria saviament:**

1. **`Suma: 83`** → La regex captura nom i edat, i se sumen 20 + 35 + 28. ✅
2. **`Suma: 0`** → `m.matches()` no troba res perquè el patró no quadra amb les línies. ❌
3. **`Suma: 83` però només la primera vegada** → El fitxer es crea la primera execució, però la suma és sempre la mateixa. ❌

> <details>
> <summary>🔄 Solució</summary>
>
> L'opció **1**. El fitxer es crea amb tres línies del format `Nom;edat`. La regex `(\\w+);(\\d+)` captura el nom (grup 1) i l'edat (grup 2), i com que `matches()` exigix que **tota** la línia quadre (i quadra), suma `20 + 35 + 28 = 83`. Tant se val quantes vegades l'executes: el fitxer ja existix i l'eixida és sempre la mateixa.
>
> </details>

---

## 🔥 Fireside Chat: File vs Path

> *Dues generacions de l'API de fitxers es troben davant la màquina de cafè.*

**File:** — Porte ací des de Java 1.0. Tota una vida localitzant fitxers: `exists()`, `isFile()`, `length()`... Soc el clàssic.

**Path:** — I jo vaig arribar en Java 7 amb tota la modernitat: `Paths.get(...)`, i el meu company `Files` fa `readAllLines`, `write` i `readString` en una línia.

**File:** — I per a què em necessites a mi aleshores? Jo tinc `listFiles()` per a recórrer carpetes.

**Path:** — Jo tinc `Files.walk()` que recorre **arbres sencers** recursivament i te'ls dona en un `Stream`. Amb filtre, a més.

**File:** — Val, però continues depenent de mi en alguns llocs... i de `FileReader`, `FileWriter` i companyia per a llegir i escriure.

**Path:** — Cert, el trio `FileWriter`/`FileReader`/`BufferedReader` és etern i funciona de meravella. La família de `java.io` no desapareixerà. Però per a allò modern, `Files` i `Paths` són la meua lliga.

> La lliçó: **`java.io` (File, FileReader, FileWriter, BufferedReader) continua sent vàlid i l'usaràs tota la vida. `java.nio.file` (Paths, Files) és la forma moderna i preferida en codi nou.** Saber els dos et fa flexible; saber-ne només un, limitat.

---

## 🕵️ Qui Soc?

Endevina quin concepte de la unitat soc:

1. **Soc el GPS que localitza fitxers, però no llig contingut.**
2. **Soc el lector que et dona línies senceres i mai s'ennuega.**
3. **Soc el bloc que tanca els fitxers per tu, passe el que passe.**
4. **Soc la interfície-marca que permet guardar un objecte en un fitxer.**
5. **Soc el motle compilat d'una expressió regular.**
6. **Soc el mètode que exigix que TOT el string complica amb el patró.**

<details>
<summary>🔄 Respostes</summary>

1. **`File`** — representa rutes, no contingut.
2. **`BufferedReader`** — `readLine()` sense parpellejar.
3. **`try-with-resources`** — tanca automàticament en eixir del bloc.
4. **`Serializable`** — sense mètodes, només la marca per a congelar objectes.
5. **`Pattern`** — la regex compilada; `Matcher` és qui busca.
6. **`matches()`** — del `String`, valida tot el text.

</details>

---

## 🤬 CONRAD VS EL MÓN: "No vaig tancar el fitxer"

> *CONRAD, el nostre compilador cascarrabutxes, opina sobre els clàssics del novell.*

**CONRAD:** — UNA ALTRA VEGADA! Ve un alumne i em diu: *CONRAD, el meu fitxer s'ha quedat a mig fer*. I jo: val, a veure el teu codi? *Pues mira, escric amb FileWriter...* I NO TANQUES! I tant que s'ha quedat a mig fer! Les dades viuen al buffer fins que arriba el `close()`. Et fa gràcia escriure cartes i no tancar el sobre? Pues això. Des de Java 7 tens `try-with-resources` per a tancar sense plorar. USA'L!

*I després està el de la regex.* Escriu `"abc123".matches("\\d+")` i s'estranya que done `false`. Però si hi ha lletres pel mig! `matches()` exigix que TOT el string siguen dígits. Per a buscar subcadenes, `find()`. Porta tota la unitat dient-ho!

*I el de la serialització:* guarda un objecte, canvia la classe afegint un camp, i es queixa que en llegir-li salta `InvalidClassException`. I tant! No li posares el `serialVersionUID` i ara plora... Posa-l'hi fix i deixa de plorar.

**La lliçó:** el trio sagrat de la unitat: **¿tanque els recursos amb `try-with-resources`? ¿use `find()` per a buscar i `matches()` només per a validar tot el string? ¿la meua classe té `Serializable` i un `serialVersionUID` fix?** El 90% dels ensurts d'esta unitat s'arreglen amb estes tres preguntes. El compilador no t'odia: t'està passant les respostes de l'examen.

---

## 🎮 El Joc de les Decisions

Tria la resposta correcta per a cada decisió (respostes al final):

1. `new File("notas.txt")` ... què fa en el disc?
   - a) Crea el fitxer buit   b) Res, només representa la ruta
2. Quin mètode de `String` torna `true` només si TOT el text és un correu vàlid?
   - a) `matches()`   b) `find()`
3. Què llança llegir amb `FileReader` un fitxer que no existix?
   - a) `FileNotFoundException`   b) `NullPointerException`
4. Quin mètode de `Files` (NIO) llig un fitxer complet com a `List<String>`?
   - a) `Files.readAllLines()`   b) `Files.readString()`
5. Per a afegir al final d'un fitxer amb `FileWriter` sense esborrar l'anterior...
   - a) `new FileWriter("f.txt", true)`   b) `new FileWriter("f.txt", false)`

<details>
<summary>🔄 Solucions</summary>

1. **b)** — `new File("ruta")` no crea res: només l'objecte que representa la ruta. Per a crear, `createNewFile()` o un `FileWriter`.
2. **a)** — `matches()` valida el string sencer. `find()` busca subcadenes dins del text.
3. **a)** — `FileNotFoundException`, una filla de `IOException`.
4. **a)** — `readAllLines` torna `List<String>`; `readString` torna un únic `String`.
5. **a)** — el segon argument `true` activa el mode *append*.

</details>

---

## ⚡ Laboratori de Tortura: el validador que no valida

> **Durada estimada:** 30 minuts
> **Ferramenta:** el teu IDE i un fitxer nou

**L'escenari:** copia este programa i fes que funcione. Et diuen que té **2 errors de compilació i 1 error de lògica**... però, i si t'ho diuen malament? La teua tasca: fer que compile, que execute i que **tota** l'eixida siga correcta, comptant tu els errors reals.

```java
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validador {
    public static void main(String[] args) {
        String[] correos = {"ana@example.com", "bob@@example", "carla@site.es"};

        Pattern patron = Pattern.compile("[\\w.]+@[\\w.]+\\.[a-z]{2,}")

        int validos = 0;
        for (String c : correos) {
            Matcher m = patron.matcher(c);
            if (m.find()) {
                System.out.println(c + " → válido");
                validos++;
            } else {
                System.out.println(c + " → inválido");
            }
        }
        System.out.println("Válidos: " + validos)
    }
}
```

**Fallada intencionada:** el nombre d'errors de l'enunciat està malament a propòsit. La trampa és la teua confiança en l'enunciat.

**La teua tasca:** aconseguir que compile, que execute i que **tota** l'eixida siga correcta. Si el resultat no quadra, diagnostica.

**Pistes per quan et frustres (no abans):**

1. Compila? *no → mira els `;` i els imports.*
   <details><summary>I si continuec atascat?</summary>Falta un `;` després del `Pattern.compile(...)` i un altre al final del `println`. Els imports estan bé.</details>
2. Ja compila? *aleshores mira el resultat.*
   <details><summary>I si continuec atascat?</summary>El codi usa `find()`. Quants correus creus que haurien de passar la validació? Torna a mirar què significa `find()` davant de `matches()`.</details>
3. Creus que hi ha un error de lògica? *Torna a llegir el codi amb calma i no et fies de l'enunciat.*
   <details><summary>Solució final</summary>

Els **errors de compilació**:

1. Falta el `;` al final de `Pattern.compile("[\\w.]+@[\\w.]+\\.[a-z]{2,}")`.
2. Falta el `;` al final del `System.out.println("Válidos: " + validos)`.

L'**error de lògica**: no existix. L'enunciat deia "2 errors de compilació i 1 de lògica", però només hi ha 2 faltes de `;` i cap lògica trencada. Eixa era la trampa: la teua confiança en l'enunciat.

Eixida correcta:

```
ana@example.com → válido
bob@@example → inválido
carla@site.es → válido
Válidos: 2
```

Amb `find()`, "bob@@example" NO passa: el patró `[\\w.]+@[\\w.]+\\.[a-z]{2,}` necessita lletres, una `@`, més lletres, un punt i almenys dos lletres. "bob@@example" té dos `@` seguides i cap punt, així que no hi ha subcadena que complica amb el patró.

La lliçó real: **llig el codi, no l'enunciat**. Compta, verifica i confia en el compilador, no en la llegenda.

   </details>

---

## 🏆 Assoliments d'esta unitat

| Assoliment | Com aconseguir-ho |
|---|---|
| 🏅 **L'Explorador** | Llistar el contingut d'una carpeta amb `File.listFiles()` distingint fitxers i carpetes |
| 🏅 **El Copió** | Copiar un fitxer de text línia a línia amb `BufferedReader` + `PrintWriter` i `try-with-resources` |
| 🏅 **El Sergent** | Formatar una taula alineada en un fitxer amb `PrintWriter.printf` |
| 🏅 **El Maleter** | Guardar i recuperar una `ArrayList` d'objectes amb la serialització |
| 🏅 **El Detectiu** | Extraure nivell, data i missatge d'un log amb una regex i grups de captura |
| 🏅 **El Porter** | Validar correus, DNIs o telèfons amb `matches()` i patrons compilats |

---

## 🧠 Atreveix-te a Pensar

1. **Sense executar:** què imprimeix este programa?

```java
import java.io.*;

public class Acertijo {
    public static void main(String[] args) throws Exception {
        try (FileWriter fw = new FileWriter("nums.txt")) {
            fw.write("5\n10\n15\n");
        }
        try (BufferedReader br = new BufferedReader(new FileReader("nums.txt"))) {
            int suma = 0;
            String linea;
            while ((linea = br.readLine()) != null) {
                suma += Integer.parseInt(linea);
            }
            System.out.println(suma);
        }
    }
}
```

2. **El netejador:** tens `String texto = "Hola    mundo    Java"` i vols deixar-lo en un sol `String[]` amb les tres paraules. Què escrius?
3. **El detectiu del log:** una línia de log és `[ERROR] 2026-09-06 10:30:45 - Conexión fallida: server=db01`. Quin grup captura `server=db01` amb el patró del punt 8? ¿Coincidix amb `matches()` o només amb `find()`?
4. **Vertader o fals:** "`Files.readAllLines` és la millor opció per a un fitxer de 2 GB".

<details>
<summary>💡 Solucions</summary>

1. **`30`**. `5 + 10 + 15`. El `try-with-resources` del `FileWriter` escriu les tres línies i tanca; el del `BufferedReader` les llig i suma. Fixa't que el `FileWriter` sense `try-with-resources` hauria pogut deixar-te la meitat sense escriure.
2. `texto.split("\\s+")` → `["Hola", "mundo", "Java"]`. El `\\s+` talla per "un o més espais", just el que sobrava.
3. `server=db01` està en el **grup 4** (`(.*)`, "tot el que quede"). I ull: amb `matches()` no coincidiria si el patró no cobreix la línia sencera des del principi; `find()` busca subcadenes sense exigir començar a l'inici. Recorda: `matches()` = patró complet, `find()` = cerca de subcadena.
4. **Fals.** `readAllLines` ho carrega tot en memòria. Per a 2 GB usa `BufferedReader` o `Files.lines(...)` i processa en streaming, línia a línia.

</details>

---

## 🧩 Crucigrama de Bits

```
Horizontal:
1. Interfície-marca per a guardar objectes en fitxers (11 lletres)
3. Mètode de String que valida que TOT el text complica amb el patró (7 lletres)
5. Classe que embolica FileReader per a llegir línies senceres (15 lletres)
6. API moderna de fitxers: Files i Paths (3 lletres)
7. El que torna readLine() quan s'acaba el fitxer (4 lletres)

Vertical:
2. Bloc que tanca recursos automàticament (16 lletres)
4. Classe que representa una ruta sense llegir contingut (4 lletres)
```

<details>
<summary>📝 Solucions</summary>

**Horizontal:** 1. SERIALIZABLE · 3. MATCHES · 5. BUFFEREDREADER · 6. NIO · 7. NULL
**Vertical:** 2. TRYWITHRESOURCES · 4. FILE

</details>

---

## 💬 Preguntes d'Entrevista de Treball

> Preguntes reals que et farien per a programador Java junior.

1. **"Explícam'ho, com si jo fóra la teua àvia, la diferència entre `File`, `FileReader` i `FileWriter`."**
2. **"Què és `try-with-resources` i per què hauries d'usar-lo sempre amb fitxers?"**
3. **"Quina és la diferència entre `find()` i `matches()` en una regex?"**
4. **"Com guardaries i recuperaries una llista d'objectes en un fitxer?"**
5. **"Què és l'infern de les contrabarres en les regex de Java?"**
6. **"Quan usaríes `BufferedReader` en comptes de `Scanner`, i al revés?"**

---

## 🤷 No hi ha preguntes tontes

> ❓ **`File` i `Path` són el mateix?**

Quasi. Tots dos representen rutes. `File` és de l'API antiga (`java.io`) i `Path` de la moderna (`java.nio.file`). `Path` + `Files` és el recomanat en codi nou, però `File` continua funcionant i el veuràs en projectes antics. Saber els dos és ser un programador complet.

---

> ❓ **Puc guardar qualsevol objecte amb la serialització?**

Només si la seua classe (i totes les seues classes d'atributs) implementa `Serializable`. Si no, `NotSerializableException`. I la serialització és de Java a Java: si un altre programa (Python, JavaScript) ha de llegir les teues dades, usa text, CSV o JSON.

---

> ❓ **Es poden validar documents HTML amb regex?**

No. HTML no és un llenguatge regular: té etiquetes niades que les regex no poden rastrejar. Per a això existixen els *parsers*. Les regex són per a text pla amb patrons, no per a arbres d'etiquetes. Eixa pregunta se la fan tots, i la resposta és la mateixa: "no".

---

> ❓ **`\w` reconeix els accents i la ñ?**

No per defecte. `\w` és `[a-zA-Z0-9_]`. Per a "pérez" o "muñoz" usa `[a-zA-ZáéíóúüñÑ]` o la bandera `Pattern.UNICODE_CHARACTER_CLASS`.

---

## 🎬 Post-Crèdits

La programadora acaba el seu gestor de contactes: guarda cada contacte amb `Serializable`, els carrega en arrancar amb `ObjectInputStream`, valida el correu de cadascun amb una regex compilada i escriu un informe bonic amb `PrintWriter.printf`. Funciona. Fins que intenta llegir el fitxer des d'una altra màquina i li ix `ClassNotFoundException`.

S'acosta CONRAD, el compilador cascarrabutxes, amb la seua tassa fumant.

**CONRAD:** — Has vist? La serialització guarda les dades, però el fitxer se la fot amb qualsevol: només val per al mateix programa amb la mateixa classe. Quan vulgues que les teues dades les entenga qualsevol sistema, hauràs d'anar-te'n de viatge: guardar-les en una base de dades.

**Programadora:** — Una base de dades? I com conecte Java amb una?

**CONRAD:** — *assentix* Amb JDBC: una connexió, un `Statement`, i les teues dades deixen d'estar en un fitxer per a viure en taules amb consultes. Tu solta el `FileWriter` i ves preparant el SQL.

**PROXIMAMENT EN U13:** Connexió a bases de dades amb JDBC. El moment en què els teus programes aprenen a parlar amb un gestor de bases de dades relacional. 🗄️

---

📁 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-ficheros-regex) · **Anterior:** [08 · Regex en acció: matches, replaceAll, split i validacions](/ApuntesProgramacion/va/12-ficheros-regex/08-regex-aplicaciones) · **Següent:** **[U13 · Connexió a BD amb JDBC](/ApuntesProgramacion/va/13-conexion-bases-datos)**