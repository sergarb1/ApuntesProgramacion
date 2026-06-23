---
title: "🛡️ Unidad 5: Visibilidad, Encapsulación y Static"
nav_order: 5
---
🎯 **Objetivos de aprendizaje**
- Aplicar los 4 niveles de visibilidad
- Encapsular atributos con getters y setters
- Validar datos en setters
- Entender el patrón JavaBeans
- Usar miembros estáticos (variables, métodos, constantes)
- Crear clases utilitarias con constructor privado

## Visibilidad: El Arte de No Enseñar Todo

### El Gran Problema (O Cómo la Gente Toca Tus Cosas)

Imagina que vives en una casa de cristal. Cualquiera puede verlo todo: tu ropa interior, tus colección de cromos de Pokémon, esa caja de galletas vacía que guardas por si acaso. Incómodo, ¿verdad?

Pues lo mismo pasa con tus objetos. Si todo es público, cualquiera desde cualquier sitio puede hacer:

```java
Persona p = new Persona();
p.edad = -666; // ¡Edad negativa! Esto no tiene sentido.
p.saldo = 999999; // Multiplicate por 0 el dinero.
```

Y tu objeto queda hecho unos zorros. Necesitamos **control de acceso**. Necesitamos... **VISIBILIDAD**.

### Los 4 Niveles de Visibilidad: De la Valla a la Caja Fuerte

| Modificador | Se ve desde | Es como... |
|---|---|---|
| `public` | Todes, absolutamente todes | Una valla publicitaria en Times Square |
| `protected` | Mismo paquete + subclases (hijos) | Los secretos de familia: lo saben tus primos y tus hijos |
| *package-private* (default) | Mismo paquete (vecindario) | El cotilleo del barrio |
| `private` | Solo la clase | Tu diario secreto con candado |

> "El `private` es como tu cajón de los calcetines desaparejados: existe, pero no hace falta que nadie más lo vea."

### public: La Valla Publicitaria

Todo el mundo lo ve. Desde cualquier clase, cualquier paquete. Es como poner tu número de teléfono en una pancarta.

```java
public class VallaPublicitaria {
    public String mensaje; // "CÓMPRAME, SOY UNA CLASE"

    public void mostrar() {
        System.out.println(mensaje);
    }
}
```

Úsalo para lo que QUIERAS que otros usen. No para tus atributos (a menos que te guste el caos).

### private: El Diario con Candado

Solo la clase ve sus propios `private`. Ni su madre, ni su mejor amigo, ni el perro.

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

> **⚠️ Advertencia:** Nunca, NUNCA, hagas un atributo `public`. Es como dejar la puerta de tu casa abierta con un cartel: "Pasen y toquen todo".

### protected: Los Secretos de Familia

Es como las historias vergonzosas de la familia. Tus primos (mismo paquete) y tus hijos (subclases) pueden acceder. Pero un desconocido de otro paquete... no.

### package-private (default): El Cotilleo del Barrio

Si NO pones ningún modificador, Java asume "package-private". Lo ven las clases del mismo paquete. Como el grupo de WhatsApp del vecindario.

### Tabla Comparativa: ¿Quién Ve Qué?

```java
package barrio;

public class Casa {
    public String direccion;     // Lo sabe todo el mundo
    protected String telefono;   // Lo sabe la familia
    int numeroHabitaciones;      // Lo saben los vecinos (package-private)
    private String contrasenaWifi; // SOLO YO
}
```

Desde el mismo paquete (`barrio`):

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

Desde otro paquete, siendo subclase:

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

### ⭐ BE THE CODE, MY FRIEND: El Banco

> 🕶️ **Don Tip:** Los getters exponen datos, los setters los validan. Si un setter permite saldos negativos, el banco quiebra.

Eres una clase `Banco`. Tienes estos miembros:

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

Pregunta: ¿Puede una clase `Sucursal` en otro paquete ver `listaClientes`? ¿Y `direccionSucursal`?
¿Puede `main()` de una clase en el mismo paquete ver `saldoCaja`?

> **Solución:** no (package-private, otro paquete no lo ve), sí si es subclase (protected), no (private). La propia clase siempre puede ver todo (por eso el método `mostrarInfo()` funciona).

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** ¿Y si no pongo nada? ¿Package-private es lo mismo que "default"?
>
> **A:** Sí, se llaman "default" o "package-private". Es el nivel que Java asume cuando no escribes `public`, `private` o `protected`. No es que exista una palabra clave `default` para visibilidad (esa palabra es para otra cosa).

> **Q:** ¿Por qué debería hacer `private` un atributo y luego crear getters y setters públicos? ¡Es más trabajo!
>
> **A:** Porque así CONTROLAS lo que entra y sale. Puedes validar: "Edad no puede ser negativa". Puedes cambiar la implementación interna sin que nadie se entere. Es como tener un portero en tu discoteca: dejas entrar a quien quieres y echas a los que van borrachos.

> **Q:** Mi profesor dijo que `protected` es "para que las subclases lo vean". ¿Qué más da?
>
> **A:** Mucho. Piensa en una clase `Vehiculo` con `protected int velocidadMaxima`. La subclase `Coche` puede usarlo. Pero una clase `Taller` del mismo paquete también puede. Si quieres que SOLO las subclases lo vean y NO los vecinos de paquete... malas noticias: `protected` no discrimina entre "subclase de otro paquete" y "mismo paquete". A las dos les deja.

> **Q:** ¿Y los métodos? ¿También tienen visibilidad?
>
> **A:** ¡Claro! Todo tiene visibilidad. Puedes tener un método `private` que solo se usa internamente, como `private void calcularImpuesto()`. Nadie fuera de la clase necesita saber cómo calculas los impuestos (ni tú mismo quieres saberlo).

> **Q:** Si hago todo `public` total es más rápido de escribir, ¿no?
>
> **A:** Es más rápido de escribir y más lento de depurar. Cuando alguien (o tú) meta un valor imposible en un atributo público, te pasarás horas buscando quién lo cambió. Con encapsulación, el error se detecta al instante en el setter.

## Encapsulación: El Pilar que Sostiene la POO

Encapsulación = **privacidad + control**. Es la idea de que:

1. Tus atributos son `private`.
2. Controlas el acceso con getters y setters `public`.
3. Dentro de los setters, VALIDAS.

Ejemplo de vida (o muerte):

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

> **⚠️ Advertencia:** Si haces los atributos `public`, estás renunciando a la encapsulación. Es como llevar la cartera abierta en el metro. Tarde o temprano alguien meterá mano.

### Ventajas de la Encapsulación (O Por Qué No Dormirás Peor)

* **Control**: Validas y filtras. Nada de edades negativas.
* **Mantenibilidad**: Cambias internamente y el código cliente ni se entera.
* **Seguridad**: Nadie deja tu objeto en un estado inconsistente.
* **Bajo acoplamiento**: Cada clase va a lo suyo. No se meten unas en los asuntos de otras.

### La Convención JavaBeans: El Protocolo

JavaBeans es una convención (no obligatoria, pero sí sensata) que dice:

1. Clase pública.
2. Constructor sin argumentos.
3. Atributos privados.
4. Getters y setters públicos.
5. Implementa `Serializable` (opcional).

Convención de nombres:

| Tipo | Getter | Setter |
|---|---|---|
| `String nombre` | `getNombre()` | `setNombre(String n)` |
| `boolean activo` | `isActivo()` | `setActivo(boolean a)` |
| `int cantidad` | `getCantidad()` | `setCantidad(int c)` |

### Buenas Prácticas (El Decálogo del Programador Paranoico)

* `private` para atributos. Siempre. Por defecto. Sin discusión.
* Getter solo si hace falta (atributos inmutables no necesitan setter).
* Valida en los setters. No confíes en nadie.
* `protected` para métodos que las subclases necesiten. No abuses.
* Empieza con el acceso más restrictivo y ábrelo solo si es necesario.

---

## Static: Lo Que Pertenece a la Clase (No al Objeto)

### La Gran Diferencia: El Grupo de WhatsApp vs Los Mensajes Privados

Imagina que eres parte de una clase de 30 alumnos. Tienes:

* **El grupo de WhatsApp de la clase** (static): todos ven el mismo mensaje. Si alguien escribe "mañana hay examen", los 30 lo ven. Es compartido.
* **Tus mensajes privados** (instancia): solo tú los ves. Cada alumno tiene los suyos. No se mezclan.

Pues en Java es igual:

* **Variables de clase** (`static`): una sola copia para todos los objetos. Todos comparten el mismo valor.
* **Variables de instancia** (sin `static`): cada objeto tiene su propia copia. Cada una independiente.

> "Static es el grupo de WhatsApp de la clase. Instancia son los DMs que nadie más ve."

Los métodos **estáticos** (con `static`) pertenecen a la *clase*, no a los objetos:

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

La diferencia práctica: los métodos de instancia (sin `static`) necesitan un objeto:

```java
String texto = "Hola";
int longitud = texto.length();  // length() NO es static. Necesito el objeto texto.
```

> **📝 Nota:** `Math.random()`, `Math.sqrt()`, `Integer.parseInt()`... todos son estáticos. No necesitas crear un `Math m = new Math();`. Sería como comprar un nevera para tener un imán. Usa `Math.random()` directamente.

### Atributos Estáticos: El Cartel del Colegio

Un atributo `static` es como el cartel de "Quedan 10 minutos para el recreo" en el pasillo. Está ahí, lo ve todo el mundo, y solo hay uno.

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

En memoria se ve así:

```
  CLASE: Estudiante
  ┌──────────────────────┐
  │ totalEstudiantes = 3 │  ← static: UNO para toda la clase
  └──────────────────────┘

  OBJETO e1        OBJETO e2        OBJETO e3
  ┌─────────┐      ┌─────────┐      ┌─────────┐
  │ nombre  │      │ nombre  │      │ nombre  │
  │ id = 1  │      │ id = 2  │      │ id = 3  │
  └─────────┘      └─────────┘      └─────────┘
```

Cada objeto tiene su `nombre` e `id` (su DNI), pero todos comparten `totalEstudiantes`.

> **💡 Consejo:** Usa `NombreClase.miembroEstatico` para acceder. `Estudiante.getTotalEstudiantes()`. No uses `objeto.getTotalEstudiantes()`, aunque funcione, es confuso.

### Métodos Estáticos: El Teléfono de la Clase

Los métodos `static` se llaman usando la clase, no un objeto. Es como el número de teléfono de atención al cliente de una empresa: NO necesitas hablar con un empleado concreto, llamas al número general.

Características de los métodos estáticos:

* **NO pueden acceder a atributos de instancia** (no saben de qué objeto hablan).
* **NO tienen `this`** (no hay "yo" porque no hay objeto).
* Solo pueden llamar a otros métodos estáticos (directamente).

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

### El Ejemplo Definitivo: La Clase Math

`java.lang.Math` es la clase utilitaria por excelencia. TODOS sus métodos son estáticos. No puedes (ni quieres) hacer `new Math()`.

```java
double max = Math.max(10, 20);              // 20
double min = Math.min(10, 20);              // 10
double raiz = Math.sqrt(25);                // 5.0
double potencia = Math.pow(2, 10);          // 1024.0
double absoluto = Math.abs(-7);             // 7
double random = Math.random();              // Aleatorio [0.0, 1.0)
double pi = Math.PI;                        // 3.141592653589793
```

> **📝 Nota:** `Math` tiene el constructor **privado**. Nadie puede instanciarla. Es como una estatua: para admirarla, no para hacerle clones.

### Clases Utilitarias: El "No Necesito Pareja" de Java

Una clase utilitaria es una clase que SOLO tiene miembros estáticos. Son como el amigo que está soltero y feliz: no necesita instanciarse para ser útil.

Para evitar que alguien intente crear un objeto, le ponemos el constructor `private`:

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

### Constantes: Lo que Nunca Cambia (Como el Amor de tu Madre)

`static final` es "una constante de clase". Por convención en MAYÚSCULAS.

```java
public class Config {
    public static final String NOMBRE_APP = "Gestión DAM";
    public static final String VERSION = "2.1.0";
    public static final int MAX_USUARIOS = 100;
    public static final double IVA = 0.21;
}
```

Úsalas así: `Config.IVA`, `Config.MAX_USUARIOS`. Nunca cambian. Son más firmes que tus propósitos de Año Nuevo.

### ⭐ BE THE CODE, MY FRIEND: Los Gatos Estáticos

> 🕶️ **Don Tip:** Lo `static` pertenece a la clase, no al objeto. Todos los objetos comparten el mismo valor.

Mira este código y responde SIN EJECUTAR:

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

* ¿Funciona `System.out.println(nombre);` dentro del método `decirTotal()`?
* Si creas 3 gatos y luego haces `Gato.decirTotal()`, ¿qué imprime?
* ¿Y si creas 5 gatos más? ¿Qué imprime ahora?

> **Solución:** NO funciona (es una variable de instancia), imprime 3, imprime 8. El método `decirTotal()` no sabe qué "nombre" pedirle al objeto.

### ⭐ BE THE CODE, MY FRIEND: Static vs Instancia

> 🕶️ **Don Tip:** Un método `static` no puede acceder a variables de instancia porque no tiene `this`. Piensa: ¿pertenece al objeto o a la clase?

¿Qué imprime este código?

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

> **Solución:** `a.x` = 3 (se incrementó 2 veces en a y 1 en b, no, a.x se incrementó 2 veces -> a.incrementarX(), a.incrementarX()), `b.x` = 2 (b.incrementarX() una vez), `y` = 3 (se incrementó 3 veces: dos desde clase, una desde objeto b). Cada objeto tiene su propio `x`, pero `y` es compartido.

### ❓ ¡No Hay Preguntas Tontas!

> **Q:** ¿Puedo llamar a un método estático desde un objeto? ¿Como `miObjeto.metodoEstatico()`?
>
> **A:** Técnicamente SÍ. Java te lo deja. Pero es como llamar a tu madre por el apellido. Funciona, pero queda raro. La convención es usar la clase: `Clase.metodoEstatico()`. Algunos IDEs te marcan una warning.

> **Q:** Entonces `main` es estático porque...
>
> **A:** Porque cuando empieza el programa, NO hay ningún objeto todavía. Alguien tiene que arrancar la fiesta. `main` es el primero en llegar. Tiene que ser estático para poder ejecutarse sin que nadie haya creado un objeto antes.

> **Q:** ¿Los métodos estáticos son más rápidos?
>
> **A:** Ligeramente. No necesitas la referencia al objeto. Pero la diferencia es tan pequeña que en el 99.9% de los casos no lo notarás. No te obsesiones con la velocidad de los estáticos. Preocúpate de que tu código tenga sentido.

> **Q:** ¿Puedo tener un atributo estático que sea un objeto de su propia clase?
>
> **A:** ¡Sí! Es el patrón **Singleton**. Tienes un `private static MiClase instancia = new MiClase();` y un método `getInstance()`. Es como tener una única piedra filosofal. Pero eso es otro tema...

> **Q:** ¿Puedo ponerle `static` a todo y ahorrarme crear objetos?
>
> **A:** Puedes, pero entonces no estás haciendo POO, estás haciendo "Programación Estática a lo bruto". Java te deja, pero es como usar un destornillador para clavar un clavo: puedes, pero para eso existe el martillo. Usa `static` para lo que es de la clase, no para todo.

### Diferencia Rápida (Para que no te líes)

| Variable de instancia | Variable estática |
|---|---|
| Pertenece al objeto | Pertenece a la clase |
| Necesitas `new` | Usas `NombreClase.variable` |
| Cada objeto tiene la suya | Una copia para todos |
| `this` disponible | No hay `this` |
| Lee/escribe en el objeto | Lee/escribe en la clase |

### Buenas Prácticas

* Usa `static` para métodos que NO dependan del estado del objeto (como `Math.sqrt()`).
* Usa `static` para constantes (`static final`).
* Usa `static` para contadores compartidos.
* NO abuses de `static`. No conviertas todo en estático "porque es más fácil". Perderás los beneficios de la POO.
* Constructor privado en clases utilitarias (para que nadie las instancie).


### 🧩 EL LÍO

El siguiente código debería encapsular correctamente una clase CuentaBancaria, pero tiene varios errores de visibilidad y lógica. Encuéntralos:

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

Preguntas:
1. ¿El atributo `saldo` está bien encapsulado?
2. ¿Qué error hay en el constructor con `titular = titular`?
3. ¿Por qué `setSaldo` es `private`? ¿Cómo retira dinero el usuario entonces?

> 🕶️ **Don Tip:** `this` resuelve ambigüedades. Si parámetro y atributo se llaman igual, sin `this` te asignas el parámetro a sí mismo.

---

## Resumen
- Visibilidad: `public` > `protected` > package-private > `private`.
- Encapsulación: atributos `private`, getters/setters `public` con validación.
- JavaBeans: clase pública, constructor sin args, atributos privados, getters/setters.
- `static` = del grupo (clase). Sin `static` = de cada uno (objeto).
- Métodos estáticos no acceden a atributos de instancia ni tienen `this`.
- `static final` = constante de clase.
- Clases utilitarias tienen constructor privado y solo miembros estáticos.

---

## Ejercicios Propuestos

### Visibilidad

1. **Clase Empleado con validación**: `Empleado` con `nombre`, `salarioBase` (double) y `departamento` privados. El salario no puede ser negativo. El setter debe lanzar `IllegalArgumentException` si es inválido. Método `calcularSalarioAnual()`.

2. **Clase Círculo encapsulado**: `Circulo` con `radio` privado. Setter valida que el radio sea positivo. `getArea()` y `getPerimetro()`. Intenta acceder a `radio` desde otra clase. ¿Qué pasa?

3. **JavaBean Alumno**: `Alumno` con `nombre`, `edad`, `curso`, `notaMedia` (double) y `matriculado` (boolean). Constructor sin args: nombre vacío, matriculado false. Nota media entre 0 y 10.

4. **Clase Inmutable Hora**: `Hora` sin setters. Solo constructor con validación. Getters y `toHoraString()`. Nadie puede cambiar la hora después de crearla.

5. **Protected y herencia**: Crea `Animal` en paquete `zoologico` con `protected String nombre`. Crea `Perro` en otro paquete. ¿Quién ve `nombre`?

6. **Cuenta Bancaria encapsulada**: `CuentaBancaria` con `saldo` privado. Solo `ingresar(double)` y `retirar(double)` modifican el saldo. Validaciones.

7. **Getter sin Setter**: Clase `Configuracion` con `static final String VERSION = "1.0"` (público). Atributos privados `maxIntentos` y `timeout`. Getter para ambos, setter solo para `maxIntentos`. ¿Por qué?

8. **Refactorización**: Te dan `Coche` con atributos públicos `marca`, `modelo`, `anio`. Refactoriza: hazlos privados, añade getters/setters validando que el año esté entre 1886 y año actual + 1.

### Static

1. **Contador de objetos**: Clase `Usuario` con contador estático de objetos creados, `id` autoincremental, `static final String DOMINIO_EMAIL = "@dam.com"` y método `generarEmail()` que devuelva `nombre + DOMINIO_EMAIL`.

2. **Clase utilitaria OperacionesArray**: Clase `OperacionesArray` con constructor privado y métodos: `sumar(int[])`, `media(double[])`, `maximo(int[])`, `minimo(int[])`, `estaOrdenado(int[])`, `buscar(int[], int)`. Usa sin instanciar.

3. **Conversor de unidades**: Clase `Conversor` con constantes `KM_A_MILLAS = 0.621371`, `LIBRA_A_KG = 0.453592`, etc. Métodos: `kmAMillas`, `millasAKm`, `celsiusAFahrenheit`, `fahrenheitACelsius`, `librasAKg`, `kgALibras`.

4. **Simulación de aleatorios**: Clase `Aleatorio` con métodos: `entero(int min, int max)`, `decimal(double min, double max)`, `booleano()`, `colorHex()`, `elemento(String[])`.

5. **Clase Config con constantes**: Clase `Config` con `MAX_INTENTOS_LOGIN = 3`, `TIMEOUT_SEGUNDOS = 300`, `RUTA_LOG = "./logs/app.log"`. Atributo privado `contadorAccesos` con `incrementarAcceso()` y `getAccesos()`.

6. **Validador de datos**: Clase utilitaria `Validador` con: `esEmailValido(String)`, `esTelefonoValido(String)` (9 dígitos), `esDNIValido(String)` (8 dígitos + letra), `esFechaValida(int, int, int)`.

7. **Estadísticas de notas**: Programa que dadas notas `double[]` calcule con métodos estáticos: media, máxima, mínima, número de aprobados (>= 5) y desviación típica. Clase `Estadisticas`.

8. **Juego de dados**: Simula lanzar dos dados 1000 veces con `Math.random()`. Clase `Dado` con método `lanzar()` (1-6). Cuenta cuántas veces sale cada suma (2-12). Clase `Simulacion` con estructura estática.

---

**RAs trabajados en esta unidad:**
- **RA4** - Clases (visibilidad, encapsulación)
- **RA7** - Estaticidad

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
