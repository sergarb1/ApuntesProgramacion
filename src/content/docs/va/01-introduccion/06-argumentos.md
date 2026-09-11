---
title: "06 — Arguments de línia d'ordres"
description: "L'array args, com llegir-lo i usar-lo 📬"
---

<p><small>L'array args, com llegir-lo i usar-lo 📬</small></p>

> 🗺️ **Estàs en:** 🚀 **U01 · Introducció a Java** → 06 · Arguments de línia d'ordres

---

**El paràmetre "args" del "main" és una butxaca on Java fica tot el que escrigues després del nom del teu programa en executar-lo.**

Quan escrius `java MiPrograma hola mundo`, eixes paraules soltes (`hola`, `mundo`) no són casuals: Java les guarda en l'array `args` perquè el teu programa les puga usar.

---

## 🎒 Què és "args"?

Recorda la firma del main:

```java
public static void main(String[] args)
```

`String[] args` significa: "un array de cadenes de text anomenat args". Un array és una llista de coses (els veuràs a fons més avant en el curs). Ací, la llista conté **cada paraula que vas escriure després del nom de la classe en executar**.

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

```bash
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

En Java, les llistes comencen a comptar en 0, com quasi tot en programació:

| Índex | Valor |
| --- | --- |
| `args[0]` | "Java" |
| `args[1]` | "mola" |
| `args[2]` | "mucho" |
| `args.length` | 3 (quants n'hi ha en total) |

- `args.length` et diu quants arguments s'han passat (en este exemple, 3).
- `args[0]` és el primer element, `args[1]` el segon... i així successivament.
- Si executes el programa sense arguments, `args.length` valdrà 0 i l'array estarà buit.

⚠️ **Advertència:** compte amb l'error de l'aprenent: `args[0]` és el **primer** argument, no "l'argument número 0". El **primer** compta com a índex 0. És com les plantes d'un edifici: la baixa és la 0.

---

## 🧠 Per a què serveix passar arguments?

Passar arguments per línia d'ordres és la forma més antiga i directa de "configurar" un programa sense tocar el codi:

- **Dades d'entrada**: `java Calculadora 5 3` → el teu programa rep 5 i 3.
- **Modes d'execució**: `java App --verbose` o `java App --silencioso`.
- **Arxius**: `java Convertidor entrada.txt salida.txt`.
- **Programes reals**: els comandaments de la terminal (com `git status` o `ls -la`) són exactament això: programes que reben arguments.

En la pràctica, l'array `args` apareix cada vegada que vulgues que el teu programa parle amb "el món exterior" **abans** d'arrancar. Més avant usaràs el `Scanner` (U02) per a demanar dades durant l'execució; els args són la via d'entrada **abans** d'executar-se.

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

Si executes `java SaludoPersonal Sergi`, saluda a Sergi. Si executes `java SaludoPersonal`, et recorda que no vas passar arguments. El `if` ací és un aperitiu de les estructures de control que es voran en futures unitats.

💡 **Detall pràctic:** quan executes des de l'IDE (botó ▶), pots configurar els arguments en el menú *Run → Edit Configurations → Program arguments*. Escriu ahí `Sergi 20` i polsa Run: el teu programa els rebrà igual que si els teclejaren en la terminal.

---

## 🎯 Mini-comprovació

1. Si executes `java MiPrograma uno dos tres`, quant val `args.length` i què conté `args[2]`?
2. Què passa si accedeixes a `args[5]` quan només hi ha 3 arguments?
3. Com saludes a la primera paraula que reba el teu programa?

**🔄 Respostes**

1. `args.length` val **3** i `args[2]` conté "tres" (els índexs comencen en 0).
2. Reventarà amb `ArrayIndexOutOfBoundsException`: estàs demanant un element que no existix.
3. Amb `args[0]`, per exemple: `System.out.println("Hola, " + args[0]);`.

---

## ✅ Resum en 3 frases

1. `args` és l'array de cadenes que Java crea amb tot el que escrius després del nom de la teua classe.
2. Els índexs comencen en **0**: `args[0]` és el primer argument i `args.length` diu quants n'hi ha.
3. Els arguments són la forma de donar **dades d'entrada** a un programa abans que arranque.

---

## 🐛 Vocabulari ràpid

| Terme | Idea general |
| --- | --- |
| **Argument** | Una paraula o valor que li passes al programa en el moment d'executar-lo. |
| **args** | L'array (llista) de cadenes de text on Java guarda tots els arguments rebuts. |
| **Array** | Una estructura de dades que guarda una llista d'elements ordenats i numerats des de 0. |
| **args.length** | La propietat que indica la quantitat total d'arguments que té l'array. |
| **Línia d'ordres** | La finestra de terminal o consola on escrius les ordres com `java`, per a executar programes. |
