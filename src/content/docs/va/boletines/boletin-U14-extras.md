---
title: "Butlletí U14 — Extres"
description: "CodeWars i AceptaElReto per a anar més enllà de les APIs web"
---

# 📝 Butlletí U14 — Extres

> Exercicis de CodeWars i AceptaElReto amb pistes i solucions. Les solucions estan amagades: esgota la teua pista abans de mirar-les.

---

## CodeWars

### 1. IP Validation

Et donen una cadena que diu ser una adreça IPv4. Escriu una funció que torne `true` només si és una IP vàlida: quatre parts, cada una un número entre 0 i 255, sense zeros a l'esquerra i sense caràcters estranys.

**Exemples:** `"1.2.3.4"` → `true`, `"123.045.067.089"` → `false` (zeros a l'esquerra), `"12.34.56"` → `false` (falten parts), `"a.b.c.d"` → `false`.

- [Enunciat a CodeWars](https://www.codewars.com/kata/515decfd9dcfc23bb6000006)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Dividix per `.` amb `split("\\.", -1)` — compte: el `.` és un comodí en regex, per això s'escapa. Han de ser exactament 4 parts, cada una entre 0 i 255, sense zeros a l'esquerra i amb tots els caràcters dígits.

</details>

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static boolean isValidIP(String ip) {
        String[] partes = ip.split("\\.", -1);
        if (partes.length != 4) return false;

        for (String p : partes) {
            if (p.isEmpty() || p.length() > 3) return false;
            if (p.length() > 1 && p.charAt(0) == '0') return false;
            for (char c : p.toCharArray()) {
                if (!Character.isDigit(c)) return false;
            }
            int n = Integer.parseInt(p);
            if (n < 0 || n > 255) return false;
        }
        return true;
    }
}
```

Tres trampes típiques: el `.` en regex (cal escapar-lo), el `-1` en `split` (per a no descartar parts buides finals) i els zeros a l'esquerra (`"045"` no és vàlid encara que valga 45). És un exercici de validació de format, com validar una URL o un JSON.

</details>

---

### 2. Simple URL parser

Et donen una URL com `"http://www.codewars.com/kata/56f8fe6a2e6c0dc83b0008a7?page=1"`. Escriu una funció que la dividisca en **protocol**, **domini** i **ruta**.

**Exemples:** `"http://www.codewars.com/path"` → protocol `http`, domini `www.codewars.com`, ruta `/path`. `"https://example.com"` → protocol `https`, domini `example.com`, ruta buida.

- [Enunciat a CodeWars](https://www.codewars.com/kata/56f8fe6a2e6c0dc83b0008a7)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Busca primer `://` (dividix protocol de la resta). Després busca la primera `/` (dividix domini de ruta). Si alguna cosa no està, eixe camp queda buit. Usa `indexOf` i `substring`.

</details>

<details>
<summary>🔄 Solució</summary>

```java
record UrlParts(String protocolo, String dominio, String ruta) {}

public class Kata {
    public static UrlParts parsear(String url) {
        String restante = url;
        String protocolo = "";

        int dosPuntos = restante.indexOf("://");
        if (dosPuntos >= 0) {
            protocolo = restante.substring(0, dosPuntos);
            restante = restante.substring(dosPuntos + 3);
        }

        String dominio;
        String ruta = "";
        int barra = restante.indexOf('/');
        if (barra >= 0) {
            dominio = restante.substring(0, barra);
            ruta = restante.substring(barra);
        } else {
            dominio = restante;
        }

        return new UrlParts(protocolo, dominio, ruta);
    }
}
```

És la mateixa anatomia de URL del punt 1, portada a codi: el protocol acaba en `://`, el domini acaba en `/`. `indexOf` localitza els separadors i `substring` talla. Un `record` (U11) és la forma neta de tornar tres dades alhora.

</details>

---

### 3. Extract the domain name from a URL

Et donen una URL completa i has de tornar només el **nom de domini** (sense protocol, sense `www.`, sense extensió).

**Exemples:** `"http://github.com/carbonfive/raygun"` → `"github"`, `"http://www.zombie-bites.com"` → `"zombie-bites"`, `"https://www.cnet.com"` → `"cnet"`.

- [Enunciat a CodeWars](https://www.codewars.com/kata/514a024011ea54fbca000077)
- Dificultat: 5 kyu

<details>
<summary>💡 Pista</summary>

Treu primer el protocol (`http://`, `https://`), després el `www.` si està, i finalment talla pel primer `.`. L'ordre de les operacions importa.

</details>

<details>
<summary>🔄 Solució</summary>

```java
public class Kata {
    public static String domainName(String url) {
        String s = url;
        s = s.replace("http://", "").replace("https://", "");
        if (s.startsWith("www.")) {
            s = s.substring(4);
        }
        int punto = s.indexOf('.');
        return punto >= 0 ? s.substring(0, punto) : s;
    }
}
```

El truc és l'ordre: sense protocol primer, `www.zombie-bites.com` començaria per `www.` i el tallaries malament. `replace` neteja el protocol, `startsWith` detecta el `www.` i `indexOf('.')` troba on acaba el nom. Menut, però amb trampes.

</details>

---

### 4. Decode the Morse code

Et donen un missatge en codi Morse (lletres separades per un espai, paraules per tres espais). Escriu-lo en text llegible.

**Exemple:** `"... --- ..."` → `"SOS"`, `".... . -.--   .--- ..- -.. ."` → `"HEY JUDE"`.

- [Enunciat a CodeWars](https://www.codewars.com/kata/54b724efac3d5402db00065e)
- Dificultat: 6 kyu

<details>
<summary>💡 Pista</summary>

Crea un `Map` amb cada símbol Morse → lletra (els mapes, de la U11). Separa paraules per tres espais i lletres per un. No oblides `trim()` els extrems.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.util.HashMap;
import java.util.Map;

public class MorseDecoder {

    static final Map<String, String> MORSE = new HashMap<>();
    static {
        MORSE.put(".-", "A"); MORSE.put("-...", "B"); MORSE.put("-.-.", "C");
        MORSE.put("-..", "D"); MORSE.put(".", "E"); MORSE.put("..-.", "F");
        MORSE.put("--.", "G"); MORSE.put("....", "H"); MORSE.put("..", "I");
        MORSE.put(".---", "J"); MORSE.put("-.-", "K"); MORSE.put(".-..", "L");
        MORSE.put("--", "M"); MORSE.put("-.", "N"); MORSE.put("---", "O");
        MORSE.put(".--.", "P"); MORSE.put("--.-", "Q"); MORSE.put(".-.", "R");
        MORSE.put("...", "S"); MORSE.put("-", "T"); MORSE.put("..-", "U");
        MORSE.put("...-", "V"); MORSE.put(".--", "W"); MORSE.put("-..-", "X");
        MORSE.put("-.--", "Y"); MORSE.put("--..", "Z");
        MORSE.put("-----", "0"); MORSE.put(".----", "1"); MORSE.put("..---", "2");
        MORSE.put("...--", "3"); MORSE.put("....-", "4"); MORSE.put(".....", "5");
        MORSE.put("-....", "6"); MORSE.put("--...", "7"); MORSE.put("---..", "8");
        MORSE.put("----.", "9");
    }

    public static String decode(String morseCode) {
        StringBuilder resultado = new StringBuilder();
        for (String palabra : morseCode.trim().split(" {3}")) {
            for (String letra : palabra.split(" ")) {
                resultado.append(MORSE.getOrDefault(letra, ""));
            }
            resultado.append(" ");
        }
        return resultado.toString().trim();
    }
}
```

El `Map` associa cada símbol amb la seua lletra (U11), `split(" {3}")` separa paraules per tres espais i `split(" ")` separa lletres per un. `getOrDefault` torna `""` si el símbol és rar, i `trim()` trau els espais dels extrems. És un problema de parseig: separar, consultar, recompondre.

</details>

---

## AceptaElReto

### 5. 396 — Quants dies falten?

Es donen dues dates i cal dir **quants dies hi ha entre elles** (els dies que falten per a la segona des de la primera).

**Entrada:** diversos casos de prova. Cada cas porta dues dates amb el format dia, mes i any. L'entrada acaba quan no queden dades.

- [Enunciat a AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=396)
- Dificultat: ⭐⭐

<details>
<summary>💡 Pista</summary>

Convertix cada data a dia de l'any (nombre de dies des de l'1 de gener) i resta. O, més directe amb Java modern: `ChronoUnit.DAYS.between(fecha1, fecha2)` amb `LocalDate`.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Scanner;

public class CuantosDiasFaltan {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (sc.hasNextInt()) {
            int d1 = sc.nextInt(), m1 = sc.nextInt(), a1 = sc.nextInt();
            int d2 = sc.nextInt(), m2 = sc.nextInt(), a2 = sc.nextInt();

            LocalDate f1 = LocalDate.of(a1, m1, d1);
            LocalDate f2 = LocalDate.of(a2, m2, d2);

            long dias = ChronoUnit.DAYS.between(f1, f2);
            System.out.println(dias);
        }
        sc.close();
    }
}
```

`LocalDate` et llibera dels càlculs manuals (mesos de 30 i 31, anys bixests...). `ChronoUnit.DAYS.between` torna els dies entre dues dates, siga el desfasament positiu o negatiu. L'alternativa "clàssica" era convertir cada data a dia de l'any i restar, però Java modern ho fa en una línia.

</details>

---

### 6. 462 — Dia de la setmana

Et donen una data (dia, mes i any) i has de dir **quin dia de la setmana és**.

**Entrada:** diversos casos. Cada cas: una data en una línia amb dia, mes i any. L'entrada acaba amb `0 0 0`.

- [Enunciat a AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=462)
- Dificultat: ⭐⭐

<details>
<summary>💡 Pista</summary>

Usa la congruència de Zeller o un dia de referència conegut per a calcular el residu. En Java modern, `LocalDate.of(a, m, d).getDayOfWeek()` et dona el dia directament.

</details>

<details>
<summary>🔄 Solució</summary>

```java
import java.time.LocalDate;
import java.util.Scanner;

public class DiaSemana {

    static final String[] DIAS = {"LUNES", "MARTES", "MIÉRCOLES",
        "JUEVES", "VIERNES", "SÁBADO", "DOMINGO"};

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (sc.hasNextInt()) {
            int d = sc.nextInt(), m = sc.nextInt(), a = sc.nextInt();
            if (d == 0 && m == 0 && a == 0) break;

            LocalDate fecha = LocalDate.of(a, m, d);
            // getDayOfWeek().getValue(): 1=DILLUNS ... 7=DIUMENGE
            System.out.println(DIAS[fecha.getDayOfWeek().getValue() - 1]);
        }
        sc.close();
    }
}
```

`getDayOfWeek().getValue()` torna 1 per al dilluns i 7 per al diumenge; restant 1 tens l'índex de l'array. La "manera de concurs" era la congruència de Zeller (una fórmula que calcula el dia sense calendari), però `LocalDate` fa el mateix per dins: mateix resultat, menys codi.

</details>

---

> 🧭 **I si et quedes amb ganes?** Quan domines servidors i clients HTTP, torna als problemes d'unitats anteriors i planteja'ls com a APIs: un problema que tornava text per consola pot tornar JSON per HTTP. El material no es perd: es reutilitza.