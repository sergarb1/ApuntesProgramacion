---
title: 01 — Variables i tipus primitius
description: Les caixes del magatzem de la memòria i els seus 8 tamanys distints 📦
---

<p><small>Les caixes del magatzem de la memòria i els seus 8 tamanys distints 📦</small></p>

> 🗺️ **Estàs en:** 🔤 **U02 · Variables, Tipus i Operadors** → 01 · Variables i tipus primitius

---

## 📬 La idea en una frase

> **Les variables són caixes etiquetades en la memòria de l'ordinador, i Java et oferix 8 tamanys de caixa (els tipus primitius) perquè tries el que millor li va a cada dada.**

En la U01 el teu programa només cridava text per la consola. Ara li donaràs memòria: guardarà la teua edat, el teu nom, la teua nota mitjana i fins i tot si tens gana. I per a triar bé la caixa de cada dada, primer has de conéixer el catàleg del magatzem.

---

## 📦 La declaració: la recepta d'una caixa

Per a crear una caixa (una variable) li dius a Java tres coses: el **tipus** (tamany i forma de la caixa), el **nom** (l'etiqueta) i el **valor** (el que fiques dins). La recepta és:

```java
tipo nombreDeLaCaja = valorQueMetoDentro;
```

Exemples reals:

```java
int edad = 25;              // Caixa etiquetada "edad" amb un 25 dins
double precio = 19.99;      // Caixa amb decimals
String nombre = "María";    // Caixa màgica que guarda text
boolean hambre = true;      // Caixa de vertader/fals (ara mateix: true)
```

> 💡 **Detall pràctic:** les variables es diuen així perquè... ¡varien! Pots canviar el seu contingut quan vulgues. `int edad = 25;` i, el dia del teu aniversari, `edad = 26;`. L'etiqueta és la mateixa, el contingut canvia.

---

## 🏷️ Les regles de nomenclatura (o com no ficar-la)

Java és tiquismiquis amb els noms de les caixes. Estes són les regles d'or:

- Poden portar lletres, números, `_` i `$`. **Res d'espais**. (Java admet molts caràcters Unicode, però per convenció i per a evitar embolics s'usen lletres ASCII: evita `ñ`, `ç` o accents en els noms.)
- **No poden començar amb número.** `1numero` és il·legal; `numero1` és legal. Com les matrícules dels cotxes.
- **Les majúscules importen**: `edad`, `Edad` i `EDAD` són tres caixes distintes. Com etiquetar "Zapatos", "zapatos" i "ZAPATOS".
- **No uses paraules reservades**: `int`, `class`, `if`, `while`... són de Java, no teues.
- Usa **camelCase** per a les variables: `miVariableEjemplo`. Com un camell, amb gepa enmig.

```java
// ✅ Correcte
int numeroAlumnos = 30;
double notaMedia = 7.5;

// ❌ Incorrecte
int 1numero = 30;        // comença per número
double nota media = 7.5; // espai en el nom
int class = 30;          // paraula reservada
```

---

## 📐 Els 8 primitius: el catàleg de caixes

Java té **8 tipus primitius**. Pensa en ells com caixes de distints tamanys al teu magatzem:

| Tipus | Mida | El que cap | Analogia |
|---|---|---|---|
| `byte` | 8 bits | -128 a 127 | Caixa de llumins |
| `short` | 16 bits | -32.768 a 32.767 | Caixa de sabates |
| `int` | 32 bits | -2.147M a 2.147M | Caixa de mudança (la que més usaràs) |
| `long` | 64 bits | -9 trilions a +9 trilions | Contenidor de vaixell |
| `float` | 32 bits | Decimals de precisió simple | Got d'aigua |
| `double` | 64 bits | Decimals de precisió doble | Cubell d'aigua |
| `char` | 16 bits | Un sol caràcter Unicode | Una lletra en una caixa de sabates |
| `boolean` | 1 bit | `true` o `false` | Interruptor de llum |

I així es declaren cada un:

```java
byte nivel = 100;
short poblacion = 30000;
int habitantes = 1500000;           // El más usado
long distancia = 384400000L;        // La L al final es obligatoria
float precio = 12.99f;              // La f al final es obligatoria
double pi = 3.14159265359;
char letra = 'A';                   // Comillas SIMPLES para char
boolean esJavaDivertido = true;     // Esto es opinable
```

> 📝 **Nota:** usa `int` per a quasi tot el numèric enter. Només passa a `long` si vas a contar estrelles. Usa `double` per a decimals, a menys que estalviar memòria siga el teu fetitxe.

---

## 🎒 Quina caixa use per a cada dada?

Triar el tipus correcte és com triar la maleta del viatge: ni un microbus per a dos persones, ni un Smart per a una família de cinc. La pràctica fa el mestre:

- **`int`**: edats, comptadors, puntuacions, quasi tot enter.
- **`double`**: preus, notes mitjanes, temperatures, qualsevol decimal.
- **`boolean`**: respostes de sí/no: "ha aprovat?", "hi ha connexió?".
- **`char`**: una sola lletra: la inicial d'un nom, una qualificació 'A', 'B', 'C'.
- **`long`**: nombres astronòmics, mil·lisegons, identificadors gegants.

> ⚠️ **Advertència:** quan dubtes entre `int` i `double`, pensa: *esta dada pot portar decimals?* Si sí → `double`. Si no → `int`. Simple.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** abans d'escriure codi, fes-te sempre la mateixa pregunta: *quina mena de dada és això i en quina caixa cap?* El 90% dels errors d'esta unitat vénen de ficar malament la caixa.

**Exercici: El guarda del magatzem**

Eres el guarda d'un magatzem de dades. Et donen estes declaracions i et pregunten: **quines compilen i quines no?** Marca les que fallarien i per què:

```java
int a = 150;                 // ¿compila?
int b = 10.5;                // ¿compila?
double c = 7;                // ¿compila?
char d = "A";                // ¿compila?
boolean e = "true";          // ¿compila?
long f = 3000000000L;        // ¿compila?
int g = 3000000000;          // ¿compila?
```

<details>
<summary>🔄 Solució</summary>

- `int a = 150;` ✅ Compila. Un 150 cap de sobres en un `int`.
- `int b = 10.5;` ❌ **No compila.** Un `int` no admet decimals; això seria un `double`.
- `double c = 7;` ✅ Compila. Un enter cap dins d'un `double` (conversió implícita, ho veuràs en el punt 5).
- `char d = "A";` ❌ **No compila.** `char` usa cometes simples `'A'`; les dobles són per a `String`.
- `boolean e = "true";` ❌ **No compila.** `true` sense cometes és el booleà; `"true"` amb cometes és text.
- `long f = 3000000000L;` ✅ Compila. La `L` li diu a Java "això és un long, no un int".
- `int g = 3000000000;` ❌ **No compila.** Tres mil milions no cap en un `int` (tope: 2.147M). Seria un `long`.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quin tamany de caixa usaríes per a guardar el nombre d'habitants de la Terra (més de 8.000 milions)?
2. Per què `char letra = "A";` no compila i `char letra = 'A';` sí?
3. Quina és la diferència entre `float` i `double` en una frase?
4. Per què `Edad`, `edad` i `EDAD` són tres variables distintes?

<details>
<summary>🔄 Respostes</summary>

1. **`long`** — més de 2.147 milions no cap en un `int`.
2. Perquè `char` va amb **cometes simples** `'A'` (un sol caràcter); les cometes dobles són per a `String`.
3. El `double` té **doble precisió** (64 bits) i el `float` precisió simple (32 bits): el `double` guarda més decimals exactes.
4. Perquè **les majúscules importen**: cada variació del nom és una caixa distinta al magatzem.

</details>

---

## ✅ Resum en 3 frases

1. Una variable és una **caixa etiquetada** en memòria: tipus (tamany), nom (etiqueta) i valor (contingut).
2. Java té **8 tipus primitius**, i triar el correcte (normalment `int` o `double`) és mitat examen.
3. Les regles de nomenclatura (camelCase, sense espais, sense paraules reservades, majúscules que importen) t'estalvien errors de compilació tontos.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Variable | Caixa etiquetada on guardes una dada que pot canviar |
> | Tipus primitiu | Un dels 8 tipus bàsics de dades de Java |
> | Declarar | Crear la variable: `tipo nombre = valor;` |
> | Literal | El valor escrit tal qual: `25`, `"María"`, `true` |
> | camelCase | Convenció de noms: `miVariableEjemplo` |
> | Paraula reservada | Paraula de Java que no pots usar com a nom |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/02-variables-tipos-operadores) · **Anterior:** [Índex de la unitat](/ApuntesProgramacion/va/02-variables-tipos-operadores) · **Següent:** [02 · String, constants i final](/ApuntesProgramacion/va/02-variables-tipos-operadores/02-string-constantes-final)