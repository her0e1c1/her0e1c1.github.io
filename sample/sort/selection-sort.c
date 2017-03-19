// 左端から順番に小さいものを移動
// i番目における現時点での最小値を決めたい. (常にa[i]と比較)

#include <myc.h>

static inline void swap(int *x, int *y) { int t=*x; *x=*y; *y=t; }

void sort(int *a, int len) {
 for (int i = 0; i < len; i++) {
  for (int j = i + 1; j < len; j++)
   if (a[i] > a[j]) swap(&a[i], &a[j]);
 }
}

int main() {
 int a[] = {~(to-s DATA1)};
 sort(a, SIZE(a));
 PVI(a);
}
