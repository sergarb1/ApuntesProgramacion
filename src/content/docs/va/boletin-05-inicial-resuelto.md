---
title: "Boletín 5 - Inicial Resuelto: Algorítmica II"
nav_order: 2
---
Soluciones del boletín inicial.

---

## ⭐ Ejercicio 1: Factorial recursivo
```java
public static int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}
```

## ⭐ Ejercicio 2: Fibonacci recursivo
```java
public static int fibo(int n) {
    if (n <= 1) return n;
    return fibo(n - 1) + fibo(n - 2);
}
```

## ⭐⭐ Ejercicio 3: Suma recursiva de array
```java
public static int sumaArray(int[] arr, int i) {
    if (i == arr.length) return 0;
    return arr[i] + sumaArray(arr, i + 1);
}
```

## ⭐⭐ Ejercicio 4: Invertir cadena
```java
public static String invertir(String s) {
    if (s.isEmpty()) return "";
    return invertir(s.substring(1)) + s.charAt(0);
}
```

## ⭐⭐⭐ Ejercicio 5: Fibonacci con memoización
```java
public static int fiboMemo(int n, int[] memo) {
    if (n <= 1) return n;
    if (memo[n] != 0) return memo[n];
    memo[n] = fiboMemo(n - 1, memo) + fiboMemo(n - 2, memo);
    return memo[n];
}
// Uso: fiboMemo(10, new int[11])
```

## ⭐⭐⭐ Ejercicio 6: Quicksort
```java
public static void quicksort(int[] a, int l, int r) {
    if (l >= r) return;
    int p = partition(a, l, r);
    quicksort(a, l, p - 1);
    quicksort(a, p + 1, r);
}
private static int partition(int[] a, int l, int r) {
    int p = a[r], i = l - 1;
    for (int j = l; j < r; j++)
        if (a[j] <= p) { i++; int t = a[i]; a[i] = a[j]; a[j] = t; }
    int t = a[i + 1]; a[i + 1] = a[r]; a[r] = t;
    return i + 1;
}
```
