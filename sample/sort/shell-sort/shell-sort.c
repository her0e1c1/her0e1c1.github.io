#include <stdio.h>

void swap(int *a, int *b) { int t = *a; *a = *b; *b = t; }

void sort(int *a, int len) {
  for (int gap = len/2; gap >= 1; gap /= 2)
    for (int i = gap; i < len; i += gap)
      for (int j = i; j-gap >= 0 && a[j-gap] > a[j]; j -= gap)
        swap(&a[j], &a[j-gap]);
}

int main() {
  int a[] = {3, 1, 2, 5, 4};
  int len = sizeof(a) / sizeof(a[0]);
  sort(a, len);
  for (int i = 0; i < len; i++)
    printf("%d, ", a[i]);
  printf("\n");
}
