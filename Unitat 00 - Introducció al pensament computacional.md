

**LLICÈNCIA**

**Reconeixement- No comercial \- CompartirIgual** (BY-NC-SA): No es permet un ús comercial de l'obra original ni de les possibles obres derivades, la distribució de les quals s'ha de fer amb una llicència igual a la que regula l'obra original.

**ÍNDEX**

**[0\. Introducció	3](#0.-introducció)**

[**1\. Programar no és memoritzar codi 🧠💻	4**](#1.-programar-no-és-memoritzar-codi-🧠💻)

[**2\. Primer pensem, després escrivim 📝➡️💻	6**](#2.-primer-pensem,-després-escrivim-📝➡️💻)

[**3\. Dividir un problema enorme (La descomposició) 🧱⛏️	8**](#3.-dividir-un-problema-enorme-\(la-descomposició\)-🧱⛏️)

[**4\. I si m'equivoque? (Debugging, casos límit i el protocol de pau) 🚨🕵️‍♂️	10**](#4.-i-si-m'equivoque?-\(debugging,-casos-límit-i-el-protocol-de-pau\)-🚨🕵️‍♂️)

[**5\. Aprendre programació és practicar (Menys mirar, més intentar) 🏊‍♂️🏋️‍♂️	12**](#5.-aprendre-programació-és-practicar-\(menys-mirar,-més-intentar\)-🏊‍♂️🏋️‍♂️)

[**6\. Com utilitzarem la IA (L'assistent, no el teu oracle) 🤖🧠	13**](#6.-com-utilitzarem-la-ia-\(l'assistent,-no-el-teu-oracle\)-🤖🧠)

[**7\. El meu primer problema de programació (El pont cap a Java) 🌉☕	15**](#7.-el-meu-primer-problema-de-programació-\(el-pont-cap-a-java\)-🌉☕)

[**8\. Glossari	17**](#8.-glossari)

***UNITAT 00 – Introducció al pensament computacional***

# **0\. Introducció** {#0.-introducció}

Abans d'aprendre a pensar la lògica dels nostres programes, cal fer un pas enrere i entendre **on dimonis estem i amb qui anem a parlar**.

Quan la gent diu *"estic aprenent a programar"*, en realitat està aprenent a traduir idees humanes a un format que un conjunt de circuits electrònics puga executar. Però com es produeix eixa màgia? Ací tens els conceptes clau que necessites tindre clars abans de començar. 📌

**🧠 1\. Un ordinador és extraordinàriament ràpid, però absolutament ximple**

Un ordinador no pensa, no té intuïció i no sap què vols fer. L'únic que entén la màquina a nivell de maquinari (hardware) és el codi màquina: una seqüència infinita de zeros i uns (0 i 1), conegut com a sistema binari.

* Els 0 i 1 representen, literalment, l'absència o el pas de corrent elèctric pels transistors del processador.

* Escriure un programa directament en zeros i uns és una tasca humana pràcticament impossible i dolorosa.

**🗣️ 2\. Què és un llenguatge de programació?**

Un **llenguatge de programació** és el pont o la interfície entre el teu cervell i el processador. És un conjunt de regles, paraules clau i estructures creades per humans que ens permeten escriure instruccions de manera entenedora per a nosaltres, però que es poden traduir fàcilment a zeros i uns.

Hi ha dos grans tipus de llenguatges segons la seua proximitat a la màquina:

* **Llenguatges de baix nivell (ex: Assemblador):** Estan molt a prop del maquinari. Són ultra-ràpids, però extremadament difícils d'escriure i mantindre per a un humà.  
* **Llenguatges d'alt nivell (ex: Java, Python, C\#):** Utilitzen paraules en anglés (if, while, class), estructures lògiques complexes i símbols matemàtics. Són fàcils de llegir i escriure per a nosaltres, però la màquina no els entén directament.

**🔄 3\. El traductor: Compiladors vs. Intèrprets**

Com que l'ordinador només entén binari i nosaltres escrivim en un llenguatge d'alt nivell, **necessitem un traductor**. Ací és on apareix la gran diferència en com s'executa el codi:

\[📝 Codi Font (Java)\] ──► \[⚙️ TRADUCTOR / Compilador\] ──► \[🤖 Codi Màquina (0s i 1s)\]

1. **Compilador (El traductor de llibres):** Agafa TOT el teu fitxer de codi font, el revisa sencer, comprova que no hi haja errors de sintaxi i genera un fitxer executable independent. Si hi ha un sol error, no tradueix res fins que ho corregeixes. *(Exemple: C, C++).*  
2. **Intèrpret (El traductor en directe):** Llegeix el teu codi línia per línia i l'executa a l'acte. Si troba un error a la línia 50, executarà les primeres 49 línies i es pararà exactament en la 50\. *(Exemple: Python, JavaScript).*

> ☕ **I Java?** Java utilitza un sistema híbrid molt especial. Primer es **compila** a un codi intermedi anomenat *Bytecode*, i després una "màquina virtual" (**JVM \- Java Virtual Machine**) l'**interpreta** en qualsevol ordinador (Windows, Mac, Linux). Per això es diu que Java és *"Escriu-ho una vegada, executa-ho on vulgues"*.

**🔤 4\. Conceptes clau que escoltaràs cada dia**

Per a no sonar com un estranger quan parlem del mòdul, guarda estos 5 termes al teu diccionari personal:

* **Codi Font (Source Code):** El text pla que tu escrius en el llenguatge de programació (els teus fitxers .java).

* **Sintaxi:** Les regles gramaticals del llenguatge. Si en valencià no pots dir *"casa la roja és"*, en Java no pots oblidar un punt i coma ; o una clau {}. Si et saltes la sintaxi, el compilador es queixarà en roig.  
* **IDE (Entorn de Desenvolupament Integrat):** El programa o la "fàbrica" que utilitzem per a escriure codi (com VS Code, Eclipse o NetBeans). És com un processador de textos (estil Word), però dissenyat per a programar: remarca colors, avisa d'errors i té el botó d'executar integrat.  
* **Algorisme:** La seqüència lògica i finita de passos que resol un problema (independentment del llenguatge que uses).  
* **Execució / Run:** El moment en què li dius a l'ordinador *"Agafa el meu programa i fes el que posa ací"*.

**💡 Idea clau per a recordar**

> **El llenguatge de programació és només l'idioma de la conversa.**

> Aprendre la sintaxi de Java és fàcil (és com aprendre vocabulari). El repte real d'este curs no és memoritzar el diccionari, sinó saber **què dimonis vols dir-li a la màquina** per a resoldre un problema. I d'això tracta la resta d'esta Unitat 0\! 🚀

# **1\. Programar no és memoritzar codi 🧠💻** {#1.-programar-no-és-memoritzar-codi-🧠💻}

Molt sovint, quan algú s'enfronta per primera vegada a una assignatura de programació, té la idea preconcebuda que aprendre a programar és com aprendre un idioma estranger a l'antiga: memoritzar una llista infinita de paraules estranyes, regles de sintaxi i fórmules màgiques en anglés. 🧙‍♂️✨

Res més lluny de la realitat. **Aprendre a programar no és un exercici de memòria; és un entrenament per a resoldre problemes.** El llenguatge de programació (en el nostre cas, Java) és simplement l'eina final que utilitzem per a comunicar la nostra solució a la màquina, de la mateixa manera que un fuster utilitza un martell o una serra per a construir una taula. 🔨🪑

**La trampa del "Miratge de la Comprensió" 🧟‍♂️💬**

Un dels fenòmens més habituals en l'estudi a distància és el que en psicologia de l'aprenentatge s'anomena **la il·lusió de competència** o el **miratge de la comprensió**.

Segurament et sonarà esta pel·lícula:

1. Obris la plataforma virtual, lliges un exemple de codi explicat pas a pas o veus un vídeo on el professor resol un exercici. 🎬  
2. Mentrestant ho veus, ho trobes tot lògic, fluid i clar. Dius per a tu mateix/a: *«És clar, quin geni\! Té tot el sentit del món\! Ho he entés a la primera»*. 😎  
3. Tanques el vídeo, obris un fitxer buit per a fer un exercici similar i... **et quedes mirant el parpelleig del cursor en blanc durant 20 minuts.** 😳⏱️

Per què passa açò? És un problema de capacitat? Que va, de cap de les maneres\! Passa perquè el teu cervell utilitza dos circuits completament diferents segons la tasca:

* **El circuit del Reconeixement (Mode Passiu / "Sofà i Manta" 🛋️):** Quan lliges o veus un exercici resolt, el teu cervell només ha de verificar que la lògica que un altre ha creat té sentit. És una tasca molt lleugera que requereix quasi zero esforços mentals.  
* **El circuit de la Generació (Mode Actiu / "Gimnàs Mental" 🏋️‍♂️):** Quan t'enfrontes a la pantalla en blanc, el teu cervell ha de crear l'estructura des de zero, prendre decisions, recordar la lògica i traduir-la. Això requereix un esforç cognitiu intens.

> 🎹 **L'analogia:** Confondre "entendre un exemple de codi" amb "saber programar" és com creure que saps tocar el piano només perquè t'agrada molt la música clàssica i entens quan algú desafina. Escoltar no et fa pianista\!

**La pantalla en blanc és el teu hàbitat natural 🏔️🧘‍♀️**

Quan t'assegues a estudiar i et trobes bloquejat/ada davant de la pantalla en blanc, la teua primera reacció pot ser de pànic: *«Mare meua, açò no és per a mi, soc inútil, no se m'ocorre res\!»* 😱

Cal que canvies el xip des del primer dia: **el bloqueig davant de la pantalla en blanc no és un senyal de fracàs, és l'estat natural de qualsevol programador.**

Programar consisteix, precisament, a transformar eixa incertesa inicial en un conjunt d'instruccions ordenades. La diferència entre una persona que està aprenent i un professional de Google no és que el professional sàpia la solució immediatament, sinó que té un mètode de treball per a eixir d'eixe bloqueig sense tirar el portàtil per la finestra. 🪟💻❌

**Com evitar la farsa de "Copiar i Apegar" (*Tutorial Hell*) 🕳️🔄**

A distància, quan ens quedem bloquejats, la temptació de la "via ràpida" és enorme: buscar la solució exacta a internet, copiar-la, apegar-la en el nostre projecte, veure que s'executa i dir: *«Ja ho tinc fet, soc un crack\!»* 🤡

Això només genera una falsa sensació de progrés. Si no has passat pel procés mental de patir i pensar la solució, **no has aprés res**. La pròxima vegada que el problema canvie una miqueta, et tornaràs a quedar igual de bloquejat/ada.

Per a evitar esta trampa, aplicarem una norma molt simple durant tot el curs:

1. **La Regla de la Pantalla Tapada 🙈:** Si mires la solució d'un exercici o un exemple del temari, tanca la finestra o tapa el codi abans d'intentar escriure el teu.  
2. **Res de miraculoses inspeccions visuals:** Si et penses que t'has encallat, deixa un poc de marge a la teua ment per a buscar l'eixida, revisa només la línia concreta que et fa dubtar i torna a tapar la solució immediatament.

**💡 Idea clau per a recordar**

> **Veure o llegir com es resol un problema no significa saber resoldre'l.**

> L'aprenentatge real només ocorre quan el teu cervell fa l'esforç de construir la solució per ell mateix. Menys mirar, més intentar\! 💪🎯

# **2\. Primer pensem, després escrivim 📝➡️💻** {#2.-primer-pensem,-després-escrivim-📝➡️💻}

Hi ha un error clàssic de principiant que es repeteix des de la invenció dels ordinadors: obrir l'editor de codi, posar les mans sobre el teclat i començar a escriure línies sense tindre ni la més remota idea de com es resol el problema. 🤦‍♂️💥

El resultat d'açò sol ser una mescla de frustració, errors de sintaxi en roig per tota la pantalla i la sensació que la informàtica és una mena de màgia negra reservada per a uns pocs triats. 🧙‍♂️❌

Hui volem trencar este mite amb una regla d'or que t'estalviarà centenars d'hores de dolor durant el curs: **El codi és simplement la traducció d'una solució que JA has pensat prèviament en paper.** 📄✍️

**La il·lusió de la literalitat (El teu ordinador no és endeví) 🔮🤖**

Els humans som unes màquines de "llegir entre línies". Si li dius a un amic *"Vaig a la cuina, vols aigua?"* i et respon *"Sí, per favor"*, tu entens perfectament que has d'agafar un got, obrir l'aixeta o la botella, omplir el got i portar-li-lo. No et passa pel cap anar a la cuina, agafar un doll d'aigua amb les mans i tirar-li-lo per sobre a la cara, veritat? 🌊😳

**Si li demanes això mateix a un ordinador:**

* No sap què és un got 🥃.  
* No sap quan ha de parar d'abocar aigua (inundació a la cuina 🌊).  
* Es queda bloquejat per sempre esperant que li digues si l'aigua ha de ser del temps o freda 🧊.

> 🤖 **La crua realitat:** Un ordinador no té intuïció, no té sentit comú, no té empatia i **no interpreta el que vols dir: executa exactament les instruccions que li dones**. Si el teu programa fa coses rares, no és que la màquina et tinga mania; és que tu has assumit que l'ordinador "ja t'entenia". I no, no t'entén\!

**El camí sagrat del programador 🛣️**

Per a no col·lapsar el teu cervell, el flux de treball per a resoldre qualsevol exercici ha de seguir SEMPRE esta seqüència de 4 passos:

***\[1. Problema 🧩\] ──► \[2. Pas a pas (Algorisme) 👣\] ──► \[3. Solució en paper 📄✍️\] ──► \[4. Codi 💻\]***

1. **Entendre el problema 🧩:** Llegir l'enunciat fins que sigues capaç d'explicar-li-ho a la teua àvia o al teu gat. Si no saps què et demanen, és impossible resoldre-ho\!  
2. **Pensar els passos (Algorisme) 👣:** Dissenyar la seqüència lògica de passos que solucionen el problema. Quina dada va primer? Què he de calcular? Quina decisió he de prendre?  
3. **Escriure la solució en paper 📄:** Usar el teu propi idioma (valencià/castellà) o un dibuix per a comprovar que la lògica té sentit.  
4. **Traduir a Java 💻:** Obris l'ordinador. Ara només has de preocupar-te per la sintaxi (punts i comes ;, claus {}, etc.), perquè la lògica ja la tens resolta en el paper.

Si intentes fer el Pas 2 i el Pas 4 al mateix temps directament al teclat, la teua "RAM mental" es col·lapsarà i apareixerà el bloqueig. 🤯❌

**🧪 Exercici pràctic: El test del Robot Literal 🤖🥪**

Per a experimentar açò en la teua pròpia pell sense tocar cap ordinador, anem a fer un experiment mental.

Imagina que has de donar instruccions a un **Robot Literal** (un ésser que no té sentit comú i ho fa TOT al peu de la lletra) per a una d'estes tasques quotidianes:

* ☕ **Fer un café en cafetera de degoteig.**  
* 🎒 **Preparar la motxilla per a anar a classe.**  
* 🍳 **Fer una truita de creïlles.**  
* 🚗 **Canviar una roda picada d'un cotxe.**  
* 🛒 **Fer una compra en una botiga en línia.**

#### **Què passa quan intentem escriure les instruccions? ⚠️**

Si escrius: *"Agafa el café i posa'l a la cafetera"*, el Robot Literal agafarà el paquet de café TANCAT i el tirarà damunt de la cafetera sense obrir-lo. 📦💥

Perquè el Robot ho faça bé, has de desglossar-ho així:

1. Agafa el paquet de café amb la mà dreta.  
2. Amb la mà esquerra, obri la pestanya superior del paquet.  
3. Agafa la cullera... *(i així 20 passos més)*.

**Els 5 dimonis de la lògica 👿**

Quan fem este exercici, apareixen immediatament els 5 problemes que després et trobaràs programant en Java:

1. **Passos que falten 🚫:** Obrir la botella d'aigua abans d'abocar-la.  
2. **Ordre incorrecte 🔀:** Posar-te les sabates abans que els mitjons.  
3. **Ambigüitats ❓:** En comptes de dir *"Gira a la dreta"*, dir *"Gira un poc"*. Quant és "un poc"? 45 graus? 180 graus?  
4. **Informació implícita 🤫:** Donar per fet que el Robot sap que l'aigua crema.  
5. **Decisions no contemplades 🔀:** Què fa el Robot si quan agafa el café... s'ha acabat el café? *(Si no li ho has dit, el Robot es queda penjat per sempre).*

**💡 Idea clau per a recordar**

> **El codi és només l'últim pas.**

> Si no saps resoldre un problema amb un paper i un bolígraf en el teu propi idioma, és absolutament impossible que el pugues resoldre en Java davant de la pantalla. Pensa primer, tecleja després\! 🧠📄➡️⌨️

# **3\. Dividir un problema enorme (La descomposició) 🧱⛏️** {#3.-dividir-un-problema-enorme-(la-descomposició)-🧱⛏️}

Quan et trobes davant d'un exercici de programació que ocupa mig foli d'enunciat, és completament normal que la teua primera reacció siga una mescla de suor freda, ganes de tancar el portàtil i ganes de demanar un canvi de cicle a un d'art Floral. 🌿🙈

El problema no és que l'exercici siga impossible. El problema és que el teu cervell està intentant processar **TOTA la complexitat de colp**. Vol resoldre el principi, el mig, el final, la interfície, els errors i la base de dades en el mateix segon.

Veurem la tècnica secreta (i mil·lenària) que fan servir els programadors de tot el planeta per a no col·lapsar: **Divideix i venceràs.** ⚔️👑

**Com menjar-se un elefant? (A mossegades\!) 🐘🍽️**

Hi ha una pregunta clàssica de reflexió: *«Com et menges un elefant de 4 tones?»*

La resposta és evident: *«Mossegada a mossegada, lentament i sense pressa».* 🥩

En programació és exactament el mateix: **un problema gran només és una col·lecció de problemes xicotets disfressats.** Si intentes resoldre'l tot de colp, et bloquejaràs. Si el desmuntes en peces microscòpiques, veuràs que cada peça individual és tan senzilla que podries resoldre-la quasi sense pensar.

**🏛️ L'art de la descomposició en sub-blocs**

Imagina que el teu primer dia de pràctiques et diuen:

💬 *«Necessitem que faces una aplicació sencera per a gestionar una Biblioteca Municipal».*

Si intentes començar a programar això directament, la pantalla en blanc es riurà de tu a la cara. Com apliquem la descomposició? Dividint el "monstre" en blocs independents:

***\[1. Gestió d'Usuaris 👤\] 📖 ──► \[2. Catàleg de Llibres 📚\] 📍 ──► \[3. Sistema de Préstecs 🔄\] ⏱️ ──► \[4. Devolucions i Penalitzacions ⏰\] ──► \[5. Cerca i filtres 🔍\]***

Falta menys\! Ara, en lloc de pensar en "TOTA la biblioteca", ens centrem **únicament** en el sub-bloc número 3: **El sistema de préstecs**.

Però espera, que encara el podem dividir més\! Com és el procés d'un préstec pas a pas?

   **\[Préstec d'un Llibre\] 📖**

            │

            ├── 1\. Identificar l'usuari (DNI) 🆔

            ├── 2\. Identificar el llibre (Codi de barres) 🏷️

            ├── 3\. Comprovar si l'usuari té multes pendents 🚫

            ├── 4\. Comprovar si el llibre està disponible (no prestat) ❓

            ├── 5\. Registrar la data de hui i la data límit 📅

            └── 6\. Canviar l'estat del llibre a "Prestat" ✅

MIRA AIXÒ\! 🎉 La tasca gegant i aterridora de "Fer una Biblioteca" s'ha convertit en una llista d'accions tan simples com: *"Comprovar si un número és major que zero"* o *"Guardar un nom en un text"*.

**Felicitats\! Ja estàs dissenyant l'arquitectura d'un programa sense haver tocat una sola línia de Java.** 👏🥳

**⚠️ Les 3 regles d'or per a no morir en la divisió**

1. **Mai no resolgues dos sub-problemes alhora 🚫:** Si estàs fabricant la part on l'usuari posa el seu DNI, NO penses encara en com s'imprimirà el tiquet en PDF. Una cosa rere l'altra\!  
2. **Si un sub-pas encara et sembla difícil, torna a dividir-lo ✂️:** Si el pas 3 (*Comprovar multes*) et sembla embolicat, divideix-lo en: 3a) Llegir multes de l'usuari, 3b) Sumar l'import total, 3c) Si és major que 0€, bloquejar el préstec.  
3. **Celebra les xicotetes victòries 🥳:** Veure que el pas 1 (*Llegir el DNI*) funciona correctament et dona un xut de dopamina i seguretat per a afrontar el pas 2\.

**💡 Idea clau per a recordar**

> **Davant d'un problema gran, no et bloqueges: esmola la tisora.**

> Si una tasca et fa por, és simplement perquè no l'has dividit en peces prou xicotetes. Fes els passos més i més xicotets fins que siguen ridículament fàcils de resoldre. ✂️🧩🚀

# **4\. I si m'equivoque? (Debugging, casos límit i el protocol de pau) 🚨🕵️‍♂️** {#4.-i-si-m'equivoque?-(debugging,-casos-límit-i-el-protocol-de-pau)-🚨🕵️‍♂️}

Arriba el moment inevitable de la vida de qualsevol persona que programa: fas clic en el botó verd d'executar el programa i, en lloc de funcionar com la seda, la pantalla s'il·lumina amb un text roig fosc que sembla cridar-te: *«Has fracassat en la vida\! Tanca el portàtil i fuig al camp a cuidar ovelles\!»* 🐑🏃💨

Tranquil·litat\! Cal desmuntar el drama des del minut 1: **un error en el teu codi no és una vergonya, ni un atac personal, ni un senyal que no vals per a la informàtica.**

En programació, els errors tenen un nom tàctic —**bugs** 🐛— i l'art de trobar-los i corregir-los es diu **debugging** (o desinsectació mental). Aprendrem a mirar els errors als ulls sense entrar en pànic. 👁️🛑

**1\. El canvi de xip: El text roig és el teu amic 🔴🤝**

Per a un humà normal, una llum roja gegant significa: *«PERILL\! HO HAS FET MALAMENT\!»*. Però per a un programador o programadora, **el text roig és un assistent ultra-eficient que parla amb tu gratis.** 🤖💬

**Pensa-ho així:** la màquina podria simplement quedar-se en silenci, petar o dir-te un "No funciona" i deixar-te a les fosques. Però no\! Et dona una **stack trace** (la famosa muntanya de lletres rojes) que et diu dues coses or pur:

1. **Què ha passat? 🧐** *(Ex. T'has oblidat de tancar un parèntesi, o has intentat dividir per zero).*  
2. **En quina línia exacta ha passat?** 📍 (Ex. Al fitxer Main.java, a la línia 24).

> ❌ **El que veu el teu cervell en pànic:** *"FATAL ERROR SYSTEM CRASH DIE DIE DIE BLA BLA BLA"* 😱

> **🟢 El que diu el missatge en realitat:** "Hola\! A la línia 24 has escrit num2 en lloc de num1. De res, campió\!" 👍

**2\. Pensar com un programador: Provar els casos límit 🧪💣**

Un altre error de principiant és provar el programa NOMÉS amb les dades "boniques" i dir: *«Ja funciona\!»*.

Imagina este programa súper senzill:

> *"Un programa que indica si una persona és major d'edat (edat mínima: 18 anys)."*

Si el proves posant un **20**, el programa diu "Major d'edat" i tu te'n vas a fer un café tan content/a ☕. Però un bon programador té una **ment de detectiu maliciós** i es pregunta: *«I com podria fer petar jo açò?»* 😈

Cal provar SEMPRE els **casos límit (edge cases)**:

* 🎯 **El límit exacte (18 anys):** El teu programa diu que té 18 és major d'edat o s'ha quedat fora per un error de \> en lloc de \>=?  
* 🎯 **El límit inferior (17 anys):** Diu correctament que és menor?  
* 🎯 **El límit zero (0 anys):** Què fa el programa?  
* 💣 **El cas "Gamberro" (-5 anys o 200 anys):** Té sentit que algú tinga \-5 anys? O hauries de comprovar que l'edat siga un número vàlid abans de fer res?

Provar els casos que ningú s'espera és la diferència entre un programa d'aficionat i un programa professional\! 🛡️✨

**3\. 🛡️ El Protocol de Pau davant d'un Error (Abans de demanar ajuda)**

Quan estudies a distància i un exercici no ix, la temptació és anar directament al fòrum o a la IA i escriure el clàssic: *«Professor, no em funciona, ajuda\!»* 🆘❌

Per a no quedar-te bloquejat/ada i aprendre de veritat, abans d'enviar cap missatge, **has de seguir religiosament este protocol de 4 passos**:

 **\[1. Llegir l'error\] 📖 ──► \[2. Localitzar la línia\] 📍 ──► \[3. Hipòtesi dels 15 min\] ⏱️ ──► \[4. Preguntar amb dades\] 💬**

1. **Llig l'error en veu alta 📖:** No tantes els ulls. Llig la línia roja i busca les paraules clau.  
2. **Ves a la línia exacta 📍:** Obris el teu codi, ves a eixa línia i mira què dimonis hi ha escrit ahir.  
3. **La Regla dels 15 Minuts (La hipòtesi) ⏱️:** Intenta canviar UNA SOLA COSA per a provar si la teua idea d'on està la falla és correcta. Si fa 15 minuts que estàs encallat/ada en la mateixa línia... **ALÇA'T\!** 🚶‍♂️ Ves per un got d'aigua, parla amb el gat o mira per la finestra. La solució quasi sempre arriba quan la ment es relaxa.  
4. **Demana ajuda com un Pro 💬:** Si després d'això no ho resols, escriu al fòrum, però **no digues "no funciona"**. Digues:  
   * *"Estic intentant fer X..."*  
   * *"Em salta l'error Y a la línia Z..."*  
   * *"Ja he provat de canviar A i B, però continua fallant."*

**💡 Idea clau per a recordar**

> **Els errors no són el final del camí, són el mapa.**

> Un programa que falla no és un fracàs; és simplement un trencaclosques que t'està donant les pistes exactes per a ser resolt. Abraça el text roig\! 🔴🧩🔎

# **5\. Aprendre programació és practicar (Menys mirar, més intentar) 🏊‍♂️🏋️‍♂️** {#5.-aprendre-programació-és-practicar-(menys-mirar,-més-intentar)-🏊‍♂️🏋️‍♂️}

Imagina que vols aprendre a nadar. Et compres el millor llibre de natació del món, et lliges 500 pàgines sobre la física de la flotabilitat, veus 40 hores de vídeos de la Selecció Olímpica en 4K i t'estudies de memòria l'angle exacte en què el braç ha d'entrar a l'aigua. 📖🏊‍♂️

Arriba el dia de la veritat: te'n vas a la piscina, et tires a la part profunda sense haver tocat l'aigua mai... i què passa? **Te'n vas directament al fons com un sac de creïlles\!** 🌊⚓

Amb la programació passa exactament el mateix. Pots tindre els apunts més bonics de la classe, haver subratllat tot el temari amb retolador groc i tindre la col·lecció de videotutorials més gran d'Internet, però **si no tecleges i t'equivoques tu sol/a, no estàs aprenent a programar.** 🙅‍♂️💻

**La gran farsa del "Ja ho he entés" 🎭🤡**

L'estudi a distància té un perill silenciós que cal destapar des del primer dia: **confondre la lectura passiva amb l'aprenentatge real.**

Segurament viuràs esta experiència en dos passos molt clars durant les pròximes setmanes:

**🎬 Fase A: El mode espectador (*«Quina fada soc\!»*)**

Lliges un algorisme resolt als apunts o veus com el professor programa la solució d'un exercici en un vídeo. Tot sembla clar, estructurat i logicíssim. El teu cervell es relaxa, fa un xut de dopamina i dius: *«Buf, quina ganga de mòdul, ho entenc tot a la primera\!»* 😎✨

**🛑 Fase B: La prova maestra(*«Ufff... què ha passat?»*)**

Tanques la finestra de la solució, te'n vas a un fitxer completament en blanc i intentes fer un exercici idèntic però canviant les dades. De sobte, el buit absolut. El cursor parpelleja (▍), no saps si començar per la dalt o pel baix, i la ment es queda en blanc. 😳⚡

> 💡 **La lliçó de vida:** Entendre la solució d'un altre i saber construir una solució tu mateix/a **són dues habilitats cerebrals completament diferents.** La primera és facilíssima; la segona és la que es paga a les empreses d'informàtica.

**La Regla del 80/20 per a l'FP a Distància ⏳🎯**

Per a no caure en la trampa d'estar hores i hores "llegint apunts" sense avançar de veritat, durant este curs aplicarem una regla de distribució del teu temps d'estudi molt clara:

* 📖 20% del temps: Llegir la teoria / Veure el concepte.  
* 💻 80% del temps: Fer exercicis, errar, provar i picar.

Si dediques 10 hores a la setmana a este mòdul, només 2 hores haurien de ser per a llegir o veure explicacions. Les altres **8 hores han de ser de picar codi, barallar-te amb la pantalla en blanc i provar coses en el teu ordinador\!** ⌨️💥

**🏋️‍♂️ Com entrenar la "musculatura de programador"**

La programació no funciona per memorització de dades (com aprendre's les capitals d'Europa), sinó per **memòria muscular i esquemes mentals** (com anar en bicicleta o jugar a un videojoc).

Per a entrenar esta musculatura sense frustrar-te, aplica estos 3 hàbits diaris:

1. **La norma del "Fes-ho abans de mirar" 🙈:** Quan el temari propose un exercici d'exemple, NO llegisques la solució directament. Intenta fer-ho tu en paper durant 5 minuts. Encara que siga malament\! L'esforç de pensar abans de veure la resposta multiplica per deu la retenció.  
2. **El canvi d'un 5% 🔀:** Quan un exemple de la plataforma et funcione, no el tancat i passe a una altra cosa. Pregunta't: *«I si ara faig que en comptes de sumar, multiplique?»* o *«I si li demane dues dades més a l'usuari?»*. Modificar el codi que funciona és la millor manera d'entendre com està fet per dins\!  
3. **No tingues por de tancar el tutorial ❌📺:** Si per a fer un exercici necessites tindre el vídeo del professor o el PDF obert al costat mirant línia per línia el que fa, no estàs fent l'exercici: estàs fent de copista medieval. Tanca la mostra i força el teu cervell a recordar\!

**💡 Idea clau per a recordar**

> **Programar no es mira, programar es fa.**

> Menys llegir sobre la piscina i més tirar-se a l'aigua\! L'únic codi que et fa aprendre és el que escrius tu després d'haver-ho pensat. 💪🏊‍♂️⌨️

# **6\. Com utilitzarem la IA (L'assistent, no el teu oracle) 🤖🧠** {#6.-com-utilitzarem-la-ia-(l'assistent,-no-el-teu-oracle)-🤖🧠}

Siguem realistes des del primer segon: en un cicle a distància, eines com ChatGPT, Gemini o Claude estan literalment a un clic de distància a la teua pantalla. Vull dir-te que està «completament prohibit usar la intel·ligència artificial» seria com intentar posar-li portes al camp o prohibir l'ús de la calculadora a un matemàtic. 🚫🌾

Ara bé, hi ha una diferència ABISMAL entre **usar la IA per a multiplicar el teu aprenentatge** i **usar la IA per a atrofiar el teu cervell**. 🧠💥

Establirem les regles del joc perquè la IA siga el teu millor tutor privat i no la causa que penses el dia de l'examen presencial. 🎓⚠️

**🚨 El gran perill: Pagar a un altre perquè faça les teues flexions**

Imagina que t'apuntes al gimnàs perquè vols posar-te en forma, però pagues a un xicotet robot perquè faça totes les flexions, abdominals i carreres per tu. Al final del mes, el robot està en una forma increïble, però els teus músculs continuen exactament igual de fofos. 🏋️‍♂️🤖

Amb la programació passa exactament això:

* ❌ **Si li dius a la IA:** *«Fes-me l'exercici 3 de Java»*  
  La IA et donarà un codi impecable en 3 segons ⚡. L'empegaràs a la plataforma, el professor et posarà un 10... però **tu no hauràs aprés absolutament res**.  
* 💣 **El dia de l'examen presencial (sense IA):**  
  Et quedes sol/a davant del full en blanc o de l'ordinador sense internet. La teua "RAM mental" no ha entrenat mai la generació de solucions i el bloqueig serà monumental. 😳🔥

**🧪 El Mètode Pro: La IA com a Tutor Socràtic 🏛️💬**

Perquè la IA treballe PER A TU (i no EN LLOC DE TU), la clau està a **canviar la manera com li preguntes**.

Quan te n'atures en un exercici, no demanes la solució directa. Fes servir el **Prompte del Tutor Socràtic**:

> 💬 **Copia i pega este text a la IA quan te n'atures:**

> *«Hola\! Estic aprenent a programar en Java i m'he encallat en este exercici: \[pega l'enunciat\]. No em dones el codi ni la solució directa. Fes-me preguntes guiadores o dona'm una xicoteta pista perquè puga descobrir jo mateix/a on està la falla o quin pas em falta.»*

**📊 Comparativa de mentalitat:**

| ❌ Mode Vague (Te'n vas al fons) | ✅ Mode Pro (Et fas un/a màquina) |
| :---- | :---- |
| "Fes-me el codi per a calcular si un número és parell." | "Explica'm quin concepte matemàtic s'usa per a saber si un número és divisible per 2 sense donar-me el codi." |
| "On està l'error en este codi? Corregeix-ho." | "Tinc este error a la línia 12\. Dona'm una pista de quin concepte de sintaxi m'he oblidat de revisar." |
| Copiar el codi directament al teu IDE. | Llegir l'explicació de la IA, tancar la finestra del xat i escriure el codi de memòria. 🙈 |

### 

### 

### 

**🕵️‍♂️ La Regla del "No et fies ni de la teua ombra" (Al·lucinacions)**

Els models de llenguatge no són cervells que "pensen" com nosaltres; són sistemes estadístics brutals que prediuen quina és la paraula més probable que ve rere una altra. 📊🔤

Això significa una cosa fonamental: **la IA es pot inventar coses amb una seguretat i una elegància altíssima, però continua sent una “invenció”**.

* Et pot donar mètodes que no existeixen en Java 🦄.  
* Et pot proposar solucions ultra-complexos que no corresponen al teu nivell 🤯.  
* Et pot dir que un codi que està MALAMENT és correcte amb un somriure virtual 🤡.

> **La regla d'or:** Mai, MAI dones per bo un codi que t'haja suggerit una IA sense haver-lo provat, entés línia per línia i comprovat amb els teus propis casos límit. Tu eres el/la pilot; la IA és només el copilot\! 🏎️💨

💡 **Idea clau per a recordar**

> **La IA ha d'ajudar-te a pensar, mai substituir el teu pensament.**

> Utilitza la IA perquè t'explique conceptes o et dona pistes com un professor privat les 24 hores, però assegura't que l'únic que escriu el codi final siga el teu propi cervell. 💪🤖🎯

# **7\. El meu primer problema de programació (El pont cap a Java) 🌉☕** {#7.-el-meu-primer-problema-de-programació-(el-pont-cap-a-java)-🌉☕}

Hem arribat al final d'esta Unitat 0\! Després de desmuntar falsos mites, de barallar-nos amb la literalitat dels robots, d'aprendre a no tindre por al text roig i de posar a la IA a treballar com a tutor privat, arriba el moment de la veritat: **resoldre el nostre primer problema de programació real.** 🥳🎉

I el millor de tot? Anem a fer-ho **sense escriure ni una sola línia de Java encara**.

Per què? Perquè així comprovaràs en carn pròpia la gran lliçó d'esta unitat: **la part difícil de programar és pensar la lògica; traduir-ho a un llenguatge concret és només qüestió de sintaxi.** 🧠➡️⌨️

**🥊 El Repte: El Comparador de Números**

Imagina que ens demanen crear un programa súper senzill per a una aplicació:

> 📌 **Enunciat del problema:**

> *"Un programa ha de demanar dos nombres enters a l'usuari i indicar clarament per pantalla quin dels dos és el major, o si tots dos números són iguals."*

Sembla fàcil, veritat? Però abans d'obrir qualsevol editor de codi o començar a escriure parèntesis, aplicarem el nostre mètode de treball en 3 passos. 📄✍️

**🧩 Pas 1: Descomposició i Entrenament de Dades (Inputs i Outputs)**

Abans de pensar la lògica, un/a programador/a es pregunta: **Què necessite demanar (Inputs) i què he de tornar (Outputs)?**

* **📥 Dades d'entrada (Inputs):** Necessitem 2 nombres enters. Els direm el nombre A i nombre B.

* **📤 Dada d'eixida (Output):** Un missatge per pantalla que diga quin és el major o si són iguals.

**👣 Pas 2: L'Algorisme en Pseudocodi (Lògica pura)**

Ara escriurem la seqüència de passos en el nostre propi idioma, sense preocupar-nos per punts i comes o claus. Solament lògica\!

| *1\. Demanar a l'usuari el Número A.2\. Demanar a l'usuari el Número B.3\. Comparar els dos números:      \- SI el Número A és major que el Número B:         Mostrar el missatge: "El Número A és el major".            \- SI NO, SI el Número B és major que el Número A:         Mostrar el missatge: "El Número B és el major".            \- SI NO (si cap de les anteriors es compleix):         Mostrar el missatge: "Tots dos números són iguals".4\. Fi del programa.* |
| :---- |

Mira este algorisme un segon. Té tot el sentit del món, veritat? **Això JA és programar.** Qualsevol persona, siga d'Ontinyent, de Tòquio o un robot de la NASA, entén perfectament esta lògica. 🚀✨

**🧪 Pas 3: El testing de casos límit (Mentalitat de detectiu)**

Abans de donar l'algorisme per bo, anem a fer-li el nostre "control de qualitat" provant diferents valors:

* 🟢 **Cas 1 (Normal):** A \= 8, B \= 3 ──► El programa diu *"A és el major"*. (Correcte\! ✅)  
* 🟢 **Cas 2 (Invers):** A \= 2, B \= 10 ──► El programa diu *"B és el major"*. (Correcte\! ✅)  
* 🟡 **Cas Límit (Igualtat):** A \= 5, B \= 5 ──► El programa comprova la primera opció (5 \> 5? Fals), la segona (5 \> 5? Fals) i cau en el *SI NO*, dient *"Tots dos números són iguals"*. (Correcte\! ✅)

L'algorisme és 100% sòlid. Funciona en paper i funciona en el teu cap. 🏆

**🌉 I ara... On està el pont cap a Java? ☕**

Ací ve la màgia\! A partir de la pròxima unitat, l'única cosa que farem serà **aprendre com es diuen en Java eixes mateixes instruccions que tu ja has pensat**:

* Per a demanar dades, aprendre'm a usar una eina de Java anomenada Scanner.

* Per a comparar i prendre decisions (SI... SI NO), aprendre'm la paraula reservada if i else.

* Per a mostrar missatges per pantalla, usarem una instrucció anomenada System.out.println().

| 🧠 LA TEUA LÒGICA (Unitat 0\) | ☕ LA TRADUCCIÓ A JAVA (Unitat 1\) |
| ----- | ----- |
| SI el Número A és major que el B... | if (numeroA \> numeroB) { |
| Mostrar "A és el major" | System.out.println("A és el major"); |
| FI DEL SI | } |

Veus com no era tan fosc ni tan difícil? La lògica ja la tens; ara només aprendrem el "diccionari" de Java per a dir-li-ho a la màquina\! 📖☕

**💡 Idea clau per a tancar la Unitat 0**

> **Ja saps pensar com un programador/a.**

> Ara que tens el mètode, la mentalitat i el protocol per a no bloquejar-te, obrim la porta a la Unitat 1\. Benvingut/da al món real de Java\! 🚀☕💻

# **8\. Glossari** {#8.-glossari}

Per a tancar la unitat i que no et sonen a "xinés" les paraules que el professorat i el sector utilitzen diàriament, ací tens la teua guia ràpida de consulta:

**💻 Termes tècnics d'Infraestructura**

* **Codi Font (Source Code):** El text que tu escrius en el llenguatge de programació (fitxers .java). És el "manuscrit" que nosaltres podem llegir i editar.

* **Sintaxi:** Les regles gramaticals d'un llenguatge. Si et saltes un punt i coma ; o una clau {}, el compilador no entendre res i et donarà un error de sintaxi.  
* **Compilador:** El programa traductor que agafa el teu codi font i el converteix en instruccions que el processador puga executar.  
* **IDE (*Integrated Development Environment*):** El programa que utilitzes per a escriure codi (com *Eclipse*, *NetBeans* o *VS Code*). És com un "Word per a programadors", amb colors, autocompletat i botó d'executar.

**🧠 Termes de lògica i procés**

* **Algorisme:** La seqüència ordenada, finita i sense ambigüitats de passos que resol un problema.  
* **Pseudocodi:** Cal escriure la lògica d'un algorisme en el teu propi idioma (valencià/castellà) abans de traduir-lo a Java.  
* **Descomposició:** La tècnica de dividir un problema gran i complex en sub-problemes molt més xicotets i fàcils de resoldre.  
* **Abstracció:** El procés de filtrar i ignorar els detalls irrellevants d'un problema per a centrar-te només en les dades essencials.

**🐛 Termes de gestió d'errors i control**

* **Bug:** Un error o falla en la lògica o en l'execució d'un programa.  
* **Debugging (o Depuració):** El procés de buscar, aïllar i corregir un *bug* en el teu codi.  
* **Stack Trace:** La muntanya de text roig que apareix a la consola quan el programa falla. Et diu quin error hi ha hagut i en quina línia exacta ha passat.  
* **Casos límit (*Edge Cases*):** Les situacions o dades extremades (valors zero, nombres negatius, edats exactes) on el programa té més risc de fallar si no s'ha provat bé.

**🤖 Termes de treball i metodologia**

* **Miratge de la comprensió:** La falsa sensació de saber fer un exercici només per haver vist o llegit com el resolia una altra persona.  
* **Tutor Socràtic (amb IA):** Utilitzar la intel·ligència artificial fent-li preguntes perquè t'ajude a pensar, en lloc de demanar-li que et faça el codi directe.  
* **Entrada/Eixida (*Input/Output* o I/O):** Les dades que el programa rep de l'usuari (Input) i els resultats que el programa mostra per pantalla (Output).

