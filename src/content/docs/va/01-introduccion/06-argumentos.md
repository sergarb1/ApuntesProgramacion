---
title: 06 — Arguments de línia de comandes
description: La butxaca secreta del main 🎒
---

<p><small>La butxaca secreta del main 🎒</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 06 · Arguments de línia de comandes

---

## 📬 La idea en una frase

> **El paràmetre `args` del `main` és una butxaca on Java fica tot el que escrigues després del nom del teu programa en executar-lo.**

Quan escrius `java MiPrograma hola mundo`, eixes paraules soltes (`hola`, `mundo`) no són casuals: Java les guarda en l'array `args` perquè el teu programa les puga usar.

---

## 🎒 Què és `args`?

Recorda la firma del `main`:

```java
public static void main(String[] args)
```

`String[] args` significa: "un array de cadenes de text anomenat `args`". Un array és una llista de coses (els veuràs a fons en la U04). Ací, la llista conté **cada paraula que vas escriure després del nom de la classe en executar**.

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

Si executes:

```
> java UsoDeArgumentos Java mola mucho
```

Veuràs:

```
Has escrito 3 palabras:
Palabra 1: Java
Palabra 2: mola
Palabra 3: mucho
```

---

## 🔢 Com s'indexen les paraules

En Java, les llistes comencen a comptar en **0**, com quasi tot en programació:

| Índex | Valor |
|---|---|
| `args[0]` | `"Java"` |
| `args[1]` | `"mola"` |
| `args[2]` | `"mucho"` |
| `args.length` | `3` (quants n'hi ha) |

- `args.length` et diu quants arguments hi ha (ací, 3).
- `args[0]` és el primer, `args[1]` el segon... i així.
- Si executes **sense arguments**, `args.length` val 0 i no hi ha res dins. Intentar llegir `args[0]` rebentaria amb una `ArrayIndexOutOfBoundsException` (ho veurem en la U03).

> ⚠️ **Advertència:** compte amb l'error del novat: `args[0]` és el **primer** argument, no "l'argument número 0". El primer compta com a índex 0. És com les plantes d'un edifici: la baixa és la 0.

---

## 🧠 Per a què servix passar arguments?

Passar arguments per línia de comandes és la forma més antiga i directa de "configurar" un programa sense tocar el codi:

- **Dades d'entrada**: `java Calculadora 5 3` → el teu programa rep 5 i 3.
- **Modes d'execució**: `java App --verbose` o `java App --silencioso`.
- **Archius**: `java Convertidor entrada.txt salida.txt`.
- **Programes reals**: els comandaments de la terminal (com `git status` o `ls -la`) són exactament això: programes que reben arguments.

En la pràctica, l'array `args` apareix cada vegada que vulgues que el teu programa parle amb "el món exterior" abans d'arrancar. Més avant usaràs el `Scanner` (U02) per a demanar dades durant l'execució; els `args` són la via d'entrada **abans** d'executar-se.

---

## 🏫 Exemple guiat: el programa que et saluda

Anem a fer que el teu programa sàpia el teu nom sense preguntar-ho:

```java
public class SaludoPersonal {
    public static void main(String[] args) {
        if (args.length > 0) {
            System.out.println("Hola, " + args[0] + ". ¡Bienvenido al curso!");
        } else {
            System.out.println("Hola, desconocido. ¿Olvidaste tu nombre?");
        }
    }
}
```

Si executes `java SaludoPersonal Sergi`, saluda a Sergi. Si executes `java SaludoPersonal`, et recorda que no vas passar arguments. El `if` ací és un aperitiu de les estructures de control de la U03.

> 💡 **Detall pràctic:** quan executes des de l'IDE (botó ▶), pots configurar els arguments en el menú *Run → Edit Configurations → Program arguments*. Escriu ahí `Sergi 20` i polsa Run: el teu programa els rebrà igual que si els teclejaren en la terminal.

---

## 🎯 Mini-chequeig

1. Si executes `java MiPrograma uno dos tres`, quant val `args.length` i què conté `args[2]`?
2. Què passa si accedeixes a `args[5]` quan només hi ha 3 arguments?
3. Com saludes a la primera paraula que reba el teu programa?

<details>
<summary>🔄 Respostes</summary>

1. `args.length` val **3** i `args[2]` conté `"tres"` (els índexs comencen en 0).
2. Reventarà amb `ArrayIndexOutOfBoundsException`: estàs demanant un element que no existix.
3. Amb `args[0]`, per exemple: `System.out.println("Hola, " + args[0]);`.

</details>

---

## ✅ Resum en 3 frases

1. `args` és l'array de cadenes que Java crea amb tot el que escrius després del nom de la teua classe.
2. Els índexs comencen en **0**: `args[0]` és el primer argument i `args.length` diu quants n'hi ha.
3. Els arguments són la forma de donar **dades d'entrada** a un programa abans que arranque.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Argument | Una paraula que passes al programa en executar-lo |
> | args | L'array on viuen els arguments |
> | Array | Una llista d'elements numerats des de 0 |
> | args.length | Quants arguments hi ha |
> | Línia de comandes | La terminal on escrius `java ...` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/01-introduccion) · **Anterior:** [05 · Comentaris i documentació](/ApuntesProgramacion/va/01-introduccion/05-comentarios) · **Següent:** [07 · El compilador i els seus errors](/ApuntesProgramacion/va/01-introduccion/07-errores-compilador)