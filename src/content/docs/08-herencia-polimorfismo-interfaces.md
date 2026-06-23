---
title: "🧬 Unidad 8: Herencia, Polimorfismo e Interfaces"
---
🎯 **Objetivos de aprendizaje**
- Heredar de una clase con `extends`
- Usar `super` para acceder a miembros de la superclase
- Sobrescribir métodos con `@Override`
- Diferenciar IS-A vs HAS-A
- Entender el polimorfismo dinámico (dynamic binding)
- Usar `instanceof` y downcasting correctamente
- Aplicar polimorfismo con colecciones y parámetros
- Diseñar clases abstractas con métodos abstractos y concretos
- Implementar interfaces con `implements`
- Diferenciar cuándo usar abstract class vs interface
- Usar métodos `default` en interfaces
- Conocer las interfaces funcionales (`Consumer`, `Supplier`, `Predicate`, `Function`)
- Sobreescribir `toString()`, `equals()` y `hashCode()` de la clase `Object`
- Construir jerarquías de clases completas

---

## Herencia: Cuando Tus Hijos Siguen Tus Pasos (Pero Mejor)

¿Recuerdas cuando heredaste la nariz de tu abuela o el genio para enfadar a tus profesores? Pues en Java pasa lo mismo, pero con menos drama y más código reutilizable.

La herencia es el mecanismo por el cual una clase _hija_ (subclase) obtiene todos los miembros de una clase _padre_ (superclase). Y puede añadir los suyos propios o _mejorar_ los existentes.

### extends: "Soy como tú, pero con mejoras"

Usamos `extends` para decirle a Java que una clase es hija de otra:

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

Perro ahora tiene `nombre`, `edad`, `hacerSonido()` (mejorado) y `moverCola()`. Cortesía de la herencia.

> **💡 Consejo:** Código reutilizado, neuronas ahorradas. La herencia existe para que NO tengas que copiar y pegar el mismo código en 15 clases.

### super: Llamando a mamá/papá para que te ayuden

A veces queremos _extender_ el método del padre, no reemplazarlo. Ahí entra `super`:

```java
public class Gato extends Animal {
    @Override
    public void hacerSonido() {
        super.hacerSonido();
        System.out.println("¡MIAU!");
    }
}
```

`super` es como gritar "¡MAAAAMÁ!" en el supermercado. Le dices a Java: "ejecuta la versión de mi padre, y luego yo hago lo mío".

> **⚠️ Advertencia:** `super` solo sirve para invocar constructores y métodos de la superclase. No puedes pasarlo como parámetro ni asignarlo a una variable.

### @Override: "Papá, yo lo hago mejor"

`@Override` le dice al compilador: "asegúrate de que realmente estoy sobreescribiendo un método del padre":

```java
public class Pez extends Animal {
    @Override
    public void hacerSonido() { }  // ✓ existe en Animal
    @Override
    public void nadar() { }        // ✗ ERROR: no existe en Animal
}
```

> **📝 Nota:** Siempre pon `@Override`. No es obligatorio, pero es como el cinturón de seguridad: no pasa nada si no lo haces... hasta que pasa.

### La regla de oro: IS-A vs HAS-A

- **IS-A** (es-un): Relación de herencia. Perro IS-A Animal.
- **HAS-A** (tiene-un): Relación de composición. Coche HAS-A Motor.

```java
public class Coche extends Vehiculo { }   // IS-A ✓
public class Coche { private Motor m; }   // HAS-A ✓
```

> **¿Who Wants to Be a Millionaire? — Edición Java:**
> ¿Cuál es la relación correcta? a) Cliente extends Persona  b) Cliente has-a Persona  c) Coche extends Rueda
> **Respuesta:** La a. Cliente IS-A Persona. Coche NO es una Rueda, tiene ruedas (HAS-A).

### Jerarquía de clases: El árbol genealógico

```java
public class Animal { }
public class Mamifero extends Animal { }
public class Canino extends Mamifero { }
public class Perro extends Canino { }
```

Perro hereda de Canino, que hereda de Mamifero, que hereda de Animal.

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

### protected: El miembro que solo la familia ve

```java
public class Animal {
    private String secreto;    // Solo Animal
    protected String familia;  // Animal y subclases
    public String nombre;      // Todos
}
```

### ⭐ BE THE CODE, MY FRIEND:

> 🕶️ **Don Tip:** `super` siempre llama al método del padre. Si no lo usas, estás sobreescribiendo completamente.

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
> **Respuesta:** `idSecreto` NO (private), `nombre` sí (protected), `edad` sí (public).

> **¿Qué imprime?**
> ```java
> class Abuelo { void decir() { System.out.println("Abuelo"); } }
> class Padre extends Abuelo { void decir() { System.out.println("Padre"); } }
> class Hijo extends Padre { void decir() { System.out.println("Hijo"); } }
> public class Test {
>     public static void main(String[] args) { new Hijo().decir(); }
> }
> ```
> **Respuesta:** "Hijo". Java busca el método desde la clase más específica hacia arriba.

> **¿Qué imprime con herencia encadenada y super?**
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
> **Respuesta:** "Soy un vehículo", "Soy un coche deportivo", "Soy un coche deportivo". `super.describir()` va a Vehiculo, `this.describir()` se resuelve en runtime como Deportivo.

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** ¿Puedo heredar de varias clases a la vez?
> **A:** No. Java no permite herencia múltiple (el _problema del diamante_). Pero existen las interfaces para eso.

> **Q:** ¿Clase `final`? ¿Método `final`?
> **A:** Clase `final` no puede tener hijas (`String`). Método `final` no puede sobreescribirse.

> **Q:** ¿Atributo con mismo nombre en subclase y superclase?
> **A:** El de la subclase _oculta_ al de la superclase. Pero los atributos NO son polimórficos como los métodos. Con referencia de la superclase, ves el de la superclase.

> **Q:** ¿Los constructores se heredan?
> **A:** No. Pero la subclase llama al constructor del padre con `super()`. Si no lo pones, Java pone `super()` automáticamente.

### El problema de la clase base frágil

Tienes `Jarrón` con `romper()`. `JarrónChino` lo sobreescribe. Alguien añade `caerAlSuelo()` a `Jarrón` que llama a `romper()`. De repente `JarrónChino` se comporta inesperadamente. Es el _fragile base class problem_.

> **Q:** ¿Entonces la herencia es mala?
> **A:** ¡No! Es una herramienta. Bien usada es perfecta para relaciones IS-A claras. El problema es usarla cuando una simple composición bastaría.

### 🧩 EL LÍO

El siguiente código de herencia está mal. Encuentra los errores:

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

¿Qué error impide que Coche compile? ¿Por qué el constructor de Coche falla?

> 🕶️ **Don Tip:** Si el padre tiene un constructor con parámetros, el hijo debe llamarlo con `super()`. Si no, el compilador intenta llamar al constructor vacío del padre... que no existe.

### Resumen visual de la herencia

| Concepto | Traducción Java |
|---|---|
| Tu madre te da sus genes | `class Hija extends Madre` |
| Le pides ayuda a tu padre | `super.metodo()` |
| "Yo lo hago mejor" | `@Override` |
| El secreto que solo sabe la familia | `protected` |

### Ejercicios Propuestos - Herencia

1. **La familia Simpson:** Clase base `IntegranteFamilia` con `nombre` y `edad`. `Homero`, `Marge`, `Bart`, `Lisa` que hereden. Cada una con un método único (`comerRosquilla()`, `decirAyeCaramba()`).

2. **Vehículos terrestres:** `Vehiculo` → `Coche`, `Moto`, `Bicicleta`. Todos con `mover()`.

3. **El problema del jarrón:** `Base` con `a()` y `b()` (b llama a a). `Derivada` sobreescribe `a()`. Llama a `b()`. ¿Qué ocurre?

4. **Biblioteca de medios:** `Medio` → `Libro`, `Pelicula`, `Disco`. Todos con `mostrarInfo()`.

5. **El juego de los animales:** Jerarquía de animales con al menos 4 niveles.

---

## Polimorfismo: El Camaleón de la POO

Polimorfismo (_poly_ = muchas, _morphé_ = formas): un mismo método se comporta diferente según el objeto que lo invoque. Como un control remoto universal donde el mismo botón "PLAY" funciona en Netflix, Spotify y tu tostadora.

### El mismo método, diferentes comportamientos

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

Magia:

```java
Animal a;
a = new Perro(); a.hacerSonido(); // ¡Guau!
a = new Gato(); a.hacerSonido();  // ¡Miau!
```

La variable `a` es tipo `Animal`, pero apunta a objetos diferentes. Se ejecuta el método del objeto real.

### Dynamic Binding

El compilador verifica que `Animal` tenga `hacerSonido()`. Pero _qué_ implementación se ejecuta se decide en runtime. Esto es **dynamic binding** o **late binding**.

> **Compilador:** "Animal tiene hacerSonido()? Sí. Adelante."
> **Runtime:** "El objeto es un Perro. Ejecuto el de Perro."

### Referencias polimórficas

```java
Animal miMascota = new Perro();  // ✓
Animal tuMascota = new Gato();   // ✓
```

Pero la variable solo "ve" los métodos del tipo de la referencia:

```java
Animal a = new Perro();
a.hacerSonido();   // ✓
a.moverCola();     // ✗ Animal no tiene moverCola()
```

### Polimorfismo con colecciones

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

Una sola lista, un solo bucle. Sin polimorfismo necesitarías cuatro listas.

### Polimorfismo con parámetros

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

Y puedes ir más allá:

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

Añadir un `Gato` o un `Perro` no requiere cambiar una línea del Zoológico.

### instanceof: "¿Quién eres realmente?"

```java
Animal a = new Perro();
if (a instanceof Perro) {
    System.out.println("¡Es un perro!");
}
```

> **💡 Consejo:** Úsalo con moderación. Si usas `instanceof` constantemente, algo estás haciendo mal. El polimorfismo debería resolverlo sin preguntar.

### Downcasting: Peligroso pero a veces necesario

```java
Animal a = new Perro();
Perro p = (Perro) a;  // Downcasting
p.moverCola();        // ✓

Animal a2 = new Gato();
Perro p2 = (Perro) a2; // ClassCastException en runtime
```

Siempre con `instanceof` primero:

```java
if (a instanceof Perro) {
    Perro p = (Perro) a;
    p.moverCola();
}
```

### ⭐ BE THE CODE, MY FRIEND:

> 🕶️ **Don Tip:** El compilador mira el tipo de la variable, la JVM mira el tipo real del objeto. Ahí está la magia del polimorfismo.

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
> **Solución:** Hola desde B, Hola desde C, Hola desde C. Solo importa el tipo real del objeto.

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
> **Solución:** "Coche acelera". La línea comentada NO compila: el compilador solo mira el tipo de la referencia.

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
> **Solución:** Los tres imprimen "Vuela alto". El tipo de la referencia no importa.

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** ¿Por qué no puedo hacer `Perro p = new Animal()`?
> **A:** Porque Animal podría no tener los métodos de Perro. ¿Qué pasa si llamas a `moverCola()` y Animal no tiene cola?

> **Q:** ¿Para qué sirve declarar variables del tipo más genérico?
> **A:** Para ser flexible. `ArrayList<Animal>` acepta cualquier subclase. `ArrayList<Perro>` solo Perros.

> **Q:** ¿El polimorfismo funciona con atributos?
> **A:** No. Los atributos no son polimórficos. Los métodos sí; los atributos, no.

### 🥊 EL RING: extends vs implements

Dos palabras clave discuten sobre quién es más importante.

**extends:** «Yo soy la herencia pura. Código reutilizado, una jerarquía clara. Perro extiende Animal. Coche extiende Vehiculo. ¡Soy la base de la POO!»

**implements:** «Sí, pero conmigo no hay límites. Una clase puede implementar varias interfaces. Con `extends` solo tienes un padre. Yo te permito ser varias cosas a la vez: Seriable, Comparable, Cloneable...»

**extends:** «Mis clases pueden tener código ya hecho. Tú solo declaras métodos vacíos. ¡Yo aporto implementación!»

**implements:** «Desde Java 8 tengo métodos `default` y `static`. Mira: `default void log()` ya funciona. Además, soy más flexible: no impongo una jerarquía rígida.»

**extends:** «Vale, pero sin mí las interfaces no tendrían sentido. Una interfaz no puede instanciarse sola.»

**implements:** «Y sin mí tendrías herencia múltiple, que es un caos. Mira el problema del diamante en C++.»

**extends:** «Nos necesitamos.»

**implements:** «Sí. extends para la jerarquía, implements para los contratos.»

> 🕶️ **Don Tip:** Usa `extends` para reutilizar código (IS-A). Usa `implements` para definir capacidades (contratos). Se pueden combinar: `class Perro extends Animal implements Mascota, Jugable`.

### Resumen visual del polimorfismo

| Concepto | Traducción |
|---|---|
| Un método, mil formas | Override + dynamic binding |
| Variable genérica → objeto específico | `Animal a = new Perro()` |
| Decide en ejecución | Dynamic binding |
| Preguntar quién eres | `instanceof` |
| Convertir a la fuerza | Downcasting `(Perro) a` |

### Ejercicios Propuestos - Polimorfismo

1. **Orquesta polimórfica:** `Instrumento` con `tocar()`. `Guitarra`, `Piano`, `Bateria`, `Flauta`.

2. **Calculadora de figuras:** `Figura` con `calcularArea()`. `Circulo`, `Rectangulo`, `Triangulo`. Usa `ArrayList<Figura>`.

3. **Downcasting seguro:** `Empleado` → `Programador` (escribirCodigo), `Diseñador` (disenar). Recórrelos con instanceof.

4. **Batalla de personajes:** `Personaje` → `Guerrero`, `Mago`, `Arquero`. Métodos: `atacar()`, `recibirDano()`.

---

## La Clase Object: El Tatarabuelo de Todo

Todas las clases heredan de `Object`. Siempre.

```java
public class MiClase { } // = public class MiClase extends Object { }
```

Métodos que toda clase hereda:

| Método | ¿Qué hace? | ¿Sobreescribirlo? |
|---|---|---|
| `toString()` | Representación textual | Casi siempre |
| `equals(Object)` | Compara por valor | Cuando tenga sentido |
| `hashCode()` | Código hash | Con equals |
| `getClass()` | Clase del objeto | No |

### toString(): La tarjeta de presentación

Por defecto: `MiClase@1a2b3c`. Sobreescríbelo:

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

### equals(): ¿Mismo objeto o iguales?

Por defecto compara _referencias_. Para comparar por _valor_:

```java
@Override
public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Perro perro = (Perro) o;
    return edad == perro.edad && Objects.equals(nombre, perro.nombre);
}
```

### hashCode(): El código de barras

Si dos objetos son iguales según `equals()`, deben tener el mismo `hashCode()`:

```java
@Override
public int hashCode() { return Objects.hash(nombre, edad); }
```

> **⚠️ Advertencia:** Si sobreescribes `equals()`, DEBES sobreescribir `hashCode()`. Si no, `HashSet`/`HashMap` se comportan impredeciblemente.

### ⭐ BE THE CODE, MY FRIEND:

> 🕶️ **Don Tip:** Los métodos abstractos son contratos: la subclase TIENE que implementarlos. Si no, no compila.

> ```java
> Empleado e1 = new Programador("Ana", "001", 2500, "Java");
> Empleado e2 = new Programador("Ana", "001", 2500, "Java");
> Empleado e3 = new Gerente("Ana", "002", 3000, 500);
> System.out.println(e1);
> System.out.println(e1.equals(e2));
> System.out.println(e1.equals(e3));
> System.out.println(e1.hashCode() == e2.hashCode());
> ```
> **Solución:** `Programador: Ana (ID: 001)`, `true` (mismo id), `false` (distinta clase), `true`.

> ```java
> class Perro extends Animal { Perro(String n) { super(n); } }
> class Gato extends Animal { Gato(String n) { super(n); } }
> System.out.println(new Perro("Firulais").equals(new Gato("Firulais")));
> ```
> **Respuesta:** `false`. `getClass()` devuelve clases diferentes.

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** ¿Sobreescribo `equals()` siempre?
> **A:** No. Solo cuando necesites comparar por valor lógico. Dos `Persona` con mismo DNI sí, dos `Scanner` no.

> **Q:** ¿Y `clone()`?
> **A:** Complicado. Por defecto copia superficial. Mejor un constructor de copia.

---

## Clases Abstractas: El Boceto Que No Puedes Usar Directamente

Imagina "A la venta: Boceto de silla". No puedes sentarte en un boceto. Pues eso son las clases abstractas: planos incompletos para que _otros_ los completen.

### ¿Qué es una clase abstracta?

Una clase que NO puede instanciarse. Puede tener métodos abstractos (sin implementación) y concretos (con implementación):

```java
public abstract class Animal {
    protected String nombre;
    public abstract void hacerSonido();
    public void dormir() {
        System.out.println(nombre + " está durmiendo... Zzz");
    }
}
```

### You MUST: Implementar los métodos abstractos

Si una clase concreta extiende una abstracta, está OBLIGADA a implementar todos los métodos abstractos:

```java
public class Perro extends Animal {
    @Override
    public void hacerSonido() { System.out.println("¡Guau!"); }
}
public abstract class Pajaro extends Animal { } // No obligada: también abstracta
```

### abstract vs concrete

| Clase abstracta | Clase concreta |
|---|---|
| No puedes crear objetos directamente | Puedes crear objetos |
| Puede tener métodos abstractos | Todos implementados |
| Concepto general | Algo específico |
| `abstract class` | Solo `class` |

### Ejemplo: Figuras geométricas

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

### Constructores en clases abstractas

Sí, las abstractas pueden tener constructores. Se llaman con `super()`:

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

### Template Method: Las abstractas en acción

Defines el esqueleto de un algoritmo y dejas que las subclases rellenen los detalles:

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

> 🕶️ **Don Tip:** `implements` es un contrato. La clase se compromete a tener todos los métodos de la interfaz.

> ```java
> public abstract class A { public abstract void metodo(); }
> public class B extends A { }
> ```
> **Respuesta:** NO compila. `B` debe implementar los métodos abstractos de `A`.

> ```java
> public abstract class A { public abstract void metodo(); }
> public class B extends A { public void metodo() { } }
> A a = new A();  // ¿Error?
> B b = new B();  // ¿Error?
> ```
> **Respuesta:** `new A()` ERROR (abstracta), `new B()` OK.

> ```java
> abstract class Animal { abstract void hablar(); }
> abstract class Mamifero extends Animal { void hablar() { System.out.println("Mamífero raro"); } }
> class Gato extends Mamifero { void hablar() { System.out.println("Miau"); } }
> class GatoPersa extends Gato { }
> public class Test {
>     public static void main(String[] args) { Animal a = new GatoPersa(); a.hablar(); }
> }
> ```
> **Respuesta:** "Miau". Dynamic binding.

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** ¿Por qué existen las clases abstractas?
> **A:** 1) Definir un contrato obligatorio. 2) Compartir código. 3) Modelar conceptos sin instancia directa ("Figura").

> **Q:** ¿Puedo tener una clase abstracta sin métodos abstractos?
> **A:** Sí. Para impedir que se instancie directamente.

### Ejercicios Propuestos - Clases Abstractas

1. **Selección abstracta:** `Empleado` con `nombre`, `salarioBase`, abstracto `calcularSalario()`, concreto `mostrarInfo()`. `Programador` y `Vendedor`.

2. **Vehículos abstractos:** `Vehiculo` con `mover()` abstracto, `detener()` concreto. `Coche`, `Bicicleta`, `Avion`.

3. **Figuras 3D:** Añade `calcularVolumen()` abstracto a `Figura`. Implementa `Esfera`, `Cubo`.

---

## Interfaces: El Contrato Que Tu Código Firma

¿Has firmado un contrato? "El trabajador se compromete a: programar en Java, no dormirse en las reuniones..." pero no dice CÓMO. Una **interfaz** en Java es eso: un contrato.

```java
public interface Programable {
    void programar();
    void tomarCafe();
    void irReunion(String hora);
}
```

Cualquier clase que firme el contrato (con `implements`) TIENE que implementar todos esos métodos.

### Declarando e Implementando

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

### Polimorfismo con Interfaces

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

### Múltiples Interfaces

Una clase solo extiende UNA clase pero puede implementar VARIAS interfaces:

```java
public interface Nadador { void nadar(); }
public interface Corredor { void correr(); }
public class Triatleta implements Nadador, Corredor {
    public void nadar() { System.out.println("🏊 Nadando 1.5 km"); }
    public void correr() { System.out.println("🏃 Corriendo 10 km"); }
}
```

### default Methods: Parches Sin Romper Nada

Antes de Java 8, añadir un método a una interfaz rompía todas las implementaciones. Llegaron los métodos `default`:

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

> 🕶️ **Don Tip:** `toString()`, `equals()` y `hashCode()` vienen de `Object`. Sobrescribirlos bien evita bugs rarísimos.

> ```java
> public interface Cantante { void cantar(); }
> public interface Bailarin { void bailar(); }
> public class Artista implements Cantante, Bailarin {
>     public void cantar() { System.out.println("canta"); }
>     // ¡FALTA bailar()!
> }
> ```
> **Respuesta:** NO compila. Implementas TODOS los métodos.

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
> **Respuesta:** "Ataca con espada", "Lanza hechizo", "¡Y usa ambas!". Conflicto resuelto.

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** ¿Por qué no usar simplemente una clase abstracta?
> **A:** Una clase solo hereda de UNA clase, pero implementa VARIAS interfaces. Las interfaces no tienen estado.

> **Q:** ¿Puedo instanciar una interfaz?
> **A:** No. Como intentar casarte con el concepto de "amor".

> **Q:** ¿Dos interfaces con método `default` del mismo nombre?
> **A:** Conflicto. Obliga a sobrescribir y usar `Interfaz.super.metodo()`.

> **Q:** ¿Atributos en interfaces?
> **A:** Sí, pero son `public static final`. Constantes, no atributos de instancia.

### Resumen: Abstract Class vs Interface

| Aspecto | Abstract Class | Interface |
|---|---|---|
| Métodos con código | Sí | Sí (default) |
| Atributos | Cualquiera | `public static final` |
| Herencia múltiple | No (extends uno) | Sí (implements varios) |
| Constructores | Sí | No |

### Ejercicios Propuestos - Interfaces

1. **Interface Encendible:** `Encendible` con `encender()`, `apagar()`, `default estaEncendido()`. `Television` y `Lampara`.

2. **Múltiples interfaces:** `Cantante` y `Bailarin`. `Artista` implementa ambas. Demuestra polimorfismo.

3. **Sistema de notificaciones:** `Notificable` con `enviar(String)` y `getDestinatario()`. `EmailNotificacion` y `SMSNotificacion`.

---

## Interfaces Funcionales: Una Sola Misión

Una interfaz funcional tiene UN SOLO método abstracto. Java las usa con lambdas (`->`):

| Interfaz | Método | Recibe | Devuelve |
|---|---|---|---|
| `Consumer<T>` | `accept(T)` | Un valor | `void` |
| `Supplier<T>` | `get()` | Nada | Un valor |
| `Predicate<T>` | `test(T)` | Un valor | `boolean` |
| `Function<T,R>` | `apply(T)` | Un valor | Otro valor |

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

Son la base de la programación funcional en Java.

---

## Jerarquía de Clases y Composición

### Composición sobre herencia: "Tener vs Ser"

Herencia es "IS-A". Composición es "HAS-A". Cada vez más gente prefiere composición.

```java
// HERENCIA: un coche ES UN vehículo
public class Coche extends Vehiculo { }

// COMPOSICIÓN: un coche TIENE UN motor
public class Coche {
    private Motor motor;
    private Rueda[] ruedas;
}
```

¿Por qué preferir composición?
1. **Menos acoplamiento:** Cambiar la clase padre no rompe las hijas.
2. **Más flexible:** Puedes cambiar las partes en tiempo de ejecución.
3. **Evitas jerarquías profundas:** 5 niveles de herencia = 5 niveles de dolor.

### La jerarquía completa

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

Cada flecha = `extends`. Object está siempre arriba, aunque no lo escribas.

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** ¿Hasta qué profundidad debería tener mi jerarquía?
> **A:** Como mucho, 2-3 niveles. Jerarquías muy profundas son difíciles de mantener.

### Ejercicios Propuestos - Jerarquías

1. **Jerarquía de animales completa:** Al menos 3 niveles, con `toString()`, `equals()` y `hashCode()`. Clase base abstracta.

2. **Sistema de biblioteca:** `ItemBiblioteca` (abstracta) con `prestar()`, `devolver()`, `toString()` y `equals()` por id. `Libro` y `DVD`.

3. **La empresa completa:** `Departamento` con nombre, jefe (`Gerente`) y lista de empleados. Métodos para agregar, calcular nómina y listar.

### 🔮 EL ACERTIJO

Tienes tres clases: `A`, `B` y `C`. `B extends A`, `C extends B`. Las tres tienen un método `void hablar()` que imprime su nombre. En el `main` tienes:

```java
A obj = new C();
((B) obj).hablar();
((A) obj).hablar();
obj.hablar();
```

¿Qué imprime cada línea? ¿Por qué?

> 🕶️ **Don Tip:** El polimorfismo dinámico significa que el método ejecutado depende del tipo REAL del objeto, no del tipo de la variable. Pase lo que pase con los casts, el objeto sigue siendo un `C`.

## Resumen Global

Los 4 pilares de la POO en Java:

| Pilar | Qué es | Cómo se hace en Java |
|-------|--------|---------------------|
| Herencia | Una clase obtiene atributos/métodos de otra | `extends` |
| Polimorfismo | Un mismo método se comporta diferente según el objeto | `@Override` + dynamic binding |
| Abstracción | Ocultar detalles, mostrar solo lo esencial | Clases abstractas (`abstract`) |
| Interfaces | Contrato que las clases deben cumplir | `interface` + `implements` |

**¿Herencia o interfaz?**
- Usa **herencia** cuando hay una relación "es-un" clara (Coche es-un Vehículo)
- Usa **interfaces** cuando hay un comportamiento común sin relación jerárquica (Pato implements Volable, Cantable)
- Prefiere **composición** sobre herencia para reutilización flexible

**Jerarquía de tipos:**
- `class` → `class`: `extends`
- `class` → `interface`: `implements`
- `interface` → `interface`: `extends`
- `abstract class` → `class`: `extends` (debes implementar los métodos abstractos)

---

**RAs trabajados en esta unidad:**
- **RA4** - Clases (herencia, polimorfismo, interfaces, abstractas, Object)
- **RA6** - Estructuras de datos (interfaces funcionales)
- **RA7** - POO Avanzado (herencia, polimorfismo, dynamic binding, interfaces, clases abstractas, jerarquías)

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
