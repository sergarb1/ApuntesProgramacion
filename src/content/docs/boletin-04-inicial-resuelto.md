---
title: "Boletín 4 - Inicial Resuelto: Algorítmica I"
nav_order: 2
---
Soluciones del boletín inicial. Inténtalo antes de mirar.

---

## ⭐ Ejercicio 1: Búsqueda lineal
```java
public static int buscarLineal(int[] arr, int target) {
    for (int i = 0; i < arr.length; i++)
        if (arr[i] == target) return i;
    return -1;
}
```

## ⭐ Ejercicio 2: Búsqueda binaria
```java
public static int buscarBinaria(int[] arr, int target) {
    int izq = 0, der = arr.length - 1;
    while (izq <= der) {
        int medio = (izq + der) / 2;
        if (arr[medio] == target) return medio;
        if (arr[medio] < target) izq = medio + 1;
        else der = medio - 1;
    }
    return -1;
}
```

## ⭐⭐ Ejercicio 3: Burbuja
```java
public static void burbuja(int[] arr) {
    for (int i = 0; i < arr.length - 1; i++)
        for (int j = 0; j < arr.length - 1 - i; j++)
            if (arr[j] > arr[j + 1]) {
                int t = arr[j]; arr[j] = arr[j + 1]; arr[j + 1] = t;
            }
}
```

## ⭐⭐ Ejercicio 4: Inserción
```java
public static void insercion(int[] arr) {
    for (int i = 1; i < arr.length; i++) {
        int key = arr[i], j = i - 1;
        while (j >= 0 && arr[j] > key) { arr[j + 1] = arr[j]; j--; }
        arr[j + 1] = key;
    }
}
```

## ⭐⭐ Ejercicio 5: Contar pasos burbuja
```java
public static int contarPasos(int[] arr) {
    int pasos = 0;
    for (int i = 0; i < arr.length - 1; i++)
        for (int j = 0; j < arr.length - 1 - i; j++) {
            pasos++;
            if (arr[j] > arr[j + 1]) {
                int t = arr[j]; arr[j] = arr[j + 1]; arr[j + 1] = t;
            }
        }
    return pasos;
}
```

## ⭐⭐⭐ Ejercicio 6: Buscar en matriz ordenada
```java
public static boolean buscarMatriz(int[][] mat, int target) {
    int fila = 0, col = mat[0].length - 1;
    while (fila < mat.length && col >= 0) {
        if (mat[fila][col] == target) return true;
        if (mat[fila][col] > target) col--;
        else fila++;
    }
    return false;
}
```
