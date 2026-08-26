---
title: 05 — break, continue i etiquetes
description: Els botons d'emergència i els salts de línia del bucle 🚪
---

<p><small>Els botons d'emergència i els salts de línia del bucle 🚪</small></p>

> 🗺️ **Estàs en:** 🔀 **U03 · Estructures de Control i Excepcions** → 05 · break, continue i etiquetes

---

## 📬 La idea en una frase

> **`break` apaga el bucle sencer i `continue` es salta només la volta actual; amb etiquetes pots decidir a quin bucle anidat afecten.**

Ja saps repetir. Ara toca aprendre a **eixir amb estil**: interrompre, saltar i dirigir-te a un bucle concret quan n'hi ha diversos.

---

## 🚪 break: el botó de parada

`break` acaba el bucle **immediatament**, sense comprovar la condició:

```java
for (int i = 1; i <= 10; i++) {
    if (i == 5) {
        break;
    }
    System.out.println(i);
}
```

Eixida:

```
1
2
3
4
```

Tan bon punt `i` val 5, `break` talla el bucle: les voltes 6 a 10 no ocorren mai. És perfecte per a "troba alguna cosa i para de buscar".

> 💡 **Detall pràctic:** el `break` dins d'un `switch` (punt 2) tallava el switch. El `break` dins d'un bucle talla el bucle. Mateix botó, diferent aparell.

---

## ⏭️ continue: el botó de saltar

`continue` no acaba el bucle: **salta directament a la següent volta**, ignorant la resta del bloc:

```java
for (int i = 1; i <= 5; i++) {
    if (i == 3) {
        continue;
    }
    System.out.println(i);
}
```

Eixida:

```
1
2
4
5
```

El 3 es salta, però el bucle continua. Útil per a "no processis estos valors, però seguix amb els altres":

```java
// Suma només els nombres parells de l'1 al 10
int suma = 0;
for (int i = 1; i <= 10; i++) {
    if (i % 2 != 0) {
        continue;      // senars: no compten
    }
    suma += i;
}
System.out.println("Suma de parells: " + suma);   // 2+4+6+8+10 = 30
```

> ⚠️ **Advertència:** en un `while`, si poses el `continue` **abans** d'actualitzar la variable del bucle, l'actualització es salta... i el bucle no avança. Bug infinit assegurat. En un `for` l'actualització és a la capçalera i no passa res.

---

## 🏷️ Etiquetes: el GPS dels bucles anidats

Un `break` o `continue` solts afecten **només el bucle més intern**. I si vols eixir de dos bucles alhora? Ací naixen les **etiquetes**:

```java
exterior:
for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
        if (i * j >= 6) {
            break exterior;    // eix dels DOS bucles
        }
        System.out.println(i + " x " + j);
    }
}
```

Eixida:

```
1 x 1
1 x 2
1 x 3
2 x 1
2 x 2
```

Quan `i * j >= 6`, el `break exterior` salta fora de l'etiqueta, acabant els dos bucles alhora. Sense etiqueta, el `break` només hauria eixit del bucle de `j`.

```java
exterior:
for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
        if (j == 2) {
            continue exterior;   // salta a la següent i
        }
        System.out.println(i + "-" + j);
    }
}
```

Eixida:

```
1-1
2-1
3-1
```

> ⚠️ **Advertència:** les etiquetes són legals però poc usades. Davant el dubte, quasi sempre es pot redissenyar amb una variable booleana. Usa etiquetes amb moderació: el teu company de projecte t'ho agrairà.

---

## 🏫 Exemple guiat: el detector de nombre primer

Usem `break` per a comprovar si un nombre és primer de manera eficient:

```java
public class EsPrimer {
    public static void main(String[] args) {
        int numero = 29;
        boolean esPrimer = true;

        for (int divisor = 2; divisor < numero; divisor++) {
            if (numero % divisor == 0) {
                esPrimer = false;
                break;   // trobat divisor: para de buscar
            }
        }

        System.out.println(numero + " és primer? " + esPrimer);
    }
}
```

Eixida:

```
29 és primer? true
```

Amb `break`, tan bon punt apareix un divisor deixem de comprovar. Per al 29 no hi ha divisors, així que el bucle es recorre sencer i `esPrimer` continua sent `true`.

---

## ⭐ Sé el Código, my friend...

> 🕶️ **Don Tip:** per a distingir-los d'un cop d'ull: `break` = **apaga** el bucle; `continue` = **salta** esta volta. Un acaba la festa, l'altre només es perd una cançó.

**Exercici: el bucle esquizofrènic**

Sense executar, escriu l'eixida exacta:

```java
public class Esquizofrenia {
    public static void main(String[] args) {
        for (int i = 1; i <= 8; i++) {
            if (i % 3 == 0) {
                continue;
            }
            if (i == 7) {
                break;
            }
            System.out.println(i);
        }
    }
}
```

<details>
<summary>🔄 Solució</summary>

```
1
2
4
5
```

Pas a pas: de l'1 al 8, `continue` es salta els múltiples de 3 (3 i 6), i `break` talla en el 7 (que tampoc no arribaria a imprimir-se). Queden l'1, el 2, el 4 i el 5. El 8 mai no s'avalua perquè el `break` de `i == 7` va apagar el bucle abans.

</details>

---

## 🎯 Mini-chequeig

1. Quina és la diferència entre `break` i `continue` en una frase?
2. A què afecten per defecte en bucles anidats?
3. Per a què servix una etiqueta?
4. Per què és perillós el `continue` en un `while` si va abans de l'actualització?

<details>
<summary>🔄 Respostes</summary>

1. `break` **acaba** el bucle; `continue` **salta només la volta actual**.
2. Al bucle **més intern**.
3. Perquè un `break` o `continue` afecte un bucle exterior concret (`break etiqueta;`).
4. Perquè l'actualització es salta i el bucle **no avança**: condició `true` per sempre.

</details>

---

## ✅ Resum en 3 frases

1. `break` apaga el bucle sencer i `continue` es salta només la volta actual.
2. En bucles anidats afecten el més intern; les **etiquetes** et deixen apuntar a un bucle exterior.
3. Compte amb `continue` abans de l'actualització en `while`: és un bucle infinit en potència.

> 🐛 **Vocabulari ràpid**
>
> | Terme | Idea general |
> |---|---|
> | `break` | Acaba el bucle (o el switch) immediatament |
> | `continue` | Salta a la següent volta del bucle |
> | Etiqueta | Nom que poses a un bucle per a saltar-hi |
> | `break etiqueta` | Eix del bucle etiquetat, no del més intern |
> | Bucle infinit | Risc si `continue` es salta l'actualització d'un `while` |

📚 [Tornar a l'índex de la unitat](/ApuntesProgramacion/va/03-estructuras-control-excepciones) · **Anterior:** [04 · Bucle for](/ApuntesProgramacion/va/03-estructuras-control-excepciones/04-bucle-for) · **Següent:** [06 · Excepcions bàsiques](/ApuntesProgramacion/va/03-estructuras-control-excepciones/06-excepciones-basicas)
