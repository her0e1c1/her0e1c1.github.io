(p "異なるn個の中から、r個並べる場合の数(nPr)")

(pw "n!は大きな数になりやすいのでdoubleを使って極力桁溢れしないように工夫する。")

(ghc #!Q
-- [1,2,3] => [(1, [2,3]), (2, [1,3]), (3, [1,2])] のように分割
-- repeatedPermutation.hsとの違いは、使った要素を使用しないようにするところ
split = go [] where
  go acc []     = []
  go acc (x:xs) = [(x, acc++xs)] ++ go (acc++[x]) xs
permutation :: (Num a, Eq a) => [a] -> Int -> [[a]]
permutation = go [] where
  go acc _ 0  = [acc]
  go acc [] _ = []  -- fail
  go acc xs n = concatMap (\(y, ys) -> go (y:acc) ys (n-1)) $ split xs
main = print $ length $ permutation [1..5] 3  -- 60
Q :str #t)

(cpp #!Q
#include <myutils.h>
template<class T> inline
void extend(T &a, T &b) {
  a.insert(a.end(), b.begin(), b.end());
}
vector<vector<int>> comb (vector<int> vec, int num) {
  function <vector<vector<int>>(int, int, vector<int>)>iter = [&](int index, int n, vector<int> acc) {
    if (n == 0)
      return vector<vector<int>>(1, acc);
    if (index == vec.size())
      return vector<vector<int>>();
    vector<vector<int>> vs;
    vector<int> copy = acc;
    copy.push_back(vec[index]);
    vector<vector<int>> tmp = iter(index + 1, n - 1, copy);
    extend(vs, tmp);
    tmp = iter(index + 1, n, acc);
    extend(vs, tmp);
    return vs;
  };
  return iter(0, num, vector<int>());
}
int main() {
  vector<vector<int>> vs = comb({1,2,3,4}, 2);
  PE2(vs);
}
Q :str #t)

(ps "nPn = n!")
(cpp #!Q
#include <myutils.h>
inline void swap(vector<int> &v, int a, int b) { int t=v[a]; v[a]=v[b]; v[b]=t; }
void N (vector<int> vec) {
  function <void(vector<int>, int)>iter = [&](vector<int> v, int n) {
    if (n == vec.size()) {
      PE(v);
      return;
    }
    for(int i = n; i < v.size(); i++) {
      swap(v, i, n);
      iter(v, n + 1);
      swap(v, n, i);
    }
  };
  return iter(vec, 0);
}
int main() {
  N({1,2,3,4});
}
Q :str #t)
