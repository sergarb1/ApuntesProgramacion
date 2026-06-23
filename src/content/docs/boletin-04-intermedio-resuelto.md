---
title: "Boletín 4 - Intermedio Resuelto: Algorítmica I"
nav_order: 3
---
Ejercicios resueltos de dificultad progresiva.

---

## ⭐⭐ Ejercicio 1: Pares con suma objetivo
```java
public static List<int[]> paresConSuma(int[] arr, int suma) {
    List<int[]> res = new ArrayList<>();
    Set<Integer> vistos = new HashSet<>();
    for (int n : arr) {
        if (vistos.contains(suma - n))
            res.add(new int[]{suma - n, n});
        vistos.add(n);
    }
    return res;
}
```

## ⭐⭐ Ejercicio 2: Eliminar duplicados (in-place)
```java
public static int eliminarDuplicados(int[] arr) {
    if (arr.length == 0) return 0;
    int i = 0;
    for (int j = 1; j < arr.length; j++)
        if (arr[j] != arr[i]) arr[++i] = arr[j];
    return i + 1;
}
```

## ⭐⭐⭐ Ejercicio 3: Mayor suma de subarray (Kadane)
```java
public static int maxSubarraySum(int[] arr) {
    int maxG = arr[0], maxA = arr[0];
    for (int i = 1; i < arr.length; i++) {
        maxA = Math.max(arr[i], maxA + arr[i]);
        maxG = Math.max(maxG, maxA);
    }
    return maxG;
}
```

## ⭐⭐⭐ Ejercicio 4: Rotar array k veces
```java
public static void rotar(int[] arr, int k) {
    k %= arr.length;
    invertir(arr, 0, arr.length - 1);
    invertir(arr, 0, k - 1);
    invertir(arr, k, arr.length - 1);
}
private static void invertir(int[] a, int l, int r) {
    while (l < r) { int t = a[l]; a[l] = a[r]; a[r] = t; l++; r--; }
}
```

## ⭐⭐⭐ Ejercicio 5: Contar ocurrencias (binaria optimizada)
```java
public static int contar(int[] arr, int target) {
    int izq = buscar(arr, target, true);
    if (izq == -1) return 0;
    return buscar(arr, target, false) - izq + 1;
}
private static int buscar(int[] a, int t, boolean primero) {
    int l = 0, r = a.length - 1, res = -1;
    while (l <= r) {
        int m = (l + r) / 2;
        if (a[m] == t) { res = m; if (primero) r = m - 1; else l = m + 1; }
        else if (a[m] < t) l = m + 1;
        else r = m - 1;
    }
    return res;
}
```
