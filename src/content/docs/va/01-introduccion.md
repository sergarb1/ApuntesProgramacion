---
title: "Unidad 1: Introducción a Java"
nav_order: 1
---
🎯 **Objectius d'aprenentatge**
- Instal·lar i configurar el JDK
- Escriure i compilar el primer programa Java
- Utilitzar el depurador de l'IDE
- Diferenciar JDK, JRE i JVM
- Escriure comentaris i documentació bàsica

## L'Ordinador T'Obeeix: Entorns de Desenvolupament

Sabies que el teu ordinador és bàsicament un cadell molt llest però amb zero iniciativa? No fa res fins que li dones ordres precises. I per a això necessitem un **entorn de desenrotllament**.

## Què és això del JDK, JRE i JVM? (La Trilogia del Cafè)

Java funciona com una cafeteria d'especialitat:

- **JVM (Java Virtual Machine)**: És la màquina de cafè. Té la seua pròpia recepta (bytecode) i funciona igual en qualsevol lloc. Viatja amb el teu programa a totes parts.
- **JRE (Java Runtime Environment)**: És la cafeteria sencera. Té la màquina, els gots, el sucre... tot el necessari per a *executar* cafè ya fet.
- **JDK (Java Development Kit)**: És el kit complet per a muntar la teua pròpia cafeteria. Té la màquina, els grans de cafè verd, el molinet, el manual de barista... TOT per a *crear* programes.

```java
// Imagina que esto es un grano de café verde:
public class Cafe {
    public static void main(String[] args) {
        System.out.println("☕ ¡Café listo!");
    }
}
```

El JDK compila açò a bytecode (cafè molt), el JRE ho passa per la JVM i... tachán! cafè a la teua pantalla.

> **📝 Nota:**
>
> **Dada freak:** La creació de Java en Sun Microsystems (1995) es va inspirar en la màquina de cafè de l'oficina. Per això el logo és una tassa humejant. No m'ho invente.

> **⚠️ Advertència:**
>
> No confongues JDK amb JRE. El JDK és el *ganivet del chef*, el JRE és el *plat servit*. Si només vols executar programes, et basta el JRE. Si vols *crear-los*, necessites el JDK.

## Muntant el Xiringuito: Instal·lació

Instal·laràs el JDK. No t'espantes, és més fàcil que muntar un moble d'Ikea i no et sobraran caragols.

```
> java -version
openjdk version "21" 2026-01-01
> javac -version
javac 21
```

Si veus alguna cosa pareguda, enhorabona! Tens poders de compilació.

> **💡 Consell:**
>
> Si uses [Eclipse Temurin](https://adoptium.net/) t'estalviaràs maldecaps. És com el JDK oficial però sense fums rars.

## El Teu Primer Programa: Hola Món (o com parlar-li a la màquina)

Programar és com parlar-li a un extraterrestre molt literal. Si li dius "saluda", no ho fa. Has de dir-li *com* saludar, *quan* i *per què*.

```java
public class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola, Mundo! Llevo años esperando a que me crearas.");
    }
}
```

Anem a diseccionar açò com si fóra una granota en biologia:

- `public class HolaMundo`: Declares una classe. Pensa en això com "Escolta, Java, vaig a crear una cosa que es diu HolaMundo".
- `public static void main(String[] args)`: Este és el "botó d'inici". Quan executes el programa, Java busca esta línia i diu "Per ací es comença!".
- `System.out.println(...)`: És la veu del programa. Li dius que cride alguna cosa per la consola.

> **⭐ BE THE CODE, MY FRIEND**
>
> > 🕶️ **Don Tip:** Seguix el codi línia a línia com si fores la JVM. Cada instrucció s'executa en orde.
>
> **Exercici 1: Tu ets el Compilador**
>
> Vas a ser Java per un moment. Pren paper i boli (o mentalment). Et donen este codi:
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
> **Pregunta:** Sense executar-ho, què imprimeix? Seguix els passos com si fores la JVM:
> 1. Trobes la classe `Computadora`.
> 2. Busques el mètode `main` - ahí està.
> 3. Crees un espai anomenat `x` i fiques un 5.
> 4. Crees `y` i fiques un 10.
> 5. Crees `z`, sumes x i y (15), ho guardes.
> 6. Crides per pantalla "El resultat és: 15".
>
> Si la teua resposta va ser diferent, torna a començar. L'ordinador és tonto però precís: no interpreta, *executa*. Cada línia, en orde, sense saltar-se'n cap.

> **⭐ BE THE CODE, MY FRIEND**
>
> **Exercici 2: El Mètode que no Troba**
>
> Observa este codi. S'executarà correctament? Per què?
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
> **Resposta:** Sí s'executa, però sols imprimeix la primera línia. El mètode `saludo()` existix però com mai el crides des de `main`, es queda ahí fent el vague. Java sols executa el que està dins del `main` (a no ser que explícitament crides a uns atres mètodes). El mètode `saludo()` és com un actor que té el guió après però mai eix a l'escenari.

> **⭐ BE THE CODE, MY FRIEND**
>
> **Exercici 3: L'Error del Novat**
>
> Què està malament ací? Assenyala tots els errors que trobes:
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
> **Resposta:** Hi ha 4 errors! (1) `Public` hauria de ser `public` (minúscula). (2) Falta `{` després de `Calculadora`. (3) `string[] args` hauria de ser `String[] args` (la S majúscula importa). (4) Falta `;` al final de la primera línia del `println`. Java és molt puntillós, com un professor de llengua amb les comes.

## El Depurador: Ets un Detectiu

Un programa rar. La variable `edad` eix 25 quan hauria d'eixir 18. Què fas? Li pegues a l'ordinador? No. Uses el **depurador**.

El depurador és com tindre visió de raigs X per al teu codi:

- **Breakpoint (punt de ruptura)**: Li dius a Java "para ACÍ, vull vore què està passant".
- **Step Over (F8)**: "Executa esta línia però no em conten els detalls".
- **Step Into (F7)**: "Executa esta línia I porta'm dins d'eixa funció, vull espiar".
- **Watch (inspecció)**: "Ensenya'm el valor de la variable `edad` ARA MATEIX".

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

Posa un breakpoint en la línia del `sospechoso += i`, executa en mode depuració, i mira com `sospechoso` canvia en cada volta. És com vore una sèrie de crims en càmera lenta!

## No Hi Ha Preguntes Tontes!

> **❓ No Hi Ha Preguntes Tontes!**
>
> **Q:** Per què `public static void main(String[] args)`? Pareix un encanteri de Harry Potter.
>
> **A:** Perquè sí. Val, no és bona resposta. `public` és perquè Java puga trobar el mètode des de fora. `static` és perquè puga cridar-lo sense necessitat de crear un objecte (arribarem a això). `void` significa que no torna res. `main` és el nom que Java busca al arrancar. `String[] args` és una butxaca on pots ficar arguments al executar el programa. I sí, pareix un encanteri de Harry Potter.
>
> **Q:** Puc cridar a la meua classe `Holamundo` en minúscula?
>
> **A:** Pots, però Java et mirarà malament. Les classes comencen en majúscula per convenció. No és obligatori, però si no ho fas, uns atres programadors pensaran que eres un psicòpata.
>
> **Q:** Si m'equivoque en un punt i coma, l'ordinador explota?
>
> **A:** No, però el compilador et llançarà un error críptic i tu passaràs 20 minuts buscant un `;` perdut. Benvingut a la programació.
>
> **Q:** Puc tindre dos classes amb el mateix nom en el mateix archiu?
>
> **A:** No, i Java es posarà molt borde. Cada archiu `.java` pot tindre sols una classe `public`, i eixa classe ha de dir-se exactament igual que l'archiu. Si el teu archiu es diu `HolaMundo.java`, no pots tindre dins una classe `public class AdiosMundo`. Pots tindre classes no públiques, però cada una en el seu propi archiu és més net.
>
> **Q:** Java i JavaScript són cosins?
>
> **A:** No, ni tan sols són del mateix planeta. Java és a JavaScript com un gos és a un gosset calent. El nom va ser una estratègia de màrqueting de Netscape per a muntar-se en el boom de Java.

## Els Comentaris: Notes Apegaloses Digitals

Els comentaris són missatges que et deixes a tu mateix (o a uns atres). L'ordinador els ignora completament.

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

> **💡 Consell:**
>
> Comenta el *per què*, no el *què*. `int i = 0; // Declare i amb valor 0` és com posar "Obro la porta" en una porta. El codi ja diu això. En canvi `int i = 0; // Comencem des de 0 perquè l'usuari no ha polsat res` això sí és útil.

## Més Exemples de Codi

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

Si executes: `java UsoDeArgumentos Java mola molt`, veuràs:

```
Has escrito 3 palabras:
Palabra 1: Java
Palabra 2: mola
Palabra 3: mucho
```

### 🧩 EL LÍO

El teu cap ha deixat este codi fet un desastre. Les línies estan barrejades. Eres capaç d'ordenar-les perquè siga un programa Java vàlid i que imprimisca "La suma és: 8"?

```
System.out.println("La suma es: " + (a + b));
int a = 5;
public class CalculoLioso {
System.out.println("Calculando...");
public static void main(String[] args) {
int b = 3;
```

Pista: busca primer on comença la classe i el mètode main.

> 🕶️ **Don Tip:** La classe és el contenidor, el main és la porta d'entrada, les instruccions van dins del main.

## Resum (el que importa de veritat)

- El JDK compila, el JRE executa, la JVM transporta. Com Amazon però amb cafè.
- L'IDE és la teua navalla suïssa: editor, compilador, depurador, tot en un.
- `public static void main(String[] args)` és la porta d'entrada.
- El depurador et permet espiar el teu codi en càmera lenta.
- Els comentaris són per a humans, no per a màquines.

## Exercicis Proposats

1. **Hola, qui eres?** Escriu un programa que mostre el teu nom, la teua edat i la teua ciutat favorita en tres línies separades.
> **💡 Consell:** Els exercicis que usen `if` i bucles els veurem oficialment en la Unitat 3. Si et sents aventurer, intenta'ls — són resolubles amb el que saps + una mica d'intuïció. Si preferixes anar pas a pas, torna a ells després de la Unitat 3. No hi ha pressa!

2. **El detectiu incansable** Programa un bucle simple que sume números del 1 al 100. Posa un breakpoint i observa com canvia la variable acumuladora.
3. **Error buscamines** Escriu intencionadament un programa que oblide un punt i coma. Compila i anota el missatge d'error. Després arregla-ho.
4. **Javadoc de la teua vida** Crea una classe `SobreMi` amb un mètode `main` i afegix comentaris Javadoc a la classe explicant qui eres i per què estàs aprenent Java.
5. **Arguments secrets** Escriu un programa que imprimisca tots els arguments que rep des de la línia de comandes (usa `args`). Executa-ho amb `java MiPrograma hola món açò és una prova`.
6. **Mini-calculadora a pelo** Sense usar Scanner, declara dos números `int` directament en el codi, suma'ls, resta'ls, multiplica'ls i dividix'ls. Mostra els resultats.
7. **Fred o calor?** Declara una variable `int temperatura = 30`. Usa un `if` perquè imprimisca "Fa calor" si és major de 25 i "Fa fresc" si és menor o igual.
8. **El depurador xafarder** Crea un programa amb tres variables (`a`, `b`, `c`). Posa un breakpoint i executa pas a pas, anotant com canvien els valors. Coincidix amb el que esperaves?

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
