// O(n)でk番目に小さい要素を取得(重複OK?)

// pivotをとり、それがたまたまk番目だったら、pivotの値を解とする
// そうでなければ、探査を続ける

#include <myc.h>

void swap(int *x, int *y) {int t=*x; *x=*y; *y=t;}

// MEMO:
int find(int *a, int left, int right, int pos) {
  int k = left;
  int pivot = a[left];
  for (int i = left + 1; i <= right; i++)
    if (a[i] < pivot) swap(&a[i], &a[++k]);
  swap(&a[left], &a[k]);
  if (k == pos) return a[k];
  else if (pos < k) return find(a, left, k-1, pos);
  else return find(a, k+1, right, pos);
}

int main() {
  int a[] = {4,1,2,0,0,1,5,0,3};
  for (int i = 0; i < SIZE(a); i++)
    printf("%d\n", find(a, 0, SIZE(a) - 1, i));
}
