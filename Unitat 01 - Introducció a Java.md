

**LLICÈNCIA**

**Reconeixement- No comercial \- CompartirIgual** (BY-NC-SA): No es permet un ús comercial de l'obra original ni de les possibles obres derivades, la distribució de les quals s'ha de fer amb una llicència igual a la que regula l'obra original.

**ÍNDEX**

**[0\. Introducció	3](#0.-introducció)**

[**1\. Què és Java?	4**](#1.-què-és-java?)

[**2\. Instal·lació del JDK	7**](#2.-instal·lació-del-jdk)

[**3\. El teu primer programa	11**](#3.-el-teu-primer-programa)

[**4\. El depurador	14**](#4.-el-depurador)

[**5\. Comentaris i documentació	17**](#5.-comentaris-i-documentació)

[**6\. Arguments de línia d'ordres	21**](#6.-arguments-de-línia-d'ordres)

[**7\. El compilador i els seus errors	24**](#7.-el-compilador-i-els-seus-errors)

[**8\. L'IDE i el teu flux de treball	28**](#8.-l'ide-i-el-teu-flux-de-treball)

[**9\. Repàs	31**](#9.-repàs)

***UNITAT 01 – Introducció a Java***

# **0\. Introducció** {#0.-introducció}

Benvingut al curs de Programació en Java. Sabies que el teu ordinador és bàsicament un aparell molt llest però amb zero iniciatives? No fa res fins que li donen ordres precises. I per a això necessitem un **entorn de desenrotllament**, un llenguatge i moltes ganes de compilar.

Esta primera unitat et deixa a la porta del castell: instal·laràs el JDK, escriuràs el teu primer programa, coneixeràs la trilogia del café (JVM, JRE i JDK), usaràs el depurador com un detectiu i parlarem amb la màquina mitjançant comentaris i arguments. No necessites experiència prèvia: només un editor de text i curiositat.

Esta unitat es llig com un **llibre de 9 capítols**: cada punt desenrotlla una idea completa i enllaça amb el següent.

**🎯 Objectiu de la unitat**

En acabar, seràs capaç de:

* Explicar la diferència entre **JDK, JRE i JVM** amb l'analogia de la cafeteria.  
* Instal·lar i configurar un JDK i comprovar la instal·lació amb java \-version.  
* Escriure, compilar i executar el teu primer programa Java.  
* Disseccionar el mètode main i entendre cada peça de l'esquelet d'un programa.  
* Usar el **depurador** (breakpoints, step over/into, watch) com un detectiu.  
* Escriure comentaris d'una línia, de bloc i **Javadoc**.  
* Gestionar els **arguments de línia d'ordres** amb args.  
* Reconéixer i corregir els errors de compilació més típics del principiant.  
* Treballar amb un **IDE** i conéixer el teu flux de treball diari.

**🗺️ Mapa de la unitat**

| Punt | Què aprendràs |
| ----- | ----- |
| 01 · Què és Java? | Història, bytecode, la trilogia JVM/JRE/JDK |
| 02 · Instal·lació del JDK	 | OpenJDK, java \-version, PATH, IDE		 |
| 03 · El teu primer programa | Hola Món, estructura, el mètode main |
| 04 · El depurador		 | Breakpoints, step over/into, watch	 |
| 05 · Comentaris i documentació		 | //, /\* \*/, /\*\* \*/ i Javadoc |
| 06 · Arguments de línia d'ordres		 | L'array args, com llegir-lo i 			usar-lo |
| 07 · El compilador i els seus errors	 | Compilar vs executar, errors típics del principiant |
| 08 · L'IDE i el teu flux de treball		 | Projectes, dreceres, crear/executar/depurar 		 |
| 09 · Repàs	 | Sé el Codi, Fireside, Qui Soc, Laboratori, Crucigrama…	 |

**📝 Butlletins de la unitat**

Practica amb els parells del curs: intenta primer el per-resoldre i comprova amb el resolt quan hàgeu acabat.

* 🟢 Inicial per resoldre  
* ✅ Inicial resolt  
* ⭐ Avançat per resoldre  
* 💪 Avançat resolt  
* 🔥 Extres

**🚪 Per on comence?**

* Zero coneixements? → Comença en el punt 1, no hi ha cap requisit previ.  
* Ja saps què és un IDE? → Ves directe al punt 3 i torna enrere només si et perds.  
* Vens a repassar? → Fes el Repàs interactiu i els butlletins.

# **1\. Què és Java?** {#1.-què-és-java?}

**📬 La idea en una frase**

Java és un llenguatge de programació que s'executa dins d'una màquina virtual (la JVM), la qual cosa li permet córrer igual en Windows, Linux o macOS: "escriu una vegada, corre en qualsevol lloc".

Si el teu ordinador és un cadell molt llest, però amb zero iniciatives, Java és un dels idiomes que pots usar per a donar-li ordres. I la JVM és l'intèrpret que tradueix les teues ordres a l'idioma concret de cada cadell.

**🔍 D'on ix este llenguatge?**

Java va nàixer el **1995** en **Sun Microsystems**, i la seua història té una de les curiositats més divertides del sector: es va inspirar en la **màquina de café** de l'oficina. Per això el logo és una tassa fumejant. No m'ho invente.

La idea dels seus creadors era simple, però ambiciosa: un llenguatge que funcionara en **qualsevol dispositiu**, sense importar el sistema operatiu ni el maquinari. Abans de Java, cada plataforma necessitava la seua pròpia versió del programa. Java va proposar la solució: no programar per a l'ordinador, sinó per a una **màquina virtual** que l'ordinador simula.

💡 **Dada freak:** el llenguatge es va dir primer *Oak* (roure), per un arbre que es veia des de l'oficina. Van haver de canviar-lo per motius de marca registrada i, segons la llegenda, el nom "Java" es va triar pel café que prenen durant les reunions.

**📦 Què és això del bytecode?**

Quan escrius Java no escrius instruccions de la CPU del teu ordinador: escrius instruccions per a la **JVM**. El procés és així:

1. Tu escrius codi font en un arxiu .java.  
2. El **compilador** (javac) ho tradueix a *bytecode*: un idioma intermedi que entén la 	JVM. El resultat és un archiu .class.  
3. La **JVM** llig el bytecode i l'executa en la teua màquina 	concreta.

**El teu codi (.java) \--javac--\> bytecode (.class) \--JVM--\> ¡s'executa\!**

La gràcia és que eixe .class és el mateix per a totes les plataformes: la JVM de Windows, la de Linux i la de macOS saben llegir-lo. Només canvia la JVM, no el teu programa.

**☕ La trilogia del Café: JVM, JRE i JDK**

Ací està el moment estrella de la unitat. Java funciona com una **cafeteria d'especialitat**, i has de memoritzar qui és qui:

| Concepte | Definició | Analogia |
| ----- | ----- | ----- |
| **JVM** | La màquina que executa el *bytecode*. | La màquina de café: té la seua recepta i funciona igual en qualsevol lloc. |
| **JRE** | Tot el necessari per a executar Java. | La cafeteria sencera: màquina, gots, sucre... |
| **JDK** | Tot el necessari per a crear programes. | El kit complet per a muntar la teua cafeteria: màquina, grans, molinet i manual de barista. |

* **JVM (Java Virtual Machine)**: la màquina de café. Executa el bytecode i viatja amb el teu programa a tot arreu.  
* **JRE (Java Runtime Environment)**: la cafeteria sencera. Té la JVM i les llibreries necessàries per a *executar* café ja fet. Si només vols *executar* programes, et basta.  
* **JDK (Java Development Kit)**: el kit per a muntar la 	teua pròpia cafeteria. Inclou el JRE més el compilador javac, el generador de documentació javadoc i altres ferramentes de desenrotllament. Si vols *crear* programes, el necessites.

| *// Comentari de com funciona el codi*public class Cafe {       public static void main(String\[\] args) {             System.out.println("☕ ¡Café preparat\!");       }} |
| :---- |

El JDK compila això a bytecode (café molt), el JRE ho passa per la JVM i... tachán\! Café en la teua pantalla.

⚠️ **Advertència:** no confongues JDK amb JRE. El JDK és el *ganivet del xef*; el JRE és el *plat servit*. El JDK inclou el JRE, així que instal·lant el JDK tens les dues coses. Instal·lar només el JRE et permet executar programes, però no crear-los.

**🌍 Per què segueix viu Java tants anys després?**

No és nostàlgia. Java segueix sent un dels llenguatges més demanats del món perquè:

* **És multiplataforma**: el mateix programa corre en mòbils, servidors, caixers i fins i tot en la rentadora intel·ligent.  
* **Domina el món empresarial**: les grans empreses (banca, assegurances, logística) fa dècades que construeixen els seus sistemes en Java.  
* **És el llenguatge oficial d'Android** (en la seua variant Kotlin conviu, però Java seguix omnipresent).  
* **Té una comunitat enorme**: qualsevol error que tingues, probablement algú ja el va resoldre fa deu anys en un fòrum.  
* **És exigent, i això et fa millor**: Java t'obliga a ser ordenat. Els programadors que aprenen amb Java solen escriure codi 	més net.

**🎯 Mini-comprovació**

Posat a prova en 30 segons (les respostes estan més avant):

1. Quina és la diferència entre JDK i JRE en una frase?  
2. Què fa el compilador javac amb el teu codi .java?  
3. Per què el logo de Java és una tassa fumejant?

**🔄 Respostes**

1. El JDK serveix per a crear programes (inclou el compilador); el JRE serveix per a executar-los. El JDK conté el JRE.

2. Ho tradueix a bytecode (un arxiu .class) que la JVM pot executar.

3. Perquè el llenguatge s'inspira en la màquina de café de l'oficina de Sun Microsystems: "escriu una vegada, corre en 	qualsevol lloc" (com el café, que es prepara igual en qualsevol cafeteria).

**✅ Resum en 3 frases**

1. Java executa el seu codi dins d'una **màquina virtual (JVM)**, la qual cosa li dona portabilitat total.  
2. **JDK** crea (compila a bytecode), **JRE** executa, **JVM** 	transporta: com Amazon però amb café.  
3. Java segueix sent rei en el món empresarial i aprendre'l et 	forma com a programador ordenat.

| Terme | Idea general |
| ----- | ----- |
| **JVM** | La màquina virtual que executa el bytecode |
| **JRE** | Entorn d'execució (JVM \+ llibreries) |
| **JDK** | Kit de desenrotllament (compilador \+ JRE \+ ferramentes) |
| **Bytecode** | Codi intermedi que entén la JVM |
| **Compilador** | Traductor de codi font a bytecode |

# **2\. Instal·lació del JDK** {#2.-instal·lació-del-jdk}

**📬 La idea en una frase**

**Per a crear programes Java necessites el JDK. Instal·lar-lo és més fàcil que muntar un moble d'Ikea, i no et sobraran caragols.**

En el punt anterior vas veure que el JDK és el kit complet per a *crear* programes. Ara toca posar-lo en la teua màquina i comprovar que tot funciona.

Ací tens el text adaptat en valencià donant-li el protagonisme principal a **OpenJDK** com l'opció central i més important:

**🛒 Quin JDK instal·le?**

El Java original de Sun/Oracle ha tingut una vida moguda amb les llicències. Hui la millor opció i la més sensata per a estudiar és anar directament a la font oficial i lliure:

1. **OpenJDK**: És el projecte de referència, lliure i de codi obert, del qual ixen totes les altres distribucions. **És la nostra opció principal i la recomanada, més senzill d’instal·lar en Linux.**  
   1. [https://openjdk.org/index.html](https://openjdk.org/index.html)  
2. **Eclipse Temurin** (abans AdoptOpenJDK): Una distribució excel·lent basada directament en OpenJDK, lliure, gratuïta i mantinguda per la fundació Eclipse.  
   1. [https://adoptium.net/es/temurin/releases](https://adoptium.net/es/temurin/releases)  
3. **Oracle JDK**: La versió comercial d'Oracle. Vàlida per a entorns empresarials, però amb una llicència més restrictiva. **Més senzill d’instal·lar en Windows**  
   1. [https://www.oracle.com/java/technologies/downloads/](https://www.oracle.com/java/technologies/downloads/)

**La versió a triar:** Triaràs l'última versió **LTS** (*suport a llarg termini*). Hui dia, qualsevol versió 17, 26 o superior et serveix per a tot el curs. No t'obsessiones amb el número exacte: tot el que aprendrem funciona exactament igual en totes elles.

**🚀 Els primers passos**

#### **Pas 1: Instal·lar**

Executa l'instal·lador d'OpenJDK i accepta els valors per defecte. En Windows, assegura't de marcar l'opció d'afegir el JDK al PATH si te l'ofereix l'instal·lador (així podràs usar java i javac des de qualsevol terminal sense haver de configurar res a mà).

#### **Pas 2: Verificar**

Obre una terminal (PowerShell o CMD en Windows, o la terminal en Linux/macOS) i escriu:

| \> java \-versionopenjdk version "21.0.2" 2024-01-16OpenJDK Runtime Environment (build 21.0.2+13-LTS)OpenJDK 64-Bit Server VM (build 21.0.2+13-LTS, mixed mode) |
| :---- |

I després comprova el compilador:

| \> javac \-versionjavac 21.0.2 |
| :---- |

Si veus una eixida pareguda, enhorabona\! Tens poders de compilació actius.

Si, en canvi, el sistema et diu 'java' no es reconeix com un comandament intern o extern, significa que el PATH no està ben configurat: busca en el menú de Windows "Editar les variables d'entorn del sistema" i afegeix la ruta de la carpeta bin de la teua instal·lació d'OpenJDK a la variable Path.

**💡 Què és el PATH?**

El “PATH” és la llista de carpetes on el teu sistema operatiu busca els programes i comandaments que escrius en la terminal. Si la carpeta ...\\jdk-26\\bin (o similar) està en el PATH, en escriure java el sistema la troba a la primera. Sense eixa configuració, el sistema no sap on està instal·lat el teu JDK.

#### **Pas 3: Per què hi ha dos comandaments?**

* **javac**: És el compilador. Converteix el teu codi font (.java) en bytecode (.class).

* **java**: És l'executor. Arranca la JVM per a executar el bytecode que has compilat prèviament.

**Es necessiten els dos**: primer **javac** tradueix el teu codi i després **java** el posa en marxa. Els veuràs treballar estretament durant tot el curs.

**🛠️ L'IDE: la teua navalla suïssa**

El JDK és el motor, però la major part del temps no escriuràs codi en un bloc de notes: usaràs un IDE (Entorn de Desenrotllament Integrat) o un editor avançat com VS Code. L'IDE reuneix en una sola aplicació:

* Editor de codi amb colors, autocompletat i ressaltat d'errors mentre escrius.

* Compilador i executor amb un botó: ja no necessites teclejar *javac* i *java* a mà (encara que és bo saber com funciona).

* Depurador integrat.

* Gestió de projectes: els teus programes no són només arxius solts, sinó projectes amb estructura.

| IDE / Editor | Punts forts |
| ----- | ----- |
| **VS Code** | L'opció recomanada. Molt lleuger, modern i altament personalitzable. Amb l'extensió Extension Pack for Java ofereix un entorn complet i excel·lent. |
| **IntelliJ IDEA (Community)** | El favorit del sector professional; autocompletat bestial. Una mica més pesat en arrancar. |
| **NetBeans** | Simple, oficial d'Oracle, perfecte per a començar. |
| **Eclipse** | Clàssic, molt usat en empreses, un pèl més dens. |

**💡 Recomanació per al curs:** VS Code amb el plugin de Java (Extension Pack for Java) és la millor opció per la seua lleugeresa i versatilitat. També pots usar IntelliJ IDEA Community Edition si el teu ordinador ho suporta, o NetBeans si vols alguna cosa més tradicional. Tots valen: l'IDE és una ferramenta, no l'objectiu.

**🏫 Exemple guiat: el teu primer projecte en VS Code**

Ho deixarem tot muntat abans d'escriure codi:

1. Obre VS Code i assegura't de tindre instal·lat el plugin Extension Pack for Java.

2. Polsa Ctrl \+ Shift \+ P (o Cmd \+ Shift \+ P en Mac) per a obrir la paleta d'ordres, escriu Java: Create Java Project i selecciona No build tools.

3. Tria la carpeta on vols guardar el projecte i dona-li un nom (per exemple, MiPrimerCurso).

4. VS Code et crearà l'estructura del projecte amb una carpeta src.

5. Dins de la carpeta src, crea un arxiu anomenat HolaMundo.java i escriu dins:

| public class HolaMundo {    public static void main(String\[\] args) {        System.out.println("¡Hola, Mundo\! Porte anys esperant a que em creares.");    }} |
| :---- |

6. Fes clic en el botó Run ▶ (que apareixerà just damunt del mètode main) o prem F5 i mira la terminal/consola.

Si veus el missatge en la pantalla, la teua paradeta està muntada: JDK \+ VS Code \+ primer programa. Estàs oficialment dins.

**⚠️ Advertència:** no confongues la consola/terminal de l'IDE amb la terminal del sistema. La consola de VS Code és on s'imprimeixen els *System.out.println* en executar. Si no veus l'eixida, busca la pestanya Terminal o Output / Eixida.

**🎯 Mini-comprovació**

1. Quin comandament comprova que la teua instal·lació funciona?

2. Per a què serveix el PATH i què passa si el JDK no està en ell?

3. Quina és la diferència entre java i javac?

**🔄 Respostes**

1. java \-version (i també javac \-version).

2. El PATH és la llista de carpetes on el sistema busca els comandaments. Sense ell, en escriure java el sistema respon que no reconeix el comandament.

3. javac compila el codi font a bytecode; java executa el bytecode amb la JVM.

**✅ Resum en 3 frases**

1. Instal·la OpenJDK (un JDK lliure) i verifica amb java \-version i javac \-version.

2. javac compila, java executa, i el PATH és l'adreça postal que el sistema necessita per a trobar-los.

3. Un IDE o editor com VS Code (amb el plugin de Java) reuneix editor, compilador i depurador: és la teua navalla suïssa.

**🐛 Vocabulari ràpid**

| Terme | Idea general |
| ----- | ----- |
| PATH | Llista de carpetes on el sistema busca comandaments |
| IDE / Editor | Entorn integrat: editor \+ compilador \+ depurador |
| LTS | Versió amb suport a llarg termini (la recomanada) |
| Terminal | La finestra on escrius comandaments com java |
| Projecte | La carpeta on viuen les teues classes i configuracions |

# **3\. El teu primer programa** {#3.-el-teu-primer-programa}

**📬 La idea en una frase**

*Programar és parlar-li a un extraterrestre molt literal: si li dius "saluda", no ho fa. Has de dir-li* com*,* quan *i* per què*.*

L'ordinador és ximple, però precís: no interpreta, **executa**. Cada línia, en orde, sense saltar-se'n cap. El teu primer programa va a cridar "Hola\!" per la consola, i a partir d'ací tot és afegir més ordres.

**👋 Hola Món, el ritual d'iniciació**

Tot programador comença per ací. És com el primer café del matí: no és opcional.

| public class HolaMundo { public static void main(String\[\] args) { System.out.println("¡Hola, Mundo\! Llevo años esperando a que me crearas."); } } |
| :---- |

Compila-ho (javac HolaMundo.java) i executa-ho (java HolaMundo), o polsa el botó ▶ del teu IDE. La consola dirà:

¡Hola, Mundo\! Llevo años esperando a que me crearas.

**🔬 Dissecció d'Hola Món**

Disseccionarem això com si fora una granota en biologia:

* **public class HolaMundo:**  declares una classe. Pensa que li dius a Java: "Escolta, vaig a crear una cosa que es diu HolaMundo". public significa que és accessible des de fora i la classe ha de dir-se igual que l'archiu.  
* **public static void main(String\[\] args):** este és el **botó d'inici**. Quan executes el programa, Java busca esta línia i diu "per ací es comença\!".  
* System.out.println(...): és **la veu** del programa. Li dius que cride alguna cosa per la consola. print imprimeix sense salt de línia; println imprimeix 	i salta de línia.

| public class MiPrimerPrograma { public static void main(String\[\] args) { *// Este és el meu primer programa*System.out.println("¡Holaaaa, mundo\!");System.out.println("Estoy aprendiendo Java");System.out.println("Y me está gustando (de momento)"); } } |
| :---- |

💡 **Detall pràctic:** cada instrucció acaba amb ;. És el punt final de cada frase. Sense ell, el compilador pensa que la frase continua i es lliga. Els {} delimiten els blocs: els de la classe contenen la classe, els del main contenen les ordres.

**🗝️ Per què public static void main(String\[\] args)\`?**

Pareix un encanteri de Harry Potter. Desgranem cada paraula:

| Paraula | Què significa |
| ----- | ----- |
| **public** | Java pot trobar-lo des de fora: el botó és visible |
| **static** | Pot cridar-se sense necessitat de crear un objecte |
| **void** | No torna cap valor: fa el seu treball i es calla |
| **main** | El nom exacte que Java busca en arrancar. No en val un altre |
| **String\[\] args** | Una butxaca on pots ficar arguments en executar (punt 6\) |

El main és **obligatori tal qual**. Si canvies main per inici, Java no el troba i el programa no fa res.

**🚪 El mètode que no es crida**

Ací va una de les trampes favorites en els exàmens. Observa:

| public class Saludos { public static void main(String\[\] args) { System.out.println("¡Hola desde el método main\!"); } public static void saludo() { System.out.println("Esto nunca se ejecuta..."); } } |
| :---- |

S'executarà correctament? **Sí**, però només imprimeix-la primera línia. El mètode saludo() existeix, però com mai el crides des de main, es queda ací fent el vague. Java només executa el que està dins del main (llevat que explícitament crides altres mètodes). El mètode saludo() és com un actor que té el guió aprés, però mai ix a l'escenari.

🧠 **Truc de memòria:** main és la porta d'entrada de la casa. Pot haver-hi moltes habitacions (mètodes), però ningú entra per la finestra. Si no crides a la porta, les habitacions es queden buides.

**⭐ Tracta de pensar com el codi: tu ets la JVM**

Seràs Java per un moment. Pren paper i boli (o mentalment). Et donen este codi:

| public class Computadora {    public static void main(String\[\] args) {        int x \= 5;        int y \= 10;        int z \= x \+ y;        System.out.println("El resultado es: " \+ z);    }} |
| :---- |

Segueix els passos com si fores la JVM:

1. Trobes la classe Computadora.  
2. Busques el mètode main — ací està.  
3. Crees un espai anomenat x i fiques un 5\.  
4. Crees y i fiques un 10\.  
5. Crees z, sumes x i y (15), ho guardes.  
6. Crides per pantalla: "El resultado es: 15".

**🔄 Solució**

L'eixida és exactament:

**El resultado es: 15**

Si la teua resposta és diferent, torna a començar: l'ordinador no interpreta, *executa*, línia a línia.

**🎯 Mini-comprovació**

1. Què passa si reanomene main a inici?  
2. Imprimeix el mateix System.out.print("Hola") que System.out.println("Hola")?  
3. Per què en falta un ; en el codi de baix? Assenyala l'error:

| public class Erroneo {    public static void main(String\[\] args) {        System.out.println("Me falta algo")    }} |
| :---- |

**🔄 Respostes**

1. Java no troba la porta d'entrada: el programa compila (en 	alguns entorns) però en executar no fa res, o dona error. La firma 	ha de ser exacta.  
2. No. print no salta de línia; println sí. En pantalla es nota: print("Hola") 	seguit de print("Mundo") mostra HolaMundo pegat.  
3. Falta el ; al final de 	System.out.println("Me falta algo"). El compilador es queixarà esperant el punt i 	coma.

**✅ Resum en 3 frases**

1. Tot programa té una **classe** (contenidor) i un **mètode main** (porta d'entrada).  
2. System.out.println() és la veu del programa i el ***“;”*** és el punt final de cada frase.  
3. La JVM executa **línia a línia, en orde**: tu decideixes què entra per la porta.

**🐛 Vocabulari ràpid**

| Terme | Idea general |
| :---- | :---- |
| **Classe** | El contenidor del codi (una "cosa" en Java) |
| **Mètode** | Un bloc d'ordres amb nom |
| **main** | El mètode que Java executa en arrancar |
| **println** | Imprimeix text i salta de línia |
| **Consola / Terminal** | La finestra de text on s'imprimeix l'eixida del programa |

# **4\. El depurador** {#4.-el-depurador}

**📬 La idea en una frase**

El depurador (debugger) és com tindre visió de raigs X per al teu codi: para el programa on tu vols i t'ensenya el valor de cada variable en cada instant.

El teu primer programa funciona. Però prompte tindràs un programa rar: una variable edat que ix 25 quan n'hauria d'eixir 18\. Què fas? Li pegues a l'ordinador? No. Uses el depurador.

**🔍 Què és depurar?**

Depurar (debug) és traure-li els bitxos (bugs) al programa. I el secret dels programadors experimentats no és endevinar: és veure. El depurador et permet:

* Parar el programa en una línia concreta.

* Avançar instrucció a instrucció.

* Inspeccionar el valor de les variables en cada moment.

* Modificar valors sobre la marxa.

És com vore una sèrie de crims en càmera lenta: pots pausar, observar qui fa què, i analitzar cada detall.

**💡 Detall pràctic:** Els errors es dividixen en dues famílies. Els de compilació els atrapa javac (o el mateix VS Code remarcant-ho en roig) i et diu la línia. Els de lògica compilen perfecte però fan el que no han de fer: per a eixos no hi ha millor arma que el depurador.

**🛠️ Les quatre ferramentes del detectiu en VS Code**

| Ferramenta | Drecera (VS Code) | Què fa |
| ----- | ----- | ----- |
| **Breakpoint (punt de ruptura)** | Clic a l'esquerra del número de línia | Li dius a Java "para ACÍ, vull vore què passa". |
| **Step Over** | F10 | "Executa esta línia però no em contes els detalls interns". |
| **Step Into** | F11 | "Executa esta línia I porta'm dins d'eixa crida, vull espiar". |
| **Variables / Watch** | Panell lateral de depuració | "Ensenya'm el valor de la variable ARA MATEIX". |

* **Breakpoint**: Marca una línia amb un punt roig. El programa es deté just abans d'executar-la i espera les teues ordres.

* **Step Over (F10):** Executa la línia completa de colp, sense entrar en els mètodes que crida.

* **Step Into (F11):** Entra dins del mètode cridat per a vore les seues línies una a una.

* **Variables / Watch:** El panell esquerre en la vista de depuració de VS Code (Run and Debug) que mostra les variables vives i els seus valors actuals. En Watch pots afegir expressions concretes per a avaluar-les en temps real.

**⚠️ Advertència:** Si et perds dins d'un mètode alié amb Step Into, prem Step Out (Shift \+ F11): ix del mètode i torna al punt on el vas cridar. És el botó "he entrat sense voler, traieu-me d'ací".

**🏫 Exemple guiat: el cas del sospitós en VS Code**

Ací tens un programa perfecte per a estrenar el depurador:

| public class DetectivesDeCodigo {    public static void main(String\[\] args) {        int sospechoso \= 0;        for (int i \= 0; i \< 10; i++) {            sospechoso \+= i; *// Posa un breakpoint ací*        }        System.out.println("El culpable es: " \+ sospechoso);    }} |
| :---- |

El bucle for el veuràs a fons en la U03, però ho pots intuir: repeteix la línia de dins mentre i siga menor que 10, amb i valent 0, 1, 2... La línia clau és *sospechoso \+= i* (que és el mateix que *sospechoso \= sospechoso \+ i).*

**L'exercici de detectiu:**

1. Posa un breakpoint en la línia de *sospechoso \+= i* (fes clic a l'esquerra del número de línia; apareixerà un punt roig fix).

2. Executa en mode depuració: prem F5 o fes clic a la icona del bitxo amb el triangle ▶ (Run and Debug / Start Debugging) en la barra flotant superior o en la pestanya esquerra.

3. El programa es deté i eixa línia s'il·lumina en groc. Mira el panell Variables a l'esquerra: veuràs que *sospechoso* val 0 i i val 0\.

4. Prem Step Over (F10) diverses vegades i observa com canvien sospechoso i i en el panell lateral en cada volta.

**🔄 Què hauries de vore**

Valors de *sospechoso* en cada parada: 0, 1, 3, 6, 10, 15, 21, 28, 36, 45 i, en acabar el bucle, 55\. El valor final imprés en la terminal de VS Code és "El culpable es: 55". Si en el teu depurador el valor no coincideix, tens al davant un bug real per a diagnosticar. Això és depurar.

**🧠 La regla d'or del depurador**

Quan alguna cosa falla, no endevines: observa. El procés és sempre el mateix:

1. Reprodueix la fallada (que ocórrega sempre que pugues).

2. Posa un breakpoint abans de la zona sospitosa.

3. Avança amb F10 i observa les variables en el panell lateral fins a localitzar la línia on el valor es torç.

4. En veure on es desvia el valor, hauràs trobat el bug.

**💡 Consell:** Si el programa s'executa fins al final sense detindre's, és que el breakpoint està en una línia que mai s'aconsegueix (per exemple, dins d'un mètode que ningú crida o en una condició if que no es compleix). El breakpoint no es dispara: una altra pista de detectiu.

**🎯 Mini-comprovació**

1. Quina diferència hi ha entre Step Over (F10) i Step Into (F11)?

2. Si poses un breakpoint i el programa no es deté, què sospites?

3. En quin mode cal executar el programa perquè els breakpoints funcionen?

**🔄 Respostes**

1. Step Over (F10) executa la línia sencera sense entrar en els mètodes que crida; Step Into (F11) entra dins del mètode per a vore les seues línies una a una.

2. Que el breakpoint està en una línia que mai s'executa (codi mort, mètode no cridat, condició que no es compleix).

3. En mode depuració (prement F5 / icona del bitxo 🐞 Start Debugging), no en mode execució normal (Run Without Debugging).

**✅ Resum en 3 frases**

1. El depurador para el programa on tu marques (breakpoint) i et mostra les variables en viu en el panell lateral de VS Code.

2. Step Over (F10) no entra en els mètodes; Step Into (F11) sí; el panell Variables / Watch et mostra els valors en temps real.

3. Davant un bug, no endevines: reprodueix, para, avança i observa fins a trobar on es torç el valor.

**🐛 Vocabulari ràpid**

| Terme | Idea general |
| ----- | ----- |
| **Bug** | Un error en el programa |
| **Debug** | Procés de trobar i arreglar bugs |
| **Breakpoint** | Marca (punt roig) on el programa es deté |
| **Step Over / Into** | Avançar sense entrar (F10) / entrant (F11) en mètodes |
| **Watch / Variables** | Panell lateral de VS Code que mostra variables i expressions |

# **5\. Comentaris i documentació** {#5.-comentaris-i-documentació}

**📬 La idea en una frase**

**Un comentari és un missatge que et deixes a tu mateix (o a uns altres). L'ordinador l'ignora completament: és per als humans, no per a les màquines.**

El codi explica *què* fa la màquina; els comentaris expliquen *per què* ho fa. I el *per què* és or pur: sis mesos després, eixe comentari t'estalviarà hores de "*què* estava pensant quan vaig escriure això?".

**📝 Els tres tipus de comentaris**

Java té tres formes d'escriure comentaris, cada una amb el seu ús:

| Tipus | Sintaxi | Ús |
| ----- | ----- | ----- |
| **D'una línia** | // text | Notes ràpides al costat del codi per a aclarir una línia o llista de tasques. |
| **De bloc** | /\* text \*/ | Explicacions llargues, algorismes complexos o desactivar temporals de codi. |
| **Javadoc** | /\*\* text \*/ | Documentació formal i estructurada de classes, mètodes i atributs. |

| *// Comentari d'una línia: "Ací va la màgia"**/\*Comentari de diverses línies:"Si això funciona, no ho toques.Si no funciona, no ho toques tampoc.Ja cridarem algú."\*/**/\*\*\* Comentari Javadoc (l'elegant):\* Serveix per a generar documentació automàtica.\* @param argumentos la llista d'arguments de la línia de comandes\* @return res, açò és void, no te n'adones?\*/* |
| :---- |

💡 **Detall pràctic:** els comentaris poden anar enmig d'una línia sense problema. System.out.println(/\* "Cuatro" \*/ "Cinco") imprimix Cinco: el comentari s'ignora i la resta de la línia seguix viva.

**🗝️ El consell que t'estalviarà hores: comenta el “per què”, no el “què”**

Este és el consell més rendible de tota la unitat:

| int i \= 0; *// Declare i amb valor 0 ← MAL: el codi ja ho diu*int i \= 0; *// Comencem des de 0 perquè l'usuari no ha polsat res ← BÉ* |
| :---- |

Escriure // Declare i amb valor 0 és com posar "Obro la porta" en una porta. El codi ja diu això. El comentari útil afegeix informació que **el codi no pot expressar**: el context, la intenció, la decisió de disseny.

* ❌ int temperatura \= 30; // temperatura val 30  
* ✅ int temperatura \= 30; // Refresca per davall de 25 segons el cap

🧠 **Truc de memòria:** si el comentari descriu la mateixa acció que veus en el codi, esborra'l. El bon comentari respon a *per què?*, mai a *què?*.

**📖 Javadoc: documentació que es genera sola**

**Javadoc** és un comentari especial (/\*\* ... \*/) que col·loques **just abans** d'una classe o d'un mètode. La ferramenta javadoc (inclosa en el JDK) ho converteix en pàgines de documentació automàtiques, iguals a les oficials de Java.

| */\*\*\* Classe que representa un alumne del curs de programació.\*\* @author Sergi Garcia\* @version 1.0\*/*public class SobreMi {*/\*\*\* Punt d'entrada del programa.\*\* @param args arguments rebuts des de la línia d'ordres\*/*public static void main(String\[\] args) { System.out.println("Em dic Sergi i m'agrada la programació"); } } |
| :---- |

**💡 Aprofundint en Javadoc: la documentació professional**

Javadoc no és un simple comentari per a tu o els teus companys de classe; és la ferramenta oficial del JDK que llegeix el teu codi i genera automàticament una pàgina web (HTML) amb la documentació tècnica del teu projecte, exactament igual que la documentació oficial de la llibreria de Java.

Quan escrius un bloc Javadoc (comença per /\*\* i acaba amb \*/), pots utilitzar etiquetes especials (tags) que comencen per @ per a estructurar la informació:

* **@param nomParametre:** Explica per a què serveix un paràmetre d'entrada que rep el mètode.

* **@return:** Descriu què torna o calcula el mètode (si no és void).

* **@author:** Indica l'autor de la classe o del codi.

* **@version:** Especifica la versió del mòdul o classe.

* **@see:** Afegeix una referència o enllaç a una altra classe o mètode relacionat.

* @throws Exception: Documenta quin tipus d'excepció o error pot llançar el mètode.

**Per què és tan útil en el teu dia a dia?**

A més de generar la web, els IDEs moderns com VS Code o IntelliJ IDEA llegeixen estos comentaris Javadoc i, en passar el cursor sobre qualsevol mètode o utilitzar l'autocompletat, et mostren una finestra emergent amb tota la documentació, paràmetres i explicacions en temps real sense necessitat d'obrir l'arxiu original.

Per a generar-la: javadoc SobreMi.java en la terminal i es crearan els .html amb la documentació. Prova-ho: és com tindre un manual d'instruccions fet per tu mateix.

💡 **Consell:** en la vida real, els comentaris Javadoc en els mètodes solen "caure" en les rúbriques. A més, en el treball, els que documenten dormen millor... i els que no, tornen al codi a les 3 de la matinada amb cara de pànic.

**🏫 Exemple guiat: documentar un programa complet**

Ho aplicarem tot a un programa real:

| */\*\* \* Classe que saluda de distintes formes. \* \* @author Alumne DAW \* @version 1.0 \*/*public class Saludo {    */\*\*     \* Mètode principal: imprimeix els dos missatges de la classe.     \*     \* @param args arguments de línia d'ordres (no usats ací)     \*/*    public static void main(String\[\] args) {        *// Primer missatge: benvinguda al curs*        System.out.println("Bienvenidos al curso de Programación");        */\*         \* Segon missatge:         \* usem println per a saltar de línia i deixar la consola neta         \*/*        System.out.println("Este curso va a molar");    }} |
| :---- |

Fixa't que cada comentari aporta alguna cosa: el Javadoc documenta l'API, el // explica la intenció i el /\* \*/ justifica una decisió de format. Cap no repeteix el que el codi ja diu.

**🎯 Mini-comprovació**

1. Quina diferència hi ha entre //, /\* \*/ i /\*\* 	\*/?  
2. Què imprimeix este programa?

| public class Comentarios {    public static void main(String\[\] args) {        *// System.out.println("Uno");*        System.out.println("Dos");        */\* System.out.println("Tres"); \*/*        System.out.println(*/\* "Cuatro" \*/* "Cinco");    }} |
| :---- |

3. És bon comentari // x \= 10?

**🔄 Respostes**

1. // és d'una línia; /\* 	\*/ és de bloc (diverses línies); /\*\* 	\*/ és Javadoc, que la ferramenta javadoc 	converteix en documentació automàtica.  
2. Imprimeix Dos i Cinco. La línia amb // i la del bloc /\* \*/ s'ignoren, i en l'última el comentari intern s'elimina, però "Cinco" segueix sent l'argument del println.  
3. No: el codi ja mostra que x  val 10\. Comenta el **per què**, no el què.

**✅ Resum en 3 frases**

1. Els comentaris són per a humans: //, /\* \*/ i /\*\* \*/, segons el que necessites.  
2. Comenta el **per què**, no el què: el codi ja diu què fa.  
3. **Javadoc** genera documentació automàtica amb @author, 	@version, @param 	i @return.

**🐛 Vocabulari ràpid**

| Terme | Idea general |
| ----- | ----- |
| **Comentari** | Text que el compilador ignora completament en generar el bytecode. |
| **Javadoc** | Comentari estructurat que genera documentació HTML automàtica. |
| **Etiqueta** | @param, @return... metadades per a descriure peces del codi. |
| **Documentació** | Explicació escrita sobre el funcionament del codi per a altres desenvolupadors. |
| **Compilador** | Traductor (javac) que ignora els comentaris i crea l'arxiu .class. |

# **6\. Arguments de línia d'ordres** {#6.-arguments-de-línia-d'ordres}

**📬 La idea en una frase**

**El paràmetre “args” del “main” és una butxaca on Java fica tot el que escrigues després del nom del teu programa en executar-lo.**

Quan escrius java MiPrograma hola mundo, eixes paraules soltes (hola, mundo) no són casuals: Java les guarda en l'array args perquè el teu programa les puga usar.

**🎒 Què és “args”?**

Recorda la firma del main:

| public static void main(String\[\] args) |
| :---- |

String\[\] args significa: "un array de cadenes de text anomenat args". Un array és una llista de coses (els veuràs a fons més avant en el curs). Ací, la llista conté **cada paraula que vas escriure després del nom de la classe en executar**.

| public class UsoDeArgumentos {    public static void main(String\[\] args) {        System.out.println("Has escrito " \+ args.length \+ " palabras:");        for (int i \= 0; i \< args.length; i++) {            System.out.println("Palabra " \+ (i \+ 1) \+ ": " \+ args\[i\]);        }    }} |
| :---- |

Si executes:

\> java UsoDeArgumentos Java mola mucho

Veuràs:

Has escrito 3 palabras:

Palabra 1: Java

Palabra 2: mola

Palabra 3: mucho  
**🔢 Com s'indexen les paraules**

En Java, les llistes comencen a comptar en 0, com quasi tot en programació:

| Índex | Valor |
| ----- | ----- |
| args\[0\] | "Java" |
| args\[1\] | "mola" |
| args\[2\] | "mucho" |
| args.length | 3 (quants n'hi ha en total) |

* args.length et diu quants arguments s'han passat (en este exemple, 3).

* args\[0\] és el primer element, args\[1\] el segon... i així successivament.

* Si executes el programa sense arguments, args.length valdrà 0 i l'array estarà buit.

⚠️ **Advertència:** compte amb l'error de l'aprenent: args\[0\] és el **primer** argument, no "l'argument número 0". El **primer** compta com a índex 0\. És com les plantes d'un edifici: la baixa és la 0\.

**🧠 Per a què serveix passar arguments?**

Passar arguments per línia d'ordres és la forma més antiga i directa de "configurar" un programa sense tocar el codi:

* **Dades d'entrada**: java Calculadora 5 3 → el teu programa rep 5 i 3\.  
* **Modes d'execució**: java App \--verbose o java App 	\--silencioso.  
* **Archius**: java Convertidor entrada.txt salida.txt.  
* **Programes reals**: els comandaments de la terminal (com git status o ls \-la) són exactament això: programes que reben arguments.

En la pràctica, l'array args apareix cada vegada que vulgues que el teu programa parle amb "el món exterior" **abans** d'arrancar. Més avant usaràs el Scanner (U02) per a demanar dades durant l'execució; els args són la via d'entrada **abans** d'executar-se.

**🏫 Exemple guiat: el programa que et saluda**

Anem a fer que el teu programa sàpia el teu nom sense preguntar-ho:

| public class SaludoPersonal {    public static void main(String\[\] args) {        if (args.length \> 0) {            System.out.println("Hola, " \+ args\[0\] \+ ". ¡Bienvenido al curso\!");        } else {            System.out.println("Hola, desconocido. ¿Olvidaste tu nombre?");        }    }} |
| :---- |

Si executes java SaludoPersonal Sergi, saluda a Sergi. Si executes java SaludoPersonal, et recorda que no vas passar arguments. El if ací és un aperitiu de les estructures de control que es voran en futures unitats.

💡 **Detall pràctic:** quan executes des de l'IDE (botó ▶), pots configurar els arguments en el menú *Run → Edit Configurations → Program arguments*. Escriu ahí Sergi 20 i polsa Run: el teu programa els rebrà igual que si els teclejaren en la terminal.

**🎯 Mini-comprovació**

1. Si executes java MiPrograma uno dos tres, quant val args.length i què conté args\[2\]?  
2. Què passa si accedeixes a args\[5\] 	quan només hi ha 3 arguments?  
3. Com saludes a la primera paraula que reba el teu programa?

**🔄 Respostes**

1. args.length val **3** 	i args\[2\] conté "tres" (els índexs comencen en 0).  
2. Reventarà amb ArrayIndexOutOfBoundsException: 	estàs demanant un element que no existix.  
3. Amb args\[0\], per exemple: 	System.out.println("Hola, " \+ 	args\[0\]);.

**✅ Resum en 3 frases**

1. args és l'array de cadenes que Java crea amb tot el que escrius després del nom de la teua classe.  
2. Els índexs comencen en **0**: args\[**0**\] 	és el primer argument i args.length diu quants n'hi ha.  
3. Els arguments són la forma de donar **dades d'entrada** a un programa abans que arranque.

**🐛 Vocabulari ràpid**

| Terme | Idea general |
| ----- | ----- |
| **Argument** | Una paraula o valor que li passes al programa en el moment d'executar-lo. |
| **args** | L'array (llista) de cadenes de text on Java guarda tots els arguments rebuts. |
| **Array** | Una estructura de dades que guarda una llista d'elements ordenats i numerats des de 0\. |
| **args.length** | La propietat que indica la quantitat total d'arguments que té l'array. |
| **Línia d'ordres** | La finestra de terminal o consola on escrius les ordres com java, per a executar programes. |

# **7\. El compilador i els seus errors** {#7.-el-compilador-i-els-seus-errors}

**📬 La idea en una frase**

**El compilador no t'odia: és un professor de llengua puntillós que marca cada coma mal posada. Aprendre a llegir els seus missatges és aprendre a programar.**

Tota la teua carrera estarà plena de missatges d'error. Els aprenents els temen; els professionals els llig com qui llig una carta. En este punt aprendràs a entendre què et diu javac (i per què Java és tan puntillós).

**🔍 Compilar ≠ executar**

Dos moments distints, dues famílies d'errors:

| Moment | Comandament | Què ocorre |
| ----- | ----- | ----- |
| **Compilar** | javac MiPrograma.java | El compilador tradueix el teu codi a bytecode. Si hi ha errors de sintaxi, es queixa ací. |
| **Executar** | java MiPrograma | La JVM executa el bytecode. Ací poden aparéixer errors de runtime (en temps d'execució). |

El teu codi (.java) \--javac--\> bytecode (.class) \--java--\> eixida

(errors de compilació ací) (errors d'execució ací)

* **Errors de compilació**: el compilador detecta que has escrit malament alguna cosa. Et diu la **línia exacta** i el motiu. No es genera el .class.  
* **Errors d'execució (runtime)**: el programa compila, 	però rebenta en córrer (per exemple, ArrayIndexOutOfBoundsException del punt 6).  
* **Errors de lògica**: tot "funciona", però el resultat és incorrecte. El més perillós: ni el compilador ni el runtime t'avisen. Ací entra el depurador del punt 4\.

**😤 L'error de l'aprenent: 4 errors en un programa**

Este codi està fatal. Troba els 4 errors abans de mirar la solució:

| Public class Calculadora public static void main(string\[\] args) { System.out.println("Suma: " \+ 5 \+ 3) System.out.println("Resta: " \+ (5 \- 3)); } } |
| :---- |

**🔄 Els 4 errors**

1. Public hauria de ser	**\`public\`** (minúscula). Java és sensible a les majúscules.  
2. Falta **\`{\`** després de Calculadora. 	La classe necessita la seua clau d'obertura.  
3. string\[\] args hauria de 	ser **\`String\[\] 	args\`** (la S majúscula importa: String 	és una classe, no existix string).  
4. Falta el **\`;\`** al final de la primera línia del println.

Java és molt puntillós, com un professor de llengua amb les comes: public, String i System comencen en majúscula o majúscules concretes, i cada frase acaba en ;.

🔎 Com llegir un missatge d'error de javac

Quan alguna cosa no compila, javac et mostra alguna cosa com:

Calculadora.java:3: error: ';' expected

System.out.println("Suma: " \+ 5 \+ 3\)

^

1 error

Tres dades clau:

1. **“Calculadora.java:3\`**”→ l'arxiu i la **línia** on està el problema (mira la ^).  
2. **“error: ';' expected”** → el *què*: esperava un 	punt i coma.  
3. **El “^”** → el punt exacte on s'ha atascat.

💡 **Consell:** l'error sol trobar-se en la línia marcada, però de vegades és l'**anterior**: si falta un { o un ;, javac de vegades se n'adona una línia més tard. Comença mirant la línia del ^ i, si no, puja una.

**🚨 Errors típics de l'aprenent (i el seu remei)**

| Error | Missatge típic | Remei |
| ----- | ----- | ----- |
| **Public en lloc de public** | class, interface, or enum expected | Els noms i paraules clau en Java són exactes: public, class, String, System. |
| **Falta ;** | ';' expected | Tota instrucció o orde en Java ha d'acabar obligatòriament en ;. |
| **Falta { o }** | reached end of file while parsing o class, interface... | Comprova que cada clau d'obertura { tinga la seua corresponent clau de tancament }. |
| **string en lloc de String** | cannot find symbol | String és una classe i sempre s'escriu amb la S inicial majúscula. |
| **Nom de classe diferent de l'arxiu** | class X is public, should be declared in a file named X.java | La classe public ha de tindre exactament el mateix nom que l'arxiu .java (respectant majúscules i minúscules). |
| **system en lloc de System** | cannot find symbol: variable system | System va amb S majúscula, mentre que out i println van en minúscules. |

🧠 **Truc de memòria:** els noms de les *classes* (String, System, Scanner...) comencen en majúscula; els noms de *variables i mètodes* (out, println, main) en minúscula. Quan dubtes, mira com ho va escriure Java.

**🧩 EL LÍO: el codi remenat**

El teu cap ha deixat este codi fet un desastre. Les línies estan barrejades. Eres capaç d'ordenar-les perquè siga un programa Java vàlid que imprimisca "La suma es: 8"?

System.out.println("La suma es: " \+ (a \+ b));

int a \= 5;

public class CalculoLioso {

System.out.println("Calculando...");

public static void main(String\[\] args) {

int b \= 3;

**Pista**: busca primer on comença la classe i el mètode main.

**🔄 Solució**

| public class CalculoLioso {    public static void main(String\[\] args) {        int a \= 5;        int b \= 3;        System.out.println("Calculando...");        System.out.println("La suma es: " \+ (a \+ b));    }} |
| :---- |

La classe és el contenidor, el main és la porta d'entrada, les instruccions van dins del main, en orde. Com una recepta: els ingredients es declaren abans d'usar-se.

**🎯 Mini-comprovació**

1. Què significa Calculadora.java:3: error: ';' expected?  
2. Per què Public (amb P majúscula) dona error?  
3. Quina diferència hi ha entre un error de compilació i un de 	lògica?

**🔄 Respostes**

1. Que en l'arxiu Calculadora.java, en la línia 3, javac esperava un ; i no el va trobar (mira la ^).  
2. Perquè Java és sensible a les majúscules: la paraula 	reservada és public, en minúscula exacta.  
3. El de compilació impedeix generar el .class (ho detecta javac). El de lògica compila i executa, però el resultat és incorrecte: ningú t'avisa, només el depurador (o el 	sentit comú).

**✅ Resum en 3 frases**

1. Compilar (javac) i 	executar (java) són moments distints amb errors distints.  
2. El missatge d'error et diu **archiu, línia i motiu**: aprén a llegir-lo en lloc de témer-lo.  
3. Les fallades clàssiques (majúscules, ;, {}, nom de la classe) es corregeixen amb un cop d'ull... una vegada saps què mirar.

**🐛 Vocabulari ràpid**

| Terme | Idea general |
| ----- | ----- |
| **Compilar** | Traduir el codi font (.java) a bytecode (.class) que entén la JVM. |
| **Error de compilació** | El compilador detecta una fallada de sintaxi i es nega a generar el bytecode. |
| **Error de runtime** | El programa compila bé, però falla o es bloqueja durant l'execució. |
| **Error de lògica** | El programa s'executa sense errors, però el resultat no és el que s'esperava. |
| **Sensible a majúscules** | Java distingeix majúscules de minúscules (Case-sensitive): “Public” no es lo mateix que “public”. |

# **8\. L'IDE i el teu flux de treball** {#8.-l'ide-i-el-teu-flux-de-treball}

**📬 La idea en una frase**

**L'IDE (Entorn de Desenrotllament Integrat) és la teua navalla suïssa: editor, compilador, executor i depurador, tot en una sola finestra.**

En el punt 2 vas instal·lar el JDK i li vas fer una primera ullada a l'IDE/Editor. Ara vas a muntar el teu flux de treball diari: com s'organitza un projecte, com crear classes, executar-les, depurar-les i moure't amb dreceres en VS Code sense tocar el ratolí.

**🗂️ Anatomia d'un projecte en VS Code**

Quan crees un projecte Java en VS Code, l'extensió et genera una estructura de carpetes neta. Les importants són:

*MiPrimerCurso/*

*├── src/ ← EL TEU codi (.java) viu ací*

*│   └── HolaMundo.java*

*└── bin/ (o target) ← el bytecode (.class) compilat automàticament*

    *└── HolaMundo.class*

* src (source): Els teus arxius .java. És el que tu escrius i el que es puja a Git.

* bin / target: El que genera el compilador en segon pla. No es toca a mà i normalment ni es puja a Git.

**💡 Detall pràctic:** No edites mai els .class. Si esborres la carpeta bin, VS Code la regenerarà en compilar en segon pla. El teu codi font en src és l'única font de veritat.

**🔁 El cicle de treball (el teu nou bucle de vida)**

Programar és un bucle de quatre passos que repetiràs milions de vegades:

1. Editar: Escrius o canvies codi en src.

2. Compilar: VS Code compila automàticament en guardar (Ctrl \+ S). Ací es marquen els errors de sintaxi en roig.

3. Executar: Polses Ctrl \+ F5 (o el botó ▶ Run). Ací es detecten els errors de runtime.

4. Depurar: Si la lògica falla, polses F5 (o Debug) i comença el detectiu del punt 4\.

***Editar \-\> Compilar (Auto) \-\> Executar \-\> Depurar \-\> (Tornar a Editar)***

**⚠️ Advertència:** Executar sense depurar (Ctrl \+ F5) i en mode depuració (F5) NO són el mateix. Executar normal ignora els breakpoints; Debug els respecta. Si poses un punt roig i executes sense depurar, el programa no es detindrà.

⌨️ Les dreceres de VS Code que **et** faran paréixer un pro

Deixa el ratolí en pau. Estes són les dreceres essencials per a Java en VS Code:

| Drecera (Windows) | Acció |
| ----- | ----- |
| main \+ Tab (o psvm) | Escriu l'esquelet public static void main(String\[\] args) {} |
| sysout \+ Tab (o sout) | Escriu System.out.println() |
| Ctrl \+ F5 | Executar (Run Without Debugging) |
| F5 | Executar en mode depuració (Start Debugging) |
| F10 / F11 | Step Over / Step Into (depurador) |
| Ctrl \+ / | Comentar / descomentar la línia seleccionada |
| Shift \+ Alt \+ ↓ | Duplicar la línia cap avall |
| F12 | Anar a la definició (Go to Definition) |
| F2 | Canviar el nom d'un símbol/variable en tot el projecte (Rename) |

**🧠 Truc de memòria**: main i sysout són els dos snippets que més escriuràs en el curs. Escrius eixes lletres, premis Tab i VS Code te les ompli de golpe.

**🧩 Autocompletat (IntelliSense): el teu company silenciós**

L'extensió de Java mentre escrius et suggereix opcions, ressalta errors en roig abans d'executar i pot arreglar problemes amb un clic (la icona de la bombeta 💡 o Ctrl \+ .):

* Escrius Syste i VS Code t'ofereix System (amb la S majúscula que tant costa al principi).

* Et falta una variable o importació i la bombeta 💡 t'ofereix "Import 'java.util.Scanner'" o la correcció ràpida.

* Selecciones una variable, premis F2 i li canvies el nom: VS Code actualitza totes les seues aparicions en el projecte (això és refactoritzar).

**L'autocompletat no és trampa**: és la raó per la qual la gent usa VS Code o un IDE en lloc d'un bloc de notes. El teu codi ix amb menys errors tontos perquè l'editor et corregeix mentre penses.

**🏫 Exemple guiat: de zero a executar en 60 segons en VS Code**

1. **Nou projecte:** Prem Ctrl \+ Shift \+ P, escriu Java: Create Java Project, tria No build tools, selecciona la carpeta de destinació i anomena el projecte MiPrimerCurso.

2. **Nova classe:** Dins de l'explorador esquerre, fes clic dret sobre la carpeta src → New File → anomena'l HolaMundo.java.

3. Escriu main i prem Tab (apareix el mètode main). Dins, escriu sysout i prem Tab:

| public class HolaMundo {    public static void main(String\[\] args) {        System.out.println("¡Hola des de VS Code\!");    }} |
| :---- |

4. Prem Ctrl \+ F5 (Run). Mira la pestanya Terminal en la part inferior de VS Code.

5. Posa un breakpoint en el println (clic a l'esquerra del número de línia), prem F5 (Debug) i observa el panell lateral esquerre de variables.

Si has arribat al pas 5 sense pànic, el teu flux de treball està muntat. A partir d'ací, el curs sencer és omplir este esquelet de contingut.

**🎯 Mini-comprovació**

1. On viuen els teus arxius .java i on els .class?

2. Quina diferència hi ha entre executar amb Ctrl \+ F5 (Run) i amb F5 (Debug)?

3. Què escriu main \+ Tab?

**🔄 Respostes**

1. Els teus .java viuen en src; els .class compilats en bin (o target). No edites els .class.

2. Ctrl \+ F5 executa normal (ignora els breakpoints); F5 executa en mode depuració (els respecta).

3. L'esquelet public static void main(String\[\] args) {} complet.

**✅ Resum en 3 frases**

1. Un projecte té src (el teu codi) i bin (bytecode): VS Code compila per tu en segon pla en guardar.

2. El teu bucle diari és editar → compilar → executar → depurar, i Run (Ctrl \+ F5) i Debug (F5) no són el mateix.

3. Les dreceres (main, sysout, F10/F11) i l'autocompletat (IntelliSense) et fan treballar més ràpid i amb menys errors.

**🐛 Vocabulari ràpid**

| Terme | Idea general |
| ----- | ----- |
| **VS Code / IDE** | Editor \+ eines de Java en una sola aplicació |
| **Projecte** | La carpeta arrel que agrupa el teu codi (src) i configuracions |
| **src** | Carpeta de codi font on escrius els teus arxius .java |
| **Refactoritzar** | Modificar o reestructurar el codi mantenint el seu comportament exactament igual |
| **Terminal / Consola** | La finestra inferior on s'imprimeix l'eixida dels teus programes |

# **9\. Repàs** {#9.-repàs}

**📬 La idea en una frase**

**En este punt no aprenem res de nou: ho convertim tot en pràctica. I, com sempre, alguna cosa no funcionarà.** 😈

**⭐ Tracta de pensar com el codi, *my friend*...**

Eres la JVM. Acaben de donar-te este programa per a executar:

| public class Misterio {    public static void main(String\[\] args) {        System.out.println("Café " \+ 1 \+ 2);        System.out.println("Café " \+ (1 \+ 2));    }} |
| :---- |

**Què imprimeixes per pantalla? Tria sàviament:**

1. **Café 3 i Café 3** → La JVM sempre suma els números, ocórrega el que ocórrega. ❌

2. **Café 12 i Café 3** → En la primera línia, en trobar text abans del \+, Java concatena d'esquerra a dreta: "Café " \+ 1 és "Café 1", i després \+ 2 dona "Café 12". En la segona línia, els parèntesis forcen la suma aritmètica primer: (1 \+ 2\) \= 3, donant "Café 3".

3. **Café 1 2 i Café 12** → Els parèntesis no existeixen per a la JVM. ❌

**🔄 Solució**

L'opció 2\. Quan un operador \+ mescla text i números, Java concatena (uneix cadenes). Tanmateix, els parèntesis (1 \+ 2\) obliguen a realitzar primer la suma aritmètica. Este és el clàssic exercici que separa els qui han treballat la unitat dels qui han dormit.

Ací tens tot el bloc revisat, reescrit i estructurat per a incloure en els teus apunts en valencià, adaptat per a **VS Code** i corregit pedagògicament:

**🔥 Fireside Chat: JDK vs JRE**

Dos veterans del café discuteixen al costat de la tassa fumejant.

* **JRE**: — Mira, jo soc l'entorn d'execució (Java Runtime Environment). Porte la JVM, les llibreries, tot el necessari per a executar Java. Sense mi, el teu .class no corre ni de broma.

* **JDK**: — Executar, executar... I qui crea el .class? Jo. Porte el compilador javac, el generador de Javadoc, la ferramenta jar... Jo soc el kit complet d'envolupament (Java Development Kit). Tu eres només la meitat servida.

* **JRE**: — Escolta, que sense mi tu eres un catàleg de ferramentes sense endollar. Compiles un programa i... on l'executes? A casa meua\!

* **JDK**: (Sarcàstic) — Ah, clar\! Com si jo no et portara dins. Quan m'instal·len a mi, tu vens inclòs. Eres com el regal que ve en el pack gran.

* **JRE**: — D'acord, però per a l'usuari final que només vol utilitzar aplicacions Java ja fetes, a qui criden? A mi\! Soc més lleuger i ocupe menys espai.

* **JDK**: — I sense compilador. O siga, un cuiner sense ganivets. Parlarem quan vulgues crear alguna cosa.

* **JRE**: (Sospir) — Sempre el mateix argument...

**💡 La lliçó:** El JDK inclou el JRE. Per a programar i crear projectes necessites el JDK. Per a executar programes en la màquina de l'usuari final, en bastaria amb el JRE. Mai et penses que són opcions excloents en un examen.

**🕵️ Qui soc?**

Endevina quin concepte de la unitat soc:

1. Tradueix el teu codi .java a bytecode. Soc un professor de llengua molt puntillós: qualsevol coma o clau mal posada m'ofén.

2. Soc la màquina de café: execute el bytecode i funcione igual en qualsevol sistema operatiu.

3. Soc la porta d'entrada del teu programa. Si canvien el meu nom, Java no troba l'inici i tot es queda a les fosques.

4. Soc el detectiu de VS Code: et deixe parar el programa on vulgues (breakpoints) i espiar les variables pas a pas.

**🔄 Respostes**

1. El compilador (javac): Tradueix .java a .class i detesta els errors de sintaxi.

2. La JVM (Java Virtual Machine): La màquina virtual que executa el bytecode igual en qualsevol plataforma.

3. El mètode main: public static void main(String\[\] args) és el punt d'inici exacte que busca Java.

4. El depurador (debugger): Amb breakpoints, Step Over (F10), Step Into (F11) i el panell de variables.

**🤬 CONRAD VS EL MÓN: "El compilador m'odia"**

**CONRAD**, el nostre compilador cascarràbies, opina sobre el clàssic dels principiants:

**CONRAD**: — ALTRA VEGADA\! Ve un alumne i em diu: "CONRAD, no compila". I jo li pregunte: "Val, què diu el missatge d'error?". I em respon: "Ah, no ho sé, no me l'he llegit". Ai, mare meua\! Et done la línia exacta, el motiu i fins i tot la fletxeta ^ assenyalant el lloc exacte, i no ho llegeixes? És com queixar-se que el menjar està calent sense mirar el plat\!

I després està el clàssic: Public amb majúscula. PER QUÈ? La paraula clau és public. En minúscula. Fa dècades que compile i encara veig Public, string amb minúscula en lloc de String... I les classes que no coincideixen amb el nom de l'arxiu\! Si ho posa clar en l'error\!

**💡 La lliçó:** Abans de plorar sobre el teclat, llegeix el missatge d'error. Arxiu, línia i motiu. El 90% dels errors dels principiants s'arreglen sols consultant eixa informació. El compilador no t'odia: t'està passant les respostes de l'examen.

**⚡ Laboratori de Tortura: el programa que no arranca**

* Duració estimada: 20–30 minuts

* Ferramenta: VS Code i un arxiu .java nou

* L'escenari: Copia este programa en un arxiu anomenat Tortura.java i fes que funcione. Té 3 errors que impedeixen que compile i 1 error de lògica que fa que el resultat siga incorrecte quan l'arregles.

| public class Tortura    public static void main(string\[\] args) {        int a \= 3;        int b \= 4;        System.out.println("La suma es: " \+ a \+ b)        System.out.println("El producto es: " \+ (a \* b));    }} |
| :---- |

**🛠️ La teua tasca**

Aconseguir que compile, que s'execute i que tota l'eixida siga correcta.

**💡 Pistes (només si et bloques)**

1. Falta alguna clau { d'obertura en la classe?

2. string va en majúscula o minúscula?

3. Falta algun punt i coma; al final de la línia de la suma?

4. Quan aconseguís executar-lo, per què la suma ix 34 en lloc de 7? Recorda com funciona l'operador \+ amb cadenes de text.

**🔄 Solució del Laboratori**

| public class Tortura {    public static void main(String\[\] args) {        int a \= 3;        int b \= 4;        System.out.println("La suma es: " \+ (a \+ b)); *// Parèntesis per a forçar la suma*        System.out.println("El producto es: " \+ (a \* b));    }} |
| :---- |

* Eixida correcta per pantalla:

| *La suma es: 7El producto es: 12* |
| :---- |

**🏆 Assoliments d'esta unitat**

| Assoliment | Com aconseguir-lo |
| ----- | ----- |
| **🏅 El Café del Matí** | Cal explicar la diferència entre JVM, JRE i JDK amb l'analogia de la cafeteria sense mirar els apunts. |
| **🏅 Primer Crit** | Executar el teu primer HolaMundo.java des de VS Code sense ajuda. |
| **🏅 Detectiu de Bugs** | Trobar els 3+1 errors del Laboratori de Tortura sense mirar la solució. |
| **🏅 Drecera Pro** | Cal escriure un programa en VS Code usant només les dreceres main \+ Tab i sysout \+ Tab. |
| **🏅 Traductor** | Documentar una classe amb Javadoc (/\*\* ... \*/) i entendre les etiquetes @param i @return. |

**🧠 Atreveix-te a pensar**

1. Sense executar, què imprimeix este programa?

| public class Misterio2 {    public static void main(String\[\] args) {        System.out.print("Uno ");        System.out.println("Dos");        System.out.print("Tres");    }} |
| :---- |

2. El salut que no saluda: En un programa on tens un mètode public static void saludo(), com fas perquè s'execute si només està definit fora de main?

3. El detectiu de VS Code: El teu programa s'executa, però imprimeix “La suma es: 34” en lloc de 7\. Quina ferramenta penses utilitzar i com ho investigues?

4. Verdader o fals: "javac i java fan el mateix: el primer és per a Windows i el segon per a Linux."

**💡 Solucions a les preguntes**

1. Imprimeix:

| Uno DosTres |
| :---- |

2. (Nota: print no afegeix salt de línia al final, però println sí. Després de "Tres" no hi ha salt).

3. Cal afegir la crida saludo(); dins del mètode main. En Java, només s'executa automàticament allò que es crida directament o indirecta des del mètode main.

4. Utilitzes el depurador (F5): Poses un breakpoint en la línia del println, avances amb F10 (Step Over) i inspectes el panell lateral de variables. Veuràs com "La suma es: " \+ 3 es converteix en "La suma es: 3" i després \+ 4 dona "La suma es: 34". La solució és afegir parèntesis (a \+ b).

5. Fals. javac és el compilador (.java → .class) i java és l'executor de la JVM. Tots dos s'utilitzen en qualsevol sistema operatiu (Windows, Linux, macOS).

**💬 Preguntes d'entrevista de treball**

Preguntes reals que et farien per a programador Java júnior.

1. **"Explica'm, com si jo fora la teua iaia, la 	diferència entre JDK, JRE i JVM."**  
2. **"Què és el mètode \`main\` i per què té eixa firma 	exacta?"**  
3. **"Un programa compila però fa el que no ha de fer. 	Quin és el teu procés per a arreglar-lo?"**  
4. **"Què és un array i què passa si accedeixes a un 	índex que no existix?"**  
5. **"Com li passes dades a un programa Java sense que et 	les demane per teclat?"**

**🤷 No hi ha preguntes tontes**

❓ **Puc escriure Java en un bloc de notes o necessite sí o sí un IDE?**

Pots, i de fet és un bon exercici: notepad MiPrograma.java, javac MiPrograma.java, java MiPrograma. Però l'IDE t'estalvia errors tontos amb l'autocompletat i et dona el depurador. Els pros usen IDE; els masoquistes, bloc de notes.

❓ **Per què el primer \`println\` d'Hola Món tenia "args" si no l'use?**

String\[\] args és obligatori en la firma del main encara que no l'uses. Java l'espera sí o sí. És com la firma en un contracte: està encara que no s'execute eixa clàusula. En el punt 6 vas vore com usar-lo.

❓ **Java i JavaScript són cosins?**

No, ni tan sols són del mateix planeta. Java és a JavaScript com un gos és a un gosset calent. El nom va ser una estratègia de màrqueting de Netscape per a muntar-se en el boom de Java.

**🎬 Poscrèdits**

El programador aprenent acaba el seu primer programa, el compila i l'executa. Tot perfecte. Llavors s'acosta CONRAD, el compilador cascarrabias, amb cara de pocs amics i una tassa humejant a la mà.

**CONRAD:** — Molt bonic l'Hola Món. I ara què? Vas a imprimir text tota la vida? Els programes de veritat *guarden* dades, *calculem* i *decidixen*. Sense variables, sense tipus, sense operadors... això és un triler de cartes.

**Aprenent:** — I això quan s'aprén?

**CONRAD:** — *fa un glop* La pròxima parada. Ja et veig declarant el teu primer int... i cometent el teu primer error de tipus. Espera'm, que jo estaré ahí per a riure.

L’aprenent guarda el seu projecte, tanca l'IDE i sent que això només acaba de començar.

