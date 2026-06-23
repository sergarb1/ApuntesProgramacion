---
title: "Boletín 5 - Intermedio Resuelto: Algorítmica II"
nav_order: 3
---
Ejercicios resueltos de nivel intermedio.

---

## ⭐⭐ Ejercicio 1: Torres de Hanoi
```java
public static void hanoi(int n, char origen, char destino, char aux) {
    if (n == 1) System.out.println(origen + " -> " + destino);
    else {
        hanoi(n - 1, origen, aux, destino);
        System.out.println(origen + " -> " + destino);
        hanoi(n - 1, aux, destino, origen);
    }
}
```

## ⭐⭐ Ejercicio 2: Mergesort
```java
public static void mergesort(int[] a, int l, int r) {
    if (l >= r) return;
    int m = (l + r) / 2;
    mergesort(a, l, m);
    mergesort(a, m + 1, r);
    merge(a, l, m, r);
}
private static void merge(int[] a, int l, int m, int r) {
    int[] t = new int[r - l + 1];
    int i = l, j = m + 1, k = 0;
    while (i <= m && j <= r) t[k++] = (a[i] <= a[j]) ? a[i++] : a[j++];
    while (i <= m) t[k++] = a[i++];
    while (j <= r) t[k++] = a[j++];
    System.arraycopy(t, 0, a, l, t.length);
}
```

## ⭐⭐⭐ Ejercicio 3: Búsqueda binaria recursiva
```java
public static int binariaRec(int[] a, int t, int l, int r) {
    if (l > r) return -1;
    int m = (l + r) / 2;
    if (a[m] == t) return m;
    return (a[m] < t) ? binariaRec(a, t, m + 1, r) : binariaRec(a, t, l, m - 1);
}
```

## ⭐⭐⭐ Ejercicio 4: Potencia rápida recursiva (O(log n))
```java
public static long potencia(long base, long exp) {
    if (exp == 0) return 1;
    long mitad = potencia(base, exp / 2);
    return (exp % 2 == 0) ? mitad * mitad : mitad * mitad * base;
}
```

## ⭐⭐⭐ Ejercicio 5: Subconjuntos (backtracking)
```java
public static List<List<Integer>> subconjuntos(int[] nums) {
    List<List<Integer>> res = new ArrayList<>();
    backtrack(nums, 0, new ArrayList<>(), res);
    return res;
}
private static void backtrack(int[] n, int i, List<Integer> cur, List<List<Integer>> r) {
    r.add(new ArrayList<>(cur));
    for (int j = i; j < n.length; j++) {
        cur.add(n[j]);
        backtrack(n, j + 1, cur, r);
        cur.remove(cur.size() - 1);
    }
}
```
