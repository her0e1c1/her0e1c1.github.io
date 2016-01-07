
(p "素集合をまとめる手法と要素がどの集合にあるか判定する手法に対して効率の良いデータ構造")
(p "ack関数の逆関数の計算量らしい?")

(cpp #!Q
#include <myutils.h>
class UnionFind {
 vector<int> data;
 vector<int> rank;
public:
 UnionFind(int size) {
  for (int i = 0; i < size; i++) {
   data.push_back(i);
   rank.push_back(0);
  }
 }
 int find(int d) {
  if (d != data[d])
   data[d] = find(data[d]);
  return data[d];
 }
 bool isSame(int a, int b) {
  return find(a) == find(b);
 }
 void unionSet(int a_, int b_) {
  int a = find(a_);
  int b = find(b_);
  if (a == b) return;
  if (rank[a] > rank[b])
   data[b] = a;
  else if (rank[a] < rank[b])
   data[a] = b;
  else { 
   data[b] = a;
   rank[a]++;
  }
 }
 friend ostream& operator<<(ostream& os, UnionFind& u) {
  for (int i = 0; i < u.data.size(); i++) {
   os << i << " => " << u.find(i) << " => " << endl;
  }
  return os;
 }
};
int main() {
 UnionFind u = UnionFind(5);
 P(u);
 u.unionSet(1,2);
 u.unionSet(3,4);
 u.unionSet(4,5);
 u.unionSet(1,5);
 P(u);
}
Q :str #t)
