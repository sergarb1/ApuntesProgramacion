---
title: "Boletín U14 — Extras"
description: "CodeWars y AceptaElReto para ir más allá de las APIs web"
---

# 📝 Boletín U14 — Extras

> Ejercicios de CodeWars y AceptaElReto con pistas y soluciones. Las soluciones están ocultas: agota tu pista antes de mirarlas.

---

## CodeWars

### 1. IP Validation

Te dan una cadena que dice ser una dirección IPv4. Escribe una función que devuelva `true` solo si es una IP válida: cuatro partes, cada una un número entre 0 y 255, sin ceros a la izquierda y sin caracteres extraños.

**Ejemplos:** `"1.2.3.4"` → `true`, `"123.045.067.089"` → `false` (ceros a la izquierda), `"12.34.56"` → `false` (faltan partes), `"a.b.c.d"` → `false`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/515decfd9dcfc23bb6000006)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

Divide por `.` con `split("\\.", -1)` — ojo: el `.` es un comodín en regex, por eso se escapa. Deben ser exactamente 4 partes, cada una entre 0 y 255, sin ceros a la izquierda y con todos los caracteres dígitos.

</details>

<details>
<summary>🔄 Solución</summary>

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

Tres trampas típicas: el `.` en regex (hay que escaparlo), el `-1` en `split` (para no descartar partes vacías finales) y los ceros a la izquierda (`"045"` no es válido aunque valga 45). Es un ejercicio de validación de formato, como validar una URL o un JSON.

</details>

---

### 2. Simple URL parser

Te dan una URL como `"http://www.codewars.com/kata/56f8fe6a2e6c0dc83b0008a7?page=1"`. Escribe una función que la divida en **protocolo**, **dominio** y **ruta**.

**Ejemplos:** `"http://www.codewars.com/path"` → protocolo `http`, dominio `www.codewars.com`, ruta `/path`. `"https://example.com"` → protocolo `https`, dominio `example.com`, ruta vacía.

- [Enunciado en CodeWars](https://www.codewars.com/kata/56f8fe6a2e6c0dc83b0008a7)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

Busca primero `://` (divide protocolo del resto). Luego busca la primera `/` (divide dominio de ruta). Si algo no está, ese campo queda vacío. Usa `indexOf` y `substring`.

</details>

<details>
<summary>🔄 Solución</summary>

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

Es la misma anatomía de URL del punto 1, llevada a código: el protocolo termina en `://`, el dominio termina en `/`. `indexOf` localiza los separadores y `substring` corta. Un `record` (U11) es la forma limpia de devolver tres datos a la vez.

</details>

---

### 3. Extract the domain name from a URL

Te dan una URL completa y tienes que devolver solo el **nombre de dominio** (sin protocolo, sin `www.`, sin extensión).

**Ejemplos:** `"http://github.com/carbonfive/raygun"` → `"github"`, `"http://www.zombie-bites.com"` → `"zombie-bites"`, `"https://www.cnet.com"` → `"cnet"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/514a024011ea54fbca000077)
- Dificultad: 5 kyu

<details>
<summary>💡 Pista</summary>

Quita primero el protocolo (`http://`, `https://`), luego el `www.` si está, y finalmente corta por el primer `.`. Orden de operaciones importa.

</details>

<details>
<summary>🔄 Solución</summary>

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

El truco es el orden: sin protocolo primero, `www.zombie-bites.com` empezaría por `www.` y lo cortarías mal. `replace` limpia el protocolo, `startsWith` detecta el `www.` y `indexOf('.')` encuentra dónde termina el nombre. Pequeño, pero con trampas.

</details>

---

### 4. Decode the Morse code

Te dan un mensaje en código Morse (letras separadas por un espacio, palabras por tres espacios). Escríbelo en texto legible.

**Ejemplo:** `"... --- ..."` → `"SOS"`, `".... . -.--   .--- ..- -.. ."` → `"HEY JUDE"`.

- [Enunciado en CodeWars](https://www.codewars.com/kata/54b724efac3d5402db00065e)
- Dificultad: 6 kyu

<details>
<summary>💡 Pista</summary>

Crea un `Map` con cada símbolo Morse → letra (los mapas, de la U11). Separa palabras por tres espacios y letras por uno. No olvides `trim()` los extremos.

</details>

<details>
<summary>🔄 Solución</summary>

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

El `Map` asocia cada símbolo con su letra (U11), `split(" {3}")` separa palabras por tres espacios y `split(" ")` separa letras por uno. `getOrDefault` devuelve `""` si el símbolo es raro, y `trim()` quita los espacios de los extremos. Es un problema de parseo: separar, consultar, recomponer.

</details>

---

## AceptaElReto

### 5. 396 — ¿Cuántos días faltan?

Se dan dos fechas y hay que decir **cuántos días hay entre ellas** (los días que faltan para la segunda desde la primera).

**Entrada:** varios casos de prueba. Cada caso trae dos fechas con el formato día, mes y año. La entrada termina cuando no quedan datos.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=396)
- Dificultad: ⭐⭐

<details>
<summary>💡 Pista</summary>

Convierte cada fecha a día del año (número de días desde el 1 de enero) y resta. O, más directo con Java moderno: `ChronoUnit.DAYS.between(fecha1, fecha2)` con `LocalDate`.

</details>

<details>
<summary>🔄 Solución</summary>

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

`LocalDate` te libera de los cálculos manuales (meses de 30 y 31, años bisiestos...). `ChronoUnit.DAYS.between` devuelve los días entre dos fechas, sea el desfase positivo o negativo. La alternativa "clásica" era convertir cada fecha a día del año y restar, pero Java moderno lo hace en una línea.

</details>

---

### 6. 462 — Día de la semana

Te dan una fecha (día, mes y año) y tienes que decir **qué día de la semana es**.

**Entrada:** varios casos. Cada caso: una fecha en una línea con día, mes y año. La entrada termina con `0 0 0`.

- [Enunciado en AceptaElReto](https://www.aceptaelreto.com/problem/statement.php?id=462)
- Dificultad: ⭐⭐

<details>
<summary>💡 Pista</summary>

Usa la congruencia de Zeller o un día de referencia conocido para calcular el residuo. En Java moderno, `LocalDate.of(a, m, d).getDayOfWeek()` te da el día directamente.

</details>

<details>
<summary>🔄 Solución</summary>

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
            // getDayOfWeek().getValue(): 1=LUNES ... 7=DOMINGO
            System.out.println(DIAS[fecha.getDayOfWeek().getValue() - 1]);
        }
        sc.close();
    }
}
```

`getDayOfWeek().getValue()` devuelve 1 para el lunes y 7 para el domingo; restando 1 tienes el índice del array. La "manera de concurso" era la congruencia de Zeller (una fórmula que calcula el día sin calendario), pero `LocalDate` hace lo mismo por dentro: mismo resultado, menos código.

</details>

---

> 🧭 **¿Y si te quedas con ganas?** Cuando domines servidores y clientes HTTP, vuelve a los problemas de unidades anteriores y plantéalos como APIs: un problema que devolvía texto por consola puede devolver JSON por HTTP. El material no se pierde: se reutiliza.