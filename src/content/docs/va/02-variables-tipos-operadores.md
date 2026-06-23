---
title: "Unidad 2: Variables, Tipos de Datos y Operadores"
nav_order: 2
---
🎯 **Objectius d'aprenentatge**
- Declarar i usar variables de tipus primitius
- Comprendre la diferència entre tipus primitius i String
- Utilitzar operadors aritmètics, relacionals i lògics
- Aplicar casting i conversions entre tipus
- Generar nombres aleatoris amb Math.random()

## Variables: Les Caixes On Viuen Les Teues Dades

Imagina't que la memòria del teu ordinador és un magatzem gegant ple de prestatgeries. Cada prestatgeria té caixes. Les **variables** són eixes caixes, i cada caixa té una etiqueta per a que sàpies què hi ha dins.

### Les Caixes (Declaració de Variables)

Per a crear una caixa li dius a Java:

```java
tipo nombreDeLaCaja = valorQueMetoDentro;
```

Exemples reals:

```java
int edad = 25;              // Caja etiquetada "edad" con un 25 dentro
double precio = 19.99;      // Caja con decimales
String nombre = "María";    // Caja mágica que guarda texto
boolean hambre = true;      // Caja de verdadero/falso (ahora mismo: true)
```

> **💡 Consell:**
>
> Les variables es diuen així perquè... ¡varien! Pots canviar el seu contingut. `int edad = 25;` i després `edad = 26;` el dia del teu cumple. L'etiqueta és la mateixa, el contingut canvia.

### Les Regles de Nomenclatura (o com no ficar-la)

- Poden tindre lletres, números, `_` i `$`. *No* espais ni ñ'ş ni coses rares.
- No poden començar amb número. `1numero` és il·legal. `numero1` és legal. Així de tiquismiquis és Java.
- Les majúscules importen: `edad`, `Edad` i `EDAD` són tres caixes distintes. Com si etiquetares "Zapatos", "zapatos" i "ZAPATOS".
- No uses paraules reservades: `int`, `class`, `if`, `while`... són de Java, no teues.
- Usa **camelCase**: `miVariableEjemplo`. Com un camell, amb gepa enmig.

### Els 8 Primitius: Caixes de Mides Distintes

Java té 8 tipus primitius. Pensa en ells com caixes de distintes mides al teu magatzem:

| Tipus | Mida | El que cap | Analogia |
|-------|------|------------|----------|
| `byte` | 8 bits | -128 a 127 | Caixa de llumins |
| `short` | 16 bits | -32.768 a 32.767 | Caixa de sabates |
| `int` | 32 bits | -2.147M a 2.147M | Caixa de mudança (la que més usaràs) |
| `long` | 64 bits | -9 quatrilions a +9 quatrilions | Contenidor de vaixell |
| `float` | 32 bits | Decimals de precisió simple | Got d'aigua |
| `double` | 64 bits | Decimals de precisió doble | Cubell d'aigua |
| `char` | 16 bits | Un sol caràcter Unicode | Una lletra en una caixa de sabates |
| `boolean` | 1 bit | `true` o `false` | Interruptor de llum |

```java
byte nivel = 100;
short poblacion = 30000;
int habitantes = 1500000;           // El más usado
long distancia = 384400000L;        // La L al final es obligatoria
float precio = 12.99f;              // La f al final es obligatoria
double pi = 3.14159265359;
char letra = 'A';                   // Comillas SIMPLES para char
boolean esJavaDivertido = true;     // Esto es opinable
```

> **📝 Nota:**
>
> Usa `int` per a quasi tot el numèric enter. Només usa `long` si vas a contar estrelles. Usa `double` per a decimals a menys que estalviar memòria siga el teu fetitxe.

### String: La Caixa Màgica (No és primitiu, però ho pareix)

`String` no és primitiu, és una **classe**. Però es comporta tan natural que pareix primitiu. Es com un amic que encaixa tan bé en el teu grup que jurares que és família.

```java
String saludo = "Hola, DAM";
String nombre = new String("Ana");   // También se puede crear así
```

> **⚠️ Advertència:**
>
> Els `String` són **inmutables**. Una volta creats, no es poden canviar. Quan fas `texto = texto + " más"`, en realitat estàs tirant el vell i creant-ne un de nou. Es com si cada volta que volgueres posar un cartell nou cremares l'anterior.

### Constants: Caixes amb Superglue

Les constants es declaren amb `final`. Una volta que fiques alguna cosa ahí, no ixes ni amb palanca.

```java
final double IVA = 0.21;
final int MAXIMO_INTENTOS = 3;
final String NOMBRE_APP = "Gestión DAM";

IVA = 0.10;  // ERROR: ¡Has roto Java! (de compilación, no te preocupes)
```

Per convenció, les constants s'escriuen EN MAJÚSCULES_AMB_GUIONS_BAIXOS. Com si estigueren cridant "¡SOC IMMUTABLE!".

### Casting: Prem que Cap

Hi ha dos tipus de conversions:

- **Implícita (Widening)**: De caixa menuda a gran. Java ho fa sol. `int → long → double`. Com canviar d'un pis a una mansió. No preguntes, simplement et mudes.
- **Explícita (Narrowing)**: De gran a menuda. Java t'obliga a posar `(tipus)` davant. Com ficar una maleta XXL al maleter d'un Smart: has d'empènyer `(tipus)` i resar.

```java
// Implícita: ensanchando
int num = 100;
long numLong = num;           // Cabe, no problema
double numDouble = num;       // También

// Explícita: estrechando
double precio = 19.99;
int entero = (int) precio;    // Pierdes los .99 → sale 19
System.out.println(entero);   // 19 — los céntimos desaparecen en el olvido
```

### Math.random(): El Casino de Java

`Math.random()` retorna un nombre aleatori entre 0.0 i 1.0 (l'1.0 no està inclòs, com quan et toca la loteria però no).

```java
double aleatorio = Math.random();                    // Entre 0.0 y 0.999999...
int dado = (int) (Math.random() * 10);              // Entre 0 y 9
int dadoReal = (int) (Math.random() * 6) + 1;       // Entre 1 y 6 (como un dado)
```

> **💡 Consell:**
>
> Per a un nombre entre `min` i `max`: `(int)(Math.random() * (max - min + 1)) + min`. Exemple del 5 al 10: `(int)(Math.random() * 6) + 5`.

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** El *casting* explícit amb `(tipus)` pot truncar valors. Comprova sempre si el valor cap abans de forçar-lo.
>
> **Exercici 1: El Guarda de Magatzem**
>
> Eres el guarda d'un magatzem de dades. Et donen estes instruccions:
>
> ```java
> int a = 10;
> double b = a;
> int c = (int) b;
> byte d = (byte) c;
> System.out.println(d);
> ```
>
> **Segueix el procés pas a pas:**
> 1. `int a = 10;` — Fiques un 10 en una caixa int.
> 2. `double b = a;` — Agafes el 10 i el fiques en una caixa double. Conversió implícita.
> 3. `int c = (int) b;` — Agafes el 10.0 del double. Necessites `(int)` perquè passar de double a int requereix apretar.
> 4. `byte d = (byte) c;` — Agafes el 10 del int i el fiques en un byte. Cap, però forces amb `(byte)`.
> 5. Imprimeix: **10**.
>
> **Ara prova este:**
> ```java
> int grande = 300;
> byte pequeno = (byte) grande;
> System.out.println(pequeno);
> ```
>
> Què ix? (Pista: en un byte només caben -128 a 127. Sobren 172. En binari, es truncaren els bits sobrants). Resultat: **44**. Es com intentar ficar un elefant en un Mini Cooper i que isca un gos salchicha.

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** `==` compara referències (són el mateix objecte?), `.equals()` compara contingut (tenen el mateix text?).
>
> **Exercici 2: Què Imprimeix Este Embolic de Strings?**
>
> Sense executar, digues QUÈ imprimeix exactament este codi:
>
> ```java
> String a = "Hello";
> String b = "Hello";
> String c = new String("Hello");
> System.out.println(a == b);
> System.out.println(a == c);
> ```
>
> **Resposta:** `true` i `false`. `a` i `b` apunten al mateix objecte en el "pool de Strings" (Java reutilitza literals iguals). Però `c` es va crear amb `new String(...)`, així que és un objecte nou. `==` compara referències, no contingut. Per a comparar contingut usa `.equals()`: `a.equals(c)` retornaria `true`. ¡Trampa típica d'examen!

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** Els operadors `++` pre i post tenen prioritats diferents. Pre: primer canvia, després usa. Post: primer usa, després canvia.
>
> **Exercici 3: Increment Misteriós**
>
> Què imprimeix este codi?
>
> ```java
> int a = 5;
> int b = a * 2 + ++a;
> System.out.println("a = " + a);
> System.out.println("b = " + b);
> ```
>
> **Resposta:** `a = 6`, `b = 16`. `++a` s'avalua primer (unari), `a` passa a 6. Després `a * 2 + 6` → `5 * 2 + 6` → `16`.
>
> Si haguera sigut `a * 2 + a++`, seria distint: `5 * 2 + 5 = 15` (primer usa a=5, després incrementa a 6).

### Mètodes Útils de String (perquè els necessitaràs)

```java
String texto = "  Programación DAM  ";
texto.length();              // 18
texto.trim();                // "Programación DAM" (sin espacios)
texto.toUpperCase();         // "  PROGRAMACIÓN DAM  "
texto.toLowerCase();         // "  programación dam  "
texto.contains("DAM");       // true
texto.startsWith("  ");      // true
texto.endsWith("AM  ");      // true
texto.indexOf("DAM");        // 14 ¿dónde empieza "DAM"?
texto.substring(2, 13);      // "Programación"
texto.replace("DAM", "DAW"); // "  Programación DAW  "
```

## Operadors: El Gimnàs de les Dades

Les variables estan molt bé, però no serveixen de res si no fas coses amb elles. Els **operadors** són les màquines de pesos del teu gimnàs de dades: sumen, resten, comparen i transformen.

### Operadors Aritmètics: El Dia al Gym

| Operador | Exercici | Exemple |
|----------|----------|---------|
| `+` | Press de banca | `5 + 3 = 8` |
| `-` | Curl de bíceps | `5 - 3 = 2` |
| `*` | Sentadilla | `5 * 3 = 15` |
| `/` | Pes mort | `10 / 3 = 3` (enters) o `10.0 / 3 = 3.333...` |
| `%` | L'odiat abdominal | `10 % 3 = 1` (el reste de 10/3) |

```java
int a = 10;
int b = 3;
double c = 10.0;

System.out.println(a / b);            // 3 (división entera)
System.out.println(a % b);            // 1 (el resto)
System.out.println(c / b);            // 3.333... (división real)
System.out.println((double) a / b);   // 3.333... (obligas decimal)
```

**La divisió entera mata.** Si tens `int alumnos = 17; int grupos = 5;` i fas `alumnos / grupos`, Java diu que cada grup té **3** alumnes. Per a Java, 17 dividit entre 5 són 3. Punt.

### Precedència: Qui Va Primer?

```java
int resultado = 2 + 3 * 4;        // 14 — la multiplicación se cuela
int conParentesis = (2 + 3) * 4;  // 20 — los paréntesis tienen pase VIP
```

**La llei del menjador:**
1. **Parèntesis `()`** — Passe VIP, van els primers.
2. **Multiplicació, divisió i mòdul `* / %`** — Els populars.
3. **Suma i resta `+ -`** — Els normals, els últims.

### Operadors d'Assignació Composta: La Drecera Peresosa

```java
int x = 10;
x += 5;   // x = 15  (x = x + 5, pero más cool)
x -= 3;   // x = 12
x *= 2;   // x = 24
x /= 4;   // x = 6
x %= 3;   // x = 0
```

Es com si en lloc d'anar a la cuina a per un got d'aigua, tingueres una aixeta al sofà.

### `++` i `--`: Flexions per a Variables

```java
int a = 5;
int b = a++;  // b = 5, a = 6 (POST: "usa y luego sube")
int c = ++a;  // a = 7, c = 7 (PRE: "sube y luego usa")
```

> **💡 Consell:**
>
> **Regla d'or:** Si uses `++` o `--` *dins* d'una expressió complicada, estaràs escrivint codi que ni tu entendràs en una setmana. Usa'ls sols, en la seua pròpia línia.

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** Desglossa l'expressió pas a pas. Quin valor té `x` en cada moment?
>
> **Exercici 4: L'Acròbata de les Variables**
>
> Sense executar, calcula quant val tot ací:
>
> ```java
> int x = 3;
> int y = x++ + ++x;
> System.out.println("x = " + x + ", y = " + y);
> ```
>
> **Pas a pas:**
> 1. `x = 3`
> 2. `x++` — POST: usa x (3), després incrementa x a 4. El valor de `x++` és **3**.
> 3. `++x` — PRE: x val 4 ara. Incrementa x a **5**, després val **5**.
> 4. `y = 3 + 5 = 8`
> 5. Resultat: `x = 5, y = 8`.
>
> Als programadors professionals també els costa. Per això quasi ningú escriu codi així en producció. Però en els exàmens... ¡ai, apareix!

### Operadors Relacionals: El Jutge de la Discussió

```java
int edad = 18;
boolean puedeVotar = edad >= 18;                    // true
boolean tieneDescuento = edad < 12 || edad > 65;    // false
boolean noEsEl = edad != 18;                        // false
```

### Operadors Lògics: El Club Nocturn

- **`&&` (AND)**: Tens més de 18 I tens entrada? Les dos s'han de complir.
- **`||` (OR)**: Tens més de 18 O eres el amo? Basta una.
- **`!` (NOT)**: NO tens menys de 18?

```java
boolean mayorEdad = true;
boolean tieneEntrada = false;

boolean entra = mayorEdad && tieneEntrada;   // false
boolean entraVip = mayorEdad || tieneEntrada; // true

int x = 5;
boolean resultado = (x > 10) && (++x > 0);  // false, y x sigue siendo 5
```

**¡Curtcircuit!** Amb `&&`, si el primer és `false`, Java ni es molesta en mirar el segon. Amb `||`, si el primer és `true`, igual.

### L'Operador Ternari: El Bouncer del Club

```java
String mensaje = (edad >= 18) ? "Pasa, joven" : "Vuelve cuando crezcas";

int nota = 7;
String resultado = nota >= 5 ? "Aprobado" : "Suspenso";
```

L'estructura és: `condició ? valorSiTrue : valorSiFalse`.

### 🧩 EL LÍO

El corrector automàtic de l'institut ha escopit este codi ple d'errors. Identifica i corregeix els 5 errors que té:

```java
public class LioVariables {
    public static void main(String[] args) {
        int a = 10.5;
        double b = "Hola";
        String c = true;
        int d = a + c;
        System.out.println("Resultado: " + d)
    }
}
```

Pista: cada variable ha de tindre el tipus correcte per al seu valor.

> 🕶️ **Don Tip:** Repassa els tipus primitius: `int` només admet enters, `double` admet decimals, `String` va amb cometes dobles.

## No Hi Ha Preguntes Tontes!

> **❓ No Hi Ha Preguntes Tontes!**
>
> **Q:** Per què `long` porta L i `float` porta f al final?
>
> **A:** Perquè si poses `long x = 3000000000;` sense la L, Java pensa que és un `int` i es queixa. El float necessita f perquè per defecte els decimals són double.
>
> **Q:** Què passa si dividisc un `int` entre un altre `int` i esper decimals?
>
> **A:** Java et donarà un enter. `5 / 2 = 2`, no 2.5. Per a decimals, almenys un ha de ser double: `5 / 2.0 = 2.5` o `(double)5 / 2 = 2.5`.
>
> **Q:** Quina és la diferència entre `=` i `==`? Sempre m'embolique.
>
> **A:** `=` és *assignar*: "agafa este valor i fica'l en esta caixa". `==` és *comparar*: "són iguals?". Confondre'ls és l'error més clàssic. Es com confondre "posa la taula" amb "està posada la taula?".
>
> **Q:** I el `%` per a què servix en la vida real?
>
> **A:** Per a saber si un nombre és parell (`numero % 2 == 0`), per a cicles, per a jocs. Sense ell no tindries hores en un rellotge ni res cíclic.
>
> **Q:** Precedència, associativitat... he de memoritzar-ho tot?
>
> **A:** No. La regla d'or: *quan tingues dubtes, posa parèntesis*. `resultado = (a + b) * (c - d)` és molt més llegible. Els parèntesis no dolen.

## Més Exemples de Codi

```java
public class CalculadoraBasica {
    public static void main(String[] args) {
        int a = 15;
        int b = 4;

        System.out.println("a + b = " + (a + b));
        System.out.println("a - b = " + (a - b));
        System.out.println("a * b = " + (a * b));
        System.out.println("a / b = " + (a / b) + " (división entera)");
        System.out.println("a / b real = " + ((double) a / b));
        System.out.println("a % b = " + (a % b) + " (resto)");
    }
}
```

```java
public class JuegoDeDados {
    public static void main(String[] args) {
        int dado1 = (int) (Math.random() * 6) + 1;
        int dado2 = (int) (Math.random() * 6) + 1;
        int suma = dado1 + dado2;

        System.out.println("Dado 1: " + dado1);
        System.out.println("Dado 2: " + dado2);
        System.out.println("Suma: " + suma);

        boolean esPar = suma % 2 == 0;
        String mensaje = esPar ? "Suma par — ganas" : "Suma impar — pierdes";
        System.out.println(mensaje);
    }
}
```

## Resum (el que importa de veritat)

- Les variables són caixes etiquetades en la memòria.
- 8 tipus primitius: byte < short < int < long < float < double < char < boolean.
- `final` és superglue: constant que no canvia.
- Casting implícit = ficar caixa menuda en gran. Explícit = a la inversa amb pèrdues.
- `String` no és primitiu, és una classe. Però es comporta.
- `Math.random()` per a jugar a la loteria.
- `+ - * / %` són els bàsics. El % et dona el reste.
- `++` i `--` són flexions. Pre (primer puja) vs Post (primer usa).
- `&&` i `||` tenen curtcircuit: si la primera ja decidix, no miren la segona.
- El ternari `? :` és un if-else en una línia.
- La precedència se soluciona amb parèntesis. Sempre.

## Exercicis Proposats

1. **Caixes variades** Declara una variable de cada tipus primitiu, assigna-li un valor coherent i imprimeix el resultat.
2. **El casting assassí** Declara un `double` amb valor 9.99. Converteix-lo a `int` explícitament. Quin valor es perd?
3. **Nom al revés** Demana a l'usuari el seu nom i mostra: longitud, majúscules, primera i última lletra.
4. **Dau trucat** Genera 10 nombres aleatoris entre 1 i 6. Compta quants 6 han eixit.
5. **Constant del mal** Declara `final double PRECIO_BASE = 100;` i `final double IVA = 0.21`. Calcula el preu final i intenta modificar IVA després.
6. **Quant mesura?** Calcula l'àrea d'un cercle amb `Math.PI`. Radi = 7.5.
7. **Endevina el número** La màquina tria un número a l'atzar de l'1 al 100. L'usuari introduïx un número i el programa diu si és major, menor o igual.
8. **L'intercanvi** Declara `int a = 5; int b = 10;`. Intercanvia els seus valors usant una tercera variable temporal.
9. **Àrea i perímetre** Calcula l'àrea i el perímetre d'un rectangle amb base 7.5 i altura 3.2.
10. **Parell o senar?** Demana un número i determina si és parell o senar usant `%`.
11. **Any de traspàs** Demana un any. Determina si és de traspàs: divisible entre 4 I (no entre 100 O sí entre 400).
12. **Ternari en acció** Pregunta l'edat a l'usuari. Usa el ternari per a mostrar "Major d'edat" o "Menor d'edat".
13. **L'enigma del ++** Sense executar, determina el resultat de: `int a = 2; int b = a++ * 3 + --a;`
14. **Curtcircuit** Declara `int x = 0;`. Fes `boolean test = (5 < 3) && (++x == 1);`. Imprimeix x. S'incrementà?
15. **Conversió Celsius ↔ Fahrenheit** Demana graus Celsius. Convertix a Fahrenheit (`°F = °C × 9/5 + 32`).
16. **Els desbordats** Declara `int max = Integer.MAX_VALUE;` i suma-li 1. Què passa?

---

**RAs treballats en esta unitat:**
- **RA2** - Escriu i prova programes senzills

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
