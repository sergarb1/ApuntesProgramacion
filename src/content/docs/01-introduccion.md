---
title: "☕ Unidad 1: Introducción a Java"
nav_order: 1
---
🎯 **Objetivos de aprendizaje**
- Instalar y configurar el JDK
- Escribir y compilar el primer programa Java
- Utilizar el depurador del IDE
- Diferenciar JDK, JRE y JVM
- Escribir comentarios y documentación básica

## El Ordenador Te Obedece: Entornos de Desarrollo

¿Sabías que tu ordenador es básicamente un cachorro muy listo pero con cero iniciativa? No hace nada hasta que le das órdenes precisas. Y para eso necesitamos un **entorno de desarrollo**.

## ¿Qué es eso del JDK, JRE y JVM? (La Trilogía del Café)

Java funciona como una cafetería de especialidad:

- **JVM (Java Virtual Machine)**: Es la máquina de café. Tiene su propia receta (bytecode) y funciona igual en cualquier sitio. Viaja con tu programa a todas partes.
- **JRE (Java Runtime Environment)**: Es la cafetería entera. Tiene la máquina, los vasos, el azúcar... todo lo necesario para *ejecutar* café ya hecho.
- **JDK (Java Development Kit)**: Es el kit completo para montar tu propia cafetería. Tiene la máquina, los granos de café verde, el molinillo, el manual de barista... TODO para *crear* programas.

```java
// Imagina que esto es un grano de café verde:
public class Cafe {
    public static void main(String[] args) {
        System.out.println("☕ ¡Café listo!");
    }
}
```

El JDK compila esto a bytecode (café molido), el JRE lo pasa por la JVM y... ¡tachán! café en tu pantalla.

> **📝 Nota:**
>
> **Dato freak:** La creación de Java en Sun Microsystems (1995) se inspiró en la máquina de café de la oficina. Por eso el logo es una taza humeante. No me lo invento.

> **⚠️ Advertencia:**
>
> No confundas JDK con JRE. El JDK es el *cuchillo del chef*, el JRE es el *plato servido*. Si solo quieres ejecutar programas, te basta el JRE. Si quieres *crearlos*, necesitas el JDK.

## Montando el Chiringuito: Instalación

Vas a instalar el JDK. No te asustes, es más fácil que montar un mueble de Ikea y no te sobrarán tornillos.

```
> java -version
openjdk version "21" 2026-01-01
> javac -version
javac 21
```

Si ves algo parecido, ¡enhorabuena! Tienes poderes de compilación.

> **💡 Consejo:**
>
> Si usas [Eclipse Temurin](https://adoptium.net/) te ahorrarás dolores de cabeza. Es como el JDK oficial pero sin humos raros.

## Tu Primer Programa: Hola Mundo (o cómo hablarle a la máquina)

Programar es como hablarle a un extraterrestre muy literal. Si le dices "saluda", no lo hace. Tienes que decirle *cómo* saludar, *cuándo* y *por qué*.

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola, Mundo! Llevo años esperando a que me crearas.");
    }
}
```

Vamos a diseccionar esto como si fuera una rana en biología:

- `public class HolaMundo`: Declaras una clase. Piensa en ello como "Oye, Java, voy a crear una cosa que se llama HolaMundo".
- `public static void main(String[] args)`: Este es el "botón de inicio". Cuando ejecutas el programa, Java busca esta línea y dice "¡por aquí se empieza!".
- `System.out.println(...)`: Es la voz del programa. Le dices que grite algo por la consola.

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** Sigue el código línea a línea como si fueras la JVM. Cada instrucción se ejecuta en orden.
>
> **Ejercicio 1: Tú eres el Compilador**
>
> Vas a ser Java por un momento. Coge papel y boli (o mentalmente). Te dan este código:
>
> ```java
> public class Computadora {
>     public static void main(String[] args) {
>         int x = 5;
>         int y = 10;
>         int z = x + y;
>         System.out.println("El resultado es: " + z);
>     }
> }
> ```
>
> **Pregunta:** Sin ejecutarlo, ¿qué imprime? Sigue los pasos como si fueras la JVM:
> 1. Encuentras la clase `Computadora`.
> 2. Buscas el método `main` - ahí está.
> 3. Creas un espacio llamado `x` y metes un 5.
> 4. Creas `y` y metes un 10.
> 5. Creas `z`, sumas x e y (15), lo guardas.
> 6. Gritas por pantalla "El resultado es: 15".
>
> Si tu respuesta fue distinta, vuelve a empezar. El ordenador es tonto pero preciso: no interpreta, *ejecuta*. Cada línea, en orden, sin saltarse ninguna.

> **⭐ BE THE CODE, MY FRIEND**
>
> **Ejercicio 2: El Método que no Encuentra**
>
> Observa este código. ¿Se ejecutará correctamente? ¿Por qué?
>
> ```java
> public class Saludos {
>     public static void main(String[] args) {
>         System.out.println("¡Hola desde el método main!");
>     }
>
>     public static void saludo() {
>         System.out.println("Esto nunca se ejecuta...");
>     }
> }
> ```
>
> **Respuesta:** Sí se ejecuta, pero solo imprime la primera línea. El método `saludo()` existe pero como nunca lo llamas desde `main`, se queda ahí haciendo el vago. Java solo ejecuta lo que está dentro del `main` (a no ser que explícitamente llames a otros métodos). El método `saludo()` es como un actor que tiene el guion aprendido pero nunca sale al escenario.

> **⭐ BE THE CODE, MY FRIEND**
>
> **Ejercicio 3: El Error del Novato**
>
> ¿Qué está mal aquí? Señala todos los errores que encuentres:
>
> ```java
> Public class Calculadora
>     public static void main(string[] args) {
>         System.out.println("Suma: " + 5 + 3)
>         SYSTEM.OUT.PRINTLN("Resta: " + (5 - 3));
>     }
> }
> ```
>
> **Respuesta:** ¡Hay 4 errores! (1) `Public` debería ser `public` (minúscula). (2) Falta `{` después de `Calculadora`. (3) `string[] args` debería ser `String[] args` (la S mayúscula importa). (4) Falta `;` al final de la primera línea del `println`. Java es muy puntilloso, como un profesor de lengua con las comas.

## El Depurador: Eres un Detective

Un programa raro. La variable `edad` sale 25 cuando debería salir 18. ¿Qué haces? ¿Le pegas al ordenador? No. Usas el **depurador**.

El depurador es como tener visión de rayos X para tu código:

- **Breakpoint (punto de ruptura)**: Le dices a Java "para AQUÍ, quiero ver qué está pasando".
- **Step Over (F8)**: "Ejecuta esta línea pero no me cuentes los detalles".
- **Step Into (F7)**: "Ejecuta esta línea Y llévame dentro de esa función, quiero espiar".
- **Watch (inspección)**: "Enséñame el valor de la variable `edad` AHORA MISMO".

```java
public class DetectivesDeCodigo {
    public static void main(String[] args) {
        int sospechoso = 0;
        for (int i = 0; i < 10; i++) {
            sospechoso += i;  // Pon un breakpoint aquí
        }
        System.out.println("El culpable es: " + sospechoso);
    }
}
```

Pon un breakpoint en la línea del `sospechoso += i`, ejecuta en modo depuración, y mira cómo `sospechoso` cambia en cada vuelta. ¡Es como ver una serie de crímenes en cámara lenta!

## ¡No Hay Preguntas Tontas!

> **❓ ¡No Hay Preguntas Tontas!**
>
> **Q:** ¿Por qué `public static void main(String[] args)`? Parece un conjuro de Harry Potter.
>
> **A:** Porque sí. Vale, no es buena respuesta. `public` es para que Java pueda encontrar el método desde fuera. `static` es para que pueda llamarlo sin necesidad de crear un objeto (llegaremos a eso). `void` significa que no devuelve nada. `main` es el nombre que Java busca al arrancar. `String[] args` es un bolsillo donde puedes meter argumentos al ejecutar el programa. Y sí, parece un conjuro de Harry Potter.
>
> **Q:** ¿Puedo llamar a mi clase `Holamundo` con minúscula?
>
> **A:** Puedes, pero Java te mirará mal. Las clases empiezan con mayúscula por convención. No es obligatorio, pero si no lo haces, otros programadores pensarán que eres un psicópata.
>
> **Q:** Si me equivoco en un punto y coma, ¿el ordenador explota?
>
> **A:** No, pero el compilador te lanzará un error críptico y tú pasarás 20 minutos buscando un `;` perdido. Bienvenido a la programación.
>
> **Q:** ¿Puedo tener dos clases con el mismo nombre en el mismo archivo?
>
> **A:** No, y Java se pondrá muy borde. Cada archivo `.java` puede tener solo una clase `public`, y esa clase debe llamarse exactamente igual que el archivo. Si tu archivo se llama `HolaMundo.java`, no puedes tener dentro una clase `public class AdiosMundo`. Puedes tener clases no públicas, pero cada una en su propio archivo es más limpio.
>
> **Q:** ¿Java y JavaScript son primos?
>
> **A:** No, ni siquiera son del mismo planeta. Java es a JavaScript como un perro es a un perrito caliente. El nombre fue una estrategia de marketing de Netscape para montarse en el boom de Java.

## Los Comentarios: Notas Pegajosas Digitales

Los comentarios son mensajes que te dejas a ti mismo (o a otros). El ordenador los ignora completamente.

```java
// Comentario de una línea: "Aquí va la magia"

/*
   Comentario de varias líneas:
   "Si esto funciona, no lo toques.
    Si no funciona, no lo toques tampoco.
    Ya llamaremos a alguien."
*/

/**
 * Comentario Javadoc (el elegante):
 * Sirve para generar documentación automática.
 * @param argumentos la lista de argumentos de la línea de comandos
 * @return nada, esto es void, ¿no te enteras?
 */
```

> **💡 Consejo:**
>
> Comenta el *por qué*, no el *qué*. `int i = 0; // Declaro i con valor 0` es como poner "Abro la puerta" en una puerta. El código ya dice eso. En cambio `int i = 0; // Empezamos desde 0 porque el usuario no ha pulsado nada` eso sí es útil.

## Más Ejemplos de Código

```java
public class MiPrimerPrograma {
    public static void main(String[] args) {
        // Esto es mi primer programa
        System.out.println("¡Holaaaa, mundo!");
        System.out.println("Estoy aprendiendo Java");
        System.out.println("Y me está gustando (de momento)");
    }
}
```

```java
public class UsoDeArgumentos {
    public static void main(String[] args) {
        System.out.println("Has escrito " + args.length + " palabras:");
        for (int i = 0; i < args.length; i++) {
            System.out.println("Palabra " + (i + 1) + ": " + args[i]);
        }
    }
}
```

Si ejecutas: `java UsoDeArgumentos Java mola mucho`, verás:

```
Has escrito 3 palabras:
Palabra 1: Java
Palabra 2: mola
Palabra 3: mucho
```

### 🧩 EL LÍO

Tu jefe ha dejado este código hecho un desastre. Las líneas están mezcladas. ¿Eres capaz de ordenarlas para que sea un programa Java válido y que imprima "La suma es: 8"?

```
System.out.println("La suma es: " + (a + b));
int a = 5;
public class CalculoLioso {
System.out.println("Calculando...");
public static void main(String[] args) {
int b = 3;
```

Pista: busca primero dónde empieza la clase y el método main.

> 🕶️ **Don Tip:** La clase es el contenedor, el main es la puerta de entrada, las instrucciones van dentro del main.

## Resumen (lo que importa de verdad)

- JDK compila, JRE ejecuta, JVM transporta. Como Amazon pero con café.
- El IDE es tu navaja suiza: editor, compilador, depurador, todo en uno.
- `public static void main(String[] args)` es la puerta de entrada.
- El depurador te permite espiar tu código en cámara lenta.
- Los comentarios son para humanos, no para máquinas.

## Ejercicios Propuestos

1. **Hola, ¿quién eres?** Escribe un programa que muestre tu nombre, tu edad y tu ciudad favorita en tres líneas separadas.

> **💡 Consejo:** Los ejercicios que usan `if` y bucles los veremos oficialmente en la Unidad 3. Si te sientes aventurero, inténtalos — son resolubles con lo que sabes + un poco de intuición. Si prefieres ir paso a paso, vuelve a ellos después de la Unidad 3. ¡No hay prisa!

2. **El detective incansable** Programa un bucle simple que sume números del 1 al 100. Pon un breakpoint y observa cómo cambia la variable acumuladora.
3. **Error buscaminas** Escribe intencionadamente un programa que olvide un punto y coma. Compila y anota el mensaje de error. Luego arréglalo.
4. **Javadoc de tu vida** Crea una clase `SobreMi` con un método `main` y añade comentarios Javadoc a la clase explicando quién eres y por qué estás aprendiendo Java.
5. **Argumentos secretos** Escribe un programa que imprima todos los argumentos que recibe desde la línea de comandos (usa `args`). Ejecútalo con `java MiPrograma hola mundo esto es una prueba`.
6. **Mini-calculadora a pelo** Sin usar Scanner, declara dos números `int` directamente en el código, súmalos, réstalos, multiplícalos y divídelos. Muestra los resultados.
7. **¿Frío o calor?** Declara una variable `int temperatura = 30`. Usa un `if` para que imprima "Hace calor" si es mayor de 25 y "Hace fresco" si es menor o igual.
8. **El depurador chismoso** Crea un programa con tres variables (`a`, `b`, `c`). Pon un breakpoint y ejecuta paso a paso, anotando cómo cambian los valores. ¿Coincide con lo que esperabas?

---

**RAs trabajados en esta unidad:**
- **RA1** - Entornos de desarrollo

---

<div align="center">
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.es" target="_blank">
    <img src="/ApuntesProgramacion/cc-by-sa.png" alt="CC BY-SA 4.0" width="88" height="31">
  </a>
  <br>
  <strong>Sergi Garcia Barea</strong> — CC BY-SA 4.0
</div>
