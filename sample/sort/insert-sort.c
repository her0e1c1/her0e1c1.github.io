#include <myc.h>

static inline void swap(int *x, int *y) { int t=*x; *x=*y; *y=t; }

void sort(int *a, int len) {
 for (int i = 1; i < len; i++) {
  int j = i;
  while (j >= 1 && a[j-1] > a[j]) {
   swap(&a[j-1], &a[j]);
   j--;
  }
 }
}

int main() {
 int a[] = {~(to-s DATA1)};
 sort(a, SIZE(a));
 PVI(a);
}
