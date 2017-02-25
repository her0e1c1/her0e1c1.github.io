
(cpp #!DOC EOS
#include "myutils.h"
int main() {
              //0 1 2 3 4
  vector<int> v{4,2,5,1,3};
  vector<int> n(v.size());
  REP(i, n.size()) n[i] = i;
  sort(ALL(n), [&] (int a, int b){return v[a] < v[b];});
  PE(n);
}
EOS
:msg "pythonみたいに、tupleを使って表現できないので、配列を別に用意"
:file #t)
