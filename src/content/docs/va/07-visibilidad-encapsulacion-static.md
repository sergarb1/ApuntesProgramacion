---
title: "Unidad 5: Visibilidad, Encapsulación y Static"
nav_order: 5
---
🎯 **Objectius d'aprenentatge**
- Aplicar els 4 nivells de visibilitat
- Encapsular atributs amb getters i setters
- Validar dades en setters
- Entendre el patró JavaBeans
- Usar membres estàtics (variables, mètodes, constants)
- Crear classes utilitàries amb constructor privat

## Visibilitat: L'Art de No Ensenyar-ho Tot

### El Gran Problema (O Com la Gent Toca Les Teues Coses)

Imagina que vius en una casa de vidre. Qualsevol pot veure-ho tot: la teua roba interior, la teua col·lecció de cromos de Pokémon, eixa caixa de galetes buida que guardes per si de cas. Incòmode, oi?

Doncs el mateix passa amb els teus objectes. Si tot és públic, qualsevol des de qualsevol lloc pot fer:

```java
Persona p = new Persona();
p.edad = -666; // ¡Edad negativa! Esto no tiene sentido.
p.saldo = 999999; // Multiplicate por 0 el dinero.
```

I el teu objecte queda fet un desastre. Necessitem **control d'accés**. Necessitem... **VISIBILITAT**.

### Els 4 Nivells de Visibilitat: De la Tanca a la Caixa Forta

| Modificador | Es veu des de | És com... |
|---|---|---|
| `public` | Tothom, absolutament tothom | Una tanca publicitària a Times Square |
| `protected` | Mateix paquet + subclasses (fills) | Els secrets de família: ho saben els teus cosins i els teus fills |
| *package-private* (default) | Mateix paquet (veïnat) | El xafardeig del barri |
| `private` | Només la classe | El teu diari secret amb cadenat |

> "El `private` és com el teu calaix dels calcetins desaparellats: existix, però no cal que ningú més ho veja."

### public: La Tanca Publicitària

Tothom ho veu. Des de qualsevol classe, qualsevol paquet. És com posar el teu número de telèfon en una pancarta.

```java
public class VallaPublicitaria {
    public String mensaje; // "CÓMPRAME, SOY UNA CLASE"

    public void mostrar() {
        System.out.println(mensaje);
    }
}
```

Usa-ho per al que VULGUES que altres usen. No per als teus atributs (a menys que t'agrade el caos).

### private: El Diari amb Cadenat

Només la classe ve els seus propis `private`. Ni sa mare, ni el seu millor amic, ni el gos.

```java
public class DiarioSecreto {
    private String contenido; // Nadie fuera de esta clase puede leerlo

    public void escribir(String mensaje) {
        this.contenido = "Querido diario: " + mensaje;
    }

    public String leer() {
        return contenido; // Solo yo puedo decidir qué mostrar
    }
}
```

> **⚠️ Advertència:** Mai, MAI, faces un atribut `public`. És com deixar la porta de casa teua oberta amb un cartell: "Passeu i toqueu-ho tot".

### protected: Els Secrets de Família

És com les històries vergonyoses de la família. Els teus cosins (mateix paquet) i els teus fills (subclasses) poden accedir. Però un desconegut d'un altre paquet... no.

### package-private (default): El Xafardeig del Barri

Si NO poses cap modificador, Java assumix "package-private". Ho veuen les classes del mateix paquet. Com el grup de WhatsApp del veïnat.

### Taula Comparativa: Qui Veu Què?

```java
package barrio;

public class Casa {
    public String direccion;     // Lo sabe todo el mundo
    protected String telefono;   // Lo sabe la familia
    int numeroHabitaciones;      // Lo saben los vecinos (package-private)
    private String contrasenaWifi; // SOLO YO
}
```

Des del mateix paquet (`barrio`):

```java
public class Vecino {
    public void espiar() {
        Casa c = new Casa();
        System.out.println(c.direccion);          // OK: public
        System.out.println(c.telefono);           // OK: protected (mismo paquete)
        System.out.println(c.numeroHabitaciones); // OK: package-private
        // System.out.println(c.contrasenaWifi);  // ERROR: private
    }
}
```

Des d'un altre paquet, sent subclasse:

```java
package otraCiudad;
import barrio.Casa;

public class CasaHeredada extends Casa {
    public void espiar() {
        System.out.println(direccion);    // OK: public
        System.out.println(telefono);     // OK: protected (soy subclase)
        // System.out.println(numeroHabitaciones); // ERROR: package-private
        // System.out.println(contrasenaWifi);     // ERROR: private
    }
}
```

### ⭐ BE THE CODE, MY FRIEND: El Banc

> 🕶️ **Don Tip:** Els getters exposen dades, els setters les validen. Si un setter permet saldos negatius, el banc fa fallida.

Eres una classe `Banco`. Tens estos membres:

```java
public class Banco {
    public String nombreBanco;
    protected String direccionSucursal;
    String listaClientes;
    private double saldoCaja;

    public void mostrarInfo() {
        System.out.println(nombreBanco);
        System.out.println(direccionSucursal);
        System.out.println(listaClientes);
        System.out.println(saldoCaja);
    }
}
```

Pregunta: Pot una classe `Sucursal` en un altre paquet vore `listaClientes`? I `direccionSucursal`?
Pot `main()` d'una classe en el mateix paquet vore `saldoCaja`?

> **Solució:** no (package-private, altre paquet no ho veu), sí si és subclasse (protected), no (private). La pròpia classe sempre pot vore-ho tot (per això el mètode `mostrarInfo()` funciona).

### ❓ No Hi Ha Preguntes Tontes!

> **Q:** I si no pose res? Package-private és el mateix que "default"?
>
> **A:** Sí, es diuen "default" o "package-private". És el nivell que Java assumix quan no escrius `public`, `private` o `protected`. No és que existisca una paraula clau `default` per a visibilitat (eixa paraula és per a una altra cosa).

> **Q:** Per què hauria de fer `private` un atribut i després crear getters i setters públics? És més treball!
>
> **A:** Perquè així CONTROLES el que entra i ix. Pots validar: "Edat no pot ser negativa". Pots canviar la implementació interna sense que ningú se n'assabente. És com tindre un porter en la teua discoteca: deixes entrar a qui vols i tires als que van borratxos.

> **Q:** El meu professor va dir que `protected` és "perquè les subclasses ho vegen". I què més dona?
>
> **A:** Dona molt. Pensat en una classe `Vehiculo` amb `protected int velocidadMaxima`. La subclasse `Coche` pot usar-lo. Però una classe `Taller` del mateix paquet també pot. Si vols que NOMÉS les subclasses ho vegen i NO els veïns de paquet... males notícies: `protected` no discrimina entre "subclasse d'un altre paquet" i "mateix paquet". A les dos els ho permet.

> **Q:** I els mètodes? També tenen visibilitat?
>
> **A:** Per descomptat! Tot té visibilitat. Pots tindre un mètode `private` que només s'use internament, com `private void calcularImpuesto()`. Ningú fora de la classe necessita saber com calcules els impostos (ni tu mateix vols saber-ho).

> **Q:** Si faig tot `public` total és més ràpid d'escriure, no?
>
> **A:** És més ràpid d'escriure i més lent de depurar. Quan algú (o tu) meta un valor impossible en un atribut públic, passaràs hores buscant qui ho va canviar. Amb encapsulació, l'error es detecta a l'instant en el setter.

## Encapsulació: El Pilar que Sosté la POO

Encapsulació = **privacitat + control**. És la idea que:

1. Els teus atributs són `private`.
2. Controles l'accés amb getters i setters `public`.
3. Dins dels setters, VALIDES.

Exemple de vida (o mort):

```java
public class CuentaBancaria {
    private double saldo; // Nadie toca el saldo directamente

    public void ingresar(double cantidad) {
        if (cantidad > 0) {
            this.saldo += cantidad;
        }
    }

    public void retirar(double cantidad) {
        if (cantidad > 0 && cantidad <= saldo) {
            this.saldo -= cantidad;
        } else {
            System.out.println("No tienes tanto dinero, amigo");
        }
    }

    public double getSaldo() {
        return saldo; // Solo lectura
    }
}
```

> **⚠️ Advertència:** Si fas els atributs `public`, estàs renunciant a l'encapsulació. És com portar la cartera oberta al metro. Tard o d'hora algú ficarà mà.

### Avantatges de l'Encapsulació (O Per Què No Dormiràs Pitjor)

* **Control**: Valides i filtres. Res d'edats negatives.
* **Mantenibilitat**: Canvies internament i el codi client ni s'assabenta.
* **Seguretat**: Ningú deixa el teu objecte en un estat inconsistent.
* **Baix acoblament**: Cada classe va a la seua. No es fiquen unes en els assumptes d'unes altres.

### La Convenció JavaBeans: El Protocol

JavaBeans és una convenció (no obligatòria, però sí sensata) que diu:

1. Classe pública.
2. Constructor sense arguments.
3. Atributs privats.
4. Getters i setters públics.
5. Implementa `Serializable` (opcional).

Convenció de noms:

| Tipus | Getter | Setter |
|---|---|---|
| `String nombre` | `getNombre()` | `setNombre(String n)` |
| `boolean activo` | `isActivo()` | `setActivo(boolean a)` |
| `int cantidad` | `getCantidad()` | `setCantidad(int c)` |

### Bones Pràctiques (El Decàleg del Programador Paranoic)

* `private` per a atributs. Sempre. Per defecte. Sense discussió.
* Getter només si cal (atributs immutables no necessiten setter).
* Valida en els setters. No confies en ningú.
* `protected` per a mètodes que les subclasses necessiten. No abuses.
* Comença amb l'accés més restrictiu i obri'l només si és necessari.

---

## Static: El Que Pertany a la Classe (No a l'Objecte)

### La Gran Diferència: El Grup de WhatsApp vs Els Missatges Privats

Imagina que eres part d'una classe de 30 alumnes. Tens:

* **El grup de WhatsApp de la classe** (static): tots veuen el mateix missatge. Si algú escriu "demà hi ha examen", els 30 ho veuen. És compartit.
* **Els teus missatges privats** (instància): només tu els veus. Cada alumne té els seus. No es barregen.

Doncs en Java és igual:

* **Variables de classe** (`static`): una sola còpia per a tots els objectes. Tots compartixen el mateix valor.
* **Variables d'instància** (sense `static`): cada objecte té la seua pròpia còpia. Cadascuna independent.

> "Static és el grup de WhatsApp de la classe. Instància són els DMs que ningú més veu."

Els mètodes **estàtics** (amb `static`) pertanyen a la *classe*, no als objectes:

```java
public class UtilidadesMatematicas {
    public static int sumar(int a, int b) {
        return a + b;
    }

    public static double media(double a, double b) {
        return (a + b) / 2;
    }
}

// Llamada: ni necesito crear un objeto, llamo a la clase directamente
int resultado = UtilidadesMatematicas.sumar(5, 3);
double med = UtilidadesMatematicas.media(10, 20);
```

La diferència pràctica: els mètodes d'instància (sense `static`) necessiten un objecte:

```java
String texto = "Hola";
int longitud = texto.length();  // length() NO és static. Necessite l'objecte texto.
```

> **📝 Nota:** `Math.random()`, `Math.sqrt()`, `Integer.parseInt()`... tots són estàtics. No necessites crear un `Math m = new Math();`. Seria com comprar una nevera per a tindre un imant. Usa `Math.random()` directament.

### Atributs Estàtics: El Cartell del Col·legi

Un atribut `static` és com el cartell de "Queden 10 minuts per al pati" al passadís. Està ahí, ho veu tot el món, i només n'hi ha un.

```java
public class Estudiante {
    private static int totalEstudiantes = 0; // Variable de clase
    private String nombre;                    // Variable de instancia
    private int id;

    public Estudiante(String nombre) {
        this.nombre = nombre;
        this.id = ++totalEstudiantes; // Incrementa el contador global
    }

    public static int getTotalEstudiantes() {
        return totalEstudiantes;
    }

    public int getId() {
        return id;
    }
}
```

En memòria es veu així:

```
  CLASSE: Estudiante
  ┌──────────────────────┐
  │ totalEstudiantes = 3 │  ← static: UN per a tota la classe
  └──────────────────────┘

  OBJECTE e1       OBJECTE e2       OBJECTE e3
  ┌─────────┐      ┌─────────┐      ┌─────────┐
  │ nombre  │      │ nombre  │      │ nombre  │
  │ id = 1  │      │ id = 2  │      │ id = 3  │
  └─────────┘      └─────────┘      └─────────┘
```

Cada objecte té el seu `nombre` i `id` (el seu DNI), però tots compartixen `totalEstudiantes`.

> **💡 Consell:** Usa `NombreClase.miembroEstatico` per a accedir. `Estudiante.getTotalEstudiantes()`. No uses `objeto.getTotalEstudiantes()`, encara que funcione, és confús.

### Mètodes Estàtics: El Telèfon de la Classe

Els mètodes `static` es diuen usant la classe, no un objecte. És com el número de telèfon d'atenció al client d'una empresa: NO necessites parlar amb un empleat concret, crides al número general.

Característiques dels mètodes estàtics:

* **NO poden accedir a atributs d'instància** (no saben de quin objecte parlen).
* **NO tenen `this`** (no hi ha "jo" perquè no hi ha objecte).
* Només poden cridar a altres mètodes estàtics (directament).

```java
public class Calculadora {
    public static int sumar(int a, int b) {
        return a + b;
    }

    public static double dividir(int a, int b) {
        if (b == 0) throw new ArithmeticException("¡No dividirás por cero!");
        return (double) a / b;
    }
}

// Uso: SIN crear ningún objeto
public class Main {
    public static void main(String[] args) {
        int resultado = Calculadora.sumar(10, 5);
        System.out.println(resultado); // 15
    }
}
```

### L'Exemple Definitiu: La Classe Math

`java.lang.Math` és la classe utilitària per excel·lència. TOTS els seus mètodes són estàtics. No pots (ni vols) fer `new Math()`.

```java
double max = Math.max(10, 20);              // 20
double min = Math.min(10, 20);              // 10
double raiz = Math.sqrt(25);                // 5.0
double potencia = Math.pow(2, 10);          // 1024.0
double absoluto = Math.abs(-7);             // 7
double random = Math.random();              // Aleatori [0.0, 1.0)
double pi = Math.PI;                        // 3.141592653589793
```

> **📝 Nota:** `Math` té el constructor **privat**. Ningú pot instanciar-la. És com una estàtua: per a admirar-la, no per a fer-li clons.

### Classes Utilitàries: El "No Necessite Parella" de Java

Una classe utilitària és una classe que NOMÉS té membres estàtics. Són com l'amic que està solter i feliç: no necessita instanciar-se per a ser útil.

Per a evitar que algú intente crear un objecte, li posem el constructor `private`:

```java
public class StringUtils {
    private StringUtils() {} // Nadie puede hacer new StringUtils()

    public static boolean esVacio(String str) {
        return str == null || str.trim().isEmpty();
    }

    public static String invertir(String str) {
        return str == null ? null : new StringBuilder(str).reverse().toString();
    }

    public static String capitalizar(String str) {
        if (esVacio(str)) return str;
        return str.substring(0, 1).toUpperCase() + str.substring(1).toLowerCase();
    }
}
```

### Constants: El Que Mai Canvia (Com l'Amor de Ta Mare)

`static final` és "una constant de classe". Per convenció en MAJÚSCULES.

```java
public class Config {
    public static final String NOMBRE_APP = "Gestión DAM";
    public static final String VERSION = "2.1.0";
    public static final int MAX_USUARIOS = 100;
    public static final double IVA = 0.21;
}
```

Usa-les així: `Config.IVA`, `Config.MAX_USUARIOS`. Mai canviïn. Són més fermes que els teus propòsits d'Any Nou.

### ⭐ BE THE CODE, MY FRIEND: Els Gats Estàtics

> 🕶️ **Don Tip:** Allò `static` pertany a la classe, no a l'objecte. Tots els objectes compartixen el mateix valor.

Mira este codi i respon SENSE EXECUTAR:

```java
public class Gato {
    public static int totalGatos = 0;
    public String nombre;

    public Gato(String nombre) {
        this.nombre = nombre;
        totalGatos++;
    }

    public static void decirTotal() {
        System.out.println("Hay " + totalGatos + " gatos");
        // System.out.println(nombre); // ¿Esto funciona?
    }
}
```

* Funciona `System.out.println(nombre);` dins del mètode `decirTotal()`?
* Si crees 3 gats i després fas `Gato.decirTotal()`, què imprimeix?
* I si crees 5 gats més? Què imprimeix ara?

> **Solució:** NO funciona (és una variable d'instància), imprimeix 3, imprimeix 8. El mètode `decirTotal()` no sap quin "nombre" demanar-li a l'objecte.

### ⭐ BE THE CODE, MY FRIEND: Static vs Instància

> 🕶️ **Don Tip:** Un mètode `static` no pot accedir a variables d'instància perquè no té `this`. Pensa: ¿pertany a l'objecte o a la classe?

Què imprimeix este codi?

```java
public class PruebaStatic {
    int x = 1;
    static int y = 1;

    public void incrementarX() { x++; }
    public static void incrementarY() { y++; }

    public static void main(String[] args) {
        PruebaStatic a = new PruebaStatic();
        PruebaStatic b = new PruebaStatic();

        a.incrementarX();
        b.incrementarX();
        a.incrementarX();

        PruebaStatic.incrementarY();
        PruebaStatic.incrementarY();
        b.incrementarY();  // también vale aunque sea confuso

        System.out.println("a.x = " + a.x);
        System.out.println("b.x = " + b.x);
        System.out.println("y = " + PruebaStatic.y);
    }
}
```

> **Solució:** `a.x` = 3 (es va incrementar 2 voltes en a), `b.x` = 2 (`b.incrementarX()` una volta), `y` = 3 (es va incrementar 3 voltes: dos des de classe, una des d'objecte b). Cada objecte té el seu propi `x`, però `y` és compartit.

### ❓ No Hi Ha Preguntes Tontes!

> **Q:** Puc cridar a un mètode estàtic des d'un objecte? Com `miObjeto.metodoEstatico()`?
>
> **A:** Tècnicament SÍ. Java t'ho permet. Però és com cridar a ta mare pel cognom. Funciona, però queda estrany. La convenció és usar la classe: `Clase.metodoEstatico()`. Alguns IDEs et marquen una warning.

> **Q:** Aleshores `main` és estàtic perquè...
>
> **A:** Perquè quan comença el programa, NO hi ha cap objecte encara. Algú ha d'arrancar la festa. `main` és el primer en arribar. Ha de ser estàtic per a poder executar-se sense que ningú haja creat un objecte abans.

> **Q:** Els mètodes estàtics són més ràpids?
>
> **A:** Lleugerament. No necessites la referència a l'objecte. Però la diferència és tan xicoteta que en el 99.9% dels casos no ho notaràs. No t'obsessiones amb la velocitat dels estàtics. Preocupa't que el teu codi tinga sentit.

> **Q:** Puc tindre un atribut estàtic que siga un objecte de la seua pròpia classe?
>
> **A:** Sí! És el patró **Singleton**. Tens un `private static MiClase instancia = new MiClase();` i un mètode `getInstance()`. És com tindre una única pedra filosofal. Però això és un altre tema...

> **Q:** Puc posar-li `static` a tot i estalviar-me crear objectes?
>
> **A:** Pots, però aleshores no estàs fent POO, estàs fent "Programació Estàtica a la bruta". Java t'ho permet, però és com usar un tornavís per a clavar un clau: pots, però per a això existix el martell. Usa `static` per al que és de la classe, no per a tot.

### Diferència Ràpida (Perquè no et llies)

| Variable d'instància | Variable estàtica |
|---|---|
| Pertany a l'objecte | Pertany a la classe |
| Necessites `new` | Uses `NombreClase.variable` |
| Cada objecte té la seua | Una còpia per a tots |
| `this` disponible | No hi ha `this` |
| Llig/escriu en l'objecte | Llig/escriu en la classe |

### Bones Pràctiques

* Usa `static` per a mètodes que NO depenguen de l'estat de l'objecte (com `Math.sqrt()`).
* Usa `static` per a constants (`static final`).
* Usa `static` per a comptadors compartits.
* NO abuses de `static`. No convertixques tot en estàtic "perquè és més fàcil". Perdràs els beneficis de la POO.
* Constructor privat en classes utilitàries (perquè ningú les instancie).


### 🧩 L'EMBOLIC

El següent codi hauria d'encapsular correctament una classe CuentaBancaria, però té diversos errors de visibilitat i lògica. Troba'ls:

```java
public class CuentaBancaria {
    public double saldo;
    private String titular;

    public CuentaBancaria(String titular, double saldoInicial) {
        titular = titular;
        saldo = saldoInicial;
    }

    public double getSaldo() {
        return saldo;
    }

    private void setSaldo(double saldo) {
        if (saldo >= 0) {
            this.saldo = saldo;
        }
    }
}
```

Preguntes:
1. ¿L'atribut `saldo` està ben encapsulat?
2. ¿Quin error hi ha al constructor amb `titular = titular`?
3. ¿Per què `setSaldo` és `private`? Com retira diners l'usuari llavors?

> 🕶️ **Don Tip:** `this` resol ambigüitats. Si paràmetre i atribut es diuen igual, sense `this` t'assignes el paràmetre a si mateix.

---

## Resum
- Visibilitat: `public` > `protected` > package-private > `private`.
- Encapsulació: atributs `private`, getters/setters `public` amb validació.
- JavaBeans: classe pública, constructor sense args, atributs privats, getters/setters.
- `static` = del grup (classe). Sense `static` = de cada un (objecte).
- Mètodes estàtics no accedixen a atributs d'instància ni tenen `this`.
- `static final` = constant de classe.
- Classes utilitàries tenen constructor privat i només membres estàtics.

---

## Exercicis Proposats

### Visibilitat

1. **Classe Empleat amb validació**: `Empleado` amb `nombre`, `salarioBase` (double) i `departamento` privats. El salari no pot ser negatiu. El setter ha de llançar `IllegalArgumentException` si és invàlid. Mètode `calcularSalarioAnual()`.

2. **Classe Cercle encapsulat**: `Circulo` amb `radio` privat. Setter valida que el radi siga positiu. `getArea()` i `getPerimetro()`. Intenta accedir a `radio` des d'una altra classe. Què passa?

3. **JavaBean Alumne**: `Alumno` amb `nombre`, `edad`, `curso`, `notaMedia` (double) i `matriculado` (boolean). Constructor sense args: nom buit, matriculado false. Nota mitjana entre 0 i 10.

4. **Classe Immutable Hora**: `Hora` sense setters. Només constructor amb validació. Getters i `toHoraString()`. Ningú pot canviar l'hora després de crear-la.

5. **Protected i herència**: Crea `Animal` en paquet `zoologico` amb `protected String nombre`. Crea `Perro` en un altre paquet. Qui veu `nombre`?

6. **Compte Bancari encapsulat**: `CuentaBancaria` amb `saldo` privat. Només `ingresar(double)` i `retirar(double)` modifiquen el saldo. Validacions.

7. **Getter sense Setter**: Classe `Configuracion` amb `static final String VERSION = "1.0"` (públic). Atributs privats `maxIntentos` i `timeout`. Getter per a tots dos, setter només per a `maxIntentos`. Per què?

8. **Refactorització**: Et donen `Coche` amb atributs públics `marca`, `modelo`, `anio`. Refactoritza: fes-los privats, afig getters/setters validant que l'any estiga entre 1886 i any actual + 1.

### Static

1. **Comptador d'objectes**: Classe `Usuario` amb comptador estàtic d'objectes creats, `id` autoincremental, `static final String DOMINIO_EMAIL = "@dam.com"` i mètode `generarEmail()` que torne `nombre + DOMINIO_EMAIL`.

2. **Classe utilitària OperacionsArray**: Classe `OperacionesArray` amb constructor privat i mètodes: `sumar(int[])`, `media(double[])`, `maximo(int[])`, `minimo(int[])`, `estaOrdenado(int[])`, `buscar(int[], int)`. Usa sense instanciar.

3. **Conversor d'unitats**: Classe `Conversor` amb constants `KM_A_MILLAS = 0.621371`, `LIBRA_A_KG = 0.453592`, etc. Mètodes: `kmAMillas`, `millasAKm`, `celsiusAFahrenheit`, `fahrenheitACelsius`, `librasAKg`, `kgALibras`.

4. **Simulació d'aleatoris**: Classe `Aleatorio` amb mètodes: `entero(int min, int max)`, `decimal(double min, double max)`, `booleano()`, `colorHex()`, `elemento(String[])`.

5. **Classe Config amb constants**: Classe `Config` amb `MAX_INTENTOS_LOGIN = 3`, `TIMEOUT_SEGUNDOS = 300`, `RUTA_LOG = "./logs/app.log"`. Atribut privat `contadorAccesos` amb `incrementarAcceso()` i `getAccesos()`.

6. **Validador de dades**: Classe utilitària `Validador` amb: `esEmailValido(String)`, `esTelefonoValido(String)` (9 dígits), `esDNIValido(String)` (8 dígits + lletra), `esFechaValida(int, int, int)`.

7. **Estadístiques de notes**: Programa que donades notes `double[]` calcule amb mètodes estàtics: mitjana, màxima, mínima, nombre d'aprovats (>= 5) i desviació típica. Classe `Estadisticas`.

8. **Joc de daus**: Simula llançar dos daus 1000 voltes amb `Math.random()`. Classe `Dado` amb mètode `lanzar()` (1-6). Compta quantes voltes ix cada suma (2-12). Classe `Simulacion` amb estructura estàtica.

---

**RAs treballats en esta unitat:**
- **RA4** - Classes (visibilitat, encapsulació)
- **RA7** - Estaticitat

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
