---
title: "🏗️ Unidad 4: POO - Clases y Objetos"
nav_order: 4
---
🎯 **Objetivos de aprendizaje**
- Crear clases, objetos y constructores
- Diferenciar entre clase y objeto
- Usar Scanner para entrada por consola
- Entender paquetes e imports
- Sobrescribir toString() y equals()
- Usar this y sobrecarga de constructores

## POO: Tus Objetos Cobran Vida

Hasta ahora hemos escrito programas lineales: esto, luego esto, luego esto. Pero el mundo real no funciona así. En el mundo real tienes *cosas*: un perro, un coche, un profesor de programación con gafas de pasta. Cada cosa tiene **atributos** (color, edad, número de ganas de corregir exámenes) y **comportamientos** (ladrar, acelerar, poner faltas de ortografía).

La **Programación Orientada a Objetos (POO)** es simplemente eso: escribir código como funciona el mundo real.

## Clases y Objetos: Cortapastas vs Galletas

Una **clase** es un *cortapastas* (un molde). Un **objeto** es la *galleta* que haces con ese molde.

Puedes tener un solo cortapastas con forma de estrella y hacer millones de galletas estrella. Todas tendrán la misma forma, pero cada una puede tener diferente cantidad de pepitas de chocolate.

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

Para crear galletas (objetos) a partir del molde:

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

Dos galletas distintas (objetos distintos) con el mismo cortapastas (clase). Cada una con sus propios valores.

### Scanner: El Intérprete Amigable

Hasta ahora los datos estaban *escritos en el código*. Pero... ¿y si queremos que el usuario meta datos? Ahí aparece `Scanner`, nuestro intérprete personal.

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

> **💡 Consejo:** `Scanner` es de `java.util`. Si no pones `import java.util.Scanner;` arriba del todo, Java te mirará con cara de "no sé quién es ese tal Scanner". Los imports son como presentar a tus amigos antes de hablar de ellos.

> **⚠️ Advertencia:** Cuando mezclas `nextInt()` y `nextLine()` pueden pasar cosas raras. `nextInt()` lee el número pero *deja el salto de línea sin leer*. Luego `nextLine()` lee ese salto de línea y parece que se salta la pregunta. Solución: pon un `sc.nextLine();` extra después de `nextInt()` para consumir esa basurilla.

### Constructores: La Fiesta de Bienvenida

Cuando creas un objeto, se ejecuta un **constructor**, que es un método especial que prepara el objeto. Como la fiesta de bienvenida a un nuevo empleado.

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

### ⭐ BE THE CODE, MY FRIEND: El Creador de Personas

> 🕶️ **Don Tip:** Sigue cada `new` como si crearas un objeto en la memoria. Después sigue las llamadas a métodos paso a paso.

Vas a ser la JVM. Te dan:

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

**Traza mental:**

1. Se crea un objeto `Coche` con marca "Seat". Su velocidad empieza en 0.
2. `c.acelerar(50)` → `this.velocidad += 50` → velocidad = 50.
3. `c.acelerar(30)` → `this.velocidad += 30` → velocidad = 80.
4. `c.frenar(20)` → `this.velocidad -= 20` → velocidad = 60.
5. Imprime: **"Seat va a 60 km/h"**.

**Variante:** ¿Y si frenamos con 100 en lugar de 20? `c.frenar(100)`: velocidad pasaría a -20, pero el `if` la pone a 0. Es como si el coche tuviera frenos de verdad: no puedes ir a velocidad negativa.

### Packages: Los Barrios de la Ciudad Java

Java tiene MILES de clases. Para no volverse loco, las organiza en **paquetes** (packages). Piensa en ellos como barrios de una ciudad:

- `java.lang` — El centro histórico. `String`, `Math`, `System`. Se importa solo.
- `java.util` — El barrio de las herramientas. `Scanner`, `ArrayList`, `Date`.
- `java.io` — La zona portuaria. Para leer y escribir archivos.
- `java.net` — El aeropuerto. Para comunicaciones en red.
- `javax.swing` — El barrio de los arquitectos. Interfaces gráficas.

Para usar una clase de otro barrio, tienes que *importarla*:

```java
import java.util.Scanner;       // "Quiero usar el Scanner del barrio util"
import java.util.*;             // "Tráeme TODO lo que haya en java.util"
```

Las clases de `java.lang` no necesitan import. Es como tu casa: no necesitas pedir permiso para entrar en tu propia cocina.

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** Vale, `new` crea objetos. Pero, ¿qué pinta `new`? ¿Es un operador?
>
> **A:** `new` es el *constructor de objetos* de Java. Reserva memoria, llama al constructor y devuelve la dirección del objeto. Sin `new`, no hay objeto. Es como la llave que enciende el coche: sin ella, no arrancas.

> **Q:** ¿Y por qué `String nombre = "Ana";` no lleva `new`?
>
> **A:** Porque Java es un amor con `String`. Es tan común que te deja crear strings con comillas directamente (literales). Es un *atajo*. Detrás del telón, Java lo trata casi como si tuviera `new`. Pero `Scanner sc = "System.in";` no funciona. `Scanner` no es especial, `String` sí.

> **Q:** ¿Cuál es la diferencia entre `equals()` y `==` para comparar objetos?
>
> **A:** `==` compara si dos variables apuntan al *mismo objeto* (misma dirección). `equals()` compara si el *contenido* es el mismo. Con `String`:
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
> **A:** Sí. Cada clase puede tener su propio `main`. Es como tener varias puertas de entrada a una casa. Cuando ejecutas `java NombreClase`, Java busca el `main` de esa clase concreta. Los demás `main` de otras clases... ahí están, durmiendo.

> **Q:** ¿Qué pasa si no pongo constructor y luego hago `new Persona("Ana")`?
>
> **A:** Java te dirá: "Oye, no existe un constructor `Persona(String)`. Te voy a dejar tirado con un error de compilación." Si no pones NINGÚN constructor, Java te da uno vacío sin parámetros. Pero si pones ALGÚN constructor, el vacío NO se crea automáticamente.

### Constructores: Las Instrucciones del Horno

Un constructor es un método especial con el MISMO nombre que la clase y que NO devuelve nada (ni `void`). Es como programar el horno: "temperature: 180, mode: turbo".

#### Constructor por Defecto (El Horno por Defecto)

Si no escribes ningún constructor, Java te regala uno gratis. Inicializa todo a `null`, `0` o `false`. Como un horno frío.

#### Constructor Parametrizado (El Horno con Programa)

Tú le dices cómo quieres la galleta.

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

#### Sobrecarga de Constructores: Varios Hornos, Una Cocina

Puedes tener varios constructores con distintos parámetros. Como una lavadora: programa corto, programa largo, programa de "esto es una camisa de seda, que no se me encoja".

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

#### La Palabra Clave `this`: Yo, Mí, Me, Conmigo

`this` es el objeto diciendo "OYE, HABLO DE MÍ, NO DE OTRO". Sirve para:

1. Desambiguar: cuando el parámetro se llama igual que el atributo.

```java
public class Persona {
    String nombre;

    public Persona(String nombre) {
        this.nombre = nombre; // "this.nombre" es el de arriba, "nombre" es el parámetro
    }
}
```

2. Llamar a otro constructor: `this(...)`.
3. Pasarte a ti mismo como argumento.

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

> **📝 Nota:** Si no pones `this` cuando hay ambigüedad, Java se confunde. Es como si en una conversación dices "nombre" y hay dos personas llamadas "nombre". Te van a mirar raro.

### ⭐ BE THE CODE, MY FRIEND: La Caja Misteriosa

> 🕶️ **Don Tip:** Fíjate en qué objeto se llama cada método. La variable de referencia determina qué métodos puedes invocar.

Tú eres Java. Te dan este código:

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

* ¿Cuántos objetos hay en memoria al final de `main`?
* ¿Cuánto imprime el `System.out.println`?
* ¿Qué pasa si a c1 le cambias `ancho = 10`? ¿c2 se ve afectado?

> **Solución:** 2 objetos, 24, NO (cada objeto tiene su propia copia). Las variables de instancia son independientes para cada objeto.

### ⭐ BE THE CODE, MY FRIEND: ¿Qué Constructor Se Llama?

> 🕶️ **Don Tip:** Comprueba el número y tipo de argumentos. Java elige el constructor que mejor coincide.

Sin ejecutar, ¿qué imprime este código?

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

> **Solución:** Se llama a `Pedido()` que hace `this("Sin producto", 0)`, lo que primero ejecuta `Pedido(String, int)` (imprime "Constructor con parámetros"), luego vuelve y termina `Pedido()` (imprime "Constructor vacío"). Después imprime "Sin producto x0". El `this(...)` siempre va primero.

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** Vale, ¿y por qué no puedo hacer simplemente `int galleta1 = 42;` en vez de todo este rollo de clases?
>
> **A:** Porque un `int` solo guarda un número. Una clase guarda NÚMEROS + TEXTO + MÉTODOS + todo lo que quieras. Es como comparar un posavasos con un dron. El dron puede hacer mil cosas, el posavasos... posa vasos.

> **Q:** ¿Cuántos objetos puedo crear? ¿Hay límite?
>
> **A:** Hasta que te quedes sin memoria (y entonces Java lanza `OutOfMemoryError` y tu programa muere). Pero vamos, con 8 GB de RAM puedes crear millones de objetos pequeños. No te preocupes.

> **Q:** `this` es una palabra reservada, ¿no? ¿Puedo usarla fuera de una clase?
>
> **A:** No. `this` fuera de una clase es como pedir una pizza en una ferretería. No tiene sentido. Solo existe dentro del contexto de un objeto.

> **Q:** ¿Por qué hace falta escribir `new`? ¿No podría Java crear el objeto solito?
>
> **A:** No, porque `new` es el "permiso de construcción". Sin `new`, solo declaras una variable (como `Coche c;`), pero no hay coche en el garaje, solo una plaza de parking vacía. Hasta que no hagas `new`, el objeto no existe.

### Métodos toString() y equals(): La Carta de Presentación

`toString()` es cómo tu objeto se presenta en público. Por defecto Java imprime algo como `Persona@3e3abc` (la clase y una dirección de memoria). No muy útil.

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

`equals()` es para preguntar: "¿este objeto ES IGUAL a este otro?" (por su contenido, no porque sean el mismo sitio en memoria).

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

> **💡 Consejo:** Sobrescribe `toString()` siempre. Tu yo del futuro (y tu profesor) te lo agradecerá. `equals()` y `hashCode()` van juntos como el jamón y el queso. Si sobreescribes uno, sobreescribe el otro.

### Ejemplo Completo: Coche (Con Acelerador de Verdad)

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

### Buenas Prácticas (O Cómo No Meter la Pata)

* Atributos **privados siempre** (ya veremos por qué en el siguiente tema. Spoiler: no queréis que nadie toque vuestras partes privadas).
* `this` cuando haya ambigüedad. Si no la hay, puedes omitirlo (pero ponerlo no duele).
* `toString()` siempre. Es tu amigo.
* `equals()` y `hashCode()` si comparas objetos por valor.
* Inicializa todo en el constructor. No dejes atributos bailando.

### 🥊 EL RING: Clase vs Objeto

Dos conceptos discuten acaloradamente. ¿Quién tiene razón?

**Clase:** «Yo soy el molde, el plano, la idea platónica. Sin mí no existirías. Yo defino qué atributos y métodos tienen los objetos. ¡Soy la creadora!»

**Objeto:** «Sí, pero yo soy quien realmente hace cosas. Tú eres solo un archivo `.java` en el disco. Yo ocupo memoria, tengo estado, puedo cambiar mis atributos. Sin mí tu código no sirve para nada.»

**Clase:** «¿Ah sí? ¿Y cuántos de ti existen? Puedes tener miles de objetos creados a partir de mí. Yo soy única, tú eres una copia. ¡Soy original, eres reproducible!»

**Objeto:** «Exacto. Porque tú eres el plano, pero yo soy el edificio construido. Nadie vive en un plano. Cuando ejecutas el programa, el que trabaja soy yo.»

**Clase:** «Vale, nos necesitamos. Sin clase no hay objeto. Sin objeto, la clase es solo teoría.»

**Objeto:** «Trato hecho.»

> 🕶️ **Don Tip:** La clase define el QUÉ (atributos) y el CÓMO (métodos). El objeto es el QUIÉN (la instancia concreta que ejecuta y tiene valores propios).

---

## Resumen

- Clase = molde / cortapastas. Objeto = galleta / resultado.
- `new` crea objetos. Llama al constructor.
- `Scanner` lee del teclado como un intérprete amigable.
- Paquetes = barrios. `import` = pedir permiso para entrar.
- `String` es especial: se puede crear con comillas sin `new`.
- `this` desambigua y permite llamar a otros constructores.
- Sobrecarga: varios constructores con distintos parámetros.
- `toString()` y `equals()` se sobrescriben siempre.

---

## Ejercicios Propuestos

### Introducción a POO

1. **Saludo personalizado** Usa Scanner para preguntar nombre, edad y ciudad. Muestra: "Hola, soy [nombre], tengo [edad] años y vivo en [ciudad]."

2. **La frase mutante** Pide una frase al usuario y muestra: número de caracteres, en mayúsculas, en minúsculas, primera palabra (antes del espacio), y reemplaza todas las vocales por 'e'.

3. **Suma de strings** Pide dos números como texto (String). Conviértelos a enteros con `Integer.parseInt()` y muestra su suma. Si no son números válidos, ¿qué error sale?

4. **Dados virtuales** Genera 5 números aleatorios entre 1 y 100. Muestra el mayor y el menor (puedes usar `Math.max()` y `Math.min()` o hacerlo a mano).

5. **¿Letra, número o símbolo?** Pide un carácter al usuario. Usa métodos de `Character` (`isDigit()`, `isLetter()`...) para decirle qué es.

6. **Clase Perro** Crea una clase `Perro` con atributos `nombre` (String) y `edad` (int). Un método `ladrar()` que imprima "Guau, soy [nombre]". Crea dos perros distintos y haz que cada uno ladre.

7. **Calculadora IMC** Pide peso (kg) y altura (m). Calcula el IMC = peso / (altura * altura). Muestra el resultado con 2 decimales. Usa `Math.round()` o imprime con formato.

8. **Contador de objetos** Crea una clase `Contador` con un atributo `static int totalObjetos`. En el constructor, incrementa `totalObjetos`. En el `main`, crea 5 objetos `Contador` y al final imprime `Contador.totalObjetos`. ¿Sale 5?

### Clases y Objetos

1. **Clase Rectángulo**: Crea `Rectangulo` con `ancho` y `alto` (double). Constructor parametrizado, getters/setters, `calcularArea()` y `calcularPerimetro()`. Sobrescribe `toString()`.

2. **Clase CuentaBancaria**: `CuentaBancaria` con `titular`, `saldo` y `numeroCuenta`. Dos constructores: solo titular (saldo 0) o titular + saldo. Métodos `ingresar(double)` y `retirar(double)` (valida saldo suficiente). `toString()`.

3. **Clase Hora**: `Hora` con `hora` (0-23), `minuto` (0-59), `segundo` (0-59). Constructor con validación. `incrementarSegundo()` que maneje desbordamientos.

4. **Sobrecarga de constructores**: Clase `Email` con `destinatario`, `asunto`, `cuerpo`. Tres constructores: todo, solo destinatario+asunto (cuerpo vacío), solo destinatario (asunto y cuerpo por defecto).

5. **equals() en Persona**: Añade `fechaNacimiento` (LocalDate) a Persona. Sobrescribe `equals()` usando nombre + fechaNacimiento.

6. **Clase Punto**: `Punto` con `x` e `y` (int). Constructor, getters, `distancia(Punto otro)` (distancia euclídea), `toString()`. Calcula perímetro de un triángulo dados 3 puntos.

7. **Clase Fracción**: `Fraccion` con `numerador` y `denominador` (int). Métodos: `sumar`, `restar`, `multiplicar`, `dividir`, `simplificar()`. `toString()` como "numerador/denominador".

8. **Clase Juego**: `Juego` con `nombre`, `genero`, `precio`, `edadMinima`. Método `esAptoPara(int edad)`. Crea varios juegos y muestra cuáles son aptos para alguien de 12 años.

---

**RAs trabajados en esta unidad:**
- **RA2** - Programas sencillos
- **RA4** - Clases

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
