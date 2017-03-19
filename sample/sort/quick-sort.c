#include <stdio.h>

// MEMO:
void swap (int *x, int *y) {
  int t = *x;
  *x = *y;
  *y = t;
}

// MEMO:
void qsort (int *a, int left, int right) {
  if (left >= right)
    return;
  int pivot = a[left];
  int l = left;
  int r = right;
  while (1) {  // l <= r可能?
    while (a[l] < pivot) l++;
    while (a[r] > pivot) r--;
    if (l <= r) {
      swap(&a[l], &a[r]);
      l++;
      r--;
    } else
      break;
  }
  qsort(a, left, r);
  qsort(a, l, right);
}

int main () {
  // [-1 -1 1 1 3 3 3 4 4 5 5 6 6 7 7 7 7 8 8 8 8 9 10 10 20 33 45]
  int a[] = {1, 4, 45, 3, 7, 6, 7, 7, 7, 10, 8, 8, 8, 8, 1, 10, -1, 3, 20, 5, 9, 33, -1, 4, 5, 3, 6};
  int len = sizeof(a) / sizeof(a[0]) - 1;
  qsort(a, 0, len);
  for (int i = 0; i <= len; i++)
    printf("%d, ", a[i]);
}
