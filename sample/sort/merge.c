#include <stdio.h>

// 9.1 二つのソートされた配列をマージする(一方のバッファは十分あると仮定)
// 末尾からappendすることがミソ(先頭からだと既存のデータを上書きして消してしまう)
void merge(int *a, int *b, int asize, int bsize) {
  int last = asize + bsize - 1;
  int ai = asize - 1, bi = bsize - 1;

  // merge sortに酷似してる(向きが逆!)
  while (ai >= 0 && bi >= 0) {
    if (a[ai] >= b[bi])
      a[last--] = a[ai--];
    else
      a[last--] = b[bi--];
  }
  while (bi >= 0)
    a[last--] = b[bi--];
}


int main() {
  int asize = 6;
  int bsize = 5;
  int A[100] = {1,3,5,7,9,11};
  int B[] = {1,2,3,4,5};
  merge(A, B, asize, bsize);
  for (int i = 0; i < asize + bsize; i++) printf("%d, ", A[i]);
  return 0;
}
