// IMPLEMENT: rotated binary search (increasing order)
#include <stdio.h>

int search(int *a, int left, int right, int target) {
  while (left <= right) {
    int mid = left + (right - left) / 2;
    if (a[mid] == target)
      return mid;

    // 本来 *left <= *mid <= *rightが成立する
    // ただincreasingなのに回転しているため右側が小さい場合がある
    // targetが右か左かそれだけ考える
    else if (a[left] > a[mid]) {
      // 最大値がleftとmidの間
      // *mid <= *rightなので、この区間になければ左側にあると判断(確実に!)
      // -- t -- left -- t -- mid -- t -- right -- t --
      if (a[mid] <= target && target <= a[right])  // この条件は考えやすい!
        left = mid + 1;
      else
        right = mid - 1;
    } else {
      // 最大値がmidとrightの間
      // *left <= *midなので、この区間になければ右側にあると判断(確実に!)
      // -- t -- left -- t -- mid -- t -- right -- t --
      if (a[left] <= target && target <= a[mid])
        right = mid - 1;
      else
        left = mid + 1;
    }
  }
  return -1;
}

int main() {
  //         0,1,2,3,4,5,6,7,8,9
  // int A[] = {6,7,8,9,0,1,2,3,4,5};
  // int A[] = {4,5,6,7,8,9,0,1,2,3};
  // int A[] = {2,3,4,5,6,7,8,9,0,1};
  // int A[] = {0,1,2,3,4,5,6,7,8,9};
  int A[] = {2,2,2,2,2,2,2,3,2,2};  // linerでなくても求まる!
  int arr_size = sizeof(A)/sizeof(A[0]);
  for (int i = 0; i <= 9; i++)
    printf("%d\n", search(A, 0, arr_size - 1, i));
  return 0;
}
