

**LLICÈNCIA**

**Reconeixement- No comercial \- CompartirIgual** (BY-NC-SA): No es permet un ús comercial de l'obra original ni de les possibles obres derivades, la distribució de les quals s'ha de fer amb una llicència igual a la que regula l'obra original.

**ÍNDEX**

**[Exercici 1: Desordena això (Solució)	3](#exercici-1:-desordena-això-\(solució\))**

[**Exercici 2: Què imprimeix? (Solució)	3**](#exercici-2:-què-imprimeix?-\(solució\))

[**Exercici 3: Caçador d'errors (Solució)	3**](#exercici-3:-caçador-d'errors-\(solució\))

[**Exercici 4: La teua fitxa personal (Solució)	4**](#exercici-4:-la-teua-fitxa-personal-\(solució\))

[**Exercici 5: Completa el programa (Solució)	4**](#exercici-5:-completa-el-programa-\(solució\))

[**Exercici 6: Emparella conceptes (Solució)	4**](#exercici-6:-emparella-conceptes-\(solució\))

[**Exercici 7: El detectiu d'errors (Solució)	4**](#exercici-7:-el-detectiu-d'errors-\(solució\))

[**Exercici 8: La teua biografia (Solució)	5**](#exercici-8:-la-teua-biografia-\(solució\))

***UNITAT 01 – Activitats no avaluables 01 (Solucions)***

**📝 Butlletí U01 — Inicial (Solucions)**

Solucions de les activitats. Compara el teu codi amb estes propostes de resolució i comparteix els teus dubtes o alternatives en el fòrum.

# **Exercici 1: Desordena això (Solució)** {#exercici-1:-desordena-això-(solució)}

**Codi ordenat i corregit:**

| public class Ordenado {    public static void main(String\[\] args) {        System.out.println("Mi primer programa ordenado");    }} |
| :---- |

# **Exercici 2: Què imprimeix? (Solució)** {#exercici-2:-què-imprimeix?-(solució)}

**Eixida exacta per pantalla:**

Dijo: "Java mola" y siguió: programando.

* **Explicació**: System.out.print no afegeix salt de línia al final, per la qual cosa la segona instrucció s'imprimeix immediatament a continuació. La seqüència \\" permet escriure la cometa doble sense tancar la cadena, i \\t afegeix l'espaiat del tabulador.

# **Exercici 3: Caçador d'errors (Solució)** {#exercici-3:-caçador-d'errors-(solució)}

**Errors trobats:**

1. Public va en minúscula (public).

2. string va amb la primera lletra en majúscula (String).

3. En "Hola, "Mundo"" cal escapar les cometes internes ("Hola, \\"Mundo\\"").

4. En "Esto funciona?) falta la cometa doble de tancament ("Esto funciona?").

**Codi corregit:**

| public class ErrorFinder {    public static void main(String\[\] args) {        System.out.println("Hola, \\"Mundo\\"");        System.out.println("Esto funciona?");    }} |
| :---- |

# **Exercici 4: La teua fitxa personal (Solució)** {#exercici-4:-la-teua-fitxa-personal-(solució)}

**Codi de resolució:**

| public class FichaPersonal {    public static void main(String\[\] args) {        System.out.println("Nombre: Sergi");        System.out.println("Edad: 25");        System.out.println("Lenguaje favorito: Java");        System.out.println("¿Emocionado?: " \+ true);    }} |
| :---- |

# **Exercici 5: Completa el programa (Solució)** {#exercici-5:-completa-el-programa-(solució)}

**Elements afegits:**

* El punt i coma ; al final de la instrucció System.out.println.

* La clau de tancament } de la classe Completame.

**Codi corregit:**

| public class Completame {    public static void main(String\[\] args) {        System.out.println("Aprobado, esto funciona");    }} |
| :---- |

# **Exercici 6: Emparella conceptes (Solució)** {#exercici-6:-emparella-conceptes-(solució)}

**Resolució:  1→C, 2→A, 3→B, 4→D, 5→E**

# **Exercici 7: El detectiu d'errors (Solució)** {#exercici-7:-el-detectiu-d'errors-(solució)}

**Error trobat:** Falta el punt i coma ; al final de la primera instrucció System.out.println("Soy un detective").

**Codi corregit:**

| public class Detective {    public static void main(String\[\] args) {        System.out.println("Soy un detective");        System.out.println("y resuelvo errores");    }} |
| :---- |

# **Exercici 8: La teua biografia (Solució)** {#exercici-8:-la-teua-biografia-(solució)}

**Codi de resolució (amb una sola instrucció i \\n):**

| public class Biografia {    public static void main(String\[\] args) {        System.out.println("Nombre: Sergi\\nEdad: 25\\nLenguaje favorito: Java\\nFrase: El código limpio habla por sí solo.");    }} |
| :---- |

