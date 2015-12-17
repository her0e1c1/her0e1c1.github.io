// IMPLEMENT: selection sort
#include <myutils.h>

/*
  最小値を先頭と交換する. 見つかったら次へ
 */

// ORDER: O(n^2)

static inline void swap(int *i, int *j) {
  int t = *i;
  *i = *j;
  *j = t;
}

vector<int> sort(vector<int> a) {
  int size = a.size();
  for (int i = 0; i < size - 1; i++) {
    int m = i;
    for (int j = i + 1; j < size; j++)
      if (a[j] < a[m])
        m = j;
    swap(&a[i], &a[m]);
  }
  return a;
}

int main() {
  PE(sort({4,5,1,3,2,6,0,7}));
  PE(sort({5,-2,6,0,7}));
}
