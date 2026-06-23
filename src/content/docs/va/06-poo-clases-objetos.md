---
title: "Unidad 4: POO - Clases y Objetos"
nav_order: 4
---
🎯 **Objectius d'aprenentatge**
- Crear classes, objectes i constructors
- Diferenciar entre classe i objecte
- Usar Scanner per a entrada per consola
- Entendre paquets i imports
- Sobreescriure toString() i equals()
- Usar this i sobrecàrrega de constructors

## POO: Els Teus Objectes Cobren Vida

Fins ara hem escrit programes lineals: això, després això, després això. Però el món real no funciona així. Al món real tens *coses*: un gos, un cotxe, un professor de programació amb ulleres de pasta. Cada cosa té **atributs** (color, edat, nombre de ganes de corregir exàmens) i **comportaments** (lladrar, accelerar, posar faltes d'ortografia).

La **Programació Orientada a Objectes (POO)** és simplement això: escriure codi com funciona el món real.

## Classes i Objectes: Tallagalletas vs Galetes

Una **classe** és un *tallagalletas* (un motle). Un **objecte** és la *galeta* que fas amb eixe motle.

Pots tindre un sol tallagalletas amb forma d'estrela i fer milions de galetes estrella. Totes tindran la mateixa forma, però cada una pot tindre diferent quantitat de pepitas de xocolate.

```java
// Esta es la clase (el cortapastas)
public class Galleta {
    String sabor;
    boolean tieneChocolate;

    public void comer() {
        System.out.println("Ñam, galleta sabor " + sabor);
    }
}
```

Per a crear galetes (objectes) a partir del motle:

```java
Galleta g1 = new Galleta();     // Primera galleta
g1.sabor = "Chocolate";
g1.tieneChocolate = true;

Galleta g2 = new Galleta();     // Segunda galleta (mismo molde)
g2.sabor = "Vainilla";
g2.tieneChocolate = false;

g1.comer();  // "Ñam, galleta sabor Chocolate"
g2.comer();  // "Ñam, galleta sabor Vainilla"
```

Dos galetes diferents (objectes diferents) amb el mateix tallagalletas (classe). Cada una amb els seus propis valors.

### Scanner: L'Intèrpret Amigable

Fins ara les dades estaven *escrites en el codi*. Però... i si volem que l'usuari meta dades? Ahí apareix `Scanner`, el nostre intèrpret personal.

```java
import java.util.Scanner;

public class CharlaConElUsuario {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);  // Creamos un intérprete

        System.out.print("¿Cómo te llamas? ");
        String nombre = sc.nextLine();         // Lee una línea entera

        System.out.print("¿Cuántos años tienes? ");
        int edad = sc.nextInt();               // Lee un número entero

        System.out.print("¿Cuánto mides (en metros)? ");
        double altura = sc.nextDouble();       // Lee un decimal

        System.out.println("Hola " + nombre + ", tienes " + edad + " años y mides " + altura + " m.");

        sc.close();  // Cierra el intérprete (buena educación)
    }
}
```

> **💡 Consell:** `Scanner` és de `java.util`. Si no poses `import java.util.Scanner;` dalt de tot, Java et mirarà amb cara de "no sé qui és eixe tal Scanner". Els imports són com presentar als teus amics abans de parlar d'ells.

> **⚠️ Advertència:** Quan barreges `nextInt()` i `nextLine()` poden passar coses rares. `nextInt()` llig el número però *deixa el salt de línia sense llegir*. Després `nextLine()` llig eixe salt de línia i sembla que es salta la pregunta. Solució: posa un `sc.nextLine();` extra després de `nextInt()` per a consumir eixa brosseta.

### Constructors: La Festa de Benvinguda

Quan crees un objecte, s'executa un **constructor**, que és un mètode especial que prepara l'objecte. Com la festa de benvinguda a un nou empleat.

```java
public class Persona {
    String nombre;
    int edad;

    // Constructor sin parámetros ("vale, te pongo valores por defecto")
    public Persona() {
        this.nombre = "Desconocido";
        this.edad = 0;
    }

    // Constructor con parámetros ("te paso los datos, tú inicialízalos")
    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    public void presentarse() {
        System.out.println("Hola, soy " + this.nombre + " y tengo " + this.edad + " años.");
    }
}
```

```java
Persona p1 = new Persona();                    // "Desconocido", 0
Persona p2 = new Persona("Ana", 25);           // "Ana", 25
p2.presentarse();                              // "Hola, soy Ana y tengo 25 años."
```

### ⭐ BE THE CODE, MY FRIEND: El Creador de Persones

> 🕶️ **Don Tip:** Segueix cada `new` com si creares un objecte en la memòria. Després segueix les crides a mètodes pas a pas.

Vas a ser la JVM. Et donen:

```java
public class Coche {
    String marca;
    int velocidad;

    public Coche(String marca) {
        this.marca = marca;
        this.velocidad = 0;
    }

    public void acelerar(int incremento) {
        this.velocidad += incremento;
    }

    public void frenar(int decremento) {
        this.velocidad -= decremento;
        if (this.velocidad < 0) this.velocidad = 0;
    }

    public static void main(String[] args) {
        Coche c = new Coche("Seat");
        c.acelerar(50);
        c.acelerar(30);
        c.frenar(20);
        System.out.println(c.marca + " va a " + c.velocidad + " km/h");
    }
}
```

**Traça mental:**

1. Es crea un objecte `Coche` amb marca "Seat". La seua velocitat comença en 0.
2. `c.acelerar(50)` → `this.velocidad += 50` → velocitat = 50.
3. `c.acelerar(30)` → `this.velocidad += 30` → velocitat = 80.
4. `c.frenar(20)` → `this.velocidad -= 20` → velocitat = 60.
5. Imprimeix: **"Seat va a 60 km/h"**.

**Variante:** I si frenem amb 100 en lloc de 20? `c.frenar(100)`: velocitat passaria a -20, però el `if` la posa a 0. Es com si el cotxe tinguera frens de veritat: no pots anar a velocitat negativa.

### Packages: Els Barris de la Ciutat Java

Java té MILERS de classes. Per a no tornar-se boig, les organitza en **paquets** (packages). Pensau en ells com barris d'una ciutat:

- `java.lang` — El centre històric. `String`, `Math`, `System`. S'importa sol.
- `java.util` — El barri de les eines. `Scanner`, `ArrayList`, `Date`.
- `java.io` — La zona portuària. Per a llegir i escriure fitxers.
- `java.net` — L'aeroport. Per a comunicacions en xarxa.
- `javax.swing` — El barri dels arquitectes. Interfícies gràfiques.

Per a usar una classe d'un altre barri, has de *importar-la*:

```java
import java.util.Scanner;       // "Quiero usar el Scanner del barrio util"
import java.util.*;             // "Tráeme TODO lo que haya en java.util"
```

Les classes de `java.lang` no necessiten import. És com ta casa: no necessites demanar permís per a entrar en la teua pròpia cuina.

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** Vale, `new` crea objetos. Pero, ¿qué pinta `new`? ¿Es un operador?
>
> **A:** `new` és el *constructor d'objectes* de Java. Reserva memòria, crida al constructor i retorna l'adreça de l'objecte. Sense `new`, no hi ha objecte. És com la clau que encén el cotxe: sense ella, no arranques.

> **Q:** ¿Y por qué `String nombre = "Ana";` no lleva `new`?
>
> **A:** Perquè Java és un amor amb `String`. És tan comú que et deixa crear strings amb cometes directament (literals). És un *drecera*. Darrere del teló, Java ho tracta quasi com si tinguera `new`. Però `Scanner sc = "System.in";` no funciona. `Scanner` no és especial, `String` sí.

> **Q:** ¿Cuál es la diferencia entre `equals()` y `==` para comparar objetos?
>
> **A:** `==` compara si dos variables apunten al *mateix objecte* (mateixa adreça). `equals()` compara si el *contingut* és el mateix. Amb `String`:
> ```java
> String a = "Hola";
> String b = "Hola";
> String c = new String("Hola");
>
> System.out.println(a == b);      // true (Java reutiliza literales iguales)
> System.out.println(a == c);      // false (c es otro objeto)
> System.out.println(a.equals(c)); // true (el contenido es el mismo)
> ```

> **Q:** ¿Puedo tener un método `main` en cualquier clase?
>
> **A:** Sí. Cada classe pot tindre el seu propi `main`. És com tindre diverses portes d'entrada a una casa. Quan executes `java NombreClase`, Java busca el `main` d'eixa classe concreta. Els altres `main` d'unes altres classes... ahí estan, dormint.

> **Q:** ¿Qué pasa si no pongo constructor y luego hago `new Persona("Ana")`?
>
> **A:** Java et dirà: "Ei, no existeix un constructor `Persona(String)`. Et vaig a deixar tirat amb un error de compilació." Si no poses CAP constructor, Java et dona un de buit sense paràmetres. Però si poses ALGUN constructor, el buit NO es crea automàticament.

### Constructors: Les Instruccions del Forn

Un constructor és un mètode especial amb el MATEIX nom que la classe i que NO retorna res (ni `void`). És com programar el forn: "temperature: 180, mode: turbo".

#### Constructor per Defecte (El Forn per Defecte)

Si no escrius cap constructor, Java et regala un de gratuït. Inicialitza tot a `null`, `0` o `false`. Com un forn fred.

#### Constructor Parametritzat (El Forn amb Programa)

Tu li dius com vols la galeta.

```java
public class Galleta {
    String forma;
    boolean tieneChocolate;
    int temperatura;

    public Galleta(String forma, boolean tieneChocolate, int temperatura) {
        this.forma = forma;
        this.tieneChocolate = tieneChocolate;
        this.temperatura = temperatura;
    }
}
```

#### Sobrecàrrega de Constructors: Diversos Forns, Una Cuina

Pots tindre varios constructors amb diferents paràmetres. Com una rentadora: programa curt, programa llarg, programa de "això és una camisa de seda, que no s'emrecorde".

```java
public class Galleta {
    String forma;
    boolean tieneChocolate;

    public Galleta() {
        this("redonda", false); // Llama al otro constructor
    }

    public Galleta(String forma, boolean tieneChocolate) {
        this.forma = forma;
        this.tieneChocolate = tieneChocolate;
    }
}
```

#### La Paraula Clau `this`: Jo, Mi, Me, Amb Mi

`this` és l'objecte dient "SENT, PARLE DE MI, NO D'UN ALTRE". Servix per a:

1. Desambiguar: quan el paràmetre es diu igual que l'atribut.

```java
public class Persona {
    String nombre;

    public Persona(String nombre) {
        this.nombre = nombre; // "this.nombre" es el de arriba, "nombre" es el parámetro
    }
}
```

2. Cridar a un altre constructor: `this(...)`.
3. Passar-te a tu mateix com a argument.

```java
public class Coche {
    String marca;
    int velocidad;

    public Coche(String marca) {
        this.marca = marca;
    }

    public void acelerar(int inc) {
        this.velocidad += inc;
        System.out.println(this.marca + " va a " + this.velocidad + " km/h");
    }
}
```

> **📝 Nota:** Si no poses `this` quan hi ha ambigüitat, Java es confon. És com si en una conversa dius "nom" i hi ha dos persones anomenades "nom". Et miraran rar.

### ⭐ BE THE CODE, MY FRIEND: La Caixa Misteriosa

> 🕶️ **Don Tip:** Fixa't en quin objecte es crida cada mètode. La variable de referència determina quins mètodes pots invocar.

Tu eres Java. Et donen este codi:

```java
public class Caja {
    int ancho;
    int alto;
    int profundo;

    public Caja(int ancho, int alto, int profundo) {
        this.ancho = ancho;
        this.alto = alto;
        this.profundo = profundo;
    }

    public int volumen() {
        return ancho * alto * profundo;
    }
}

public class Main {
    public static void main(String[] args) {
        Caja c1 = new Caja(2, 3, 4);
        Caja c2 = new Caja(5, 1, 2);
        System.out.println(c1.volumen());
    }
}
```

* Quants objectes hi ha en memòria al final de `main`?
* Quant imprimeix el `System.out.println`?
* Què passa si a c1 li canvies `ancho = 10`? c2 es veu afectat?

> **Solució:** 2 objectes, 24, NO (cada objecte té la seua pròpia còpia). Les variables d'instància són independents per a cada objecte.

### ⭐ BE THE CODE, MY FRIEND: Quin Constructor Es Crida?

> 🕶️ **Don Tip:** Comprova el número i tipus d'arguments. Java tria el constructor que millor coincidix.

Sense executar, què imprimeix este codi?

```java
public class Pedido {
    String producto;
    int cantidad;

    public Pedido() {
        this("Sin producto", 0);
        System.out.println("Constructor vacío");
    }

    public Pedido(String producto, int cantidad) {
        this.producto = producto;
        this.cantidad = cantidad;
        System.out.println("Constructor con parámetros");
    }

    public static void main(String[] args) {
        Pedido p = new Pedido();
        System.out.println(p.producto + " x" + p.cantidad);
    }
}
```

> **Solució:** Es crida a `Pedido()` que fa `this("Sin producto", 0)`, el que primer executa `Pedido(String, int)` (imprimeix "Constructor con parámetros"), després torna i termina `Pedido()` (imprimeix "Constructor vacío"). Després imprimeix "Sin producto x0". El `this(...)` sempre va primer.

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** Vale, ¿y por qué no puedo hacer simplemente `int galleta1 = 42;` en vez de todo este rollo de clases?
>
> **A:** Perquè un `int` només guarda un número. Una classe guarda NÚMEROS + TEXT + MÈTODES + tot el que vulgues. És com comparar un posagots amb un dron. El dron pot fer mil coses, el posagots... posa gots.

> **Q:** ¿Cuántos objetos puedo crear? ¿Hay límite?
>
> **A:** Fins que et quedes sense memòria (i aleshores Java llança `OutOfMemoryError` i el teu programa mor). Però anem, amb 8 GB de RAM pots crear milions d'objectes xicotets. No et preocupes.

> **Q:** `this` es una palabra reservada, ¿no? ¿Puedo usarla fuera de una clase?
>
> **A:** No. `this` fora d'una classe és com demanar una pizza en una ferreteria. No té sentit. Només existix dins del context d'un objecte.

> **Q:** ¿Por qué hace falta escribir `new`? ¿No podría Java crear el objeto solito?
>
> **A:** No, perquè `new` és el "permís de construcció". Sense `new`, només declares una variable (com `Coche c;`), però no hi ha cotxe al garatge, només una plaça de pàrquing buida. Fins que no faces `new`, l'objecte no existix.

### Mètodes toString() i equals(): La Carta de Presentació

`toString()` és com el teu objecte es presenta en públic. Per defecte Java imprimeix algo com `Persona@3e3abc` (la classe i una adreça de memòria). No molt útil.

```java
public class Persona {
    private String nombre;
    private int edad;

    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    @Override
    public String toString() {
        return nombre + " (" + edad + " años)";
    }
}
```

`equals()` és per a preguntar: "este objecte ÉS IGUAL a este altre?" (pel seu contingut, no perquè siguen el mateix lloc en memòria).

```java
public class Persona {
    private String dni;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Persona otra = (Persona) o;
        return dni != null && dni.equals(otra.dni);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dni);
    }
}
```

> **💡 Consell:** Sobreescriu `toString()` sempre. El teu jo del futur (i el teu professor) t'ho agrairà. `equals()` i `hashCode()` van junts com el pernil i el formatge. Si sobreescrius un, sobreescriu l'altre.

### Exemple Complet: Cotxe (Amb Accelerador de Veritat)

```java
public class Coche {
    private String marca;
    private String modelo;
    private int velocidad;

    public Coche(String marca, String modelo) {
        this.marca = marca;
        this.modelo = modelo;
        this.velocidad = 0;
    }

    public void acelerar(int kmh) {
        this.velocidad += kmh;
        System.out.println(marca + " " + modelo + ": " + velocidad + " km/h");
    }

    public void frenar(int kmh) {
        this.velocidad = Math.max(0, this.velocidad - kmh);
    }

    @Override
    public String toString() {
        return marca + " " + modelo + " - " + velocidad + " km/h";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Coche c = (Coche) o;
        return marca.equals(c.marca) && modelo.equals(c.modelo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(marca, modelo);
    }
}
```

### Bones Pràctiques (O Com No Ficarla)

* Atributs **privats sempre** (ja veurem per què en el següent tema. Spoiler: no voleu que ningú toque les vostres parts privades).
* `this` quan hi haja ambigüitat. Si no n'hi ha, pots ometre-ho (però posar-ho no dol).
* `toString()` sempre. És el teu amic.
* `equals()` i `hashCode()` si compares objectes per valor.
* Inicialitza-ho tot en el constructor. No deixes atributs ballant.

### 🥊 EL RING: Classe vs Objecte

Dos conceptes discuteixen acaloradament. Qui té raó?

**Classe:** «Jo soc el motle, el plànol, la idea platònica. Sense mi no existiries. Jo definisc quins atributs i mètodes tenen els objectes. Soc la creadora!»

**Objecte:** «Sí, però jo soc qui realment fa coses. Tu ets només un fitxer `.java` al disc. Jo ocupe memòria, tinc estat, puc canviar els meus atributs. Sense mi el teu codi no serveix per a res.»

**Classe:** «Ah sí? I quants de tu existeixen? Pots tindre milers d'objectes creats a partir de mi. Jo soc únic, tu eres una còpia. Soc original, eres reproduïble!»

**Objecte:** «Exacte. Perquè tu eres el plànol, però jo soc l'edifici construït. Ningú viu en un plànol. Quan executes el programa, el que treballa soc jo.»

**Classe:** «Val, ens necessitem. Sense classe no hi ha objecte. Sense objecte, la classe és només teoria.»

**Objecte:** «Tracte fet.»

> 🕶️ **Don Tip:** La classe defineix el QUÈ (atributs) i el CÓM (mètodes). L'objecte és el QUIÉ (la instància concreta que executa i té valors propis).

---

## Resum

- Classe = motle / tallagalletas. Objecte = galeta / resultat.
- `new` crea objectes. Crida al constructor.
- `Scanner` llig del teclat com un intèrpret amigable.
- Paquets = barris. `import` = demanar permís per a entrar.
- `String` és especial: es pot crear amb cometes sense `new`.
- `this` desambigua i permet cridar a altres constructors.
- Sobrecàrrega: varios constructors amb diferents paràmetres.
- `toString()` i `equals()` es sobreescriuen sempre.

---

## Exercicis Proposats

### Introducció a POO

1. **Salutació personalitzada** Usa Scanner per a preguntar nom, edat i ciutat. Mostra: "Hola, soc [nom], tinc [edat] anys i visc en [ciutat]."

2. **La frase mutant** Demana una frase a l'usuari i mostra: nombre de caràcters, en majúscules, en minúscules, primera paraula (abans de l'espai), i reemplaça totes les vocals per 'e'.

3. **Suma de strings** Demana dos números com a text (String). Converteix-los a enters amb `Integer.parseInt()` i mostra la seua suma. Si no són números vàlids, quin error ix?

4. **Daus virtuals** Genera 5 números aleatoris entre 1 i 100. Mostra el major i el menor (pots usar `Math.max()` i `Math.min()` o fer-ho a mà).

5. **Lletra, número o símbol?** Demana un caràcter a l'usuari. Usa mètodes de `Character` (`isDigit()`, `isLetter()`...) per a dir-li què és.

6. **Classe Gos** Crea una classe `Perro` amb atributs `nombre` (String) i `edad` (int). Un mètode `ladrar()` que imprimisca "Guau, soc [nombre]". Crea dos gossos diferents i fes que cada un lladre.

7. **Calculadora IMC** Demana pes (kg) i altura (m). Calcula l'IMC = pes / (altura * altura). Mostra el resultat amb 2 decimals. Usa `Math.round()` o imprimeix amb format.

8. **Comptador d'objectes** Crea una classe `Contador` amb un atribut `static int totalObjetos`. En el constructor, incrementa `totalObjetos`. En el `main`, crea 5 objectes `Contador` i al final imprimeix `Contador.totalObjetos`. Ix 5?

### Classes i Objectes

1. **Classe Rectangle**: Crea `Rectangulo` amb `ancho` i `alto` (double). Constructor parametritzat, getters/setters, `calcularArea()` i `calcularPerimetro()`. Sobreescriu `toString()`.

2. **Classe CompteBancari**: `CuentaBancaria` amb `titular`, `saldo` i `numeroCuenta`. Dos constructors: només titular (saldo 0) o titular + saldo. Mètodes `ingresar(double)` i `retirar(double)` (valida saldo suficient). `toString()`.

3. **Classe Hora**: `Hora` amb `hora` (0-23), `minuto` (0-59), `segundo` (0-59). Constructor amb validació. `incrementarSegundo()` que manege desbordaments.

4. **Sobrecàrrega de constructors**: Classe `Email` amb `destinatario`, `asunto`, `cuerpo`. Tres constructors: tot, només destinatari+assumpte (cos buit), només destinatari (assumpte i cos per defecte).

5. **equals() en Persona**: Afig `fechaNacimiento` (LocalDate) a Persona. Sobreescriu `equals()` usant nombre + fechaNacimiento.

6. **Classe Punt**: `Punto` amb `x` i `y` (int). Constructor, getters, `distancia(Punto otro)` (distància euclídea), `toString()`. Calcula perímetre d'un triangle donats 3 punts.

7. **Classe Fracció**: `Fraccion` amb `numerador` i `denominador` (int). Mètodes: `sumar`, `restar`, `multiplicar`, `dividir`, `simplificar()`. `toString()` com "numerador/denominador".

8. **Classe Joc**: `Juego` amb `nombre`, `genero`, `precio`, `edadMinima`. Mètode `esAptoPara(int edad)`. Crea varios jocs i mostra quins són aptes per a algú de 12 anys.

---

**RAs treballats en esta unitat:**
- **RA2** - Programes senzills
- **RA4** - Classes

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
