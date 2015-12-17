// TODO: きちんと2重whileを理解する
#include <stdio.h>
#include <assert.h>

/*
最良平均がN(nlogn)

これは、pivotより大きい値の配列を作成するのにnなので、
小さい値もあわせて2n.
また、それぞれの配列について、ソートをするので、
平均でnの半分と考えて、2*lognとなる。
*/

// pivotを使って境界線を求める
// pivot自体は、境界線の領域内にあればOK(pivotの位置を返す必要はない)
int partition(int* a, int left, int right) {
  int pivot = a[left];
  // iは少なくとも１回は++されないと、再帰呼び出しとなってしまう
  int i = left, j = right, tmp;

#ifdef DEBUG
  printf("P = %d\n", pivot);
  for (int i = left; i <= right; i++)
    printf("%d, ", a[i]);
  printf("\n");
#endif

  //i++; j--;の場合、奇数・偶数での終了条件がでてくる
  // とくに奇数個の場合、i==jになるが
  // ここで値によってi++するかj--するか変わってくる(i++とj--が同時に実行されない場合あり)
  // 終了条件と繰り返しが混ざっているので解りにくいコード
  // i以下の数は、pivot以下
  // j以上の数は、pivot以上となる
  while (1) {
    while (a[i] < pivot) i++;
    while (a[j] > pivot) j--;
    if (i <= j) {
      tmp = a[i]; a[i] = a[j]; a[j] = tmp;
      i++; j--;
    } else
      break;
  }

#ifdef DEBUG
  for (int i = left; i <= right; i++)
    printf("%d, ", a[i]);
  printf("\n");
  printf("(%d, %d, %d, %d)\n", left, i, j, right);
#endif

  return i;
}

void qsort(int* a, int left, int right) {
  /*
    // 念のため、以下のようにそれぞれ個別に不等式記述したほうが良さそう
    int i = partition(a, left, right);
    if (left < i - 1 && i - 1 < right) qsort(a, left, i - 1);
    if (left < i && i < right) qsort(a, i, right);
  */
  if (left < right) {
    int i = partition(a, left, right);
    qsort(a, left, i - 1);  // i < right(-1してるので大丈夫そう)
    qsort(a, i, right);  // left < i (満たさない場合あるかも(左側がpivotであればそれはskipされてる))
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
