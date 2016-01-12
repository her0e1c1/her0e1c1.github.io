
(p "べき乗
Xを集合とする。 Xの部分集合全体を2^xと表す

異なるn個の中で構成される全ての組み合わせ
")

(math "
f(${ a_0 $}) = {$phi}
f(${ a_n $}) = ${ {a_n} $cup x $mid x $in g $} $cup g
g = f(${ a_{n-1} $})
")

(math "
X = ${1,2,3$} のとき
2^X = ${$phi,{1},{2},{3},{1,2},{2,3},{3,1},{1,2,3}$}
$# 2^X = 2^3 = {}_3 C _0 + {}_3 C _1 + {}_3 C _2 + {}_3 C _3 = 8
(つまり、 $sum_r^n {}_n C _r = 2^n)
")

(p "一つ前の結果に、新しく要素を加えるか、加えないかで分けて考える
f(x:xs)は、[[INT]]なので、xを使う場合とそうでない場合に分ける")

(ghc #!Q
comb :: (Num a) => [a] -> [[a]]
comb = go where
  go []    = [[]]
  go (x:xs) = map (x:) (go xs) ++ go xs
main = do
  print $ comb [1..3]
  print $ comb [1..5]
Q :str #t)

(cpp #!Q
#include "myutils.h"
vector<vector<int>> comb(vector<int>& set, int index) {
  if (set.size() == index) {
    return vector<vector<int>>(1, vector<int>());
  }
  vector<vector<int>> r;
  auto q = comb(set, index + 1);
  for (auto x: q)
    r.push_back(x);
  int a = set[index];
  for (auto x: q) {
    x.push_back(a);
    r.push_back(x);
  }
  return r;
}
int main() {
  vector<int> x = {1,2,3};
  vector<vector<int>> xs = comb(x, 0);
  REP(i, xs.size()){
    REP(j, xs[i].size())
      cout << xs[i][j] << ", ";
    cout << endl;
  }
}
Q :str #t)
