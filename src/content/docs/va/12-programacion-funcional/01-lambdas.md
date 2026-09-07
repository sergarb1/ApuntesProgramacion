---
title: "01 · Lambdes: funcions que viatgen soles"
description: "La fletxa `->`, la sintaxi de les lambdes i la primera vegada que guardes una funció en una variable 🏹"
---

<p><small>La fletxa `->`, la sintaxi de les lambdes i la primera vegada que guardes una funció en una variable 🏹</small></p>

> 🗺️ **Estàs en:** 🗺️ **U12 · Programació Funcional** → 01 · Lambdes: funcions que viatgen soles

---

## 📬 La idea en una frase

> **Una lambda és una funció sense nom que pots tractar com un valor: guardar-la en una variable, passar-la a un mètode o tornar-la. És la resposta de Java a "vull passar-li a este mètode un comportament, no només dades".**

En la U10 vas vore les col·leccions i en la U11 els genèrics i els mapes. Tot genial. Però per a recórrer-les sempre hi havia una constant: els bucles i els mètodes un darrere l'altre. Hui canvia la jugada: les funcions deixen d'estar encadenades a una classe i comencen a **viatjar soles**.

---

## 😱 La forma antiga: classes anònimes

Imagina que vols passar-li a alguna cosa "l'acció d'imprimir una salutació". Abans de les lambdes, Java només et deixava fer-ho amb una **classe anònima**: una classe sense nom que defines sobre la marxa, només per a implementar un mètode i regalar-lo a un altre lloc.

```java
Runnable tarea = new Runnable() {
    @Override
    public void run() {
        System.out.println("Hola");
    }
};
```

Fixa't en l'espectacle: per a dir "imprimeix Hola" necessites `new Runnable()`, una classe anònima, `@Override`, `public void run()`... sis línies per a una idea d'una. Java sempre ha sigut molt d'anar-se'n per les branques.

---

## 🏹 Arriba la fletxa: la lambda

Una **expressió lambda** (del grec lambda, i no, no té res a veure amb els lámbada de la sèrie *Futurama*... o sí, perquè els dos són raros) és exactament eixa idea en una línia:

```java
Runnable tarea = () -> System.out.println("Hola");
```

Es llig: "sense paràmetres, fes `System.out.println("Hola")`". La fletxa `->` separa **els paràmetres** (a l'esquerra) del **cos** (a la dreta). És com dir: "amb estes dades, fes això".

La sintaxi té diverses cares:

```java
() -> System.out.println("Hola");        // sense paràmetres
(x) -> x * 2;                            // un paràmetre amb parèntesis
x -> x % 2 == 0;                         // un paràmetre SENSE parèntesis (permés)
(a, b) -> a + b;                         // dos paràmetres
nombre -> {                              // cos amb bloc: diverses sentències
    String saludo = "Hola, " + nombre;
    System.out.println(saludo);
}
```

Regles d'or:

- **Un sol paràmetre** → pots llevar els parèntesis: `x -> x * 2`.
- **El tipus s'inferix** → no escrius `(Integer x) -> ...` a menys que et veja de gust.
- **Cos d'una sola expressió** → no necessita `return` ni claus.
- **Cos amb bloc** → necessites `{ }` i `return` si tornes alguna cosa.

---

## 📦 Funcions que viatgen en variables

Ací ve la part que et farà volar el cap: la lambda no necessita pertànyer a cap classe concreta. Només necessita una **interfície funcional**: una interfície amb un únic mètode abstracte (en el punt 2 ho aprofundim). Amb això, la funció viatja com un valor.

```java
interface Transformador {
    int transformar(int x);
}

public class Demo {
    public static void main(String[] args) {
        Transformador doble = x -> x * 2;           // guarde una funció en una variable
        Transformador sumaUno = x -> x + 1;         // i una altra

        System.out.println(doble.transformar(5));   // 10
        System.out.println(sumaUno.transformar(5)); // 6
    }
}
```

`doble` no és un número ni un String: és **una funció**. L'has ficada en una variable com qui guarda un llapis a la butxaca. I pots passar-la a altres mètodes, guardar-la en llistes... ja no ets tu qui crida la funció: la funció viatja sola fins on calga.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** una lambda amb un sol paràmetre pot llevar-se els parèntesis, però amb dos o més (o cap) no hi ha drecera: `(a, b) -> ...` i `() -> ...`.

**Exercici: el comptador de viatges**

```java
interface Viajera {
    String viajar(String destino);
}

public class Demo {
    public static void main(String[] args) {
        Viajera saludo = destino -> "¡Bienvenida a " + destino + "!";
        System.out.println(saludo.viajar("Valencia"));
    }
}
```

**Què imprimeix?**

- (A) `¡Bienvenida a Valencia!`
- (B) `saludo@1234abcd`
- (C) Error de compilació: les lambdes no poden tornar Strings.
- (D) `destino`

<details>
<summary>🔄 Solució</summary>

La **A**. La lambda `destino -> "¡Bienvenida a " + destino + "!"` té un cos que és una sola expressió, així que el resultat d'eixa expressió és el que torna la interfície. No cal `return` ni claus: una expressió → torna. `saludo.viajar("Valencia")` executa la lambda amb `destino = "Valencia"` i obtens la frase completa. Les lambdes no són objectes rars que s'imprimeixen com `saludo@...`: quan les crides, executen el seu cos.

</details>

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què significa la fletxa `->` en una lambda?
2. Quan pots ometre els parèntesis dels paràmetres?
3. Quin tipus necessita la variable que guarda una lambda?
4. Quin és l'avantatge d'una lambda davant d'una classe anònima?

<details>
<summary>🔄 Respostes</summary>

1. Separa els paràmetres (esquerra) del cos (dreta): "amb estes dades, fes això".
2. Quan hi ha exactament un paràmetre: `x -> x * 2`. El tipus s'inferix sol.
3. Una interfície funcional: una interfície amb un únic mètode abstracte.
4. Menys soroll: la mateixa idea en una línia, sense `new Interfaz() { ... }` ni `@Override`.

</details>

---

## ✅ Resum en 3 frases

1. Una **lambda** és una funció sense nom que s'escriu amb la fletxa `->` i es pot tractar com un valor: `(x) -> x * 2`.
2. S'usa on abans calia una **classe anònima**: menys claus, menys soroll, exactament la mateixa idea.
3. Per a guardar-la en una variable necessites una **interfície funcional**: una interfície amb un únic mètode abstracte.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Lambda | Funció sense nom, escrita amb `->` |
> | Fletxa `->` | Separa paràmetres de cos en una lambda |
> | Classe anònima | Classe sense nom definida sobre la marxa (la forma antiga) |
> | Interfície funcional | Interfície amb un únic mètode abstracte |
> | Variable funcional | Variable el tipus de la qual és una interfície funcional i guarda una lambda |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/12-programacion-funcional) · **Anterior:** — · **Següent:** [02 · Interfícies funcionals: Predicate, Function, Consumer, Supplier](/ApuntesProgramacion/va/12-programacion-funcional/02-interfaces-funcionales)