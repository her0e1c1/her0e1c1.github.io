#include <stdio.h>
#include <string.h>

// MEMO:
void msort(int *a, int left, int right) {
  if (left >= right)
    return;
  int mid = left + (right - left) / 2;
  msort(a, left, mid);
  msort(a, mid + 1, right);
  int l = left, r = mid + 1, k = 0;
  int len = right - left + 1;
  int buff[len];  // O(n)のスペースが必要(VLA)
  while (l <= mid && r <= right) {  // どちらか一方の配列を全て使い切るまでloop
    if (a[l] < a[r])
      buff[k++] = a[l++];
    else
      buff[k++] = a[r++];
  }
  while (l <= mid)   buff[k++] = a[l++];  // 残りの一方の配列をappend
  while (r <= right) buff[k++] = a[r++];
  memcpy(a + left, buff,  sizeof(int) * len);  // sizeof忘れ、offsetのleft忘れ
  /* for (int i = 0; i < len; i++) a[left + i] = buff[i]; */
}

int main() {
  int A[] = {1, 4, 45, 3, 7, 6, 7, 7, 7, 10, 8, 8, 8, 8,1, 10, -1, 3, 20, 5, 9, 33, -1, 4,5,3,6};
  int arr_size = sizeof(A)/sizeof(A[0]);
  msort(A, 0, arr_size - 1);
  for (int i = 0; i < arr_size; i++)
    printf("%d, ", A[i]);
  return 0;
}
