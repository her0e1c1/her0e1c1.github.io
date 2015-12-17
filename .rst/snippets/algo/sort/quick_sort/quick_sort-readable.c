// IMPLEMENT: quick_sort
#include <stdio.h>

static inline void swap(int *i, int *j) {
  int tmp;
  tmp = *i;
  *i = *j;
  *j = tmp;
}

// 左側のpivotを保存
int partition(int* a, int left, int right) {
  int pivot = a[left];  // もっとも左は保持しておく(最後に書き換え)
  int k = left;  // 0でなくleftがstart
  for (int i = left + 1 ; i <= right; i++) {
    if (a[i] < pivot){
      // 結果の格納はleft+1から! (同じ場所をswapもありうる)
      k++;
      swap(&a[i], &a[k]);
    }
  }
  // dst未満にpivot未満が格納されてる
  swap(&a[left], &a[k]);
  return k;
}

void qsort(int* a, int left, int right) {
  if (left < right) {
    int i = partition(a, left, right);
    qsort(a, left, i - 1);
    qsort(a, i + 1, right);
  }
}

int main() {
  int A[] = {1, 4, 45, 3, 7, 6, 7, 7, 7, 10, 8, 8, 8, 8,
             1, 10, -1, 3, 20, 5, 9, 33, -1, 4,5,3,6};
  int arr_size = sizeof(A)/sizeof(A[0]);
  qsort(A, 0, arr_size - 1);
  for (int i = 0; i < arr_size; i++)
    printf("%d, ", A[i]);

  return 0;
}
