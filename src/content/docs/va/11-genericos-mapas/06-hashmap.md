---
title: "06 · HashMap: la guia telefònica"
description: "Associa claus amb valors, el put que sobreescriu i les tres formes de recórrer-lo ☎️"
---

<p><small>Associa claus amb valors, el put que sobreescriu i les tres formes de recórrer-lo ☎️</small></p>

> 🗺️ **Estàs en:** 🗺️ **U11 · Genèrics i Mapes** → 06 · HashMap: la guia telefònica

---

## 📬 La idea en una frase

> **Un `Map` associa claus úniques amb valors: busques per clau (nom) i obtens el seu valor (telèfon). `HashMap` ho fa en O(1) i, si repetixes clau, el `put` sobreescriu el valor anterior.**

Fins ací només guardaves elements solts en llistes i conjunts. Però la vida real està plena d'associacions: nom → telèfon, paraula → vegades que apareix, matrícula → plaça de parking. Per a això existixen els **mapes**, la tercera família d'estructures juntament amb `List` i `Set`. Benvingut a la guia telefònica.

---

## ☎️ HashMap: clau → valor

`HashMap` associa claus amb valors. Com una agenda: busques per nom (clau) i obtens el telèfon (valor).

```java
import java.util.HashMap;

HashMap<String, Integer> agenda = new HashMap<>();
agenda.put("Ana", 612345678);
agenda.put("Bob", 698765432);
agenda.put("Ana", 600000000);  // Sobrescribe el anterior

int telefono = agenda.get("Ana");          // 600000000
Integer inexistente = agenda.get("NoExisto"); // null
agenda.containsKey("Bob");        // true
agenda.containsValue(600000000);  // true
agenda.remove("Bob");             // borra la entrada
agenda.size();                    // 1 (solo queda Ana)
```

Fixa't en les tres idees clau:

1. **Les claus són úniques.** `put("Ana", 612345678)` i després `put("Ana", 600000000)`: el segon sobreescriu el primer. És com ratllar un número de la teua agenda per a posar-ne un altre: només queda l'últim.
2. **`get` torna `null` si la clau no existix.** No llança excepció, però compte: si la variable és `int` (primitiu), assignar `null` dona error. Per això existix `getOrDefault`.
3. **Cerca rapidíssima**: O(1) de mitjana. Tant se val si hi ha 10 o 10.000 entrades.

> 📝 **Nota:** les claus d'un HashMap han de ser **immutables**. Per això `String` i `Integer` són perfectes. Si uses un objecte mutable com a clau i després el modifiques, el seu `hashCode()` canvia i el HashMap no el trobarà mai. És com canviar el pany i esperar que la clau vella continue funcionant.

---

## 🛟 `getOrDefault`: el salvavides dels null

En lloc d'escriure el clàssic `if (map.get(clau) != null)`, fas:

```java
int edadCarlos = agenda.getOrDefault("Carlos", 0);  // 0 si no existe
```

És com un pla B: "si no trobes a Carlos, dona'm 0". El usaràs moltíssim per a comptar freqüències, com veuràs en el Sé el Código.

---

## 🚶 Recórrer un HashMap: tres camins

Un mapa té tres vistes per a recórrer: les claus, els valors o les entrades completes.

```java
HashMap<String, Integer> agenda = new HashMap<>();
agenda.put("Ana", 612345678);
agenda.put("Bob", 698765432);

// 1) Solo las claves
for (String nombre : agenda.keySet()) {
    System.out.println(nombre + " → " + agenda.get(nombre));
}

// 2) Solo los valores
for (Integer telefono : agenda.values()) {
    System.out.println("Tel: " + telefono);
}

// 3) Las entradas completas (clave + valor juntos) — la preferida
for (HashMap.Entry<String, Integer> entrada : agenda.entrySet()) {
    System.out.println(entrada.getKey() + " → " + entrada.getValue());
}
```

La tercera és la preferida dels professionals: `entrySet()` et dona parells clau-valor sense haver de fer un `get` extra dins del bucle. En els exàmens i en el treball, esta és la que veuràs una vegada i una altra.

> 💡 **Consell:** per a recórrer, declara el mapa com `Map<String, Integer>` i usa `Map.Entry<K, V>` en el bucle: així, si demà canvies a `TreeMap`, no toques res. Programa contra la interfície, com en la U10.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** HashMap no garantix ordre. Si necessites ordre, usa TreeMap o LinkedHashMap (punt 7). I ull amb `put`: repetir clau sobreescriu, no afig.

**Exercici 1: el HashMap traïdor**

```java
import java.util.HashMap;

public class BeTheMap {
    public static void main(String[] args) {
        HashMap<String, String> capitales = new HashMap<>();
        capitales.put("España", "Madrid");
        capitales.put("Francia", "París");
        capitales.put("Italia", "Roma");
        capitales.put("España", "Barcelona");

        System.out.println(capitales.get("España"));
    }
}
```

**Què imprimeix?**

- (A) Madrid
- (B) Barcelona
- (C) null
- (D) Error

<details>
<summary>🔄 Solució</summary>

La **B**. La clau "España" se sobreescriu amb el nou valor: `put("España", "Barcelona")` pisa l'anterior. "Madrid" ha sigut reemplaçat. Moraleja: en un HashMap, una clau només pot tindre UN valor, l'últim que es pose.

</details>

---

**Exercici 2: la freqüència de lletres**

> 🕶️ **Don Tip:** `getOrDefault()` evita el null check. Usa'l sempre que pugues.

```java
import java.util.HashMap;

public class BeTheFrequency {
    public static void main(String[] args) {
        String texto = "banana";
        HashMap<Character, Integer> frec = new HashMap<>();
        for (char c : texto.toCharArray()) {
            frec.put(c, frec.getOrDefault(c, 0) + 1);
        }
        System.out.println(frec.get('a') + " " + frec.get('n'));
    }
}
```

**Què imprimeix?**

- (A) 1 1
- (B) 3 1
- (C) 3 2
- (D) 2 2

<details>
<summary>🔄 Solució</summary>

La **C**. En "banana", "b-a-n-a-n-a": b=1, a=3, n=2. Així que `frec.get('a')` = 3 i `frec.get('n')` = 2 → **3 2**. El truc de `getOrDefault(c, 0) + 1` és l'heroi: si la lletra no estava, torna 0 i comença en 1; si estava, suma un al comptador. Este patró és EL patró dels mapes: el veuràs en la U12 amb fitxers i en mitja carrera de programació.

</details>

---

## 🤷 No hi ha preguntes tontes

> ❓ **Puc tindre un HashMap amb clau `null`?**

Sí, HashMap admet **una** clau `null` (la guarda en una posició especial). TreeMap no ho admet. I els valors `null` sí que es permeten en tots dos.

---

> ❓ **Què passa si la clau no existix en el mapa?**

`get()` torna `null`. No llança excepció. Usa'l amb cura o, millor, usa `getOrDefault(clau, valorPerDefecte)`, que et torna un valor segur.

---

> ❓ **I si necessite associar diverses coses a la mateixa clau?**

Usa un mapa de llistes: `HashMap<String, ArrayList<Integer>>`. La clau apunta a una llista i cada `put` ben fet afig a la llista existent. És l'estructura que usaràs per a "una clau, molts valors".

---

## 🎯 Mini-chequeig

Posat a prova en 30 segons (les respostes estan amagades):

1. Què torna `get(clau)` si la clau no existix?
2. Què fa `put("Ana", x)` si la clau "Ana" ja existix?
3. Quin mètode torna un valor per defecte si la clau no existix?
4. Quin és el bucle preferit per a recórrer un mapa i per què?

<details>
<summary>🔄 Respostes</summary>

1. `null` (no llança excepció).
2. Sobreescriu el valor anterior: les claus són úniques.
3. `getOrDefault(clau, valorPerDefecte)`.
4. `for (Map.Entry<K, V> e : mapa.entrySet())`: et dona clau i valor junts sense un `get` extra.

</details>

---

## ✅ Resum en 3 frases

1. **`Map`** associa claus úniques amb valors: `put` afig (o sobreescriu), `get` consulta i torna `null` si la clau no existix.
2. Es recorre amb **`keySet()`** (claus), **`values()`** (valors) o **`entrySet()`** (parells), sent esta última la preferida.
3. Les claus han de ser **immutables** i el `getOrDefault()` és el teu salvavides contra els `null`, especialment per a comptar freqüències.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `Map` | Interfície que associa claus amb valors |
> | Clau / valor | El parell associat; la clau és única |
> | `put` | Afegir o sobrescriure una entrada |
> | `getOrDefault` | Tornar un valor segur si la clau no existix |
> | `entrySet` | Les entrades (clau + valor) per a recórrer |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/11-genericos-mapas) · **Anterior:** [05 · Wildcards: `? extends T` i `? super T`](/ApuntesProgramacion/va/11-genericos-mapas/05-wildcards) · **Següent:** [07 · TreeMap, LinkedHashMap i altres mapes](/ApuntesProgramacion/va/11-genericos-mapas/07-treemap-otros-mapas)