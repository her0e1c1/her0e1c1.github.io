
(p "interspersedWithZero (0が途中に混ざった場合のbinary search)")
(p "CI 9.5")
(p"
- 終了条件low<=high
- 更新mid+1,mid-1

の場合の探索は
区間[low, high]となるため、
0を無視するようmidを移動する。
lowは探索ずみなので、low<midの条件入れておく
")
(cpp "
#include <myutils.h>
int find(vector<int> a, int target) {
  int lo=0, hi=a.size()-1;
  while (lo<=hi){
   int mi=(lo+hi)/2;
   while (a[mi] == 0 && lo < mi) mi--;  // ADD
   if (a[mi] == target) return mi;
   else if (a[mi] < target) lo=mi+1;
   else hi=mi-1;
  }
  return -1;
}

int main() {
  for (int i = 0; i <= 10; i++)
    //      0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
    P(find({0, 1, 0, 0, 2, 0, 3, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 5, 6, 0, 7, 0, 0, 8, 9, 0}, i));

}
" :str #t)
