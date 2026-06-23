---
title: "Unidad 8: Herencia, Polimorfismo e Interfaces"
---
🎯 **Objectius d'aprenentatge**
- Heredar d'una classe amb `extends`
- Usar `super` per a accedir a membres de la superclasse
- Sobreescriure mètodes amb `@Override`
- Diferenciar IS-A vs HAS-A
- Entendre el polimorfisme dinàmic (dynamic binding)
- Usar `instanceof` i downcasting correctament
- Aplicar polimorfisme amb col·leccions i paràmetres
- Dissenyar classes abstractes amb mètodes abstractes i concrets
- Implementar interfícies amb `implements`
- Diferenciar quan usar abstract class vs interface
- Usar mètodes `default` en interfícies
- Conéixer les interfícies funcionals (`Consumer`, `Supplier`, `Predicate`, `Function`)
- Sobreescriure `toString()`, `equals()` i `hashCode()` de la classe `Object`
- Construir jerarquies de classes completes

---

## Herència: Quan els Teus fills Seguixen els Teus Passos (Però Millor)

Recordes quan vas heretar el nas de l'àvia o el geni per a enfadar als professors? Doncs en Java passa el mateix, però amb menys drama i més codi reutilitzable.

L'herència és el mecanisme pel qual una classe _filla_ (subclasse) obté tots els membres d'una classe _pare_ (superclasse). I pot afegir els seus propis o _millorar_ els existents.

### extends: "Sóc com tu, però amb millores"

Usem `extends` per a dir-li a Java que una classe és filla d'una altra:

```java
public class Animal {
    protected String nombre;
    protected int edad;
    public void hacerSonido() {
        System.out.println("Algún sonido genérico...");
    }
}
public class Perro extends Animal {
    public void hacerSonido() {
        System.out.println("¡Guau guau!");
    }
    public void moverCola() {
        System.out.println("*mueve la cola felizmente*");
    }
}
```

Perro ara té `nombre`, `edad`, `hacerSonido()` (millorat) i `moverCola()`. Cortesia de l'herència.

> **💡 Consell:** Codi reutilitzat, neurones estalviades. L'herència existix perquè NO hages de copiar i enganxar el mateix codi en 15 classes.

### super: Cridant a mamà/papà perquè t'ajuden

De vegades volem _estendre_ el mètode del pare, no reemplaçar-lo. Ahí entra `super`:

```java
public class Gato extends Animal {
    @Override
    public void hacerSonido() {
        super.hacerSonido();
        System.out.println("¡MIAU!");
    }
}
```

`super` és com cridar "¡MAAAAMÁ!" en el supermercat. Li dius a Java: "executa la versió del meu pare, i després jo faig la meua".

> **⚠️ Advertència:** `super` només servix per a invocar constructors i mètodes de la superclasse. No pots passar-lo com a paràmetre ni assignar-lo a una variable.

### @Override: "Papa, jo ho faig millor"

`@Override` li diu al compilador: "assegura't que realment estic sobreescrivint un mètode del pare":

```java
public class Pez extends Animal {
    @Override
    public void hacerSonido() { }  // ✓ existe en Animal
    @Override
    public void nadar() { }        // ✗ ERROR: no existe en Animal
}
```

> **📝 Nota:** Posem sempre `@Override`. No és obligatori, però és com el cinturó de seguretat: no passa res si no ho fas... fins que passa.

### La regla d'or: IS-A vs HAS-A

- **IS-A** (és-un): Relació d'herència. Perro IS-A Animal.
- **HAS-A** (té-un): Relació de composició. Coche HAS-A Motor.

```java
public class Coche extends Vehiculo { }   // IS-A ✓
public class Coche { private Motor m; }   // HAS-A ✓
```

> **¿Who Wants to Be a Millionaire? — Edició Java:**
> Quina és la relació correcta? a) Cliente extends Persona  b) Cliente has-a Persona  c) Coche extends Rueda
> **Resposta:** La a. Cliente IS-A Persona. Coche NO és una Rueda, té rodes (HAS-A).

### Jerarquia de classes: L'arbre genealògic

```java
public class Animal { }
public class Mamifero extends Animal { }
public class Canino extends Mamifero { }
public class Perro extends Canino { }
```

Perro hereta de Canino, que hereta de Mamifero, que hereta de Animal.

```
       Animal
          │
      ┌───┴───┐
   Mamifero   Ave
      │
   Canino
      │
    Perro
```

### protected: El membre que només la família veu

```java
public class Animal {
    private String secreto;    // Solo Animal
    protected String familia;  // Animal y subclases
    public String nombre;      // Todos
}
```

### ⭐ BE THE CODE, MY FRIEND:

> 🕶️ **Don Tip:** `super` sempre crida al mètode del pare. Si no l'uses, estàs sobreescrivint completament.

> ```java
> public class Animal {
>     private String idSecreto = "X-123";
>     protected String nombre = "Animal";
>     public int edad = 5;
> }
> public class Perro extends Animal {
>     public void mostrar() {
>         System.out.println(idSecreto); // ¿compila?
>         System.out.println(nombre);    // ¿compila?
>         System.out.println(edad);      // ¿compila?
>     }
> }
> ```
> **Resposta:** `idSecreto` NO (private), `nombre` sí (protected), `edad` sí (public).

> **Què imprimix?**
> ```java
> class Abuelo { void decir() { System.out.println("Abuelo"); } }
> class Padre extends Abuelo { void decir() { System.out.println("Padre"); } }
> class Hijo extends Padre { void decir() { System.out.println("Hijo"); } }
> public class Test {
>     public static void main(String[] args) { new Hijo().decir(); }
> }
> ```
> **Resposta:** "Hijo". Java busca el mètode des de la classe més específica cap amunt.

> **Què imprimix amb herència encadenada i super?**
> ```java
> class Vehiculo {
>     void describir() { System.out.println("Soy un vehículo"); }
> }
> class Coche extends Vehiculo {
>     void describir() { System.out.println("Soy un coche"); }
>     void describirCompleto() { super.describir(); this.describir(); }
> }
> class Deportivo extends Coche {
>     void describir() { System.out.println("Soy un coche deportivo"); }
> }
> public class Test {
>     public static void main(String[] args) {
>         Deportivo d = new Deportivo();
>         d.describirCompleto();
>         d.describir();
>     }
> }
> ```
> **Resposta:** "Soy un vehículo", "Soy un coche deportivo", "Soy un coche deportivo". `super.describir()` va a Vehiculo, `this.describir()` es resol en runtime com Deportivo.

### ❓ No hi ha Preguntes Tontes!

> **Q:** Puc heredar de diverses classes alhora?
> **A:** No. Java no permet herència múltiple (el _problema del diamant_). Però existixen les interfícies per a això.

> **Q:** Classe `final`? Mètode `final`?
> **A:** Classe `final` no pot tindre filles (`String`). Mètode `final` no pot sobreescriure's.

> **Q:** Atribut amb el mateix nom en subclasse i superclasse?
> **A:** El de la subclasse _oculta_ el de la superclasse. Però els atributs NO són polimòrfics com els mètodes. Amb referència de la superclasse, veus el de la superclasse.

> **Q:** Els constructors s'hereden?
> **A:** No. Però la subclasse crida al constructor del pare amb `super()`. Si no ho poses, Java posa `super()` automàticament.

### El problema de la classe base fràgil

Tens `Jarrón` amb `romper()`. `JarrónChino` ho sobreescriu. Algú afegix `caerAlSuelo()` a `Jarrón` que crida a `romper()`. De sobte `JarrónChino` es comporta inesperadament. És el _fragile base class problem_.

> **Q:** Llavors l'herència és dolenta?
> **A:** No! És una ferramenta. Ben usada és perfecta per a relacions IS-A clares. El problema és usar-la quan una simple composició bastaria.

### 🧩 EL LÍO

El següent codi d'herència està malament. Troba els errors:

```java
public class Vehiculo {
    private String marca;

    public Vehiculo(String marca) {
        this.marca = marca;
    }

    public void arrancar() {
        System.out.println("Vehículo arrancado");
    }
}

public class Coche extends Vehiculo {
    private int puertas;

    public Coche(String marca, int puertas) {
        this.puertas = puertas;
    }

    @Override
    public void arrancar() {
        System.out.println("Coche arrancado con " + puertas + " puertas");
    }
}
```

Quin error impedix que Coche compile? Per què el constructor de Coche falla?

> 🕶️ **Don Tip:** Si el pare té un constructor amb paràmetres, el fill ha de cridar-lo amb `super()`. Si no, el compilador intenta cridar el constructor buit del pare... que no existix.

### Resum visual de l'herència

| Concepte | Traducció Java |
|---|---|
| Ta mare et dona els seus gens | `class Filla extends Mare` |
| Li demanes ajuda al teu pare | `super.metodo()` |
| "Jo ho faig millor" | `@Override` |
| El secret que només sap la família | `protected` |

### Exercicis Proposats - Herència

1. **La família Simpson:** Classe base `IntegranteFamilia` amb `nombre` i `edad`. `Homero`, `Marge`, `Bart`, `Lisa` que hereden. Cada una amb un mètode únic (`comerRosquilla()`, `decirAyeCaramba()`).

2. **Vehicles terrestres:** `Vehiculo` → `Coche`, `Moto`, `Bicicleta`. Tots amb `mover()`.

3. **El problema del gerro:** `Base` amb `a()` i `b()` (b crida a a). `Derivada` sobreescriu `a()`. Crida a `b()`. Què ocorre?

4. **Biblioteca de mitjans:** `Medio` → `Libro`, `Pelicula`, `Disco`. Tots amb `mostrarInfo()`.

5. **El joc dels animals:** Jerarquia d'animals amb almenys 4 nivells.

---

## Polimorfisme: El Camaleó de la POO

Polimorfisme (_poly_ = moltes, _morphé_ = formes): un mateix mètode es comporta diferent segons l'objecte que l'invoque. Com un comandament universal on el mateix botó "PLAY" funciona en Netflix, Spotify i la teua torradora.

### El mateix mètode, diferents comportaments

```java
public class Animal {
    public void hacerSonido() { System.out.println("..."); }
}
public class Perro extends Animal {
    @Override
    public void hacerSonido() { System.out.println("¡Guau!"); }
}
public class Gato extends Animal {
    @Override
    public void hacerSonido() { System.out.println("¡Miau!"); }
}
```

Màgia:

```java
Animal a;
a = new Perro(); a.hacerSonido(); // ¡Guau!
a = new Gato(); a.hacerSonido();  // ¡Miau!
```

La variable `a` és tipus `Animal`, però apunta a objectes diferents. S'executa el mètode de l'objecte real.

### Dynamic Binding

El compilador verifica que `Animal` tinga `hacerSonido()`. Però _quina_ implementació s'executa es decidix en runtime. Això és **dynamic binding** o **late binding**.

> **Compilador:** "Animal té hacerSonido()? Sí. Endavant."
> **Runtime:** "L'objecte és un Perro. Execute el de Perro."

### Referències polimòrfiques

```java
Animal miMascota = new Perro();  // ✓
Animal tuMascota = new Gato();   // ✓
```

Però la variable només "veu" els mètodes del tipus de la referència:

```java
Animal a = new Perro();
a.hacerSonido();   // ✓
a.moverCola();     // ✗ Animal no tiene moverCola()
```

### Polimorfisme amb col·leccions

```java
ArrayList<Animal> animales = new ArrayList<>();
animales.add(new Perro());
animales.add(new Gato());
animales.add(new Vaca());

for (Animal a : animales) {
    a.hacerSonido();  // Cada uno el suyo
}
// ¡Guau! / ¡Miau! / ¡Muuu!
```

Una sola llista, un sol bucle. Sense polimorfisme necessitaries quatre llistes.

### Polimorfisme amb paràmetres

```java
public class Veterinario {
    public void vacunar(Animal a) {
        System.out.print("Vacunando a: ");
        a.hacerSonido();
    }
}
Veterinario vet = new Veterinario();
vet.vacunar(new Perro()); // Vacunando a: ¡Guau!
vet.vacunar(new Gato());  // Vacunando a: ¡Miau!
```

I pots anar més lluny:

```java
public class Zoologico {
    private ArrayList<Animal> animales = new ArrayList<>();
    public void agregarAnimal(Animal a) { animales.add(a); }
    public void hacerDesfile() {
        for (Animal a : animales) {
            System.out.print(a.getClass().getSimpleName() + " dice: ");
            a.hacerSonido();
        }
    }
}
```

Afegir un `Gato` o un `Perro` no requerix canviar una línia del Zoológico.

### instanceof: "Qui eres realment?"

```java
Animal a = new Perro();
if (a instanceof Perro) {
    System.out.println("¡Es un perro!");
}
```

> **💡 Consell:** Usa-ho amb moderació. Si uses `instanceof` constantment, alguna cosa estàs fent mal. El polimorfisme hauria de resoldre-ho sense preguntar.

### Downcasting: Perillós però de vegades necessari

```java
Animal a = new Perro();
Perro p = (Perro) a;  // Downcasting
p.moverCola();        // ✓

Animal a2 = new Gato();
Perro p2 = (Perro) a2; // ClassCastException en runtime
```

Sempre amb `instanceof` primer:

```java
if (a instanceof Perro) {
    Perro p = (Perro) a;
    p.moverCola();
}
```

### ⭐ BE THE CODE, MY FRIEND:

> 🕶️ **Don Tip:** El compilador mira el tipus de la variable, la JVM mira el tipus real de l'objecte. Ahí està la màgia del polimorfisme.

> ```java
> class A { void saluda() { System.out.println("Hola desde A"); } }
> class B extends A { void saluda() { System.out.println("Hola desde B"); } }
> class C extends B { void saluda() { System.out.println("Hola desde C"); } }
> public class Test {
>     public static void main(String[] args) {
>         A ref1 = new B(); A ref2 = new C(); B ref3 = new C();
>         ref1.saluda(); ref2.saluda(); ref3.saluda();
>     }
> }
> ```
> **Solució:** Hola desde B, Hola desde C, Hola desde C. Només importa el tipus real de l'objecte.

> ```java
> class Vehiculo { void mover() { System.out.println("Vehículo se mueve"); } }
> class Coche extends Vehiculo {
>     void mover() { System.out.println("Coche acelera"); }
>     void abrirPuertas() { System.out.println("Puertas abiertas"); }
> }
> public class Test {
>     public static void main(String[] args) {
>         Vehiculo v = new Coche();
>         v.mover();
>         // v.abrirPuertas(); <- ¿compila?
>     }
> }
> ```
> **Solució:** "Coche acelera". La línia comentada NO compila: el compilador només mira el tipus de la referència.

> ```java
> interface Volable { void volar(); }
> class Pajaro implements Volable {
>     public void volar() { System.out.println("Vuela"); }
> }
> class Aguila extends Pajaro {
>     public void volar() { System.out.println("Vuela alto"); }
> }
> public class Test {
>     public static void main(String[] args) {
>         Volable v = new Aguila();
>         Pajaro p = new Aguila();
>         Object o = new Aguila();
>         v.volar(); p.volar(); // ¿y o?
>     }
> }
> ```
> **Solució:** Els tres imprimixen "Vuela alto". El tipus de la referència no importa.

### ❓ No hi ha Preguntes Tontes!

> **Q:** Per què no puc fer `Perro p = new Animal()`?
> **A:** Perquè Animal podria no tindre els mètodes de Perro. Què passa si crides a `moverCola()` i Animal no té cua?

> **Q:** Per a què servix declarar variables del tipus més genèric?
> **A:** Per a ser flexible. `ArrayList<Animal>` accepta qualsevol subclasse. `ArrayList<Perro>` només Perros.

> **Q:** El polimorfisme funciona amb atributs?
> **A:** No. Els atributs no són polimòrfics. Els mètodes sí; els atributs, no.

### 🥊 EL RING: extends vs implements

Dues paraules clau discuteixen sobre qui és més important.

**extends:** «Jo soc l'herència pura. Codi reutilitzat, una jerarquia clara. Gos extend Animal. Cotxe extend Vehicle. ¡Soc la base de la POO!»

**implements:** «Sí, però amb mi no hi ha límits. Una classe pot implementar diverses interfícies. Amb `extends` només tens un pare. Jo et permeta ser varies coses a la volta: Serializable, Comparable, Cloneable...»

**extends:** «Les meues classes poden tindre codi ja fet. Tu només declares mètodes buits. ¡Jo aporte implementació!»

**implements:** «Des de Java 8 tinc mètodes `default` i `static`. Mira: `default void log()` ja funciona. A més, soc més flexible: no imposo una jerarquia rígida.»

**extends:** «Val, però sense mi les interfícies no tindrien sentit. Una interfície no pot instanciar-se sola.»

**implements:** «I sense mi tindries herència múltiple, que és un caos. Mira el problema del diamant en C++.»

**extends:** «Ens necessitem.»

**implements:** «Sí. extends per a la jerarquia, implements per als contractes.»

> 🕶️ **Don Tip:** Usa `extends` per a reutilitzar codi (IS-A). Usa `implements` per a definir capacitats (contractes). Es poden combinar: `class Gos extends Animal implements Mascota, Jugable`.

### Resum visual del polimorfisme

| Concepte | Traducció |
|---|---|
| Un mètode, mil formes | Override + dynamic binding |
| Variable genèrica → objecte específic | `Animal a = new Perro()` |
| Decidix en execució | Dynamic binding |
| Preguntar qui eres | `instanceof` |
| Convertir a la força | Downcasting `(Perro) a` |

### Exercicis Proposats - Polimorfisme

1. **Orquestra polimòrfica:** `Instrumento` amb `tocar()`. `Guitarra`, `Piano`, `Bateria`, `Flauta`.

2. **Calculadora de figures:** `Figura` amb `calcularArea()`. `Circulo`, `Rectangulo`, `Triangulo`. Usa `ArrayList<Figura>`.

3. **Downcasting segur:** `Empleado` → `Programador` (escribirCodigo), `Diseñador` (disenar). Recorre'ls amb instanceof.

4. **Batalla de personatges:** `Personaje` → `Guerrero`, `Mago`, `Arquero`. Mètodes: `atacar()`, `recibirDano()`.

---

## La Classe Object: El Besavi de Tot

Totes les classes hereden d'`Object`. Sempre.

```java
public class MiClase { } // = public class MiClase extends Object { }
```

Mètodes que tota classe hereta:

| Mètode | Què fa? | Sobreescriure'l? |
|---|---|---|
| `toString()` | Representació textual | Quasi sempre |
| `equals(Object)` | Compara per valor | Quan tinga sentit |
| `hashCode()` | Codi hash | Amb equals |
| `getClass()` | Classe de l'objecte | No |

### toString(): La targeta de presentació

Per defecte: `MiClase@1a2b3c`. Sobreescriu-lo:

```java
public class Perro {
    private String nombre;
    private int edad;
    @Override
    public String toString() {
        return "Perro{nombre='" + nombre + "', edad=" + edad + "}";
    }
}
System.out.println(new Perro("Firulais", 3));
// Perro{nombre='Firulais', edad=3}
```

### equals(): Mateix objecte o iguals?

Per defecte compara _referències_. Per a comparar per _valor_:

```java
@Override
public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Perro perro = (Perro) o;
    return edad == perro.edad && Objects.equals(nombre, perro.nombre);
}
```

### hashCode(): El codi de barres

Si dos objectes són iguals segons `equals()`, han de tindre el mateix `hashCode()`:

```java
@Override
public int hashCode() { return Objects.hash(nombre, edad); }
```

> **⚠️ Advertència:** Si sobreescrius `equals()`, HAS de sobreescriure `hashCode()`. Si no, `HashSet`/`HashMap` es comporten impredeciblement.

### ⭐ BE THE CODE, MY FRIEND:

> 🕶️ **Don Tip:** Els mètodes abstractes són contractes: la subclasse HA d'implementar-los. Si no, no compila.

> ```java
> Empleado e1 = new Programador("Ana", "001", 2500, "Java");
> Empleado e2 = new Programador("Ana", "001", 2500, "Java");
> Empleado e3 = new Gerente("Ana", "002", 3000, 500);
> System.out.println(e1);
> System.out.println(e1.equals(e2));
> System.out.println(e1.equals(e3));
> System.out.println(e1.hashCode() == e2.hashCode());
> ```
> **Solució:** `Programador: Ana (ID: 001)`, `true` (mateix id), `false` (distinta classe), `true`.

> ```java
> class Perro extends Animal { Perro(String n) { super(n); } }
> class Gato extends Animal { Gato(String n) { super(n); } }
> System.out.println(new Perro("Firulais").equals(new Gato("Firulais")));
> ```
> **Resposta:** `false`. `getClass()` torna classes diferents.

### ❓ No hi ha Preguntes Tontes!

> **Q:** Sobrescric `equals()` sempre?
> **A:** No. Només quan necessites comparar per valor lògic. Dos `Persona` amb el mateix DNI sí, dos `Scanner` no.

> **Q:** I `clone()`?
> **A:** Complicat. Per defecte còpia superficial. Millor un constructor de còpia.

---

## Classes Abstractes: El Esbós Que No Pots Usar Directament

Imagina "A la venda: Esbós de cadira". No pots seure't en un esbós. Doncs això són les classes abstractes: plànols incomplets perquè _altres_ els complenten.

### Què és una classe abstracta?

Una classe que NO pot instanciar-se. Pot tindre mètodes abstractes (sense implementació) i concrets (amb implementació):

```java
public abstract class Animal {
    protected String nombre;
    public abstract void hacerSonido();
    public void dormir() {
        System.out.println(nombre + " está durmiendo... Zzz");
    }
}
```

### You MUST: Implementar els mètodes abstractes

Si una classe concreta estén una abstracta, està OBLIGADA a implementar tots els mètodes abstractes:

```java
public class Perro extends Animal {
    @Override
    public void hacerSonido() { System.out.println("¡Guau!"); }
}
public abstract class Pajaro extends Animal { } // No obligada: también abstracta
```

### abstract vs concrete

| Classe abstracta | Classe concreta |
|---|---|
| No pots crear objectes directament | Pots crear objectes |
| Pot tindre mètodes abstractes | Tots implementats |
| Concepte general | Alguna cosa específica |
| `abstract class` | Només `class` |

### Exemple: Figures geomètriques

```java
public abstract class Figura {
    protected String color;
    public Figura(String color) { this.color = color; }
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
    public void mostrarColor() { System.out.println("Color: " + color); }
}
public class Circulo extends Figura {
    private double radio;
    public Circulo(String color, double radio) { super(color); this.radio = radio; }
    @Override public double calcularArea() { return Math.PI * radio * radio; }
    @Override public double calcularPerimetro() { return 2 * Math.PI * radio; }
}
public class Rectangulo extends Figura {
    private double ancho, alto;
    public Rectangulo(String color, double ancho, double alto) { super(color); this.ancho = ancho; this.alto = alto; }
    @Override public double calcularArea() { return ancho * alto; }
    @Override public double calcularPerimetro() { return 2 * (ancho + alto); }
}
```

### Constructors en classes abstractes

Sí, les abstractes poden tindre constructors. Es criden amb `super()`:

```java
public abstract class Animal {
    protected String nombre;
    public Animal(String nombre) {
        this.nombre = nombre;
        System.out.println("Constructor de Animal");
    }
}
public class Perro extends Animal {
    public Perro(String nombre) { super(nombre); }
}
```

### Template Method: Les abstractes en acció

Definixes l'esquelet d'un algoritme i deixes que les subclasses ompliguen els detalls:

```java
public abstract class Bebida {
    public final void preparar() {
        hervirAgua();
        prepararIngrediente();
        servirEnTaza();
        añadirExtras();
    }
    private void hervirAgua() { System.out.println("Hirviendo agua..."); }
    private void servirEnTaza() { System.out.println("Sirviendo en taza..."); }
    protected abstract void prepararIngrediente();
    protected abstract void añadirExtras();
}
public class Te extends Bebida {
    @Override protected void prepararIngrediente() { System.out.println("Poniendo la bolsita de té..."); }
    @Override protected void añadirExtras() { System.out.println("Añadiendo limón..."); }
}
```

### ⭐ BE THE CODE, MY FRIEND:

> 🕶️ **Don Tip:** `implements` és un contracte. La classe es compromet a tindre tots els mètodes de la interfície.

> ```java
> public abstract class A { public abstract void metodo(); }
> public class B extends A { }
> ```
> **Resposta:** NO compila. `B` ha d'implementar els mètodes abstractes de `A`.

> ```java
> public abstract class A { public abstract void metodo(); }
> public class B extends A { public void metodo() { } }
> A a = new A();  // ¿Error?
> B b = new B();  // ¿Error?
> ```
> **Resposta:** `new A()` ERROR (abstracta), `new B()` OK.

> ```java
> abstract class Animal { abstract void hablar(); }
> abstract class Mamifero extends Animal { void hablar() { System.out.println("Mamífero raro"); } }
> class Gato extends Mamifero { void hablar() { System.out.println("Miau"); } }
> class GatoPersa extends Gato { }
> public class Test {
>     public static void main(String[] args) { Animal a = new GatoPersa(); a.hablar(); }
> }
> ```
> **Resposta:** "Miau". Dynamic binding.

### ❓ No hi ha Preguntes Tontes!

> **Q:** Per què existixen les classes abstractes?
> **A:** 1) Definir un contracte obligatori. 2) Compartir codi. 3) Modelar conceptes sense instància directa ("Figura").

> **Q:** Puc tindre una classe abstracta sense mètodes abstractes?
> **A:** Sí. Per a impedir que s'instancie directament.

### Exercicis Proposats - Classes Abstractes

1. **Selecció abstracta:** `Empleado` amb `nombre`, `salarioBase`, abstracte `calcularSalario()`, concret `mostrarInfo()`. `Programador` i `Vendedor`.

2. **Vehicles abstractes:** `Vehiculo` amb `mover()` abstracte, `detener()` concret. `Coche`, `Bicicleta`, `Avion`.

3. **Figures 3D:** Afig `calcularVolumen()` abstracte a `Figura`. Implementa `Esfera`, `Cubo`.

---

## Interfícies: El Contracte Que El Teu Codi Firmar

Has firmat un contracte? "El treballador es compromet a: programar en Java, no dormir-se en les reunions..." però no diu COM. Una **interfície** en Java és això: un contracte.

```java
public interface Programable {
    void programar();
    void tomarCafe();
    void irReunion(String hora);
}
```

Qualsevol classe que firme el contracte (amb `implements`) HA d'implementar tots eixos mètodes.

### Declarant i Implementant

```java
public interface Reproducible {
    void reproducir();
    void pausar();
    void detener();
    int obtenerDuracion();
}
public class Cancion implements Reproducible {
    private String titulo;
    public Cancion(String titulo) { this.titulo = titulo; }
    @Override public void reproducir() { System.out.println("🎵 Reproduciendo: " + titulo); }
    @Override public void pausar() { System.out.println("⏸ Canción pausada"); }
    @Override public void detener() { System.out.println("⏹ Canción detenida"); }
    @Override public int obtenerDuracion() { return 240; }
}
```

### Polimorfisme amb Interfícies

```java
public class Reproductor {
    public static void main(String[] args) {
        List<Reproducible> lista = new ArrayList<>();
        lista.add(new Cancion("Bohemian Rhapsody"));
        lista.add(new Pelicula("Inception"));
        for (Reproducible r : lista) {
            r.reproducir(); // No sabe si es canción o película
        }
    }
}
```

### Múltiples Interfícies

Una classe només estén UNA classe però pot implementar VARIES interfícies:

```java
public interface Nadador { void nadar(); }
public interface Corredor { void correr(); }
public class Triatleta implements Nadador, Corredor {
    public void nadar() { System.out.println("🏊 Nadando 1.5 km"); }
    public void correr() { System.out.println("🏃 Corriendo 10 km"); }
}
```

### default Methods: Pegats Sense Trencar Res

Abans de Java 8, afegir un mètode a una interfície trencava totes les implementacions. Arribaren els mètodes `default`:

```java
public interface Volable {
    void volar();
    default void despegar() { System.out.println("🛫 Despegando..."); }
}
public class Avion implements Volable {
    public void volar() { System.out.println("✈️ Volando a 900 km/h"); }
    // despegar() ya viene implementada
}
```

### ⭐ BE THE CODE, MY FRIEND:

> 🕶️ **Don Tip:** `toString()`, `equals()` i `hashCode()` venen d'`Object`. Sobreescriure'ls bé evita bugs raríssims.

> ```java
> public interface Cantante { void cantar(); }
> public interface Bailarin { void bailar(); }
> public class Artista implements Cantante, Bailarin {
>     public void cantar() { System.out.println("canta"); }
>     // ¡FALTA bailar()!
> }
> ```
> **Resposta:** NO compila. Implementes TOTS els mètodes.

> ```java
> interface Guerrero { default void atacar() { System.out.println("Ataca con espada"); } }
> interface Mago { default void atacar() { System.out.println("Lanza hechizo"); } }
> class Personaje implements Guerrero, Mago {
>     public void atacar() {
>         Guerrero.super.atacar();
>         Mago.super.atacar();
>         System.out.println("¡Y usa ambas!");
>     }
> }
> ```
> **Resposta:** "Ataca con espada", "Lanza hechizo", "¡Y usa ambas!". Conflicte resolt.

### ❓ No hi ha Preguntes Tontes!

> **Q:** Per què no usar simplement una classe abstracta?
> **A:** Una classe només hereda d'UNA classe, però implementa VARIES interfícies. Les interfícies no tenen estat.

> **Q:** Puc instanciar una interfície?
> **A:** No. Com intentar casar-te amb el concepte d'"amor".

> **Q:** Dos interfícies amb mètode `default` del mateix nom?
> **A:** Conflicte. Obliga a sobreescriure i usar `Interfaz.super.metodo()`.

> **Q:** Atributs en interfícies?
> **A:** Sí, però són `public static final`. Constants, no atributs d'instància.

### Resum: Abstract Class vs Interface

| Aspecte | Abstract Class | Interface |
|---|---|---|
| Mètodes amb codi | Sí | Sí (default) |
| Atributs | Qualsevol | `public static final` |
| Herència múltiple | No (extends un) | Sí (implements varis) |
| Constructors | Sí | No |

### Exercicis Proposats - Interfícies

1. **Interface Encendible:** `Encendible` amb `encender()`, `apagar()`, `default estaEncendido()`. `Television` i `Lampara`.

2. **Múltiples interfícies:** `Cantante` i `Bailarin`. `Artista` implementa ambdues. Demostra polimorfisme.

3. **Sistema de notificacions:** `Notificable` amb `enviar(String)` i `getDestinatario()`. `EmailNotificacion` i `SMSNotificacion`.

---

## Interfícies Funcionals: Una Sola Missió

Una interfície funcional té UN SOL mètode abstracte. Java les usa amb lambdes (`->`):

| Interfície | Mètode | Rep | Torna |
|---|---|---|---|
| `Consumer<T>` | `accept(T)` | Un valor | `void` |
| `Supplier<T>` | `get()` | Res | Un valor |
| `Predicate<T>` | `test(T)` | Un valor | `boolean` |
| `Function<T,R>` | `apply(T)` | Un valor | Un altre valor |

```java
Consumer<String> imprimir = s -> System.out.println(s);
imprimir.accept("Hola");

Supplier<Double> aleatorio = () -> Math.random();
System.out.println(aleatorio.get());

Predicate<Integer> esPar = n -> n % 2 == 0;
System.out.println(esPar.test(4)); // true

Function<String, Integer> longitud = s -> s.length();
System.out.println(longitud.apply("Java")); // 4
```

Són la base de la programació funcional en Java.

---

## Jerarquia de Classes i Composició

### Composició sobre herència: "Tindre vs Ser"

Herència és "IS-A". Composició és "HAS-A". Cada volta més gent preferix composició.

```java
// HERENCIA: un coche ES UN vehículo
public class Coche extends Vehiculo { }

// COMPOSICIÓN: un coche TIENE UN motor
public class Coche {
    private Motor motor;
    private Rueda[] ruedas;
}
```

Per què preferir composició?
1. **Menys acoblament:** Canviar la classe pare no trenca les filles.
2. **Més flexible:** Pots canviar les parts en temps d'execució.
3. **Evites jerarquies profundes:** 5 nivells d'herència = 5 nivells de dolor.

### La jerarquia completa

```
                  Object
                    │
              ┌─────┴──────┐
           Vehiculo      Empleado (abstractos)
              │             │
        ┌─────┼─────┐   ┌──┼──┐
      Coche Moto Camion  │  │  │
                  Gerente Programador Becario
```

Cada fletxa = `extends`. Object està sempre dalt, encara que no ho escrigues.

### ❓ No hi ha Preguntes Tontes!

> **Q:** Fins a quina profunditat hauria de tindre la meua jerarquia?
> **A:** Com a molt, 2-3 nivells. Jerarquies molt profundes són difícils de mantindre.

### Exercicis Proposats - Jerarquies

1. **Jerarquia d'animals completa:** Almenys 3 nivells, amb `toString()`, `equals()` i `hashCode()`. Classe base abstracta.

2. **Sistema de biblioteca:** `ItemBiblioteca` (abstracta) amb `prestar()`, `devolver()`, `toString()` i `equals()` per id. `Libro` i `DVD`.

3. **L'empresa completa:** `Departamento` amb nom, cap (`Gerente`) i llista d'empleats. Mètodes per a agregar, calcular nòmina i llistar.

### 🔮 L'ENIGMA

Tens tres classes: `A`, `B` i `C`. `B extends A`, `C extends B`. Les tres tenen un mètode `void parlar()` que imprimix el seu nom. Al `main` tens:

```java
A obj = new C();
((B) obj).hablar();
((A) obj).hablar();
obj.hablar();
```

Què imprimix cada línia? Per què?

> 🕶️ **Don Tip:** El polimorfisme dinàmic significa que el mètode executat depén del tipus REAL de l'objecte, no del tipus de la variable. Pase el que pase amb els casts, l'objecte continua sent un `C`.

## Resum Global

Els 4 pilars de la POO en Java:

| Pilar | Què és | Com es fa en Java |
|-------|--------|------------------|
| Herència | Una classe obté atributs/mètodes d'una altra | `extends` |
| Polimorfisme | Un mateix mètode es comporta diferent segons l'objecte | `@Override` + dynamic binding |
| Abstracció | Ocultar detalls, mostrar només l'essencial | Classes abstractes (`abstract`) |
| Interfícies | Contracte que les classes han de complir | `interface` + `implements` |

**Herència o interfície?**
- Usa **herència** quan hi ha una relació "és-un" clara (Cotxe és-un Vehicle)
- Usa **interfícies** quan hi ha un comportament comú sense relació jeràrquica (Ànec implements Volable, Cantable)
- Preferix **composició** sobre herència per a reutilització flexible

---

**RAs treballats en esta unitat:**
- **RA4** - Classes (herència, polimorfisme, interfícies, abstractes, Object)
- **RA6** - Estructures de dades (interfícies funcionals)
- **RA7** - POO Avançat (herència, polimorfisme, dynamic binding, interfícies, classes abstractes, jerarquies)

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
