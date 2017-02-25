// IMPLEMENT: radix sort
#include <stdio.h>
#include <string.h>

// 整数しか扱えない
// データのばらつきかたの影響を受けない

/*
  170, 45, 75, 90, 2, 24, 802, 66
  1の位でソート
  170, 90, 2, 802, 24, 45, 75, 66
  10の位でソート
  2, 802, 24, 45, 66, 170, 75, 90
  100の位でソート
  2, 24, 45, 66, 75, 90, 170, 802

  1 => 10 => 100と増やしてもソート順が保持されるので、安定ソート
*/

void rsort(int *x, int size, int limit) {
  for (int d = 1; d <= limit; d *= 10) {
    int y[size];
    int k = 0;
    // yに位の小さいものを順番に格納
    for (int n = 0; n <= 9; n++) {
      for (int i = 0; i < size; i++) {
        if ((x[i] / d) % 10 == n)
          y[k++] = x[i];
      }
    }
    for (int i = 0; i < size; i++)
      x[i] = y[i];
  }
}

int main() {
  // int A[] = {4, 1, 45, 6, 10, 8, 3};
  // int A[] = {10, 9, 8,7,6,5,4,3,2,1, 0};
  int A[] = {0,1,2,3,4,5,6,7,8,9,6,5,4,3,6,5,4,3,10, 9, 8,7,6,5,4,3,2,1, 0};
  int arr_size = sizeof(A) / sizeof(A[0]);
  rsort(A, arr_size, 100);
  for (int i = 0; i < arr_size; i++)
    printf("%d, ", A[i]);
  return 0;
}
