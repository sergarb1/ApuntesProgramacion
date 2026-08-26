---
title: "03 — Divide i venceràs"
description: "El patró més antic de la informàtica: dividix el problema, conquista cada part i combina ⚔️"
---

<p><small>El patró més antic de la informàtica: dividix el problema, conquista cada part i combina ⚔️</small></p>

> 🗺️ **Estàs en:** ⚡ **U05 · Algorítmica II: Tècniques** → 03 · Divide i venceràs

---

## 📬 La idea en una frase

> **Divide i venceràs (divide & conquer) consistix a partir un problema en subproblemes més xicotets, resoldre cada un per separat (normalment amb recursió) i combinar les solucions.**

L'estratègia és tan antiga com Juli Cèsar, però aplicada a algorismes continua sent igual d'efectiva. I sí, en la U04 ja la vas usar sense saber-ho: la **cerca binària** partix l'array per la meitat i descarta una part en cada pas. Eixe era el germen. Ara li posaràs nom i cognoms.

---

## 🧩 Els tres passos del patró

1. **Dividir** el problema en subproblemes més xicotets i manejables.
2. **Conquistar** cada subproblema recursivament (crides recursives).
3. **Combinar** les solucions dels subproblemes per a obtindre la solució del problema original.

```
Input gran
     │
     ├──Dividir──→ Subproblema A    → Conquistar (recursiu) → Combinar ──→ Output
     └──Dividir──→ Subproblema B    → Conquistar (recursiu) ─┘
```

La clau està que **cada subproblema és una còpia més xicoteta de l'original**: per això la recursió encaixa tan bé. I el cas base és el subproblema tan xicotet que ja es resol directament.

---

## 📊 Quan paga la pena?

No tot problema es beneficia de dividir. La màgia apareix quan el cost de **combinar** és barat i la divisió reduïx de debò el treball. Un clàssic d'esta unitat:

| Algorisme | Dividix | Conquista | Combina | Complexitat |
|---|---|---|---|---|
| Cerca binària | Partix per la meitat | Descartas una meitat | Res | O(log n) |
| Mergesort | Partix per la meitat | Ordenes cada meitat | **Fusiones** | O(n log n) |
| Quicksort | Particiona amb pivot | Ordenes cada zona | Res (ja està) | O(n log n) promig |

> [!NOTE]
> Fixa't en la fila de Quicksort: el treball "car" ocorre en la **divisió** (particionar al voltant del pivot), i la combinació és gratis. En Mergesort passa el contrari: la divisió és trivial (tallar pel mig) i el treball està en **combinar** (fusionar). Són dos sabors del mateix patró.

---

## 💡 Un exemple senzill: el màxim d'un array

Encara que el màxim es resol amb un bucle en una línia, vegem com ho enfocaria divide i venceràs perquè vegen el patró en la seua mínima expressió:

```java
public class MaximoDyV {

    static int maximo(int[] arr, int izq, int der) {
        if (izq == der) return arr[izq];          // cas base: un sol element

        int mid = (izq + der) / 2;
        int maxIzq = maximo(arr, izq, mid);       // conquistar meitat esquerra
        int maxDer = maximo(arr, mid + 1, der);   // conquistar meitat dreta

        return Math.max(maxIzq, maxDer);          // combinar
    }

    public static void main(String[] args) {
        int[] datos = {3, 9, 2, 7, 5, 8, 1, 6};
        System.out.println("Máximo: " + maximo(datos, 0, datos.length - 1)); // 9
    }
}
```

Espera... això és un bucle disfressat, no? Sí: la seua complexitat és O(n), igual que el bucle, perquè cada element es visita una vegada. La moralina és que **divide i venceràs no sempre guanya**: guanya quan la divisió evita treball repetit (com ordenar o buscar), no quan simplement repartix el mateix treball.

> [!TIP]
> Regla pràctica per a decidir: si el bucle simple és clar i ràpid, usa el bucle. Divide i venceràs és per a quan *partir el problema* et permet **descartar** o **reutilitzar** treball. La cerca binària descarta mitja array; el factorial no descarta res.

---

## 🌳 Aplicacions famoses

Una vegada entens el patró, comences a vore'l per tot arreu. És com quan aprens una paraula nova i de sobte la veus en cada racó:

- **Cerca binària**: O(log n). Ja la coneixes de la U04.
- **Mergesort i Quicksort**: els dos reis de l'ordenació, que veuràs en els punts 4 i 5.
- **Potència ràpida**: calcular `aⁿ` en O(log n) en lloc de O(n).
- **Multiplicació de matrius (Strassen)**: submatrius en lloc de la triple operació clàssica.
- **FFT (Transformada Ràpida de Fourier)**: la base del JPEG, el MP3 i el WiFi.

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Quins són els tres passos del patró divide i venceràs?
2. En què es diferencia el treball de Quicksort i Mergesort dins del patró?
3. Per què el "màxim amb divide i venceràs" no millora el bucle simple?
4. La cerca binària, quin pas del patró "evita" (no el necessita)?

<details>
<summary>🔄 Respostes</summary>

1. **Dividir** en subproblemes, **conquistar** cada un (recursió) i **combinar** les solucions.
2. Quicksort fa el treball en la **partició** (dividir) i la combinació és gratis; Mergesort dividix trivial i fa el treball en la **fusió** (combinar).
3. Perquè no **descartar** treball: visita tots els elements una vegada, igual que el bucle → O(n) en tots dos.
4. El pas de **combinar** (no ha de combinar res: descarta mitja array i continua).

</details>

---

## ✅ Resum en 3 frases

1. Divide i venceràs és el patró de **dividir, conquistar i combinar**, amb cada subproblema més xicotet resolt per recursió.
2. El cas base és el subproblema trivial; la complexitat depén de quant treball t'estalvie la **divisió** (descartar o reutilitzar).
3. No sempre guanya al bucle: només brilla quan partir el problema **evita treball repetit**, com en ordenació i cerca.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | Divide & Conquer | Dividir, conquistar i combinar |
> | Subproblema | Una còpia més xicoteta del problema original |
> | Cas base | El subproblema que es resol directament |
> | Combinar | Unir les solucions parcials en la solució final |
> | Particionar | Repartir elements al voltant d'un pivot (Quicksort) |
> | Fusionar | Barrejar dues llistes ordenades en una (Mergesort) |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/05-algoritmica-tecnicas) · **Anterior:** [02 · Recursivitat: exemples clàssics](/ApuntesProgramacion/va/05-algoritmica-tecnicas/02-recursividad-ejemplos-clasicos) · **Següent:** [04 · Quicksort](/ApuntesProgramacion/va/05-algoritmica-tecnicas/04-quicksort)
