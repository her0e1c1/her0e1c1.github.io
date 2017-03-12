// IMPLEMENT: bucket sort
#include <stdio.h>

// 範囲が決まっていれば、個数を調べて、offsetで並べる
// ORDER: size + range

// size/rangeのどちらでループするのか気をつける！
// 0からrangeまでの要素を並び替える(マイナスは不可!)

// MEMO:
void bsort(int *a, int *buff, int size, int range) {
  int counter[range], offset[range];
  for (int i = 0; i < range; i++) counter[i] = offset[i] = 0;
  for (int i = 0; i < size; i++) counter[a[i]]++;
  offset[0] = 0;
  for (int i = 0; i < range - 1; i++) offset[i + 1] = offset[i] + counter[i];
  for (int i = 0; i < size; i++) {
    int v = a[i];
    buff[offset[v]++] = v;  // 加えたら同じ値のoffsetは更新
  }
}


int main() {
  int A[] = {4, 1, 45, 6, 10, 8, 3};
  int arr_size = sizeof(A) / sizeof(A[0]);
  int buff[arr_size];
  bsort(A, buff, arr_size, 100);
  for (int i = 0; i < arr_size; i++)
    printf("%d, ", buff[i]);
  return 0;
}
