// IMPLEMENT: interspersedWithZero (0が途中に混ざった場合のbinary search)
#include <myutils.h>

// ソートされた配列に(1からN)0がちりばめられている
// このときkを探索する(bsの亜種)
// 0 1 0 0 2 0 3 0 0 0 0 0 0 0 4 0 0 0 0 5 6 0 7 0 0 8 9 0

int find(vector<int> a, int target) {
  int left = 0;
  int right = a.size() - 1;
  // left <= rightと=をつけてよい (left == mid == rightの次で必ずbreakする(mid+/-1されるため))
  while (left <= right) {
    // left <= rightの条件は、left++時に必ず必要(メモリ参照違反を起こす可能性あり)
    while (left <= right && a[left] == 0)
      left++;
    if (left > right)
      return -1;
    int mid = left + (right - left) / 2;
    while (a[mid] == 0)
      mid--;
    
    if (a[mid] == target)
      return mid;
    else if (a[mid] < target)
      left = mid + 1;
    else  // a[mid] > target
      right = mid - 1;
  }
  return -1;
}

int main() {
  for (int i = 0; i <= 10; i++)
    //      0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
    P(find({0, 1, 0, 0, 2, 0, 3, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 5, 6, 0, 7, 0, 0, 8, 9, 0}, i));

}
