---
title: "03 · Paràmetres: l'entrada"
description: "Ingredients que entren per la porta: tipus, ordre, diversos alhora i la diferència entre paràmetre i argument 📥"
---

<p><small>Ingredients que entren per la porta: tipus, ordre, diversos alhora i la diferència entre paràmetre i argument 📥</small></p>

> 🗺️ **Estàs en:** 🔧 **U05 · Funcions i mètodes** → 03 · Paràmetres: l'entrada

---

## 📬 La idea en una frase

> **Els paràmetres són les variables que un mètode rep en ser cridat: tu passes valors en els parèntesis i el mètode treballa amb ells com si els haguera escrit ell mateix.**

---

## 🔁 El problema: el mètode de sempre

El nostre `saludar()` només sap dir una cosa:

```java
static void saludar() {
    System.out.println("Hola, classe!");
}
```

Si demà s'ha de saludar a "Marta", a "Youssef" i a tota la classe un a un, toca copiar i enganxar amb noms diferents... o donar-li **entrades** al mètode:

```java
public class Saludos {
    public static void saludar(String nombre) {
        System.out.println("Hola, " + nombre + "!");
    }

    public static void main(String[] args) {
        saludar("Marta");
        saludar("Youssef");
        saludar("la classe sencera");
    }
}
```

Eixida:

```
Hola, Marta!
Hola, Youssef!
Hola, la classe sencera!
```

Una sola recepta, tres plats. El mètode ja no decideix quines dades usa: **se les passes**.

---

## 📥 Com es declaren

```java
public static void saludar(String nombre) {
//                          ^^^^^^^^^^^^
//                          paràmetre: tipus + nom
```

- Cada paràmetre porta **tipus** i **nom**, com una variable: `String nombre`, `int edad`, `double nota`.
- Varios paràmetres se separen amb **coma**, i cadascú repeteix el seu tipus: `String nombre, int edad`.
- Dins del cos, els paràmetres s'usen **com variables normals**: es llegeixen, es concatenen, es comparen.

```java
public static void presentar(String nombre, int edad) {
    System.out.println(nombre + " té " + edad + " anys.");
}

public static double areaRectangulo(double base, double altura) {
    return base * altura;   // ja sabem tornar! detall en el punt 4
}
```

> 💡 **Consell:** nomena els paràmetres per el que **són**, no per l'ordre: `double base, double altura` s'entén; `double x, double y` obliga a llegir el cos cada volta.

### Paràmetre ≠ argument

Dos paraules, dos moments, la mateixa confusió eterna:

```java
//                paràmetres (en la declaració)
static int sumar(int a, int b) { return a + b; }

//               arguments (en la crida)
int r = sumar(3, 4);
```

| Moment | Nom | Exemple |
|---|---|---|
| Declarar el mètode | **Paràmetres** | `int a, int b` |
| Cridar el mètode | **Arguments** | `3, 4` |

En les converses de passadís tot el món diu "paràmetres" per als dos. En un examen o en una entrevista, la distinció et fa sonar a professional.

---

## 🎯 Regles de les entrades

1. **L'ordre importa:** `presentar("Ana", 20)` no és el mateix que `presentar(20, "Ana")` (aquesta última ni compila: Java espera un `String` primer).
2. **El nombre importa:** `sumar(3)` i `sumar(3, 4, 5)` no coincideixen amb la firma → error de compilació.
3. **El tipus ha d'encaixar:** un `int` s'accepta on es demana `double` (ampliació automàtica), però un `String` on es demana `int` és un mur:
   `incompatible types: String cannot be converted to int`.
4. Cada crida crea **les seues pròpies còpies** dels arguments: `sumar(3, 4)` i `sumar(10, 20)` viatgen amb els seus valors, sense pisar-se (per a primitius i valors simples, és així; els objectes guarden alguna sorpresa per a la U09).

> ⚠️ **Advertència:** si crides `saludar();` a un mètode que espera un `String`, no hi ha "evitació elegant": `error: method saludar in class ... cannot be applied to given types`. Els paràmetres no són opcionals.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** quan un mètode té molts paràmetres del mateix tipus (`int fila, int columna`), comet el crim de canviar l'ordre i veuràs com tot el programa comença a apuntar a la casella equivocada. Per això es nomenen bé i es passen en ordre.

**Exercici: la crida confusa**

```java
public class Confusion {
    static void pintar(String color, int veces) {
        for (int i = 0; i < veces; i++) {
            System.out.print(color);
        }
        System.out.println();
    }

    public static void main(String[] args) {
        pintar("verd", 3);
        pintar(2, "blau");
    }
}
```

**Què passa?**

- (A) Imprimeix `verdverdverd` i després `blaublaublau`
- (B) Compila i imprimeix `verdverdverd` i `2222...` (bucle rar)
- (C) No compila: en la segona crida, arguments en ordre incorrecte
- (D) No compila: `pintar` necessita `return`

<details>
<summary>🔄 Solució</summary>

La **C**. El primer paràmetre és `String` i el segon `int`; en `pintar(2, "blau")` arriba un `int` on ha d'anar el `String` → `incompatible types`. L'ordre dels arguments és part de la firma.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. En `static void log(String mensaje, int nivel)`, quins són els paràmetres i què li passes en `log("Fallo", 3)`?
2. Per què `sumar(1, 2, 3)` no compila si `sumar(int a, int b)` està ben escrit?
3. Quina paraula descriu a `3` i `4` en `sumar(3, 4)`: paràmetre o argument?
4. Es pot cridar a un mètode sense parèntesis, com `saludar;`?

<details>
<summary>🔄 Respostes</summary>

1. Paràmetres: `String mensaje` i `int nivel`. Arguments: `"Fallo"` i `3`.
2. Perquè la firma admet **2** arguments i la crida n'envia **3**: `wrong number of arguments`.
3. **Arguments** (els paràmetres viuen en la declaració).
4. No. Sense `()` no és una crida: `saludar;` és una expressió sense efecte (i ni això compila com t'esperes). Crida = `saludar();`.

</details>

---

## ✅ Resum en 3 frases

1. Els **paràmetres** (tipus + nom) es declaren entre parèntesis i dins del mètode s'usen com variables.
2. En la crida passes **arguments** amb un **ordre, nombre i tipus** que han d'encaixar amb la firma.
3. Varios paràmetres se separen per coma i cadascú porta el seu tipus: `String nombre, int edad`.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Paràmetre | Variable de l'entrada, en la declaració |
> | Argument | Valor que passes en la crida |
> | Firma | Nom + tipus dels paràmetres |
> | Ampliació | `int` cap en `double` sense avisar |
> | Còpia de l'argument | Cada crida treballa amb el seu propi valor |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-funciones) · **Anterior:** [02 · El teu primer mètode](/ApuntesProgramacion/va/05-funciones/02-primer-metodo) · **Següent:** [04 · return: l'eixida](/ApuntesProgramacion/va/05-funciones/04-return-valores)
